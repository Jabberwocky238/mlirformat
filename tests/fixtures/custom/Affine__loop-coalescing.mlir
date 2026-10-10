module {
  func.func @one_3d_nest() {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c2 = arith.constant 2 : index
    %c3 = arith.constant 3 : index
    %c42 = arith.constant 42 : index
    %c56 = arith.constant 56 : index
    scf.for %arg0 = %c0 to %c42 step %c1 {
      scf.for %arg1 = %c0 to %c56 step %c1 {
        scf.for %arg2 = %c0 to %c3 step %c1 {
          "use"(%arg0, %arg1, %arg2) : (index, index, index) -> ()
        }
      }
    }
    return
  }
}

// -----
module {
  func.func @multi_use() {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c10 = arith.constant 10 : index
    scf.for %arg0 = %c1 to %c10 step %c1 {
      scf.for %arg1 = %c1 to %c10 step %c1 {
        scf.for %arg2 = %c1 to %c10 step %c1 {
          "use1"(%arg0, %arg1, %arg2) : (index, index, index) -> ()
          "use2"(%arg0, %arg2, %arg1) : (index, index, index) -> ()
          "use3"(%arg2, %arg1, %arg0) : (index, index, index) -> ()
        }
      }
    }
    return
  }
}

// -----
module {
  func.func @unnormalized_loops() {
    %c2 = arith.constant 2 : index
    %c3 = arith.constant 3 : index
    %c5 = arith.constant 5 : index
    %c7 = arith.constant 7 : index
    %c10 = arith.constant 10 : index
    %c17 = arith.constant 17 : index
    scf.for %arg0 = %c5 to %c10 step %c2 {
      scf.for %arg1 = %c7 to %c17 step %c3 {
        "use"(%arg0, %arg1) : (index, index) -> ()
      }
    }
    return
  }
}

// -----
module {
  func.func @noramalized_loops_with_yielded_iter_args() {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c3 = arith.constant 3 : index
    %c42 = arith.constant 42 : index
    %c56 = arith.constant 56 : index
    %0 = scf.for %arg0 = %c0 to %c42 step %c1 iter_args(%arg1 = %c0) -> (index) {
      %1 = scf.for %arg2 = %c0 to %c56 step %c1 iter_args(%arg3 = %arg1) -> (index) {
        %2 = scf.for %arg4 = %c0 to %c3 step %c1 iter_args(%arg5 = %arg3) -> (index) {
          "use"(%arg0, %arg2, %arg4) : (index, index, index) -> ()
          scf.yield %arg5 : index
        }
        scf.yield %2 : index
      }
      scf.yield %1 : index
    }
    return
  }
}

// -----
module {
  func.func @noramalized_loops_with_shuffled_yielded_iter_args() {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c3 = arith.constant 3 : index
    %c42 = arith.constant 42 : index
    %c56 = arith.constant 56 : index
    %0:2 = scf.for %arg0 = %c0 to %c42 step %c1 iter_args(%arg1 = %c0, %arg2 = %c0) -> (index, index) {
      %1:2 = scf.for %arg3 = %c0 to %c56 step %c1 iter_args(%arg4 = %arg1, %arg5 = %arg2) -> (index, index) {
        %2:2 = scf.for %arg6 = %c0 to %c3 step %c1 iter_args(%arg7 = %arg4, %arg8 = %arg5) -> (index, index) {
          "use"(%arg0, %arg3, %arg6) : (index, index, index) -> ()
          scf.yield %arg8, %arg7 : index, index
        }
        scf.yield %2#0, %2#1 : index, index
      }
      scf.yield %1#0, %1#1 : index, index
    }
    return
  }
}

// -----
module {
  func.func @noramalized_loops_with_yielded_non_iter_args() {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c3 = arith.constant 3 : index
    %c42 = arith.constant 42 : index
    %c56 = arith.constant 56 : index
    %0 = scf.for %arg0 = %c0 to %c42 step %c1 iter_args(%arg1 = %c0) -> (index) {
      %1 = scf.for %arg2 = %c0 to %c56 step %c1 iter_args(%arg3 = %arg1) -> (index) {
        %2 = scf.for %arg4 = %c0 to %c3 step %c1 iter_args(%arg5 = %arg3) -> (index) {
          %3 = "use"(%arg0, %arg2, %arg4) : (index, index, index) -> index
          scf.yield %3 : index
        }
        scf.yield %2 : index
      }
      scf.yield %1 : index
    }
    return
  }
}

