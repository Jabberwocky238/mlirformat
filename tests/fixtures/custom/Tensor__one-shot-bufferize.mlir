module {
  func.func private @insert_slice_fun(%arg0: tensor<?xf32> {bufferization.writable = false}, %arg1: tensor<?xf32> {bufferization.writable = true}, %arg2: tensor<4xf32> {bufferization.writable = false}, %arg3: tensor<4xf32> {bufferization.writable = true}) -> (tensor<?xf32>, tensor<?xf32>, tensor<?xf32>, tensor<?xf32>) {
    %inserted_slice = tensor.insert_slice %arg2 into %arg0[0] [4] [1] : tensor<4xf32> into tensor<?xf32>
    %inserted_slice_0 = tensor.insert_slice %arg3 into %arg0[0] [4] [1] : tensor<4xf32> into tensor<?xf32>
    %inserted_slice_1 = tensor.insert_slice %arg2 into %arg1[0] [4] [1] : tensor<4xf32> into tensor<?xf32>
    %inserted_slice_2 = tensor.insert_slice %arg3 into %arg1[0] [4] [1] : tensor<4xf32> into tensor<?xf32>
    return %inserted_slice, %inserted_slice_0, %inserted_slice_1, %inserted_slice_2 : tensor<?xf32>, tensor<?xf32>, tensor<?xf32>, tensor<?xf32>
  }
}

// -----
module {
  func.func @insert_slice_fun(%arg0: tensor<?xf32> {bufferization.writable = true}, %arg1: tensor<4xf32> {bufferization.writable = false}) -> tensor<?xf32> {
    %cst = arith.constant 0.000000e+00 : f32
    %inserted_slice = tensor.insert_slice %arg1 into %arg0[0] [4] [1] : tensor<4xf32> into tensor<?xf32>
    %0 = linalg.fill ins(%cst : f32) outs(%inserted_slice : tensor<?xf32>) -> tensor<?xf32>
    return %0 : tensor<?xf32>
  }
}

// -----
module {
  func.func @insert_slice_fun(%arg0: tensor<?xf32> {bufferization.writable = true}, %arg1: tensor<4xf32> {bufferization.writable = false}) -> tensor<?xf32> {
    %cst = arith.constant 0.000000e+00 : f32
    %0 = linalg.fill ins(%cst : f32) outs(%arg0 : tensor<?xf32>) -> tensor<?xf32>
    %inserted_slice = tensor.insert_slice %arg1 into %0[0] [4] [1] : tensor<4xf32> into tensor<?xf32>
    return %inserted_slice : tensor<?xf32>
  }
}

// -----
module {
  func.func @insert_slice_fun_not_inplace(%arg0: tensor<?xf32> {bufferization.writable = false}, %arg1: tensor<4xf32> {bufferization.writable = false}) -> tensor<?xf32> {
    %inserted_slice = tensor.insert_slice %arg1 into %arg0[0] [4] [1] : tensor<4xf32> into tensor<?xf32>
    return %inserted_slice : tensor<?xf32>
  }
}

// -----
module {
  func.func @tensor_cast_not_in_place(%arg0: tensor<?xf32> {bufferization.writable = true}, %arg1: tensor<?xf32> {bufferization.writable = false}, %arg2: index) -> tensor<?xf32> {
    %cast = tensor.cast %arg0 : tensor<?xf32> to tensor<4xf32>
    %inserted_slice = tensor.insert_slice %cast into %arg0[%arg2] [4] [1] : tensor<4xf32> into tensor<?xf32>
    return %inserted_slice : tensor<?xf32>
  }
}

// -----
module {
  func.func @insert_op(%arg0: tensor<?xf32> {bufferization.writable = true}, %arg1: f32, %arg2: index) -> tensor<?xf32> {
    %inserted = tensor.insert %arg1 into %arg0[%arg2] : tensor<?xf32>
    return %inserted : tensor<?xf32>
  }
}

