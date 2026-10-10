module {
  func.func @unflatten4d(%arg0: memref<7x8x9x10xf32>) {
    %alloc = memref.alloc() : memref<5040xf32>
    %cst = arith.constant 7.000000e+00 : f32
    affine.for %arg1 = 0 to 7 {
      affine.for %arg2 = 0 to 8 {
        affine.for %arg3 = 0 to 9 {
          affine.for %arg4 = 0 to 10 {
            affine.store %cst, %alloc[%arg1 * 720 + %arg2 * 90 + %arg3 * 10 + %arg4] : memref<5040xf32>
          }
        }
      }
    }
    affine.for %arg1 = 0 to 7 {
      affine.for %arg2 = 0 to 8 {
        affine.for %arg3 = 0 to 9 {
          affine.for %arg4 = 0 to 10 {
            %0 = affine.load %alloc[%arg1 * 720 + %arg2 * 90 + %arg3 * 10 + %arg4] : memref<5040xf32>
            affine.store %0, %arg0[%arg1, %arg2, %arg3, %arg4] : memref<7x8x9x10xf32>
          }
        }
      }
    }
    return
  }
}

// -----
module {
  func.func @unflatten2d_with_transpose(%arg0: memref<8x7xf32>) {
    %alloc = memref.alloc() : memref<56xf32>
    %cst = arith.constant 7.000000e+00 : f32
    affine.for %arg1 = 0 to 7 {
      affine.for %arg2 = 0 to 8 {
        affine.store %cst, %alloc[%arg1 * 8 + %arg2] : memref<56xf32>
      }
    }
    affine.for %arg1 = 0 to 8 {
      affine.for %arg2 = 0 to 7 {
        %0 = affine.load %alloc[%arg1 + %arg2 * 8] : memref<56xf32>
        affine.store %0, %arg0[%arg1, %arg2] : memref<8x7xf32>
      }
    }
    return
  }
}

// -----
module {
  func.func @check_src_dst_step(%arg0: memref<100xf32>, %arg1: memref<100xf32>, %arg2: memref<100xf32>) {
    affine.for %arg3 = 0 to 100 {
      %0 = affine.load %arg1[%arg3] : memref<100xf32>
      affine.store %0, %arg0[%arg3] : memref<100xf32>
    }
    affine.for %arg3 = 0 to 100 step 2 {
      %0 = affine.load %arg0[%arg3] : memref<100xf32>
      affine.store %0, %arg2[%arg3] : memref<100xf32>
    }
    return
  }
}

// -----
module {
  func.func @reduce_add_non_maximal_f32_f32(%arg0: memref<64x64xf32, 1>, %arg1: memref<1x64xf32, 1>, %arg2: memref<1x64xf32, 1>) {
    %cst = arith.constant 0.000000e+00 : f32
    %cst_0 = arith.constant 1.000000e+00 : f32
    affine.for %arg3 = 0 to 1 {
      affine.for %arg4 = 0 to 64 {
        %0 = affine.for %arg5 = 0 to 64 iter_args(%arg6 = %cst) -> (f32) {
          %2 = affine.load %arg0[%arg5, %arg4] : memref<64x64xf32, 1>
          %3 = arith.addf %arg6, %2 : f32
          affine.yield %3 : f32
        }
        %1 = arith.addf %0, %0 : f32
        affine.store %1, %arg1[%arg3, %arg4] : memref<1x64xf32, 1>
      }
    }
    affine.for %arg3 = 0 to 1 {
      affine.for %arg4 = 0 to 64 {
        %0 = affine.for %arg5 = 0 to 32 iter_args(%arg6 = %cst_0) -> (f32) {
          %2 = affine.load %arg0[%arg5, %arg4] : memref<64x64xf32, 1>
          %3 = arith.mulf %arg6, %2 : f32
          affine.yield %3 : f32
        }
        %1 = arith.mulf %0, %0 : f32
        affine.store %1, %arg2[%arg3, %arg4] : memref<1x64xf32, 1>
      }
    }
    return
  }
}

