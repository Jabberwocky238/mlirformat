module {
  func.func @simple_pipeline(%arg0: memref<?xf32>, %arg1: memref<?xf32>) {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c4 = arith.constant 4 : index
    %cst = arith.constant 1.000000e+00 : f32
    scf.for %arg2 = %c0 to %c4 step %c1 {
      %0 = memref.load %arg0[%arg2] {__test_pipelining_op_order__ = 2 : i64, __test_pipelining_stage__ = 0 : i64} : memref<?xf32>
      %1 = arith.addf %0, %cst {__test_pipelining_op_order__ = 0 : i64, __test_pipelining_stage__ = 1 : i64} : f32
      memref.store %1, %arg1[%arg2] {__test_pipelining_op_order__ = 1 : i64, __test_pipelining_stage__ = 1 : i64} : memref<?xf32>
    } {__test_pipelining_loop__}
    return
  }
}

// -----
module {
  func.func @iteration_lt_stage(%arg0: memref<?xf32>, %arg1: memref<?xf32>) {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c2 = arith.constant 2 : index
    %cst = arith.constant 1.000000e+00 : f32
    scf.for %arg2 = %c0 to %c2 step %c1 {
      %0 = memref.load %arg0[%arg2] {__test_pipelining_op_order__ = 2 : i64, __test_pipelining_stage__ = 0 : i64} : memref<?xf32>
      %1 = arith.addf %0, %cst {__test_pipelining_op_order__ = 0 : i64, __test_pipelining_stage__ = 3 : i64} : f32
      memref.store %1, %arg1[%arg2] {__test_pipelining_op_order__ = 1 : i64, __test_pipelining_stage__ = 3 : i64} : memref<?xf32>
    } {__test_pipelining_loop__}
    return
  }
}

// -----
module {
  func.func @simple_pipeline_region(%arg0: memref<?xf32>, %arg1: memref<?xf32>) {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c4 = arith.constant 4 : index
    %cst = arith.constant 1.000000e+00 : f32
    scf.for %arg2 = %c0 to %c4 step %c1 {
      %0 = scf.execute_region -> f32 {
        %2 = memref.load %arg0[%arg2] : memref<?xf32>
        scf.yield %2 : f32
      } {__test_pipelining_op_order__ = 2 : i64, __test_pipelining_stage__ = 0 : i64}
      %1 = scf.execute_region -> f32 {
        %2 = arith.addf %0, %cst : f32
        scf.yield %2 : f32
      } {__test_pipelining_op_order__ = 0 : i64, __test_pipelining_stage__ = 1 : i64}
      memref.store %1, %arg1[%arg2] {__test_pipelining_op_order__ = 1 : i64, __test_pipelining_stage__ = 1 : i64} : memref<?xf32>
    } {__test_pipelining_loop__}
    return
  }
}

// -----
module {
  func.func @simple_pipeline_step(%arg0: memref<?xf32>, %arg1: memref<?xf32>) {
    %c0 = arith.constant 0 : index
    %c3 = arith.constant 3 : index
    %c11 = arith.constant 11 : index
    %cst = arith.constant 1.000000e+00 : f32
    scf.for %arg2 = %c0 to %c11 step %c3 {
      %0 = memref.load %arg0[%arg2] {__test_pipelining_op_order__ = 2 : i64, __test_pipelining_stage__ = 0 : i64} : memref<?xf32>
      %1 = arith.addf %0, %cst {__test_pipelining_op_order__ = 0 : i64, __test_pipelining_stage__ = 2 : i64} : f32
      memref.store %1, %arg1[%arg2] {__test_pipelining_op_order__ = 1 : i64, __test_pipelining_stage__ = 2 : i64} : memref<?xf32>
    } {__test_pipelining_loop__}
    return
  }
}

// -----
module {
  func.func @three_stage(%arg0: memref<?xf32>, %arg1: memref<?xf32>) {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c4 = arith.constant 4 : index
    %cst = arith.constant 1.000000e+00 : f32
    scf.for %arg2 = %c0 to %c4 step %c1 {
      %0 = memref.load %arg0[%arg2] {__test_pipelining_op_order__ = 2 : i64, __test_pipelining_stage__ = 0 : i64} : memref<?xf32>
      %1 = arith.addf %0, %cst {__test_pipelining_op_order__ = 1 : i64, __test_pipelining_stage__ = 1 : i64} : f32
      memref.store %1, %arg1[%arg2] {__test_pipelining_op_order__ = 0 : i64, __test_pipelining_stage__ = 2 : i64} : memref<?xf32>
    } {__test_pipelining_loop__}
    return
  }
}

