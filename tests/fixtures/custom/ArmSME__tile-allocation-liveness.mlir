module {
  func.func @constant_with_multiple_users(%arg0: vector<[4]xf32>, %arg1: vector<[4]xf32>, %arg2: index) {
    %0 = arm_sme.zero : vector<[4]x[4]xf32>
    %1 = arm_sme.insert_tile_slice %arg0, %0[%arg2] : vector<[4]xf32> into vector<[4]x[4]xf32>
    %2 = arm_sme.insert_tile_slice %arg1, %0[%arg2] : vector<[4]xf32> into vector<[4]x[4]xf32>
    "test.some_use"(%1) : (vector<[4]x[4]xf32>) -> ()
    "test.some_use"(%2) : (vector<[4]x[4]xf32>) -> ()
    return
  }
}

// -----
module {
  func.func @value_with_multiple_users(%arg0: vector<[4]x[4]xf32>, %arg1: vector<[4]xf32>, %arg2: vector<[4]xf32>, %arg3: index) {
    %0 = arm_sme.insert_tile_slice %arg1, %arg0[%arg3] : vector<[4]xf32> into vector<[4]x[4]xf32>
    %1 = arm_sme.insert_tile_slice %arg2, %arg0[%arg3] : vector<[4]xf32> into vector<[4]x[4]xf32>
    "test.some_use"(%0) : (vector<[4]x[4]xf32>) -> ()
    "test.some_use"(%1) : (vector<[4]x[4]xf32>) -> ()
    return
  }
}

// -----
module {
  func.func @reuse_tiles_after_initial_use() {
    %0 = arm_sme.get_tile : vector<[4]x[4]xf32>
    %1 = arm_sme.get_tile : vector<[4]x[4]xf32>
    %2 = arm_sme.get_tile : vector<[4]x[4]xf32>
    %3 = arm_sme.get_tile : vector<[4]x[4]xf32>
    "test.dummy"() : () -> ()
    "test.dummy"() : () -> ()
    "test.dummy"() : () -> ()
    "test.some_use"(%0) : (vector<[4]x[4]xf32>) -> ()
    "test.some_use"(%1) : (vector<[4]x[4]xf32>) -> ()
    "test.some_use"(%2) : (vector<[4]x[4]xf32>) -> ()
    "test.some_use"(%3) : (vector<[4]x[4]xf32>) -> ()
    %4 = arm_sme.zero : vector<[4]x[4]xf32>
    %5 = arm_sme.zero : vector<[4]x[4]xf32>
    %6 = arm_sme.zero : vector<[4]x[4]xf32>
    %7 = arm_sme.zero : vector<[4]x[4]xf32>
    "test.dummy"() : () -> ()
    "test.dummy"() : () -> ()
    "test.dummy"() : () -> ()
    "test.some_use"(%4) : (vector<[4]x[4]xf32>) -> ()
    "test.some_use"(%5) : (vector<[4]x[4]xf32>) -> ()
    "test.some_use"(%6) : (vector<[4]x[4]xf32>) -> ()
    "test.some_use"(%7) : (vector<[4]x[4]xf32>) -> ()
    return
  }
}

// -----
module {
  func.func @tile_live_ins() {
    %0 = arm_sme.get_tile : vector<[4]x[4]xf32>
    %1 = arm_sme.zero : vector<[4]x[4]xf32>
    cf.br ^bb1
  ^bb1:  // pred: ^bb0
    "test.dummy"() : () -> ()
    "test.dummy"() : () -> ()
    cf.br ^bb2
  ^bb2:  // pred: ^bb1
    "test.dummy"() : () -> ()
    "test.dummy"() : () -> ()
    cf.br ^bb3
  ^bb3:  // pred: ^bb2
    "test.some_use"(%0) : (vector<[4]x[4]xf32>) -> ()
    "test.some_use"(%1) : (vector<[4]x[4]xf32>) -> ()
    return
  }
}

// -----
module {
  func.func @non_sequential_live_ins(%arg0: i1) {
    %0 = arm_sme.get_tile : vector<[4]x[4]xf32>
    "test.dummy"() : () -> ()
    cf.br ^bb2
  ^bb1:  // pred: ^bb2
    "test.some_use"(%0) : (vector<[4]x[4]xf32>) -> ()
    "test.dummy"() : () -> ()
    cf.br ^bb3
  ^bb2:  // pred: ^bb0
    %1 = arm_sme.zero : vector<[4]x[4]xf32>
    "test.dummy"() : () -> ()
    cf.cond_br %arg0, ^bb1, ^bb3
  ^bb3:  // 2 preds: ^bb1, ^bb2
    "test.dummy"() : () -> ()
    "test.some_use"(%1) : (vector<[4]x[4]xf32>) -> ()
    return
  }
}

// -----
module {
  func.func @non_overlapping_branches(%arg0: i1) {
    %0 = scf.if %arg0 -> (vector<[4]x[4]xf32>) {
      %1 = arm_sme.zero : vector<[4]x[4]xf32>
      scf.yield %1 : vector<[4]x[4]xf32>
    } else {
      %1 = arm_sme.get_tile : vector<[4]x[4]xf32>
      scf.yield %1 : vector<[4]x[4]xf32>
    }
    "test.some_use"(%0) : (vector<[4]x[4]xf32>) -> ()
    return
  }
}

