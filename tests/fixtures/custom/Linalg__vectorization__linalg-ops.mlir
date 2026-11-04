#map = affine_map<(d0) -> (d0)>
module {
  func.func @vectorize_dynamic_identity(%arg0: tensor<?xf32>, %arg1: tensor<?xf32>, %arg2: tensor<?xf32>) -> tensor<?xf32> {
    %0 = linalg.generic {indexing_maps = [#map, #map, #map], iterator_types = ["parallel"]} ins(%arg0, %arg1 : tensor<?xf32>, tensor<?xf32>) outs(%arg2 : tensor<?xf32>) {
    ^bb0(%in: f32, %in_0: f32, %out: f32):
      %1 = arith.addf %in, %in_0 : f32
      linalg.yield %1 : f32
    } -> tensor<?xf32>
    return %0 : tensor<?xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.generic"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.structured.vectorize %0 vector_sizes [4] : !transform.any_op
      transform.yield 
    }
  }
}

// -----
#map = affine_map<(d0) -> (d0)>
module {
  func.func @vectorize_dynamic_identity_scalable(%arg0: tensor<?xf32>, %arg1: tensor<?xf32>, %arg2: tensor<?xf32>) -> tensor<?xf32> {
    %0 = linalg.generic {indexing_maps = [#map, #map, #map], iterator_types = ["parallel"]} ins(%arg0, %arg1 : tensor<?xf32>, tensor<?xf32>) outs(%arg2 : tensor<?xf32>) {
    ^bb0(%in: f32, %in_0: f32, %out: f32):
      %1 = arith.addf %in, %in_0 : f32
      linalg.yield %1 : f32
    } -> tensor<?xf32>
    return %0 : tensor<?xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.generic"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.structured.vectorize %0 vector_sizes [[4]] : !transform.any_op
      transform.yield 
    }
  }
}

// -----
#map = affine_map<(d0) -> (d0)>
module {
  func.func @vectorize_dynamic_identity_with_constant(%arg0: tensor<?xf32>, %arg1: tensor<?xf32>, %arg2: tensor<?xf32>) -> tensor<?xf32> {
    %c4 = arith.constant 4 : index
    %0 = linalg.generic {indexing_maps = [#map, #map, #map], iterator_types = ["parallel"]} ins(%arg0, %arg1 : tensor<?xf32>, tensor<?xf32>) outs(%arg2 : tensor<?xf32>) {
    ^bb0(%in: f32, %in_0: f32, %out: f32):
      %1 = arith.addf %in, %in_0 : f32
      linalg.yield %1 : f32
    } -> tensor<?xf32>
    return %0 : tensor<?xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.generic"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.structured.match ops{["arith.constant"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.structured.vectorize %0 vector_sizes [%1] : !transform.any_op, !transform.any_op
      transform.yield 
    }
  }
}

// -----
#map = affine_map<(d0) -> (d0)>
module {
  func.func @vectorize_dynamic_identity_with_param(%arg0: tensor<?xf32>, %arg1: tensor<?xf32>, %arg2: tensor<?xf32>) -> tensor<?xf32> {
    %0 = linalg.generic {indexing_maps = [#map, #map, #map], iterator_types = ["parallel"]} ins(%arg0, %arg1 : tensor<?xf32>, tensor<?xf32>) outs(%arg2 : tensor<?xf32>) {
    ^bb0(%in: f32, %in_0: f32, %out: f32):
      %1 = arith.addf %in, %in_0 : f32
      linalg.yield %1 : f32
    } -> tensor<?xf32>
    return %0 : tensor<?xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.generic"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.param.constant 4 : i64 -> !transform.param<i64>
      transform.structured.vectorize %0 vector_sizes [%1] : !transform.any_op, !transform.param<i64>
      transform.yield 
    }
  }
}

