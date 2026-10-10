module {
  func.func @matmul_split(%arg0: tensor<16x256xf32>, %arg1: tensor<256x32xf32>, %arg2: tensor<16x32xf32>) -> tensor<16x32xf32> {
    %0 = linalg.matmul ins(%arg0, %arg1 : tensor<16x256xf32>, tensor<256x32xf32>) outs(%arg2 : tensor<16x32xf32>) -> tensor<16x32xf32>
    return %0 : tensor<16x32xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.matmul"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %init_or_alloc_op, %fill_op, %split_linalg_op, %combining_linalg_op = transform.structured.split_reduction %0 {insert_split_dimension = 2 : i64, split_factor = 4 : i64} : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op, !transform.any_op)
      transform.yield 
    }
  }
}

// -----
#map = affine_map<(d0) -> (d0)>
#map1 = affine_map<(d0) -> ()>
module {
  func.func @generic_split_1d(%arg0: tensor<32xf32>, %arg1: tensor<f32>, %arg2: tensor<f32>) -> tensor<f32> {
    %0 = linalg.generic {indexing_maps = [#map, #map1, #map1], iterator_types = ["reduction"]} ins(%arg0, %arg1 : tensor<32xf32>, tensor<f32>) outs(%arg2 : tensor<f32>) {
    ^bb0(%in: f32, %in_0: f32, %out: f32):
      %1 = arith.subf %in, %in_0 : f32
      %2 = math.exp %1 : f32
      %3 = arith.mulf %2, %out : f32
      linalg.yield %3 : f32
    } -> tensor<f32>
    return %0 : tensor<f32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.generic"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %init_or_alloc_op, %fill_op, %split_linalg_op, %combining_linalg_op = transform.structured.split_reduction %0 {split_factor = 4 : i64} : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op, !transform.any_op)
      transform.yield 
    }
  }
}

// -----
#map = affine_map<(d0, d1, d2) -> (d1, d0)>
#map1 = affine_map<(d0, d1, d2) -> (d2, d1)>
#map2 = affine_map<(d0, d1, d2) -> (d2, d0)>
module {
  func.func @generic_split_3d(%arg0: tensor<32x2xf32>, %arg1: tensor<5x32xf32>, %arg2: tensor<5x2xf32>) -> tensor<5x2xf32> {
    %0 = linalg.generic {indexing_maps = [#map, #map1, #map2], iterator_types = ["parallel", "reduction", "parallel"]} ins(%arg0, %arg1 : tensor<32x2xf32>, tensor<5x32xf32>) outs(%arg2 : tensor<5x2xf32>) {
    ^bb0(%in: f32, %in_0: f32, %out: f32):
      %1 = arith.addf %in, %in_0 : f32
      %2 = arith.maximumf %1, %out : f32
      linalg.yield %2 : f32
    } -> tensor<5x2xf32>
    return %0 : tensor<5x2xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.generic"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %init_or_alloc_op, %fill_op, %split_linalg_op, %combining_linalg_op = transform.structured.split_reduction %0 {insert_split_dimension = 2 : i64, split_factor = 4 : i64} : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op, !transform.any_op)
      transform.yield 
    }
  }
}

// -----
#map = affine_map<(d0, d1, d2) -> (d1, d0)>
#map1 = affine_map<(d0, d1, d2) -> (d2, d1)>
#map2 = affine_map<(d0, d1, d2) -> (d2, d0)>
module {
  func.func @generic_split_3d_ninf(%arg0: tensor<32x2xf32>, %arg1: tensor<5x32xf32>, %arg2: tensor<5x2xf32>) -> tensor<5x2xf32> {
    %0 = linalg.generic {indexing_maps = [#map, #map1, #map2], iterator_types = ["parallel", "reduction", "parallel"]} ins(%arg0, %arg1 : tensor<32x2xf32>, tensor<5x32xf32>) outs(%arg2 : tensor<5x2xf32>) {
    ^bb0(%in: f32, %in_0: f32, %out: f32):
      %1 = arith.addf %in, %in_0 : f32
      %2 = arith.maximumf %1, %out fastmath<nnan,ninf> : f32
      linalg.yield %2 : f32
    } -> tensor<5x2xf32>
    return %0 : tensor<5x2xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.generic"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %init_or_alloc_op, %fill_op, %split_linalg_op, %combining_linalg_op = transform.structured.split_reduction %0 {insert_split_dimension = 2 : i64, split_factor = 4 : i64} : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op, !transform.any_op)
      transform.yield 
    }
  }
}

// -----
module {
  func.func @matmul_split(%arg0: tensor<16x256xf32>, %arg1: tensor<256x32xf32>, %arg2: tensor<16x32xf32>) -> tensor<16x32xf32> {
    %0 = linalg.matmul ins(%arg0, %arg1 : tensor<16x256xf32>, tensor<256x32xf32>) outs(%arg2 : tensor<16x32xf32>) -> tensor<16x32xf32>
    return %0 : tensor<16x32xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.matmul"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %init_or_alloc_op, %fill_op, %split_linalg_op, %combining_linalg_op = transform.structured.split_reduction %0 {inner_parallel, insert_split_dimension = 2 : i64, split_factor = 4 : i64} : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op, !transform.any_op)
      transform.yield 
    }
  }
}

