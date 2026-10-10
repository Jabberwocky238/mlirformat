module {
  func.func @fold_vector_transfer_read_with_rank_reduced_extract_slice(%arg0: tensor<?x?x?xf32>, %arg1: index, %arg2: index, %arg3: index, %arg4: index, %arg5: index, %arg6: index) -> vector<4xf32> {
    %cst = arith.constant 0.000000e+00 : f32
    %extracted_slice = tensor.extract_slice %arg0[0, %arg1, %arg2] [1, %arg3, %arg4] [1, 1, 1] : tensor<?x?x?xf32> to tensor<?x?xf32>
    %0 = vector.transfer_read %extracted_slice[%arg5, %arg6], %cst {in_bounds = [true]} : tensor<?x?xf32>, vector<4xf32>
    return %0 : vector<4xf32>
  }
}

// -----
module {
  func.func @transfer_read_from_rank_reducing_extract_slice_failure(%arg0: tensor<1x8x8x8xf32>, %arg1: index, %arg2: index, %arg3: index, %arg4: index) -> vector<4xf32> {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c2 = arith.constant 2 : index
    %cst = arith.constant 0.000000e+00 : f32
    %extracted_slice = tensor.extract_slice %arg0[0, %arg1, %arg2, %arg3] [1, 4, 1, 4] [2, 3, 4, 5] : tensor<1x8x8x8xf32> to tensor<1x4x4xf32>
    %0 = vector.transfer_read %extracted_slice[%c1, %arg4, %c2], %cst {in_bounds = [true]} : tensor<1x4x4xf32>, vector<4xf32>
    return %0 : vector<4xf32>
  }
}

// -----
module {
  func.func @transfer_read_of_extract_slice(%arg0: tensor<?x?xf32>, %arg1: index, %arg2: index) -> vector<5x6xf32> {
    %c3 = arith.constant 3 : index
    %c4 = arith.constant 4 : index
    %cst = arith.constant 0.000000e+00 : f32
    %extracted_slice = tensor.extract_slice %arg0[5, %arg1] [10, %arg2] [1, 1] : tensor<?x?xf32> to tensor<10x?xf32>
    %0 = vector.transfer_read %extracted_slice[%c3, %c4], %cst {in_bounds = [true, true]} : tensor<10x?xf32>, vector<5x6xf32>
    return %0 : vector<5x6xf32>
  }
}

// -----
module {
  func.func @fold_extract_slice_with_transfer_read_0d(%arg0: tensor<12x32xf32>, %arg1: index, %arg2: index, %arg3: index) -> vector<f32> {
    %cst = arith.constant 1.000000e+00 : f32
    %extracted_slice = tensor.extract_slice %arg0[%arg1, %arg2] [1, 1] [1, 1] : tensor<12x32xf32> to tensor<f32>
    %0 = vector.transfer_read %extracted_slice[], %cst : tensor<f32>, vector<f32>
    return %0 : vector<f32>
  }
}

// -----
module {
  func.func @transfer_read_of_extract_slice(%arg0: tensor<?x?xf32>, %arg1: index, %arg2: index) -> vector<6xf32> {
    %c3 = arith.constant 3 : index
    %c4 = arith.constant 4 : index
    %cst = arith.constant 0.000000e+00 : f32
    %extracted_slice = tensor.extract_slice %arg0[5, %arg1] [10, %arg2] [1, 1] : tensor<?x?xf32> to tensor<10x?xf32>
    %0 = vector.transfer_read %extracted_slice[%c3, %c4], %cst {in_bounds = [true]} : tensor<10x?xf32>, vector<6xf32>
    return %0 : vector<6xf32>
  }
}

// -----
module {
  func.func @transfer_read_of_extract_slice_rank_reducing(%arg0: tensor<?x?x?xf32>, %arg1: index, %arg2: index) -> vector<5x6xf32> {
    %c3 = arith.constant 3 : index
    %c4 = arith.constant 4 : index
    %cst = arith.constant 0.000000e+00 : f32
    %extracted_slice = tensor.extract_slice %arg0[5, %arg1, 6] [1, %arg2, 12] [1, 1, 1] : tensor<?x?x?xf32> to tensor<?x12xf32>
    %0 = vector.transfer_read %extracted_slice[%c3, %c4], %cst {in_bounds = [true, true]} : tensor<?x12xf32>, vector<5x6xf32>
    return %0 : vector<5x6xf32>
  }
}