// -----
module {
  func.func @parametric(%arg0: index, %arg1: index, %arg2: index, %arg3: index, %arg4: index, %arg5: index) {
    scf.for %arg6 = %arg0 to %arg1 step %arg2 {
      scf.for %arg7 = %arg3 to %arg4 step %arg5 {
        "foo"(%arg6, %arg7) : (index, index) -> ()
      }
    }
    return
  }
}

// -----
module {
  func.func @two_bands() {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c10 = arith.constant 10 : index
    scf.for %arg0 = %c0 to %c10 step %c1 {
      scf.for %arg1 = %c0 to %c10 step %c1 {
        scf.for %arg2 = %arg0 to %arg1 step %c1 {
          scf.for %arg3 = %arg0 to %arg1 step %c1 {
            "foo"() : () -> ()
          }
        }
      }
    }
    return
  }
}

// -----
module {
  func.func @coalesce_affine_for() {
    affine.for %arg0 = 0 to 16 {
      affine.for %arg1 = 0 to 64 {
        affine.for %arg2 = 0 to 8 {
          "test.foo"(%arg0, %arg1, %arg2) : (index, index, index) -> ()
        }
      }
    }
    return
  }
}

// -----
module {
  func.func @coalesce_affine_for(%arg0: memref<?x?xf32>) {
    %c0 = arith.constant 0 : index
    %dim = memref.dim %arg0, %c0 : memref<?x?xf32>
    %dim_0 = memref.dim %arg0, %c0 : memref<?x?xf32>
    %dim_1 = memref.dim %arg0, %c0 : memref<?x?xf32>
    affine.for %arg1 = 0 to %dim {
      affine.for %arg2 = 0 to %dim_0 {
        affine.for %arg3 = 0 to %dim_1 {
          "test.foo"(%arg1, %arg2, %arg3) : (index, index, index) -> ()
        }
      }
    }
    return
  }
}

// -----
module {
  func.func @coalesce_affine_for(%arg0: memref<?x?xf32>) {
    %c0 = arith.constant 0 : index
    %dim = memref.dim %arg0, %c0 : memref<?x?xf32>
    %dim_0 = memref.dim %arg0, %c0 : memref<?x?xf32>
    affine.for %arg1 = 0 to %dim {
      affine.for %arg2 = 0 to %dim_0 {
        affine.for %arg3 = 0 to 64 {
          "test.foo"(%arg1, %arg2, %arg3) : (index, index, index) -> ()
        }
      }
    }
    return
  }
}

// -----
#map = affine_map<()[s0] -> (s0, -s0)>
module {
  func.func @coalesce_affine_for(%arg0: memref<?x?xf32>) {
    %c0 = arith.constant 0 : index
    %dim = memref.dim %arg0, %c0 : memref<?x?xf32>
    %dim_0 = memref.dim %arg0, %c0 : memref<?x?xf32>
    %dim_1 = memref.dim %arg0, %c0 : memref<?x?xf32>
    affine.for %arg1 = 0 to min #map()[%dim] {
      affine.for %arg2 = 0 to %dim_0 {
        affine.for %arg3 = 0 to %dim_1 {
          "test.foo"(%arg1, %arg2, %arg3) : (index, index, index) -> ()
        }
      }
    }
    return
  }
}

// -----
#map = affine_map<(d0) -> (d0 * 110)>
#map1 = affine_map<(d0) -> (696, d0 * 110 + 110)>
module {
  func.func @test_loops_do_not_get_coalesced() {
    affine.for %arg0 = 0 to 7 {
      affine.for %arg1 = #map(%arg0) to min #map1(%arg0) {
        "use"(%arg0, %arg1) : (index, index) -> ()
      }
    }
    return
  }
}

// -----
module {
  func.func @inner_loop_has_iter_args(%arg0: memref<?xi64>) {
    %c17 = arith.constant 17 : index
    affine.for %arg1 = 0 to 79 {
      %0 = affine.for %arg2 = 0 to 64 iter_args(%arg3 = %arg0) -> (memref<?xi64>) {
        %1 = arith.remui %arg2, %c17 : index
        %2 = arith.index_cast %arg2 : index to i64
        memref.store %2, %arg3[%1] : memref<?xi64>
        affine.yield %arg3 : memref<?xi64>
      }
    }
    return
  }
}