// -----
#map = affine_map<(d0) -> (d0 ceildiv 8)>
module {
  func.func @rank_reducing(%arg0: index, %arg1: index, %arg2: tensor<8x18x32xf32>) -> tensor<?x1x6x8xf32> {
    %c1 = arith.constant 1 : index
    %c6 = arith.constant 6 : index
    %c8 = arith.constant 8 : index
    %c32 = arith.constant 32 : index
    %c0 = arith.constant 0 : index
    %0 = bufferization.alloc_tensor() : tensor<4x1x6x8xf32>
    %cast = tensor.cast %0 : tensor<4x1x6x8xf32> to tensor<?x1x6x8xf32>
    %1 = bufferization.alloc_tensor() : tensor<1x6x8xf32>
    %2 = scf.for %arg3 = %c0 to %c32 step %c8 iter_args(%arg4 = %cast) -> (tensor<?x1x6x8xf32>) {
      %3 = affine.apply #map(%arg3)
      %extracted_slice = tensor.extract_slice %arg2[%arg0, %arg1, %arg3] [1, 6, 8] [1, 1, 1] : tensor<8x18x32xf32> to tensor<1x6x8xf32>
      %4 = scf.for %arg5 = %c0 to %c6 step %c1 iter_args(%arg6 = %1) -> (tensor<1x6x8xf32>) {
        %extracted_slice_0 = tensor.extract_slice %extracted_slice[0, %arg5, 0] [1, 1, 8] [1, 1, 1] : tensor<1x6x8xf32> to tensor<1x1x8xf32>
        %inserted_slice_1 = tensor.insert_slice %extracted_slice_0 into %arg6[0, %arg5, 0] [1, 1, 8] [1, 1, 1] : tensor<1x1x8xf32> into tensor<1x6x8xf32>
        scf.yield %inserted_slice_1 : tensor<1x6x8xf32>
      }
      %inserted_slice = tensor.insert_slice %4 into %arg4[%3, 0, 0, 0] [1, 1, 6, 8] [1, 1, 1, 1] : tensor<1x6x8xf32> into tensor<?x1x6x8xf32>
      scf.yield %inserted_slice : tensor<?x1x6x8xf32>
    }
    return %2 : tensor<?x1x6x8xf32>
  }
}

// -----
module {
  func.func @rank_reducing_parallel_insert_slice(%arg0: tensor<100xf32>, %arg1: tensor<200x100xf32>) {
    %c1 = arith.constant 1 : index
    %c100 = arith.constant 100 : index
    %0 = scf.forall (%arg2) in (%c100) shared_outs(%arg3 = %arg1) -> (tensor<200x100xf32>) {
      %extracted_slice = tensor.extract_slice %arg0[%arg2] [1] [1] : tensor<100xf32> to tensor<1xf32>
      scf.forall.in_parallel {
        tensor.parallel_insert_slice %extracted_slice into %arg3[1, %arg2] [1, 1] [1, 1] : tensor<1xf32> into tensor<200x100xf32>
      }
    }
    return
  }
}

