module {
}

// -----
#set = affine_set<(d0) : (1 == 0)>
module {
  func.func @store_may_execute_before_load() {
    %alloc = memref.alloc() : memref<10xf32>
    %cst = arith.constant 7.000000e+00 : f32
    %c4 = arith.constant 4 : index
    affine.if #set(%c4) {
      affine.for %arg0 = 0 to 10 {
        affine.store %cst, %alloc[%arg0] : memref<10xf32>
      }
    }
    affine.for %arg0 = 0 to 10 {
      %0 = affine.load %alloc[%arg0] : memref<10xf32>
    }
    return
  }
}

// -----
module {
  func.func @dependent_loops() {
    %alloc = memref.alloc() : memref<10xf32>
    %cst = arith.constant 7.000000e+00 : f32
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
  func.func @different_memrefs() {
    %alloc = memref.alloc() : memref<100xf32>
    %alloc_0 = memref.alloc() : memref<100xf32>
    %c0 = arith.constant 0 : index
    %cst = arith.constant 1.000000e+00 : f32
    affine.store %cst, %alloc[%c0] : memref<100xf32>
    %0 = affine.load %alloc_0[%c0] : memref<100xf32>
    return
  }
}

// -----
module {
  func.func @store_load_different_elements() {
    %alloc = memref.alloc() : memref<100xf32>
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %cst = arith.constant 7.000000e+00 : f32
    affine.store %cst, %alloc[%c0] : memref<100xf32>
    %0 = affine.load %alloc[%c1] : memref<100xf32>
    return
  }
}

// -----
module {
  func.func @load_store_different_elements() {
    %alloc = memref.alloc() : memref<100xf32>
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %cst = arith.constant 7.000000e+00 : f32
    %0 = affine.load %alloc[%c1] : memref<100xf32>
    affine.store %cst, %alloc[%c0] : memref<100xf32>
    return
  }
}

// -----
module {
  func.func @store_load_same_element() {
    %alloc = memref.alloc() : memref<100xf32>
    %c11 = arith.constant 11 : index
    %cst = arith.constant 7.000000e+00 : f32
    affine.store %cst, %alloc[%c11] : memref<100xf32>
    %0 = affine.load %alloc[%c11] : memref<100xf32>
    return
  }
}

// -----
module {
  func.func @load_load_same_element() {
    %alloc = memref.alloc() : memref<100xf32>
    %c11 = arith.constant 11 : index
    %cst = arith.constant 7.000000e+00 : f32
    %0 = affine.load %alloc[%c11] : memref<100xf32>
    %1 = affine.load %alloc[%c11] : memref<100xf32>
    return
  }
}

// -----
module {
  func.func @store_load_same_symbol(%arg0: index) {
    %alloc = memref.alloc() : memref<100xf32>
    %cst = arith.constant 7.000000e+00 : f32
    affine.store %cst, %alloc[%arg0] : memref<100xf32>
    %0 = affine.load %alloc[%arg0] : memref<100xf32>
    return
  }
}

// -----
module {
  func.func @store_load_different_symbols(%arg0: index, %arg1: index) {
    %alloc = memref.alloc() : memref<100xf32>
    %cst = arith.constant 7.000000e+00 : f32
    affine.store %cst, %alloc[%arg0] : memref<100xf32>
    %0 = affine.load %alloc[%arg1] : memref<100xf32>
    return
  }
}

// -----
#map = affine_map<(d0) -> (d0)>
#map1 = affine_map<(d0) -> (d0 + 1)>
module {
  func.func @store_load_diff_element_affine_apply_const() {
    %alloc = memref.alloc() : memref<100xf32>
    %c1 = arith.constant 1 : index
    %cst = arith.constant 8.000000e+00 : f32
    %0 = affine.apply #map(%c1)
    affine.store %cst, %alloc[%0] : memref<100xf32>
    %1 = affine.apply #map1(%c1)
    %2 = affine.load %alloc[%1] : memref<100xf32>
    return
  }
}

// -----
#map = affine_map<(d0) -> (d0 + 1)>
#map1 = affine_map<(d0) -> (d0 - 1)>
module {
  func.func @store_load_same_element_affine_apply_const() {
    %alloc = memref.alloc() : memref<100xf32>
    %cst = arith.constant 7.000000e+00 : f32
    %c9 = arith.constant 9 : index
    %c11 = arith.constant 11 : index
    %0 = affine.apply #map(%c9)
    affine.store %cst, %alloc[%0] : memref<100xf32>
    %1 = affine.apply #map1(%c11)
    %2 = affine.load %alloc[%1] : memref<100xf32>
    return
  }
}

// -----
#map = affine_map<(d0) -> (d0)>
module {
  func.func @store_load_affine_apply_symbol(%arg0: index) {
    %alloc = memref.alloc() : memref<100xf32>
    %cst = arith.constant 7.000000e+00 : f32
    %0 = affine.apply #map(%arg0)
    affine.store %cst, %alloc[%0] : memref<100xf32>
    %1 = affine.apply #map(%arg0)
    %2 = affine.load %alloc[%1] : memref<100xf32>
    return
  }
}

// -----
#map = affine_map<(d0) -> (d0)>
#map1 = affine_map<(d0) -> (d0 + 1)>
module {
  func.func @store_load_affine_apply_symbol_offset(%arg0: index) {
    %alloc = memref.alloc() : memref<100xf32>
    %cst = arith.constant 7.000000e+00 : f32
    %0 = affine.apply #map(%arg0)
    affine.store %cst, %alloc[%0] : memref<100xf32>
    %1 = affine.apply #map1(%arg0)
    %2 = affine.load %alloc[%1] : memref<100xf32>
    return
  }
}

// -----
#map = affine_map<(d0) -> (d0)>
module {
  func.func @store_range_load_after_range() {
    %alloc = memref.alloc() : memref<100xf32>
    %cst = arith.constant 7.000000e+00 : f32
    %c10 = arith.constant 10 : index
    affine.for %arg0 = 0 to 10 {
      %0 = affine.apply #map(%arg0)
      affine.store %cst, %alloc[%0] : memref<100xf32>
      %1 = affine.apply #map(%c10)
      %2 = affine.load %alloc[%1] : memref<100xf32>
    }
    return
  }
}

// -----
#map = affine_map<(d0) -> (d0)>
module {
  func.func @store_load_func_symbol(%arg0: index, %arg1: index) {
    %alloc = memref.alloc() : memref<100xf32>
    %cst = arith.constant 7.000000e+00 : f32
    %c10 = arith.constant 10 : index
    affine.for %arg2 = 0 to %arg1 {
      %0 = affine.apply #map(%arg0)
      affine.store %cst, %alloc[%0] : memref<100xf32>
      %1 = affine.apply #map(%arg0)
      %2 = affine.load %alloc[%1] : memref<100xf32>
    }
    return
  }
}

// -----
#map = affine_map<(d0) -> (d0)>
#map1 = affine_map<(d0) -> (d0 - 1)>
module {
  func.func @store_range_load_last_in_range() {
    %alloc = memref.alloc() : memref<100xf32>
    %cst = arith.constant 7.000000e+00 : f32
    %c10 = arith.constant 10 : index
    affine.for %arg0 = 0 to 10 {
      %0 = affine.apply #map(%arg0)
      affine.store %cst, %alloc[%0] : memref<100xf32>
      %1 = affine.apply #map1(%c10)
      %2 = affine.load %alloc[%1] : memref<100xf32>
    }
    return
  }
}

// -----
#map = affine_map<(d0) -> (d0)>
module {
  func.func @store_range_load_before_range() {
    %alloc = memref.alloc() : memref<100xf32>
    %cst = arith.constant 7.000000e+00 : f32
    %c0 = arith.constant 0 : index
    affine.for %arg0 = 1 to 11 {
      %0 = affine.apply #map(%arg0)
      affine.store %cst, %alloc[%0] : memref<100xf32>
      %1 = affine.apply #map(%c0)
      %2 = affine.load %alloc[%1] : memref<100xf32>
    }
    return
  }
}

// -----
#map = affine_map<(d0) -> (d0)>
#map1 = affine_map<(d0) -> (d0 + 1)>
module {
  func.func @store_range_load_first_in_range() {
    %alloc = memref.alloc() : memref<100xf32>
    %cst = arith.constant 7.000000e+00 : f32
    %c0 = arith.constant 0 : index
    affine.for %arg0 = 1 to 11 {
      %0 = affine.apply #map(%arg0)
      affine.store %cst, %alloc[%0] : memref<100xf32>
      %1 = affine.apply #map1(%c0)
      %2 = affine.load %alloc[%1] : memref<100xf32>
    }
    return
  }
}

// -----
#map = affine_map<(d0) -> (d0 + 3)>
#map1 = affine_map<(d0) -> (d0)>
module {
  func.func @store_plus_3() {
    %alloc = memref.alloc() : memref<100xf32>
    %cst = arith.constant 7.000000e+00 : f32
    affine.for %arg0 = 1 to 11 {
      %0 = affine.apply #map(%arg0)
      affine.store %cst, %alloc[%0] : memref<100xf32>
      %1 = affine.apply #map1(%arg0)
      %2 = affine.load %alloc[%1] : memref<100xf32>
    }
    return
  }
}

// -----
#map = affine_map<(d0) -> (d0)>
#map1 = affine_map<(d0) -> (d0 - 2)>
module {
  func.func @load_minus_2() {
    %alloc = memref.alloc() : memref<100xf32>
    %cst = arith.constant 7.000000e+00 : f32
    affine.for %arg0 = 2 to 11 {
      %0 = affine.apply #map(%arg0)
      affine.store %cst, %alloc[%0] : memref<100xf32>
      %1 = affine.apply #map1(%arg0)
      %2 = affine.load %alloc[%1] : memref<100xf32>
    }
    return
  }
}

// -----
#map = affine_map<(d0, d1) -> (d0)>
#map1 = affine_map<(d0, d1) -> (d1)>
module {
  func.func @perfectly_nested_loops_loop_independent() {
    %alloc = memref.alloc() : memref<10x10xf32>
    %cst = arith.constant 7.000000e+00 : f32
    affine.for %arg0 = 0 to 11 {
      affine.for %arg1 = 0 to 11 {
        %0 = affine.apply #map(%arg0, %arg1)
        %1 = affine.apply #map1(%arg0, %arg1)
        affine.store %cst, %alloc[%0, %1] : memref<10x10xf32>
        %2 = affine.apply #map(%arg0, %arg1)
        %3 = affine.apply #map1(%arg0, %arg1)
        %4 = affine.load %alloc[%2, %3] : memref<10x10xf32>
      }
    }
    return
  }
}

// -----
#map = affine_map<(d0, d1) -> (d0)>
#map1 = affine_map<(d0, d1) -> (d1)>
#map2 = affine_map<(d0, d1) -> (d0 - 2)>
module {
  func.func @perfectly_nested_loops_loop_carried_at_depth1() {
    %alloc = memref.alloc() : memref<10x10xf32>
    %cst = arith.constant 7.000000e+00 : f32
    affine.for %arg0 = 0 to 9 {
      affine.for %arg1 = 0 to 9 {
        %0 = affine.apply #map(%arg0, %arg1)
        %1 = affine.apply #map1(%arg0, %arg1)
        affine.store %cst, %alloc[%0, %1] : memref<10x10xf32>
        %2 = affine.apply #map2(%arg0, %arg1)
        %3 = affine.apply #map1(%arg0, %arg1)
        %4 = affine.load %alloc[%2, %3] : memref<10x10xf32>
      }
    }
    return
  }
}

// -----
#map = affine_map<(d0, d1) -> (d0)>
#map1 = affine_map<(d0, d1) -> (d1)>
#map2 = affine_map<(d0, d1) -> (d1 - 3)>
module {
  func.func @perfectly_nested_loops_loop_carried_at_depth2() {
    %alloc = memref.alloc() : memref<10x10xf32>
    %cst = arith.constant 7.000000e+00 : f32
    affine.for %arg0 = 0 to 10 {
      affine.for %arg1 = 0 to 10 {
        %0 = affine.apply #map(%arg0, %arg1)
        %1 = affine.apply #map1(%arg0, %arg1)
        affine.store %cst, %alloc[%0, %1] : memref<10x10xf32>
        %2 = affine.apply #map(%arg0, %arg1)
        %3 = affine.apply #map2(%arg0, %arg1)
        %4 = affine.load %alloc[%2, %3] : memref<10x10xf32>
      }
    }
    return
  }
}

// -----
#map = affine_map<(d0, d1) -> (d0)>
#map1 = affine_map<(d0, d1) -> (d1)>
module {
  func.func @one_common_loop() {
    %alloc = memref.alloc() : memref<10x10xf32>
    %cst = arith.constant 7.000000e+00 : f32
    affine.for %arg0 = 0 to 10 {
      affine.for %arg1 = 0 to 10 {
        %0 = affine.apply #map(%arg0, %arg1)
        %1 = affine.apply #map1(%arg0, %arg1)
        affine.store %cst, %alloc[%0, %1] : memref<10x10xf32>
      }
      affine.for %arg1 = 0 to 9 {
        %0 = affine.apply #map(%arg0, %arg1)
        %1 = affine.apply #map1(%arg0, %arg1)
        %2 = affine.load %alloc[%0, %1] : memref<10x10xf32>
      }
    }
    return
  }
}

// -----
#map = affine_map<(d0) -> (d0)>
#map1 = affine_map<(d0) -> (d0 + 1)>
module {
  func.func @dependence_cycle() {
    %alloc = memref.alloc() : memref<100xf32>
    %alloc_0 = memref.alloc() : memref<100xf32>
    affine.for %arg0 = 0 to 9 {
      %0 = affine.apply #map(%arg0)
      %1 = affine.load %alloc[%0] : memref<100xf32>
      %2 = affine.apply #map(%arg0)
      affine.store %1, %alloc_0[%2] : memref<100xf32>
      %3 = affine.apply #map(%arg0)
      %4 = affine.load %alloc_0[%3] : memref<100xf32>
      %5 = affine.apply #map1(%arg0)
      affine.store %4, %alloc[%5] : memref<100xf32>
    }
    return
  }
}

// -----
#map = affine_map<(d0, d1) -> (d0 - 1)>
#map1 = affine_map<(d0, d1) -> (d1 + 1)>
#map2 = affine_map<(d0, d1) -> (d0)>
#map3 = affine_map<(d0, d1) -> (d1)>
module {
  func.func @negative_and_positive_direction_vectors(%arg0: index, %arg1: index) {
    %alloc = memref.alloc() : memref<10x10xf32>
    %cst = arith.constant 7.000000e+00 : f32
    affine.for %arg2 = 0 to %arg0 {
      affine.for %arg3 = 0 to %arg1 {
        %0 = affine.apply #map(%arg2, %arg3)
        %1 = affine.apply #map1(%arg2, %arg3)
        %2 = affine.load %alloc[%0, %1] : memref<10x10xf32>
        %3 = affine.apply #map2(%arg2, %arg3)
        %4 = affine.apply #map3(%arg2, %arg3)
        affine.store %cst, %alloc[%3, %4] : memref<10x10xf32>
      }
    }
    return
  }
}

// -----
#map = affine_map<(d0) -> (d0 + 1)>
#map1 = affine_map<(d0) -> (d0)>
module {
  func.func @war_raw_waw_deps() {
    %alloc = memref.alloc() : memref<100xf32>
    %cst = arith.constant 7.000000e+00 : f32
    affine.for %arg0 = 0 to 10 {
      affine.for %arg1 = 0 to 10 {
        %0 = affine.apply #map(%arg1)
        %1 = affine.load %alloc[%0] : memref<100xf32>
        %2 = affine.apply #map1(%arg1)
        affine.store %cst, %alloc[%2] : memref<100xf32>
      }
    }
    return
  }
}

// -----
#map = affine_map<(d0) -> (d0 mod 2)>
#map1 = affine_map<(d0) -> ((d0 + 1) mod 2)>
module {
  func.func @mod_deps() {
    %alloc = memref.alloc() : memref<100xf32>
    %cst = arith.constant 7.000000e+00 : f32
    affine.for %arg0 = 0 to 10 {
      %0 = affine.apply #map(%arg0)
      %1 = affine.load %alloc[%0] : memref<100xf32>
      %2 = affine.apply #map1(%arg0)
      affine.store %cst, %alloc[%2] : memref<100xf32>
    }
    return
  }
}

// -----
#map = affine_map<(d0, d1) -> (d0 * 16 + d1)>
module {
  func.func @loop_nest_depth() {
    %alloc = memref.alloc() : memref<100x100xf32>
    %cst = arith.constant 7.000000e+00 : f32
    affine.for %arg0 = 0 to 128 {
      affine.for %arg1 = 0 to 8 {
        affine.store %cst, %alloc[%arg0, %arg1] : memref<100x100xf32>
      }
    }
    affine.for %arg0 = 0 to 8 {
      affine.for %arg1 = 0 to 8 {
        affine.for %arg2 = 0 to 8 {
          affine.for %arg3 = 0 to 16 {
            %0 = affine.apply #map(%arg2, %arg3)
            %1 = affine.load %alloc[%0, %arg1] : memref<100x100xf32>
          }
        }
      }
    }
    return
  }
}

// -----
#map = affine_map<(d0, d1, d2) -> (d0 floordiv 4)>
#map1 = affine_map<(d0, d1, d2) -> (d1 mod 2)>
#map2 = affine_map<(d0, d1, d2) -> (d2 floordiv 4)>
module {
  func.func @mod_div_3d() {
    %alloc = memref.alloc() : memref<2x2x2xi32>
    %c0_i32 = arith.constant 0 : i32
    affine.for %arg0 = 0 to 8 {
      affine.for %arg1 = 0 to 8 {
        affine.for %arg2 = 0 to 8 {
          %0 = affine.apply #map(%arg0, %arg1, %arg2)
          %1 = affine.apply #map1(%arg0, %arg1, %arg2)
          %2 = affine.apply #map2(%arg0, %arg1, %arg2)
          affine.store %c0_i32, %alloc[%0, %1, %2] : memref<2x2x2xi32>
        }
      }
    }
    return
  }
}

// -----
#map = affine_map<(d0, d1) -> (d0 * 9216 + d1 * 128)>
#map1 = affine_map<(d0) -> (d0 floordiv 294912)>
#map2 = affine_map<(d0) -> ((d0 mod 294912) floordiv 147456)>
#map3 = affine_map<(d0) -> (((d0 mod 147456) floordiv 1152) floordiv 8)>
#map4 = affine_map<(d0) -> ((d0 mod 1152) floordiv 384)>
#map5 = affine_map<(d0) -> ((d0 mod 384) floordiv 128)>
#map6 = affine_map<(d0) -> ((d0 mod 128) floordiv 128)>
module {
  func.func @delinearize_mod_floordiv() {
    %c0 = arith.constant 0 : index
    %c0_i32 = arith.constant 0 : i32
    %alloc = memref.alloc() : memref<2x2x3x3x16x1xi32>
    %alloc_0 = memref.alloc() : memref<64x9xi32>
    affine.for %arg0 = 0 to 2 {
      affine.for %arg1 = 0 to 2 {
        affine.for %arg2 = 0 to 3 {
          affine.for %arg3 = 0 to 3 {
            affine.for %arg4 = 0 to 16 {
              affine.for %arg5 = 0 to 1 {
                affine.store %c0_i32, %alloc[%arg0, %arg1, %arg2, %arg3, %arg4, %arg5] : memref<2x2x3x3x16x1xi32>
              }
            }
          }
        }
      }
    }
    affine.for %arg0 = 0 to 64 {
      affine.for %arg1 = 0 to 9 {
        %0 = affine.apply #map(%arg0, %arg1)
        %1 = affine.apply #map1(%0)
        %2 = affine.apply #map2(%0)
        %3 = affine.apply #map3(%0)
        %4 = affine.apply #map4(%0)
        %5 = affine.apply #map5(%0)
        %6 = affine.apply #map6(%0)
        %7 = affine.load %alloc[%1, %2, %4, %5, %3, %6] : memref<2x2x3x3x16x1xi32>
        affine.store %7, %alloc_0[%arg0, %arg1] : memref<64x9xi32>
      }
    }
    return
  }
}

// -----
module {
  func.func @strided_loop_with_dependence_at_depth2() {
    %alloc = memref.alloc() : memref<10xf32>
    %cst = arith.constant 0.000000e+00 : f32
    affine.for %arg0 = 0 to 8 step 2 {
      affine.store %cst, %alloc[%arg0] : memref<10xf32>
      %0 = affine.load %alloc[%arg0] : memref<10xf32>
    }
    return
  }
}

// -----
#map = affine_map<(d0) -> (d0 + 1)>
module {
  func.func @strided_loop_with_no_dependence() {
    %alloc = memref.alloc() : memref<10xf32>
    %cst = arith.constant 0.000000e+00 : f32
    affine.for %arg0 = 0 to 8 step 2 {
      %0 = affine.apply #map(%arg0)
      affine.store %cst, %alloc[%0] : memref<10xf32>
      %1 = affine.load %alloc[%arg0] : memref<10xf32>
    }
    return
  }
}

// -----
#map = affine_map<(d0) -> (d0 + 4)>
module {
  func.func @strided_loop_with_loop_carried_dependence_at_depth1() {
    %alloc = memref.alloc() : memref<10xf32>
    %cst = arith.constant 0.000000e+00 : f32
    affine.for %arg0 = 0 to 8 step 2 {
      %0 = affine.apply #map(%arg0)
      affine.store %cst, %alloc[%0] : memref<10xf32>
      %1 = affine.load %alloc[%arg0] : memref<10xf32>
    }
    return
  }
}

// -----
#map = affine_map<(d0) -> (d0 - 1)>
#map1 = affine_map<(d0) -> (d0)>
#map2 = affine_map<(d0) -> (d0 + 1)>
module {
  func.func @test_dep_store_depth1_load_depth2() {
    %alloc = memref.alloc() : memref<100xf32>
    %cst = arith.constant 7.000000e+00 : f32
    affine.for %arg0 = 0 to 10 {
      %0 = affine.apply #map(%arg0)
      affine.store %cst, %alloc[%0] : memref<100xf32>
      affine.for %arg1 = #map1(%arg0) to #map2(%arg0) {
        %1 = affine.load %alloc[%arg1] : memref<100xf32>
      }
    }
    return
  }
}

