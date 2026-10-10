module {
  func.func @rewrite_warp_op_to_scf_if(%arg0: index, %arg1: vector<4xf32>, %arg2: vector<8xf32>) {
    %0:2 = gpu.warp_execute_on_lane_0(%arg0)[32] args(%arg1, %arg2 : vector<4xf32>, vector<8xf32>) -> (vector<1xf32>, vector<2xf32>) {
    ^bb0(%arg3: vector<128xf32>, %arg4: vector<256xf32>):
      %1 = "some_def"(%arg3) : (vector<128xf32>) -> vector<32xf32>
      %2 = "some_def"(%arg4) : (vector<256xf32>) -> vector<64xf32>
      gpu.yield %1, %2 : vector<32xf32>, vector<64xf32>
    }
    "some_use"(%0#0) : (vector<1xf32>) -> ()
    "some_use"(%0#1) : (vector<2xf32>) -> ()
    return
  }
}

// -----
module {
  func.func @warp(%arg0: index, %arg1: memref<1024xf32>, %arg2: memref<1024xf32>, %arg3: memref<1024xf32>, %arg4: index) {
    gpu.warp_execute_on_lane_0(%arg0)[32] {
      %subview = memref.subview %arg1[%arg4] [128] [1] : memref<1024xf32> to memref<128xf32, strided<[1], offset: ?>>
      %subview_0 = memref.subview %arg2[%arg4] [128] [1] : memref<1024xf32> to memref<128xf32, strided<[1], offset: ?>>
      %subview_1 = memref.subview %arg3[%arg4] [128] [1] : memref<1024xf32> to memref<128xf32, strided<[1], offset: ?>>
      %c0 = arith.constant 0 : index
      %c32 = arith.constant 32 : index
      %cst = arith.constant 0.000000e+00 : f32
      %0 = vector.transfer_read %subview[%c0], %cst : memref<128xf32, strided<[1], offset: ?>>, vector<32xf32>
      %1 = vector.transfer_read %subview[%c32], %cst : memref<128xf32, strided<[1], offset: ?>>, vector<32xf32>
      %2 = vector.transfer_read %subview_0[%c0], %cst : memref<128xf32, strided<[1], offset: ?>>, vector<64xf32>
      %3 = vector.transfer_read %subview_0[%c32], %cst : memref<128xf32, strided<[1], offset: ?>>, vector<64xf32>
      %4 = arith.addf %0, %1 : vector<32xf32>
      %5 = arith.addf %2, %3 : vector<64xf32>
      vector.transfer_write %4, %subview_1[%c0] : vector<32xf32>, memref<128xf32, strided<[1], offset: ?>>
      vector.transfer_write %5, %subview_1[%c32] : vector<64xf32>, memref<128xf32, strided<[1], offset: ?>>
    }
    return
  }
}

// -----
module {
  func.func @warp_extract(%arg0: index, %arg1: memref<1024x1024xf32>, %arg2: index) {
    gpu.warp_execute_on_lane_0(%arg0)[32] {
      %c0 = arith.constant 0 : index
      %0 = "test.dummy_op"() : () -> vector<1xf32>
      %1 = "test.dummy_op"() : () -> vector<1x1xf32>
      vector.transfer_write %1, %arg1[%c0, %c0] : vector<1x1xf32>, memref<1024x1024xf32>
      vector.transfer_write %0, %arg1[%c0, %c0] : vector<1xf32>, memref<1024x1024xf32>
    }
    return
  }
}

// -----
module {
  func.func @warp_extract_4_elems(%arg0: index, %arg1: memref<1024x1024xf32>, %arg2: index) {
    gpu.warp_execute_on_lane_0(%arg0)[32] {
      %c0 = arith.constant 0 : index
      %0 = "test.dummy_op"() : () -> vector<4xf32>
      %1 = "test.dummy_op"() : () -> vector<4x1xf32>
      vector.transfer_write %1, %arg1[%c0, %c0] : vector<4x1xf32>, memref<1024x1024xf32>
      vector.transfer_write %0, %arg1[%c0, %c0] : vector<4xf32>, memref<1024x1024xf32>
    }
    return
  }
}

// -----
module {
  func.func @warp_extract_5_elems(%arg0: index, %arg1: memref<1024x1024xf32>, %arg2: index) {
    gpu.warp_execute_on_lane_0(%arg0)[32] {
      %c0 = arith.constant 0 : index
      %0 = "test.dummy_op"() : () -> vector<5xf32>
      %1 = "test.dummy_op"() : () -> vector<5x1xf32>
      vector.transfer_write %1, %arg1[%c0, %c0] : vector<5x1xf32>, memref<1024x1024xf32>
      vector.transfer_write %0, %arg1[%c0, %c0] : vector<5xf32>, memref<1024x1024xf32>
    }
    return
  }
}

// -----
module {
  func.func @warp_extract_8_elems(%arg0: index, %arg1: memref<1024x1024xf32>, %arg2: index) {
    gpu.warp_execute_on_lane_0(%arg0)[32] {
      %c0 = arith.constant 0 : index
      %0 = "test.dummy_op"() : () -> vector<8xf32>
      %1 = "test.dummy_op"() : () -> vector<8x1xf32>
      vector.transfer_write %1, %arg1[%c0, %c0] : vector<8x1xf32>, memref<1024x1024xf32>
      vector.transfer_write %0, %arg1[%c0, %c0] : vector<8xf32>, memref<1024x1024xf32>
    }
    return
  }
}

// -----
module {
  func.func @warp_dead_result(%arg0: index) -> vector<1xf32> {
    %0:3 = gpu.warp_execute_on_lane_0(%arg0)[32] -> (vector<1xf32>, vector<1xf32>, vector<1xf32>) {
      %1 = "some_def"() : () -> vector<32xf32>
      %2 = "some_def"() : () -> vector<32xf32>
      %3 = "some_def"() : () -> vector<32xf32>
      gpu.yield %1, %2, %3 : vector<32xf32>, vector<32xf32>, vector<32xf32>
    }
    return %0#1 : vector<1xf32>
  }
}

// -----
module {
  func.func @warp_propagate_operand(%arg0: index, %arg1: vector<4xf32>) -> vector<4xf32> {
    %0 = gpu.warp_execute_on_lane_0(%arg0)[32] args(%arg1 : vector<4xf32>) -> (vector<4xf32>) {
    ^bb0(%arg2: vector<128xf32>):
      gpu.yield %arg2 : vector<128xf32>
    }
    return %0 : vector<4xf32>
  }
}

// -----
#map = affine_map<()[s0] -> (s0 * 2)>
module {
  func.func @warp_propagate_elementwise(%arg0: index, %arg1: memref<1024xf32>) {
    %c0 = arith.constant 0 : index
    %c0_0 = arith.constant 0 : index
    %cst = arith.constant 0.000000e+00 : f32
    %0:2 = gpu.warp_execute_on_lane_0(%arg0)[32] -> (vector<1xf32>, vector<2xf32>) {
      %2 = "some_def"() : () -> vector<32xf32>
      %3 = "some_def"() : () -> vector<32xf32>
      %4 = "some_def"() : () -> vector<64xf32>
      %5 = "some_def"() : () -> vector<64xf32>
      %6 = arith.addf %2, %3 : vector<32xf32>
      %7 = arith.addf %4, %5 : vector<64xf32>
      gpu.yield %6, %7 : vector<32xf32>, vector<64xf32>
    }
    %1 = affine.apply #map()[%arg0]
    vector.transfer_write %0#0, %arg1[%arg0] : vector<1xf32>, memref<1024xf32>
    vector.transfer_write %0#1, %arg1[%1] : vector<2xf32>, memref<1024xf32>
    return
  }
}

// -----
module {
  func.func @warp_propagate_scalar_arith(%arg0: index) {
    %0 = gpu.warp_execute_on_lane_0(%arg0)[32] -> (f32) {
      %1 = "some_def"() : () -> f32
      %2 = "some_def"() : () -> f32
      %3 = arith.addf %1, %2 : f32
      gpu.yield %3 : f32
    }
    vector.print %0 : f32
    return
  }
}

// -----
module {
  func.func @warp_propagate_cast(%arg0: index, %arg1: i32) -> f32 {
    %0 = gpu.warp_execute_on_lane_0(%arg0)[32] -> (f32) {
      %1 = arith.sitofp %arg1 : i32 to f32
      gpu.yield %1 : f32
    }
    return %0 : f32
  }
}

// -----
#map = affine_map<()[s0] -> (s0 * 2)>
module {
  func.func @warp_propagate_read(%arg0: index, %arg1: memref<1024xf32>, %arg2: memref<1024xf32>) {
    %c0 = arith.constant 0 : index
    %c0_0 = arith.constant 0 : index
    %cst = arith.constant 0.000000e+00 : f32
    %0:2 = gpu.warp_execute_on_lane_0(%arg0)[32] -> (vector<1xf32>, vector<2xf32>) {
      %2 = vector.transfer_read %arg1[%c0], %cst : memref<1024xf32>, vector<32xf32>
      %3 = vector.transfer_read %arg1[%c0_0], %cst : memref<1024xf32>, vector<64xf32>
      gpu.yield %2, %3 : vector<32xf32>, vector<64xf32>
    }
    %1 = affine.apply #map()[%arg0]
    vector.transfer_write %0#0, %arg2[%arg0] : vector<1xf32>, memref<1024xf32>
    vector.transfer_write %0#1, %arg2[%1] : vector<2xf32>, memref<1024xf32>
    return
  }
}

// -----
module {
  func.func @fold_vector_broadcast(%arg0: index) {
    %0 = gpu.warp_execute_on_lane_0(%arg0)[32] -> (vector<1xf32>) {
      %1 = "some_def"() : () -> vector<1xf32>
      %2 = vector.broadcast %1 : vector<1xf32> to vector<32xf32>
      gpu.yield %2 : vector<32xf32>
    }
    vector.print %0 : vector<1xf32>
    return
  }
}

// -----
module {
  func.func @extract_vector_broadcast(%arg0: index) {
    %0 = gpu.warp_execute_on_lane_0(%arg0)[32] -> (vector<2xf32>) {
      %1 = "some_def"() : () -> vector<1xf32>
      %2 = vector.broadcast %1 : vector<1xf32> to vector<64xf32>
      gpu.yield %2 : vector<64xf32>
    }
    vector.print %0 : vector<2xf32>
    return
  }
}

// -----
module {
  func.func @extract_scalar_vector_broadcast(%arg0: index) {
    %0 = gpu.warp_execute_on_lane_0(%arg0)[32] -> (vector<2xf32>) {
      %1 = "some_def"() : () -> f32
      %2 = vector.broadcast %1 : f32 to vector<64xf32>
      gpu.yield %2 : vector<64xf32>
    }
    vector.print %0 : vector<2xf32>
    return
  }
}

// -----
module {
  func.func @warp_scf_for(%arg0: index) {
    %c128 = arith.constant 128 : index
    %c1 = arith.constant 1 : index
    %c0 = arith.constant 0 : index
    %0 = gpu.warp_execute_on_lane_0(%arg0)[32] -> (vector<4xf32>) {
      %1 = "some_def"() : () -> vector<128xf32>
      %2 = scf.for %arg1 = %c0 to %c128 step %c1 iter_args(%arg2 = %1) -> (vector<128xf32>) {
        %3 = arith.addi %arg1, %c1 : index
        %4 = "some_def"(%3, %arg2) : (index, vector<128xf32>) -> vector<128xf32>
        scf.yield %4 : vector<128xf32>
      }
      gpu.yield %2 : vector<128xf32>
    }
    "some_use"(%0) : (vector<4xf32>) -> ()
    return
  }
}

// -----
module {
  func.func @warp_scf_for_use_from_above(%arg0: index) {
    %c128 = arith.constant 128 : index
    %c1 = arith.constant 1 : index
    %c0 = arith.constant 0 : index
    %0 = gpu.warp_execute_on_lane_0(%arg0)[32] -> (vector<4xf32>) {
      %1 = "some_def"() : () -> vector<128xf32>
      %2 = "some_def_above"() : () -> vector<128xf32>
      %3 = scf.for %arg1 = %c0 to %c128 step %c1 iter_args(%arg2 = %1) -> (vector<128xf32>) {
        %4 = "some_def"(%arg2, %2) : (vector<128xf32>, vector<128xf32>) -> vector<128xf32>
        scf.yield %4 : vector<128xf32>
      }
      gpu.yield %3 : vector<128xf32>
    }
    "some_use"(%0) : (vector<4xf32>) -> ()
    return
  }
}

// -----
module {
  func.func @warp_scf_for_local_loop_bounds(%arg0: index, %arg1: index) {
    %c1 = arith.constant 1 : index
    %c0 = arith.constant 0 : index
    %0 = gpu.warp_execute_on_lane_0(%arg0)[32] args(%arg1 : index) -> (vector<4xf32>) {
    ^bb0(%arg2: index):
      %1 = "some_def"() : () -> vector<128xf32>
      %2 = scf.for %arg3 = %c0 to %arg2 step %c1 iter_args(%arg4 = %1) -> (vector<128xf32>) {
        %3 = "some_def"(%arg4) : (vector<128xf32>) -> vector<128xf32>
        scf.yield %3 : vector<128xf32>
      }
      gpu.yield %2 : vector<128xf32>
    }
    "some_use"(%0) : (vector<4xf32>) -> ()
    return
  }
}

// -----
module {
  func.func @warp_scf_for_swap(%arg0: index) {
    %c128 = arith.constant 128 : index
    %c1 = arith.constant 1 : index
    %c0 = arith.constant 0 : index
    %0:2 = gpu.warp_execute_on_lane_0(%arg0)[32] -> (vector<4xf32>, vector<4xf32>) {
      %1 = "some_def"() : () -> vector<128xf32>
      %2 = "some_def"() : () -> vector<128xf32>
      %3:2 = scf.for %arg1 = %c0 to %c128 step %c1 iter_args(%arg2 = %1, %arg3 = %2) -> (vector<128xf32>, vector<128xf32>) {
        %4 = "some_def"(%arg2) : (vector<128xf32>) -> vector<128xf32>
        %5 = "some_def"(%arg3) : (vector<128xf32>) -> vector<128xf32>
        scf.yield %5, %4 : vector<128xf32>, vector<128xf32>
      }
      gpu.yield %3#0, %3#1 : vector<128xf32>, vector<128xf32>
    }
    "some_use"(%0#0) : (vector<4xf32>) -> ()
    "some_use"(%0#1) : (vector<4xf32>) -> ()
    return
  }
}

// -----
module {
  func.func @warp_scf_for_swap_no_yield(%arg0: index) {
    %c128 = arith.constant 128 : index
    %c1 = arith.constant 1 : index
    %c0 = arith.constant 0 : index
    gpu.warp_execute_on_lane_0(%arg0)[32] {
      scf.for %arg1 = %c0 to %c128 step %c1 {
        "some_op"() : () -> ()
      }
    }
    return
  }
}

// -----
module {
  func.func @warp_scf_for_broadcasted_result(%arg0: index) -> vector<1xf32> {
    %c128 = arith.constant 128 : index
    %c1 = arith.constant 1 : index
    %c0 = arith.constant 0 : index
    %0 = gpu.warp_execute_on_lane_0(%arg0)[32] -> (vector<1xf32>) {
      %1 = "some_def"() : () -> vector<1xf32>
      %2 = scf.for %arg1 = %c0 to %c128 step %c1 iter_args(%arg2 = %1) -> (vector<1xf32>) {
        %3 = "some_op"(%arg2) : (vector<1xf32>) -> vector<1xf32>
        scf.yield %3 : vector<1xf32>
      }
      gpu.yield %2 : vector<1xf32>
    }
    return %0 : vector<1xf32>
  }
}

// -----
#map = affine_map<()[s0] -> (s0 * 128 + 128)>
#map1 = affine_map<()[s0] -> (s0 * 4 + 128)>
#map2 = affine_map<()[s0] -> (s0 * 4)>
module {
  func.func @warp_scf_for_multiple_yield(%arg0: index, %arg1: memref<?xf32>, %arg2: memref<?xf32>) {
    %c256 = arith.constant 256 : index
    %c128 = arith.constant 128 : index
    %c1 = arith.constant 1 : index
    %c0 = arith.constant 0 : index
    %cst = arith.constant 0.000000e+00 : f32
    %0:3 = gpu.warp_execute_on_lane_0(%arg0)[32] -> (vector<1xf32>, vector<4xf32>, vector<4xf32>) {
      %3 = "some_def"() : () -> vector<32xf32>
      %4 = vector.transfer_read %arg2[%c0], %cst {in_bounds = [true]} : memref<?xf32>, vector<128xf32>
      %5 = vector.transfer_read %arg2[%c128], %cst {in_bounds = [true]} : memref<?xf32>, vector<128xf32>
      %6:2 = scf.for %arg3 = %c0 to %c128 step %c1 iter_args(%arg4 = %4, %arg5 = %5) -> (vector<128xf32>, vector<128xf32>) {
        %7 = affine.apply #map()[%arg3]
        %8 = affine.apply #map1()[%arg3]
        %9 = vector.transfer_read %arg1[%7], %cst {in_bounds = [true]} : memref<?xf32>, vector<128xf32>
        %10 = vector.transfer_read %arg1[%8], %cst {in_bounds = [true]} : memref<?xf32>, vector<128xf32>
        %11 = arith.addf %9, %arg4 : vector<128xf32>
        %12 = arith.addf %10, %arg5 : vector<128xf32>
        scf.yield %11, %12 : vector<128xf32>, vector<128xf32>
      }
      gpu.yield %3, %6#0, %6#1 : vector<32xf32>, vector<128xf32>, vector<128xf32>
    }
    %1 = affine.apply #map2()[%arg0]
    vector.transfer_write %0#1, %arg2[%1] {in_bounds = [true]} : vector<4xf32>, memref<?xf32>
    %2 = affine.apply #map1()[%arg0]
    vector.transfer_write %0#2, %arg2[%2] {in_bounds = [true]} : vector<4xf32>, memref<?xf32>
    "some_use"(%0#0) : (vector<1xf32>) -> ()
    return
  }
}

// -----
module {
  func.func @warp_scf_for_unused_for_result(%arg0: index) {
    %c128 = arith.constant 128 : index
    %c1 = arith.constant 1 : index
    %c0 = arith.constant 0 : index
    %0 = gpu.warp_execute_on_lane_0(%arg0)[32] -> (vector<4xf32>) {
      %1 = "some_def"() : () -> vector<128xf32>
      %2 = "some_def"() : () -> vector<128xf32>
      %3:2 = scf.for %arg1 = %c0 to %c128 step %c1 iter_args(%arg2 = %1, %arg3 = %2) -> (vector<128xf32>, vector<128xf32>) {
        %4 = arith.addi %arg1, %c1 : index
        %5 = "some_def"(%arg3, %4) : (vector<128xf32>, index) -> vector<128xf32>
        %6 = "some_def"(%4, %arg2, %5) : (index, vector<128xf32>, vector<128xf32>) -> vector<128xf32>
        scf.yield %6, %5 : vector<128xf32>, vector<128xf32>
      }
      gpu.yield %3#0 : vector<128xf32>
    }
    "some_use"(%0) : (vector<4xf32>) -> ()
    return
  }
}

// -----
module {
  func.func @warp_scf_for_swapped_for_results(%arg0: index) {
    %c128 = arith.constant 128 : index
    %c1 = arith.constant 1 : index
    %c0 = arith.constant 0 : index
    %0:3 = gpu.warp_execute_on_lane_0(%arg0)[32] -> (vector<4xf32>, vector<4xf32>, vector<8xf32>) {
      %1 = "some_def"() : () -> vector<256xf32>
      %2 = "some_def"() : () -> vector<128xf32>
      %3 = "some_def"() : () -> vector<128xf32>
      %4:3 = scf.for %arg1 = %c0 to %c128 step %c1 iter_args(%arg2 = %1, %arg3 = %2, %arg4 = %3) -> (vector<256xf32>, vector<128xf32>, vector<128xf32>) {
        %5 = "some_def_1"(%arg2) : (vector<256xf32>) -> vector<256xf32>
        %6 = "some_def_2"(%arg3) : (vector<128xf32>) -> vector<128xf32>
        %7 = "some_def_3"(%arg4) : (vector<128xf32>) -> vector<128xf32>
        scf.yield %5, %6, %7 : vector<256xf32>, vector<128xf32>, vector<128xf32>
      }
      gpu.yield %4#2, %4#1, %4#0 : vector<128xf32>, vector<128xf32>, vector<256xf32>
    }
    "some_use_1"(%0#0) : (vector<4xf32>) -> ()
    "some_use_2"(%0#1) : (vector<4xf32>) -> ()
    "some_use_3"(%0#2) : (vector<8xf32>) -> ()
    return
  }
}

// -----
module {
  func.func @vector_reduction(%arg0: index) -> f32 {
    %0 = gpu.warp_execute_on_lane_0(%arg0)[32] -> (f32) {
      %1 = "some_def"() : () -> vector<32xf32>
      %2 = vector.reduction <add>, %1 : vector<32xf32> into f32
      gpu.yield %2 : f32
    }
    return %0 : f32
  }
}

// -----
module {
  func.func @warp_distribute(%arg0: index, %arg1: memref<128xf32>, %arg2: memref<128xf32>) {
    %cst = arith.constant 0.000000e+00 : f32
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c128 = arith.constant 128 : index
    %cst_0 = arith.constant 0.000000e+00 : f32
    gpu.warp_execute_on_lane_0(%arg0)[32] {
      %cst_1 = arith.constant dense<2.621440e+05> : vector<1xf32>
      %0 = "some_def"() : () -> vector<4096xf32>
      %1 = vector.reduction <add>, %0, %cst : vector<4096xf32> into f32
      %2 = vector.broadcast %1 : f32 to vector<1xf32>
      %3 = arith.divf %2, %cst_1 : vector<1xf32>
      scf.for %arg3 = %c0 to %c128 step %c1 {
        %4 = vector.transfer_read %arg1[%arg3], %cst_0 {in_bounds = [true]} : memref<128xf32>, vector<1xf32>
        %5 = arith.subf %4, %3 : vector<1xf32>
        vector.transfer_write %5, %arg2[%arg3] : vector<1xf32>, memref<128xf32>
      }
    }
    return
  }
}

// -----
module {
  func.func @vector_reduction(%arg0: index, %arg1: memref<4x2x32xf32>, %arg2: memref<f32>) {
    %c0 = arith.constant 0 : index
    %cst = arith.constant 0.000000e+00 : f32
    gpu.warp_execute_on_lane_0(%arg0)[32] {
      %0 = vector.transfer_read %arg1[%c0, %c0, %c0], %cst {in_bounds = [true]} : memref<4x2x32xf32>, vector<32xf32>
      %1 = vector.transfer_read %arg2[], %cst : memref<f32>, vector<f32>
      %2 = vector.extract %1[] : f32 from vector<f32>
      %3 = vector.reduction <add>, %0 : vector<32xf32> into f32
      %4 = arith.addf %3, %2 : f32
      %5 = vector.broadcast %4 : f32 to vector<f32>
      vector.transfer_write %5, %arg2[] : vector<f32>, memref<f32>
    }
    return
  }
}

// -----
module {
  func.func @vector_reduction_large(%arg0: index) -> f32 {
    %0 = gpu.warp_execute_on_lane_0(%arg0)[32] -> (f32) {
      %1 = "some_def"() : () -> vector<64xf32>
      %2 = vector.reduction <add>, %1 : vector<64xf32> into f32
      gpu.yield %2 : f32
    }
    return %0 : f32
  }
}

// -----
module {
  func.func @vector_reduction_acc(%arg0: index) -> f32 {
    %0 = gpu.warp_execute_on_lane_0(%arg0)[32] -> (f32) {
      %1 = "some_def"() : () -> vector<64xf32>
      %2 = "some_def"() : () -> f32
      %3 = vector.reduction <add>, %1, %2 : vector<64xf32> into f32
      gpu.yield %3 : f32
    }
    return %0 : f32
  }
}

// -----
module {
  func.func @warp_duplicate_yield(%arg0: index) -> (vector<1xf32>, vector<1xf32>) {
    %0:2 = gpu.warp_execute_on_lane_0(%arg0)[32] -> (vector<1xf32>, vector<1xf32>) {
      %1 = "some_def"() : () -> vector<32xf32>
      %2 = "some_def"() : () -> vector<32xf32>
      %3 = arith.addf %1, %2 : vector<32xf32>
      %4 = arith.addf %1, %1 : vector<32xf32>
      gpu.yield %3, %4 : vector<32xf32>, vector<32xf32>
    }
    return %0#0, %0#1 : vector<1xf32>, vector<1xf32>
  }
}

// -----
module {
  func.func @warp_constant(%arg0: index) -> vector<1xf32> {
    %0 = gpu.warp_execute_on_lane_0(%arg0)[32] -> (vector<1xf32>) {
      %cst = arith.constant dense<2.000000e+00> : vector<32xf32>
      gpu.yield %cst : vector<32xf32>
    }
    return %0 : vector<1xf32>
  }
}

// -----
module {
  func.func @vector_extract_1d(%arg0: index) -> f32 {
    %0 = gpu.warp_execute_on_lane_0(%arg0)[32] -> (f32) {
      %1 = "some_def"() : () -> vector<64xf32>
      %2 = vector.extract %1[9] : f32 from vector<64xf32>
      gpu.yield %2 : f32
    }
    return %0 : f32
  }
}

// -----
module {
  func.func @vector_extract_2d(%arg0: index) -> vector<3xf32> {
    %0 = gpu.warp_execute_on_lane_0(%arg0)[32] -> (vector<3xf32>) {
      %1 = "some_def"() : () -> vector<5x96xf32>
      %2 = vector.extract %1[2] : vector<96xf32> from vector<5x96xf32>
      gpu.yield %2 : vector<96xf32>
    }
    return %0 : vector<3xf32>
  }
}

// -----
module {
  func.func @vector_extract_2d_broadcast_scalar(%arg0: index) -> f32 {
    %0 = gpu.warp_execute_on_lane_0(%arg0)[32] -> (f32) {
      %1 = "some_def"() : () -> vector<5x96xf32>
      %2 = vector.extract %1[1, 2] : f32 from vector<5x96xf32>
      gpu.yield %2 : f32
    }
    return %0 : f32
  }
}

// -----
module {
  func.func @vector_extract_2d_broadcast(%arg0: index) -> vector<96xf32> {
    %0 = gpu.warp_execute_on_lane_0(%arg0)[32] -> (vector<96xf32>) {
      %1 = "some_def"() : () -> vector<5x96xf32>
      %2 = vector.extract %1[2] : vector<96xf32> from vector<5x96xf32>
      gpu.yield %2 : vector<96xf32>
    }
    return %0 : vector<96xf32>
  }
}

// -----
module {
  func.func @vector_extract_3d(%arg0: index) -> vector<4x96xf32> {
    %0 = gpu.warp_execute_on_lane_0(%arg0)[32] -> (vector<4x96xf32>) {
      %1 = "some_def"() : () -> vector<8x128x96xf32>
      %2 = vector.extract %1[2] : vector<128x96xf32> from vector<8x128x96xf32>
      gpu.yield %2 : vector<128x96xf32>
    }
    return %0 : vector<4x96xf32>
  }
}

// -----
module {
  func.func @vector_extract_0d(%arg0: index) -> f32 {
    %0 = gpu.warp_execute_on_lane_0(%arg0)[32] -> (f32) {
      %1 = "some_def"() : () -> vector<f32>
      %2 = vector.extract %1[] : f32 from vector<f32>
      gpu.yield %2 : f32
    }
    return %0 : f32
  }
}

// -----
module {
  func.func @vector_extract_1element(%arg0: index) -> f32 {
    %0 = gpu.warp_execute_on_lane_0(%arg0)[32] -> (f32) {
      %1 = "some_def"() : () -> vector<1xf32>
      %c0 = arith.constant 0 : index
      %2 = vector.extract %1[%c0] : f32 from vector<1xf32>
      gpu.yield %2 : f32
    }
    return %0 : f32
  }
}

// -----
module {
  func.func @vector_extract_1d(%arg0: index, %arg1: index) -> f32 {
    %0 = gpu.warp_execute_on_lane_0(%arg0)[32] -> (f32) {
      %1 = "some_def"() : () -> vector<96xf32>
      %2 = vector.extract %1[%arg1] : f32 from vector<96xf32>
      gpu.yield %2 : f32
    }
    return %0 : f32
  }
}

// -----
module {
  func.func @vector_extract_1d_index(%arg0: index, %arg1: index) -> index {
    %0 = gpu.warp_execute_on_lane_0(%arg0)[32] -> (index) {
      %1 = "some_def"() : () -> vector<96xindex>
      %2 = vector.extract %1[%arg1] : index from vector<96xindex>
      gpu.yield %2 : index
    }
    return %0 : index
  }
}

// -----
module {
  func.func @lane_dependent_warp_propagate_read(%arg0: index, %arg1: memref<1x1024xf32>, %arg2: memref<1x1024xf32>) {
    %c0 = arith.constant 0 : index
    %cst = arith.constant 0.000000e+00 : f32
    %0 = gpu.warp_execute_on_lane_0(%arg0)[32] -> (vector<1x1xf32>) {
      %1 = vector.transfer_read %arg1[%c0, %c0], %cst : memref<1x1024xf32>, vector<1x32xf32>
      gpu.yield %1 : vector<1x32xf32>
    }
    vector.transfer_write %0, %arg2[%c0, %arg0] : vector<1x1xf32>, memref<1x1024xf32>
    return
  }
}

// -----
module {
  func.func @warp_propagate_read_3d(%arg0: index, %arg1: memref<32x4x32xf32>) -> vector<1x1x4xf32> {
    %c0 = arith.constant 0 : index
    %cst = arith.constant 0.000000e+00 : f32
    %0 = gpu.warp_execute_on_lane_0(%arg0)[1024] -> (vector<1x1x4xf32>) {
      %1 = vector.transfer_read %arg1[%c0, %c0, %c0], %cst : memref<32x4x32xf32>, vector<32x4x32xf32>
      gpu.yield %1 : vector<32x4x32xf32>
    }
    return %0 : vector<1x1x4xf32>
  }
}

// -----
#map = affine_map<(d0, d1) -> (d0, 0)>
module {
  func.func @warp_propagate_read_broadcast(%arg0: index, %arg1: memref<32x1xf32>) -> vector<1x4xf32> {
    %c0 = arith.constant 0 : index
    %cst = arith.constant 0.000000e+00 : f32
    %0 = gpu.warp_execute_on_lane_0(%arg0)[512] -> (vector<1x4xf32>) {
      %1 = vector.transfer_read %arg1[%c0, %c0], %cst {in_bounds = [true, true], permutation_map = #map} : memref<32x1xf32>, vector<32x64xf32>
      gpu.yield %1 : vector<32x64xf32>
    }
    return %0 : vector<1x4xf32>
  }
}

// -----
module {
  func.func @dont_duplicate_read(%arg0: index, %arg1: memref<1024xf32>) -> vector<1xf32> {
    %c0 = arith.constant 0 : index
    %cst = arith.constant 0.000000e+00 : f32
    %0 = gpu.warp_execute_on_lane_0(%arg0)[32] -> (vector<1xf32>) {
      %1 = vector.transfer_read %arg1[%c0], %cst : memref<1024xf32>, vector<32xf32>
      "blocking_use"(%1) : (vector<32xf32>) -> ()
      gpu.yield %1 : vector<32xf32>
    }
    return %0 : vector<1xf32>
  }
}

// -----
module {
  func.func @dedup(%arg0: index, %arg1: vector<4xf32>, %arg2: vector<4xf32>) -> (vector<1xf32>, vector<1xf32>) {
    %0:2 = gpu.warp_execute_on_lane_0(%arg0)[32] args(%arg1, %arg2 : vector<4xf32>, vector<4xf32>) -> (vector<1xf32>, vector<1xf32>) {
    ^bb0(%arg3: vector<128xf32>, %arg4: vector<128xf32>):
      %1 = "some_def"(%arg3) : (vector<128xf32>) -> vector<32xf32>
      gpu.yield %1, %1 : vector<32xf32>, vector<32xf32>
    }
    return %0#0, %0#1 : vector<1xf32>, vector<1xf32>
  }
}

// -----
module {
  func.func @warp_execute_has_broadcast_semantics(%arg0: index, %arg1: f32, %arg2: vector<f32>, %arg3: vector<1xf32>, %arg4: vector<1x1xf32>) -> (f32, vector<f32>, vector<1xf32>, vector<1x1xf32>) {
    %0:4 = gpu.warp_execute_on_lane_0(%arg0)[32] args(%arg1, %arg2, %arg3, %arg4 : f32, vector<f32>, vector<1xf32>, vector<1x1xf32>) -> (f32, vector<f32>, vector<1xf32>, vector<1x1xf32>) {
    ^bb0(%arg5: f32, %arg6: vector<f32>, %arg7: vector<1xf32>, %arg8: vector<1x1xf32>):
      %1 = "some_def_0"(%arg5) : (f32) -> f32
      %2 = "some_def_1"(%arg6) : (vector<f32>) -> vector<f32>
      %3 = "some_def_1"(%arg7) : (vector<1xf32>) -> vector<1xf32>
      %4 = "some_def_1"(%arg8) : (vector<1x1xf32>) -> vector<1x1xf32>
      gpu.yield %1, %2, %3, %4 : f32, vector<f32>, vector<1xf32>, vector<1x1xf32>
    }
    return %0#0, %0#1, %0#2, %0#3 : f32, vector<f32>, vector<1xf32>, vector<1x1xf32>
  }
}

// -----
module {
  func.func @warp_execute_nd_distribute(%arg0: index, %arg1: vector<1x64x1xf32>, %arg2: vector<1x2x128xf32>) -> (vector<1x64x1xf32>, vector<1x2x128xf32>) {
    %0:2 = gpu.warp_execute_on_lane_0(%arg0)[32] args(%arg1, %arg2 : vector<1x64x1xf32>, vector<1x2x128xf32>) -> (vector<1x64x1xf32>, vector<1x2x128xf32>) {
    ^bb0(%arg3: vector<32x64x1xf32>, %arg4: vector<1x64x128xf32>):
      %1 = "some_def_0"(%arg3) : (vector<32x64x1xf32>) -> vector<32x64x1xf32>
      %2 = "some_def_1"(%arg4) : (vector<1x64x128xf32>) -> vector<1x64x128xf32>
      gpu.yield %1, %2 : vector<32x64x1xf32>, vector<1x64x128xf32>
    }
    return %0#0, %0#1 : vector<1x64x1xf32>, vector<1x2x128xf32>
  }
}

// -----
module {
  func.func @vector_insert_1d(%arg0: index, %arg1: index) -> vector<3xf32> {
    %0 = gpu.warp_execute_on_lane_0(%arg0)[32] -> (vector<3xf32>) {
      %1 = "some_def"() : () -> vector<96xf32>
      %2 = "another_def"() : () -> f32
      %3 = vector.insert %2, %1 [%arg1] : f32 into vector<96xf32>
      gpu.yield %3 : vector<96xf32>
    }
    return %0 : vector<3xf32>
  }
}

// -----
module {
  func.func @vector_insert_1d_broadcast(%arg0: index, %arg1: index) -> vector<96xf32> {
    %0 = gpu.warp_execute_on_lane_0(%arg0)[32] -> (vector<96xf32>) {
      %1 = "some_def"() : () -> vector<96xf32>
      %2 = "another_def"() : () -> f32
      %3 = vector.insert %2, %1 [%arg1] : f32 into vector<96xf32>
      gpu.yield %3 : vector<96xf32>
    }
    return %0 : vector<96xf32>
  }
}

// -----
module {
  func.func @vector_insert_0d(%arg0: index) -> vector<f32> {
    %0 = gpu.warp_execute_on_lane_0(%arg0)[32] -> (vector<f32>) {
      %1 = "some_def"() : () -> vector<f32>
      %2 = "another_def"() : () -> f32
      %3 = vector.insert %2, %1 [] : f32 into vector<f32>
      gpu.yield %3 : vector<f32>
    }
    return %0 : vector<f32>
  }
}

// -----
module {
  func.func @vector_insert_1d(%arg0: index) -> vector<3xf32> {
    %0 = gpu.warp_execute_on_lane_0(%arg0)[32] -> (vector<3xf32>) {
      %1 = "some_def"() : () -> vector<96xf32>
      %2 = "another_def"() : () -> f32
      %3 = vector.insert %2, %1 [76] : f32 into vector<96xf32>
      gpu.yield %3 : vector<96xf32>
    }
    return %0 : vector<3xf32>
  }
}

// -----
module {
  func.func @vector_insert_2d_distr_src(%arg0: index) -> vector<4x3xf32> {
    %0 = gpu.warp_execute_on_lane_0(%arg0)[32] -> (vector<4x3xf32>) {
      %1 = "some_def"() : () -> vector<4x96xf32>
      %2 = "another_def"() : () -> vector<96xf32>
      %3 = vector.insert %2, %1 [2] : vector<96xf32> into vector<4x96xf32>
      gpu.yield %3 : vector<4x96xf32>
    }
    return %0 : vector<4x3xf32>
  }
}

// -----
module {
  func.func @vector_insert_2d_distr_pos(%arg0: index) -> vector<4x96xf32> {
    %0 = gpu.warp_execute_on_lane_0(%arg0)[32] -> (vector<4x96xf32>) {
      %1 = "some_def"() : () -> vector<128x96xf32>
      %2 = "another_def"() : () -> vector<96xf32>
      %3 = vector.insert %2, %1 [79] : vector<96xf32> into vector<128x96xf32>
      gpu.yield %3 : vector<128x96xf32>
    }
    return %0 : vector<4x96xf32>
  }
}

// -----
module {
  func.func @vector_insert_2d_broadcast(%arg0: index) -> vector<4x96xf32> {
    %0 = gpu.warp_execute_on_lane_0(%arg0)[32] -> (vector<4x96xf32>) {
      %1 = "some_def"() : () -> vector<4x96xf32>
      %2 = "another_def"() : () -> vector<96xf32>
      %3 = vector.insert %2, %1 [2] : vector<96xf32> into vector<4x96xf32>
      gpu.yield %3 : vector<4x96xf32>
    }
    return %0 : vector<4x96xf32>
  }
}

// -----
module {
  func.func @vector_extract_strided_slice_2d_distr_inner(%arg0: index) -> vector<24x1xf32> {
    %0 = gpu.warp_execute_on_lane_0(%arg0)[32] -> (vector<24x1xf32>) {
      %1 = "some_def"() : () -> vector<64x32xf32>
      %2 = vector.extract_strided_slice %1 {offsets = [8], sizes = [24], strides = [1]} : vector<64x32xf32> to vector<24x32xf32>
      gpu.yield %2 : vector<24x32xf32>
    }
    return %0 : vector<24x1xf32>
  }
}

// -----
module {
  func.func @vector_extract_strided_slice_2d_distr_outer(%arg0: index) -> vector<1x8xf32> {
    %0 = gpu.warp_execute_on_lane_0(%arg0)[32] -> (vector<1x8xf32>) {
      %1 = "some_def"() : () -> vector<32x64xf32>
      %2 = vector.extract_strided_slice %1 {offsets = [0, 12], sizes = [32, 8], strides = [1, 1]} : vector<32x64xf32> to vector<32x8xf32>
      gpu.yield %2 : vector<32x8xf32>
    }
    return %0 : vector<1x8xf32>
  }
}

// -----
module {
  func.func @vector_insert_strided_slice_1d_to_2d(%arg0: index) -> vector<64x1xf32> {
    %0 = gpu.warp_execute_on_lane_0(%arg0)[32] -> (vector<64x1xf32>) {
      %1 = "some_def"() : () -> vector<32xf32>
      %2 = "some_def"() : () -> vector<64x32xf32>
      %3 = vector.insert_strided_slice %1, %2 {offsets = [18, 0], strides = [1]} : vector<32xf32> into vector<64x32xf32>
      gpu.yield %3 : vector<64x32xf32>
    }
    return %0 : vector<64x1xf32>
  }
}

// -----
module {
  func.func @vector_insert_strided_slice_2d_to_2d(%arg0: index) -> vector<64x1xf32> {
    %0 = gpu.warp_execute_on_lane_0(%arg0)[32] -> (vector<64x1xf32>) {
      %1 = "some_def"() : () -> vector<16x32xf32>
      %2 = "some_def"() : () -> vector<64x32xf32>
      %3 = vector.insert_strided_slice %1, %2 {offsets = [36, 0], strides = [1, 1]} : vector<16x32xf32> into vector<64x32xf32>
      gpu.yield %3 : vector<64x32xf32>
    }
    return %0 : vector<64x1xf32>
  }
}

// -----
module {
  func.func @transfer_read_prop_operands(%arg0: vector<1x2xindex>, %arg1: memref<1x4x2xi32>, %arg2: memref<1x4x1024xf32>) -> vector<2xf32> {
    %thread_id_x = gpu.thread_id  x
    %c0 = arith.constant 0 : index
    %c0_0 = arith.constant 0 : index
    %cst = arith.constant dense<0> : vector<1x64xi32>
    %cst_1 = arith.constant dense<true> : vector<1x64xi1>
    %cst_2 = arith.constant dense<3> : vector<64xindex>
    %cst_3 = arith.constant dense<0> : vector<64xindex>
    %cst_4 = arith.constant 0.000000e+00 : f32
    %0 = gpu.warp_execute_on_lane_0(%thread_id_x)[32] args(%arg0 : vector<1x2xindex>) -> (vector<2xf32>) {
    ^bb0(%arg3: vector<1x64xindex>):
      %1 = vector.gather %arg1[%c0_0, %c0_0, %c0_0] [%arg3], %cst_1, %cst : memref<1x4x2xi32>, vector<1x64xindex>, vector<1x64xi1>, vector<1x64xi32> into vector<1x64xi32>
      %2 = vector.extract %1[0] : vector<64xi32> from vector<1x64xi32>
      %3 = arith.index_cast %2 : vector<64xi32> to vector<64xindex>
      %4 = vector.extract %3[%c0] : index from vector<64xindex>
      %5 = vector.transfer_read %arg2[%c0_0, %4, %c0_0], %cst_4 {in_bounds = [true]} : memref<1x4x1024xf32>, vector<64xf32>
      gpu.yield %5 : vector<64xf32>
    }
    return %0 : vector<2xf32>
  }
}

// -----
module {
  func.func @dont_fold_vector_broadcast(%arg0: index) {
    %0 = gpu.warp_execute_on_lane_0(%arg0)[32] -> (vector<1x2xf32>) {
      %1 = "some_def"() : () -> vector<64xf32>
      %2 = vector.broadcast %1 : vector<64xf32> to vector<1x64xf32>
      gpu.yield %2 : vector<1x64xf32>
    }
    vector.print %0 : vector<1x2xf32>
    return
  }
}

// -----
module {
  func.func @warp_propagate_shape_cast(%arg0: index, %arg1: memref<32x4x32xf32>) -> vector<4xf32> {
    %c0 = arith.constant 0 : index
    %cst = arith.constant 0.000000e+00 : f32
    %0 = gpu.warp_execute_on_lane_0(%arg0)[1024] -> (vector<4xf32>) {
      %1 = vector.transfer_read %arg1[%c0, %c0, %c0], %cst : memref<32x4x32xf32>, vector<32x4x32xf32>
      %2 = vector.shape_cast %1 : vector<32x4x32xf32> to vector<4096xf32>
      gpu.yield %2 : vector<4096xf32>
    }
    return %0 : vector<4xf32>
  }
}

// -----
module {
  func.func @warp_propagate_uniform_transfer_read(%arg0: index, %arg1: memref<4096xf32>, %arg2: index) -> vector<1xf32> {
    %cst = arith.constant 0.000000e+00 : f32
    %0 = gpu.warp_execute_on_lane_0(%arg0)[64] -> (vector<1xf32>) {
      %1 = vector.transfer_read %arg1[%arg2], %cst {in_bounds = [true]} : memref<4096xf32>, vector<1xf32>
      gpu.yield %1 : vector<1xf32>
    }
    return %0 : vector<1xf32>
  }
}

// -----
module {
  func.func @warp_propagate_multi_transfer_read(%arg0: index, %arg1: memref<4096xf32>, %arg2: index, %arg3: index) -> (vector<1xf32>, vector<1xf32>) {
    %cst = arith.constant 0.000000e+00 : f32
    %0:2 = gpu.warp_execute_on_lane_0(%arg0)[64] -> (vector<1xf32>, vector<1xf32>) {
      %1 = vector.transfer_read %arg1[%arg2], %cst {in_bounds = [true]} : memref<4096xf32>, vector<1xf32>
      "some_use"(%1) : (vector<1xf32>) -> ()
      %2 = vector.transfer_read %arg1[%arg3], %cst {in_bounds = [true]} : memref<4096xf32>, vector<1xf32>
      gpu.yield %1, %2 : vector<1xf32>, vector<1xf32>
    }
    return %0#0, %0#1 : vector<1xf32>, vector<1xf32>
  }
}

// -----
module {
  func.func @warp_propagate_dead_user_multi_read(%arg0: index, %arg1: memref<4096xf32>, %arg2: index, %arg3: index) -> vector<1xf32> {
    %cst = arith.constant 0.000000e+00 : f32
    %0 = gpu.warp_execute_on_lane_0(%arg0)[64] -> (vector<1xf32>) {
      %1 = vector.transfer_read %arg1[%arg2], %cst {in_bounds = [true]} : memref<4096xf32>, vector<64xf32>
      %2 = vector.transfer_read %arg1[%arg3], %cst {in_bounds = [true]} : memref<4096xf32>, vector<64xf32>
      %3 = arith.maximumf %1, %2 : vector<64xf32>
      gpu.yield %3 : vector<64xf32>
    }
    return %0 : vector<1xf32>
  }
}

// -----
module {
  func.func @warp_propagate_masked_write(%arg0: index, %arg1: memref<4096xf32>) {
    %c0 = arith.constant 0 : index
    gpu.warp_execute_on_lane_0(%arg0)[32] {
      %0 = "mask_def_0"() : () -> vector<4096xi1>
      %1 = "mask_def_1"() : () -> vector<32xi1>
      %2 = "some_def_0"() : () -> vector<4096xf32>
      %3 = "some_def_1"() : () -> vector<32xf32>
      vector.transfer_write %2, %arg1[%c0], %0 : vector<4096xf32>, memref<4096xf32>
      vector.transfer_write %3, %arg1[%c0], %1 : vector<32xf32>, memref<4096xf32>
    }
    return
  }
}

// -----
module {
  func.func @warp_propagate_masked_transfer_read(%arg0: index, %arg1: memref<4096x4096xf32>, %arg2: index) -> (vector<2xf32>, vector<2x2xf32>) {
    %cst = arith.constant 0.000000e+00 : f32
    %c0 = arith.constant 0 : index
    %0:2 = gpu.warp_execute_on_lane_0(%arg0)[64] -> (vector<2xf32>, vector<2x2xf32>) {
      %1 = "mask_def_0"() : () -> vector<128xi1>
      %2 = vector.transfer_read %arg1[%c0, %arg2], %cst, %1 {in_bounds = [true]} : memref<4096x4096xf32>, vector<128xf32>
      %3 = "mask_def_1"() : () -> vector<128x2xi1>
      %4 = vector.transfer_read %arg1[%c0, %arg2], %cst, %3 {in_bounds = [true, true]} : memref<4096x4096xf32>, vector<128x2xf32>
      gpu.yield %2, %4 : vector<128xf32>, vector<128x2xf32>
    }
    return %0#0, %0#1 : vector<2xf32>, vector<2x2xf32>
  }
}

// -----
#map = affine_map<(d0, d1) -> (d0)>
module {
  func.func @warp_propagate_nontrivial_map_masked_transfer_read(%arg0: index, %arg1: memref<4096x4096xf32>, %arg2: index) -> vector<2xf32> {
    %cst = arith.constant 0.000000e+00 : f32
    %c0 = arith.constant 0 : index
    %0 = gpu.warp_execute_on_lane_0(%arg0)[64] -> (vector<2xf32>) {
      %1 = "mask_def_0"() : () -> vector<128xi1>
      %2 = vector.transfer_read %arg1[%arg2, %c0], %cst, %1 {in_bounds = [true], permutation_map = #map} : memref<4096x4096xf32>, vector<128xf32>
      gpu.yield %2 : vector<128xf32>
    }
    return %0 : vector<2xf32>
  }
}

// -----
module {
  func.func @warp_propagate_masked_transfer_read_shared_mask(%arg0: index, %arg1: memref<4096x4096xf32>, %arg2: index, %arg3: index, %arg4: index) -> (vector<2xf32>, vector<2xf32>) {
    %cst = arith.constant 0.000000e+00 : f32
    %c0 = arith.constant 0 : index
    %0:2 = gpu.warp_execute_on_lane_0(%arg0)[64] -> (vector<2xf32>, vector<2xf32>) {
      %1 = vector.create_mask %arg4 : vector<128xi1>
      %2 = vector.transfer_read %arg1[%c0, %arg2], %cst, %1 {in_bounds = [true]} : memref<4096x4096xf32>, vector<128xf32>
      %3 = vector.transfer_read %arg1[%c0, %arg3], %cst, %1 {in_bounds = [true]} : memref<4096x4096xf32>, vector<128xf32>
      gpu.yield %2, %3 : vector<128xf32>, vector<128xf32>
    }
    return %0#0, %0#1 : vector<2xf32>, vector<2xf32>
  }
}

// -----
module {
  func.func @warp_propagate_unconnected_read_write(%arg0: index, %arg1: memref<128xf32>, %arg2: f32) -> (vector<2xf32>, vector<4xf32>) {
    %cst = arith.constant 0.000000e+00 : f32
    %c0 = arith.constant 0 : index
    %0:2 = gpu.warp_execute_on_lane_0(%arg0)[32] -> (vector<2xf32>, vector<4xf32>) {
      %cst_0 = arith.constant dense<2.000000e+00> : vector<128xf32>
      %1 = vector.transfer_read %arg1[%c0], %cst {in_bounds = [true]} : memref<128xf32>, vector<128xf32>
      vector.transfer_write %cst_0, %arg1[%c0] : vector<128xf32>, memref<128xf32>
      %2 = vector.broadcast %arg2 : f32 to vector<64xf32>
      gpu.yield %2, %1 : vector<64xf32>, vector<128xf32>
    }
    return %0#0, %0#1 : vector<2xf32>, vector<4xf32>
  }
}

// -----
module {
  func.func @warp_propagate_constant_mask(%arg0: index) -> vector<1xi1> {
    %0 = gpu.warp_execute_on_lane_0(%arg0)[32] -> (vector<1xi1>) {
      %1 = vector.constant_mask [1] : vector<32xi1>
      gpu.yield %1 : vector<32xi1>
    }
    return %0 : vector<1xi1>
  }
}

// -----
module {
  func.func @warp_propagate_create_mask(%arg0: index, %arg1: index) -> vector<1xi1> {
    %0 = gpu.warp_execute_on_lane_0(%arg0)[32] -> (vector<1xi1>) {
      %1 = vector.create_mask %arg1 : vector<32xi1>
      gpu.yield %1 : vector<32xi1>
    }
    return %0 : vector<1xi1>
  }
}

// -----
module {
  func.func @warp_propagate_multi_dim_create_mask(%arg0: index, %arg1: index, %arg2: index, %arg3: index) -> vector<1x2x4xi1> {
    %0 = gpu.warp_execute_on_lane_0(%arg0)[32] -> (vector<1x2x4xi1>) {
      %1 = vector.create_mask %arg1, %arg2, %arg3 : vector<16x4x4xi1>
      gpu.yield %1 : vector<16x4x4xi1>
    }
    return %0 : vector<1x2x4xi1>
  }
}

// -----
module {
  func.func @warp_propagate_multi_dim_constant_mask(%arg0: index) -> vector<1x2x4xi1> {
    %0 = gpu.warp_execute_on_lane_0(%arg0)[32] -> (vector<1x2x4xi1>) {
      %1 = vector.constant_mask [1, 1, 2] : vector<16x4x4xi1>
      gpu.yield %1 : vector<16x4x4xi1>
    }
    return %0 : vector<1x2x4xi1>
  }
}

// -----
module {
  func.func @warp_propagate_nd_write(%arg0: index, %arg1: memref<4x1024xf32>) {
    %c0 = arith.constant 0 : index
    gpu.warp_execute_on_lane_0(%arg0)[32] {
      %0 = "some_def"() : () -> vector<4x1024xf32>
      vector.transfer_write %0, %arg1[%c0, %c0] : vector<4x1024xf32>, memref<4x1024xf32>
    }
    return
  }
}

// -----
module {
  func.func @warp_propagate_duplicated_operands_in_yield(%arg0: index) {
    %0:3 = gpu.warp_execute_on_lane_0(%arg0)[32] -> (vector<1xf32>, vector<1xf32>, vector<1xf32>) {
      %1 = "some_def"() : () -> vector<32xf32>
      %2 = "some_other_def"() : () -> vector<32xf32>
      %3 = math.exp %2 : vector<32xf32>
      gpu.yield %3, %1, %1 : vector<32xf32>, vector<32xf32>, vector<32xf32>
    }
    "some_use"(%0#0) : (vector<1xf32>) -> ()
    return
  }
}

// -----
module {
  func.func @warp_step_distribute(%arg0: memref<128xindex>) {
    %0 = gpu.lane_id
    %1 = gpu.warp_execute_on_lane_0(%0)[32] -> (vector<1xindex>) {
      %2 = vector.step : vector<32xindex>
      gpu.yield %2 : vector<32xindex>
    }
    vector.transfer_write %1, %arg0[%0] : vector<1xindex>, memref<128xindex>
    return
  }
}

// -----
module {
  func.func @negative_warp_step_more_than_warp_size(%arg0: index, %arg1: memref<128xindex>) {
    %0 = gpu.warp_execute_on_lane_0(%arg0)[32] -> (vector<2xindex>) {
      %1 = vector.step : vector<64xindex>
      gpu.yield %1 : vector<64xindex>
    }
    vector.transfer_write %0, %arg1[%arg0] : vector<2xindex>, memref<128xindex>
    return
  }
}

// -----
module {
  func.func @warp_scf_if_no_yield_distribute(%arg0: memref<128xindex>, %arg1: i1) {
    %0 = gpu.lane_id
    %c0 = arith.constant 0 : index
    gpu.warp_execute_on_lane_0(%0)[32] {
      %1 = vector.step : vector<32xindex>
      scf.if %arg1 {
        vector.store %1, %arg0[%c0] : memref<128xindex>, vector<32xindex>
      }
    }
    return
  }
}

// -----
module {
  func.func @warp_scf_if_distribute(%arg0: i1) {
    %0 = gpu.lane_id
    %c0 = arith.constant 0 : index
    %1 = gpu.warp_execute_on_lane_0(%0)[32] -> (vector<1xf32>) {
      %2 = vector.step : vector<32xindex>
      %cst = arith.constant dense<2> : vector<32xindex>
      %3 = scf.if %arg0 -> (vector<32xf32>) {
        %4 = "some_op"(%2) : (vector<32xindex>) -> vector<32xf32>
        scf.yield %4 : vector<32xf32>
      } else {
        %4 = "other_op"(%cst) : (vector<32xindex>) -> vector<32xf32>
        scf.yield %4 : vector<32xf32>
      }
      gpu.yield %3 : vector<32xf32>
    }
    "some_use"(%1) : (vector<1xf32>) -> ()
    return
  }
}

// -----
module {
  func.func @dedup_unused_result(%arg0: index) -> vector<1xf32> {
    %0:3 = gpu.warp_execute_on_lane_0(%arg0)[32] -> (vector<1xf32>, vector<2xf32>, vector<1xf32>) {
      %2 = "some_def"() : () -> vector<32xf32>
      %3 = "some_def"() : () -> vector<64xf32>
      gpu.yield %2, %3, %2 : vector<32xf32>, vector<64xf32>, vector<32xf32>
    }
    %1 = "some_use"(%0#2, %0#2) : (vector<1xf32>, vector<1xf32>) -> vector<1xf32>
    return %1 : vector<1xf32>
  }
}