// -----
module {
  func.func @sibling_load_only(%arg0: memref<10xf32>) {
    affine.for %arg1 = 0 to 10 {
      %0 = affine.load %arg0[%arg1] : memref<10xf32>
    }
    affine.for %arg1 = 0 to 10 {
      %0 = affine.load %arg0[%arg1] : memref<10xf32>
    }
    return
  }
}

// -----
module {
  func.func @fusion_for_multiple_blocks() {
    %alloc = memref.alloc() : memref<10xf32>
    %cst = arith.constant 7.000000e+00 : f32
    affine.for %arg0 = 0 to 10 {
      affine.store %cst, %alloc[%arg0] : memref<10xf32>
    }
    affine.for %arg0 = 0 to 10 {
      %0 = affine.load %alloc[%arg0] : memref<10xf32>
    }
    cf.br ^bb1
  ^bb1:  // pred: ^bb0
    affine.for %arg0 = 0 to 10 {
      affine.store %cst, %alloc[%arg0] : memref<10xf32>
    }
    affine.for %arg0 = 0 to 10 {
      %0 = affine.load %alloc[%arg0] : memref<10xf32>
    }
    return
  }
}

// -----
module {
  func.func @fuse_higher_dim_nest_into_lower_dim_nest() {
    %alloc = memref.alloc() : memref<8x12x128x64xf32>
    %alloc_0 = memref.alloc() : memref<8x128x12x64xf32>
    affine.for %arg0 = 0 to 8 {
      affine.for %arg1 = 0 to 128 {
        affine.for %arg2 = 0 to 12 {
          affine.for %arg3 = 0 to 64 {
            %0 = affine.load %alloc[%arg0, %arg2, %arg1, %arg3] : memref<8x12x128x64xf32>
            affine.store %0, %alloc_0[%arg0, %arg1, %arg2, %arg3] : memref<8x128x12x64xf32>
          }
        }
      }
    }
    %alloc_1 = memref.alloc() : memref<8x128x768xf16>
    affine.for %arg0 = 0 to 8 {
      affine.for %arg1 = 0 to 128 {
        affine.for %arg2 = 0 to 768 {
          %0 = affine.load %alloc_0[%arg0, %arg1, %arg2 floordiv 64, %arg2 mod 64] : memref<8x128x12x64xf32>
          %1 = arith.truncf %0 : f32 to f16
          affine.store %1, %alloc_1[%arg0, %arg1, %arg2] : memref<8x128x768xf16>
        }
      }
    }
    return
  }
}

// -----
#map = affine_map<(d0, d1) -> (d0 + d1)>
module {
  spirv.func @test_avgpool2d_pad_right(%arg0: !spirv.array<8192 x f32>) -> !spirv.array<8192 x f32> "None" {
    %cst_f32 = spirv.Constant 0.000000e+00 : f32
    %0 = builtin.unrealized_conversion_cast %arg0 : !spirv.array<8192 x f32> to tensor<1x32x32x8xf32>
    %padded = tensor.pad %0 low[0, 4, 4, 0] high[0, 4, 8193, 0] {
    ^bb0(%arg1: index, %arg2: index, %arg3: index, %arg4: index):
      tensor.yield %cst_f32 : f32
    } : tensor<1x32x32x8xf32> to tensor<1x40x8229x8xf32>
    %1 = bufferization.to_buffer %padded : tensor<1x40x8229x8xf32> to memref<1x40x8229x8xf32>
    %alloc = memref.alloc() {alignment = 64 : i64} : memref<1x32x32x8xf32>
    affine.for %arg1 = 0 to 1 {
      affine.for %arg2 = 0 to 32 {
        affine.for %arg3 = 0 to 32 {
          affine.for %arg4 = 0 to 8 {
            affine.for %arg5 = 0 to 1 {
              affine.for %arg6 = 0 to 1 {
                %4 = affine.apply #map(%arg2, %arg5)
                %5 = affine.apply #map(%arg3, %arg6)
                %6 = affine.load %1[%arg1, %4, %5, %arg4] : memref<1x40x8229x8xf32>
                %7 = affine.load %alloc[%arg1, %arg2, %arg3, %arg4] : memref<1x32x32x8xf32>
                %8 = arith.addf %7, %6 : f32
                affine.store %8, %alloc[%arg1, %arg2, %arg3, %arg4] : memref<1x32x32x8xf32>
              }
            }
          }
        }
      }
    }
    %alloc_0 = memref.alloc() {alignment = 64 : i64} : memref<1x32x32x8xf32>
    affine.for %arg1 = 0 to 1 {
      affine.for %arg2 = 0 to 32 {
        affine.for %arg3 = 0 to 32 {
          affine.for %arg4 = 0 to 8 {
            %4 = affine.load %alloc[%arg1, %arg2, %arg3, %arg4] : memref<1x32x32x8xf32>
          }
        }
      }
    }
    %2 = bufferization.to_tensor %alloc_0 : memref<1x32x32x8xf32> to tensor<1x32x32x8xf32>
    %3 = builtin.unrealized_conversion_cast %2 : tensor<1x32x32x8xf32> to !spirv.array<8192 x f32>
    spirv.ReturnValue %3 : !spirv.array<8192 x f32>
  }
}