// -----
#map = affine_map<(d0) -> (0)>
#map1 = affine_map<(d0) -> (d0)>
module {
  func.func @vectorize_dynamic_1d_broadcast(%arg0: tensor<?xf32>, %arg1: tensor<?xf32>, %arg2: tensor<?xf32>) -> tensor<?xf32> {
    %0 = linalg.generic {indexing_maps = [#map, #map1, #map1], iterator_types = ["parallel"]} ins(%arg0, %arg1 : tensor<?xf32>, tensor<?xf32>) outs(%arg2 : tensor<?xf32>) {
    ^bb0(%in: f32, %in_0: f32, %out: f32):
      %1 = arith.addf %in, %in_0 : f32
      linalg.yield %1 : f32
    } -> tensor<?xf32>
    return %0 : tensor<?xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.generic"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.structured.vectorize %0 vector_sizes [4] : !transform.any_op
      transform.yield 
    }
  }
}

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
#map1 = affine_map<(d0, d1) -> (d0, 0)>
module {
  func.func @dynamic_generic_with_reduction_and_broadcast(%arg0: tensor<?x?xf32>, %arg1: tensor<?x?xf32>) -> tensor<?x?xf32> {
    %0 = linalg.generic {indexing_maps = [#map, #map1], iterator_types = ["parallel", "reduction"]} ins(%arg0 : tensor<?x?xf32>) outs(%arg1 : tensor<?x?xf32>) {
    ^bb0(%in: f32, %out: f32):
      %1 = arith.addf %in, %out : f32
      linalg.yield %1 : f32
    } -> tensor<?x?xf32>
    return %0 : tensor<?x?xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.generic"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.structured.vectorize %0 vector_sizes [4, 4] : !transform.any_op
      transform.yield 
    }
  }
}

// -----
#map = affine_map<(d0, d1) -> (d1, d0)>
#map1 = affine_map<(d0, d1) -> (d0, d1)>
module {
  func.func @vectorize_dynamic_2d_transpose(%arg0: tensor<?x?xf32>, %arg1: tensor<?x?xf32>, %arg2: tensor<?x?xf32>) -> tensor<?x?xf32> {
    %0 = linalg.generic {indexing_maps = [#map, #map1, #map1], iterator_types = ["parallel", "parallel"]} ins(%arg0, %arg1 : tensor<?x?xf32>, tensor<?x?xf32>) outs(%arg2 : tensor<?x?xf32>) {
    ^bb0(%in: f32, %in_0: f32, %out: f32):
      %1 = arith.addf %in, %in_0 : f32
      linalg.yield %1 : f32
    } -> tensor<?x?xf32>
    return %0 : tensor<?x?xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.generic"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.structured.vectorize %0 vector_sizes [4, 8] : !transform.any_op
      transform.yield 
    }
  }
}

// -----
#map = affine_map<(d0, d1) -> (0, d1)>
#map1 = affine_map<(d0, d1) -> (d0, d1)>
module {
  func.func @vectorize_dynamic_generic_2d_broadcast(%arg0: tensor<?x?xf32>, %arg1: tensor<?x?xf32>, %arg2: tensor<?x?xf32>) -> tensor<?x?xf32> {
    %0 = linalg.generic {indexing_maps = [#map, #map1, #map1], iterator_types = ["parallel", "parallel"]} ins(%arg0, %arg1 : tensor<?x?xf32>, tensor<?x?xf32>) outs(%arg2 : tensor<?x?xf32>) {
    ^bb0(%in: f32, %in_0: f32, %out: f32):
      %1 = arith.addf %in, %in_0 : f32
      linalg.yield %1 : f32
    } -> tensor<?x?xf32>
    return %0 : tensor<?x?xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.generic"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.structured.vectorize %0 vector_sizes [4, 8] : !transform.any_op
      transform.yield 
    }
  }
}

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
#map1 = affine_map<(d0, d1) -> (d0)>
module {
  func.func @vectorize_dynamic_reduction_2d(%arg0: tensor<?x?xf32>, %arg1: tensor<?xf32>) -> tensor<?xf32> {
    %0 = linalg.generic {indexing_maps = [#map, #map1], iterator_types = ["parallel", "reduction"]} ins(%arg0 : tensor<?x?xf32>) outs(%arg1 : tensor<?xf32>) {
    ^bb0(%in: f32, %out: f32):
      %1 = arith.addf %in, %out : f32
      linalg.yield %1 : f32
    } -> tensor<?xf32>
    return %0 : tensor<?xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.generic"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.structured.vectorize %0 vector_sizes [4, 8] : !transform.any_op
      transform.yield 
    }
  }
}

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
#map1 = affine_map<(d0, d1) -> (d0)>
module {
  func.func @vectorize_dynamic_reduction_2d_scalable(%arg0: tensor<?x?xf32>, %arg1: tensor<?xf32>) -> tensor<?xf32> {
    %0 = linalg.generic {indexing_maps = [#map, #map1], iterator_types = ["parallel", "reduction"]} ins(%arg0 : tensor<?x?xf32>) outs(%arg1 : tensor<?xf32>) {
    ^bb0(%in: f32, %out: f32):
      %1 = arith.addf %in, %out : f32
      linalg.yield %1 : f32
    } -> tensor<?xf32>
    return %0 : tensor<?xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.generic"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.structured.vectorize %0 vector_sizes [4, [8]] : !transform.any_op
      transform.yield 
    }
  }
}