// -----
module {
  func.func @long_liverange(%arg0: memref<?xf32>, %arg1: memref<?xf32>) {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c10 = arith.constant 10 : index
    %cst = arith.constant 1.000000e+00 : f32
    scf.for %arg2 = %c0 to %c10 step %c1 {
      %0 = memref.load %arg0[%arg2] {__test_pipelining_op_order__ = 2 : i64, __test_pipelining_stage__ = 0 : i64} : memref<?xf32>
      %1 = arith.addf %0, %cst {__test_pipelining_op_order__ = 0 : i64, __test_pipelining_stage__ = 4 : i64} : f32
      memref.store %1, %arg1[%arg2] {__test_pipelining_op_order__ = 1 : i64, __test_pipelining_stage__ = 4 : i64} : memref<?xf32>
    } {__test_pipelining_loop__}
    return
  }
}

// -----
module {
  func.func @multiple_uses(%arg0: memref<?xf32>, %arg1: memref<?xf32>) {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c10 = arith.constant 10 : index
    %cst = arith.constant 1.000000e+00 : f32
    scf.for %arg2 = %c0 to %c10 step %c1 {
      %0 = memref.load %arg0[%arg2] {__test_pipelining_op_order__ = 3 : i64, __test_pipelining_stage__ = 0 : i64} : memref<?xf32>
      %1 = arith.addf %0, %cst {__test_pipelining_op_order__ = 0 : i64, __test_pipelining_stage__ = 1 : i64} : f32
      %2 = arith.mulf %1, %0 {__test_pipelining_op_order__ = 1 : i64, __test_pipelining_stage__ = 2 : i64} : f32
      memref.store %2, %arg1[%arg2] {__test_pipelining_op_order__ = 2 : i64, __test_pipelining_stage__ = 3 : i64} : memref<?xf32>
    } {__test_pipelining_loop__}
    return
  }
}

// -----
module {
  func.func @region_multiple_uses(%arg0: memref<?xf32>, %arg1: memref<?xf32>) {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c10 = arith.constant 10 : index
    %cst = arith.constant 1.000000e+00 : f32
    scf.for %arg2 = %c0 to %c10 step %c1 {
      %0 = memref.load %arg0[%arg2] {__test_pipelining_op_order__ = 3 : i64, __test_pipelining_stage__ = 0 : i64} : memref<?xf32>
      %1 = arith.addf %0, %cst {__test_pipelining_op_order__ = 0 : i64, __test_pipelining_stage__ = 1 : i64} : f32
      %2 = scf.execute_region -> f32 {
        %3 = arith.mulf %1, %0 : f32
        scf.yield %3 : f32
      } {__test_pipelining_op_order__ = 1 : i64, __test_pipelining_stage__ = 2 : i64}
      memref.store %2, %arg1[%arg2] {__test_pipelining_op_order__ = 2 : i64, __test_pipelining_stage__ = 3 : i64} : memref<?xf32>
    } {__test_pipelining_loop__}
    return
  }
}

// -----
module {
  func.func @loop_carried(%arg0: memref<?xf32>, %arg1: memref<?xf32>) {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c4 = arith.constant 4 : index
    %cst = arith.constant 1.000000e+00 : f32
    %0 = scf.for %arg2 = %c0 to %c4 step %c1 iter_args(%arg3 = %cst) -> (f32) {
      %1 = memref.load %arg0[%arg2] {__test_pipelining_op_order__ = 1 : i64, __test_pipelining_stage__ = 0 : i64} : memref<?xf32>
      %2 = arith.addf %1, %arg3 {__test_pipelining_op_order__ = 0 : i64, __test_pipelining_stage__ = 1 : i64} : f32
      scf.yield %2 : f32
    } {__test_pipelining_loop__}
    memref.store %0, %arg1[%c0] : memref<?xf32>
    return
  }
}

