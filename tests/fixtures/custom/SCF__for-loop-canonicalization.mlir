#map = affine_map<(d0, d1) -> (2, d1 - d0)>
module {
  func.func @scf_for_canonicalize_min(%arg0: memref<i64>) {
    %c0 = arith.constant 0 : index
    %c2 = arith.constant 2 : index
    %c4 = arith.constant 4 : index
    scf.for %arg1 = %c0 to %c4 step %c2 {
      %0 = affine.min #map(%arg1, %c4)
      %1 = arith.index_cast %0 : index to i64
      memref.store %1, %arg0[] : memref<i64>
    }
    return
  }
}

// -----
#map = affine_map<(d0, d1) -> (-2, -(d1 - d0))>
module {
  func.func @scf_for_canonicalize_max(%arg0: memref<i64>) {
    %c0 = arith.constant 0 : index
    %c2 = arith.constant 2 : index
    %c4 = arith.constant 4 : index
    scf.for %arg1 = %c0 to %c4 step %c2 {
      %0 = affine.max #map(%arg1, %c4)
      %1 = arith.index_cast %0 : index to i64
      memref.store %1, %arg0[] : memref<i64>
    }
    return
  }
}

// -----
#map = affine_map<(d0, d1) -> (-2, -(d1 - d0))>
module {
  func.func @scf_for_max_not_canonicalizable(%arg0: memref<i64>) {
    %c0 = arith.constant 0 : index
    %c2 = arith.constant 2 : index
    %c3 = arith.constant 3 : index
    %c4 = arith.constant 4 : index
    scf.for %arg1 = %c0 to %c4 step %c2 {
      %0 = affine.max #map(%arg1, %c3)
      %1 = arith.index_cast %0 : index to i64
      memref.store %1, %arg0[] : memref<i64>
    }
    return
  }
}

// -----
#map = affine_map<(d0, d1, d2, d3) -> (5, d1 + d3 - d0 - d2)>
module {
  func.func @scf_for_loop_nest_canonicalize_min(%arg0: memref<i64>) {
    %c0 = arith.constant 0 : index
    %c2 = arith.constant 2 : index
    %c3 = arith.constant 3 : index
    %c4 = arith.constant 4 : index
    %c6 = arith.constant 6 : index
    scf.for %arg1 = %c0 to %c4 step %c2 {
      scf.for %arg2 = %c0 to %c6 step %c3 {
        %0 = affine.min #map(%arg1, %c4, %arg2, %c6)
        %1 = arith.index_cast %0 : index to i64
        memref.store %1, %arg0[] : memref<i64>
      }
    }
    return
  }
}

// -----
#map = affine_map<(d0)[s0] -> (2, -d0 + s0)>
module {
  func.func @scf_for_not_canonicalizable_1(%arg0: memref<i64>) {
    %c1 = arith.constant 1 : index
    %c2 = arith.constant 2 : index
    %c4 = arith.constant 4 : index
    scf.for %arg1 = %c1 to %c4 step %c2 {
      %0 = affine.min #map(%arg1)[%c4]
      %1 = arith.index_cast %0 : index to i64
      memref.store %1, %arg0[] : memref<i64>
    }
    return
  }
}

// -----
#map = affine_map<(d0) -> (256, -d0 + 256)>
module {
  func.func @scf_for_canonicalize_partly(%arg0: memref<i64>) {
    %c1 = arith.constant 1 : index
    %c16 = arith.constant 16 : index
    %c256 = arith.constant 256 : index
    scf.for %arg1 = %c1 to %c256 step %c16 {
      %0 = affine.min #map(%arg1)
      %1 = arith.index_cast %0 : index to i64
      memref.store %1, %arg0[] : memref<i64>
    }
    return
  }
}

// -----
#map = affine_map<(d0) -> (d0 * 42)>
#map1 = affine_map<(d0, d1, d2) -> (d0, d1 - d2)>
module {
  func.func @scf_for_not_canonicalizable_2(%arg0: memref<i64>, %arg1: index) {
    %c0 = arith.constant 0 : index
    %0 = affine.apply #map(%arg1)
    scf.for %arg2 = %c0 to %0 step %arg1 {
      %1 = affine.min #map1(%arg1, %0, %arg2)
      %2 = arith.index_cast %1 : index to i64
      memref.store %2, %arg0[] : memref<i64>
    }
    return
  }
}