// -----
#map = affine_map<(d0) -> (d0)>
#map1 = affine_map<(d0) -> ()>
module {
  func.func @generic_split_1d(%arg0: tensor<32xf32>, %arg1: tensor<f32>, %arg2: tensor<f32>) -> tensor<f32> {
    %0 = linalg.generic {indexing_maps = [#map, #map1, #map1], iterator_types = ["reduction"]} ins(%arg0, %arg1 : tensor<32xf32>, tensor<f32>) outs(%arg2 : tensor<f32>) {
    ^bb0(%in: f32, %in_0: f32, %out: f32):
      %1 = arith.subf %in, %in_0 : f32
      %2 = math.exp %1 : f32
      %3 = arith.mulf %2, %out : f32
      linalg.yield %3 : f32
    } -> tensor<f32>
    return %0 : tensor<f32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.generic"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %init_or_alloc_op, %fill_op, %split_linalg_op, %combining_linalg_op = transform.structured.split_reduction %0 {inner_parallel, split_factor = 4 : i64} : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op, !transform.any_op)
      transform.yield 
    }
  }
}

// -----
#map = affine_map<(d0, d1, d2) -> (d1, d0)>
#map1 = affine_map<(d0, d1, d2) -> (d2, d1)>
#map2 = affine_map<(d0, d1, d2) -> (d2, d0)>
module {
  func.func @generic_split_3d(%arg0: tensor<32x2xf32>, %arg1: tensor<5x32xf32>, %arg2: tensor<5x2xf32>) -> tensor<5x2xf32> {
    %0 = linalg.generic {indexing_maps = [#map, #map1, #map2], iterator_types = ["parallel", "reduction", "parallel"]} ins(%arg0, %arg1 : tensor<32x2xf32>, tensor<5x32xf32>) outs(%arg2 : tensor<5x2xf32>) {
    ^bb0(%in: f32, %in_0: f32, %out: f32):
      %1 = arith.addf %in, %in_0 : f32
      %2 = arith.minimumf %1, %out : f32
      linalg.yield %2 : f32
    } -> tensor<5x2xf32>
    return %0 : tensor<5x2xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.generic"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %init_or_alloc_op, %fill_op, %split_linalg_op, %combining_linalg_op = transform.structured.split_reduction %0 {inner_parallel, insert_split_dimension = 2 : i64, split_factor = 4 : i64} : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op, !transform.any_op)
      transform.yield 
    }
  }
}

// -----
#map = affine_map<(d0, d1, d2) -> (d1, d0)>
#map1 = affine_map<(d0, d1, d2) -> (d2, d1)>
#map2 = affine_map<(d0, d1, d2) -> (d2, d0)>
module {
  func.func @generic_split_3d(%arg0: tensor<32x2xf32>, %arg1: tensor<5x32xf32>, %arg2: tensor<5x2xf32>) -> tensor<5x2xf32> {
    %0 = linalg.generic {indexing_maps = [#map, #map1, #map2], iterator_types = ["parallel", "reduction", "parallel"]} ins(%arg0, %arg1 : tensor<32x2xf32>, tensor<5x32xf32>) outs(%arg2 : tensor<5x2xf32>) {
    ^bb0(%in: f32, %in_0: f32, %out: f32):
      %1 = arith.addf %in, %in_0 : f32
      %2 = arith.minimumf %1, %out fastmath<ninf> : f32
      linalg.yield %2 : f32
    } -> tensor<5x2xf32>
    return %0 : tensor<5x2xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.generic"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %init_or_alloc_op, %fill_op, %split_linalg_op, %combining_linalg_op = transform.structured.split_reduction %0 {inner_parallel, insert_split_dimension = 2 : i64, split_factor = 4 : i64} : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op, !transform.any_op)
      transform.yield 
    }
  }
}

// -----
#map = affine_map<(d0) -> (d0)>
#map1 = affine_map<(d0) -> ()>
module {
  func.func @generic_split_maxnumf(%arg0: tensor<32xf32>, %arg1: tensor<f32>) -> tensor<f32> {
    %0 = linalg.generic {indexing_maps = [#map, #map1], iterator_types = ["reduction"]} ins(%arg0 : tensor<32xf32>) outs(%arg1 : tensor<f32>) {
    ^bb0(%in: f32, %out: f32):
      %1 = arith.maxnumf %in, %out : f32
      linalg.yield %1 : f32
    } -> tensor<f32>
    return %0 : tensor<f32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.generic"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %init_or_alloc_op, %fill_op, %split_linalg_op, %combining_linalg_op = transform.structured.split_reduction %0 {inner_parallel, split_factor = 4 : i64} : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op, !transform.any_op)
      transform.yield 
    }
  }
}

// -----
#map = affine_map<(d0) -> (d0)>
#map1 = affine_map<(d0) -> ()>
module {
  func.func @generic_split_minnumf(%arg0: tensor<32xf32>, %arg1: tensor<f32>) -> tensor<f32> {
    %0 = linalg.generic {indexing_maps = [#map, #map1], iterator_types = ["reduction"]} ins(%arg0 : tensor<32xf32>) outs(%arg1 : tensor<f32>) {
    ^bb0(%in: f32, %out: f32):
      %1 = arith.minnumf %in, %out : f32
      linalg.yield %1 : f32
    } -> tensor<f32>
    return %0 : tensor<f32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.generic"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %init_or_alloc_op, %fill_op, %split_linalg_op, %combining_linalg_op = transform.structured.split_reduction %0 {inner_parallel, split_factor = 4 : i64} : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op, !transform.any_op)
      transform.yield 
    }
  }
}