// -----
module {
  func.func @same_memref_load_store(%arg0: memref<32xf32>, %arg1: memref<16xf32>) {
    %cst = arith.constant 2.000000e+00 : f32
    affine.for %arg2 = 0 to 32 {
      %0 = affine.load %arg0[%arg2] : memref<32xf32>
      %1 = arith.mulf %0, %cst : f32
      affine.store %1, %arg0[%arg2] : memref<32xf32>
    }
    affine.for %arg2 = 0 to 16 {
      %0 = affine.load %arg0[%arg2] : memref<32xf32>
      %1 = arith.addf %0, %cst : f32
      affine.store %1, %arg1[%arg2] : memref<16xf32>
    }
    return
  }
}

// -----
module {
  func.func @same_memref_load_multiple_stores(%arg0: memref<32xf32>, %arg1: memref<32xf32>, %arg2: memref<16xf32>) {
    %cst = arith.constant 2.000000e+00 : f32
    affine.for %arg3 = 0 to 32 {
      %0 = affine.load %arg0[%arg3] : memref<32xf32>
      %1 = arith.mulf %0, %cst : f32
      affine.store %1, %arg0[%arg3] : memref<32xf32>
      affine.store %1, %arg1[%arg3] : memref<32xf32>
    }
    affine.for %arg3 = 0 to 16 {
      %0 = affine.load %arg0[%arg3] : memref<32xf32>
      %1 = affine.load %arg1[%arg3] : memref<32xf32>
      %2 = arith.addf %0, %1 : f32
      affine.store %2, %arg2[%arg3] : memref<16xf32>
    }
    return
  }
}

// -----
#map = affine_map<()[s0] -> (s0 + 5)>
#map1 = affine_map<()[s0] -> (s0 + 17)>
module {
  func.func @memref_index_type() {
    %0 = llvm.mlir.constant(2 : index) : i64
    %1 = llvm.mlir.constant(0 : index) : i64
    %2 = builtin.unrealized_conversion_cast %1 : i64 to index
    %alloc = memref.alloc() {alignment = 64 : i64} : memref<8x18xf32>
    %alloc_0 = memref.alloc() {alignment = 64 : i64} : memref<3xf32>
    %alloc_1 = memref.alloc() {alignment = 64 : i64} : memref<3xindex>
    affine.for %arg0 = 0 to 3 {
      %3 = affine.load %alloc_1[%arg0] : memref<3xindex>
      %4 = builtin.unrealized_conversion_cast %3 : index to i64
      %5 = llvm.sub %0, %4 : i64
      %6 = builtin.unrealized_conversion_cast %5 : i64 to index
      affine.store %6, %alloc_1[%arg0] : memref<3xindex>
    }
    affine.for %arg0 = 0 to 3 {
      %3 = affine.load %alloc_1[%arg0] : memref<3xindex>
      %4 = affine.apply #map()[%3]
      %5 = affine.apply #map1()[%2]
      %6 = memref.load %alloc[%4, %5] : memref<8x18xf32>
      affine.store %6, %alloc_0[%arg0] : memref<3xf32>
    }
    return
  }
}

