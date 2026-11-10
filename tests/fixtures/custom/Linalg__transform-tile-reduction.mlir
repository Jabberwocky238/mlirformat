#map = affine_map<(d0, d1) -> (d0, d1)>
#map1 = affine_map<(d0, d1) -> (d0)>
module {
  func.func @reduction_tile(%arg0: tensor<?x?xf32>, %arg1: tensor<?xf32>) -> tensor<?xf32> {
    %0 = linalg.generic {indexing_maps = [#map, #map1], iterator_types = ["parallel", "reduction"]} ins(%arg0 : tensor<?x?xf32>) outs(%arg1 : tensor<?xf32>) {
    ^bb0(%in: f32, %out: f32):
      %1 = arith.mulf %in, %in : f32
      %2 = arith.addf %1, %out : f32
      linalg.yield %2 : f32
    } -> tensor<?xf32>
    return %0 : tensor<?xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.generic"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %fill_op, %split_op, %combining_op, %for_op = transform.structured.tile_reduction_using_for %0 by tile_sizes = [0, 5] : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op, !transform.any_op)
      transform.yield 
    }
  }
}

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
#map1 = affine_map<(d0, d1) -> (d1)>
module {
  func.func @reduction_tile_transpose(%arg0: tensor<?x?xf32>, %arg1: tensor<?xf32>) -> tensor<?xf32> {
    %0 = linalg.generic {indexing_maps = [#map, #map1], iterator_types = ["reduction", "parallel"]} ins(%arg0 : tensor<?x?xf32>) outs(%arg1 : tensor<?xf32>) {
    ^bb0(%in: f32, %out: f32):
      %1 = arith.addf %in, %out : f32
      linalg.yield %1 : f32
    } -> tensor<?xf32>
    return %0 : tensor<?xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.generic"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %fill_op, %split_op, %combining_op, %for_op = transform.structured.tile_reduction_using_for %0 by tile_sizes = [5, 0] : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op, !transform.any_op)
      transform.yield 
    }
  }
}

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
#map1 = affine_map<(d0, d1) -> (d0)>
module {
  func.func @reduction_tile_parallel(%arg0: tensor<?x?xf32>, %arg1: tensor<?xf32>) -> tensor<?xf32> {
    %0 = linalg.generic {indexing_maps = [#map, #map1], iterator_types = ["parallel", "reduction"]} ins(%arg0 : tensor<?x?xf32>) outs(%arg1 : tensor<?xf32>) {
    ^bb0(%in: f32, %out: f32):
      %1 = arith.mulf %in, %in : f32
      %2 = arith.addf %1, %out : f32
      linalg.yield %2 : f32
    } -> tensor<?xf32>
    return %0 : tensor<?xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.generic"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %fill_op, %split_op, %combining_op, %forall_op = transform.structured.tile_reduction_using_forall %0 by num_threads = [0, 5] : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op, !transform.any_op)
      transform.yield 
    }
  }
}

// -----
module {
  func.func @matmul_tile_parallel(%arg0: tensor<?x?xf32>, %arg1: tensor<?x?xf32>, %arg2: tensor<?x?xf32>) -> tensor<?x?xf32> {
    %0 = linalg.matmul ins(%arg0, %arg1 : tensor<?x?xf32>, tensor<?x?xf32>) outs(%arg2 : tensor<?x?xf32>) -> tensor<?x?xf32>
    return %0 : tensor<?x?xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.matmul"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %fill_op, %split_op, %combining_op, %forall_op = transform.structured.tile_reduction_using_forall %0 by num_threads = [0, 0, 5] : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op, !transform.any_op)
      transform.yield 
    }
  }
}