// -----
#map = affine_map<(d0) -> (d0)>
#map1 = affine_map<(d0) -> (d0 + 1)>
#map2 = affine_map<(d0) -> (d0 - 2)>
module {
  func.func @test_dep_store_depth2_load_depth1() {
    %alloc = memref.alloc() : memref<100xf32>
    %cst = arith.constant 7.000000e+00 : f32
    affine.for %arg0 = 0 to 10 {
      affine.for %arg1 = #map(%arg0) to #map1(%arg0) {
        affine.store %cst, %alloc[%arg1] : memref<100xf32>
      }
      %0 = affine.apply #map2(%arg0)
      %1 = affine.load %alloc[%0] : memref<100xf32>
    }
    return
  }
}

// -----
#set = affine_set<(d0) : (d0 - 50 >= 0)>
module {
  func.func @test_affine_for_if_same_block() {
    %alloc = memref.alloc() : memref<100xf32>
    %cst = arith.constant 7.000000e+00 : f32
    affine.for %arg0 = 0 to 100 {
      affine.if #set(%arg0) {
        %0 = affine.load %alloc[%arg0] : memref<100xf32>
        affine.store %cst, %alloc[%arg0] : memref<100xf32>
      }
    }
    return
  }
}

// -----
#set = affine_set<(d0) : (d0 - 50 >= 0)>
module {
  func.func @test_affine_for_if_separated() {
    %alloc = memref.alloc() : memref<100xf32>
    %cst = arith.constant 7.000000e+00 : f32
    affine.for %arg0 = 0 to 10 {
      affine.if #set(%arg0) {
        %0 = affine.load %alloc[%arg0] : memref<100xf32>
      } else {
        affine.store %cst, %alloc[%arg0] : memref<100xf32>
      }
    }
    return
  }
}

