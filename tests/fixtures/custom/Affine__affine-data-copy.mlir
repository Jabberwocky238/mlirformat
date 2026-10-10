#map = affine_map<(d0) -> (d0)>
#map1 = affine_map<(d0) -> (d0 + 128)>
module {
  func.func @matmul(%arg0: memref<4096x4096xf32>, %arg1: memref<4096x4096xf32>, %arg2: memref<4096x4096xf32>) -> memref<4096x4096xf32> {
    affine.for %arg3 = 0 to 4096 step 128 {
      affine.for %arg4 = 0 to 4096 step 128 {
        affine.for %arg5 = 0 to 4096 step 128 {
          affine.for %arg6 = #map(%arg3) to #map1(%arg3) {
            affine.for %arg7 = #map(%arg4) to #map1(%arg4) {
              affine.for %arg8 = #map(%arg5) to #map1(%arg5) {
                %0 = affine.load %arg0[%arg6, %arg8] : memref<4096x4096xf32>
                %1 = affine.load %arg1[%arg8, %arg7] : memref<4096x4096xf32>
                %2 = affine.load %arg2[%arg6, %arg7] : memref<4096x4096xf32>
                %3 = arith.mulf %0, %1 : f32
                %4 = arith.addf %2, %3 : f32
                affine.store %4, %arg2[%arg6, %arg7] : memref<4096x4096xf32>
              }
            }
          }
        }
      }
    }
    return %arg2 : memref<4096x4096xf32>
  }
}

// -----
module {
  func.func @single_elt_buffers(%arg0: memref<1024x1024xf32>, %arg1: memref<1024x1024xf32>, %arg2: memref<1024x1024xf32>) -> memref<1024x1024xf32> {
    affine.for %arg3 = 0 to 1024 {
      affine.for %arg4 = 0 to 1024 {
        affine.for %arg5 = 0 to 1024 {
          %0 = affine.load %arg1[%arg5, %arg4] : memref<1024x1024xf32>
          %1 = affine.load %arg2[%arg3, %arg4] : memref<1024x1024xf32>
          %2 = arith.addf %0, %1 : f32
          affine.store %2, %arg2[%arg3, %arg4] : memref<1024x1024xf32>
        }
      }
    }
    return %arg2 : memref<1024x1024xf32>
  }
}

// -----
#map = affine_map<(d0) -> (d0)>
#map1 = affine_map<(d0) -> (4096, d0 + 100)>
module {
  func.func @min_upper_bound(%arg0: memref<4096xf32>) -> memref<4096xf32> {
    affine.for %arg1 = 0 to 4096 step 100 {
      affine.for %arg2 = #map(%arg1) to min #map1(%arg1) {
        %0 = affine.load %arg0[%arg2] : memref<4096xf32>
        %1 = arith.mulf %0, %0 : f32
        affine.store %1, %arg0[%arg2] : memref<4096xf32>
      }
    }
    return %arg0 : memref<4096xf32>
  }
}

// -----
#map = affine_map<()[s0, s1] -> (s0 * 512, s1 * 6)>
#map1 = affine_map<()[s0, s1] -> (s0 * 512 + 512, s1 * 6 + 6)>
module {
  func.func @max_lower_bound(%arg0: memref<2048x516xf64>, %arg1: index, %arg2: index) {
    affine.for %arg3 = 0 to 2048 {
      affine.for %arg4 = max #map()[%arg1, %arg2] to min #map1()[%arg1, %arg2] {
        %0 = affine.load %arg0[%arg3, %arg4] : memref<2048x516xf64>
      }
    }
    return
  }
}