// -----
#map = affine_map<(d0)[s0] -> (d0 * s0)>
#map1 = affine_map<(d0, d1, d2) -> (d0, d2 - d1)>
module {
  func.func @scf_for_not_canonicalizable_3(%arg0: memref<i64>, %arg1: index) {
    %c0 = arith.constant 0 : index
    %0 = affine.apply #map(%arg1)[%arg1]
    scf.for %arg2 = %c0 to %0 step %arg1 {
      %1 = affine.min #map1(%arg1, %arg2, %0)
      %2 = arith.index_cast %1 : index to i64
      memref.store %2, %arg0[] : memref<i64>
    }
    return
  }
}

// -----
#map = affine_map<(d0)[s0] -> (d0 + s0, 0)>
module {
  func.func @scf_for_invalid_loop(%arg0: memref<i64>, %arg1: index) {
    %c1 = arith.constant 1 : index
    %c7 = arith.constant 7 : index
    %c256 = arith.constant 256 : index
    scf.for %arg2 = %c256 to %c1 step %c1 {
      %0 = affine.min #map(%arg2)[%c7]
      %1 = arith.index_cast %0 : index to i64
      memref.store %1, %arg0[] : memref<i64>
    }
    return
  }
}

// -----
#map = affine_map<(d0, d1) -> (2, d1 - d0)>
module {
  func.func @scf_parallel_canonicalize_min_1(%arg0: memref<i64>) {
    %c0 = arith.constant 0 : index
    %c2 = arith.constant 2 : index
    %c4 = arith.constant 4 : index
    scf.parallel (%arg1) = (%c0) to (%c4) step (%c2) {
      %0 = affine.min #map(%arg1, %c4)
      %1 = arith.index_cast %0 : index to i64
      memref.store %1, %arg0[] : memref<i64>
      scf.reduce 
    }
    return
  }
}

// -----
#map = affine_map<(d0)[s0] -> (2, -d0 + s0)>
module {
  func.func @scf_parallel_canonicalize_min_2(%arg0: memref<i64>) {
    %c1 = arith.constant 1 : index
    %c2 = arith.constant 2 : index
    %c7 = arith.constant 7 : index
    scf.parallel (%arg1) = (%c1) to (%c7) step (%c2) {
      %0 = affine.min #map(%arg1)[%c7]
      %1 = arith.index_cast %0 : index to i64
      memref.store %1, %arg0[] : memref<i64>
      scf.reduce 
    }
    return
  }
}

// -----
module {
  func.func @tensor_dim_of_iter_arg(%arg0: tensor<?x?xf32>) -> index {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c10 = arith.constant 10 : index
    %0:2 = scf.for %arg1 = %c0 to %c10 step %c1 iter_args(%arg2 = %arg0, %arg3 = %c0) -> (tensor<?x?xf32>, index) {
      %dim = tensor.dim %arg2, %c0 : tensor<?x?xf32>
      scf.yield %arg2, %dim : tensor<?x?xf32>, index
    }
    return %0#1 : index
  }
}

// -----
module {
  func.func @tensor_dim_of_iter_arg_insertslice(%arg0: tensor<?x?xf32>, %arg1: tensor<10x10xf32>) -> index {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c10 = arith.constant 10 : index
    %0:2 = scf.for %arg2 = %c0 to %c10 step %c1 iter_args(%arg3 = %arg0, %arg4 = %c0) -> (tensor<?x?xf32>, index) {
      %dim = tensor.dim %arg3, %c0 : tensor<?x?xf32>
      %inserted_slice = tensor.insert_slice %arg1 into %arg3[0, 0] [10, 10] [1, 1] : tensor<10x10xf32> into tensor<?x?xf32>
      %inserted_slice_0 = tensor.insert_slice %arg1 into %inserted_slice[1, 1] [10, 10] [1, 1] : tensor<10x10xf32> into tensor<?x?xf32>
      scf.yield %inserted_slice_0, %dim : tensor<?x?xf32>, index
    }
    return %0#1 : index
  }
}

