#set = affine_set<() : (0 == 0)>
module {
  func.func @empty() {
    affine.for %arg0 = 0 to 10 {
    } {some_attr = true}
    affine.if #set() {
    } {some_attr = true}
    affine.if #set() {
    } else {
      "foo"() : () -> ()
    } {some_attr = true}
    return
  }
}

// -----
module {
  func.func @affine.yield() {
    affine.for %arg0 = 0 to 10 {
    }
    return
  }
}

// -----
#map = affine_map<(d0)[s0] -> (1000, d0 + 512, s0)>
#map1 = affine_map<(d0, d1)[s0] -> (d0 - d1, s0 + 512)>
#map2 = affine_map<()[s0, s1] -> (s0 - s1, 11)>
#map3 = affine_map<() -> (77, 78, 79)>
module {
  func.func @affine_min(%arg0: index, %arg1: index, %arg2: index) {
    %0 = affine.min #map(%arg0)[%arg1]
    %1 = affine.min #map1(%arg0, %arg1)[%arg2]
    %2 = affine.min #map2()[%arg1, %arg2]
    %3 = affine.min #map3()
    return
  }
  func.func @affine_max(%arg0: index, %arg1: index, %arg2: index) {
    %0 = affine.max #map(%arg0)[%arg1]
    %1 = affine.max #map1(%arg0, %arg1)[%arg2]
    %2 = affine.max #map2()[%arg1, %arg2]
    %3 = affine.max #map3()
    return
  }
}

// -----
module {
  func.func @valid_symbols(%arg0: index, %arg1: index, %arg2: index) {
    %c1 = arith.constant 1 : index
    %c0 = arith.constant 0 : index
    %alloc = memref.alloc(%arg0, %arg1) : memref<?x?xf32>
    affine.for %arg3 = 0 to %arg2 step 768 {
      %dim = memref.dim %alloc, %c1 : memref<?x?xf32>
      affine.for %arg4 = 0 to %dim step 264 {
        %dim_0 = memref.dim %alloc, %c0 : memref<?x?xf32>
        %subview = memref.subview %alloc[%c0, %c0] [%dim_0, %arg4] [%c1, %c1] : memref<?x?xf32> to memref<?x?xf32, strided<[?, ?], offset: ?>>
        %dim_1 = memref.dim %subview, %c0 : memref<?x?xf32, strided<[?, ?], offset: ?>>
        affine.for %arg5 = 0 to %dim_1 step 768 {
          "foo"() : () -> ()
        }
      }
    }
    return
  }
}

// -----
module {
  func.func @valid_symbol_affine_scope(%arg0: index, %arg1: memref<?xf32>) {
    test.affine_scope {
      %c1 = arith.constant 1 : index
      %0 = arith.subi %arg0, %c1 : index
      affine.for %arg2 = %0 to %arg0 {
        %1 = arith.subi %0, %arg2 : index
        test.affine_scope {
          affine.for %arg3 = %1 to %arg0 {
            %2 = affine.load %arg1[%arg0 - 1] : memref<?xf32>
            affine.store %2, %arg1[%arg0 - 1] : memref<?xf32>
          }
          "terminate"() : () -> ()
        }
      }
      "terminate"() : () -> ()
    }
    return
  }
}

// -----
module {
  func.func @valid_dim_linearize_delinearize(%arg0: index, %arg1: index, %arg2: memref<?xf32>, %arg3: memref<?x32x?xf32>) {
    affine.for %arg4 = 0 to %arg0 {
      affine.for %arg5 = 0 to %arg1 {
        %0 = affine.linearize_index disjoint [%arg4, %arg5] by (%arg0, %arg1) : index
        %1:2 = affine.delinearize_index %arg1 into (32) : index, index
        %2 = affine.load %arg2[%0] : memref<?xf32>
        affine.store %2, %arg3[%arg4, %1#1, %1#0] : memref<?x32x?xf32>
      }
    }
    return
  }
}

// -----
module {
  %0 = "test.foo"() : () -> index
  "test.func"() ({
  ^bb0(%arg0: memref<?xf32>):
    %1 = affine.load %arg0[%0] : memref<?xf32>
    "terminate"() : () -> ()
  }) : () -> ()
}

// -----
module {
  func.func @parallel(%arg0: memref<100x100xf32>, %arg1: index) {
    affine.parallel (%arg2, %arg3) = (0, 0) to (symbol(%arg1), 100) step (10, 10) {
      %0:2 = affine.parallel (%arg4, %arg5) = (%arg2, %arg3) to (%arg2 + 10, %arg3 + 10) reduce ("minimumf", "maximumf") -> (f32, f32) {
        %1 = affine.load %arg0[%arg2 * 2, %arg3 + %arg5] : memref<100x100xf32>
        affine.yield %1, %1 : f32, f32
      }
    }
    return
  }
}

// -----
module {
  func.func @parallel_min_max(%arg0: index, %arg1: index, %arg2: index, %arg3: index) {
    affine.parallel (%arg4, %arg5, %arg6) = (max(%arg0, %arg1), %arg1, max(%arg0, %arg2)) to (%arg2, min(%arg2, %arg3), %arg1) {
    }
    return
  }
}

// -----
module {
  func.func @parallel_no_ivs() {
    affine.parallel () = () to () {
    }
    return
  }
}

// -----
#set = affine_set<() : (0 == 0)>
module {
  func.func @affine_if() -> f32 {
    %cst = arith.constant 0.000000e+00 : f32
    %0 = affine.if #set() -> f32 {
      affine.yield %cst : f32
    } else {
      affine.yield %cst : f32
    }
    return %0 : f32
  }
}

