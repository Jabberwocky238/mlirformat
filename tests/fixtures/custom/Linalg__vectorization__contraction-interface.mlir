module {
  func.func @matmul(%arg0: tensor<8x4xf32>, %arg1: tensor<4x16xf32>, %arg2: tensor<8x16xf32>) -> tensor<8x16xf32> {
    %0 = linalg.matmul ins(%arg0, %arg1 : tensor<8x4xf32>, tensor<4x16xf32>) outs(%arg2 : tensor<8x16xf32>) -> tensor<8x16xf32>
    return %0 : tensor<8x16xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.matmul"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.structured.vectorize %0 {create_named_contraction} : !transform.any_op
      transform.yield 
    }
  }
}

// -----
module {
  func.func @matmul_dynamic(%arg0: tensor<?x?xf32>, %arg1: tensor<?x?xf32>, %arg2: tensor<?x?xf32>) -> tensor<?x?xf32> {
    %0 = linalg.matmul ins(%arg0, %arg1 : tensor<?x?xf32>, tensor<?x?xf32>) outs(%arg2 : tensor<?x?xf32>) -> tensor<?x?xf32>
    return %0 : tensor<?x?xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.matmul"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.structured.vectorize %0 vector_sizes [8, 16, 4] {create_named_contraction} : !transform.any_op
      transform.yield 
    }
  }
}

// -----
module {
  func.func @matmul_dynamic_memref(%arg0: memref<?x?xf32>, %arg1: memref<?x?xf32>, %arg2: memref<?x?xf32>) {
    linalg.matmul ins(%arg0, %arg1 : memref<?x?xf32>, memref<?x?xf32>) outs(%arg2 : memref<?x?xf32>)
    return
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.matmul"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.structured.vectorize %0 vector_sizes [8, 16, 4] {create_named_contraction} : !transform.any_op
      transform.yield 
    }
  }
}

// -----
module {
  func.func @matmul_dynamic_scalable(%arg0: tensor<?x?xf32>, %arg1: tensor<?x?xf32>, %arg2: tensor<?x?xf32>) -> tensor<?x?xf32> {
    %0 = linalg.matmul ins(%arg0, %arg1 : tensor<?x?xf32>, tensor<?x?xf32>) outs(%arg2 : tensor<?x?xf32>) -> tensor<?x?xf32>
    return %0 : tensor<?x?xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.matmul"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.structured.vectorize %0 vector_sizes [8, [16], 4] {create_named_contraction} : !transform.any_op
      transform.yield 
    }
  }
}

// -----
#map = affine_map<(d0, d1, d2) -> (d2, d0)>
#map1 = affine_map<(d0, d1, d2) -> (d1, d2)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1)>
module {
  func.func @matmul_transpose(%arg0: tensor<4x8xf32>, %arg1: tensor<16x4xf32>, %arg2: tensor<8x16xf32>) -> tensor<8x16xf32> {
    %0 = linalg.matmul indexing_maps = [#map, #map1, #map2] ins(%arg0, %arg1 : tensor<4x8xf32>, tensor<16x4xf32>) outs(%arg2 : tensor<8x16xf32>) -> tensor<8x16xf32>
    return %0 : tensor<8x16xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.matmul"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.structured.vectorize %0 {create_named_contraction} : !transform.any_op
      transform.yield 
    }
  }
}

// -----
#map = affine_map<(d0, d1, d2) -> (d2, d0)>
#map1 = affine_map<(d0, d1, d2) -> (d1, d2)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1)>
module {
  func.func @matmul_dynamic_transpose(%arg0: tensor<?x?xf32>, %arg1: tensor<?x?xf32>, %arg2: tensor<?x?xf32>) -> tensor<?x?xf32> {
    %0 = linalg.matmul indexing_maps = [#map, #map1, #map2] ins(%arg0, %arg1 : tensor<?x?xf32>, tensor<?x?xf32>) outs(%arg2 : tensor<?x?xf32>) -> tensor<?x?xf32>
    return %0 : tensor<?x?xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.matmul"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.structured.vectorize %0 vector_sizes [8, 16, 4] {create_named_contraction} : !transform.any_op
      transform.yield 
    }
  }
}