// -----
module {
  func.func @vectorize_dynamic_reduction_scalable_1d(%arg0: tensor<?xf32>, %arg1: tensor<f32>) -> tensor<f32> {
    %reduced = linalg.reduce ins(%arg0 : tensor<?xf32>) outs(%arg1 : tensor<f32>) dimensions = [0] 
      (%in: f32, %init: f32) {
        %0 = arith.addf %in, %init : f32
        linalg.yield %0 : f32
      }
    return %reduced : tensor<f32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.reduce"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.structured.vectorize %0 vector_sizes [[4]] : !transform.any_op
      transform.yield 
    }
  }
}

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d1, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d2, d1)>
module {
  func.func @vectorize_dynamic_transpose_reduction(%arg0: tensor<?x?x?xf32>, %arg1: tensor<?x?xf32>) -> tensor<?x?xf32> {
    %0 = linalg.generic {indexing_maps = [#map, #map1], iterator_types = ["reduction", "parallel", "parallel"]} ins(%arg0 : tensor<?x?x?xf32>) outs(%arg1 : tensor<?x?xf32>) {
    ^bb0(%in: f32, %out: f32):
      %1 = arith.addf %in, %out : f32
      linalg.yield %1 : f32
    } -> tensor<?x?xf32>
    return %0 : tensor<?x?xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.generic"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.structured.vectorize %0 vector_sizes [4, 8, 16] : !transform.any_op
      transform.yield 
    }
  }
}

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d1, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d2, d1)>
module {
  func.func @vectorize_dynamic_transpose_reduction_with_params(%arg0: tensor<?x?x?xf32>, %arg1: tensor<?x?xf32>) -> tensor<?x?xf32> {
    %0 = linalg.generic {indexing_maps = [#map, #map1], iterator_types = ["reduction", "parallel", "parallel"]} ins(%arg0 : tensor<?x?x?xf32>) outs(%arg1 : tensor<?x?xf32>) {
    ^bb0(%in: f32, %out: f32):
      %1 = arith.addf %in, %out : f32
      linalg.yield %1 : f32
    } -> tensor<?x?xf32>
    return %0 : tensor<?x?xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.generic"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.param.constant 4 : i64 -> !transform.param<i64>
      %2 = transform.param.constant 16 : i64 -> !transform.param<i64>
      transform.structured.vectorize %0 vector_sizes [%1, 8, %2] : !transform.any_op, !transform.param<i64>, !transform.param<i64>
      transform.yield 
    }
  }
}

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
module {
  func.func @vectorize_partial_dynamic_identity(%arg0: tensor<8x?xf32>, %arg1: tensor<8x?xf32>, %arg2: tensor<8x?xf32>) -> tensor<8x?xf32> {
    %0 = linalg.generic {indexing_maps = [#map, #map, #map], iterator_types = ["parallel", "parallel"]} ins(%arg0, %arg1 : tensor<8x?xf32>, tensor<8x?xf32>) outs(%arg2 : tensor<8x?xf32>) {
    ^bb0(%in: f32, %in_0: f32, %out: f32):
      %1 = arith.addf %in, %in_0 : f32
      linalg.yield %1 : f32
    } -> tensor<8x?xf32>
    return %0 : tensor<8x?xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.generic"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.structured.vectorize %0 vector_sizes [8, 32] : !transform.any_op
      transform.yield 
    }
  }
}

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
module {
  func.func @vectorize_partial_dynamic_identity_scalable(%arg0: tensor<8x?xf32>, %arg1: tensor<8x?xf32>, %arg2: tensor<8x?xf32>) -> tensor<8x?xf32> {
    %0 = linalg.generic {indexing_maps = [#map, #map, #map], iterator_types = ["parallel", "parallel"]} ins(%arg0, %arg1 : tensor<8x?xf32>, tensor<8x?xf32>) outs(%arg2 : tensor<8x?xf32>) {
    ^bb0(%in: f32, %in_0: f32, %out: f32):
      %1 = arith.addf %in, %in_0 : f32
      linalg.yield %1 : f32
    } -> tensor<8x?xf32>
    return %0 : tensor<8x?xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.generic"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.structured.vectorize %0 vector_sizes [8, [32]] : !transform.any_op
      transform.yield 
    }
  }
}

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
module {
  func.func @do_not_generate_masks(%arg0: tensor<8x32xf32>, %arg1: tensor<8x32xf32>, %arg2: tensor<8x32xf32>) -> tensor<8x32xf32> {
    %0 = linalg.generic {indexing_maps = [#map, #map, #map], iterator_types = ["parallel", "parallel"]} ins(%arg0, %arg1 : tensor<8x32xf32>, tensor<8x32xf32>) outs(%arg2 : tensor<8x32xf32>) {
    ^bb0(%in: f32, %in_0: f32, %out: f32):
      %1 = arith.addf %in, %in_0 : f32
      linalg.yield %1 : f32
    } -> tensor<8x32xf32>
    return %0 : tensor<8x32xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.generic"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.structured.vectorize %0 vector_sizes [8, 32] : !transform.any_op
      transform.yield 
    }
  }
}

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
module {
  func.func @vectorize_static_shape_with_mask(%arg0: tensor<8x30xf32>, %arg1: tensor<8x30xf32>, %arg2: tensor<8x30xf32>) -> tensor<8x30xf32> {
    %0 = linalg.generic {indexing_maps = [#map, #map, #map], iterator_types = ["parallel", "parallel"]} ins(%arg0, %arg1 : tensor<8x30xf32>, tensor<8x30xf32>) outs(%arg2 : tensor<8x30xf32>) {
    ^bb0(%in: f32, %in_0: f32, %out: f32):
      %1 = arith.addf %in, %in_0 : f32
      linalg.yield %1 : f32
    } -> tensor<8x30xf32>
    return %0 : tensor<8x30xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.generic"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.structured.vectorize %0 vector_sizes [8, 32] : !transform.any_op
      transform.yield 
    }
  }
}

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
module {
  func.func @vectorize_static_shape_with_mask_scalable(%arg0: tensor<8x30xf32>, %arg1: tensor<8x30xf32>, %arg2: tensor<8x30xf32>) -> tensor<8x30xf32> {
    %0 = linalg.generic {indexing_maps = [#map, #map, #map], iterator_types = ["parallel", "parallel"]} ins(%arg0, %arg1 : tensor<8x30xf32>, tensor<8x30xf32>) outs(%arg2 : tensor<8x30xf32>) {
    ^bb0(%in: f32, %in_0: f32, %out: f32):
      %1 = arith.addf %in, %in_0 : f32
      linalg.yield %1 : f32
    } -> tensor<8x30xf32>
    return %0 : tensor<8x30xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.generic"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.structured.vectorize %0 vector_sizes [8, [32]] : !transform.any_op
      transform.yield 
    }
  }
}

