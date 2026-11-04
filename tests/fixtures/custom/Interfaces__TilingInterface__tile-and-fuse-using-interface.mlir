module {
  func.func @gemm_fill_fusion(%arg0: tensor<?x?xf32>, %arg1: tensor<?x?xf32>) -> tensor<?x?xf32> {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %cst = arith.constant 0.000000e+00 : f32
    %dim = tensor.dim %arg0, %c0 : tensor<?x?xf32>
    %dim_0 = tensor.dim %arg1, %c1 : tensor<?x?xf32>
    %0 = tensor.empty(%dim, %dim_0) : tensor<?x?xf32>
    %1 = linalg.fill ins(%cst : f32) outs(%0 : tensor<?x?xf32>) -> tensor<?x?xf32>
    %2 = linalg.matmul ins(%arg0, %arg1 : tensor<?x?xf32>, tensor<?x?xf32>) outs(%1 : tensor<?x?xf32>) -> tensor<?x?xf32>
    return %2 : tensor<?x?xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.matmul"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %transformed, %loops:2 = transform.structured.fuse %0 tile_sizes [10, 20] : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op)
      transform.yield 
    }
  }
}

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
#map1 = affine_map<(d0, d1) -> (d1)>
module {
  func.func @gemm_generic_fusion(%arg0: tensor<?x?xf32>, %arg1: tensor<?x?xf32>, %arg2: tensor<?xf32>) -> tensor<?x?xf32> {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %cst = arith.constant 0.000000e+00 : f32
    %dim = tensor.dim %arg0, %c0 : tensor<?x?xf32>
    %dim_0 = tensor.dim %arg1, %c1 : tensor<?x?xf32>
    %0 = tensor.empty(%dim, %dim_0) : tensor<?x?xf32>
    %1 = linalg.fill ins(%cst : f32) outs(%0 : tensor<?x?xf32>) -> tensor<?x?xf32>
    %2 = linalg.matmul ins(%arg0, %arg1 : tensor<?x?xf32>, tensor<?x?xf32>) outs(%1 : tensor<?x?xf32>) -> tensor<?x?xf32>
    %3 = linalg.generic {indexing_maps = [#map, #map1, #map], iterator_types = ["parallel", "parallel"]} ins(%2, %arg2 : tensor<?x?xf32>, tensor<?xf32>) outs(%0 : tensor<?x?xf32>) {
    ^bb0(%in: f32, %in_1: f32, %out: f32):
      %4 = arith.addf %in, %in_1 : f32
      linalg.yield %4 : f32
    } -> tensor<?x?xf32>
    return %3 : tensor<?x?xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.generic"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %transformed, %loops:2 = transform.structured.fuse %0 tile_sizes [10, 20] : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op)
      transform.yield 
    }
  }
}

