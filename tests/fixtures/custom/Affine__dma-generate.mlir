module {
}

// -----
#map = affine_map<(d0) -> (d0 + 256)>
module {
  func.func @loop_nest_1d() {
    %alloc = memref.alloc() : memref<256xf32>
    %alloc_0 = memref.alloc() : memref<512xf32>
    %alloc_1 = memref.alloc() : memref<256xf32, 2>
    affine.for %arg0 = 0 to 256 {
      %0 = affine.load %alloc[%arg0] : memref<256xf32>
      %1 = affine.apply #map(%arg0)
      %2 = affine.load %alloc_0[%1] : memref<512xf32>
      %3 = affine.load %alloc_1[%arg0] : memref<256xf32, 2>
    }
    return
  }
}

// -----
#map = affine_map<(d0, d1) -> (d0 * 16 + d1)>
module {
  func.func @loop_nest_high_d(%arg0: memref<512x32xf32>, %arg1: memref<512x32xf32>, %arg2: memref<512x32xf32>) {
    affine.for %arg3 = 0 to 32 {
      affine.for %arg4 = 0 to 32 {
        affine.for %arg5 = 0 to 32 {
          affine.for %arg6 = 0 to 16 {
            %0 = affine.apply #map(%arg4, %arg6)
            %1 = affine.load %arg1[%0, %arg3] : memref<512x32xf32>
            "foo"(%1) : (f32) -> ()
          }
          affine.for %arg6 = 0 to 16 {
            %0 = affine.apply #map(%arg5, %arg6)
            %1 = affine.load %arg0[%0, %arg4] : memref<512x32xf32>
            "bar"(%1) : (f32) -> ()
          }
          affine.for %arg6 = 0 to 16 {
            %0 = "abc_compute"() : () -> f32
            %1 = affine.apply #map(%arg5, %arg6)
            %2 = affine.load %arg2[%1, %arg3] : memref<512x32xf32>
            %3 = "addf32"(%0, %2) : (f32, f32) -> f32
            affine.store %3, %arg2[%1, %arg3] : memref<512x32xf32>
          }
          "foobar"() : () -> ()
        }
      }
    }
    return
  }
}

// -----
#map = affine_map<(d0) -> (d0 mod 2)>
module {
  func.func @loop_nest_modulo() {
    %alloc = memref.alloc() : memref<256x8xf32>
    affine.for %arg0 = 0 to 32 step 4 {
      affine.for %arg1 = 0 to 8 {
        %0 = affine.apply #map(%arg1)
        %1 = affine.load %alloc[%arg0, %0] : memref<256x8xf32>
      }
    }
    return
  }
}

// -----
#map = affine_map<(d0) -> (d0)>
#map1 = affine_map<(d0) -> (d0 + 32)>
module {
  func.func @loop_nest_tiled() -> memref<256x1024xf32> {
    %alloc = memref.alloc() : memref<256x1024xf32>
    affine.for %arg0 = 0 to 256 step 32 {
      affine.for %arg1 = 0 to 1024 step 32 {
        affine.for %arg2 = #map(%arg0) to #map1(%arg0) {
          affine.for %arg3 = #map(%arg1) to #map1(%arg1) {
            %0 = affine.load %alloc[%arg2, %arg3] : memref<256x1024xf32>
          }
        }
      }
    }
    return %alloc : memref<256x1024xf32>
  }
}

// -----
module {
  func.func @dma_constant_dim_access(%arg0: memref<100x100xf32>) {
    %c1 = arith.constant 1 : index
    %c100 = arith.constant 100 : index
    affine.for %arg1 = 0 to 100 {
      affine.for %arg2 = 0 to %c100 {
        %0 = affine.load %arg0[%c1, %arg2] : memref<100x100xf32>
      }
    }
    return
  }
}

// -----
#map = affine_map<(d0, d1)[s0, s1] -> (d1 + s0 + s1)>
module {
  func.func @dma_with_symbolic_accesses(%arg0: memref<100x100xf32>, %arg1: index) {
    %c9 = arith.constant 9 : index
    affine.for %arg2 = 0 to 100 {
      affine.for %arg3 = 0 to 100 {
        %0 = affine.apply #map(%arg2, %arg3)[%arg1, %c9]
        %1 = affine.load %arg0[%arg2, %0] : memref<100x100xf32>
      }
    }
    return
  }
}

// -----
#map = affine_map<(d0)[s0] -> (d0 + s0)>
module {
  func.func @dma_with_symbolic_loop_bounds(%arg0: memref<100x100xf32>, %arg1: index, %arg2: index) {
    %c9 = arith.constant 9 : index
    affine.for %arg3 = 0 to 100 {
      affine.for %arg4 = %arg1 to %arg2 {
        %0 = affine.apply #map(%arg4)[%c9]
        %1 = affine.load %arg0[%arg3, %0] : memref<100x100xf32>
      }
    }
    return
  }
}