// -----
module {
  func.func @matmul_mixed_precision(%arg0: tensor<8x4xf16>, %arg1: tensor<4x16xf16>, %arg2: tensor<8x16xf32>) -> tensor<8x16xf32> {
    %0 = linalg.matmul ins(%arg0, %arg1 : tensor<8x4xf16>, tensor<4x16xf16>) outs(%arg2 : tensor<8x16xf32>) -> tensor<8x16xf32>
    return %0 : tensor<8x16xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.matmul"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.structured.vectorize %0 {create_named_contraction} : !transform.any_op
      transform.yield 
    }
  }
}

// -----
module {
  func.func @batch_matmul(%arg0: tensor<3x8x4xf32>, %arg1: tensor<3x4x16xf32>, %arg2: tensor<3x8x16xf32>) -> tensor<3x8x16xf32> {
    %0 = linalg.batch_matmul ins(%arg0, %arg1 : tensor<3x8x4xf32>, tensor<3x4x16xf32>) outs(%arg2 : tensor<3x8x16xf32>) -> tensor<3x8x16xf32>
    return %0 : tensor<3x8x16xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.batch_matmul"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.structured.vectorize %0 {create_named_contraction} : !transform.any_op
      transform.yield 
    }
  }
}

// -----
module {
  func.func @batch_reduce_matmul(%arg0: tensor<3x8x4xf32>, %arg1: tensor<3x4x16xf32>, %arg2: tensor<8x16xf32>) -> tensor<8x16xf32> {
    %0 = linalg.batch_reduce_matmul ins(%arg0, %arg1 : tensor<3x8x4xf32>, tensor<3x4x16xf32>) outs(%arg2 : tensor<8x16xf32>) -> tensor<8x16xf32>
    return %0 : tensor<8x16xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.batch_reduce_matmul"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.structured.vectorize %0 {create_named_contraction} : !transform.any_op
      transform.yield 
    }
  }
}

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d0, d2, d3)>
#map1 = affine_map<(d0, d1, d2, d3) -> (d2, d1, d3)>
#map2 = affine_map<(d0, d1, d2, d3) -> (d0, d1)>
module {
  func.func @contract(%arg0: tensor<4x8x2xf32>, %arg1: tensor<8x16x2xf32>, %arg2: tensor<4x16xf32>) -> tensor<4x16xf32> {
    %0 = linalg.contract indexing_maps = [#map, #map1, #map2] ins(%arg0, %arg1 : tensor<4x8x2xf32>, tensor<8x16x2xf32>) outs(%arg2 : tensor<4x16xf32>) -> tensor<4x16xf32>
    return %0 : tensor<4x16xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.contract"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.structured.vectorize %0 {create_named_contraction} : !transform.any_op
      transform.yield 
    }
  }
}

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d2, d1)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1)>
module {
  func.func @negative_generic(%arg0: tensor<8x4xf32>, %arg1: tensor<4x16xf32>, %arg2: tensor<8x16xf32>) -> tensor<8x16xf32> {
    %0 = linalg.generic {indexing_maps = [#map, #map1, #map2], iterator_types = ["parallel", "parallel", "reduction"]} ins(%arg0, %arg1 : tensor<8x4xf32>, tensor<4x16xf32>) outs(%arg2 : tensor<8x16xf32>) {
    ^bb0(%in: f32, %in_0: f32, %out: f32):
      %1 = arith.mulf %in, %in_0 : f32
      %2 = arith.addf %out, %1 : f32
      linalg.yield %2 : f32
    } -> tensor<8x16xf32>
    return %0 : tensor<8x16xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.generic"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.structured.vectorize %0 {create_named_contraction} : !transform.any_op
      transform.yield 
    }
  }
}