// -----
module {
  func.func @vectorize_dynamic_matvec_trailing_reduction_dim(%arg0: tensor<?x?xf32>, %arg1: tensor<?xf32>, %arg2: tensor<?xf32>) {
    %0 = linalg.matvec ins(%arg0, %arg1 : tensor<?x?xf32>, tensor<?xf32>) outs(%arg2 : tensor<?xf32>) -> tensor<?xf32>
    return
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.matvec"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.structured.vectorize %0 vector_sizes [4, [4]] : !transform.any_op
      transform.yield 
    }
  }
}

// -----
module {
  func.func @vectorize_dynamic_matvec_trailing_reduction_dim(%arg0: tensor<?x?xf32>, %arg1: tensor<?xf32>, %arg2: tensor<?xf32>) -> tensor<?xf32> {
    %0 = linalg.matvec ins(%arg0, %arg1 : tensor<?x?xf32>, tensor<?xf32>) outs(%arg2 : tensor<?xf32>) -> tensor<?xf32>
    return %0 : tensor<?xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.matvec"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.structured.vectorize %0 vector_sizes [[4], 4] : !transform.any_op
      transform.yield 
    }
  }
}

// -----
#map = affine_map<(d0) -> (d0)>
module {
  func.func @vectorize_linalg_index_scalable(%arg0: tensor<?xindex>) -> tensor<?xindex> {
    %0 = linalg.generic {indexing_maps = [#map], iterator_types = ["parallel"]} outs(%arg0 : tensor<?xindex>) {
    ^bb0(%out: index):
      %1 = linalg.index 0 : index
      linalg.yield %1 : index
    } -> tensor<?xindex>
    return %0 : tensor<?xindex>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.generic"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.structured.vectorize %0 vector_sizes [[4]] : !transform.any_op
      transform.yield 
    }
  }
}

