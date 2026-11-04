module {
  func.func private @insert_slice_static_sizes(%arg0: tensor<?x3x?x1xi32>) -> tensor<5x3xi32> {
    %c2 = arith.constant 2 : index
    %0 = tensor.empty() : tensor<5x3xi32>
    %extracted_slice = tensor.extract_slice %arg0[0, %c2, 0, 0] [1, 1, 5, 1] [1, 1, 1, 1] : tensor<?x3x?x1xi32> to tensor<5x1xi32>
    %inserted_slice = tensor.insert_slice %extracted_slice into %0[0, %c2] [5, 1] [1, 1] : tensor<5x1xi32> into tensor<5x3xi32>
    return %inserted_slice : tensor<5x3xi32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["tensor.insert_slice"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.structured.vectorize %0 vector_sizes [8, 1] : !transform.any_op
      transform.yield 
    }
  }
}

// -----
module {
  func.func private @insert_slice_dynamic_src_dim(%arg0: tensor<?x3x?x1xi32>, %arg1: index) -> tensor<5x3xi32> {
    %c2 = arith.constant 2 : index
    %0 = tensor.empty() : tensor<5x3xi32>
    %extracted_slice = tensor.extract_slice %arg0[0, %c2, 0, 0] [1, 1, %arg1, 1] [1, 1, 1, 1] : tensor<?x3x?x1xi32> to tensor<?x1xi32>
    %inserted_slice = tensor.insert_slice %extracted_slice into %0[0, %c2] [%arg1, 1] [1, 1] : tensor<?x1xi32> into tensor<5x3xi32>
    return %inserted_slice : tensor<5x3xi32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["tensor.insert_slice"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.structured.vectorize %0 vector_sizes [8, 1] : !transform.any_op
      transform.yield 
    }
  }
}

// -----
module {
  func.func private @insert_slice_dynamic_dest_dim(%arg0: tensor<?x3x?x1xi32>, %arg1: index) -> tensor<?x3xi32> {
    %c2 = arith.constant 2 : index
    %0 = tensor.empty(%arg1) : tensor<?x3xi32>
    %extracted_slice = tensor.extract_slice %arg0[0, %c2, 0, 0] [1, 1, 5, 1] [1, 1, 1, 1] : tensor<?x3x?x1xi32> to tensor<5x1xi32>
    %inserted_slice = tensor.insert_slice %extracted_slice into %0[0, %c2] [5, 1] [1, 1] : tensor<5x1xi32> into tensor<?x3xi32>
    return %inserted_slice : tensor<?x3xi32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["tensor.insert_slice"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.structured.vectorize %0 vector_sizes [8, 1] : !transform.any_op
      transform.yield 
    }
  }
}

// -----
module {
  func.func private @insert_slice_dynamic_source_and_dest_dim(%arg0: tensor<?x3x?x1xi32>, %arg1: index) -> tensor<?x3xi32> {
    %c2 = arith.constant 2 : index
    %0 = tensor.empty(%arg1) : tensor<?x3xi32>
    %extracted_slice = tensor.extract_slice %arg0[0, %c2, 0, 0] [1, 1, %arg1, 1] [1, 1, 1, 1] : tensor<?x3x?x1xi32> to tensor<?x1xi32>
    %inserted_slice = tensor.insert_slice %extracted_slice into %0[0, %c2] [%arg1, 1] [1, 1] : tensor<?x1xi32> into tensor<?x3xi32>
    return %inserted_slice : tensor<?x3xi32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["tensor.insert_slice"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.structured.vectorize %0 vector_sizes [8, 1] : !transform.any_op
      transform.yield 
    }
  }
}