// -----
#map = affine_map<(d0, d1, d2) -> (d1, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d0, d1, d2)>
#map2 = affine_map<(d0, d1, d2) -> (d0)>
module {
  func.func @reduction_tile_multiple_reduction(%arg0: tensor<86x128xf32>, %arg1: tensor<4096x86x128xf32>, %arg2: tensor<4096xf32>) -> tensor<4096xf32> {
    %0 = linalg.generic {indexing_maps = [#map, #map1, #map2], iterator_types = ["parallel", "reduction", "reduction"]} ins(%arg0, %arg1 : tensor<86x128xf32>, tensor<4096x86x128xf32>) outs(%arg2 : tensor<4096xf32>) {
    ^bb0(%in: f32, %in_0: f32, %out: f32):
      %1 = arith.mulf %in, %in_0 : f32
      %2 = arith.addf %1, %out : f32
      linalg.yield %2 : f32
    } -> tensor<4096xf32>
    return %0 : tensor<4096xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.generic"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %fill_op, %split_op, %combining_op, %for_op = transform.structured.tile_reduction_using_for %0 by tile_sizes = [0, 2, 64] : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op, !transform.any_op)
      transform.yield 
    }
  }
}

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
#map1 = affine_map<(d0, d1) -> (d0)>
module {
  func.func @reduction_tile_multiple_results(%arg0: tensor<?x?xf32>, %arg1: tensor<?xf32>, %arg2: tensor<?xf32>) -> (tensor<?xf32>, tensor<?xf32>) {
    %0:2 = linalg.generic {indexing_maps = [#map, #map1, #map1], iterator_types = ["parallel", "reduction"]} ins(%arg0 : tensor<?x?xf32>) outs(%arg1, %arg2 : tensor<?xf32>, tensor<?xf32>) {
    ^bb0(%in: f32, %out: f32, %out_0: f32):
      %1 = arith.mulf %in, %in : f32
      %2 = arith.addf %1, %out : f32
      %3 = arith.maximumf %1, %out_0 : f32
      linalg.yield %2, %3 : f32, f32
    } -> (tensor<?xf32>, tensor<?xf32>)
    return %0#0, %0#1 : tensor<?xf32>, tensor<?xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.generic"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %fill_op:3, %split_op, %combining_op, %for_op = transform.structured.tile_reduction_using_for %0 by tile_sizes = [0, 5] : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op, !transform.any_op, !transform.any_op, !transform.any_op)
      transform.yield 
    }
  }
}

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d1, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d2, d0)>
module {
  func.func @reduction_tile_multi_dim_transpose(%arg0: tensor<?x?x?xf32>, %arg1: tensor<?x?xf32>) -> tensor<?x?xf32> {
    %0 = linalg.generic {indexing_maps = [#map, #map1], iterator_types = ["parallel", "reduction", "parallel"]} ins(%arg0 : tensor<?x?x?xf32>) outs(%arg1 : tensor<?x?xf32>) {
    ^bb0(%in: f32, %out: f32):
      %1 = arith.addf %in, %out : f32
      linalg.yield %1 : f32
    } -> tensor<?x?xf32>
    return %0 : tensor<?x?xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.generic"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %fill_op, %split_op, %combining_op, %for_op = transform.structured.tile_reduction_using_for %0 by tile_sizes = [0, 5, 0] : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op, !transform.any_op)
      transform.yield 
    }
  }
}

// -----
#map = affine_map<(d0, d1, d2) -> (d1, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d0, d1, d2)>
#map2 = affine_map<(d0, d1, d2) -> (d0)>
module {
  func.func @reduction_tile_single_of_multiple_reduction_outer(%arg0: tensor<86x128xf32>, %arg1: tensor<4096x86x128xf32>, %arg2: tensor<4096xf32>) -> tensor<4096xf32> {
    %0 = linalg.generic {indexing_maps = [#map, #map1, #map2], iterator_types = ["parallel", "reduction", "reduction"]} ins(%arg0, %arg1 : tensor<86x128xf32>, tensor<4096x86x128xf32>) outs(%arg2 : tensor<4096xf32>) {
    ^bb0(%in: f32, %in_0: f32, %out: f32):
      %1 = arith.mulf %in, %in_0 : f32
      %2 = arith.addf %1, %out : f32
      linalg.yield %2 : f32
    } -> tensor<4096xf32>
    return %0 : tensor<4096xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.generic"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %fill_op, %split_op, %combining_op, %for_op = transform.structured.tile_reduction_using_for %0 reduction_dims = [1] by tile_sizes = [0, 2] : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op, !transform.any_op)
      transform.yield 
    }
  }
}

