module {
  func.func @fill(%arg0: f32, %arg1: memref<32x7xf32>) {
    linalg.fill ins(%arg0 : f32) outs(%arg1 : memref<32x7xf32>)
    return
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match interface{LinalgOp} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.structured.flatten_elementwise %0 : (!transform.any_op) -> !transform.any_op
      transform.yield 
    }
  }
}

// -----
module {
  func.func @fill_tensor(%arg0: f32, %arg1: tensor<32x7xf32>) -> tensor<32x7xf32> {
    %0 = linalg.fill ins(%arg0 : f32) outs(%arg1 : tensor<32x7xf32>) -> tensor<32x7xf32>
    return %0 : tensor<32x7xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match interface{LinalgOp} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.structured.flatten_elementwise %0 : (!transform.any_op) -> !transform.any_op
      transform.yield 
    }
  }
}

// -----
module {
  func.func @map(%arg0: memref<32x7xf32>, %arg1: memref<32x7xf32>, %arg2: memref<32x7xf32>) {
    linalg.map { arith.addf } ins(%arg0, %arg1 : memref<32x7xf32>, memref<32x7xf32>) outs(%arg2 : memref<32x7xf32>)
    return
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match interface{LinalgOp} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.structured.flatten_elementwise %0 : (!transform.any_op) -> !transform.any_op
      transform.yield 
    }
  }
}

// -----
module {
  func.func @map_already_flat(%arg0: memref<32xf32>, %arg1: memref<32xf32>, %arg2: memref<32xf32>) {
    linalg.map { arith.addf } ins(%arg0, %arg1 : memref<32xf32>, memref<32xf32>) outs(%arg2 : memref<32xf32>)
    return
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match interface{LinalgOp} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.structured.flatten_elementwise %0 : (!transform.any_op) -> !transform.any_op
      transform.yield 
    }
  }
}

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
module {
  func.func @generic(%arg0: memref<32x7xf32>, %arg1: memref<32x7xf32>, %arg2: memref<32x7xf32>) {
    linalg.generic {indexing_maps = [#map, #map, #map], iterator_types = ["parallel", "parallel"]} ins(%arg0, %arg1 : memref<32x7xf32>, memref<32x7xf32>) outs(%arg2 : memref<32x7xf32>) {
    ^bb0(%in: f32, %in_0: f32, %out: f32):
      %0 = arith.addf %in, %in_0 : f32
      linalg.yield %0 : f32
    }
    return
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match interface{LinalgOp} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.structured.flatten_elementwise %0 : (!transform.any_op) -> !transform.any_op
      transform.yield 
    }
  }
}