// -----
module {
  func.func @mmt4d(%arg0: memref<16x16x8x1xf32>, %arg1: memref<16x16x8x1xf32>, %arg2: memref<16x16x8x8xf32>) {
    linalg.mmt4d ins(%arg0, %arg1 : memref<16x16x8x1xf32>, memref<16x16x8x1xf32>) outs(%arg2 : memref<16x16x8x8xf32>)
    return
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.mmt4d"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.structured.vectorize %0 : !transform.any_op
      transform.yield 
    }
  }
}

// -----
module {
  func.func @mmt4d_scalable(%arg0: memref<16x16x8x1xf32>, %arg1: memref<16x16x?x1xf32>, %arg2: memref<16x16x8x?xf32>) {
    linalg.mmt4d ins(%arg0, %arg1 : memref<16x16x8x1xf32>, memref<16x16x?x1xf32>) outs(%arg2 : memref<16x16x8x?xf32>)
    return
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.mmt4d"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.structured.vectorize %0 vector_sizes [16, 16, 16, 8, [4], 1] : !transform.any_op
      transform.yield 
    }
  }
}

// -----
module {
  func.func @mmt4d_scalable_with_assume(%arg0: memref<16x16x8x1xf32>, %arg1: memref<16x16x?x1xf32>, %arg2: memref<16x16x8x?xf32>) {
    linalg.mmt4d ins(%arg0, %arg1 : memref<16x16x8x1xf32>, memref<16x16x?x1xf32>) outs(%arg2 : memref<16x16x8x?xf32>)
    return
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.mmt4d"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.structured.vectorize %0 vector_sizes [16, 16, 16, 8, [4], 1] {assume_dynamic_dims_match_vec_sizes} : !transform.any_op
      transform.yield 
    }
  }
}

// -----
module {
  func.func @batch_mmt4d(%arg0: memref<2x16x16x8x1xf32>, %arg1: memref<2x16x16x8x1xf32>, %arg2: memref<2x16x16x8x8xf32>) {
    linalg.batch_mmt4d ins(%arg0, %arg1 : memref<2x16x16x8x1xf32>, memref<2x16x16x8x1xf32>) outs(%arg2 : memref<2x16x16x8x8xf32>)
    return
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.batch_mmt4d"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.structured.vectorize %0 : !transform.any_op
      transform.yield 
    }
  }
}

// -----
module {
  func.func @batch_mmt4d_scalable(%arg0: memref<2x16x16x8x1xf32>, %arg1: memref<2x16x16x?x1xf32>, %arg2: memref<2x16x16x8x?xf32>) {
    linalg.batch_mmt4d ins(%arg0, %arg1 : memref<2x16x16x8x1xf32>, memref<2x16x16x?x1xf32>) outs(%arg2 : memref<2x16x16x8x?xf32>)
    return
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.batch_mmt4d"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.structured.vectorize %0 vector_sizes [2, 16, 16, 16, 8, [4], 1] : !transform.any_op
      transform.yield 
    }
  }
}

// -----
module {
  func.func @batch_mmt4d_scalable_with_assume(%arg0: memref<2x16x16x8x1xf32>, %arg1: memref<2x16x16x?x1xf32>, %arg2: memref<2x16x16x8x?xf32>) {
    linalg.batch_mmt4d ins(%arg0, %arg1 : memref<2x16x16x8x1xf32>, memref<2x16x16x?x1xf32>) outs(%arg2 : memref<2x16x16x8x?xf32>)
    return
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.batch_mmt4d"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.structured.vectorize %0 vector_sizes [2, 16, 16, 16, 8, [4], 1] {assume_dynamic_dims_match_vec_sizes} : !transform.any_op
      transform.yield 
    }
  }
}