// -----
module {
  func.func @overlapping_branches(%arg0: i1, %arg1: vector<[4]x[4]xf32>, %arg2: vector<[4]x[4]xf32>) {
    %0 = scf.if %arg0 -> (vector<[4]x[4]xf32>) {
      scf.yield %arg1 : vector<[4]x[4]xf32>
    } else {
      scf.yield %arg2 : vector<[4]x[4]xf32>
    }
    "test.some_use"(%0) : (vector<[4]x[4]xf32>) -> ()
    return
  }
}

// -----
module {
  func.func @run_out_of_tiles_but_avoid_spill(%arg0: vector<[4]xf32>, %arg1: vector<[4]xf32>, %arg2: vector<[4]xf32>, %arg3: vector<[4]xf32>) {
    %0 = arm_sme.zero : vector<[4]x[4]xf32>
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c10 = arith.constant 10 : index
    scf.for %arg4 = %c0 to %c10 step %c1 {
      %1:4 = scf.for %arg5 = %c0 to %c10 step %c1 iter_args(%arg6 = %0, %arg7 = %0, %arg8 = %0, %arg9 = %0) -> (vector<[4]x[4]xf32>, vector<[4]x[4]xf32>, vector<[4]x[4]xf32>, vector<[4]x[4]xf32>) {
        %2 = arm_sme.insert_tile_slice %arg0, %arg6[%arg4] : vector<[4]xf32> into vector<[4]x[4]xf32>
        %3 = arm_sme.insert_tile_slice %arg1, %arg7[%arg4] : vector<[4]xf32> into vector<[4]x[4]xf32>
        %4 = arm_sme.insert_tile_slice %arg2, %arg8[%arg4] : vector<[4]xf32> into vector<[4]x[4]xf32>
        %5 = arm_sme.insert_tile_slice %arg3, %arg9[%arg4] : vector<[4]xf32> into vector<[4]x[4]xf32>
        scf.yield %2, %3, %4, %5 : vector<[4]x[4]xf32>, vector<[4]x[4]xf32>, vector<[4]x[4]xf32>, vector<[4]x[4]xf32>
      }
      "test.some_use"(%1#0) : (vector<[4]x[4]xf32>) -> ()
      "test.some_use"(%1#1) : (vector<[4]x[4]xf32>) -> ()
      "test.some_use"(%1#2) : (vector<[4]x[4]xf32>) -> ()
      "test.some_use"(%1#3) : (vector<[4]x[4]xf32>) -> ()
    }
    return
  }
}

// -----
module {
  func.func @avoidable_spill(%arg0: vector<[4]xf32>, %arg1: vector<[4]xf32>, %arg2: vector<[4]xf32>, %arg3: vector<[4]xf32>) {
    %0 = arm_sme.zero : vector<[4]x[4]xf32>
    %1 = arm_sme.get_tile : vector<[4]x[4]xf32>
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c10 = arith.constant 10 : index
    scf.for %arg4 = %c0 to %c10 step %c1 {
      "test.some_use"(%0) : (vector<[4]x[4]xf32>) -> ()
      %2 = arm_sme.insert_tile_slice %arg0, %1[%c0] : vector<[4]xf32> into vector<[4]x[4]xf32>
      %3 = arm_sme.insert_tile_slice %arg1, %1[%c0] : vector<[4]xf32> into vector<[4]x[4]xf32>
      %4 = arm_sme.insert_tile_slice %arg2, %1[%c0] : vector<[4]xf32> into vector<[4]x[4]xf32>
      %5 = arm_sme.insert_tile_slice %arg3, %1[%c0] : vector<[4]xf32> into vector<[4]x[4]xf32>
      "test.some_use"(%2) : (vector<[4]x[4]xf32>) -> ()
      "test.some_use"(%3) : (vector<[4]x[4]xf32>) -> ()
      "test.some_use"(%4) : (vector<[4]x[4]xf32>) -> ()
      "test.some_use"(%5) : (vector<[4]x[4]xf32>) -> ()
    }
    return
  }
}

// -----
module {
  func.func @cond_branch_with_backedge(%arg0: vector<[4]xf32>) {
    %0 = arm_sme.get_tile : vector<[4]x[4]xf32>
    %1 = arm_sme.get_tile : vector<[4]x[4]xf32>
    %2 = arm_sme.get_tile : vector<[4]x[4]xf32>
    %3 = arm_sme.get_tile : vector<[4]x[4]xf32>
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c10 = arith.constant 10 : index
    cf.br ^bb1(%c0, %0 : index, vector<[4]x[4]xf32>)
  ^bb1(%4: index, %5: vector<[4]x[4]xf32>):  // 2 preds: ^bb0, ^bb2
    %6 = arith.cmpi slt, %4, %c10 : index
    cf.cond_br %6, ^bb2, ^bb3(%5, %1, %2, %3 : vector<[4]x[4]xf32>, vector<[4]x[4]xf32>, vector<[4]x[4]xf32>, vector<[4]x[4]xf32>)
  ^bb2:  // pred: ^bb1
    %7 = arm_sme.insert_tile_slice %arg0, %5[%4] : vector<[4]xf32> into vector<[4]x[4]xf32>
    %8 = arith.addi %4, %c1 : index
    cf.br ^bb1(%8, %7 : index, vector<[4]x[4]xf32>)
  ^bb3(%9: vector<[4]x[4]xf32>, %10: vector<[4]x[4]xf32>, %11: vector<[4]x[4]xf32>, %12: vector<[4]x[4]xf32>):  // pred: ^bb1
    return
  }
}

// -----
module {
  func.func @fill_holes_in_tile_liveness(%arg0: i1) {
    %0 = arm_sme.get_tile : vector<[4]x[4]xf32>
    cf.cond_br %arg0, ^bb2, ^bb1
  ^bb1:  // pred: ^bb0
    %1 = arm_sme.get_tile : vector<[4]x[4]xf32>
    "test.dummy"() : () -> ()
    "test.some_use"(%1) : (vector<[4]x[4]xf32>) -> ()
    cf.br ^bb3
  ^bb2:  // pred: ^bb0
    "test.dummy"() : () -> ()
    "test.dummy"() : () -> ()
    "test.dummy"() : () -> ()
    "test.some_use"(%0) : (vector<[4]x[4]xf32>) -> ()
    cf.br ^bb3
  ^bb3:  // 2 preds: ^bb1, ^bb2
    return
  }
}

// -----
module {
  func.func @holes_in_tile_liveness_inactive_overlaps(%arg0: i1) {
    %0 = arm_sme.get_tile : vector<[4]x[4]xf32>
    cf.cond_br %arg0, ^bb2, ^bb1
  ^bb1:  // pred: ^bb0
    %1 = arm_sme.get_tile : vector<[4]x[4]xf32>
    "test.dummy"() : () -> ()
    "test.some_use"(%1) : (vector<[4]x[4]xf32>) -> ()
    cf.br ^bb3(%1 : vector<[4]x[4]xf32>)
  ^bb2:  // pred: ^bb0
    "test.dummy"() : () -> ()
    "test.dummy"() : () -> ()
    "test.dummy"() : () -> ()
    %2 = arm_sme.get_tile : vector<[4]x[4]xf32>
    "test.some_use"(%0) : (vector<[4]x[4]xf32>) -> ()
    cf.br ^bb3(%2 : vector<[4]x[4]xf32>)
  ^bb3(%3: vector<[4]x[4]xf32>):  // 2 preds: ^bb1, ^bb2
    "test.some_use"(%3) : (vector<[4]x[4]xf32>) -> ()
    return
  }
}

// -----
module {
  func.func @spill_inactive_live_range(%arg0: i1) {
    %0 = arm_sme.get_tile : vector<[16]x[16]xi8>
    cf.cond_br %arg0, ^bb2, ^bb1
  ^bb1:  // pred: ^bb0
    %1 = arm_sme.get_tile : vector<[16]x[16]xi8>
    "test.dummy"() : () -> ()
    "test.some_use"(%1) : (vector<[16]x[16]xi8>) -> ()
    cf.br ^bb3(%1 : vector<[16]x[16]xi8>)
  ^bb2:  // pred: ^bb0
    "test.dummy"() : () -> ()
    "test.dummy"() : () -> ()
    "test.dummy"() : () -> ()
    %2 = arm_sme.get_tile : vector<[16]x[16]xi8>
    "test.some_use"(%0) : (vector<[16]x[16]xi8>) -> ()
    cf.br ^bb3(%2 : vector<[16]x[16]xi8>)
  ^bb3(%3: vector<[16]x[16]xi8>):  // 2 preds: ^bb1, ^bb2
    "test.some_use"(%3) : (vector<[16]x[16]xi8>) -> ()
    return
  }
}

// -----
module {
  func.func @reactivate_inactive_live_range(%arg0: i1) {
    %0 = arm_sme.get_tile : vector<[4]x[4]xf32>
    cf.cond_br %arg0, ^bb2, ^bb1
  ^bb1:  // pred: ^bb0
    %1 = arm_sme.get_tile : vector<[16]x[16]xi8>
    "test.dummy"() : () -> ()
    "test.some_use"(%1) : (vector<[16]x[16]xi8>) -> ()
    cf.br ^bb3
  ^bb2:  // pred: ^bb0
    %2 = arm_sme.get_tile : vector<[4]x[4]xf32>
    "test.dummy"() : () -> ()
    "test.dummy"() : () -> ()
    "test.some_use"(%2) : (vector<[4]x[4]xf32>) -> ()
    "test.some_use"(%0) : (vector<[4]x[4]xf32>) -> ()
    cf.br ^bb3
  ^bb3:  // 2 preds: ^bb1, ^bb2
    return
  }
}