// -----
module {
  func.func @tensor_dim_of_iter_arg_nested_for(%arg0: tensor<?x?xf32>, %arg1: tensor<10x10xf32>) -> index {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c10 = arith.constant 10 : index
    %0:2 = scf.for %arg2 = %c0 to %c10 step %c1 iter_args(%arg3 = %arg0, %arg4 = %c0) -> (tensor<?x?xf32>, index) {
      %1:2 = scf.for %arg5 = %c0 to %c10 step %c1 iter_args(%arg6 = %arg3, %arg7 = %arg4) -> (tensor<?x?xf32>, index) {
        %dim = tensor.dim %arg6, %c0 : tensor<?x?xf32>
        %inserted_slice = tensor.insert_slice %arg1 into %arg6[0, 0] [10, 10] [1, 1] : tensor<10x10xf32> into tensor<?x?xf32>
        scf.yield %inserted_slice, %dim : tensor<?x?xf32>, index
      }
      scf.yield %1#0, %1#1 : tensor<?x?xf32>, index
    }
    return %0#1 : index
  }
}

// -----
module {
  func.func @tensor_dim_of_iter_arg_no_canonicalize(%arg0: tensor<?x?xf32>, %arg1: tensor<?x?xf32>) -> index {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c10 = arith.constant 10 : index
    %0:2 = scf.for %arg2 = %c0 to %c10 step %c1 iter_args(%arg3 = %arg0, %arg4 = %c0) -> (tensor<?x?xf32>, index) {
      %dim = tensor.dim %arg3, %c0 : tensor<?x?xf32>
      scf.yield %arg1, %dim : tensor<?x?xf32>, index
    }
    return %0#1 : index
  }
}

// -----
module {
  func.func @tensor_dim_of_loop_result(%arg0: tensor<?x?xf32>) -> index {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c10 = arith.constant 10 : index
    %0 = scf.for %arg1 = %c0 to %c10 step %c1 iter_args(%arg2 = %arg0) -> (tensor<?x?xf32>) {
      scf.yield %arg2 : tensor<?x?xf32>
    }
    %dim = tensor.dim %0, %c0 : tensor<?x?xf32>
    return %dim : index
  }
}

// -----
module {
  func.func @tensor_dim_of_loop_result_no_canonicalize(%arg0: tensor<?x?xf32>, %arg1: tensor<?x?xf32>) -> index {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c10 = arith.constant 10 : index
    %0:2 = scf.for %arg2 = %c0 to %c10 step %c1 iter_args(%arg3 = %arg0, %arg4 = %arg1) -> (tensor<?x?xf32>, tensor<?x?xf32>) {
      scf.yield %arg3, %arg1 : tensor<?x?xf32>, tensor<?x?xf32>
    }
    %dim = tensor.dim %0#1, %c0 : tensor<?x?xf32>
    return %dim : index
  }
}

// -----
#map = affine_map<(d0, d1) -> (4, d1 - d0)>
module {
  func.func @one_trip_scf_for_canonicalize_min(%arg0: memref<i64>) {
    %c0 = arith.constant 0 : index
    %c2 = arith.constant 2 : index
    %c4 = arith.constant 4 : index
    scf.for %arg1 = %c0 to %c4 step %c4 {
      %0 = affine.min #map(%arg1, %c4)
      %1 = arith.index_cast %0 : index to i64
      memref.store %1, %arg0[] : memref<i64>
    }
    return
  }
}

// -----
#map = affine_map<(d0)[s0] -> (-(d0 * (5 ceildiv s0)) + 5, 3)>
module {
  func.func @regression_multiplication_with_sym(%arg0: memref<i64>) {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c2 = arith.constant 2 : index
    %c4 = arith.constant 4 : index
    %0 = "test.dummy"() : () -> index
    scf.for %arg1 = %c0 to %0 step %c1 {
      %1 = affine.min #map(%arg1)[%0]
      %2 = arith.index_cast %1 : index to i64
      memref.store %2, %arg0[] : memref<i64>
    }
    return
  }
}

// -----
#map = affine_map<(d0, d1, d2) -> (d0 floordiv 64)>
#map1 = affine_map<(d0, d1, d2) -> (d2 * 64 - 2, 5, (d1 mod 4) floordiv 8)>
module {
  func.func private @foo(index)
  func.func @func1() {
    %true = arith.constant true
    %c0 = arith.constant 0 : index
    %c5 = arith.constant 5 : index
    %c11 = arith.constant 11 : index
    %c14 = arith.constant 14 : index
    %c15 = arith.constant 15 : index
    %alloc = memref.alloc() : memref<7xf32>
    %0 = affine.apply #map(%c15, %c0, %c14)
    %1 = affine.min #map1(%c5, %0, %c11)
    call @foo(%1) : (index) -> ()
    return
  }
}

