#map = affine_map<(d0, d1) -> (d0, d1)>
#map1 = affine_map<(d0) -> (d0)>
module {
  func.func @reduce_window_max() {
    %cst = arith.constant 0.000000e+00 : f32
    %alloc = memref.alloc() : memref<1x8x8x64xf32>
    %alloc_0 = memref.alloc() : memref<1x18x18x64xf32>
    affine.for %arg0 = 0 to 1 {
      affine.for %arg1 = 0 to 8 {
        affine.for %arg2 = 0 to 8 {
          affine.for %arg3 = 0 to 64 {
            affine.store %cst, %alloc[%arg0, %arg1, %arg2, %arg3] : memref<1x8x8x64xf32>
          }
        }
      }
    }
    affine.for %arg0 = 0 to 1 {
      affine.for %arg1 = 0 to 8 {
        affine.for %arg2 = 0 to 8 {
          affine.for %arg3 = 0 to 64 {
            affine.for %arg4 = 0 to 1 {
              affine.for %arg5 = 0 to 3 {
                affine.for %arg6 = 0 to 3 {
                  affine.for %arg7 = 0 to 1 {
                    %0 = affine.load %alloc[%arg0, %arg1, %arg2, %arg3] : memref<1x8x8x64xf32>
                    %1 = affine.load %alloc_0[%arg0 + %arg4, %arg1 * 2 + %arg5, %arg2 * 2 + %arg6, %arg3 + %arg7] : memref<1x18x18x64xf32>
                    %2 = arith.cmpf ogt, %0, %1 : f32
                    %3 = arith.select %2, %0, %1 : f32
                    affine.store %3, %alloc[%arg0, %arg1, %arg2, %arg3] : memref<1x8x8x64xf32>
                  }
                }
              }
            }
          }
        }
      }
    }
    return
  }
  func.func @loop_nest_3d_outer_two_parallel(%arg0: index) {
    %alloc = memref.alloc() : memref<1024x1024xvector<64xf32>>
    %alloc_0 = memref.alloc() : memref<1024x1024xvector<64xf32>>
    %alloc_1 = memref.alloc() : memref<1024x1024xvector<64xf32>>
    affine.for %arg1 = 0 to %arg0 {
      affine.for %arg2 = 0 to %arg0 {
        %0 = affine.load %alloc_1[%arg1, %arg2] : memref<1024x1024xvector<64xf32>>
        affine.for %arg3 = 0 to %arg0 {
          %1 = affine.load %alloc[%arg1, %arg3] : memref<1024x1024xvector<64xf32>>
          %2 = affine.load %alloc_0[%arg3, %arg2] : memref<1024x1024xvector<64xf32>>
          %3 = arith.mulf %1, %2 : vector<64xf32>
          %4 = arith.addf %0, %3 : vector<64xf32>
          affine.store %4, %alloc_1[%arg1, %arg2] : memref<1024x1024xvector<64xf32>>
        }
      }
    }
    return
  }
  func.func @unknown_op_conservative() {
    affine.for %arg0 = 0 to 10 {
      "unknown"() : () -> ()
    }
    return
  }
  func.func @non_affine_load() {
    %alloc = memref.alloc() : memref<100xf32>
    affine.for %arg0 = 0 to 100 {
      %0 = memref.load %alloc[%arg0] : memref<100xf32>
    }
    return
  }
  func.func @for_with_minmax(%arg0: memref<?xf32>, %arg1: index, %arg2: index, %arg3: index, %arg4: index) {
    affine.for %arg5 = max #map(%arg1, %arg2) to min #map(%arg3, %arg4) {
      %0 = affine.load %arg0[%arg5] : memref<?xf32>
    }
    return
  }
  func.func @nested_for_with_minmax(%arg0: memref<?xf32>, %arg1: index, %arg2: index, %arg3: index) {
    affine.for %arg4 = 0 to 10 {
      affine.for %arg5 = max #map(%arg1, %arg4) to min #map(%arg2, %arg3) {
        %0 = affine.load %arg0[%arg5] : memref<?xf32>
      }
    }
    return
  }
  func.func @max_nested(%arg0: memref<?x?xf32>, %arg1: index, %arg2: index, %arg3: index, %arg4: index) {
    affine.for %arg5 = #map1(%arg1) to #map1(%arg3) {
      affine.for %arg6 = #map1(%arg2) to #map1(%arg4) {
        %0 = affine.load %arg0[%arg5, %arg6] : memref<?x?xf32>
      }
    }
    return
  }
  func.func @max_nested_1(%arg0: memref<4096x4096xf32>, %arg1: memref<4096x4096xf32>, %arg2: memref<4096x4096xf32>) {
    %alloc = memref.alloc() : memref<4096x4096xf32>
    affine.for %arg3 = 0 to 4096 {
      affine.for %arg4 = 0 to 4096 {
        affine.for %arg5 = 0 to 4096 {
          %0 = affine.load %arg0[%arg3, %arg5] : memref<4096x4096xf32>
          %1 = affine.load %arg1[%arg5, %arg4] : memref<4096x4096xf32>
          %2 = affine.load %alloc[%arg3, %arg4] : memref<4096x4096xf32>
          %3 = arith.mulf %0, %1 : f32
          %4 = arith.addf %2, %3 : f32
          affine.store %4, %alloc[%arg3, %arg4] : memref<4096x4096xf32>
        }
      }
    }
    return
  }
  func.func @iter_args(%arg0: memref<10xf32>) {
    %cst = arith.constant 0.000000e+00 : f32
    %0 = affine.for %arg1 = 0 to 10 iter_args(%arg2 = %cst) -> (f32) {
      %1 = affine.load %arg0[%arg1] : memref<10xf32>
      %2 = arith.addf %arg2, %1 : f32
      affine.yield %2 : f32
    }
    return
  }
  func.func @nested_iter_args(%arg0: memref<20x10xf32>) {
    %cst = arith.constant 0.000000e+00 : f32
    affine.for %arg1 = 0 to 20 {
      %0 = affine.for %arg2 = 0 to 10 iter_args(%arg3 = %cst) -> (f32) {
        %1 = affine.load %arg0[%arg1, %arg2] : memref<20x10xf32>
        %2 = arith.addf %arg3, %1 : f32
        affine.yield %2 : f32
      }
    }
    return
  }
  func.func @strange_butterfly() {
    %cst = arith.constant 0.000000e+00 : f32
    %cst_0 = arith.constant 1.000000e+00 : f32
    %0:2 = affine.for %arg0 = 0 to 10 iter_args(%arg1 = %cst, %arg2 = %cst_0) -> (f32, f32) {
      %1 = arith.addf %arg1, %arg2 : f32
      affine.yield %1, %1 : f32, f32
    }
    return
  }
  func.func @repeated_use() {
    %cst = arith.constant 0.000000e+00 : f32
    %0 = affine.for %arg0 = 0 to 10 iter_args(%arg1 = %cst) -> (f32) {
      %1 = arith.addf %arg1, %arg1 : f32
      affine.yield %1 : f32
    }
    return
  }
  func.func @use_in_backward_slice() {
    %cst = arith.constant 0.000000e+00 : f32
    %cst_0 = arith.constant 1.000000e+00 : f32
    %0:2 = affine.for %arg0 = 0 to 10 iter_args(%arg1 = %cst, %arg2 = %cst_0) -> (f32, f32) {
      %1 = "test.some_modification"(%arg2) : (f32) -> f32
      %2 = arith.addf %arg1, %1 : f32
      affine.yield %2, %2 : f32, f32
    }
    return
  }
  func.func @nested_min_max(%arg0: memref<?xf32>, %arg1: index, %arg2: index, %arg3: index) {
    affine.for %arg4 = 0 to 10 {
      affine.for %arg5 = max #map(%arg1, %arg4) to min #map(%arg2, %arg3) {
        %0 = affine.load %arg0[%arg5] : memref<?xf32>
      }
    }
    return
  }
  func.func @local_alloc() {
    %cst = arith.constant 0.000000e+00 : f32
    affine.for %arg0 = 0 to 100 {
      %alloc = memref.alloc() : memref<1xf32>
      %alloca = memref.alloca() : memref<1xf32>
      affine.store %cst, %alloc[0] : memref<1xf32>
    }
    return
  }
  func.func @local_alloc_cast() {
    %cst = arith.constant 0.000000e+00 : f32
    affine.for %arg0 = 0 to 100 {
      %alloc = memref.alloc() : memref<128xf32>
      affine.for %arg1 = 0 to 128 {
        affine.store %cst, %alloc[%arg1] : memref<128xf32>
      }
      affine.for %arg1 = 0 to 128 {
        affine.store %cst, %alloc[0] : memref<128xf32>
      }
      %reinterpret_cast = memref.reinterpret_cast %alloc to offset: [0], sizes: [8, 16], strides: [16, 1] : memref<128xf32> to memref<8x16xf32>
      affine.for %arg1 = 0 to 8 {
        affine.store %cst, %reinterpret_cast[%arg1, %arg1] : memref<8x16xf32>
      }
    }
    return
  }
  func.func @iter_arg_memrefs(%arg0: memref<10xf32>) {
    %alloc = memref.alloc() : memref<f32>
    %0 = affine.for %arg1 = 0 to 10 iter_args(%arg2 = %alloc) -> (memref<f32>) {
      affine.yield %arg2 : memref<f32>
    }
    return
  }
  func.func @test_add_inv_or_terminal_symbol(%arg0: memref<9x9xi32>, %arg1: i1) {
    %idx1 = index.constant 1
    %0 = tensor.empty() : tensor<10xf16>
    memref.alloca_scope  {
      %dim = tensor.dim %0, %idx1 : tensor<10xf16>
      %alloc = memref.alloc(%idx1, %idx1) {alignment = 64 : i64} : memref<?x?xf16>
      affine.for %arg2 = 0 to %dim {
        %1 = affine.load %alloc[%idx1, %idx1] : memref<?x?xf16>
        affine.store %1, %alloc[%idx1, %idx1] : memref<?x?xf16>
      }
    }
    return
  }
  func.func @explicit_parallel(%arg0: memref<1x123x194xf64>, %arg1: memref<34x99x194xf64>) {
    affine.parallel (%arg2, %arg3) = (0, 0) to (85, 180) {
      affine.for %arg4 = 0 to 18 {
        %0 = affine.load %arg0[0, %arg2 + 19, %arg3 + 7] : memref<1x123x194xf64>
        %1 = affine.load %arg1[%arg4 + 8, %arg2 + 7, %arg3 + 7] : memref<34x99x194xf64>
        %2 = arith.addf %0, %1 {fastmathFlags = #llvm.fastmath<none>} : f64
        affine.store %1, %arg0[0, %arg2 + 19, %arg3 + 7] : memref<1x123x194xf64>
      }
    }
    return
  }
}