// -----
#map = affine_map<(d0) -> (d0)>
module {
  func.func @non_int_memory_space() {
    %alloc = memref.alloc() : memref<256x8xf32, #spirv.storage_class<StorageBuffer>>
    affine.for %arg0 = 0 to 64 {
      affine.for %arg1 = 0 to 8 {
        %0 = affine.apply #map(%arg1)
        %1 = affine.load %alloc[%arg0, %0] : memref<256x8xf32, #spirv.storage_class<StorageBuffer>>
        affine.store %1, %alloc[%arg0, %arg1] : memref<256x8xf32, #spirv.storage_class<StorageBuffer>>
      }
    }
    affine.for %arg0 = 16 to 32 {
      affine.for %arg1 = 0 to 8 {
        %0 = affine.apply #map(%arg1)
        %1 = affine.load %alloc[%arg0, %0] : memref<256x8xf32, #spirv.storage_class<StorageBuffer>>
        affine.store %1, %alloc[%arg0, %arg1] : memref<256x8xf32, #spirv.storage_class<StorageBuffer>>
      }
    }
    return
  }
}

// -----
#map = affine_map<(d0) -> (d0)>
#map1 = affine_map<(d0) -> (d0 + 1)>
module {
  func.func @slice_compute_check(%arg0: memref<1x8x26xi32, strided<[?, ?, ?], offset: ?>>, %arg1: memref<1x8x26xi32, strided<[?, ?, ?], offset: ?>>, %arg2: memref<1x8x26xi32, strided<[?, ?, ?], offset: ?>>) {
    %alloc = memref.alloc() : memref<1x8x26xi32>
    %alloc_0 = memref.alloc() : memref<1x26xi32>
    affine.for %arg3 = 0 to 1 {
      affine.for %arg4 = 0 to 8 {
        affine.for %arg5 = 0 to 26 {
          affine.for %arg6 = #map(%arg3) to #map1(%arg3) {
            affine.for %arg7 = #map(%arg4) to #map1(%arg4) {
              affine.for %arg8 = #map(%arg5) to #map1(%arg5) {
                %0 = affine.load %alloc[%arg6, %arg7, %arg8] : memref<1x8x26xi32>
                %1 = affine.load %alloc_0[%arg6, %arg8] : memref<1x26xi32>
                %2 = llvm.intr.smin(%0, %1) : (i32, i32) -> i32
                affine.store %2, %alloc_0[%arg6, %arg8] : memref<1x26xi32>
              }
            }
          }
        }
      }
    }
    affine.for %arg3 = 0 to 26 {
      %0 = affine.load %alloc_0[0, %arg3] : memref<1x26xi32>
    }
    memref.dealloc %alloc_0 : memref<1x26xi32>
    memref.dealloc %alloc : memref<1x8x26xi32>
    return
  }
}