// -----
#map = affine_map<(d0, d1, d2) -> (d1, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d0, d1, d2)>
#map2 = affine_map<(d0, d1, d2) -> (d0)>
module {
  func.func @reduction_tile_single_of_multiple_reduction_inner(%arg0: tensor<86x128xf32>, %arg1: tensor<4096x86x128xf32>, %arg2: tensor<4096xf32>) -> tensor<4096xf32> {
    %0 = linalg.generic {indexing_maps = [#map, #map1, #map2], iterator_types = ["parallel", "reduction", "reduction"]} ins(%arg0, %arg1 : tensor<86x128xf32>, tensor<4096x86x128xf32>) outs(%arg2 : tensor<4096xf32>) {
    ^bb0(%in: f32, %in_0: f32, %out: f32):
      %1 = arith.mulf %in, %in_0 : f32
      %2 = arith.addf %1, %out : f32
      linalg.yield %2 : f32
    } -> tensor<4096xf32>
    return %0 : tensor<4096xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.generic"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %fill_op, %split_op, %combining_op, %for_op = transform.structured.tile_reduction_using_for %0 reduction_dims = [2] by tile_sizes = [0, 0, 64] : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op, !transform.any_op)
      transform.yield 
    }
  }
}

// -----
#map = affine_map<(d0, d1, d2) -> (d1, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d0, d1, d2)>
#map2 = affine_map<(d0, d1, d2) -> (d0)>
module {
  func.func @reduction_tile_single_of_multiple_reduction_reversed(%arg0: tensor<86x128xf32>, %arg1: tensor<4096x86x128xf32>, %arg2: tensor<4096xf32>) -> tensor<4096xf32> {
    %0 = linalg.generic {indexing_maps = [#map, #map1, #map2], iterator_types = ["parallel", "reduction", "reduction"]} ins(%arg0, %arg1 : tensor<86x128xf32>, tensor<4096x86x128xf32>) outs(%arg2 : tensor<4096xf32>) {
    ^bb0(%in: f32, %in_0: f32, %out: f32):
      %1 = arith.mulf %in, %in_0 : f32
      %2 = arith.addf %1, %out : f32
      linalg.yield %2 : f32
    } -> tensor<4096xf32>
    return %0 : tensor<4096xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.generic"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %fill_op, %split_op, %combining_op, %for_op = transform.structured.tile_reduction_using_for %0 reduction_dims = [2, 1] by tile_sizes = [0, 2, 64] : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op, !transform.any_op)
      transform.yield 
    }
  }
}

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
#map1 = affine_map<(d0, d1) -> (d0)>
module {
  func.func @reduction_tile_parallel_using_tile_sizes(%arg0: tensor<?x?xf32>, %arg1: tensor<?xf32>) -> tensor<?xf32> {
    %0 = linalg.generic {indexing_maps = [#map, #map1], iterator_types = ["parallel", "reduction"]} ins(%arg0 : tensor<?x?xf32>) outs(%arg1 : tensor<?xf32>) {
    ^bb0(%in: f32, %out: f32):
      %1 = arith.mulf %in, %in : f32
      %2 = arith.addf %1, %out : f32
      linalg.yield %2 : f32
    } -> tensor<?xf32>
    return %0 : tensor<?xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.generic"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %fill_op, %split_op, %combining_op, %forall_op = transform.structured.tile_reduction_using_forall %0 by tile_sizes = [0, 5] : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op, !transform.any_op)
      transform.yield 
    }
  }
}

// -----
#map = affine_map<(d0, d1, d2) -> (d1, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d0, d1, d2)>
#map2 = affine_map<(d0, d1, d2) -> (d0)>
module {
  func.func @reduction_using_forall_tile_single_of_multiple_reduction_inner(%arg0: tensor<86x128xf32>, %arg1: tensor<4096x86x128xf32>, %arg2: tensor<4096xf32>) -> tensor<4096xf32> {
    %0 = linalg.generic {indexing_maps = [#map, #map1, #map2], iterator_types = ["parallel", "reduction", "reduction"]} ins(%arg0, %arg1 : tensor<86x128xf32>, tensor<4096x86x128xf32>) outs(%arg2 : tensor<4096xf32>) {
    ^bb0(%in: f32, %in_0: f32, %out: f32):
      %1 = arith.mulf %in, %in_0 : f32
      %2 = arith.addf %1, %out : f32
      linalg.yield %2 : f32
    } -> tensor<4096xf32>
    return %0 : tensor<4096xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.generic"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %fill_op, %split_op, %combining_op, %forall_op = transform.structured.tile_reduction_using_forall %0 reduction_dims = [2] by tile_sizes = [0, 0, 64] : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op, !transform.any_op)
      transform.yield 
    }
  }
}