// -----
module {
  func.func @dma_unknown_size(%arg0: memref<?x?xf32>) {
    %c0 = arith.constant 0 : index
    %dim = memref.dim %arg0, %c0 : memref<?x?xf32>
    %dim_0 = memref.dim %arg0, %c0 : memref<?x?xf32>
    affine.for %arg1 = 0 to %dim {
      affine.for %arg2 = 0 to %dim_0 {
        %0 = affine.load %arg0[%arg1, %arg2] : memref<?x?xf32>
      }
    }
    return
  }
}

// -----
#map = affine_map<(d0) -> (d0 mod 128)>
module {
  func.func @dma_memref_3d(%arg0: memref<1024x1024x1024xf32>) {
    affine.for %arg1 = 0 to 1024 {
      affine.for %arg2 = 0 to 1024 {
        affine.for %arg3 = 0 to 1024 {
          %0 = affine.apply #map(%arg1)
          %1 = affine.apply #map(%arg2)
          %2 = affine.apply #map(%arg3)
          %3 = affine.load %arg0[%0, %1, %2] : memref<1024x1024x1024xf32>
        }
      }
    }
    return
  }
}

// -----
#map = affine_map<(d0) -> (d0 + 64)>
#map1 = affine_map<(d0) -> (d0 + 128)>
#map2 = affine_map<(d0) -> (d0 + 2)>
#map3 = affine_map<(d0) -> (d0 + 192)>
module {
  func.func @multi_load_store_union() {
    %alloc = memref.alloc() : memref<512x512xf32>
    affine.for %arg0 = 0 to 256 {
      affine.for %arg1 = 0 to 256 {
        %0 = affine.apply #map(%arg0)
        %1 = affine.apply #map1(%arg1)
        %2 = affine.apply #map2(%arg0)
        %3 = affine.apply #map2(%arg1)
        %4 = affine.load %alloc[%2, %1] : memref<512x512xf32>
        %5 = affine.load %alloc[%0, %3] : memref<512x512xf32>
        %6 = affine.apply #map1(%arg0)
        %7 = affine.apply #map3(%arg1)
        affine.store %4, %alloc[%2, %7] : memref<512x512xf32>
        affine.store %5, %alloc[%6, %3] : memref<512x512xf32>
      }
    }
    return
  }
}

// -----
module {
  func.func @dma_loop_straightline_interspersed() {
    %c0 = arith.constant 0 : index
    %c255 = arith.constant 255 : index
    %alloc = memref.alloc() : memref<256xf32>
    %0 = affine.load %alloc[%c0] : memref<256xf32>
    affine.for %arg0 = 1 to 255 {
      %2 = affine.load %alloc[%arg0] : memref<256xf32>
    }
    %1 = affine.load %alloc[%c255] : memref<256xf32>
    affine.store %1, %alloc[%c0] : memref<256xf32>
    return
  }
}

// -----
module {
  func.func @dma_mixed_loop_blocks() {
    %c0 = arith.constant 0 : index
    %alloc = memref.alloc() : memref<256x256xvector<8xf32>>
    affine.for %arg0 = 0 to 256 {
      %0 = affine.load %alloc[%c0, %c0] : memref<256x256xvector<8xf32>>
      "foo"(%0) : (vector<8xf32>) -> ()
      affine.for %arg1 = 0 to 256 {
        %1 = affine.load %alloc[%arg0, %arg1] : memref<256x256xvector<8xf32>>
        "bar"(%1) : (vector<8xf32>) -> ()
      }
    }
    return
  }
}

// -----
#map = affine_map<(d0) -> (d0)>
#map1 = affine_map<(d0) -> (d0 + 4)>
module {
  func.func @relative_loop_bounds(%arg0: memref<1027xf32>) {
    affine.for %arg1 = 0 to 1024 {
      affine.for %arg2 = #map(%arg1) to #map1(%arg1) {
        %cst = arith.constant 0.000000e+00 : f32
        affine.store %cst, %arg0[%arg2] : memref<1027xf32>
      }
    }
    return
  }
}

// -----
#map = affine_map<(d0) -> (d0 + 100)>
#map1 = affine_map<(d0) -> (d0 + 25)>
module {
  func.func @test_read_write_region_union() {
    %alloc = memref.alloc() : memref<256xf32>
    affine.for %arg0 = 0 to 10 {
      %0 = affine.apply #map(%arg0)
      %1 = affine.apply #map1(%arg0)
      %2 = affine.load %alloc[%0] : memref<256xf32>
      affine.store %2, %alloc[%1] : memref<256xf32>
    }
    return
  }
}

