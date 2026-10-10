module {
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.op<"func.func">
      transform.apply_patterns to %0 {
        transform.apply_patterns.tensor.fold_tensor_subset_ops_into_vector_transfers
      } : !transform.op<"func.func">
      transform.yield 
    }
  }
  func.func @transfer_read_of_extract_slice(%arg0: tensor<?x?xf32>, %arg1: index, %arg2: index) -> vector<5x6xf32> {
    %c3 = arith.constant 3 : index
    %c4 = arith.constant 4 : index
    %cst = arith.constant 0.000000e+00 : f32
    %extracted_slice = tensor.extract_slice %arg0[5, %arg1] [10, %arg2] [1, 1] : tensor<?x?xf32> to tensor<10x?xf32>
    %0 = vector.transfer_read %extracted_slice[%c3, %c4], %cst {in_bounds = [true, true]} : tensor<10x?xf32>, vector<5x6xf32>
    return %0 : vector<5x6xf32>
  }
  func.func @transfer_read_of_extract_slice_1d(%arg0: tensor<?x?xf32>, %arg1: index, %arg2: index) -> vector<6xf32> {
    %c3 = arith.constant 3 : index
    %c4 = arith.constant 4 : index
    %cst = arith.constant 0.000000e+00 : f32
    %extracted_slice = tensor.extract_slice %arg0[5, %arg1] [10, %arg2] [1, 1] : tensor<?x?xf32> to tensor<10x?xf32>
    %0 = vector.transfer_read %extracted_slice[%c3, %c4], %cst {in_bounds = [true]} : tensor<10x?xf32>, vector<6xf32>
    return %0 : vector<6xf32>
  }
  func.func @transfer_read_of_extract_slice_rank_reducing(%arg0: tensor<?x?x?xf32>, %arg1: index, %arg2: index) -> vector<5x6xf32> {
    %c3 = arith.constant 3 : index
    %c4 = arith.constant 4 : index
    %cst = arith.constant 0.000000e+00 : f32
    %extracted_slice = tensor.extract_slice %arg0[5, %arg1, 6] [1, %arg2, 12] [1, 1, 1] : tensor<?x?x?xf32> to tensor<?x12xf32>
    %0 = vector.transfer_read %extracted_slice[%c3, %c4], %cst {in_bounds = [true, true]} : tensor<?x12xf32>, vector<5x6xf32>
    return %0 : vector<5x6xf32>
  }
  func.func @transfer_read_of_extract_slice_non_leading_rank_reduction(%arg0: tensor<?x?x?xf32>, %arg1: index, %arg2: index) -> vector<5x6xf32> {
    %c3 = arith.constant 3 : index
    %c4 = arith.constant 4 : index
    %cst = arith.constant 0.000000e+00 : f32
    %extracted_slice = tensor.extract_slice %arg0[5, %arg1, 6] [%arg2, 1, 12] [1, 1, 1] : tensor<?x?x?xf32> to tensor<?x12xf32>
    %0 = vector.transfer_read %extracted_slice[%c3, %c4], %cst {in_bounds = [true, true]} : tensor<?x12xf32>, vector<5x6xf32>
    return %0 : vector<5x6xf32>
  }
  func.func @masked_transfer_read_of_extract_slice(%arg0: tensor<?x?xf32>, %arg1: index, %arg2: index) -> vector<5x6xf32> {
    %c3 = arith.constant 3 : index
    %c4 = arith.constant 4 : index
    %cst = arith.constant 0.000000e+00 : f32
    %extracted_slice = tensor.extract_slice %arg0[5, %arg1] [10, %arg2] [1, 1] : tensor<?x?xf32> to tensor<10x?xf32>
    %0 = vector.create_mask %c3, %c4 : vector<5x6xi1>
    %1 = vector.mask %0 { vector.transfer_read %extracted_slice[%c3, %c4], %cst {in_bounds = [true, true]} : tensor<10x?xf32>, vector<5x6xf32> } : vector<5x6xi1> -> vector<5x6xf32>
    return %1 : vector<5x6xf32>
  }
  func.func @insert_slice_of_transfer_write(%arg0: tensor<?x12xf32>, %arg1: vector<5x6xf32>, %arg2: index, %arg3: tensor<5x6xf32>) -> tensor<?x12xf32> {
    %c0 = arith.constant 0 : index
    %0 = vector.transfer_write %arg1, %arg3[%c0, %c0] {in_bounds = [true, true]} : vector<5x6xf32>, tensor<5x6xf32>
    %inserted_slice = tensor.insert_slice %0 into %arg0[3, %arg2] [5, 6] [1, 1] : tensor<5x6xf32> into tensor<?x12xf32>
    return %inserted_slice : tensor<?x12xf32>
  }
  func.func @unit_insert_slice_of_unit_transfer_write(%arg0: tensor<1x1x12xf32>, %arg1: vector<1x6xf32>, %arg2: index, %arg3: tensor<1x6xf32>) -> tensor<1x1x12xf32> {
    %c0 = arith.constant 0 : index
    %0 = vector.transfer_write %arg1, %arg3[%c0, %c0] {in_bounds = [true, true]} : vector<1x6xf32>, tensor<1x6xf32>
    %inserted_slice = tensor.insert_slice %0 into %arg0[0, 0, %arg2] [1, 1, 6] [1, 1, 1] : tensor<1x6xf32> into tensor<1x1x12xf32>
    return %inserted_slice : tensor<1x1x12xf32>
  }
  func.func @insert_slice_of_transfer_write_non_leading_rank_reduction(%arg0: tensor<?x?x12xf32>, %arg1: vector<5x6xf32>, %arg2: index, %arg3: tensor<5x6xf32>) -> tensor<?x?x12xf32> {
    %c0 = arith.constant 0 : index
    %0 = vector.transfer_write %arg1, %arg3[%c0, %c0] {in_bounds = [true, true]} : vector<5x6xf32>, tensor<5x6xf32>
    %inserted_slice = tensor.insert_slice %0 into %arg0[4, 3, %arg2] [5, 1, 6] [1, 1, 1] : tensor<5x6xf32> into tensor<?x?x12xf32>
    return %inserted_slice : tensor<?x?x12xf32>
  }
  func.func @insert_slice_of_transfer_write_rank_extending(%arg0: tensor<?x?x12xf32>, %arg1: vector<5x6xf32>, %arg2: index, %arg3: tensor<5x6xf32>) -> tensor<?x?x12xf32> {
    %c0 = arith.constant 0 : index
    %0 = vector.transfer_write %arg1, %arg3[%c0, %c0] {in_bounds = [true, true]} : vector<5x6xf32>, tensor<5x6xf32>
    %inserted_slice = tensor.insert_slice %0 into %arg0[4, 3, %arg2] [1, 5, 6] [1, 1, 1] : tensor<5x6xf32> into tensor<?x?x12xf32>
    return %inserted_slice : tensor<?x?x12xf32>
  }
}