// -----
#map = affine_map<(d0) -> (d0)>
#map1 = affine_map<(d0) -> (d0 + 1)>
module {
  func.func @test_add_slice_bounds() {
    %alloc = memref.alloc() : memref<10xf32>
    %cst = arith.constant 6.191520e-01 : f32
    affine.for %arg0 = 0 to 10 {
      affine.for %arg1 = #map(%arg0) to #map1(%arg0) {
        affine.store %cst, %alloc[%arg1] : memref<10xf32>
      }
    }
    affine.for %arg0 = 0 to 3 {
      affine.for %arg1 = 0 to 10 {
        affine.for %arg2 = #map(%arg0) to #map1(%arg0) {
          affine.for %arg3 = #map(%arg1) to #map1(%arg1) {
            %0 = affine.apply #map1(%arg3)
            %1 = affine.load %alloc[%0] : memref<10xf32>
          }
        }
      }
    }
    return
  }
  func.func @producer_reduction_no_fusion(%arg0: memref<10xf32>, %arg1: memref<10xf32>, %arg2: memref<1xf32>) {
    %cst = arith.constant 0.000000e+00 : f32
    %cst_0 = arith.constant 1.000000e+00 : f32
    affine.for %arg3 = 0 to 10 {
      %0 = affine.load %arg0[%arg3] : memref<10xf32>
      %1 = affine.load %arg2[0] : memref<1xf32>
      %2 = arith.addf %0, %1 : f32
      affine.store %2, %arg2[0] : memref<1xf32>
    }
    affine.for %arg3 = 0 to 10 {
      %0 = affine.load %arg2[0] : memref<1xf32>
      %1 = arith.addf %0, %cst_0 : f32
      affine.store %1, %arg1[%arg3] : memref<10xf32>
    }
    return
  }
  func.func @sibling_reduction(%arg0: memref<10xf32>, %arg1: memref<10xf32>, %arg2: memref<10xf32>) {
    %cst = arith.constant 0.000000e+00 : f32
    %cst_0 = arith.constant 1.000000e+00 : f32
    affine.for %arg3 = 0 to 10 {
      %0 = affine.load %arg0[%arg3] : memref<10xf32>
      %1 = arith.addf %0, %cst_0 : f32
      affine.store %1, %arg1[%arg3] : memref<10xf32>
    }
    affine.for %arg3 = 0 to 10 {
      %0 = affine.load %arg0[%arg3] : memref<10xf32>
      %1 = affine.load %arg2[0] : memref<10xf32>
      %2 = arith.addf %0, %1 : f32
      affine.store %2, %arg2[0] : memref<10xf32>
    }
    return
  }
}