// -----
module {
  func.func @test_vectorize_dynamic_shapes_unpack(%arg0: tensor<?x?xf32>, %arg1: tensor<?x?x16x2xf32>) -> tensor<?x?xf32> {
    %unpack = linalg.unpack %arg1 inner_dims_pos = [1, 0] inner_tiles = [16, 2] into %arg0 : tensor<?x?x16x2xf32> -> tensor<?x?xf32>
    return %unpack : tensor<?x?xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.unpack"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.structured.vectorize %0 vector_sizes [2, 1, 16, 2] : !transform.any_op
      transform.yield 
    }
  }
}

// -----
module {
  func.func @test_vectorize_dynamic_shapes_unpack_scalable_vec(%arg0: tensor<?x?xf32>, %arg1: tensor<?x?x16x2xf32>) -> tensor<?x?xf32> {
    %unpack = linalg.unpack %arg1 inner_dims_pos = [1, 0] inner_tiles = [16, 2] into %arg0 : tensor<?x?x16x2xf32> -> tensor<?x?xf32>
    return %unpack : tensor<?x?xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.unpack"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.structured.vectorize %0 vector_sizes [2, 1, [16], 2] : !transform.any_op
      transform.yield 
    }
  }
}

// -----
module {
  func.func @test_vectorize_dynamic_shapes_unpack_scalable_vec_and_tile_size(%arg0: tensor<?x?xf32>, %arg1: tensor<?x?x?x2xf32>) -> tensor<?x?xf32> {
    %vscale = vector.vscale
    %c16 = arith.constant 16 : index
    %c16_vscale = arith.muli %vscale, %c16 : index
    %unpack = linalg.unpack %arg1 inner_dims_pos = [1, 0] inner_tiles = [%c16_vscale, 2] into %arg0 : tensor<?x?x?x2xf32> -> tensor<?x?xf32>
    return %unpack : tensor<?x?xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.unpack"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.structured.vectorize %0 vector_sizes [2, 1, [16], 2] : !transform.any_op
      transform.yield 
    }
  }
}

// -----
module {
  func.func @test_vectorize_unpack(%arg0: tensor<8x8x32x16xf32>, %arg1: tensor<256x128xf32>) -> tensor<256x128xf32> {
    %unpack = linalg.unpack %arg0 inner_dims_pos = [0, 1] inner_tiles = [32, 16] into %arg1 : tensor<8x8x32x16xf32> -> tensor<256x128xf32>
    return %unpack : tensor<256x128xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.unpack"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.structured.vectorize %0 vector_sizes [16, 8, 32, 16] : !transform.any_op
      transform.yield 
    }
  }
}

// -----
module {
  func.func @test_vectorize_unpack_no_masks(%arg0: tensor<8x8x32x16xf32>, %arg1: tensor<256x128xf32>) -> tensor<256x128xf32> {
    %unpack = linalg.unpack %arg0 inner_dims_pos = [0, 1] inner_tiles = [32, 16] into %arg1 : tensor<8x8x32x16xf32> -> tensor<256x128xf32>
    return %unpack : tensor<256x128xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.unpack"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.structured.vectorize %0 vector_sizes [8, 8, 32, 16] : !transform.any_op
      transform.yield 
    }
  }
}

// -----
module {
  func.func @test_vectorize_unpack_with_outer_perm(%arg0: tensor<8x8x32x16xf32>, %arg1: tensor<256x128xf32>) -> tensor<256x128xf32> {
    %unpack = linalg.unpack %arg0 outer_dims_perm = [1, 0] inner_dims_pos = [0, 1] inner_tiles = [32, 16] into %arg1 : tensor<8x8x32x16xf32> -> tensor<256x128xf32>
    return %unpack : tensor<256x128xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.unpack"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.structured.vectorize %0 vector_sizes [8, 8, 32, 16] : !transform.any_op
      transform.yield 
    }
  }
}

// -----
module {
  func.func @test_vectorize_unpack_no_vector_sizes(%arg0: tensor<8x8x32x16xf32>, %arg1: tensor<256x128xf32>) -> tensor<256x128xf32> {
    %unpack = linalg.unpack %arg0 inner_dims_pos = [0, 1] inner_tiles = [32, 16] into %arg1 : tensor<8x8x32x16xf32> -> tensor<256x128xf32>
    return %unpack : tensor<256x128xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.unpack"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.structured.vectorize %0 : !transform.any_op
      transform.yield 
    }
  }
}