// -----
#set = affine_set<(d0) : (d0 - 10 >= 0)>
module {
  func.func @yield_loop(%arg0: memref<1024xf32>) -> f32 {
    %cst = arith.constant 0.000000e+00 : f32
    %0 = affine.for %arg1 = 0 to 10 step 2 iter_args(%arg2 = %cst) -> (f32) {
      %1 = affine.load %arg0[%arg1] : memref<1024xf32>
      %2 = affine.if #set(%arg1) -> f32 {
        %3 = arith.addf %arg2, %1 : f32
        affine.yield %3 : f32
      } else {
        affine.yield %arg2 : f32
      }
      affine.yield %2 : f32
    }
    return %0 : f32
  }
  func.func @affine_for_multiple_yield(%arg0: memref<1024xf32>) -> (f32, f32) {
    %cst = arith.constant 0.000000e+00 : f32
    %0:2 = affine.for %arg1 = 0 to 10 step 2 iter_args(%arg2 = %cst, %arg3 = %cst) -> (f32, f32) {
      %1 = affine.load %arg0[%arg1] : memref<1024xf32>
      %2 = arith.addf %1, %arg2 : f32
      %3 = arith.addf %1, %arg3 : f32
      affine.yield %2, %3 : f32, f32
    }
    return %0#0, %0#1 : f32, f32
  }
}

// -----
module {
  func.func @delinearize(%arg0: index, %arg1: index, %arg2: index) -> (index, index) {
    %0:2 = affine.delinearize_index %arg0 into (%arg1, %arg2) : index, index
    return %0#0, %0#1 : index, index
  }
  func.func @delinearize_mixed(%arg0: index, %arg1: index) -> (index, index, index) {
    %0:3 = affine.delinearize_index %arg0 into (2, %arg1, 3) : index, index, index
    return %0#0, %0#1, %0#2 : index, index, index
  }
}

// -----
module {
  func.func @linearize(%arg0: index, %arg1: index, %arg2: index, %arg3: index) -> index {
    %0 = affine.linearize_index [%arg0, %arg1] by (%arg2, %arg3) : index
    return %0 : index
  }
  func.func @linearize_mixed(%arg0: index, %arg1: index, %arg2: index, %arg3: index) -> index {
    %0 = affine.linearize_index disjoint [%arg0, %arg1, %arg2] by (2, %arg3, 3) : index
    return %0 : index
  }
}

// -----
module {
  func.func @gpu_launch_affine() {
    %c1 = arith.constant 1 : index
    gpu.launch blocks(%arg0, %arg1, %arg2) in (%arg6 = %c1, %arg7 = %c1, %arg8 = %c1) threads(%arg3, %arg4, %arg5) in (%arg9 = %c1, %arg10 = %c1, %arg11 = %c1) {
      %thread_id_x = gpu.thread_id  x
      %c128 = arith.constant 128 : index
      affine.for %arg12 = %thread_id_x to %c128 step 8 {
      }
      gpu.terminator
    }
    return
  }
}

// -----
#map = affine_map<()[s0] -> (s0 mod 32)>
module {
  gpu.module @gpu {
    gpu.func @affine_thread_id(%arg0: memref<?x?xf32>) kernel {
      %c3 = arith.constant 3 : index
      %dim = memref.dim %arg0, %c3 : memref<?x?xf32>
      %c0 = arith.constant 0 : index
      affine.for %arg1 = %c0 to %dim step 32 {
        %thread_id_x = gpu.thread_id  x
        %0 = affine.apply #map()[%thread_id_x]
        %c128 = arith.constant 128 : index
        affine.for %arg2 = %0 to %c128 step 8 {
          %c32 = arith.constant 32 : index
        }
      }
      gpu.return
    }
  }
}

// -----
#map = affine_map<(d0)[s0] -> (d0 + s0)>
module {
  func.func @arith_add_vaild_symbol_upper_bound(%arg0: index) {
    affine.for %arg1 = 0 to 7 {
      %0 = arith.addi %arg0, %arg0 : index
      affine.for %arg2 = 0 to #map(%0)[%arg0] {
      }
    }
    return
  }
}

// -----
#map = affine_map<(d0)[s0] -> (d0 + s0)>
module {
  func.func @arith_add_vaild_symbol_lower_bound(%arg0: index) {
    affine.for %arg1 = 0 to 7 {
      %0 = arith.addi %arg0, %arg0 : index
      affine.for %arg2 = #map(%0)[%arg0] to 7 {
      }
    }
    return
  }
}