// -----
module {
  func.func @transfer_read_of_extract_slice_swappy_rank_reducing(%arg0: tensor<?x?x?xf32>, %arg1: index, %arg2: index) -> vector<5x6xf32> {
    %c3 = arith.constant 3 : index
    %c4 = arith.constant 4 : index
    %cst = arith.constant 0.000000e+00 : f32
    %extracted_slice = tensor.extract_slice %arg0[5, %arg1, %arg2] [%arg2, 1, 12] [1, 1, 1] : tensor<?x?x?xf32> to tensor<?x12xf32>
    %0 = vector.transfer_read %extracted_slice[%c3, %c4], %cst {in_bounds = [true, true]} : tensor<?x12xf32>, vector<5x6xf32>
    return %0 : vector<5x6xf32>
  }
}

// -----
module {
  func.func @fold_vector_transfer_write_with_rank_reduced_insert_slice(%arg0: tensor<?x?x?xf32>, %arg1: vector<4xf32>, %arg2: index, %arg3: index, %arg4: index, %arg5: index, %arg6: index, %arg7: index, %arg8: tensor<?x?xf32>) -> tensor<?x?x?xf32> {
    %cst = arith.constant 0.000000e+00 : f32
    %0 = vector.transfer_write %arg1, %arg8[%arg6, %arg7] {in_bounds = [true]} : vector<4xf32>, tensor<?x?xf32>
    %inserted_slice = tensor.insert_slice %0 into %arg0[0, %arg2, %arg3] [1, %arg4, %arg5] [1, 1, 1] : tensor<?x?xf32> into tensor<?x?x?xf32>
    return %inserted_slice : tensor<?x?x?xf32>
  }
}

// -----
module {
  func.func @fold_vector_transfer_write_with_inner_rank_reduced_insert_slice(%arg0: tensor<?x?x?xf32>, %arg1: vector<4xf32>, %arg2: index, %arg3: index, %arg4: index, %arg5: index, %arg6: index, %arg7: index, %arg8: tensor<?x?xf32>) -> tensor<?x?x?xf32> {
    %cst = arith.constant 0.000000e+00 : f32
    %0 = vector.transfer_write %arg1, %arg8[%arg6, %arg7] {in_bounds = [true]} : vector<4xf32>, tensor<?x?xf32>
    %inserted_slice = tensor.insert_slice %0 into %arg0[%arg2, %arg3, 0] [%arg4, %arg5, 1] [1, 1, 1] : tensor<?x?xf32> into tensor<?x?x?xf32>
    return %inserted_slice : tensor<?x?x?xf32>
  }
}

// -----
module {
  func.func @insert_slice_of_transfer_write(%arg0: tensor<?x12xf32>, %arg1: vector<5x6xf32>, %arg2: index, %arg3: tensor<5x6xf32>) -> tensor<?x12xf32> {
    %c0 = arith.constant 0 : index
    %0 = vector.transfer_write %arg1, %arg3[%c0, %c0] {in_bounds = [true, true]} : vector<5x6xf32>, tensor<5x6xf32>
    %inserted_slice = tensor.insert_slice %0 into %arg0[3, %arg2] [5, 6] [1, 1] : tensor<5x6xf32> into tensor<?x12xf32>
    return %inserted_slice : tensor<?x12xf32>
  }
}

// -----
module {
  func.func @insert_slice_of_transfer_write_overwrite_all(%arg0: tensor<1000x1000xf32>, %arg1: vector<5x6xf32>, %arg2: index, %arg3: tensor<100x100xf32>) -> tensor<1000x1000xf32> {
    %c0 = arith.constant 0 : index
    %0 = vector.transfer_write %arg1, %arg3[%c0, %c0] {in_bounds = [true, true]} : vector<5x6xf32>, tensor<100x100xf32>
    %inserted_slice = tensor.insert_slice %0 into %arg0[3, %arg2] [100, 100] [1, 1] : tensor<100x100xf32> into tensor<1000x1000xf32>
    return %inserted_slice : tensor<1000x1000xf32>
  }
}

// -----
module {
  func.func @insert_slice_of_transfer_write_swappy_rank_extending(%arg0: tensor<?x?x12xf32>, %arg1: vector<5x6xf32>, %arg2: index, %arg3: tensor<5x6xf32>) -> tensor<?x?x12xf32> {
    %c0 = arith.constant 0 : index
    %0 = vector.transfer_write %arg1, %arg3[%c0, %c0] {in_bounds = [true, true]} : vector<5x6xf32>, tensor<5x6xf32>
    %inserted_slice = tensor.insert_slice %0 into %arg0[4, 3, %arg2] [5, 1, 6] [1, 1, 1] : tensor<5x6xf32> into tensor<?x?x12xf32>
    return %inserted_slice : tensor<?x?x12xf32>
  }
}

// -----
module {
  func.func @insert_slice_of_transfer_write_rank_extending(%arg0: tensor<?x?x12xf32>, %arg1: vector<5x6xf32>, %arg2: index, %arg3: tensor<5x6xf32>) -> tensor<?x?x12xf32> {
    %c0 = arith.constant 0 : index
    %0 = vector.transfer_write %arg1, %arg3[%c0, %c0] {in_bounds = [true, true]} : vector<5x6xf32>, tensor<5x6xf32>
    %inserted_slice = tensor.insert_slice %0 into %arg0[4, 3, %arg2] [1, 5, 6] [1, 1, 1] : tensor<5x6xf32> into tensor<?x?x12xf32>
    return %inserted_slice : tensor<?x?x12xf32>
  }
}