// -----
#map = affine_map<(d0) -> (d0 mod 65536)>
module {
  func.func @zero_tolerance(%arg0: memref<65536xcomplex<f64>>, %arg1: memref<30x131072xi64>, %arg2: memref<30xi64>, %arg3: memref<30xi64>, %arg4: memref<30xi64>, %arg5: memref<30xi64>) {
    %c65536 = arith.constant 65536 : index
    %cst = arith.constant 0.000000e+00 : f64
    %cst_0 = arith.constant 0x4320000000380004 : f64
    %cst_1 = arith.constant 5.000000e-01 : f64
    %alloc = memref.alloc() {alignment = 128 : i64} : memref<30x131072xi64>
    %alloc_2 = memref.alloc() {alignment = 128 : i64} : memref<131072xi1>
    %alloc_3 = memref.alloc() {alignment = 128 : i64} : memref<131072xi128>
    affine.for %arg6 = 0 to 131072 {
      %0 = affine.apply #map(%arg6)
      %1 = affine.load %arg0[%0] : memref<65536xcomplex<f64>>
      %2 = arith.cmpi ult, %arg6, %c65536 : index
      %3 = complex.im %1 : complex<f64>
      %4 = complex.re %1 : complex<f64>
      %5 = arith.select %2, %4, %3 : f64
      %6 = arith.cmpf olt, %5, %cst : f64
      %7 = arith.negf %5 : f64
      %8 = arith.select %6, %7, %5 : f64
      %9 = arith.mulf %8, %cst_0 : f64
      %10 = arith.addf %9, %cst_1 : f64
      %11 = arith.fptosi %10 : f64 to i128
      affine.store %11, %alloc_3[%arg6] : memref<131072xi128>
      affine.store %6, %alloc_2[%arg6] : memref<131072xi1>
    }
    affine.for %arg6 = 0 to 30 {
      affine.for %arg7 = 0 to 131072 {
        %0 = affine.load %arg5[%arg6] : memref<30xi64>
        %1 = affine.load %arg2[%arg6] : memref<30xi64>
        %2 = affine.load %arg4[%arg6] : memref<30xi64>
        %3 = affine.load %arg3[%arg6] : memref<30xi64>
        %4 = affine.load %alloc_3[%arg7] : memref<131072xi128>
        %5 = affine.load %alloc_2[%arg7] : memref<131072xi1>
        %6 = func.call @__external_reduce_barrett(%0, %1, %2, %3, %4) {outputModFac = 1 : i64} : (i64, i64, i64, i64, i128) -> i64
        %7 = arith.subi %0, %6 : i64
        %8 = arith.select %5, %7, %6 : i64
        affine.store %8, %alloc[%arg6, %arg7] : memref<30x131072xi64>
      }
    }
    call @__external_levelwise_forward_ntt(%alloc) : (memref<30x131072xi64>) -> ()
    affine.for %arg6 = 0 to 30 {
      affine.for %arg7 = 0 to 131072 {
        %0 = affine.load %alloc[%arg6, %arg7] : memref<30x131072xi64>
        affine.store %0, %arg1[%arg6, %arg7] : memref<30x131072xi64>
      }
    }
    memref.dealloc %alloc_3 : memref<131072xi128>
    memref.dealloc %alloc_2 : memref<131072xi1>
    memref.dealloc %alloc : memref<30x131072xi64>
    return
  }
  func.func private @__external_levelwise_forward_ntt(memref<30x131072xi64>)
  func.func private @__external_reduce_barrett(i64, i64, i64, i64, i128) -> i64
  func.func @unrolled(%arg0: memref<2x4xf32>, %arg1: memref<1x2x4xf32>) {
    %alloc = memref.alloc() : memref<1x2x4xf32>
    affine.for %arg2 = 0 to 1 {
      %0 = affine.load %arg0[0, 0] : memref<2x4xf32>
      %1 = affine.load %arg0[0, 1] : memref<2x4xf32>
      %2 = affine.load %arg0[0, 2] : memref<2x4xf32>
      %3 = affine.load %arg0[0, 3] : memref<2x4xf32>
      %4 = affine.load %arg0[1, 0] : memref<2x4xf32>
      %5 = affine.load %arg0[1, 1] : memref<2x4xf32>
      %6 = affine.load %arg0[1, 2] : memref<2x4xf32>
      %7 = affine.load %arg0[1, 3] : memref<2x4xf32>
      affine.store %0, %alloc[0, 0, 0] : memref<1x2x4xf32>
      affine.store %1, %alloc[0, 0, 1] : memref<1x2x4xf32>
      affine.store %2, %alloc[0, 0, 2] : memref<1x2x4xf32>
      affine.store %3, %alloc[0, 0, 3] : memref<1x2x4xf32>
      affine.store %4, %alloc[0, 1, 0] : memref<1x2x4xf32>
      affine.store %5, %alloc[0, 1, 1] : memref<1x2x4xf32>
      affine.store %6, %alloc[0, 1, 2] : memref<1x2x4xf32>
      affine.store %7, %alloc[0, 1, 3] : memref<1x2x4xf32>
    }
    affine.for %arg2 = 0 to 2 {
      affine.for %arg3 = 0 to 4 {
        %0 = affine.load %alloc[0, %arg2, %arg3] : memref<1x2x4xf32>
        %1 = arith.negf %0 : f32
        affine.store %1, %arg1[0, %arg2, %arg3] : memref<1x2x4xf32>
      }
    }
    return
  }
}

