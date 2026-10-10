#map = affine_map<(d0, d1) -> (d1 + 1)>
#map1 = affine_map<(d0, d1) -> (d0)>
#map2 = affine_map<(d0, d1) -> (d1)>
#map3 = affine_map<(d0, d1) -> (d0 - 1)>
#map4 = affine_map<(d0) -> (d0 + 1)>
#map5 = affine_map<(d0) -> (d0)>
#set = affine_set<(d0, d1, d2, d3) : ((d0 + 1) mod 8 >= 0, d0 * -8 >= 0)>
module {
  func.func @simple_store_load() {
    %cst = arith.constant 7.000000e+00 : f32
    %alloc = memref.alloc() : memref<10xf32>
    affine.for %arg0 = 0 to 10 {
      affine.store %cst, %alloc[%arg0] : memref<10xf32>
      %0 = affine.load %alloc[%arg0] : memref<10xf32>
      %1 = arith.addf %0, %0 : f32
    }
    memref.dealloc %alloc : memref<10xf32>
    return
  }
  func.func @multi_store_load() {
    %cst = arith.constant 7.000000e+00 : f32
    %cst_0 = arith.constant 8.000000e+00 : f32
    %cst_1 = arith.constant 9.000000e+00 : f32
    %memref = gpu.alloc  () : memref<10xf32>
    affine.for %arg0 = 0 to 10 {
      affine.store %cst, %memref[%arg0] : memref<10xf32>
      %0 = affine.load %memref[%arg0] : memref<10xf32>
      %1 = arith.addf %0, %0 : f32
      affine.store %cst_0, %memref[%arg0] : memref<10xf32>
      affine.store %cst_1, %memref[%arg0] : memref<10xf32>
      %2 = affine.load %memref[%arg0] : memref<10xf32>
      %3 = affine.load %memref[%arg0] : memref<10xf32>
      %4 = arith.mulf %2, %3 : f32
    }
    gpu.dealloc  %memref : memref<10xf32>
    return
  }
  func.func @store_load_affine_apply() -> memref<10x10xf32> {
    %cst = arith.constant 7.000000e+00 : f32
    %alloc = memref.alloc() : memref<10x10xf32>
    affine.for %arg0 = 0 to 10 {
      affine.for %arg1 = 0 to 10 {
        %0 = affine.apply #map(%arg0, %arg1)
        %1 = affine.apply #map1(%arg0, %arg1)
        %2 = affine.apply #map2(%0, %1)
        %3 = affine.apply #map3(%0, %1)
        affine.store %cst, %alloc[%2, %3] : memref<10x10xf32>
        %4 = affine.load %alloc[%arg0, %arg1] : memref<10x10xf32>
        %5 = arith.addf %4, %4 : f32
      }
    }
    return %alloc : memref<10x10xf32>
  }
  func.func @store_load_nested(%arg0: index) {
    %cst = arith.constant 7.000000e+00 : f32
    %alloc = memref.alloc() : memref<10xf32>
    affine.for %arg1 = 0 to 10 {
      affine.store %cst, %alloc[%arg1] : memref<10xf32>
      affine.for %arg2 = 0 to %arg0 {
        %0 = affine.load %alloc[%arg1] : memref<10xf32>
        %1 = arith.addf %0, %0 : f32
      }
    }
    return
  }
  func.func @multi_store_load_nested_no_fwd(%arg0: index) {
    %cst = arith.constant 7.000000e+00 : f32
    %cst_0 = arith.constant 8.000000e+00 : f32
    %alloc = memref.alloc() : memref<10xf32>
    affine.for %arg1 = 0 to 10 {
      affine.store %cst, %alloc[%arg1] : memref<10xf32>
      affine.for %arg2 = 0 to %arg0 {
        affine.store %cst_0, %alloc[%arg2] : memref<10xf32>
      }
      affine.for %arg2 = 0 to %arg0 {
        %0 = affine.load %alloc[%arg1] : memref<10xf32>
        %1 = arith.addf %0, %0 : f32
      }
    }
    return
  }
  func.func @store_load_store_nested_no_fwd(%arg0: index) {
    %cst = arith.constant 7.000000e+00 : f32
    %cst_0 = arith.constant 9.000000e+00 : f32
    %alloc = memref.alloc() : memref<10xf32>
    affine.for %arg1 = 0 to 10 {
      affine.store %cst, %alloc[%arg1] : memref<10xf32>
      affine.for %arg2 = 0 to %arg0 {
        %0 = affine.load %alloc[%arg1] : memref<10xf32>
        %1 = arith.addf %0, %0 : f32
        affine.store %cst_0, %alloc[%arg1] : memref<10xf32>
      }
    }
    return
  }
  func.func @multi_store_load_nested_fwd(%arg0: index) {
    %cst = arith.constant 7.000000e+00 : f32
    %cst_0 = arith.constant 8.000000e+00 : f32
    %cst_1 = arith.constant 9.000000e+00 : f32
    %cst_2 = arith.constant 1.000000e+01 : f32
    %alloc = memref.alloc() : memref<10xf32>
    affine.for %arg1 = 0 to 10 {
      affine.store %cst, %alloc[%arg1] : memref<10xf32>
      affine.for %arg2 = 0 to %arg0 {
        affine.store %cst_0, %alloc[%arg2] : memref<10xf32>
      }
      affine.for %arg2 = 0 to %arg0 {
        affine.store %cst_1, %alloc[%arg2] : memref<10xf32>
      }
      affine.store %cst_2, %alloc[%arg1] : memref<10xf32>
      affine.for %arg2 = 0 to %arg0 {
        %0 = affine.load %alloc[%arg1] : memref<10xf32>
        %1 = arith.addf %0, %0 : f32
      }
    }
    return
  }
  func.func @store_load_no_fwd() {
    %cst = arith.constant 7.000000e+00 : f32
    %alloc = memref.alloc() : memref<10xf32>
    affine.for %arg0 = 0 to 10 {
      affine.store %cst, %alloc[%arg0] : memref<10xf32>
      affine.for %arg1 = 0 to 10 {
        affine.for %arg2 = 0 to 10 {
          %0 = affine.load %alloc[%arg2] : memref<10xf32>
          %1 = arith.addf %0, %0 : f32
        }
      }
    }
    return
  }
  func.func @store_load_fwd() {
    %cst = arith.constant 7.000000e+00 : f32
    %c0 = arith.constant 0 : index
    %alloc = memref.alloc() : memref<10xf32>
    affine.store %cst, %alloc[%c0] : memref<10xf32>
    affine.for %arg0 = 0 to 10 {
      affine.for %arg1 = 0 to 10 {
        affine.for %arg2 = 0 to 10 {
          %0 = affine.load %alloc[%c0] : memref<10xf32>
          %1 = arith.addf %0, %0 : f32
        }
      }
    }
    return
  }
  func.func @store_load_store_nested_fwd(%arg0: index) -> f32 {
    %cst = arith.constant 7.000000e+00 : f32
    %cst_0 = arith.constant 9.000000e+00 : f32
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %alloc = memref.alloc() : memref<10xf32>
    affine.for %arg1 = 0 to 10 {
      affine.store %cst, %alloc[%arg1] : memref<10xf32>
      affine.for %arg2 = 0 to %arg0 {
        %1 = affine.load %alloc[%arg1] : memref<10xf32>
        %2 = arith.addf %1, %1 : f32
        %3 = affine.apply #map4(%arg1)
        affine.store %cst_0, %alloc[%3] : memref<10xf32>
      }
    }
    %0 = affine.load %alloc[%c1] : memref<10xf32>
    return %0 : f32
  }
  func.func @should_not_fwd(%arg0: memref<100xf32>, %arg1: index, %arg2: index) -> f32 {
    %cst = arith.constant 0.000000e+00 : f32
    affine.store %cst, %arg0[%arg1] : memref<100xf32>
    %0 = affine.load %arg0[%arg2] : memref<100xf32>
    return %0 : f32
  }
  func.func @refs_not_known_to_be_equal(%arg0: memref<100x100xf32>, %arg1: index) {
    %0 = affine.apply #map4(%arg1)
    %cst = arith.constant 1.000000e+00 : f32
    affine.for %arg2 = 0 to 100 {
      affine.for %arg3 = 0 to 100 {
        %1 = affine.load %arg0[%arg2, %arg3] : memref<100x100xf32>
        affine.store %cst, %arg0[%arg3, %arg2] : memref<100x100xf32>
        %2 = affine.load %arg0[%arg2, %arg3] : memref<100x100xf32>
        %3 = affine.load %arg0[%arg3, %arg2] : memref<100x100xf32>
        "foo"(%1, %2, %3) : (f32, f32, f32) -> ()
      }
    }
    return
  }
  func.func @elim_load_after_store(%arg0: memref<100xf32>, %arg1: memref<100xf32>) {
    %alloc = memref.alloc() : memref<1xf32>
    %alloc_0 = memref.alloc() : memref<1xf32>
    affine.for %arg2 = 0 to 100 {
      %0 = affine.load %arg0[%arg2] : memref<100xf32>
      %1 = affine.load %arg0[%arg2] : memref<100xf32>
      %2 = arith.addf %0, %1 : f32
      affine.store %2, %alloc_0[0] : memref<1xf32>
      %3 = affine.load %arg0[%arg2] : memref<100xf32>
      %4 = affine.load %alloc_0[0] : memref<1xf32>
      %5 = arith.addf %3, %4 : f32
      affine.store %5, %alloc[0] : memref<1xf32>
      %6 = affine.load %arg0[%arg2] : memref<100xf32>
      %7 = affine.load %alloc[0] : memref<1xf32>
      %8 = arith.addf %6, %7 : f32
      affine.store %8, %arg1[%arg2] : memref<100xf32>
    }
    return
  }
  func.func @vector_forwarding(%arg0: memref<512xf32>, %arg1: memref<512xf32>) {
    %alloc = memref.alloc() : memref<512xf32>
    affine.for %arg2 = 0 to 16 {
      %0 = affine.vector_load %arg0[%arg2 * 32] : memref<512xf32>, vector<32xf32>
      affine.vector_store %0, %alloc[%arg2 * 32] : memref<512xf32>, vector<32xf32>
      %1 = affine.vector_load %alloc[%arg2 * 32] : memref<512xf32>, vector<32xf32>
      affine.vector_store %1, %arg1[%arg2 * 32] : memref<512xf32>, vector<32xf32>
    }
    return
  }
  func.func @vector_no_forwarding(%arg0: memref<512xf32>, %arg1: memref<512xf32>) {
    %alloc = memref.alloc() : memref<512xf32>
    affine.for %arg2 = 0 to 16 {
      %0 = affine.vector_load %arg0[%arg2 * 32] : memref<512xf32>, vector<32xf32>
      affine.vector_store %0, %alloc[%arg2 * 32] : memref<512xf32>, vector<32xf32>
      %1 = affine.vector_load %alloc[%arg2 * 32] : memref<512xf32>, vector<16xf32>
      affine.vector_store %1, %arg1[%arg2 * 32] : memref<512xf32>, vector<16xf32>
    }
    return
  }
  func.func @simple_three_loads(%arg0: memref<10xf32>) {
    affine.for %arg1 = 0 to 10 {
      %0 = affine.load %arg0[%arg1] : memref<10xf32>
      %1 = affine.load %arg0[%arg1] : memref<10xf32>
      %2 = arith.addf %0, %1 : f32
      %3 = affine.load %arg0[%arg1] : memref<10xf32>
      %4 = arith.addf %2, %3 : f32
    }
    return
  }
  func.func @nested_loads_const_index(%arg0: memref<10xf32>) {
    %c0 = arith.constant 0 : index
    %0 = affine.load %arg0[%c0] : memref<10xf32>
    affine.for %arg1 = 0 to 10 {
      affine.for %arg2 = 0 to 20 {
        affine.for %arg3 = 0 to 30 {
          %1 = affine.load %arg0[%c0] : memref<10xf32>
          %2 = arith.addf %0, %1 : f32
        }
      }
    }
    return
  }
  func.func @nested_loads(%arg0: index, %arg1: memref<10xf32>) {
    affine.for %arg2 = 0 to 10 {
      %0 = affine.load %arg1[%arg2] : memref<10xf32>
      affine.for %arg3 = 0 to %arg0 {
        %1 = affine.load %arg1[%arg2] : memref<10xf32>
        %2 = arith.addf %0, %1 : f32
      }
    }
    return
  }
  func.func @nested_loads_different_memref_accesses_no_cse(%arg0: memref<10xf32>) {
    affine.for %arg1 = 0 to 10 {
      %0 = affine.load %arg0[%arg1] : memref<10xf32>
      affine.for %arg2 = 0 to 20 {
        %1 = affine.load %arg0[%arg2] : memref<10xf32>
        %2 = arith.addf %0, %1 : f32
      }
    }
    return
  }
  func.func @load_load_store(%arg0: memref<10xf32>) {
    affine.for %arg1 = 0 to 10 {
      %0 = affine.load %arg0[%arg1] : memref<10xf32>
      %1 = affine.load %arg0[%arg1] : memref<10xf32>
      %2 = arith.addf %0, %1 : f32
      affine.store %2, %arg0[%arg1] : memref<10xf32>
    }
    return
  }
  func.func @load_load_store_2_loops_no_cse(%arg0: index, %arg1: memref<10xf32>) {
    affine.for %arg2 = 0 to 10 {
      %0 = affine.load %arg1[%arg2] : memref<10xf32>
      affine.for %arg3 = 0 to %arg0 {
        %1 = affine.load %arg1[%arg2] : memref<10xf32>
        %2 = arith.addf %0, %1 : f32
        affine.store %2, %arg1[%arg2] : memref<10xf32>
      }
    }
    return
  }
  func.func @load_load_store_3_loops_no_cse(%arg0: memref<10xf32>) {
    %cst = arith.constant 1.000000e+00 : f32
    affine.for %arg1 = 0 to 10 {
      %0 = affine.load %arg0[%arg1] : memref<10xf32>
      affine.for %arg2 = 0 to 20 {
        affine.for %arg3 = 0 to 30 {
          %1 = affine.load %arg0[%arg1] : memref<10xf32>
          %2 = arith.addf %0, %1 : f32
        }
        affine.store %cst, %arg0[%arg1] : memref<10xf32>
      }
    }
    return
  }
  func.func @load_load_store_3_loops(%arg0: memref<10xf32>) {
    %cst = arith.constant 1.000000e+00 : f32
    affine.for %arg1 = 0 to 10 {
      affine.for %arg2 = 0 to 20 {
        %0 = affine.load %arg0[%arg1] : memref<10xf32>
        affine.for %arg3 = 0 to 30 {
          %1 = affine.load %arg0[%arg1] : memref<10xf32>
          %2 = arith.addf %0, %1 : f32
        }
      }
      affine.store %cst, %arg0[%arg1] : memref<10xf32>
    }
    return
  }
  func.func @loads_in_sibling_loops_const_index_no_cse(%arg0: memref<10xf32>) {
    %c0 = arith.constant 0 : index
    affine.for %arg1 = 0 to 10 {
      %0 = affine.load %arg0[%c0] : memref<10xf32>
    }
    affine.for %arg1 = 0 to 10 {
      %0 = affine.load %arg0[%c0] : memref<10xf32>
      %1 = arith.addf %0, %0 : f32
    }
    return
  }
  func.func @load_load_affine_apply(%arg0: memref<10x10xf32>) {
    affine.for %arg1 = 0 to 10 {
      affine.for %arg2 = 0 to 10 {
        %0 = affine.apply #map(%arg1, %arg2)
        %1 = affine.apply #map1(%arg1, %arg2)
        %2 = affine.apply #map2(%0, %1)
        %3 = affine.apply #map3(%0, %1)
        %4 = affine.load %arg0[%2, %3] : memref<10x10xf32>
        %5 = affine.load %arg0[%arg1, %arg2] : memref<10x10xf32>
        %6 = arith.addf %4, %5 : f32
      }
    }
    return
  }
  func.func @vector_loads(%arg0: memref<512xf32>, %arg1: memref<512xf32>) {
    affine.for %arg2 = 0 to 16 {
      %0 = affine.vector_load %arg0[%arg2 * 32] : memref<512xf32>, vector<32xf32>
      %1 = affine.vector_load %arg0[%arg2 * 32] : memref<512xf32>, vector<32xf32>
      %2 = arith.addf %0, %1 : vector<32xf32>
      affine.vector_store %1, %arg1[%arg2 * 32] : memref<512xf32>, vector<32xf32>
    }
    return
  }
  func.func @vector_loads_no_cse(%arg0: memref<512xf32>, %arg1: memref<512xf32>) {
    affine.for %arg2 = 0 to 16 {
      %0 = affine.vector_load %arg0[%arg2 * 32] : memref<512xf32>, vector<32xf32>
      %1 = affine.vector_load %arg0[%arg2 * 32] : memref<512xf32>, vector<16xf32>
      affine.vector_store %1, %arg1[%arg2 * 32] : memref<512xf32>, vector<16xf32>
    }
    return
  }
  func.func @vector_load_store_load_no_cse(%arg0: memref<512xf32>, %arg1: memref<512xf32>) {
    affine.for %arg2 = 0 to 16 {
      %0 = affine.vector_load %arg0[%arg2 * 32] : memref<512xf32>, vector<32xf32>
      affine.vector_store %0, %arg0[%arg2 * 16] : memref<512xf32>, vector<32xf32>
      %1 = affine.vector_load %arg0[%arg2 * 32] : memref<512xf32>, vector<32xf32>
      %2 = arith.addf %0, %1 : vector<32xf32>
      affine.vector_store %1, %arg1[%arg2 * 32] : memref<512xf32>, vector<32xf32>
    }
    return
  }
  func.func @reduction_multi_store() -> memref<1xf32> {
    %alloc = memref.alloc() : memref<1xf32>
    %cst = arith.constant 0.000000e+00 : f32
    %cst_0 = arith.constant 5.000000e+00 : f32
    affine.store %cst, %alloc[0] : memref<1xf32>
    affine.for %arg0 = 0 to 100 step 2 {
      %0 = affine.load %alloc[0] : memref<1xf32>
      %1 = arith.addf %0, %cst_0 : f32
      affine.store %1, %alloc[0] : memref<1xf32>
      %2 = affine.load %alloc[0] : memref<1xf32>
      "test.foo"(%2) : (f32) -> ()
    }
    return %alloc : memref<1xf32>
  }
  func.func @vector_load_affine_apply_store_load(%arg0: memref<512xf32>, %arg1: memref<512xf32>) {
    %c1 = arith.constant 1 : index
    affine.for %arg2 = 0 to 15 {
      %0 = affine.vector_load %arg0[%arg2 * 32] : memref<512xf32>, vector<32xf32>
      %1 = affine.apply #map4(%arg2)
      affine.vector_store %0, %arg0[%1 * 32] : memref<512xf32>, vector<32xf32>
      %2 = affine.vector_load %arg0[%arg2 * 32] : memref<512xf32>, vector<32xf32>
      %3 = arith.addf %0, %2 : vector<32xf32>
      affine.vector_store %2, %arg1[%arg2 * 32] : memref<512xf32>, vector<32xf32>
    }
    return
  }
  func.func @external_no_forward_load(%arg0: memref<512xf32>, %arg1: memref<512xf32>) {
    affine.for %arg2 = 0 to 16 {
      %0 = affine.load %arg0[%arg2 * 32] : memref<512xf32>
      affine.store %0, %arg1[%arg2 * 32] : memref<512xf32>
      "memop"(%arg0, %arg1) : (memref<512xf32>, memref<512xf32>) -> ()
      %1 = affine.load %arg0[%arg2 * 32] : memref<512xf32>
      affine.store %1, %arg1[%arg2 * 32] : memref<512xf32>
    }
    return
  }
  func.func @external_no_forward_store(%arg0: memref<512xf32>, %arg1: memref<512xf32>) {
    %cst = arith.constant 1.000000e+00 : f32
    affine.for %arg2 = 0 to 16 {
      affine.store %cst, %arg0[%arg2 * 32] : memref<512xf32>
      "memop"(%arg0, %arg1) : (memref<512xf32>, memref<512xf32>) -> ()
      %0 = affine.load %arg0[%arg2 * 32] : memref<512xf32>
      affine.store %0, %arg1[%arg2 * 32] : memref<512xf32>
    }
    return
  }
  func.func @no_forward_cast(%arg0: memref<512xf32>, %arg1: memref<512xf32>) {
    %cst = arith.constant 1.000000e+00 : f32
    %cst_0 = arith.constant 2.000000e+00 : f32
    %cast = memref.cast %arg0 : memref<512xf32> to memref<?xf32>
    affine.for %arg2 = 0 to 16 {
      affine.store %cst, %arg0[%arg2 * 32] : memref<512xf32>
      affine.store %cst_0, %cast[%arg2 * 32] : memref<?xf32>
      %0 = affine.load %arg0[%arg2 * 32] : memref<512xf32>
      affine.store %0, %arg1[%arg2 * 32] : memref<512xf32>
    }
    return
  }
  func.func @overlap_no_fwd(%arg0: index) -> f32 {
    %cst = arith.constant 7.000000e+00 : f32
    %cst_0 = arith.constant 9.000000e+00 : f32
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %alloc = memref.alloc() : memref<10xf32>
    affine.for %arg1 = 0 to 5 {
      affine.store %cst, %alloc[%arg1 * 2] : memref<10xf32>
      affine.for %arg2 = 0 to %arg0 {
        %1 = affine.load %alloc[%arg1 * 2] : memref<10xf32>
        %2 = arith.addf %1, %1 : f32
        affine.store %cst_0, %alloc[%arg1 + 1] : memref<10xf32>
      }
    }
    %0 = affine.load %alloc[%c1] : memref<10xf32>
    return %0 : f32
  }
  func.func @redundant_store_elim(%arg0: memref<512xf32>) {
    %cst = arith.constant 1.000000e+00 : f32
    %cst_0 = arith.constant 2.000000e+00 : f32
    affine.for %arg1 = 0 to 16 {
      affine.store %cst, %arg0[%arg1 * 32] : memref<512xf32>
      affine.store %cst_0, %arg0[%arg1 * 32] : memref<512xf32>
    }
    return
  }
  func.func @redundant_store_elim_nonintervening(%arg0: memref<512xf32>) {
    %cst = arith.constant 1.000000e+00 : f32
    %alloc = memref.alloc() : memref<512xf32>
    affine.for %arg1 = 0 to 16 {
      affine.store %cst, %alloc[%arg1 * 32] : memref<512xf32>
      %0 = affine.load %arg0[%arg1 * 32] : memref<512xf32>
      affine.store %0, %alloc[%arg1 * 32] : memref<512xf32>
    }
    return
  }
  func.func @redundant_store_elim_fail(%arg0: memref<512xf32>) {
    %cst = arith.constant 1.000000e+00 : f32
    %cst_0 = arith.constant 2.000000e+00 : f32
    affine.for %arg1 = 0 to 16 {
      affine.store %cst, %arg0[%arg1 * 32] : memref<512xf32>
      "test.use"(%arg0) : (memref<512xf32>) -> ()
      affine.store %cst_0, %arg0[%arg1 * 32] : memref<512xf32>
    }
    return
  }
  func.func @with_inner_ops(%arg0: memref<?xf64>, %arg1: memref<?xf64>, %arg2: i1) {
    %cst = arith.constant 0.000000e+00 : f64
    %cst_0 = arith.constant 3.140000e+00 : f64
    %cst_1 = arith.constant 1.000000e+00 : f64
    affine.for %arg3 = 0 to 28 {
      affine.store %cst, %arg1[%arg3] : memref<?xf64>
      affine.store %cst_0, %arg1[%arg3] : memref<?xf64>
      %0 = scf.if %arg2 -> (f64) {
        scf.yield %cst_1 : f64
      } else {
        %1 = affine.load %arg1[%arg3] : memref<?xf64>
        scf.yield %1 : f64
      }
      affine.store %0, %arg0[%arg3] : memref<?xf64>
    }
    return
  }
  func.func @affine_store_load_in_scope(%arg0: memref<1x4094x510x1xf32>, %arg1: memref<4x4x1x64xf32>, %arg2: memref<1x2046x254x1x64xf32>) {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c2 = arith.constant 2 : index
    %c64 = arith.constant 64 : index
    %c768 = arith.constant 768 : index
    scf.for %arg3 = %c0 to %c768 step %c1 {
      %0 = arith.remsi %arg3, %c64 : index
      %1 = arith.divsi %arg3, %c64 : index
      %2 = arith.remsi %1, %c2 : index
      %3 = arith.divsi %1, %c2 : index
      test.affine_scope {
        %4 = arith.muli %3, %c2 : index
        %5 = arith.addi %c2, %4 : index
        %6 = arith.addi %5, %c0 : index
        %7 = arith.muli %2, %c2 : index
        %8 = arith.addi %c2, %7 : index
        %9 = affine.load %arg0[0, symbol(%6), symbol(%8), 0] : memref<1x4094x510x1xf32>
        %10 = affine.load %arg1[0, 0, 0, symbol(%0)] : memref<4x4x1x64xf32>
        %11 = affine.load %arg2[0, symbol(%3), symbol(%2), 0, symbol(%0)] : memref<1x2046x254x1x64xf32>
        %12 = arith.mulf %9, %10 : f32
        %13 = arith.addf %11, %12 : f32
        affine.store %13, %arg2[0, symbol(%3), symbol(%2), 0, symbol(%0)] : memref<1x2046x254x1x64xf32>
        %14 = arith.addi %8, %c1 : index
        %15 = affine.load %arg0[0, symbol(%6), symbol(%14), 0] : memref<1x4094x510x1xf32>
        %16 = affine.load %arg1[0, 1, 0, symbol(%0)] : memref<4x4x1x64xf32>
        %17 = affine.load %arg2[0, symbol(%3), symbol(%2), 0, symbol(%0)] : memref<1x2046x254x1x64xf32>
        %18 = arith.mulf %15, %16 : f32
        %19 = arith.addf %17, %18 : f32
        "terminate"() : () -> ()
      }
    }
    return
  }
  func.func @affine_load_store_in_different_scopes() -> memref<1xf32> {
    %alloc = memref.alloc() : memref<1xf32>
    %cst = arith.constant 0.000000e+00 : f32
    %cst_0 = arith.constant 5.000000e+00 : f32
    affine.store %cst, %alloc[0] : memref<1xf32>
    test.affine_scope {
      affine.store %cst_0, %alloc[0] : memref<1xf32>
      "test.terminate"() : () -> ()
    }
    %0 = affine.load %alloc[0] : memref<1xf32>
    return %alloc : memref<1xf32>
  }
  func.func @no_forwarding_across_scopes() -> memref<1xf32> {
    %alloc = memref.alloc() : memref<1xf32>
    %cst = arith.constant 0.000000e+00 : f32
    %cst_0 = arith.constant 5.000000e+00 : f32
    %c0 = arith.constant 0 : index
    %c100 = arith.constant 100 : index
    %c1 = arith.constant 1 : index
    affine.store %cst, %alloc[0] : memref<1xf32>
    test.affine_scope {
      %0 = affine.load %alloc[0] : memref<1xf32>
      %1 = arith.addf %0, %cst_0 : f32
      affine.store %1, %alloc[0] : memref<1xf32>
      "terminator"() : () -> ()
    }
    return %alloc : memref<1xf32>
  }
  func.func @parallel_store_load() {
    %cst = arith.constant 7.000000e+00 : f32
    %alloc = memref.alloc() : memref<10xf32>
    affine.parallel (%arg0) = (0) to (10) {
      affine.store %cst, %alloc[%arg0] : memref<10xf32>
      %0 = affine.load %alloc[%arg0] : memref<10xf32>
      %1 = arith.addf %0, %0 : f32
    }
    memref.dealloc %alloc : memref<10xf32>
    return
  }
  func.func @non_constant_parallel_store_load(%arg0: index) {
    %cst = arith.constant 7.000000e+00 : f32
    %alloc = memref.alloc() : memref<10xf32>
    affine.parallel (%arg1) = (0) to (%arg0) {
      affine.store %cst, %alloc[%arg1] : memref<10xf32>
      %0 = affine.load %alloc[%arg1] : memref<10xf32>
      %1 = arith.addf %0, %0 : f32
    }
    memref.dealloc %alloc : memref<10xf32>
    return
  }
  func.func @parallel_surrounding_for() {
    %cst = arith.constant 7.000000e+00 : f32
    %alloc = memref.alloc() : memref<10x10xf32>
    affine.parallel (%arg0) = (0) to (10) {
      affine.for %arg1 = 0 to 10 {
        affine.store %cst, %alloc[%arg0, %arg1] : memref<10x10xf32>
        %0 = affine.load %alloc[%arg0, %arg1] : memref<10x10xf32>
        %1 = arith.addf %0, %0 : f32
      }
    }
    memref.dealloc %alloc : memref<10x10xf32>
    return
  }
  func.func @dead_affine_region_op() {
    %c1 = arith.constant 1 : index
    %alloc = memref.alloc() : memref<15xi1>
    %true = arith.constant true
    affine.store %true, %alloc[%c1] : memref<15xi1>
    affine.store %true, %alloc[%c1] : memref<15xi1>
    affine.if #set(%c1, %c1, %c1, %c1) {
      %0 = affine.load %alloc[%c1] : memref<15xi1>
    }
    return
  }
  func.func @cross_block() {
    %c10 = arith.constant 10 : index
    %alloc = memref.alloc() : memref<1x13xf32>
    %alloc_0 = memref.alloc() : memref<13xi1>
    %true = arith.constant true
    affine.store %true, %alloc_0[%c10] : memref<13xi1>
    %true_1 = arith.constant true
    affine.store %true_1, %alloc_0[%c10] : memref<13xi1>
    cf.br ^bb1(%alloc : memref<1x13xf32>)
  ^bb1(%0: memref<1x13xf32>):  // pred: ^bb0
    %1 = affine.load %alloc_0[%c10] : memref<13xi1>
    return
  }
  func.func @consecutive_store() {
    %cst = arith.constant 1.099610e+00 : f16
    %alloc = memref.alloc() : memref<f16, 1>
    affine.for %arg0 = 4 to 6 {
      affine.for %arg1 = #map5(%arg0) to #map5(%arg0) step 4 {
        affine.store %cst, %alloc[] : memref<f16, 1>
        affine.store %cst, %alloc[] : memref<f16, 1>
        %0 = affine.load %alloc[] : memref<f16, 1>
      }
    }
    return
  }
  func.func @scf_for_if(%arg0: memref<?xi32>, %arg1: i32) -> i32 attributes {llvm.linkage = #llvm.linkage<external>} {
    %c1 = arith.constant 1 : index
    %c0 = arith.constant 0 : index
    %c0_i32 = arith.constant 0 : i32
    %c5_i32 = arith.constant 5 : i32
    %c10_i32 = arith.constant 10 : i32
    %alloca = memref.alloca() : memref<1xi32>
    %0 = llvm.mlir.undef : i32
    affine.store %0, %alloca[0] : memref<1xi32>
    affine.store %c0_i32, %alloca[0] : memref<1xi32>
    %1 = arith.index_cast %arg1 : i32 to index
    scf.for %arg2 = %c0 to %1 step %c1 {
      %3 = memref.load %arg0[%arg2] : memref<?xi32>
      %4 = arith.muli %3, %c5_i32 : i32
      %5 = arith.cmpi sgt, %4, %c10_i32 : i32
      scf.if %5 {
        %6 = affine.load %alloca[0] : memref<1xi32>
        %7 = arith.addi %4, %6 : i32
        affine.store %7, %alloca[0] : memref<1xi32>
      }
    }
    %2 = affine.load %alloca[0] : memref<1xi32>
    return %2 : i32
  }
  func.func @zero_d_memrefs() {
    %c0_i32 = arith.constant 0 : i32
    %alloc = memref.alloc() {alignment = 64 : i64} : memref<i32>
    affine.store %c0_i32, %alloc[] : memref<i32>
    affine.for %arg0 = 0 to 9 {
      %0 = affine.load %alloc[] : memref<i32>
      %1 = arith.addi %0, %0 : i32
    }
    return
  }
}