// -----
module {
  func.func @backedge_different_stage(%arg0: memref<?xf32>) -> f32 {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c4 = arith.constant 4 : index
    %cst = arith.constant 2.000000e+00 : f32
    %0 = scf.for %arg1 = %c0 to %c4 step %c1 iter_args(%arg2 = %cst) -> (f32) {
      %1 = memref.load %arg0[%arg1] {__test_pipelining_op_order__ = 2 : i64, __test_pipelining_stage__ = 0 : i64} : memref<?xf32>
      %2 = arith.addf %1, %arg2 {__test_pipelining_op_order__ = 1 : i64, __test_pipelining_stage__ = 1 : i64} : f32
      %3 = arith.mulf %cst, %2 {__test_pipelining_op_order__ = 0 : i64, __test_pipelining_stage__ = 2 : i64} : f32
      scf.yield %3 : f32
    } {__test_pipelining_loop__}
    return %0 : f32
  }
}

// -----
module {
  func.func @region_backedge_different_stage(%arg0: memref<?xf32>) -> f32 {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c4 = arith.constant 4 : index
    %cst = arith.constant 2.000000e+00 : f32
    %0 = scf.for %arg1 = %c0 to %c4 step %c1 iter_args(%arg2 = %cst) -> (f32) {
      %1 = scf.execute_region -> f32 {
        %4 = memref.load %arg0[%arg1] : memref<?xf32>
        scf.yield %4 : f32
      } {__test_pipelining_op_order__ = 2 : i64, __test_pipelining_stage__ = 0 : i64}
      %2 = scf.execute_region -> f32 {
        %4 = arith.addf %1, %arg2 : f32
        scf.yield %4 : f32
      } {__test_pipelining_op_order__ = 1 : i64, __test_pipelining_stage__ = 1 : i64}
      %3 = arith.mulf %cst, %2 {__test_pipelining_op_order__ = 0 : i64, __test_pipelining_stage__ = 2 : i64} : f32
      scf.yield %3 : f32
    } {__test_pipelining_loop__}
    return %0 : f32
  }
}

// -----
module {
  func.func @backedge_same_stage(%arg0: memref<?xf32>) -> f32 {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c4 = arith.constant 4 : index
    %cst = arith.constant 2.000000e+00 : f32
    %0 = scf.for %arg1 = %c0 to %c4 step %c1 iter_args(%arg2 = %cst) -> (f32) {
      %1 = memref.load %arg0[%arg1] {__test_pipelining_op_order__ = 2 : i64, __test_pipelining_stage__ = 0 : i64} : memref<?xf32>
      %2 = arith.addf %1, %arg2 {__test_pipelining_op_order__ = 0 : i64, __test_pipelining_stage__ = 1 : i64} : f32
      %3 = arith.mulf %cst, %2 {__test_pipelining_op_order__ = 1 : i64, __test_pipelining_stage__ = 1 : i64} : f32
      scf.yield %3 : f32
    } {__test_pipelining_loop__}
    return %0 : f32
  }
}