// -----
module {
  func.func @test_vectorize_unpack_no_vector_sizes_slice_output(%arg0: tensor<8x4x16x16xf32>, %arg1: tensor<64x127xf32>) -> tensor<64x127xf32> {
    %unpack = linalg.unpack %arg0 outer_dims_perm = [1, 0] inner_dims_pos = [0, 1] inner_tiles = [16, 16] into %arg1 : tensor<8x4x16x16xf32> -> tensor<64x127xf32>
    return %unpack : tensor<64x127xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.unpack"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.structured.vectorize %0 : !transform.any_op
      transform.yield 
    }
  }
}

// -----
module {
  func.func @test_vectorize_unpack_no_vector_sizes_permute(%arg0: tensor<4x7x4xf32>, %arg1: tensor<7x16xf32>) -> tensor<7x16xf32> {
    %unpack = linalg.unpack %arg0 outer_dims_perm = [1, 0] inner_dims_pos = [1] inner_tiles = [4] into %arg1 : tensor<4x7x4xf32> -> tensor<7x16xf32>
    return %unpack : tensor<7x16xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.unpack"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.structured.vectorize %0 : !transform.any_op
      transform.yield 
    }
  }
}

// -----
module {
  func.func @pack_no_padding(%arg0: tensor<32x8x16xf32>, %arg1: tensor<4x1x32x16x2xf32>) -> tensor<4x1x32x16x2xf32> {
    %pack = linalg.pack %arg0 outer_dims_perm = [1, 2, 0] inner_dims_pos = [2, 1] inner_tiles = [16, 2] into %arg1 : tensor<32x8x16xf32> -> tensor<4x1x32x16x2xf32>
    return %pack : tensor<4x1x32x16x2xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.pack"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.structured.vectorize %0 vector_sizes [4, 1, 32, 16, 2] : !transform.any_op
      transform.yield 
    }
  }
}

// -----
module {
  func.func @pack_with_padding(%arg0: tensor<32x7x15xf32>, %arg1: tensor<32x4x1x16x2xf32>) -> tensor<32x4x1x16x2xf32> {
    %cst = arith.constant 0.000000e+00 : f32
    %pack = linalg.pack %arg0 padding_value(%cst : f32) inner_dims_pos = [2, 1] inner_tiles = [16, 2] into %arg1 : tensor<32x7x15xf32> -> tensor<32x4x1x16x2xf32>
    return %pack : tensor<32x4x1x16x2xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.pack"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.structured.vectorize %0 vector_sizes [32, 4, 1, 16, 2] : !transform.any_op
      transform.yield 
    }
  }
}

// -----
module {
  func.func @pack_with_padding_no_vector_sizes(%arg0: tensor<32x7x15xf32>, %arg1: tensor<32x4x1x16x2xf32>) -> tensor<32x4x1x16x2xf32> {
    %cst = arith.constant 0.000000e+00 : f32
    %pack = linalg.pack %arg0 padding_value(%cst : f32) inner_dims_pos = [2, 1] inner_tiles = [16, 2] into %arg1 : tensor<32x7x15xf32> -> tensor<32x4x1x16x2xf32>
    return %pack : tensor<32x4x1x16x2xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.pack"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.structured.vectorize %0 : !transform.any_op
      transform.yield 
    }
  }
}

// -----
module {
  func.func @pack_with_dynamic_dims(%arg0: tensor<?x?xf32>, %arg1: tensor<?x?x16x2xf32>) -> tensor<?x?x16x2xf32> {
    %pack = linalg.pack %arg0 inner_dims_pos = [1, 0] inner_tiles = [16, 2] into %arg1 : tensor<?x?xf32> -> tensor<?x?x16x2xf32>
    return %pack : tensor<?x?x16x2xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.pack"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.structured.vectorize %0 vector_sizes [4, 1, 16, 2] : !transform.any_op
      transform.yield 
    }
  }
}

// -----
module {
  func.func @pack_with_dynamic_dims_and_dynamic_inner_tile(%arg0: tensor<?x?xf32>, %arg1: tensor<?x?x?x2xf32>) -> tensor<?x?x?x2xf32> {
    %c16 = arith.constant 16 : index
    %pack = linalg.pack %arg0 inner_dims_pos = [1, 0] inner_tiles = [%c16, 2] into %arg1 : tensor<?x?xf32> -> tensor<?x?x?x2xf32>
    return %pack : tensor<?x?x?x2xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.pack"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.structured.vectorize %0 vector_sizes [4, 1, 16, 2] : !transform.any_op
      transform.yield 
    }
  }
}