// -----
module {
  func.func @gemm_gemm_fusion(%arg0: tensor<?x?xf32>, %arg1: tensor<?x?xf32>, %arg2: tensor<?x?xf32>) -> tensor<?x?xf32> {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %cst = arith.constant 0.000000e+00 : f32
    %dim = tensor.dim %arg0, %c0 : tensor<?x?xf32>
    %dim_0 = tensor.dim %arg1, %c1 : tensor<?x?xf32>
    %0 = tensor.empty(%dim, %dim_0) : tensor<?x?xf32>
    %1 = linalg.fill ins(%cst : f32) outs(%0 : tensor<?x?xf32>) -> tensor<?x?xf32>
    %2 = linalg.matmul ins(%arg0, %arg1 : tensor<?x?xf32>, tensor<?x?xf32>) outs(%1 : tensor<?x?xf32>) -> tensor<?x?xf32>
    %dim_1 = tensor.dim %arg2, %c1 : tensor<?x?xf32>
    %3 = tensor.empty(%dim, %dim_1) : tensor<?x?xf32>
    %4 = linalg.fill ins(%cst : f32) outs(%3 : tensor<?x?xf32>) -> tensor<?x?xf32>
    %5 = linalg.matmul ins(%2, %arg2 : tensor<?x?xf32>, tensor<?x?xf32>) outs(%4 : tensor<?x?xf32>) -> tensor<?x?xf32>
    return %5 : tensor<?x?xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.matmul"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1:2 = transform.split_handle %0 : (!transform.any_op) -> (!transform.any_op, !transform.any_op)
      %transformed, %loops = transform.structured.fuse %1#1 tile_sizes [10] : (!transform.any_op) -> (!transform.any_op, !transform.any_op)
      transform.yield 
    }
  }
}

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
#map1 = affine_map<(d0, d1) -> (d1, d0)>
module {
  func.func @gemm_transpose_fusion(%arg0: tensor<?x?xf32>, %arg1: tensor<?x?xf32>) -> tensor<?x?xf32> {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %cst = arith.constant 0.000000e+00 : f32
    %dim = tensor.dim %arg0, %c0 : tensor<?x?xf32>
    %dim_0 = tensor.dim %arg1, %c1 : tensor<?x?xf32>
    %0 = tensor.empty(%dim, %dim_0) : tensor<?x?xf32>
    %1 = linalg.fill ins(%cst : f32) outs(%0 : tensor<?x?xf32>) -> tensor<?x?xf32>
    %2 = linalg.matmul ins(%arg0, %arg1 : tensor<?x?xf32>, tensor<?x?xf32>) outs(%1 : tensor<?x?xf32>) -> tensor<?x?xf32>
    %3 = tensor.empty(%dim_0, %dim) : tensor<?x?xf32>
    %4 = linalg.generic {indexing_maps = [#map, #map1], iterator_types = ["parallel", "parallel"]} ins(%2 : tensor<?x?xf32>) outs(%3 : tensor<?x?xf32>) {
    ^bb0(%in: f32, %out: f32):
      linalg.yield %in : f32
    } -> tensor<?x?xf32>
    return %4 : tensor<?x?xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.generic"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %transformed, %loops:2 = transform.structured.fuse %0 tile_sizes [10, 20] : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op)
      transform.yield 
    }
  }
}

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
module {
  func.func @interchange_matmul_fusion(%arg0: tensor<?x?xf32>, %arg1: tensor<?x?xf32>) -> tensor<?x?xf32> {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %dim = tensor.dim %arg0, %c0 : tensor<?x?xf32>
    %dim_0 = tensor.dim %arg1, %c1 : tensor<?x?xf32>
    %cst = arith.constant 0.000000e+00 : f32
    %0 = tensor.empty(%dim, %dim_0) : tensor<?x?xf32>
    %1 = linalg.fill ins(%cst : f32) outs(%0 : tensor<?x?xf32>) -> tensor<?x?xf32>
    %2 = linalg.matmul ins(%arg0, %arg1 : tensor<?x?xf32>, tensor<?x?xf32>) outs(%1 : tensor<?x?xf32>) -> tensor<?x?xf32>
    %3 = linalg.generic {indexing_maps = [#map, #map], iterator_types = ["parallel", "parallel"]} ins(%2 : tensor<?x?xf32>) outs(%0 : tensor<?x?xf32>) {
    ^bb0(%in: f32, %out: f32):
      %4 = arith.addf %in, %in : f32
      linalg.yield %4 : f32
    } -> tensor<?x?xf32>
    return %3 : tensor<?x?xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.generic"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %transformed, %loops:2 = transform.structured.fuse %0 tile_sizes [10, 20] interchange [1, 0] : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op)
      transform.yield 
    }
  }
}

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
module {
  func.func @matmul_plus_matmul(%arg0: tensor<?x?xf32>, %arg1: tensor<?x?xf32>, %arg2: tensor<?x?xf32>) -> tensor<?x?xf32> {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %dim = tensor.dim %arg2, %c0 : tensor<?x?xf32>
    %dim_0 = tensor.dim %arg2, %c1 : tensor<?x?xf32>
    %0 = linalg.matmul ins(%arg0, %arg1 : tensor<?x?xf32>, tensor<?x?xf32>) outs(%arg2 : tensor<?x?xf32>) -> tensor<?x?xf32>
    %dim_1 = tensor.dim %0, %c0 : tensor<?x?xf32>
    %dim_2 = tensor.dim %0, %c1 : tensor<?x?xf32>
    %1 = tensor.empty(%dim_1, %dim_2) : tensor<?x?xf32>
    %2 = linalg.generic {indexing_maps = [#map, #map, #map], iterator_types = ["parallel", "parallel"]} ins(%0, %0 : tensor<?x?xf32>, tensor<?x?xf32>) outs(%1 : tensor<?x?xf32>) {
    ^bb0(%in: f32, %in_3: f32, %out: f32):
      %3 = arith.addf %in, %in_3 : f32
      linalg.yield %3 : f32
    } -> tensor<?x?xf32>
    return %2 : tensor<?x?xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.generic"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %transformed, %loops:2 = transform.structured.fuse %0 tile_sizes [10, 20] : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op)
      transform.yield 
    }
  }
}

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
#map1 = affine_map<(d0, d1) -> (d1, d0)>
module {
  func.func @matmul_plus_transpose_matmul(%arg0: tensor<?x?xf32>, %arg1: tensor<?x?xf32>, %arg2: tensor<?x?xf32>) -> tensor<?x?xf32> {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %dim = tensor.dim %arg2, %c0 : tensor<?x?xf32>
    %dim_0 = tensor.dim %arg2, %c1 : tensor<?x?xf32>
    %0 = linalg.matmul ins(%arg0, %arg1 : tensor<?x?xf32>, tensor<?x?xf32>) outs(%arg2 : tensor<?x?xf32>) -> tensor<?x?xf32>
    %dim_1 = tensor.dim %0, %c0 : tensor<?x?xf32>
    %dim_2 = tensor.dim %0, %c1 : tensor<?x?xf32>
    %1 = tensor.empty(%dim_1, %dim_2) : tensor<?x?xf32>
    %2 = linalg.generic {indexing_maps = [#map, #map1, #map], iterator_types = ["parallel", "parallel"]} ins(%0, %0 : tensor<?x?xf32>, tensor<?x?xf32>) outs(%1 : tensor<?x?xf32>) {
    ^bb0(%in: f32, %in_3: f32, %out: f32):
      %3 = arith.addf %in, %in_3 : f32
      linalg.yield %3 : f32
    } -> tensor<?x?xf32>
    return %2 : tensor<?x?xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.generic"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %transformed, %loops:2 = transform.structured.fuse %0 tile_sizes [10, 20] : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op)
      transform.yield 
    }
  }
}