// -----
#map = affine_map<(d0, d1, d2) -> (d1, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d0, d1, d2)>
#map2 = affine_map<(d0, d1, d2) -> (d0)>
module {
  func.func @reduction_using_forall_tilesize_0_of_multiple_reduction_inner(%arg0: tensor<86x128xf32>, %arg1: tensor<4096x86x128xf32>, %arg2: tensor<4096xf32>) -> tensor<4096xf32> {
    %0 = linalg.generic {indexing_maps = [#map, #map1, #map2], iterator_types = ["parallel", "reduction", "reduction"]} ins(%arg0, %arg1 : tensor<86x128xf32>, tensor<4096x86x128xf32>) outs(%arg2 : tensor<4096xf32>) {
    ^bb0(%in: f32, %in_0: f32, %out: f32):
      %1 = arith.mulf %in, %in_0 : f32
      %2 = arith.addf %1, %out : f32
      linalg.yield %2 : f32
    } -> tensor<4096xf32>
    return %0 : tensor<4096xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.generic"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %fill_op, %split_op, %combining_op, %forall_op = transform.structured.tile_reduction_using_forall %0 reduction_dims = [1, 2] by tile_sizes = [0, 0, 64] : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op, !transform.any_op)
      transform.yield 
    }
  }
}

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
#map1 = affine_map<(d0, d1) -> (d0)>
module {
  func.func @reduction_tile_with_linalg_index(%arg0: tensor<8x128xf32>, %arg1: tensor<8xi32>) -> tensor<8xi32> {
    %0 = linalg.generic {indexing_maps = [#map, #map1], iterator_types = ["parallel", "reduction"]} ins(%arg0 : tensor<8x128xf32>) outs(%arg1 : tensor<8xi32>) {
    ^bb0(%in: f32, %out: i32):
      %1 = linalg.index 1 : index
      %2 = arith.index_cast %1 : index to i32
      %3 = arith.addi %2, %out : i32
      linalg.yield %3 : i32
    } -> tensor<8xi32>
    return %0 : tensor<8xi32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.generic"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %fill_op, %split_op, %combining_op, %for_op = transform.structured.tile_reduction_using_for %0 by tile_sizes = [0, 32] : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op, !transform.any_op)
      transform.yield 
    }
  }
}

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d1, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d0, 0, d2)>
module {
  func.func @reduction_tile_with_constant_in_output_map(%arg0: tensor<1x4096x64xf32>, %arg1: tensor<1x1x64xf32>) -> tensor<1x1x64xf32> {
    %0 = linalg.generic {indexing_maps = [#map, #map1], iterator_types = ["parallel", "reduction", "parallel"]} ins(%arg0 : tensor<1x4096x64xf32>) outs(%arg1 : tensor<1x1x64xf32>) {
    ^bb0(%in: f32, %out: f32):
      %1 = arith.addf %in, %out : f32
      linalg.yield %1 : f32
    } -> tensor<1x1x64xf32>
    return %0 : tensor<1x1x64xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.generic"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %fill_op, %split_op, %combining_op, %forall_op = transform.structured.tile_reduction_using_forall %0 by tile_sizes = [0, 4, 0] : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op, !transform.any_op)
      transform.yield 
    }
  }
}

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d1, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d0, 0, d2)>
module {
  func.func @reduction_tile_forall_constant_dim_k_gt_1(%arg0: tensor<1x4096x64xf32>, %arg1: tensor<1x3x64xf32>) -> tensor<1x3x64xf32> {
    %0 = linalg.generic {indexing_maps = [#map, #map1], iterator_types = ["parallel", "reduction", "parallel"]} ins(%arg0 : tensor<1x4096x64xf32>) outs(%arg1 : tensor<1x3x64xf32>) {
    ^bb0(%in: f32, %out: f32):
      %1 = arith.addf %in, %out : f32
      linalg.yield %1 : f32
    } -> tensor<1x3x64xf32>
    return %0 : tensor<1x3x64xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.generic"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %fill_op, %split_op, %combining_op, %forall_op = transform.structured.tile_reduction_using_forall %0 by tile_sizes = [0, 4, 0] : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op, !transform.any_op)
      transform.yield 
    }
  }
}

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d1, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d0, 0, d2)>
module {
  func.func @reduction_tile_for_constant_dim_k_gt_1(%arg0: tensor<1x4096x64xf32>, %arg1: tensor<1x3x64xf32>) -> tensor<1x3x64xf32> {
    %0 = linalg.generic {indexing_maps = [#map, #map1], iterator_types = ["parallel", "reduction", "parallel"]} ins(%arg0 : tensor<1x4096x64xf32>) outs(%arg1 : tensor<1x3x64xf32>) {
    ^bb0(%in: f32, %out: f32):
      %1 = arith.addf %in, %out : f32
      linalg.yield %1 : f32
    } -> tensor<1x3x64xf32>
    return %0 : tensor<1x3x64xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.generic"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %fill_op, %split_op, %combining_op, %for_op = transform.structured.tile_reduction_using_for %0 by tile_sizes = [0, 4, 0] : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op, !transform.any_op)
      transform.yield 
    }
  }
}

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d1, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d0, 0, d2)>
module {
  func.func @reduction_tile_dynamic_constant_map(%arg0: tensor<?x4096x?xf32>, %arg1: tensor<?x3x?xf32>) -> tensor<?x3x?xf32> {
    %0 = linalg.generic {indexing_maps = [#map, #map1], iterator_types = ["parallel", "reduction", "parallel"]} ins(%arg0 : tensor<?x4096x?xf32>) outs(%arg1 : tensor<?x3x?xf32>) {
    ^bb0(%in: f32, %out: f32):
      %1 = arith.addf %in, %out : f32
      linalg.yield %1 : f32
    } -> tensor<?x3x?xf32>
    return %0 : tensor<?x3x?xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.generic"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %fill_op, %split_op, %combining_op, %forall_op = transform.structured.tile_reduction_using_forall %0 by tile_sizes = [0, 4, 0] : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op, !transform.any_op)
      transform.yield 
    }
  }
}

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d1, d2)>
#map1 = affine_map<(d0, d1, d2) -> (0, 0, d2)>
module {
  func.func @reduction_tile_two_constants_in_map(%arg0: tensor<1x4096x64xf32>, %arg1: tensor<3x5x64xf32>) -> tensor<3x5x64xf32> {
    %0 = linalg.generic {indexing_maps = [#map, #map1], iterator_types = ["reduction", "reduction", "parallel"]} ins(%arg0 : tensor<1x4096x64xf32>) outs(%arg1 : tensor<3x5x64xf32>) {
    ^bb0(%in: f32, %out: f32):
      %1 = arith.addf %in, %out : f32
      linalg.yield %1 : f32
    } -> tensor<3x5x64xf32>
    return %0 : tensor<3x5x64xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.generic"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %fill_op, %split_op, %combining_op, %forall_op = transform.structured.tile_reduction_using_forall %0 by tile_sizes = [0, 4, 0] : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op, !transform.any_op)
      transform.yield 
    }
  }
}

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d1, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d0, 0, d2)>
module {
  func.func @reduction_tile_for_dynamic_constant_map(%arg0: tensor<?x4096x?xf32>, %arg1: tensor<?x3x?xf32>) -> tensor<?x3x?xf32> {
    %0 = linalg.generic {indexing_maps = [#map, #map1], iterator_types = ["parallel", "reduction", "parallel"]} ins(%arg0 : tensor<?x4096x?xf32>) outs(%arg1 : tensor<?x3x?xf32>) {
    ^bb0(%in: f32, %out: f32):
      %1 = arith.addf %in, %out : f32
      linalg.yield %1 : f32
    } -> tensor<?x3x?xf32>
    return %0 : tensor<?x3x?xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.generic"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %fill_op, %split_op, %combining_op, %for_op = transform.structured.tile_reduction_using_for %0 by tile_sizes = [0, 4, 0] : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op, !transform.any_op)
      transform.yield 
    }
  }
}