// -----
module {
  func.func @insert_slice_of_insert_slice(%arg0: tensor<f32>, %arg1: tensor<1x1xf32>, %arg2: tensor<1x14xf32>, %arg3: index) -> tensor<1x14xf32> {
    %inserted_slice = tensor.insert_slice %arg0 into %arg1[0, 0] [1, 1] [1, 1] : tensor<f32> into tensor<1x1xf32>
    %inserted_slice_0 = tensor.insert_slice %inserted_slice into %arg2[0, %arg3] [1, 1] [1, 1] : tensor<1x1xf32> into tensor<1x14xf32>
    return %inserted_slice_0 : tensor<1x14xf32>
  }
}

// -----
module {
  func.func @insert_slice_of_insert_slice(%arg0: tensor<f32>, %arg1: tensor<1xf32>, %arg2: tensor<1x14xf32>, %arg3: index) -> tensor<1x14xf32> {
    %inserted_slice = tensor.insert_slice %arg0 into %arg1[0] [1] [1] : tensor<f32> into tensor<1xf32>
    %inserted_slice_0 = tensor.insert_slice %inserted_slice into %arg2[0, %arg3] [1, 1] [1, 1] : tensor<1xf32> into tensor<1x14xf32>
    return %inserted_slice_0 : tensor<1x14xf32>
  }
}

// -----
module {
  func.func @fail_insert_slice_of_insert_slice(%arg0: tensor<4xf32>, %arg1: tensor<?xf32>, %arg2: tensor<?x?xf32>, %arg3: index) -> tensor<?x?xf32> {
    %inserted_slice = tensor.insert_slice %arg0 into %arg1[%arg3] [4] [1] : tensor<4xf32> into tensor<?xf32>
    %inserted_slice_0 = tensor.insert_slice %inserted_slice into %arg2[%arg3, 423] [%arg3, 1] [1, 1] : tensor<?xf32> into tensor<?x?xf32>
    return %inserted_slice_0 : tensor<?x?xf32>
  }
}

// -----
module {
  func.func @insert_slice_of_insert_slice_dynamic(%arg0: tensor<?xf32>, %arg1: tensor<?xf32>, %arg2: tensor<?x?xf32>, %arg3: index) -> tensor<?x?xf32> {
    %inserted_slice = tensor.insert_slice %arg0 into %arg1[%arg3] [%arg3] [1] : tensor<?xf32> into tensor<?xf32>
    %inserted_slice_0 = tensor.insert_slice %inserted_slice into %arg2[%arg3, 423] [%arg3, 1] [1, 1] : tensor<?xf32> into tensor<?x?xf32>
    return %inserted_slice_0 : tensor<?x?xf32>
  }
}

// -----
module {
  func.func @insert_slice_of_insert_slice_dynamic(%arg0: tensor<?xf32>, %arg1: tensor<?xf32>, %arg2: tensor<?x?xf32>, %arg3: index) -> tensor<?x?xf32> {
    %inserted_slice = tensor.insert_slice %arg0 into %arg1[%arg3] [%arg3] [1] : tensor<?xf32> into tensor<?xf32>
    %inserted_slice_0 = tensor.insert_slice %inserted_slice into %arg2[%arg3, 423] [%arg3, 1] [1, 1] : tensor<?xf32> into tensor<?x?xf32>
    return %inserted_slice_0 : tensor<?x?xf32>
  }
}

// -----
module {
  func.func @parallel_insert_slice_of_insert_slice_dynamic(%arg0: tensor<12x34xf32>, %arg1: index, %arg2: index, %arg3: index, %arg4: index) -> tensor<12x34xf32> {
    %0 = scf.forall (%arg5, %arg6) in (27, 8) shared_outs(%arg7 = %arg0) -> (tensor<12x34xf32>) {
      %1 = "make_me_a_tensor"() : () -> tensor<?x?xf32>
      %2 = "make_me_another_tensor"() : () -> tensor<?x?xf32>
      %inserted_slice = tensor.insert_slice %1 into %2[%arg2, 0] [%arg3, %arg4] [1, 1] : tensor<?x?xf32> into tensor<?x?xf32>
      scf.forall.in_parallel {
        tensor.parallel_insert_slice %inserted_slice into %arg7[%arg1, %arg2] [%arg3, %arg4] [1, 1] : tensor<?x?xf32> into tensor<12x34xf32>
      }
    }
    return %0 : tensor<12x34xf32>
  }
}

