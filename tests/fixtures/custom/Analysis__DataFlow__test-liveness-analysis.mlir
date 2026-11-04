module {
  func.func @test_1_type_1.a(%arg0: memref<i32>) {
    %c0_i32 = arith.constant {tag = "zero"} 0 : i32
    memref.store %c0_i32, %arg0[] : memref<i32>
    return
  }
}

// -----
module {
  func.func @test_2_RegionBranchOpInterface_type_1.b(%arg0: memref<i32>, %arg1: memref<i32>, %arg2: i1) {
    %c0_i32 = arith.constant 0 : i32
    cf.cond_br %arg2, ^bb1(%c0_i32 : i32), ^bb2(%c0_i32 : i32) {tag = "br"}
  ^bb1(%0: i32):  // pred: ^bb0
    memref.store %0, %arg0[] : memref<i32>
    cf.br ^bb3
  ^bb2(%1: i32):  // pred: ^bb0
    memref.store %1, %arg1[] : memref<i32>
    cf.br ^bb3
  ^bb3:  // 2 preds: ^bb1, ^bb2
    return
  }
}

// -----
module {
  func.func @test_3_BranchOpInterface_type_1.b(%arg0: i32, %arg1: memref<i32>, %arg2: memref<i32>) {
    %c0_i32 = arith.constant 0 : i32
    cf.switch %arg0 : i32, [
      default: ^bb1,
      42: ^bb2
    ] {tag = "flag"}
  ^bb1:  // pred: ^bb0
    memref.store %c0_i32, %arg1[] : memref<i32>
    cf.br ^bb3
  ^bb2:  // pred: ^bb0
    memref.store %c0_i32, %arg2[] : memref<i32>
    cf.br ^bb3
  ^bb3:  // 2 preds: ^bb1, ^bb2
    return
  }
}

// -----
module {
  func.func @test_branch_result_in_different_result_1.c(%arg0: tensor<f32>, %arg1: tensor<f32>, %arg2: i1) -> tensor<f32> {
    cf.cond_br %arg2, ^bb1(%arg0 : tensor<f32>), ^bb2(%arg1 : tensor<f32>) {tag = "cond_br"}
  ^bb1(%0: tensor<f32>):  // pred: ^bb0
    cf.br ^bb3(%0 : tensor<f32>)
  ^bb2(%1: tensor<f32>):  // pred: ^bb0
    cf.br ^bb3(%1 : tensor<f32>)
  ^bb3(%2: tensor<f32>):  // 2 preds: ^bb1, ^bb2
    return %2 : tensor<f32>
  }
}

// -----
module {
  func.func @test_region_branch_result_in_different_result_1.c(%arg0: tensor<f32>, %arg1: tensor<f32>, %arg2: i1) -> tensor<f32> {
    %0 = scf.if %arg2 -> (tensor<f32>) {
      scf.yield %arg0 : tensor<f32>
    } else {
      scf.yield %arg1 : tensor<f32>
    } {tag = "region_branch"}
    return %0 : tensor<f32>
  }
}

// -----
module {
  func.func private @private(%arg0: i32, %arg1: i32) {
    return
  }
  func.func @test_4_type_1.d(%arg0: i32, %arg1: i32, %arg2: i32, %arg3: memref<i32>) {
    test.call_on_device @private(%arg0, %arg1), %arg2 {tag = "call"} : (i32, i32, i32) -> ()
    return
  }
}

// -----
module {
  func.func @test_5_type_2() -> f32 {
    %cst = arith.constant {tag = "zero"} 0.000000e+00 : f32
    return %cst : f32
  }
}

// -----
module {
  func.func @test_6_RegionBranchTerminatorOpInterface_type_3(%arg0: memref<i32>, %arg1: i1) -> i32 {
    %c0_i32 = arith.constant 0 : i32
    %c1_i32 = arith.constant 1 : i32
    %c2_i32 = arith.constant 2 : i32
    %0:3 = scf.while (%arg2 = %c0_i32, %arg3 = %c1_i32, %arg4 = %c2_i32, %arg5 = %c2_i32) : (i32, i32, i32, i32) -> (i32, i32, i32) {
      memref.store %arg4, %arg0[] : memref<i32>
      scf.condition(%arg1) {tag = "condition"} %arg2, %arg3, %arg5 : i32, i32, i32
    } do {
    ^bb0(%arg2: i32, %arg3: i32, %arg4: i32):
      %1 = arith.addi %arg4, %arg4 {tag = "add"} : i32
      %c3_i32 = arith.constant 3 : i32
      scf.yield %arg2, %arg3, %arg4, %c3_i32 : i32, i32, i32, i32
    }
    return %0#0 : i32
  }
}

