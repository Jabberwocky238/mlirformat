#map = affine_map<(d0, d1, d2) -> (d0, d1, d2)>
module {
  func.func @specialize_exp(%arg0: tensor<?x?x?xf32>, %arg1: tensor<?x?x?xf32>) -> tensor<?x?x?xf32> {
    %0 = linalg.generic {indexing_maps = [#map, #map], iterator_types = ["parallel", "parallel", "parallel"]} ins(%arg0 : tensor<?x?x?xf32>) outs(%arg1 : tensor<?x?x?xf32>) {
    ^bb0(%in: f32, %out: f32):
      %13 = math.exp %in : f32
      linalg.yield %13 : f32
    } -> tensor<?x?x?xf32>
    %1 = linalg.generic {indexing_maps = [#map, #map], iterator_types = ["parallel", "parallel", "parallel"]} ins(%0 : tensor<?x?x?xf32>) outs(%arg1 : tensor<?x?x?xf32>) {
    ^bb0(%in: f32, %out: f32):
      %13 = math.log %in : f32
      linalg.yield %13 : f32
    } -> tensor<?x?x?xf32>
    %2 = linalg.generic {indexing_maps = [#map, #map], iterator_types = ["parallel", "parallel", "parallel"]} ins(%1 : tensor<?x?x?xf32>) outs(%arg1 : tensor<?x?x?xf32>) {
    ^bb0(%in: f32, %out: f32):
      %13 = math.absf %in : f32
      linalg.yield %13 : f32
    } -> tensor<?x?x?xf32>
    %3 = linalg.generic {indexing_maps = [#map, #map], iterator_types = ["parallel", "parallel", "parallel"]} ins(%2 : tensor<?x?x?xf32>) outs(%arg1 : tensor<?x?x?xf32>) {
    ^bb0(%in: f32, %out: f32):
      %13 = math.ceil %in : f32
      linalg.yield %13 : f32
    } -> tensor<?x?x?xf32>
    %4 = linalg.generic {indexing_maps = [#map, #map], iterator_types = ["parallel", "parallel", "parallel"]} ins(%3 : tensor<?x?x?xf32>) outs(%arg1 : tensor<?x?x?xf32>) {
    ^bb0(%in: f32, %out: f32):
      %13 = math.floor %in : f32
      linalg.yield %13 : f32
    } -> tensor<?x?x?xf32>
    %5 = linalg.generic {indexing_maps = [#map, #map], iterator_types = ["parallel", "parallel", "parallel"]} ins(%4 : tensor<?x?x?xf32>) outs(%arg1 : tensor<?x?x?xf32>) {
    ^bb0(%in: f32, %out: f32):
      %13 = arith.negf %in : f32
      linalg.yield %13 : f32
    } -> tensor<?x?x?xf32>
    %cst = arith.constant 1.000000e+00 : f32
    %6 = linalg.generic {indexing_maps = [#map, #map], iterator_types = ["parallel", "parallel", "parallel"]} ins(%5 : tensor<?x?x?xf32>) outs(%arg1 : tensor<?x?x?xf32>) {
    ^bb0(%in: f32, %out: f32):
      %13 = arith.divf %cst, %in : f32
      linalg.yield %13 : f32
    } -> tensor<?x?x?xf32>
    %7 = linalg.generic {indexing_maps = [#map, #map], iterator_types = ["parallel", "parallel", "parallel"]} ins(%6 : tensor<?x?x?xf32>) outs(%arg1 : tensor<?x?x?xf32>) {
    ^bb0(%in: f32, %out: f32):
      %13 = math.round %in : f32
      linalg.yield %13 : f32
    } -> tensor<?x?x?xf32>
    %8 = linalg.generic {indexing_maps = [#map, #map], iterator_types = ["parallel", "parallel", "parallel"]} ins(%7 : tensor<?x?x?xf32>) outs(%arg1 : tensor<?x?x?xf32>) {
    ^bb0(%in: f32, %out: f32):
      %13 = math.sqrt %in : f32
      linalg.yield %13 : f32
    } -> tensor<?x?x?xf32>
    %9 = linalg.generic {indexing_maps = [#map, #map], iterator_types = ["parallel", "parallel", "parallel"]} ins(%8 : tensor<?x?x?xf32>) outs(%arg1 : tensor<?x?x?xf32>) {
    ^bb0(%in: f32, %out: f32):
      %13 = math.rsqrt %in : f32
      linalg.yield %13 : f32
    } -> tensor<?x?x?xf32>
    %10 = linalg.generic {indexing_maps = [#map, #map], iterator_types = ["parallel", "parallel", "parallel"]} ins(%9 : tensor<?x?x?xf32>) outs(%arg1 : tensor<?x?x?xf32>) {
    ^bb0(%in: f32, %out: f32):
      %13 = arith.mulf %in, %in : f32
      linalg.yield %13 : f32
    } -> tensor<?x?x?xf32>
    %11 = linalg.generic {indexing_maps = [#map, #map], iterator_types = ["parallel", "parallel", "parallel"]} ins(%10 : tensor<?x?x?xf32>) outs(%arg1 : tensor<?x?x?xf32>) {
    ^bb0(%in: f32, %out: f32):
      %13 = math.tanh %in : f32
      linalg.yield %13 : f32
    } -> tensor<?x?x?xf32>
    %12 = linalg.generic {indexing_maps = [#map, #map], iterator_types = ["parallel", "parallel", "parallel"]} ins(%11 : tensor<?x?x?xf32>) outs(%arg1 : tensor<?x?x?xf32>) {
    ^bb0(%in: f32, %out: f32):
      %13 = math.erf %in : f32
      linalg.yield %13 : f32
    } -> tensor<?x?x?xf32>
    return %12 : tensor<?x?x?xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match interface{LinalgOp} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.structured.specialize %0 : (!transform.any_op) -> !transform.any_op
      transform.yield 
    }
  }
}

