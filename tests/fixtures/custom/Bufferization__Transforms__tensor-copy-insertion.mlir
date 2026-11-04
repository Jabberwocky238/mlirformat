module {
  func.func @read_after_write_conflict(%arg0: tensor<?xf32>, %arg1: index, %arg2: f32) -> (tensor<?xf32>, tensor<?xf32>) {
    %inserted = tensor.insert %arg2 into %arg0[%arg1] : tensor<?xf32>
    return %inserted, %arg0 : tensor<?xf32>, tensor<?xf32>
  }
}

// -----
module {
  func.func @return_alloc_tensor() -> tensor<5xf32> {
    %0 = bufferization.alloc_tensor() : tensor<5xf32>
    return %0 : tensor<5xf32>
  }
}

// -----
module {
  func.func @do_not_copy_undefined_tensor(%arg0: f32, %arg1: index) -> (tensor<5xf32>, tensor<5xf32>) {
    %0 = bufferization.alloc_tensor() : tensor<5xf32>
    %inserted = tensor.insert %arg0 into %0[%arg1] : tensor<5xf32>
    return %0, %inserted : tensor<5xf32>, tensor<5xf32>
  }
}

// -----
#map = affine_map<(d0) -> (d0)>
module {
  func.func @do_not_copy_when_overwritten(%arg0: tensor<5xf32>, %arg1: f32) -> (tensor<5xf32>, tensor<5xf32>) {
    %0 = linalg.generic {indexing_maps = [#map], iterator_types = ["parallel"]} outs(%arg0 : tensor<5xf32>) {
    ^bb0(%out: f32):
      linalg.yield %arg1 : f32
    } -> tensor<5xf32>
    return %arg0, %0 : tensor<5xf32>, tensor<5xf32>
  }
}

// -----
#map = affine_map<(d0) -> (d0)>
module {
  func.func @do_not_copy_when_result_not_read(%arg0: tensor<5xf32>, %arg1: f32) -> tensor<3xf32> {
    %extracted_slice = tensor.extract_slice %arg0[0] [3] [1] : tensor<5xf32> to tensor<3xf32>
    %0 = linalg.generic {indexing_maps = [#map], iterator_types = ["parallel"]} outs(%extracted_slice : tensor<3xf32>) {
    ^bb0(%out: f32):
      linalg.yield %arg1 : f32
    } -> tensor<3xf32>
    return %0 : tensor<3xf32>
  }
}

