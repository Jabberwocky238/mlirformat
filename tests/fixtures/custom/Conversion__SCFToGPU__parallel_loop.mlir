module {
  func.func @parallel_loop_bidy_bidx(%arg0: index, %arg1: index, %arg2: index, %arg3: index, %arg4: index, %arg5: memref<?x?xf32>, %arg6: memref<?x?xf32>) {
    %c2 = arith.constant 2 : index
    scf.parallel (%arg7, %arg8) = (%arg0, %arg1) to (%arg2, %arg3) step (%arg4, %c2) {
      %0 = memref.load %arg5[%arg7, %arg8] : memref<?x?xf32>
      memref.store %0, %arg6[%arg8, %arg7] : memref<?x?xf32>
      scf.reduce 
    } {mapping = [#gpu.loop_dim_map<processor = block_y, map = (d0) -> (d0), bound = (d0) -> (d0)>, #gpu.loop_dim_map<processor = block_x, map = (d0) -> (d0), bound = (d0) -> (d0)>]}
    return
  }
}

// -----
module {
  func.func @parallel_loop_tiled(%arg0: index, %arg1: index, %arg2: index, %arg3: index, %arg4: memref<?x?xf32>, %arg5: memref<?x?xf32>) {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c4 = arith.constant 4 : index
    scf.parallel (%arg6, %arg7) = (%arg0, %arg1) to (%arg2, %arg3) step (%c4, %c4) {
      scf.parallel (%arg8, %arg9) = (%c0, %c0) to (%c4, %c4) step (%c1, %c1) {
        %0 = arith.addi %arg6, %arg8 : index
        %1 = arith.addi %arg7, %arg9 : index
        %2 = memref.load %arg4[%0, %1] : memref<?x?xf32>
        memref.store %2, %arg5[%1, %0] : memref<?x?xf32>
        scf.reduce 
      } {mapping = [#gpu.loop_dim_map<processor = thread_y, map = (d0) -> (d0), bound = (d0) -> (d0)>, #gpu.loop_dim_map<processor = thread_x, map = (d0) -> (d0), bound = (d0) -> (d0)>]}
      scf.reduce 
    } {mapping = [#gpu.loop_dim_map<processor = block_y, map = (d0) -> (d0), bound = (d0) -> (d0)>, #gpu.loop_dim_map<processor = block_x, map = (d0) -> (d0), bound = (d0) -> (d0)>]}
    return
  }
}

// -----
module {
  func.func @parallel_loop_bidy_seq(%arg0: index, %arg1: index, %arg2: index, %arg3: index, %arg4: index, %arg5: memref<?x?xf32>, %arg6: memref<?x?xf32>) {
    %c2 = arith.constant 2 : index
    scf.parallel (%arg7, %arg8) = (%arg0, %arg1) to (%arg2, %arg3) step (%arg4, %c2) {
      %0 = memref.load %arg5[%arg7, %arg8] : memref<?x?xf32>
      memref.store %0, %arg6[%arg8, %arg7] : memref<?x?xf32>
      scf.reduce 
    } {mapping = [#gpu.loop_dim_map<processor = block_y, map = (d0) -> (d0), bound = (d0) -> (d0)>, #gpu.loop_dim_map<processor = sequential, map = (d0) -> (d0), bound = (d0) -> (d0)>]}
    return
  }
}

// -----
module {
  func.func @parallel_loop_tiled_seq(%arg0: index, %arg1: index, %arg2: index, %arg3: index, %arg4: memref<?x?xf32>, %arg5: memref<?x?xf32>) {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c4 = arith.constant 4 : index
    scf.parallel (%arg6, %arg7) = (%arg0, %arg1) to (%arg2, %arg3) step (%c4, %c4) {
      scf.parallel (%arg8, %arg9) = (%c0, %c0) to (%c4, %c4) step (%c1, %c1) {
        %0 = arith.addi %arg6, %arg8 : index
        %1 = arith.addi %arg7, %arg9 : index
        %2 = memref.load %arg4[%0, %1] : memref<?x?xf32>
        memref.store %2, %arg5[%1, %0] : memref<?x?xf32>
        scf.reduce 
      } {mapping = [#gpu.loop_dim_map<processor = thread_y, map = (d0) -> (d0), bound = (d0) -> (d0)>, #gpu.loop_dim_map<processor = sequential, map = (d0) -> (d0), bound = (d0) -> (d0)>]}
      scf.reduce 
    } {mapping = [#gpu.loop_dim_map<processor = block_y, map = (d0) -> (d0), bound = (d0) -> (d0)>, #gpu.loop_dim_map<processor = sequential, map = (d0) -> (d0), bound = (d0) -> (d0)>]}
    return
  }
}

// -----
#map = affine_map<(d0)[s0] -> (2, -d0 + s0)>
#map1 = affine_map<(d0)[s0] -> (3, -d0 + s0)>
module {
  func.func @sum(%arg0: memref<?x?xf32, strided<[?, 1], offset: ?>>, %arg1: memref<?x?xf32, strided<[?, 1], offset: ?>>, %arg2: memref<?x?xf32, strided<[?, 1], offset: ?>>) {
    %c1 = arith.constant 1 : index
    %c0 = arith.constant 0 : index
    %c3 = arith.constant 3 : index
    %c2 = arith.constant 2 : index
    %dim = memref.dim %arg0, %c0 : memref<?x?xf32, strided<[?, 1], offset: ?>>
    %dim_0 = memref.dim %arg0, %c1 : memref<?x?xf32, strided<[?, 1], offset: ?>>
    scf.parallel (%arg3, %arg4) = (%c0, %c0) to (%dim, %dim_0) step (%c2, %c3) {
      %dim_1 = memref.dim %arg0, %c0 : memref<?x?xf32, strided<[?, 1], offset: ?>>
      %0 = affine.min #map(%arg3)[%dim_1]
      %1 = arith.muli %0, %0 : index
      %dim_2 = memref.dim %arg0, %c1 : memref<?x?xf32, strided<[?, 1], offset: ?>>
      %2 = arith.subi %dim_2, %arg4 : index
      %3 = arith.minsi %c3, %2 : index
      %subview = memref.subview %arg0[%arg3, %arg4] [%1, %3] [%c1, %c1] : memref<?x?xf32, strided<[?, 1], offset: ?>> to memref<?x?xf32, strided<[?, ?], offset: ?>>
      %dim_3 = memref.dim %arg1, %c0 : memref<?x?xf32, strided<[?, 1], offset: ?>>
      %4 = affine.min #map(%arg3)[%dim_3]
      %dim_4 = memref.dim %arg1, %c1 : memref<?x?xf32, strided<[?, 1], offset: ?>>
      %5 = affine.min #map1(%arg4)[%dim_4]
      %subview_5 = memref.subview %arg1[%arg3, %arg4] [%4, %5] [%c1, %c1] : memref<?x?xf32, strided<[?, 1], offset: ?>> to memref<?x?xf32, strided<[?, ?], offset: ?>>
      %dim_6 = memref.dim %arg2, %c0 : memref<?x?xf32, strided<[?, 1], offset: ?>>
      %6 = affine.min #map(%arg3)[%dim_6]
      %dim_7 = memref.dim %arg2, %c1 : memref<?x?xf32, strided<[?, 1], offset: ?>>
      %7 = affine.min #map1(%arg4)[%dim_7]
      %subview_8 = memref.subview %arg2[%arg3, %arg4] [%6, %7] [%c1, %c1] : memref<?x?xf32, strided<[?, 1], offset: ?>> to memref<?x?xf32, strided<[?, ?], offset: ?>>
      scf.parallel (%arg5, %arg6) = (%c0, %c0) to (%1, %3) step (%c1, %c1) {
        %8 = memref.load %subview[%arg5, %arg6] : memref<?x?xf32, strided<[?, ?], offset: ?>>
        %9 = memref.load %subview_5[%arg5, %arg6] : memref<?x?xf32, strided<[?, ?], offset: ?>>
        %10 = memref.load %subview_8[%arg5, %arg6] : memref<?x?xf32, strided<[?, ?], offset: ?>>
        %11 = arith.addf %8, %9 : f32
        memref.store %11, %subview_8[%arg5, %arg6] : memref<?x?xf32, strided<[?, ?], offset: ?>>
        scf.reduce 
      } {mapping = [#gpu.loop_dim_map<processor = thread_x, map = (d0) -> (d0), bound = (d0) -> (d0)>, #gpu.loop_dim_map<processor = thread_y, map = (d0) -> (d0), bound = (d0) -> (d0)>]}
      scf.reduce 
    } {mapping = [#gpu.loop_dim_map<processor = block_x, map = (d0) -> (d0), bound = (d0) -> (d0)>, #gpu.loop_dim_map<processor = block_y, map = (d0) -> (d0), bound = (d0) -> (d0)>]}
    return
  }
}

// -----
module {
  func.func @parallel_loop_optional_attr() {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    scf.parallel (%arg0) = (%c0) to (%c1) step (%c1) {
      scf.reduce 
    } {mapping = [#gpu.loop_dim_map<processor = block_x, map = (d0) -> (d0), bound = (d0) -> (d0)>], optional_attr = 1 : i64}
    return
  }
}

// -----
module {
  func.func @parallel_double_map(%arg0: index, %arg1: index, %arg2: index, %arg3: index, %arg4: memref<?x?xf32>, %arg5: memref<?x?xf32>) {
    %c4 = arith.constant 4 : index
    scf.parallel (%arg6, %arg7) = (%arg0, %arg1) to (%arg2, %arg3) step (%c4, %c4) {
      scf.reduce 
    } {mapping = [#gpu.loop_dim_map<processor = block_y, map = (d0) -> (d0), bound = (d0) -> (d0)>, #gpu.loop_dim_map<processor = block_y, map = (d0) -> (d0), bound = (d0) -> (d0)>]}
    return
  }
}

// -----
module {
  func.func @parallel_loop_loop_variant_bound(%arg0: index, %arg1: index, %arg2: index, %arg3: index, %arg4: memref<?x?xf32>, %arg5: memref<?x?xf32>) {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c4 = arith.constant 4 : index
    scf.parallel (%arg6, %arg7) = (%arg0, %arg1) to (%arg2, %arg3) step (%c4, %c4) {
      scf.parallel (%arg8, %arg9) = (%c0, %c0) to (%arg6, %arg7) step (%c1, %c1) {
        %0 = arith.addi %arg6, %arg8 : index
        %1 = arith.addi %arg7, %arg9 : index
        %2 = memref.load %arg4[%0, %1] : memref<?x?xf32>
        memref.store %2, %arg5[%1, %0] : memref<?x?xf32>
        scf.reduce 
      } {mapping = [#gpu.loop_dim_map<processor = thread_y, map = (d0) -> (d0), bound = (d0) -> (d0)>, #gpu.loop_dim_map<processor = sequential, map = (d0) -> (d0), bound = (d0) -> (d0)>]}
      scf.reduce 
    } {mapping = [#gpu.loop_dim_map<processor = block_y, map = (d0) -> (d0), bound = (d0) -> (d0)>, #gpu.loop_dim_map<processor = sequential, map = (d0) -> (d0), bound = (d0) -> (d0)>]}
    return
  }
}

// -----
module {
  func.func @parallel_no_annotations(%arg0: index, %arg1: index, %arg2: index, %arg3: index, %arg4: memref<?x?xf32>, %arg5: memref<?x?xf32>) {
    %c4 = arith.constant 4 : index
    scf.parallel (%arg6, %arg7) = (%arg0, %arg1) to (%arg2, %arg3) step (%c4, %c4) {
      scf.reduce 
    }
    return
  }
}

// -----
module {
  func.func @step_invariant() {
    %alloc = memref.alloc() : memref<1x1xf64>
    %alloc_0 = memref.alloc() : memref<1x1xf64>
    %alloc_1 = memref.alloc() : memref<1x1xf64>
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c1_2 = arith.constant 1 : index
    scf.parallel (%arg0) = (%c0) to (%c1) step (%c1_2) {
      %c0_3 = arith.constant 0 : index
      %c1_4 = arith.constant 1 : index
      %c1_5 = arith.constant 1 : index
      scf.parallel (%arg1) = (%c0_3) to (%c1_4) step (%c1_5) {
        %0 = memref.load %alloc_1[%arg0, %arg1] : memref<1x1xf64>
        %1 = memref.load %alloc_0[%arg0, %arg1] : memref<1x1xf64>
        %2 = arith.addf %0, %1 : f64
        memref.store %2, %alloc[%arg0, %arg1] : memref<1x1xf64>
        scf.reduce 
      } {mapping = [#gpu.loop_dim_map<processor = thread_x, map = (d0) -> (d0), bound = (d0) -> (d0)>]}
      scf.reduce 
    } {mapping = [#gpu.loop_dim_map<processor = block_x, map = (d0) -> (d0), bound = (d0) -> (d0)>]}
    memref.dealloc %alloc_1 : memref<1x1xf64>
    memref.dealloc %alloc_0 : memref<1x1xf64>
    memref.dealloc %alloc : memref<1x1xf64>
    return
  }
}

// -----
module {
  func.func @parallel_reduction_1d() {
    %alloc = memref.alloc() : memref<f32>
    %alloc_0 = memref.alloc() : memref<64xf32>
    %c1 = arith.constant 1 : index
    %c64 = arith.constant 64 : index
    %c0 = arith.constant 0 : index
    %cst = arith.constant 0.000000e+00 : f32
    scf.parallel (%arg0) = (%c0) to (%c1) step (%c1) {
      %0 = scf.parallel (%arg1) = (%c0) to (%c64) step (%c1) init (%cst) -> f32 {
        %1 = memref.load %alloc_0[%arg1] : memref<64xf32>
        scf.reduce(%1 : f32) {
        ^bb0(%arg2: f32, %arg3: f32):
          %2 = arith.addf %arg2, %arg3 : f32
          scf.reduce.return %2 : f32
        }
      } {mapping = [#gpu.loop_dim_map<processor = thread_x, map = (d0) -> (d0), bound = (d0) -> (d0)>]}
      memref.store %0, %alloc[] : memref<f32>
      scf.reduce 
    } {mapping = [#gpu.loop_dim_map<processor = block_x, map = (d0) -> (d0), bound = (d0) -> (d0)>]}
    memref.dealloc %alloc : memref<f32>
    memref.dealloc %alloc_0 : memref<64xf32>
    return
  }
}

// -----
module {
  func.func @parallel_reduction_2d() {
    %alloc = memref.alloc() : memref<f32>
    %alloc_0 = memref.alloc() : memref<8x8xf32>
    %c1 = arith.constant 1 : index
    %c8 = arith.constant 8 : index
    %c0 = arith.constant 0 : index
    %cst = arith.constant 0.000000e+00 : f32
    scf.parallel (%arg0) = (%c0) to (%c1) step (%c1) {
      %0 = scf.parallel (%arg1, %arg2) = (%c0, %c0) to (%c8, %c8) step (%c1, %c1) init (%cst) -> f32 {
        %1 = memref.load %alloc_0[%arg1, %arg2] : memref<8x8xf32>
        scf.reduce(%1 : f32) {
        ^bb0(%arg3: f32, %arg4: f32):
          %2 = arith.addf %arg3, %arg4 : f32
          scf.reduce.return %2 : f32
        }
      } {mapping = [#gpu.loop_dim_map<processor = thread_x, map = (d0) -> (d0), bound = (d0) -> (d0)>, #gpu.loop_dim_map<processor = thread_y, map = (d0) -> (d0), bound = (d0) -> (d0)>]}
      memref.store %0, %alloc[] : memref<f32>
      scf.reduce 
    } {mapping = [#gpu.loop_dim_map<processor = block_x, map = (d0) -> (d0), bound = (d0) -> (d0)>]}
    memref.dealloc %alloc : memref<f32>
    memref.dealloc %alloc_0 : memref<8x8xf32>
    return
  }
}

// -----
#map = affine_map<(d0) -> (d0 * 128)>
module {
  func.func @parallel_reduction_1d_tiled() {
    %c128 = arith.constant 128 : index
    %c1 = arith.constant 1 : index
    %c64 = arith.constant 64 : index
    %c0 = arith.constant 0 : index
    %cst = arith.constant 0.000000e+00 : f32
    %alloc = memref.alloc() : memref<8192xf32>
    %alloc_0 = memref.alloc() : memref<64xf32>
    scf.parallel (%arg0) = (%c0) to (%c64) step (%c1) {
      %subview = memref.subview %alloc_0[%arg0] [1] [1] : memref<64xf32> to memref<f32, strided<[], offset: ?>>
      %0 = affine.apply #map(%arg0)
      %subview_1 = memref.subview %alloc[%0] [128] [1] : memref<8192xf32> to memref<128xf32, strided<[1], offset: ?>>
      %1 = scf.parallel (%arg1) = (%c0) to (%c128) step (%c1) init (%cst) -> f32 {
        %2 = memref.load %subview_1[%arg1] : memref<128xf32, strided<[1], offset: ?>>
        scf.reduce(%2 : f32) {
        ^bb0(%arg2: f32, %arg3: f32):
          %3 = arith.addf %arg2, %arg3 : f32
          scf.reduce.return %3 : f32
        }
      } {mapping = [#gpu.loop_dim_map<processor = thread_x, map = (d0) -> (d0), bound = (d0) -> (d0)>]}
      memref.store %1, %subview[] : memref<f32, strided<[], offset: ?>>
      scf.reduce 
    } {mapping = [#gpu.loop_dim_map<processor = block_x, map = (d0) -> (d0), bound = (d0) -> (d0)>]}
    memref.dealloc %alloc : memref<8192xf32>
    memref.dealloc %alloc_0 : memref<64xf32>
    return
  }
}

// -----
module {
  func.func @parallel_reduction_1d_uint(%arg0: ui32) {
    %alloc = memref.alloc() : memref<ui32>
    %alloc_0 = memref.alloc() : memref<64xui32>
    %c1 = arith.constant 1 : index
    %c64 = arith.constant 64 : index
    %c0 = arith.constant 0 : index
    scf.parallel (%arg1) = (%c0) to (%c1) step (%c1) {
      %0 = scf.parallel (%arg2) = (%c0) to (%c64) step (%c1) init (%arg0) -> ui32 {
        %1 = memref.load %alloc_0[%arg2] : memref<64xui32>
        scf.reduce(%1 : ui32) {
        ^bb0(%arg3: ui32, %arg4: ui32):
          scf.reduce.return %arg3 : ui32
        }
      } {mapping = [#gpu.loop_dim_map<processor = thread_x, map = (d0) -> (d0), bound = (d0) -> (d0)>]}
      memref.store %0, %alloc[] : memref<ui32>
      scf.reduce 
    } {mapping = [#gpu.loop_dim_map<processor = block_x, map = (d0) -> (d0), bound = (d0) -> (d0)>]}
    memref.dealloc %alloc : memref<ui32>
    memref.dealloc %alloc_0 : memref<64xui32>
    return
  }
}

// -----
module {
  func.func @parallel_reduction_1d_outside() {
    %alloc = memref.alloc() : memref<f32>
    %alloc_0 = memref.alloc() : memref<64xf32>
    %c1 = arith.constant 1 : index
    %c64 = arith.constant 64 : index
    %c0 = arith.constant 0 : index
    %cst = arith.constant 0.000000e+00 : f32
    %cst_1 = arith.constant 1.000000e+00 : f32
    scf.parallel (%arg0) = (%c0) to (%c1) step (%c1) {
      %0 = scf.parallel (%arg1) = (%c0) to (%c64) step (%c1) init (%cst) -> f32 {
        %1 = memref.load %alloc_0[%arg1] : memref<64xf32>
        scf.reduce(%1 : f32) {
        ^bb0(%arg2: f32, %arg3: f32):
          %2 = arith.addf %arg2, %arg3 : f32
          %3 = arith.addf %2, %cst_1 : f32
          scf.reduce.return %3 : f32
        }
      } {mapping = [#gpu.loop_dim_map<processor = thread_x, map = (d0) -> (d0), bound = (d0) -> (d0)>]}
      memref.store %0, %alloc[] : memref<f32>
      scf.reduce 
    } {mapping = [#gpu.loop_dim_map<processor = block_x, map = (d0) -> (d0), bound = (d0) -> (d0)>]}
    memref.dealloc %alloc : memref<f32>
    memref.dealloc %alloc_0 : memref<64xf32>
    return
  }
}

// -----
module {
  func.func @nested_parallel_with_side_effect() {
    %c65536 = arith.constant 65536 : index
    %c2 = arith.constant 2 : index
    %c256 = arith.constant 256 : index
    %c0 = arith.constant 0 : index
    %c4 = arith.constant 4 : index
    %c1 = arith.constant 1 : index
    %alloc = memref.alloc() : memref<2x256x256xf32>
    %alloc_0 = memref.alloc() : memref<2x4x256x256xf32>
    %alloc_1 = memref.alloc() : memref<4x4xf32>
    %alloc_2 = memref.alloc() : memref<4x4xf32>
    scf.parallel (%arg0, %arg1, %arg2) = (%c0, %c0, %c0) to (%c2, %c4, %c65536) step (%c1, %c1, %c1) {
      %0 = arith.remsi %arg2, %c256 : index
      %1 = arith.divsi %arg2, %c256 : index
      %2 = memref.load %alloc[%arg0, %1, %0] : memref<2x256x256xf32>
      memref.store %2, %alloc_0[%arg0, %arg1, %1, %0] : memref<2x4x256x256xf32>
      scf.parallel (%arg3) = (%c0) to (%c4) step (%c1) {
        %3 = memref.load %alloc_1[%arg3, %c0] : memref<4x4xf32>
        memref.store %3, %alloc_2[%arg3, %c0] : memref<4x4xf32>
        scf.reduce 
      } {mapping = [#gpu.loop_dim_map<processor = thread_x, map = (d0) -> (d0), bound = (d0) -> (d0)>]}
      scf.reduce 
    } {mapping = [#gpu.loop_dim_map<processor = block_z, map = (d0) -> (d0), bound = (d0) -> (d0)>, #gpu.loop_dim_map<processor = block_y, map = (d0) -> (d0), bound = (d0) -> (d0)>, #gpu.loop_dim_map<processor = block_x, map = (d0) -> (d0), bound = (d0) -> (d0)>]}
    return
  }
}

// -----
module {
  func.func @scf2gpu_index_creation_2d() {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c32 = arith.constant 32 : index
    scf.parallel (%arg0, %arg1) = (%c0, %c0) to (%c32, %c32) step (%c1, %c1) {
      %0 = arith.addi %arg0, %c0 : index
      %1 = arith.addi %arg1, %c0 : index
      scf.reduce 
    } {mapping = [#gpu.loop_dim_map<processor = block_x, map = (d0) -> (d0), bound = (d0) -> (d0)>, #gpu.loop_dim_map<processor = thread_x, map = (d0) -> (d0), bound = (d0) -> (d0)>]}
    return
  }
}

// -----
module {
  func.func @scf2gpu_index_creation_1d() {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c64 = arith.constant 64 : index
    scf.parallel (%arg0) = (%c0) to (%c64) step (%c1) {
      %0 = arith.addi %arg0, %c0 : index
      scf.reduce 
    } {mapping = [#gpu.loop_dim_map<processor = thread_x, map = (d0) -> (d0), bound = (d0) -> (d0)>]}
    return
  }
}