// -----
module {
  func.func private @private0(%arg0: i32) -> i32 {
    %0 = arith.addi %arg0, %arg0 {tag = "in_private0"} : i32
    return %0 : i32
  }
  func.func @test_7_type_3(%arg0: memref<i32>) {
    %c0 = arith.constant {tag = "zero"} 0 : index
    %c10 = arith.constant {tag = "ten"} 10 : index
    %c1 = arith.constant {tag = "one"} 1 : index
    %c0_i32 = arith.constant {tag = "x"} 0 : i32
    %c1_i32 = arith.constant {tag = "y"} 1 : i32
    %0:2 = scf.for %arg1 = %c0 to %c10 step %c1 iter_args(%arg2 = %c0_i32, %arg3 = %c1_i32) -> (i32, i32) {
      %1 = arith.addi %c0_i32, %c0_i32 : i32
      %2 = func.call @private0(%1) : (i32) -> i32
      scf.yield %2, %arg3 : i32, i32
    } {tag = "for"}
    memref.store %0#0, %arg0[] : memref<i32>
    return
  }
}

// -----
module {
  func.func private @private1(%arg0: i32) -> i32 {
    %0 = call @private2(%arg0) : (i32) -> i32
    %1 = arith.muli %arg0, %0 {tag = "in_private1"} : i32
    return %1 : i32
  }
  func.func private @private2(%arg0: i32) -> i32 {
    %0 = arith.index_cast %arg0 {tag = "in_private2"} : i32 to index
    %1 = scf.index_switch %0 -> i32 
    case 1 {
      %c10_i32 = arith.constant 10 : i32
      scf.yield %c10_i32 : i32
    }
    case 2 {
      %c20_i32 = arith.constant 20 : i32
      scf.yield %c20_i32 : i32
    }
    default {
      %c30_i32 = arith.constant 30 : i32
      scf.yield %c30_i32 : i32
    }
    return %1 : i32
  }
  func.func @test_8_type_3(%arg0: i32) -> i32 {
    %0 = call @private1(%arg0) : (i32) -> i32
    %1 = arith.muli %0, %arg0 {tag = "final"} : i32
    return %1 : i32
  }
}

// -----
module {
  func.func @test_9_negative() -> f32 {
    %cst = arith.constant {tag = "zero"} 0.000000e+00 : f32
    %cst_0 = arith.constant {tag = "one"} 1.000000e+00 : f32
    return %cst_0 : f32
  }
}

// -----
module {
  func.func private @private_1() -> (i32, i32) {
    %c0_i32 = arith.constant 0 : i32
    %0 = arith.addi %c0_i32, %c0_i32 {tag = "one"} : i32
    return %c0_i32, %0 : i32, i32
  }
  func.func @test_10_negative() -> i32 {
    %0:2 = call @private_1() : () -> (i32, i32)
    return %0#0 : i32
  }
}

// -----
module {
  func.func @dead_block() {
    %false = arith.constant false
    %c0_i64 = arith.constant 0 : i64
    cf.cond_br %false, ^bb1, ^bb2
  ^bb1:  // 2 preds: ^bb0, ^bb1
    %0 = arith.cmpi eq, %c0_i64, %c0_i64 {tag = "dead_block_cmpi"} : i64
    cf.br ^bb1
  ^bb2:  // pred: ^bb0
    return
  }
}

// -----
module {
  func.func @affine_loop_no_use_iv_has_side_effect_op() {
    %c1 = arith.constant 1 : index
    %alloc = memref.alloc() : memref<10xindex>
    affine.for %arg0 = 0 to 79 {
      memref.store %c1, %alloc[%c1] : memref<10xindex>
    } {tag = "for"}
    return
  }
}

// -----
module {
  func.func @affine_loop_no_use_iv() {
    affine.for %arg0 = 0 to 79 {
    } {tag = "for"}
    return
  }
}

// -----
module {
  func.func @forall_no_use_iv_has_side_effect_op(%arg0: index, %arg1: index) {
    scf.parallel (%arg2) = (%arg0) to (%arg1) step (%arg1) {
      %alloca = memref.alloca() : memref<10xf32>
      %cst = arith.constant 0.000000e+00 : f32
      scf.forall (%arg3) in (%arg1) {
        memref.store %cst, %alloca[%arg1] : memref<10xf32>
      } {tag = "forall"}
      scf.reduce 
    }
    return
  }
}

// -----
module {
  func.func @test_for_loop_read_only(%arg0: memref<10xindex>) {
    %c0 = arith.constant 0 : index
    %c10 = arith.constant 10 : index
    %c1 = arith.constant 1 : index
    %0 = scf.for %arg1 = %c0 to %c10 step %c1 iter_args(%arg2 = %c0) -> (index) {
      %1 = memref.load %arg0[%arg2] : memref<10xindex>
      scf.yield %1 : index
    } {tag = "for"}
    return
  }
}