// -----
#map = affine_map<(d0, d1) -> (d0 + d1)>
#map1 = affine_map<(d0, d1) -> (d0 * 2 + d1 * 2)>
module {
  module {
    func.func @zero_candidates() {
      %cst = arith.constant 2.221140e+03 : f32
      %cst_0 = arith.constant 2.606200e+03 : f32
      %cst_1 = arith.constant 3.224000e+03 : f32
      %cst_2 = arith.constant 0.000000e+00 : f32
      %alloc = memref.alloc() {alignment = 64 : i64} : memref<3x7x5x6xf32>
      affine.for %arg0 = 0 to 3 {
        affine.for %arg1 = 0 to 7 {
          affine.for %arg2 = 0 to 5 {
            affine.for %arg3 = 0 to 6 {
              affine.store %cst_1, %alloc[%arg0, %arg1, %arg2, %arg3] : memref<3x7x5x6xf32>
            }
          }
        }
      }
      %alloc_3 = memref.alloc() {alignment = 64 : i64} : memref<3x10x7x6xf32>
      %subview = memref.subview %alloc_3[0, 2, 1, 0] [3, 7, 5, 6] [1, 1, 1, 1] : memref<3x10x7x6xf32> to memref<3x7x5x6xf32, strided<[420, 42, 6, 1], offset: 90>>
      memref.copy %alloc, %subview : memref<3x7x5x6xf32> to memref<3x7x5x6xf32, strided<[420, 42, 6, 1], offset: 90>>
      %alloc_4 = memref.alloc() {alignment = 64 : i64} : memref<3x10x3x6x1xf32>
      affine.for %arg0 = 0 to 3 {
        affine.for %arg1 = 0 to 10 {
          affine.for %arg2 = 0 to 3 {
            affine.for %arg3 = 0 to 6 {
              affine.for %arg4 = 0 to 1 {
                affine.store %cst_2, %alloc_4[%arg0, %arg1, %arg2, %arg3, %arg4] : memref<3x10x3x6x1xf32>
              }
            }
          }
        }
      }
      affine.for %arg0 = 0 to 3 {
        affine.for %arg1 = 0 to 10 {
          affine.for %arg2 = 0 to 3 {
            affine.for %arg3 = 0 to 6 {
              affine.for %arg4 = 0 to 1 {
                affine.for %arg5 = 0 to 1 {
                  affine.for %arg6 = 0 to 2 {
                    %0 = affine.apply #map(%arg1, %arg5)
                    %1 = affine.apply #map1(%arg2, %arg6)
                    %2 = affine.load %alloc_3[%arg0, %0, %1, %arg3] : memref<3x10x7x6xf32>
                    %3 = affine.load %alloc_4[%arg0, %arg1, %arg2, %arg3, %arg4] : memref<3x10x3x6x1xf32>
                    %4 = arith.mulf %2, %cst_0 : f32
                    %5 = arith.addf %3, %4 : f32
                    affine.store %5, %alloc_4[%arg0, %arg1, %arg2, %arg3, %arg4] : memref<3x10x3x6x1xf32>
                  }
                }
              }
            }
          }
        }
      }
      %alloc_5 = memref.alloc() {alignment = 64 : i64} : memref<3x10x3x6xf32>
      %expand_shape = memref.expand_shape %alloc_5 [[0], [1], [2], [3, 4]] output_shape [3, 10, 3, 6, 1] : memref<3x10x3x6xf32> into memref<3x10x3x6x1xf32>
      affine.for %arg0 = 0 to 3 {
        affine.for %arg1 = 0 to 10 {
          affine.for %arg2 = 0 to 3 {
            affine.for %arg3 = 0 to 6 {
              affine.for %arg4 = 0 to 1 {
                %0 = affine.load %alloc_4[%arg0, %arg1, %arg2, %arg3, %arg4] : memref<3x10x3x6x1xf32>
                %1 = arith.addf %0, %cst : f32
                affine.store %1, %expand_shape[%arg0, %arg1, %arg2, %arg3, %arg4] : memref<3x10x3x6x1xf32>
              }
            }
          }
        }
      }
      return
    }
  }
  func.func @memref_cast_reused(%arg0: memref<*xf32>) {
    %cast = memref.cast %arg0 : memref<*xf32> to memref<10xf32>
    %alloc = memref.alloc() : memref<10xf32>
    %alloc_0 = memref.alloc() : memref<10xf32>
    %cst = arith.constant 0.000000e+00 : f32
    %cst_1 = arith.constant 1.000000e+00 : f32
    affine.for %arg1 = 0 to 10 {
      %0 = affine.load %cast[%arg1] : memref<10xf32>
      %1 = arith.addf %0, %cst_1 : f32
      affine.store %1, %alloc[%arg1] : memref<10xf32>
    }
    affine.for %arg1 = 0 to 10 {
      %0 = affine.load %cast[%arg1] : memref<10xf32>
      %1 = affine.load %alloc_0[0] : memref<10xf32>
      %2 = arith.addf %0, %1 : f32
      affine.store %2, %alloc_0[0] : memref<10xf32>
    }
    return
  }
}