// -----
module {
  func.func @matmul_sequence_fusion(%arg0: tensor<?x?xf32>, %arg1: tensor<?x?xf32>, %arg2: tensor<?x?xf32>, %arg3: tensor<?x?xf32>, %arg4: tensor<?x?xf32>, %arg5: tensor<?x?xf32>, %arg6: tensor<?x?xf32>) -> tensor<?x?xf32> {
    %0 = linalg.matmul ins(%arg0, %arg1 : tensor<?x?xf32>, tensor<?x?xf32>) outs(%arg2 : tensor<?x?xf32>) -> tensor<?x?xf32>
    %1 = linalg.matmul ins(%0, %arg3 : tensor<?x?xf32>, tensor<?x?xf32>) outs(%arg4 : tensor<?x?xf32>) -> tensor<?x?xf32>
    %2 = linalg.matmul ins(%1, %arg5 : tensor<?x?xf32>, tensor<?x?xf32>) outs(%arg6 : tensor<?x?xf32>) -> tensor<?x?xf32>
    return %2 : tensor<?x?xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.matmul"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1:3 = transform.split_handle %0 : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op)
      %transformed, %loops = transform.structured.fuse %1#2 tile_sizes [10] : (!transform.any_op) -> (!transform.any_op, !transform.any_op)
      transform.yield 
    }
  }
}

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
#map1 = affine_map<(d0, d1) -> (d0)>
module {
  func.func @reduction_sequence(%arg0: tensor<30x3xf32>) -> tensor<30x3xf32> {
    %cst = arith.constant 0.000000e+00 : f32
    %cst_0 = arith.constant 0xFF800000 : f32
    %0 = tensor.empty() : tensor<30xf32>
    %1 = linalg.fill ins(%cst_0 : f32) outs(%0 : tensor<30xf32>) -> tensor<30xf32>
    %2 = linalg.generic {indexing_maps = [#map, #map1], iterator_types = ["parallel", "reduction"]} ins(%arg0 : tensor<30x3xf32>) outs(%1 : tensor<30xf32>) {
    ^bb0(%in: f32, %out: f32):
      %7 = arith.maximumf %out, %in : f32
      linalg.yield %7 : f32
    } -> tensor<30xf32>
    %3 = tensor.empty() : tensor<30x3xf32>
    %4 = linalg.fill ins(%cst : f32) outs(%0 : tensor<30xf32>) -> tensor<30xf32>
    %5:2 = linalg.generic {indexing_maps = [#map, #map1, #map1, #map], iterator_types = ["parallel", "reduction"]} ins(%arg0, %2 : tensor<30x3xf32>, tensor<30xf32>) outs(%4, %3 : tensor<30xf32>, tensor<30x3xf32>) {
    ^bb0(%in: f32, %in_1: f32, %out: f32, %out_2: f32):
      %7 = arith.subf %in, %in_1 : f32
      %8 = math.exp %7 : f32
      %9 = arith.addf %out, %8 : f32
      linalg.yield %9, %8 : f32, f32
    } -> (tensor<30xf32>, tensor<30x3xf32>)
    %6 = linalg.generic {indexing_maps = [#map, #map1, #map], iterator_types = ["parallel", "parallel"]} ins(%5#1, %5#0 : tensor<30x3xf32>, tensor<30xf32>) outs(%3 : tensor<30x3xf32>) {
    ^bb0(%in: f32, %in_1: f32, %out: f32):
      %7 = arith.divf %in, %in_1 : f32
      linalg.yield %7 : f32
    } -> tensor<30x3xf32>
    return %6 : tensor<30x3xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.generic"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1:3 = transform.split_handle %0 : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op)
      %transformed, %loops = transform.structured.fuse %1#2 tile_sizes [10] : (!transform.any_op) -> (!transform.any_op, !transform.any_op)
      transform.yield 
    }
  }
}

// -----
#map = affine_map<(d0) -> (d0)>
module {
  func.func @pad_producer_fusion(%arg0: tensor<10xf32>) -> tensor<16xf32> {
    %0 = tensor.empty() : tensor<10xf32>
    %1 = linalg.generic {indexing_maps = [#map, #map], iterator_types = ["parallel"]} ins(%arg0 : tensor<10xf32>) outs(%0 : tensor<10xf32>) {
    ^bb0(%in: f32, %out: f32):
      %2 = arith.addf %in, %in : f32
      linalg.yield %2 : f32
    } -> tensor<10xf32>
    %cst = arith.constant 0.000000e+00 : f32
    %padded = tensor.pad %1 low[4] high[2] {
    ^bb0(%arg1: index):
      tensor.yield %cst : f32
    } : tensor<10xf32> to tensor<16xf32>
    return %padded : tensor<16xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.generic"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.structured.match ops{["tensor.pad"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %transformed, %loops = transform.structured.fuse %1 tile_sizes [8] : (!transform.any_op) -> (!transform.any_op, !transform.any_op)
      transform.yield 
    }
  }
}

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d1, d2)>
module {
  func.func @imperfect_unpack_producer_fusion(%arg0: tensor<1x1x288x8x4xf32>, %arg1: tensor<1x2x1152xf32>) -> tensor<1x2x1152xf32> {
    %unpack = linalg.unpack %arg0 outer_dims_perm = [0, 1, 2] inner_dims_pos = [1, 2] inner_tiles = [8, 4] into %arg1 : tensor<1x1x288x8x4xf32> -> tensor<1x2x1152xf32>
    %0 = tensor.empty() : tensor<1x2x1152xf32>
    %cst = arith.constant 1.000000e+00 : f32
    %1 = linalg.generic {indexing_maps = [#map, #map], iterator_types = ["parallel", "parallel", "parallel"]} ins(%unpack : tensor<1x2x1152xf32>) outs(%0 : tensor<1x2x1152xf32>) {
    ^bb0(%in: f32, %out: f32):
      %2 = arith.addf %in, %cst : f32
      linalg.yield %2 : f32
    } -> tensor<1x2x1152xf32>
    return %1 : tensor<1x2x1152xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.generic"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %transformed, %loops = transform.structured.fuse %0 tile_sizes [0, 1, 0] : (!transform.any_op) -> (!transform.any_op, !transform.any_op)
      transform.yield 
    }
  }
}

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2, d3)>
#map1 = affine_map<(d0, d1, d2, d3) -> (d0, d3, d2, d1)>
module {
  module {
    func.func private @tile_one_consumer_using_tile_and_fuse(%arg0: tensor<16x128x48x96xf32>, %arg1: tensor<16x96x48x128xf32>) -> tensor<16x96x48x128xf32> {
      %0 = linalg.generic {indexing_maps = [#map, #map1], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} ins(%arg0 : tensor<16x128x48x96xf32>) outs(%arg1 : tensor<16x96x48x128xf32>) {
      ^bb0(%in: f32, %out: f32):
        linalg.yield %in : f32
      } -> tensor<16x96x48x128xf32>
      return %0 : tensor<16x96x48x128xf32>
    }
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.generic"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %transformed, %loops:4 = transform.structured.fuse %0 tile_sizes [1, 16, 16, 16] interchange [0, 1, 2, 3] : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op, !transform.any_op, !transform.any_op)
      transform.yield 
    }
  }
}