// -----
module {
  func.func @parallel_insert_full_slice_in_place(%arg0: tensor<2xf32>) -> tensor<2xf32> {
    %cst = arith.constant 0.000000e+00 : f32
    %0 = scf.forall (%arg1) in (1) shared_outs(%arg2 = %arg0) -> (tensor<2xf32>) {
      %1 = linalg.fill ins(%cst : f32) outs(%arg2 : tensor<2xf32>) -> tensor<2xf32>
      scf.forall.in_parallel {
        tensor.parallel_insert_slice %1 into %arg2[0] [2] [1] : tensor<2xf32> into tensor<2xf32>
      }
    } {mapping = [#gpu.thread<linear_dim_0>]}
    return %0 : tensor<2xf32>
  }
}

// -----
module {
  func.func @insert_equivalent_tensor(%arg0: tensor<10xf32>) -> tensor<10xf32> {
    %cst = arith.constant 4.200000e+01 : f32
    %0 = linalg.fill ins(%cst : f32) outs(%arg0 : tensor<10xf32>) -> tensor<10xf32>
    %inserted_slice = tensor.insert_slice %0 into %arg0[0] [10] [1] : tensor<10xf32> into tensor<10xf32>
    return %inserted_slice : tensor<10xf32>
  }
}

// -----
module {
  func.func @pad_memory_space(%arg0: tensor<?xf32>, %arg1: index, %arg2: f32, %arg3: index) -> f32 {
    %0 = bufferization.alloc_tensor() copy(%arg0) {memory_space = 3 : i64} : tensor<?xf32>
    %padded = tensor.pad %0 low[2] high[%arg1] {
    ^bb0(%arg4: index):
      tensor.yield %arg2 : f32
    } : tensor<?xf32> to tensor<15xf32>
    %extracted = tensor.extract %padded[%arg3] : tensor<15xf32>
    return %extracted : f32
  }
}

// -----
module {
  func.func @insert_slice_regression(%arg0: tensor<10xf32>, %arg1: tensor<5xf32>) -> tensor<10xf32> {
    %cst = arith.constant 0.000000e+00 : f32
    %c0 = arith.constant 0 : index
    %0 = linalg.fill ins(%cst : f32) outs(%arg0 : tensor<10xf32>) -> tensor<10xf32>
    %1 = vector.transfer_read %0[%c0], %cst : tensor<10xf32>, vector<10xf32>
    vector.print %1 : vector<10xf32>
    %inserted_slice = tensor.insert_slice %arg1 into %arg0[0] [5] [1] : tensor<5xf32> into tensor<10xf32>
    return %inserted_slice : tensor<10xf32>
  }
}

// -----
module {
  func.func @insert_slice_full_overwrite(%arg0: tensor<10xf32>, %arg1: tensor<10xf32>) -> tensor<10xf32> {
    %cst = arith.constant 0.000000e+00 : f32
    %c0 = arith.constant 0 : index
    %0 = linalg.fill ins(%cst : f32) outs(%arg0 : tensor<10xf32>) -> tensor<10xf32>
    %1 = vector.transfer_read %0[%c0], %cst : tensor<10xf32>, vector<10xf32>
    vector.print %1 : vector<10xf32>
    %inserted_slice = tensor.insert_slice %arg1 into %arg0[0] [10] [1] : tensor<10xf32> into tensor<10xf32>
    return %inserted_slice : tensor<10xf32>
  }
}

// -----
module {
  func.func @dim_not_reading(%arg0: tensor<?xf32>, %arg1: f32, %arg2: index) -> (tensor<?xf32>, index) {
    %c0 = arith.constant 0 : index
    %inserted = tensor.insert %arg1 into %arg0[%arg2] : tensor<?xf32>
    %dim = tensor.dim %arg0, %c0 : tensor<?xf32>
    return %inserted, %dim : tensor<?xf32>, index
  }
}

// -----
module {
  func.func private @cast_retains_buffer_layout(%arg0: tensor<?xf32> {bufferization.buffer_layout = affine_map<(d0) -> (d0 + 5)>}, %arg1: index) -> (tensor<10xf32>, tensor<?xf32>) {
    %cast = tensor.cast %arg0 : tensor<?xf32> to tensor<10xf32>
    %extracted_slice = tensor.extract_slice %cast[2] [%arg1] [1] : tensor<10xf32> to tensor<?xf32>
    return %cast, %extracted_slice : tensor<10xf32>, tensor<?xf32>
  }
}

// -----
module {
  func.func private @cast_retains_buffer_layout_strided(%arg0: tensor<?xf32> {bufferization.buffer_layout = strided<[1], offset: 5>}, %arg1: index) -> (tensor<10xf32>, tensor<?xf32>) {
    %cast = tensor.cast %arg0 : tensor<?xf32> to tensor<10xf32>
    %extracted_slice = tensor.extract_slice %cast[2] [%arg1] [1] : tensor<10xf32> to tensor<?xf32>
    return %cast, %extracted_slice : tensor<10xf32>, tensor<?xf32>
  }
}

// -----
module {
  func.func @parallel_insert_slice_source_out_of_place(%arg0: tensor<1xf32>, %arg1: tensor<100xf32>, %arg2: f32) {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c50 = arith.constant 50 : index
    %0 = scf.forall (%arg3) in (%c50) shared_outs(%arg4 = %arg1) -> (tensor<100xf32>) {
      %inserted = tensor.insert %arg2 into %arg0[%c0] : tensor<1xf32>
      %extracted = tensor.extract %arg0[%c0] : tensor<1xf32>
      vector.print %extracted : f32
      scf.forall.in_parallel {
        tensor.parallel_insert_slice %inserted into %arg4[%arg3] [1] [1] : tensor<1xf32> into tensor<100xf32>
      }
    }
    return
  }
}

// -----
module {
  func.func @tensor.reshape() -> tensor<2x2x5xf32> {
    %cst = arith.constant dense<0.000000e+00> : tensor<2x10xf32>
    %cast = tensor.cast %cst : tensor<2x10xf32> to tensor<?x10xf32>
    %cst_0 = arith.constant dense<[2, 2, 5]> : tensor<3xi64>
    %reshape = tensor.reshape %cast(%cst_0) : (tensor<?x10xf32>, tensor<3xi64>) -> tensor<2x2x5xf32>
    return %reshape : tensor<2x2x5xf32>
  }
}

// -----
module {
  func.func @tensor_reshape_aliasing(%arg0: index, %arg1: index) -> tensor<?x?xf32> {
    %cst = arith.constant dense<0.000000e+00> : tensor<10xf32>
    %cast = tensor.cast %cst : tensor<10xf32> to tensor<?xf32>
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %0 = bufferization.alloc_tensor() : tensor<2xindex>
    %inserted = tensor.insert %arg0 into %0[%c0] : tensor<2xindex>
    %inserted_0 = tensor.insert %arg1 into %inserted[%c1] : tensor<2xindex>
    %reshape = tensor.reshape %cast(%inserted_0) : (tensor<?xf32>, tensor<2xindex>) -> tensor<?x?xf32>
    return %reshape : tensor<?x?xf32>
  }
}

// -----
module {
  func.func @reshape_with_non_identity_layout(%arg0: memref<2x2xf32, strided<[?, ?], offset: ?>, 3>, %arg1: tensor<2xi32>, %arg2: index) -> f32 {
    %0 = bufferization.to_tensor %arg0 restrict : memref<2x2xf32, strided<[?, ?], offset: ?>, 3> to tensor<2x2xf32>
    %extracted_slice = tensor.extract_slice %0[1, 0] [1, 2] [1, 1] : tensor<2x2xf32> to tensor<2xf32>
    %reshape = tensor.reshape %extracted_slice(%arg1) : (tensor<2xf32>, tensor<2xi32>) -> tensor<1x2xf32>
    %extracted = tensor.extract %reshape[%arg2, %arg2] : tensor<1x2xf32>
    return %extracted : f32
  }
}

// -----
module {
  func.func @collapse_shape_regression(%arg0: tensor<10x20xf32>, %arg1: f32, %arg2: index) {
    %extracted_slice = tensor.extract_slice %arg0[2, 3] [5, 6] [1, 1] : tensor<10x20xf32> to tensor<5x6xf32>
    %inserted = tensor.insert %arg1 into %extracted_slice[%arg2, %arg2] : tensor<5x6xf32>
    %collapsed = tensor.collapse_shape %extracted_slice [[0, 1]] : tensor<5x6xf32> into tensor<30xf32>
    return
  }
}

// -----
module {
  func.func private @mult_return_callee(%arg0: tensor<?xf32>, %arg1: i1, %arg2: index, %arg3: index) -> (tensor<10xf32>, index) {
    %cast = tensor.cast %arg0 : tensor<?xf32> to tensor<10xf32>
    cf.cond_br %arg1, ^bb1, ^bb2
  ^bb1:  // pred: ^bb0
    return %cast, %arg2 : tensor<10xf32>, index
  ^bb2:  // pred: ^bb0
    return %cast, %arg3 : tensor<10xf32>, index
  }
  func.func @mult_return(%arg0: tensor<?xf32>, %arg1: i1, %arg2: index, %arg3: index) -> (tensor<10xf32>, index) {
    %0:2 = call @mult_return_callee(%arg0, %arg1, %arg2, %arg3) : (tensor<?xf32>, i1, index, index) -> (tensor<10xf32>, index)
    return %0#0, %0#1 : tensor<10xf32>, index
  }
}