// -----
#set = affine_set<(d0) : (d0 - 25 >= 0)>
#set1 = affine_set<(d0) : (-d0 + 75 >= 0)>
module {
  func.func @test_affine_for_if_partially_joined() {
    %alloc = memref.alloc() : memref<100xf32>
    %cst = arith.constant 7.000000e+00 : f32
    affine.for %arg0 = 0 to 100 {
      affine.if #set(%arg0) {
        %0 = affine.load %alloc[%arg0] : memref<100xf32>
      }
      affine.if #set1(%arg0) {
        affine.store %cst, %alloc[%arg0] : memref<100xf32>
      }
    }
    return
  }
}

// -----
#set = affine_set<(d0) : (d0 - 50 >= 0)>
#set1 = affine_set<(d0, d1) : (d0 - 75 >= 0, d1 - 50 >= 0)>
module {
  func.func @test_interleaved_affine_for_if() {
    %alloc = memref.alloc() : memref<100x100xf32>
    %cst = arith.constant 7.000000e+00 : f32
    affine.for %arg0 = 0 to 100 {
      affine.if #set(%arg0) {
        affine.for %arg1 = 0 to 100 {
          %0 = affine.load %alloc[%arg0, %arg1] : memref<100x100xf32>
          affine.if #set1(%arg0, %arg1) {
            affine.store %cst, %alloc[%arg0, %arg1] : memref<100x100xf32>
          }
        }
      }
    }
    return
  }
}

