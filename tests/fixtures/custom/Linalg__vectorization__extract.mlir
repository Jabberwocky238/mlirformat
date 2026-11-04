#map = affine_map<(d0, d1) -> (d0, d1)>
#map1 = affine_map<(d0, d1) -> (d0 + d1)>
module {
  func.func @masked_static_vectorize_nd_tensor_extract_with_affine_apply_contiguous(%arg0: tensor<80x16xf32>, %arg1: tensor<1x3xf32>, %arg2: index) -> tensor<1x3xf32> {
    %c79 = arith.constant 79 : index
    %0 = linalg.generic {indexing_maps = [#map], iterator_types = ["parallel", "parallel"]} outs(%arg1 : tensor<1x3xf32>) {
    ^bb0(%out: f32):
      %1 = linalg.index 1 : index
      %2 = affine.apply #map1(%1, %arg2)
      %extracted = tensor.extract %arg0[%c79, %2] : tensor<80x16xf32>
      linalg.yield %extracted : f32
    } -> tensor<1x3xf32>
    return %0 : tensor<1x3xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.generic"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.structured.vectorize %0 vector_sizes [1, 4] {vectorize_nd_extract} : !transform.any_op
      transform.yield 
    }
  }
}

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
#map1 = affine_map<(d0, d1) -> (d0 + d1)>
module {
  func.func @masked_static_vectorize_nd_tensor_extract_with_affine_apply_contiguous_scalable(%arg0: tensor<80x16xf32>, %arg1: tensor<1x3xf32>, %arg2: index) -> tensor<1x3xf32> {
    %c79 = arith.constant 79 : index
    %0 = linalg.generic {indexing_maps = [#map], iterator_types = ["parallel", "parallel"]} outs(%arg1 : tensor<1x3xf32>) {
    ^bb0(%out: f32):
      %1 = linalg.index 1 : index
      %2 = affine.apply #map1(%1, %arg2)
      %extracted = tensor.extract %arg0[%c79, %2] : tensor<80x16xf32>
      linalg.yield %extracted : f32
    } -> tensor<1x3xf32>
    return %0 : tensor<1x3xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.generic"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.structured.vectorize %0 vector_sizes [1, [4]] {vectorize_nd_extract} : !transform.any_op
      transform.yield 
    }
  }
}

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
#map1 = affine_map<(d0, d1) -> (d0 + d1)>
module {
  func.func @masked_dynamic_vectorize_nd_tensor_extract_with_affine_apply_contiguous(%arg0: tensor<?x?xf32>, %arg1: tensor<?x?xf32>, %arg2: index) -> tensor<?x?xf32> {
    %c79 = arith.constant 79 : index
    %0 = linalg.generic {indexing_maps = [#map], iterator_types = ["parallel", "parallel"]} outs(%arg1 : tensor<?x?xf32>) {
    ^bb0(%out: f32):
      %1 = linalg.index 1 : index
      %2 = affine.apply #map1(%1, %arg2)
      %extracted = tensor.extract %arg0[%c79, %2] : tensor<?x?xf32>
      linalg.yield %extracted : f32
    } -> tensor<?x?xf32>
    return %0 : tensor<?x?xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.generic"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.structured.vectorize %0 vector_sizes [1, 4] {vectorize_nd_extract} : !transform.any_op
      transform.yield 
    }
  }
}

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
#map1 = affine_map<(d0, d1) -> (d0 + d1)>
module {
  func.func @masked_dynamic_vectorize_nd_tensor_extract_with_affine_apply_contiguous_scalable(%arg0: tensor<?x?xf32>, %arg1: tensor<?x?xf32>, %arg2: index) -> tensor<?x?xf32> {
    %c79 = arith.constant 79 : index
    %0 = linalg.generic {indexing_maps = [#map], iterator_types = ["parallel", "parallel"]} outs(%arg1 : tensor<?x?xf32>) {
    ^bb0(%out: f32):
      %1 = linalg.index 1 : index
      %2 = affine.apply #map1(%1, %arg2)
      %extracted = tensor.extract %arg0[%c79, %2] : tensor<?x?xf32>
      linalg.yield %extracted : f32
    } -> tensor<?x?xf32>
    return %0 : tensor<?x?xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.generic"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.structured.vectorize %0 vector_sizes [1, [4]] {vectorize_nd_extract} : !transform.any_op
      transform.yield 
    }
  }
}

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
#map1 = affine_map<(d0, d1) -> (d0 + d1)>
module {
  func.func @masked_vectorize_nd_tensor_extract_with_affine_apply_gather(%arg0: tensor<80x16xf32>, %arg1: index, %arg2: tensor<1x3xf32>) -> tensor<1x3xf32> {
    %c16 = arith.constant 16 : index
    %0 = linalg.generic {indexing_maps = [#map], iterator_types = ["parallel", "parallel"]} outs(%arg2 : tensor<1x3xf32>) {
    ^bb0(%out: f32):
      %1 = linalg.index 1 : index
      %2 = affine.apply #map1(%1, %arg1)
      %extracted = tensor.extract %arg0[%2, %c16] : tensor<80x16xf32>
      linalg.yield %extracted : f32
    } -> tensor<1x3xf32>
    return %0 : tensor<1x3xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.generic"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.structured.vectorize %0 vector_sizes [1, 4] {vectorize_nd_extract} : !transform.any_op
      transform.yield 
    }
  }
}

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
#map1 = affine_map<(d0, d1) -> (d0 + d1)>
module {
  func.func @masked_dynamic_vectorize_nd_tensor_extract_with_affine_apply_gather(%arg0: tensor<?x?xf32>, %arg1: index, %arg2: tensor<?x?xf32>) -> tensor<?x?xf32> {
    %c16 = arith.constant 16 : index
    %0 = linalg.generic {indexing_maps = [#map], iterator_types = ["parallel", "parallel"]} outs(%arg2 : tensor<?x?xf32>) {
    ^bb0(%out: f32):
      %1 = linalg.index 1 : index
      %2 = affine.apply #map1(%1, %arg1)
      %extracted = tensor.extract %arg0[%2, %c16] : tensor<?x?xf32>
      linalg.yield %extracted : f32
    } -> tensor<?x?xf32>
    return %0 : tensor<?x?xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.generic"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.structured.vectorize %0 vector_sizes [1, 4] {vectorize_nd_extract} : !transform.any_op
      transform.yield 
    }
  }
}

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
module {
  func.func @extract_masked_vectorize(%arg0: tensor<?x?xf32>, %arg1: tensor<?x?xf32>) -> tensor<?x?xf32> {
    %c1 = arith.constant 1 : index
    %c2 = arith.constant 2 : index
    %0 = linalg.generic {indexing_maps = [#map], iterator_types = ["parallel", "parallel"]} outs(%arg1 : tensor<?x?xf32>) {
    ^bb0(%out: f32):
      %extracted = tensor.extract %arg0[%c1, %c2] : tensor<?x?xf32>
      linalg.yield %extracted : f32
    } -> tensor<?x?xf32>
    return %0 : tensor<?x?xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.generic"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.structured.vectorize %0 vector_sizes [3, 3] {vectorize_nd_extract} : !transform.any_op
      transform.yield 
    }
  }
}

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d1, d2)>
module {
  func.func @tensor_extract_dynamic_shape(%arg0: tensor<123x321xf32>, %arg1: tensor<1x?x8xf32>) -> tensor<1x?x8xf32> {
    %c1 = arith.constant 1 : index
    %c2 = arith.constant 2 : index
    %0 = linalg.generic {indexing_maps = [#map], iterator_types = ["parallel", "parallel", "parallel"]} outs(%arg1 : tensor<1x?x8xf32>) {
    ^bb0(%out: f32):
      %1 = linalg.index 0 : index
      %2 = linalg.index 1 : index
      %3 = arith.addi %1, %2 : index
      %extracted = tensor.extract %arg0[%c1, %3] : tensor<123x321xf32>
      linalg.yield %extracted : f32
    } -> tensor<1x?x8xf32>
    return %0 : tensor<1x?x8xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.generic"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.structured.vectorize %0 vector_sizes [1, 3, 8] {vectorize_nd_extract} : !transform.any_op
      transform.yield 
    }
  }
}

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d1, d2)>
module {
  func.func @scalar_broadcast(%arg0: tensor<1x1x3xi32>, %arg1: tensor<1x3x2x4xi32>, %arg2: index) -> tensor<1x1x3xi32> {
    %c0 = arith.constant 0 : index
    %0 = linalg.generic {indexing_maps = [#map], iterator_types = ["parallel", "parallel", "parallel"]} outs(%arg0 : tensor<1x1x3xi32>) {
    ^bb0(%out: i32):
      %extracted = tensor.extract %arg1[%arg2, %arg2, %arg2, %arg2] : tensor<1x3x2x4xi32>
      linalg.yield %extracted : i32
    } -> tensor<1x1x3xi32>
    return %0 : tensor<1x1x3xi32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.generic"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.structured.vectorize %0 vector_sizes [1, 1, 4] {vectorize_nd_extract} : !transform.any_op
      transform.yield 
    }
  }
}

