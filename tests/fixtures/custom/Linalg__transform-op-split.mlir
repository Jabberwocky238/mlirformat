#map = affine_map<(d0) -> (d0)>
module {
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.generic"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.structured.split %0 after 42  {dimension = 0 : i64} : !transform.any_op
      transform.yield 
    }
  }
  func.func private @elem(f32, index, index) -> f32
  func.func @one_d_static(%arg0: tensor<100xf32>, %arg1: tensor<100xf32>) -> tensor<100xf32> {
    %0 = linalg.generic {indexing_maps = [#map, #map], iterator_types = ["parallel"]} ins(%arg0 : tensor<100xf32>) outs(%arg1 : tensor<100xf32>) {
    ^bb0(%in: f32, %out: f32):
      %1 = linalg.index 0 : index
      %2 = func.call @elem(%in, %1, %1) : (f32, index, index) -> f32
      linalg.yield %2 : f32
    } -> tensor<100xf32>
    return %0 : tensor<100xf32>
  }
}

// -----
#map = affine_map<(d0) -> (d0)>
module {
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.generic"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.structured.split %0 after 42  {dimension = 0 : i64} : !transform.any_op
      transform.yield 
    }
  }
  func.func private @elem(f32, index, index) -> f32
  func.func @one_d_static_overflow(%arg0: tensor<10xf32>, %arg1: tensor<10xf32>) -> tensor<10xf32> {
    %0 = linalg.generic {indexing_maps = [#map, #map], iterator_types = ["parallel"]} ins(%arg0 : tensor<10xf32>) outs(%arg1 : tensor<10xf32>) {
    ^bb0(%in: f32, %out: f32):
      %1 = linalg.index 0 : index
      %2 = func.call @elem(%in, %1, %1) : (f32, index, index) -> f32
      linalg.yield %2 : f32
    } -> tensor<10xf32>
    return %0 : tensor<10xf32>
  }
}

// -----
#map = affine_map<(d0) -> (d0)>
module {
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.generic"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.structured.match ops{["func.call"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %2 = transform.structured.split %0 after %1  {dimension = 0 : i64} : !transform.any_op, !transform.any_op
      transform.yield 
    }
  }
  func.func private @get_size() -> index
  func.func @dynamic(%arg0: tensor<100xf32>, %arg1: tensor<100xf32>) -> tensor<100xf32> {
    %0 = call @get_size() : () -> index
    %1 = linalg.generic {indexing_maps = [#map, #map], iterator_types = ["parallel"]} ins(%arg0 : tensor<100xf32>) outs(%arg1 : tensor<100xf32>) {
    ^bb0(%in: f32, %out: f32):
      %2 = arith.addf %in, %out : f32
      linalg.yield %2 : f32
    } -> tensor<100xf32>
    return %1 : tensor<100xf32>
  }
}

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
module {
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.generic"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.structured.split %0 after 4  {dimension = 0 : i64} : !transform.any_op
      %2:2 = transform.split_handle %1 : (!transform.any_op) -> (!transform.any_op, !transform.any_op)
      %3 = transform.structured.split %2#1 after 16  {dimension = 1 : i64} : !transform.any_op
      transform.yield 
    }
  }
  func.func private @elem(f32, index, index) -> f32
  func.func @two_d(%arg0: tensor<10x34xf32>, %arg1: tensor<10x34xf32>) -> tensor<10x34xf32> {
    %0 = linalg.generic {indexing_maps = [#map, #map], iterator_types = ["parallel", "parallel"]} ins(%arg0 : tensor<10x34xf32>) outs(%arg1 : tensor<10x34xf32>) {
    ^bb0(%in: f32, %out: f32):
      %1 = linalg.index 0 : index
      %2 = linalg.index 1 : index
      %3 = func.call @elem(%in, %1, %2) : (f32, index, index) -> f32
      linalg.yield %3 : f32
    } -> tensor<10x34xf32>
    return %0 : tensor<10x34xf32>
  }
}