// -----
#map = affine_map<(d0)[s0] -> (d0 + s0)>
#map1 = affine_map<(d0) -> (d0 mod 2)>
#map2 = affine_map<(d0) -> (d0)>
#map3 = affine_map<(d0) -> ()>
module {
  func.func @pipeline_op_with_region(%arg0: memref<?xf32>, %arg1: memref<?xf32>, %arg2: memref<?xf32>, %arg3: f32) {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c4 = arith.constant 4 : index
    %alloc = memref.alloc() : memref<2x8xf32>
    %alloc_0 = memref.alloc() : memref<2x8xf32>
    scf.for %arg4 = %c0 to %c4 step %c1 {
      %subview = memref.subview %arg0[%arg4] [8] [1] {__test_pipelining_op_order__ = 3 : i64, __test_pipelining_stage__ = 0 : i64} : memref<?xf32> to memref<8xf32, #map>
      %subview_1 = memref.subview %arg1[%arg4] [8] [1] {__test_pipelining_op_order__ = 4 : i64, __test_pipelining_stage__ = 0 : i64} : memref<?xf32> to memref<8xf32, #map>
      %0 = affine.apply #map1(%arg4) {__test_pipelining_op_order__ = 5 : i64, __test_pipelining_stage__ = 0 : i64}
      %subview_2 = memref.subview %alloc[%0, 0] [1, 8] [1, 1] {__test_pipelining_op_order__ = 6 : i64, __test_pipelining_stage__ = 0 : i64} : memref<2x8xf32> to memref<8xf32, #map>
      %subview_3 = memref.subview %alloc_0[%0, 0] [1, 8] [1, 1] {__test_pipelining_op_order__ = 7 : i64, __test_pipelining_stage__ = 0 : i64} : memref<2x8xf32> to memref<8xf32, #map>
      memref.copy %subview, %subview_2 {__test_pipelining_op_order__ = 8 : i64, __test_pipelining_stage__ = 0 : i64} : memref<8xf32, #map> to memref<8xf32, #map>
      memref.copy %subview_1, %subview_3 {__test_pipelining_op_order__ = 9 : i64, __test_pipelining_stage__ = 0 : i64} : memref<8xf32, #map> to memref<8xf32, #map>
      %subview_4 = memref.subview %arg2[%arg4] [8] [1] {__test_pipelining_op_order__ = 0 : i64, __test_pipelining_stage__ = 1 : i64} : memref<?xf32> to memref<8xf32, #map>
      %1 = arith.addf %arg3, %arg3 {__test_pipelining_op_order__ = 1 : i64, __test_pipelining_stage__ = 1 : i64} : f32
      linalg.generic {indexing_maps = [#map2, #map2, #map3, #map2], iterator_types = ["parallel"]} ins(%subview_2, %subview_3, %1 : memref<8xf32, #map>, memref<8xf32, #map>, f32) outs(%subview_4 : memref<8xf32, #map>) attrs =  {__test_pipelining_op_order__ = 2 : i64, __test_pipelining_stage__ = 1 : i64} {
      ^bb0(%in: f32, %in_5: f32, %in_6: f32, %out: f32):
        %2 = arith.addf %in, %in_5 : f32
        %3 = arith.addf %2, %out : f32
        %4 = arith.addf %1, %3 : f32
        %5 = arith.addf %in_6, %4 : f32
        linalg.yield %5 : f32
      }
    } {__test_pipelining_loop__}
    return
  }
}

// -----
module {
  func.func @backedge_mix_order(%arg0: memref<?xf32>) -> f32 {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c4 = arith.constant 4 : index
    %cst = arith.constant 2.000000e+00 : f32
    %0 = scf.for %arg1 = %c0 to %c4 step %c1 iter_args(%arg2 = %cst) -> (f32) {
      %1 = memref.load %arg0[%arg1] {__test_pipelining_op_order__ = 0 : i64, __test_pipelining_stage__ = 0 : i64} : memref<?xf32>
      %2 = arith.mulf %arg2, %1 {__test_pipelining_op_order__ = 1 : i64, __test_pipelining_stage__ = 1 : i64} : f32
      %3 = arith.addi %arg1, %c1 {__test_pipelining_op_order__ = 2 : i64, __test_pipelining_stage__ = 0 : i64} : index
      %4 = memref.load %arg0[%3] {__test_pipelining_op_order__ = 3 : i64, __test_pipelining_stage__ = 0 : i64} : memref<?xf32>
      %5 = arith.mulf %4, %2 {__test_pipelining_op_order__ = 4 : i64, __test_pipelining_stage__ = 1 : i64} : f32
      scf.yield %5 : f32
    } {__test_pipelining_loop__}
    return %0 : f32
  }
}

// -----
module {
  func.func @distance_1_use(%arg0: memref<?xf32>, %arg1: memref<?xf32>) {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c4 = arith.constant 4 : index
    %cst = arith.constant 1.000000e+00 : f32
    %0 = scf.for %arg2 = %c0 to %c4 step %c1 iter_args(%arg3 = %c0) -> (index) {
      %1 = memref.load %arg0[%arg3] {__test_pipelining_op_order__ = 0 : i64, __test_pipelining_stage__ = 0 : i64} : memref<?xf32>
      %2 = arith.addi %arg3, %c1 {__test_pipelining_op_order__ = 1 : i64, __test_pipelining_stage__ = 0 : i64} : index
      memref.store %1, %arg1[%arg3] {__test_pipelining_op_order__ = 2 : i64, __test_pipelining_stage__ = 2 : i64} : memref<?xf32>
      scf.yield %2 : index
    } {__test_pipelining_loop__}
    return
  }
}

// -----
module {
  func.func @stage_0_value_escape(%arg0: memref<?xf32>, %arg1: memref<?xf32>, %arg2: index) {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %cst = arith.constant 1.000000e+00 : f32
    %0 = scf.for %arg3 = %c0 to %arg2 step %c1 iter_args(%arg4 = %cst) -> (f32) {
      %1 = memref.load %arg0[%arg3] {__test_pipelining_op_order__ = 1 : i64, __test_pipelining_stage__ = 0 : i64} : memref<?xf32>
      %2 = arith.addf %1, %arg4 {__test_pipelining_op_order__ = 0 : i64, __test_pipelining_stage__ = 1 : i64} : f32
      memref.store %2, %arg1[%c0] {__test_pipelining_op_order__ = 2 : i64, __test_pipelining_stage__ = 2 : i64} : memref<?xf32>
      scf.yield %2 : f32
    } {__test_pipelining_loop__}
    memref.store %0, %arg1[%c1] : memref<?xf32>
    return
  }
}

// -----
module {
  func.func @dynamic_loop(%arg0: memref<?xf32>, %arg1: memref<?xf32>, %arg2: index, %arg3: index, %arg4: index) {
    %cst = arith.constant 1.000000e+00 : f32
    scf.for %arg5 = %arg2 to %arg3 step %arg4 {
      %0 = memref.load %arg0[%arg5] {__test_pipelining_op_order__ = 2 : i64, __test_pipelining_stage__ = 0 : i64} : memref<?xf32>
      %1 = arith.addf %0, %cst {__test_pipelining_op_order__ = 1 : i64, __test_pipelining_stage__ = 1 : i64} : f32
      memref.store %1, %arg1[%arg5] {__test_pipelining_op_order__ = 0 : i64, __test_pipelining_stage__ = 2 : i64} : memref<?xf32>
    } {__test_pipelining_loop__}
    return
  }
}

// -----
module {
  func.func @dynamic_loop_result(%arg0: memref<?xf32>, %arg1: memref<?xf32>, %arg2: index, %arg3: index, %arg4: index) {
    %cst = arith.constant 1.000000e+00 : f32
    %cst_0 = arith.constant 3.300000e+01 : f32
    %c0 = arith.constant 0 : index
    %0 = scf.for %arg5 = %arg2 to %arg3 step %arg4 iter_args(%arg6 = %cst) -> (f32) {
      %1 = memref.load %arg0[%arg5] {__test_pipelining_op_order__ = 2 : i64, __test_pipelining_stage__ = 0 : i64} : memref<?xf32>
      %2 = arith.addf %1, %arg6 {__test_pipelining_op_order__ = 0 : i64, __test_pipelining_stage__ = 1 : i64} : f32
      %3 = arith.mulf %2, %cst_0 {__test_pipelining_op_order__ = 1 : i64, __test_pipelining_stage__ = 1 : i64} : f32
      scf.yield %3 : f32
    } {__test_pipelining_loop__}
    memref.store %0, %arg1[%c0] : memref<?xf32>
    return
  }
}

// -----
module {
  func.func @yield_constant_loop(%arg0: memref<?xf32>) -> f32 {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c4 = arith.constant 4 : index
    %cst = arith.constant 0.000000e+00 : f32
    %cst_0 = arith.constant 2.000000e+00 : f32
    %0 = scf.for %arg1 = %c0 to %c4 step %c1 iter_args(%arg2 = %cst_0) -> (f32) {
      %1 = memref.load %arg0[%arg1] {__test_pipelining_op_order__ = 3 : i64, __test_pipelining_stage__ = 0 : i64} : memref<?xf32>
      %2 = arith.addf %1, %arg2 {__test_pipelining_op_order__ = 0 : i64, __test_pipelining_stage__ = 1 : i64} : f32
      %3 = arith.mulf %cst, %2 {__test_pipelining_op_order__ = 1 : i64, __test_pipelining_stage__ = 1 : i64} : f32
      memref.store %3, %arg0[%arg1] {__test_pipelining_op_order__ = 2 : i64, __test_pipelining_stage__ = 1 : i64} : memref<?xf32>
      scf.yield %cst : f32
    } {__test_pipelining_loop__}
    return %0 : f32
  }
}

// -----
module {
  func.func @invalid_schedule(%arg0: memref<?xf32>, %arg1: memref<?xf32>) {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c4 = arith.constant 4 : index
    %cst = arith.constant 1.000000e+00 : f32
    scf.for %arg2 = %c0 to %c4 step %c1 {
      %0 = memref.load %arg0[%arg2] {__test_pipelining_op_order__ = 2 : i64, __test_pipelining_stage__ = 0 : i64} : memref<?xf32>
      %1 = arith.addf %0, %cst {__test_pipelining_op_order__ = 0 : i64, __test_pipelining_stage__ = 2 : i64} : f32
      memref.store %1, %arg1[%arg2] {__test_pipelining_op_order__ = 1 : i64, __test_pipelining_stage__ = 1 : i64} : memref<?xf32>
    } {__test_pipelining_loop__}
    return
  }
}

// -----
module {
  func.func @invalid_schedule2(%arg0: memref<?xf32>, %arg1: memref<?xf32>) {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c4 = arith.constant 4 : index
    %cst = arith.constant 1.000000e+00 : f32
    %0 = scf.for %arg2 = %c0 to %c4 step %c1 iter_args(%arg3 = %c0) -> (index) {
      %1 = memref.load %arg0[%arg3] {__test_pipelining_op_order__ = 0 : i64, __test_pipelining_stage__ = 0 : i64} : memref<?xf32>
      %2 = arith.addi %arg3, %c1 {__test_pipelining_op_order__ = 1 : i64, __test_pipelining_stage__ = 1 : i64} : index
      memref.store %1, %arg1[%arg3] {__test_pipelining_op_order__ = 2 : i64, __test_pipelining_stage__ = 2 : i64} : memref<?xf32>
      scf.yield %2 : index
    } {__test_pipelining_loop__}
    return
  }
}

// -----
module {
  func.func @invalid_schedule3(%arg0: memref<?xf32>, %arg1: memref<?xf32>, %arg2: index) {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c4 = arith.constant 4 : index
    %0 = scf.for %arg3 = %c0 to %c4 step %c1 iter_args(%arg4 = %c0) -> (index) {
      %1 = arith.cmpi slt, %arg2, %c4 {__test_pipelining_op_order__ = 0 : i64, __test_pipelining_stage__ = 0 : i64} : index
      %2 = scf.if %1 -> (index) {
        %5 = arith.addi %arg4, %c1 : index
        scf.yield %5 : index
      } else {
        scf.yield %arg4 : index
      } {__test_pipelining_op_order__ = 1 : i64, __test_pipelining_stage__ = 0 : i64}
      %3 = memref.load %arg0[%2] {__test_pipelining_op_order__ = 2 : i64, __test_pipelining_stage__ = 0 : i64} : memref<?xf32>
      %4 = arith.addi %2, %c1 {__test_pipelining_op_order__ = 3 : i64, __test_pipelining_stage__ = 1 : i64} : index
      memref.store %3, %arg1[%2] {__test_pipelining_op_order__ = 4 : i64, __test_pipelining_stage__ = 2 : i64} : memref<?xf32>
      scf.yield %4 : index
    } {__test_pipelining_loop__}
    return
  }
}

// -----
module {
  func.func @invalid_loop_step(%arg0: memref<?xf32>, %arg1: memref<?xf32>) {
    %c0 = arith.constant 0 : index
    %cst = arith.constant 1.000000e+00 : f32
    scf.for %arg2 = %c0 to %c0 step %c0 {
      %0 = memref.load %arg0[%arg2] {__test_pipelining_op_order__ = 2 : i64, __test_pipelining_stage__ = 0 : i64} : memref<?xf32>
      %1 = arith.addf %0, %cst {__test_pipelining_op_order__ = 0 : i64, __test_pipelining_stage__ = 1 : i64} : f32
      memref.store %1, %arg1[%arg2] {__test_pipelining_op_order__ = 1 : i64, __test_pipelining_stage__ = 1 : i64} : memref<?xf32>
    } {__test_pipelining_loop__}
    return
  }
}