// -----
#map = affine_map<(d0, d1, d2) -> (d0 * 40 + d1 * 8 + d2 * 2)>
#map1 = affine_map<(d0, d1, d2) -> (d0 * 40 + d1 * 8 + d2 * 2 + 2)>
#map2 = affine_map<(d0) -> (d0 + 1)>
module {
  func.func @empty_loops(%arg0: memref<1024x1024xf64>) {
    affine.for %arg1 = 0 to 0 {
      %0 = affine.load %arg0[0, %arg1] : memref<1024x1024xf64>
    }
    affine.for %arg1 = 0 to -16 {
      %0 = affine.load %arg0[0, %arg1] : memref<1024x1024xf64>
    }
    return
  }
  func.func @affine_parallel(%arg0: memref<2x5x4x2xi64>) {
    affine.for %arg1 = 0 to 2 {
      affine.parallel (%arg2) = (0) to (5) {
        affine.parallel (%arg3) = (0) to (4) {
          affine.for %arg4 = #map(%arg1, %arg2, %arg3) to #map1(%arg1, %arg2, %arg3) {
            %0 = affine.load %arg0[((%arg4 floordiv 2) floordiv 4) floordiv 5, ((%arg4 floordiv 2) floordiv 4) mod 5, (%arg4 floordiv 2) mod 4, %arg4 mod 2] : memref<2x5x4x2xi64>
          }
        }
      }
    }
    return
  }
  func.func @index_elt_type(%arg0: memref<1x2x4x8xindex>) {
    affine.for %arg1 = 0 to 1 {
      affine.for %arg2 = 0 to 2 {
        affine.for %arg3 = 0 to 4 {
          affine.for %arg4 = 0 to 8 {
            affine.store %arg4, %arg0[%arg1, %arg2, %arg3, %arg4] : memref<1x2x4x8xindex>
          }
        }
      }
    }
    return
  }
  func.func @arbitrary_memory_space() {
    %alloc = memref.alloc() : memref<256x8xi8, #spirv.storage_class<StorageBuffer>>
    affine.for %arg0 = 0 to 32 step 4 {
      %0 = affine.apply #map2(%arg0)
      affine.for %arg1 = 0 to 8 step 2 {
        %1 = affine.apply #map2(%arg1)
        affine.for %arg2 = 0 to 8 step 2 {
          %2 = affine.apply #map2(%arg2)
          %3 = affine.load %alloc[%0, %1] : memref<256x8xi8, #spirv.storage_class<StorageBuffer>>
          affine.store %3, %alloc[%0, %2] : memref<256x8xi8, #spirv.storage_class<StorageBuffer>>
        }
      }
    }
    return
  }
  func.func @zero_ranked(%arg0: memref<480xi1>) {
    %false = arith.constant false
    %alloc = memref.alloc() {alignment = 128 : i64} : memref<i1>
    affine.store %false, %alloc[] : memref<i1>
    %alloc_0 = memref.alloc() {alignment = 128 : i64} : memref<i1>
    memref.copy %alloc, %alloc_0 : memref<i1> to memref<i1>
    affine.for %arg1 = 0 to 480 {
      %0 = affine.load %arg0[%arg1] : memref<480xi1>
      %1 = affine.load %alloc_0[] : memref<i1>
      %2 = arith.cmpi slt, %0, %1 : i1
      %3 = arith.select %2, %0, %1 : i1
      affine.store %3, %alloc_0[] : memref<i1>
    }
    return
  }
  func.func @scalar_memref_copy_without_dma() {
    %false = arith.constant false
    %alloc = memref.alloc() {alignment = 128 : i64} : memref<i1>
    affine.store %false, %alloc[] : memref<i1>
    return
  }
  func.func @scalar_memref_copy_in_loop(%arg0: memref<480xi1>) {
    %false = arith.constant false
    %alloc = memref.alloc() {alignment = 128 : i64} : memref<i1>
    affine.store %false, %alloc[] : memref<i1>
    %alloc_0 = memref.alloc() {alignment = 128 : i64} : memref<i1>
    memref.copy %alloc, %alloc_0 : memref<i1> to memref<i1>
    affine.for %arg1 = 0 to 480 {
      %0 = affine.load %arg0[%arg1] : memref<480xi1>
      %1 = affine.load %alloc_0[] : memref<i1>
      %2 = arith.cmpi slt, %0, %1 : i1
      %3 = arith.select %2, %0, %1 : i1
      affine.store %3, %alloc_0[] : memref<i1>
    }
    return
  }
  func.func @memref_def_inside(%arg0: index) {
    %0 = llvm.mlir.constant(1.000000e+00 : f32) : f32
    affine.for %arg1 = 0 to 29 {
      %alloc = memref.alloc() : memref<1xf32>
      affine.store %0, %alloc[0] : memref<1xf32>
    }
    return
  }
  memref.global "private" constant @__constant_1x2x1xi32_1 : memref<1x2x1xi32> = dense<0> {alignment = 64 : i64}
  func.func @multiple_blocks(%arg0: index) -> memref<1x2x1xi32> {
    %c1_i32 = arith.constant 1 : i32
    %c3_i32 = arith.constant 3 : i32
    %0 = memref.get_global @__constant_1x2x1xi32_1 : memref<1x2x1xi32>
    %alloc = memref.alloc() {alignment = 64 : i64} : memref<1x2x1xi32>
    memref.copy %0, %alloc : memref<1x2x1xi32> to memref<1x2x1xi32>
    cf.br ^bb1(%alloc : memref<1x2x1xi32>)
  ^bb1(%1: memref<1x2x1xi32>):  // 2 preds: ^bb0, ^bb2
    %alloc_0 = memref.alloc() {alignment = 64 : i64} : memref<1x2x1xi1>
    affine.for %arg1 = 0 to 1 {
      affine.for %arg2 = 0 to 2 {
        affine.for %arg3 = 0 to 1 {
          %3 = affine.load %1[%arg1, %arg2, %arg3] : memref<1x2x1xi32>
          %4 = arith.cmpi slt, %3, %c3_i32 : i32
          affine.store %4, %alloc_0[%arg1, %arg2, %arg3] : memref<1x2x1xi1>
        }
      }
    }
    %2 = memref.load %alloc_0[%arg0, %arg0, %arg0] : memref<1x2x1xi1>
    cf.cond_br %2, ^bb2, ^bb3
  ^bb2:  // pred: ^bb1
    %alloc_1 = memref.alloc() {alignment = 64 : i64} : memref<1x2x1xi32>
    affine.for %arg1 = 0 to 1 {
      affine.for %arg2 = 0 to 2 {
        affine.for %arg3 = 0 to 1 {
          %3 = affine.load %1[%arg1, %arg2, %arg3] : memref<1x2x1xi32>
          %4 = arith.addi %3, %c1_i32 : i32
          affine.store %4, %alloc_1[%arg1, %arg2, %arg3] : memref<1x2x1xi32>
        }
      }
    }
    cf.br ^bb1(%alloc_1 : memref<1x2x1xi32>)
  ^bb3:  // pred: ^bb1
    return %1 : memref<1x2x1xi32>
  }
}