// -----
#map = affine_map<(d0) -> (d0)>
#map1 = affine_map<(d0) -> (d0 + 3)>
module {
  func.func @test_analysis_util(%arg0: memref<4x4x16x1xf32>, %arg1: memref<144x9xf32>, %arg2: memref<2xf32>) -> (memref<144x9xf32>, memref<2xf32>) {
    %c0 = arith.constant 0 : index
    %alloc = memref.alloc() : memref<64x1xf32>
    %alloc_0 = memref.alloc() : memref<144x4xf32>
    %cst = arith.constant 0.000000e+00 : f32
    affine.for %arg3 = 0 to 9 step 3 {
      affine.for %arg4 = #map(%arg3) to #map1(%arg3) {
        affine.for %arg5 = 0 to 64 {
          %0 = affine.load %arg2[%arg4 floordiv 8] : memref<2xf32>
          %1 = affine.load %alloc[%arg5, %c0] : memref<64x1xf32>
          affine.store %1, %arg2[%arg5] : memref<2xf32>
        }
      }
    }
    return %arg1, %arg2 : memref<144x9xf32>, memref<2xf32>
  }
}

// -----
#map = affine_map<(d0) -> (d0)>
#map1 = affine_map<(d0) -> (d0 + 3)>
#map2 = affine_map<(d0, d1) -> ((d0 + d1 * 72) floordiv 2304 + (d0 mod 9) floordiv 3)>
#map3 = affine_map<(d0, d1) -> ((d0 + d1 * 72) mod 2304 - (((d0 + d1 * 72) mod 2304) floordiv 1152) * 1151 - (((d0 + d1 * 72) mod 1152) floordiv 9) * 9 - ((d0 mod 9) floordiv 3) * 3)>
#map4 = affine_map<(d0, d1) -> ((((d0 + d1 * 72) mod 1152) floordiv 9) floordiv 8)>
module {
  func.func @test_memref_bounds(%arg0: memref<4x4x16x1xvector<8x128xf32>>, %arg1: memref<144x9xvector<8x128xf32>>, %arg2: memref<2xvector<8x128xf32>>) -> (memref<144x9xvector<8x128xf32>>, memref<2xvector<8x128xf32>>) {
    %c0 = arith.constant 0 : index
    affine.for %arg3 = 0 to 9 step 3 {
      affine.for %arg4 = #map(%arg3) to #map1(%arg3) {
        affine.for %arg5 = 0 to 64 {
          %0 = affine.apply #map2(%arg4, %arg5)
          %1 = affine.apply #map3(%arg4, %arg5)
          %2 = affine.apply #map4(%arg4, %arg5)
          %3 = affine.load %arg0[%0, %1, %2, %c0] : memref<4x4x16x1xvector<8x128xf32>>
        }
      }
    }
    return %arg1, %arg2 : memref<144x9xvector<8x128xf32>>, memref<2xvector<8x128xf32>>
  }
}

// -----
#map = affine_map<(d0) -> (d0)>
#map1 = affine_map<(d0) -> (d0 + 4)>
module {
  func.func @load_store_same_memref(%arg0: memref<256x1024xf32>) {
    affine.for %arg1 = 0 to 256 step 4 {
      affine.for %arg2 = 0 to 1024 step 4 {
        affine.for %arg3 = #map(%arg1) to #map1(%arg1) {
          affine.for %arg4 = #map(%arg2) to #map1(%arg2) {
            %0 = affine.load %arg0[%arg3, %arg4] : memref<256x1024xf32>
            %1 = arith.mulf %0, %0 : f32
            affine.store %1, %arg0[%arg3, %arg4] : memref<256x1024xf32>
          }
        }
      }
    }
    return
  }
}

// -----
#map = affine_map<(d0) -> (d0)>
#map1 = affine_map<(d0) -> (d0 + 4)>
module {
  func.func @simple_matmul(%arg0: memref<8x8xvector<64xf32>>, %arg1: memref<8x8xvector<64xf32>>, %arg2: memref<8x8xvector<64xf32>>) -> memref<8x8xvector<64xf32>> {
    affine.for %arg3 = 0 to 8 step 4 {
      affine.for %arg4 = 0 to 8 step 4 {
        affine.for %arg5 = 0 to 8 step 4 {
          affine.for %arg6 = #map(%arg3) to #map1(%arg3) {
            affine.for %arg7 = #map(%arg4) to #map1(%arg4) {
              affine.for %arg8 = #map(%arg5) to #map1(%arg5) {
                %0 = affine.load %arg0[%arg6, %arg8] : memref<8x8xvector<64xf32>>
                %1 = affine.load %arg1[%arg8, %arg7] : memref<8x8xvector<64xf32>>
                %2 = affine.load %arg2[%arg6, %arg7] : memref<8x8xvector<64xf32>>
                %3 = arith.mulf %0, %1 : vector<64xf32>
                %4 = arith.addf %2, %3 : vector<64xf32>
                affine.store %4, %arg2[%arg6, %arg7] : memref<8x8xvector<64xf32>>
              }
            }
          }
        }
      }
    }
    return %arg2 : memref<8x8xvector<64xf32>>
  }
}