// -----
module {
  func.func @vectorize_dynamic_fill(%arg0: tensor<?x?xf32>, %arg1: f32) -> tensor<?x?xf32> {
    %0 = linalg.fill ins(%arg1 : f32) outs(%arg0 : tensor<?x?xf32>) -> tensor<?x?xf32>
    return %0 : tensor<?x?xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.fill"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.structured.vectorize %0 vector_sizes [8, 16] : !transform.any_op
      transform.yield 
    }
  }
}

// -----
module {
  func.func @vectorize_dynamic_fill_scalable(%arg0: tensor<?x?xf32>, %arg1: f32) -> tensor<?x?xf32> {
    %0 = linalg.fill ins(%arg1 : f32) outs(%arg0 : tensor<?x?xf32>) -> tensor<?x?xf32>
    return %0 : tensor<?x?xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.fill"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.structured.vectorize %0 vector_sizes [[8], 1] : !transform.any_op
      transform.yield 
    }
  }
}

// -----
module {
  func.func @test_masked_vectorize_linalg_transpose(%arg0: tensor<?x?xf32>, %arg1: tensor<?x?xf32>) -> tensor<?x?xf32> {
    %transposed = linalg.transpose ins(%arg0 : tensor<?x?xf32>) outs(%arg1 : tensor<?x?xf32>) permutation = [1, 0] 
    return %transposed : tensor<?x?xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.transpose"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.structured.vectorize %0 vector_sizes [2, 4] : !transform.any_op
      transform.yield 
    }
  }
}

// -----
module {
  func.func @test_masked_vectorize_linalg_copy(%arg0: memref<?x?xf32>, %arg1: memref<?x?xf32>) {
    linalg.copy ins(%arg0 : memref<?x?xf32>) outs(%arg1 : memref<?x?xf32>)
    return
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.copy"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.structured.vectorize %0 vector_sizes [2, 4] : !transform.any_op
      transform.yield 
    }
  }
}

// -----
module {
  func.func @matmul(%arg0: memref<?x?xf32>, %arg1: memref<?x?xf32>, %arg2: memref<?x?xf32>) {
    linalg.matmul ins(%arg0, %arg1 : memref<?x?xf32>, memref<?x?xf32>) outs(%arg2 : memref<?x?xf32>)
    return
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.matmul"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.structured.vectorize %0 vector_sizes [8, 16, 4] : !transform.any_op
      transform.yield 
    }
  }
}

// -----
module {
  func.func @matmul_scalable(%arg0: memref<?x?xf32>, %arg1: memref<?x?xf32>, %arg2: memref<?x?xf32>) {
    linalg.matmul ins(%arg0, %arg1 : memref<?x?xf32>, memref<?x?xf32>) outs(%arg2 : memref<?x?xf32>)
    return
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.matmul"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.structured.vectorize %0 vector_sizes [8, [16], 4] : !transform.any_op
      transform.yield 
    }
  }
}

// -----
module {
  func.func @batch_matmul(%arg0: memref<?x?x?xf32>, %arg1: memref<?x?x?xf32>, %arg2: memref<?x?x?xf32>) {
    linalg.batch_matmul ins(%arg0, %arg1 : memref<?x?x?xf32>, memref<?x?x?xf32>) outs(%arg2 : memref<?x?x?xf32>)
    return
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.batch_matmul"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.structured.vectorize %0 vector_sizes [4, 8, 16, 4] : !transform.any_op
      transform.yield 
    }
  }
}

// -----
module {
  func.func @batch_matmul_scalable(%arg0: memref<?x?x?xf32>, %arg1: memref<?x?x?xf32>, %arg2: memref<?x?x?xf32>) {
    linalg.batch_matmul ins(%arg0, %arg1 : memref<?x?x?xf32>, memref<?x?x?xf32>) outs(%arg2 : memref<?x?x?xf32>)
    return
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.batch_matmul"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.structured.vectorize %0 vector_sizes [4, 8, [16], 4] : !transform.any_op
      transform.yield 
    }
  }
}

