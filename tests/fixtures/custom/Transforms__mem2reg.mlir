module {
  func.func @multi_slot_alloca() -> (i32, i32) {
    %0:2 = test.multi_slot_alloca : () -> (memref<i32>, memref<i32>)
    %1 = memref.load %0#0[] : memref<i32>
    %2 = memref.load %0#1[] : memref<i32>
    return %1, %2 : i32, i32
  }
}

// -----
module {
  func.func private @consumer(memref<i32>)
  func.func @multi_slot_alloca_only_second() -> (i32, i32) {
    %0:2 = test.multi_slot_alloca : () -> (memref<i32>, memref<i32>)
    call @consumer(%0#0) : (memref<i32>) -> ()
    %1 = memref.load %0#0[] : memref<i32>
    %2 = memref.load %0#1[] : memref<i32>
    return %1, %2 : i32, i32
  }
}

// -----
module {
  test.isolated_graph_region {
    %0 = test.multi_slot_alloca : () -> memref<i32>
    memref.store %1, %0[] : memref<i32>
    %1 = memref.load %0[] : memref<i32>
    "test.foo"() : () -> ()
  }
}

// -----
module {
  func.func @merge_point_arg_not_confused(%arg0: i1, %arg1: i32, %arg2: i32) -> i32 {
    %alloca = memref.alloca() : memref<i32>
    memref.store %arg1, %alloca[] : memref<i32>
    cf.cond_br %arg0, ^bb1, ^bb2
  ^bb1:  // pred: ^bb0
    memref.store %arg2, %alloca[] : memref<i32>
    cf.br ^bb3(%arg1 : i32)
  ^bb2:  // pred: ^bb0
    cf.br ^bb3(%arg2 : i32)
  ^bb3(%0: i32):  // 2 preds: ^bb1, ^bb2
    cf.cond_br %arg0, ^bb4, ^bb5
  ^bb4:  // pred: ^bb3
    memref.store %0, %alloca[] : memref<i32>
    cf.br ^bb6
  ^bb5:  // pred: ^bb3
    %c0_i32 = arith.constant 0 : i32
    memref.store %c0_i32, %alloca[] : memref<i32>
    cf.br ^bb6
  ^bb6:  // 2 preds: ^bb4, ^bb5
    %1 = memref.load %alloca[] : memref<i32>
    return %1 : i32
  }
}

// -----
module {
  func.func @unknown_region_op_load() {
    %c5_i32 = arith.constant 5 : i32
    %alloca = memref.alloca() : memref<i32>
    memref.store %c5_i32, %alloca[] : memref<i32>
    "test.one_region_op"() ({
      %0 = memref.load %alloca[] : memref<i32>
      "test.finish"() : () -> ()
    }) : () -> ()
    return
  }
}

// -----
module {
  func.func @cyclic_unused_merge_points(%arg0: i1) -> i32 {
    %c0_i32 = arith.constant 0 : i32
    %c1_i32 = arith.constant 1 : i32
    %alloca = memref.alloca() : memref<i32>
    memref.store %c0_i32, %alloca[] : memref<i32>
    cf.br ^bb1
  ^bb1:  // 2 preds: ^bb0, ^bb3
    cf.cond_br %arg0, ^bb3, ^bb2
  ^bb2:  // pred: ^bb1
    memref.store %c1_i32, %alloca[] : memref<i32>
    cf.br ^bb3
  ^bb3:  // 2 preds: ^bb1, ^bb2
    cf.cond_br %arg0, ^bb1, ^bb4
  ^bb4:  // pred: ^bb3
    return %c0_i32 : i32
  }
}

// -----
module {
  func.func @poison_insertion_point(%arg0: f64) {
    cf.br ^bb1
  ^bb1:  // 2 preds: ^bb0, ^bb2
    %alloca = memref.alloca() : memref<f64>
    %0 = "test.get"() : () -> i1
    cf.cond_br %0, ^bb2, ^bb3
  ^bb2:  // pred: ^bb1
    %1 = "test.get"() : () -> i1
    scf.if %1 {
      memref.store %arg0, %alloca[] : memref<f64>
    }
    %2 = memref.load %alloca[] : memref<f64>
    "test.use"(%2) : (f64) -> ()
    cf.br ^bb1
  ^bb3:  // pred: ^bb1
    return
  }
}

// -----
module {
  func.func @promotable_through_alias(%arg0: i32, %arg1: i1) -> i32 {
    %c42_i32 = arith.constant 42 : i32
    %0 = test.multi_slot_alloca : () -> memref<i32>
    %1 = test.transparent_alias %0 : (memref<i32>) -> memref<i32>
    memref.store %c42_i32, %1[] : memref<i32>
    cf.cond_br %arg1, ^bb1, ^bb2
  ^bb1:  // pred: ^bb0
    memref.store %arg0, %1[] : memref<i32>
    cf.br ^bb2
  ^bb2:  // 2 preds: ^bb0, ^bb1
    %2 = memref.load %1[] : memref<i32>
    return %2 : i32
  }
}

// -----
module {
  func.func @promotable_through_cast_alias(%arg0: f32) -> f32 {
    %0 = test.multi_slot_alloca : () -> memref<i32>
    %1 = test.transparent_cast_alias %0 : (memref<i32>) -> memref<f32>
    memref.store %arg0, %1[] : memref<f32>
    %2 = memref.load %1[] : memref<f32>
    return %2 : f32
  }
}

// -----
module {
  func.func @promotable_through_cast_alias_blocks(%arg0: f32, %arg1: i1) -> f32 {
    %cst = arith.constant 1.000000e+00 : f32
    %0 = test.multi_slot_alloca : () -> memref<i32>
    %1 = test.transparent_cast_alias %0 : (memref<i32>) -> memref<f32>
    memref.store %cst, %1[] : memref<f32>
    cf.cond_br %arg1, ^bb1, ^bb2
  ^bb1:  // pred: ^bb0
    memref.store %arg0, %1[] : memref<f32>
    cf.br ^bb2
  ^bb2:  // 2 preds: ^bb0, ^bb1
    %2 = memref.load %1[] : memref<f32>
    return %2 : f32
  }
}

// -----
module {
  func.func @promotable_through_alias_across_regions(%arg0: i1, %arg1: i32) {
    %0 = test.multi_slot_alloca : () -> memref<i32>
    %1 = test.transparent_alias %0 : (memref<i32>) -> memref<i32>
    scf.if %arg0 {
      memref.store %arg1, %1[] : memref<i32>
    }
    return
  }
}

// -----
module {
  func.func @alias_inside_region_parent_read_outside(%arg0: i1, %arg1: f32, %arg2: i32) -> i32 {
    %0 = test.multi_slot_alloca : () -> memref<i32>
    memref.store %arg2, %0[] : memref<i32>
    scf.if %arg0 {
      %2 = test.transparent_cast_alias %0 : (memref<i32>) -> memref<f32>
      memref.store %arg1, %2[] : memref<f32>
    }
    %1 = memref.load %0[] : memref<i32>
    return %1 : i32
  }
}

// -----
module {
  func.func @promotable_through_chained_aliases(%arg0: f32) -> f32 {
    %0 = test.multi_slot_alloca : () -> memref<i32>
    %1 = test.transparent_alias %0 : (memref<i32>) -> memref<i32>
    %2 = test.transparent_cast_alias %1 : (memref<i32>) -> memref<f32>
    memref.store %arg0, %2[] : memref<f32>
    %3 = memref.load %2[] : memref<f32>
    return %3 : f32
  }
}

// -----
module {
  func.func @promotable_through_dual_alias(%arg0: si32) -> ui32 {
    %alloca = memref.alloca() : memref<i32>
    %result_signed, %result_unsigned = test.transparent_dual_alias %alloca : (memref<i32>) -> (memref<si32>, memref<ui32>)
    memref.store %arg0, %result_signed[] : memref<si32>
    %0 = memref.load %result_unsigned[] : memref<ui32>
    return %0 : ui32
  }
}

// -----
module {
  func.func @promotable_through_partial_alias(%arg0: f32) -> f32 {
    %alloca = memref.alloca() : memref<complex<f32>>
    %0 = test.partial_alias %alloca : (memref<complex<f32>>) -> memref<f32>
    memref.store %arg0, %0[] : memref<f32>
    %1 = memref.load %0[] : memref<f32>
    return %1 : f32
  }
}

// -----
module {
  func.func @tracker_basic(%arg0: i32, %arg1: i32) -> i32 {
    %0 = test.multi_slot_alloca : () -> memref<i32>
    test.slot_tracker %0, "x" : memref<i32>
    memref.store %arg0, %0[] : memref<i32>
    memref.store %arg1, %0[] : memref<i32>
    %1 = memref.load %0[] : memref<i32>
    return %1 : i32
  }
}

// -----
module {
  func.func @tracker_load_stored_back(%arg0: i32) {
    %0 = test.multi_slot_alloca : () -> memref<i32>
    test.slot_tracker %0, "y" : memref<i32>
    memref.store %arg0, %0[] : memref<i32>
    %1 = memref.load %0[] : memref<i32>
    memref.store %1, %0[] : memref<i32>
    return
  }
}

// -----
module {
  func.func @tracker_blocks(%arg0: i32, %arg1: i32, %arg2: i1) -> i32 {
    %0 = test.multi_slot_alloca : () -> memref<i32>
    test.slot_tracker %0, "z" : memref<i32>
    cf.cond_br %arg2, ^bb1, ^bb2
  ^bb1:  // pred: ^bb0
    memref.store %arg0, %0[] : memref<i32>
    cf.br ^bb3
  ^bb2:  // pred: ^bb0
    memref.store %arg1, %0[] : memref<i32>
    cf.br ^bb3
  ^bb3:  // 2 preds: ^bb1, ^bb2
    %1 = memref.load %0[] : memref<i32>
    return %1 : i32
  }
}

// -----
module {
  func.func @tracker_at_end(%arg0: i32, %arg1: i32) -> i32 {
    %0 = test.multi_slot_alloca : () -> memref<i32>
    memref.store %arg0, %0[] : memref<i32>
    memref.store %arg1, %0[] : memref<i32>
    %1 = memref.load %0[] : memref<i32>
    test.slot_tracker %0, "k" : memref<i32>
    return %1 : i32
  }
}

// -----
module {
  func.func @tracker_nested_region(%arg0: i32, %arg1: i32, %arg2: i1) {
    %0 = test.multi_slot_alloca : () -> memref<i32>
    test.slot_tracker %0, "w" : memref<i32>
    memref.store %arg0, %0[] : memref<i32>
    scf.if %arg2 {
      memref.store %arg1, %0[] : memref<i32>
    }
    return
  }
}

// -----
module {
  func.func @tracker_inside_nested_region(%arg0: i32, %arg1: i32, %arg2: i32, %arg3: i1) {
    %0 = test.multi_slot_alloca : () -> memref<i32>
    memref.store %arg0, %0[] : memref<i32>
    scf.if %arg3 {
      test.slot_tracker %0, "n" : memref<i32>
      memref.store %arg1, %0[] : memref<i32>
    }
    memref.store %arg2, %0[] : memref<i32>
    return
  }
}

