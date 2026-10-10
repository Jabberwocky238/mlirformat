module {
  func.func @extract_slice_same_rank(%arg0: tensor<?x?x?x?xf32>, %arg1: index, %arg2: index, %arg3: index, %arg4: index) -> tensor<8x16x32x?xf32> {
    %extracted_slice = tensor.extract_slice %arg0[0, 1, 2, %arg1] [128, 128, 128, %arg3] [1, 1, 1, 1] : tensor<?x?x?x?xf32> to tensor<128x128x128x?xf32>
    %extracted_slice_0 = tensor.extract_slice %extracted_slice[7, 8, 9, %arg2] [8, 16, 32, %arg4] [1, 1, 1, 1] : tensor<128x128x128x?xf32> to tensor<8x16x32x?xf32>
    return %extracted_slice_0 : tensor<8x16x32x?xf32>
  }
}

// -----
module {
  func.func @extract_slice_rank_reducing_consumer(%arg0: tensor<?x?x?x?xf32>, %arg1: index, %arg2: index, %arg3: index, %arg4: index) -> tensor<16x?xf32> {
    %extracted_slice = tensor.extract_slice %arg0[0, 1, 2, %arg1] [128, 128, 128, %arg3] [1, 1, 1, 1] : tensor<?x?x?x?xf32> to tensor<128x128x128x?xf32>
    %extracted_slice_0 = tensor.extract_slice %extracted_slice[7, 8, 9, %arg2] [1, 16, 1, %arg4] [1, 1, 1, 1] : tensor<128x128x128x?xf32> to tensor<16x?xf32>
    return %extracted_slice_0 : tensor<16x?xf32>
  }
}

// -----
module {
  func.func @extract_slice_rank_reducing_producer(%arg0: tensor<?x?x?x?xf32>, %arg1: index, %arg2: index, %arg3: index, %arg4: index) -> tensor<8x?xf32> {
    %extracted_slice = tensor.extract_slice %arg0[0, 1, 2, %arg1] [1, 128, 1, %arg3] [1, 1, 1, 1] : tensor<?x?x?x?xf32> to tensor<128x?xf32>
    %extracted_slice_0 = tensor.extract_slice %extracted_slice[7, %arg2] [8, %arg4] [1, 1] : tensor<128x?xf32> to tensor<8x?xf32>
    return %extracted_slice_0 : tensor<8x?xf32>
  }
}

// -----
module {
  func.func @extract_slice_non_one_stride(%arg0: tensor<?xf32>, %arg1: index, %arg2: index, %arg3: index, %arg4: index, %arg5: index, %arg6: index) -> tensor<?xf32> {
    %extracted_slice = tensor.extract_slice %arg0[%arg1] [%arg3] [%arg5] : tensor<?xf32> to tensor<?xf32>
    %extracted_slice_0 = tensor.extract_slice %extracted_slice[%arg2] [%arg4] [%arg6] : tensor<?xf32> to tensor<?xf32>
    return %extracted_slice_0 : tensor<?xf32>
  }
}

// -----
module {
  func.func @insert_slice_rank_reducing(%arg0: tensor<128x128x128x128xf32>, %arg1: tensor<1x16x1xf32>, %arg2: tensor<16xf32>, %arg3: index) -> tensor<128x128x128x128xf32> {
    %inserted_slice = tensor.insert_slice %arg2 into %arg1[0, 0, 0] [1, 16, 1] [1, 1, 1] : tensor<16xf32> into tensor<1x16x1xf32>
    %inserted_slice_0 = tensor.insert_slice %inserted_slice into %arg0[6, 7, 8, %arg3] [1, 1, 16, 1] [1, 1, 1, 1] : tensor<1x16x1xf32> into tensor<128x128x128x128xf32>
    return %inserted_slice_0 : tensor<128x128x128x128xf32>
  }
}

// -----
module {
  func.func @insert_slice_rank_reducing_dynamic_shape(%arg0: tensor<128x128x128x128xf32>, %arg1: tensor<1x?x1xf32>, %arg2: tensor<?xf32>, %arg3: index, %arg4: index) -> tensor<128x128x128x128xf32> {
    %inserted_slice = tensor.insert_slice %arg2 into %arg1[0, 0, 0] [1, %arg4, 1] [1, 1, 1] : tensor<?xf32> into tensor<1x?x1xf32>
    %inserted_slice_0 = tensor.insert_slice %inserted_slice into %arg0[6, 7, 8, %arg3] [1, 1, %arg4, 1] [1, 1, 1, 1] : tensor<1x?x1xf32> into tensor<128x128x128x128xf32>
    return %inserted_slice_0 : tensor<128x128x128x128xf32>
  }
}

// -----
module {
  func.func @parallel_insert_slice(%arg0: tensor<1x2xf32>, %arg1: tensor<f32>, %arg2: tensor<1x1xf32>) -> tensor<1x2xf32> {
    %c1 = arith.constant 1 : index
    %c2 = arith.constant 2 : index
    %0 = scf.forall (%arg3, %arg4) in (%c1, %c2) shared_outs(%arg5 = %arg0) -> (tensor<1x2xf32>) {
      %inserted_slice = tensor.insert_slice %arg1 into %arg2[0, 0] [1, 1] [1, 1] : tensor<f32> into tensor<1x1xf32>
      scf.forall.in_parallel {
        tensor.parallel_insert_slice %inserted_slice into %arg5[%arg3, %arg4] [1, 1] [1, 1] : tensor<1x1xf32> into tensor<1x2xf32>
      }
    }
    return %0 : tensor<1x2xf32>
  }
}