// -----
#set = affine_set<(d0)[s0] : (d0 - s0 floordiv 2 >= 0)>
#set1 = affine_set<(d0) : (-d0 + 51 >= 0)>
module {
  func.func @test_interleaved_affine_for_if() {
    %alloc = memref.alloc() : memref<101xf32>
    %c0 = arith.constant 0 : index
    %dim = memref.dim %alloc, %c0 : memref<101xf32>
    %cst = arith.constant 7.000000e+00 : f32
    affine.for %arg0 = 0 to 101 {
      affine.if #set(%arg0)[%dim] {
        %0 = affine.load %alloc[%arg0] : memref<101xf32>
      }
      affine.if #set1(%arg0) {
        affine.store %cst, %alloc[%arg0] : memref<101xf32>
      }
    }
    return
  }
}

// -----
module {
  func.func @dependent_parallel() {
    %alloc = memref.alloc() : memref<10xf32>
    %cst = arith.constant 7.000000e+00 : f32
    affine.parallel (%arg0) = (0) to (10) {
      affine.store %cst, %alloc[%arg0] : memref<10xf32>
    }
    affine.parallel (%arg0) = (0) to (10) {
      %0 = affine.load %alloc[%arg0] : memref<10xf32>
    }
    return
  }
}

// -----
#set = affine_set<(d0, d1, d2, d3) : ((d0 + 1) mod 8 >= 0, d0 * -8 >= 0)>
module {
  func.func @affine_if_no_dependence() {
    %c1 = arith.constant 1 : index
    %alloc = memref.alloc() : memref<15xi1>
    %true = arith.constant true
    affine.store %true, %alloc[%c1] : memref<15xi1>
    affine.if #set(%c1, %c1, %c1, %c1) {
      %0 = affine.load %alloc[%c1] : memref<15xi1>
    }
    return
  }
}

// -----
module {
  func.func @affine_parallel_dep_check_1() {
    %alloc = memref.alloc() : memref<1x130xf32>
    %alloc_0 = memref.alloc() : memref<1x130x130xf32>
    %cst = arith.constant 0.000000e+00 : f32
    affine.parallel (%arg0, %arg1) = (0, 0) to (1, 130) {
      affine.store %cst, %alloc_0[%arg0, %arg1, 129] : memref<1x130x130xf32>
    }
    %alloc_1 = memref.alloc() : memref<1x128x128xf32>
    affine.parallel (%arg0) = (0) to (130) {
      affine.parallel (%arg1, %arg2) = (0, 0) to (1, 130) {
        %0 = affine.load %alloc_0[0, %arg0 + %arg1, %arg2] : memref<1x130x130xf32>
      }
    }
    return
  }
}

// -----
module {
  func.func @affine_parallel_dep_check_2() {
    %alloc = memref.alloc() : memref<128xf32>
    %cst = arith.constant 0.000000e+00 : f32
    affine.parallel (%arg0) = (0) to (127) {
      affine.store %cst, %alloc[%arg0] : memref<128xf32>
    }
    %0 = affine.load %alloc[127] : memref<128xf32>
    return
  }
}

