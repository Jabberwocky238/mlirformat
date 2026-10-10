module {
  func.func @fuse_unary(%arg0: tensor<?x?xf32>, %arg1: tensor<?x?xf32>) -> tensor<?x?xf32> {
    %0 = linalg.exp ins(%arg0 : tensor<?x?xf32>) outs(%arg1 : tensor<?x?xf32>) -> tensor<?x?xf32>
    %1 = linalg.add ins(%0, %arg0 : tensor<?x?xf32>, tensor<?x?xf32>) outs(%arg1 : tensor<?x?xf32>) -> tensor<?x?xf32>
    return %1 : tensor<?x?xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.add"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %transformed, %loops:2 = transform.structured.fuse %0 tile_sizes [32, 32] interchange [0, 1] : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op)
      transform.yield 
    }
  }
}

// -----
module {
  func.func @fuse_unary(%arg0: tensor<?x?xf32>, %arg1: tensor<?x?xf32>) -> tensor<?x?xf32> {
    %0 = linalg.exp ins(%arg0 : tensor<?x?xf32>) outs(%arg1 : tensor<?x?xf32>) -> tensor<?x?xf32>
    %1 = linalg.add ins(%0, %arg0 : tensor<?x?xf32>, tensor<?x?xf32>) outs(%arg1 : tensor<?x?xf32>) -> tensor<?x?xf32>
    return %1 : tensor<?x?xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.add"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %transformed, %loops:2 = transform.structured.fuse %0 tile_sizes [32, 32] interchange [0, 1] : (!transform.any_op) -> (!transform.any_op, !transform.op<"scf.for">, !transform.any_op)
      %peeled_loop, %remainder_loop = transform.loop.peel %loops#0 : (!transform.op<"scf.for">) -> (!transform.any_op, !transform.any_op)
      transform.yield 
    }
  }
}

// -----
module {
  func.func @fuse_unary_param(%arg0: tensor<?x?xf32>, %arg1: tensor<?x?xf32>) -> tensor<?x?xf32> {
    %0 = linalg.exp ins(%arg0 : tensor<?x?xf32>) outs(%arg1 : tensor<?x?xf32>) -> tensor<?x?xf32>
    %1 = linalg.add ins(%0, %arg0 : tensor<?x?xf32>, tensor<?x?xf32>) outs(%arg1 : tensor<?x?xf32>) -> tensor<?x?xf32>
    return %1 : tensor<?x?xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.add"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.param.constant 32 : i32 -> !transform.param<i32>
      %2 = transform.param.constant 1 : i32 -> !transform.param<i32>
      %transformed, %loops:2 = transform.structured.fuse %0 tile_sizes [%1, 32] interchange [0, %2] : (!transform.any_op, !transform.param<i32>, !transform.param<i32>) -> (!transform.any_op, !transform.any_op, !transform.any_op)
      transform.yield 
    }
  }
}

// -----
module {
  func.func @fuse_unary_forall(%arg0: tensor<?x?xf32>, %arg1: tensor<?x?xf32>) -> tensor<?x?xf32> {
    %0 = linalg.exp ins(%arg0 : tensor<?x?xf32>) outs(%arg1 : tensor<?x?xf32>) -> tensor<?x?xf32>
    %1 = linalg.add ins(%0, %arg0 : tensor<?x?xf32>, tensor<?x?xf32>) outs(%arg1 : tensor<?x?xf32>) -> tensor<?x?xf32>
    return %1 : tensor<?x?xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.add"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %transformed, %loops = transform.structured.fuse %0 tile_sizes [32, 32] {use_forall} : (!transform.any_op) -> (!transform.any_op, !transform.any_op)
      transform.yield 
    }
  }
}

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d1, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d0, d2)>
module {
  func.func @interchange_reduction(%arg0: tensor<12x7x25xf32>) -> tensor<12x25xf32> {
    %cst = arith.constant 5.000000e+00 : f32
    %0 = tensor.empty() : tensor<12x25xf32>
    %1 = linalg.fill ins(%cst : f32) outs(%0 : tensor<12x25xf32>) -> tensor<12x25xf32>
    %2 = linalg.generic {indexing_maps = [#map, #map1], iterator_types = ["parallel", "reduction", "parallel"]} ins(%arg0 : tensor<12x7x25xf32>) outs(%1 : tensor<12x25xf32>) {
    ^bb0(%in: f32, %out: f32):
      %3 = arith.addf %in, %out : f32
      linalg.yield %3 : f32
    } -> tensor<12x25xf32>
    return %2 : tensor<12x25xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.generic"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %transformed, %loops:2 = transform.structured.fuse %0 tile_sizes [5, 0, 7] interchange [0, 2, 1] : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op)
      %tiled_linalg_op, %loops_0 = transform.structured.tile_using_for %transformed tile_sizes [0, 4] : (!transform.any_op) -> (!transform.any_op, !transform.any_op)
      transform.yield 
    }
  }
}

// -----
module {
  func.func @unpack_elemwise(%arg0: tensor<16x48x8x8xf32>, %arg1: tensor<128x384xf32>) -> tensor<128x384xf32> {
    %0 = tensor.empty() : tensor<128x384xf32>
    %unpack = linalg.unpack %arg0 inner_dims_pos = [0, 1] inner_tiles = [8, 8] into %0 : tensor<16x48x8x8xf32> -> tensor<128x384xf32>
    %1 = linalg.exp ins(%unpack : tensor<128x384xf32>) outs(%arg1 : tensor<128x384xf32>) -> tensor<128x384xf32>
    return %1 : tensor<128x384xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.exp"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %transformed, %loops:2 = transform.structured.fuse %0 tile_sizes [16, 32] interchange [0, 1] : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op)
      transform.yield 
    }
  }
}

// -----
module {
  func.func @pack_elemwise(%arg0: tensor<128x384xf32>, %arg1: tensor<16x48x8x8xf32>) -> tensor<16x48x8x8xf32> {
    %0 = tensor.empty() : tensor<16x48x8x8xf32>
    %pack = linalg.pack %arg0 inner_dims_pos = [0, 1] inner_tiles = [8, 8] into %0 : tensor<128x384xf32> -> tensor<16x48x8x8xf32>
    %1 = linalg.exp ins(%pack : tensor<16x48x8x8xf32>) outs(%arg1 : tensor<16x48x8x8xf32>) -> tensor<16x48x8x8xf32>
    return %1 : tensor<16x48x8x8xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.exp"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %transformed, %loops:2 = transform.structured.fuse %0 tile_sizes [3, 5, 0, 0] : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op)
      transform.yield 
    }
  }
}

// -----
module {
  func.func @nofuse_pack_elemwise(%arg0: tensor<128x384xf32>, %arg1: tensor<16x48x8x8xf32>) -> tensor<16x48x8x8xf32> {
    %0 = tensor.empty() : tensor<16x48x8x8xf32>
    %pack = linalg.pack %arg0 inner_dims_pos = [0, 1] inner_tiles = [8, 8] into %0 : tensor<128x384xf32> -> tensor<16x48x8x8xf32>
    %1 = linalg.exp ins(%pack : tensor<16x48x8x8xf32>) outs(%arg1 : tensor<16x48x8x8xf32>) -> tensor<16x48x8x8xf32>
    return %1 : tensor<16x48x8x8xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.exp"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %transformed, %loops:3 = transform.structured.fuse %0 tile_sizes [3, 5, 2, 0] : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op, !transform.any_op)
      transform.yield 
    }
  }
}

// -----
module {
  func.func @fuse_through_slice(%arg0: tensor<?x?xf32>, %arg1: tensor<?x?xf32>) -> tensor<?x?xf32> {
    %0 = linalg.exp ins(%arg0 : tensor<?x?xf32>) outs(%arg0 : tensor<?x?xf32>) -> tensor<?x?xf32>
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %dim = tensor.dim %arg1, %c0 : tensor<?x?xf32>
    %dim_0 = tensor.dim %arg1, %c1 : tensor<?x?xf32>
    %extracted_slice = tensor.extract_slice %0[1, 1] [%dim, %dim_0] [1, 1] : tensor<?x?xf32> to tensor<?x?xf32>
    %1 = linalg.add ins(%extracted_slice, %arg1 : tensor<?x?xf32>, tensor<?x?xf32>) outs(%arg1 : tensor<?x?xf32>) -> tensor<?x?xf32>
    return %1 : tensor<?x?xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.add"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %transformed, %loops:2 = transform.structured.fuse %0 tile_sizes [32, 32] interchange [0, 1] {apply_cleanup} : (!transform.any_op) -> (!transform.any_op, !transform.op<"scf.for">, !transform.any_op)
      transform.yield 
    }
  }
}

// -----
module {
  func.func @fuse_through_slice_and_cast_chain(%arg0: tensor<100x100xf32>, %arg1: tensor<?x?xf32>) -> tensor<?x?xf32> {
    %0 = linalg.exp ins(%arg0 : tensor<100x100xf32>) outs(%arg0 : tensor<100x100xf32>) -> tensor<100x100xf32>
    %cast = tensor.cast %0 : tensor<100x100xf32> to tensor<100x?xf32>
    %extracted_slice = tensor.extract_slice %cast[1, 1] [98, 98] [1, 1] : tensor<100x?xf32> to tensor<98x98xf32>
    %cast_0 = tensor.cast %extracted_slice : tensor<98x98xf32> to tensor<?x?xf32>
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %dim = tensor.dim %arg1, %c0 : tensor<?x?xf32>
    %dim_1 = tensor.dim %arg1, %c1 : tensor<?x?xf32>
    %extracted_slice_2 = tensor.extract_slice %cast_0[1, 1] [%dim, %dim_1] [1, 1] : tensor<?x?xf32> to tensor<?x?xf32>
    %1 = linalg.add ins(%extracted_slice_2, %arg1 : tensor<?x?xf32>, tensor<?x?xf32>) outs(%arg1 : tensor<?x?xf32>) -> tensor<?x?xf32>
    return %1 : tensor<?x?xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.add"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %transformed, %loops:2 = transform.structured.fuse %0 tile_sizes [32, 32] interchange [0, 1] {apply_cleanup} : (!transform.any_op) -> (!transform.any_op, !transform.op<"scf.for">, !transform.any_op)
      transform.yield 
    }
  }
}

// -----
module {
  func.func @fuse_unrelated_slices(%arg0: tensor<?x?xf32>, %arg1: tensor<?x?xf32>) -> (tensor<?x?xf32>, tensor<10x10xf32>) {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %dim = tensor.dim %arg1, %c0 : tensor<?x?xf32>
    %dim_0 = tensor.dim %arg1, %c1 : tensor<?x?xf32>
    %extracted_slice = tensor.extract_slice %arg0[1, 1] [%dim, %dim_0] [1, 1] : tensor<?x?xf32> to tensor<?x?xf32>
    %extracted_slice_1 = tensor.extract_slice %extracted_slice[1, 1] [10, 10] [1, 1] : tensor<?x?xf32> to tensor<10x10xf32>
    %0 = linalg.exp ins(%arg0 : tensor<?x?xf32>) outs(%arg0 : tensor<?x?xf32>) -> tensor<?x?xf32>
    %extracted_slice_2 = tensor.extract_slice %0[1, 1] [%dim, %dim_0] [1, 1] : tensor<?x?xf32> to tensor<?x?xf32>
    %1 = linalg.add ins(%extracted_slice_2, %arg1 : tensor<?x?xf32>, tensor<?x?xf32>) outs(%arg1 : tensor<?x?xf32>) -> tensor<?x?xf32>
    return %1, %extracted_slice_1 : tensor<?x?xf32>, tensor<10x10xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.add"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %transformed, %loops:2 = transform.structured.fuse %0 tile_sizes [32, 32] interchange [0, 1] {apply_cleanup} : (!transform.any_op) -> (!transform.any_op, !transform.op<"scf.for">, !transform.any_op)
      transform.yield 
    }
  }
}

// -----
module {
  func.func @bubble_up_extract_slice_through_expand_shape(%arg0: tensor<60xf32>) -> tensor<2x3x10xf32> {
    %expanded = tensor.expand_shape %arg0 [[0, 1, 2]] output_shape [2, 3, 10] : tensor<60xf32> into tensor<2x3x10xf32>
    %0 = tensor.empty() : tensor<2x3x10xf32>
    %1 = linalg.exp ins(%expanded : tensor<2x3x10xf32>) outs(%0 : tensor<2x3x10xf32>) -> tensor<2x3x10xf32>
    return %1 : tensor<2x3x10xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.exp"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %transformed, %loops:3 = transform.structured.fuse %0 tile_sizes [1, 1, 5] interchange [0, 1, 2] {apply_cleanup} : (!transform.any_op) -> (!transform.any_op, !transform.op<"scf.for">, !transform.any_op, !transform.any_op)
      transform.yield 
    }
  }
}

// -----
module {
  func.func @bubble_up_extract_slice_through_expand_shape_full_inner_dim(%arg0: tensor<120xf32>) -> tensor<3x4x10xf32> {
    %expanded = tensor.expand_shape %arg0 [[0, 1, 2]] output_shape [3, 4, 10] : tensor<120xf32> into tensor<3x4x10xf32>
    %0 = tensor.empty() : tensor<3x4x10xf32>
    %1 = linalg.exp ins(%expanded : tensor<3x4x10xf32>) outs(%0 : tensor<3x4x10xf32>) -> tensor<3x4x10xf32>
    return %1 : tensor<3x4x10xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.exp"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %transformed, %loops:2 = transform.structured.fuse %0 tile_sizes [1, 2, 0] interchange [0, 1, 2] {apply_cleanup} : (!transform.any_op) -> (!transform.any_op, !transform.op<"scf.for">, !transform.any_op)
      transform.yield 
    }
  }
}

// -----
module {
  func.func @no_bubble_up_extract_slice_through_expand_shape_non_contiguous(%arg0: tensor<120xf32>) -> tensor<3x4x10xf32> {
    %expanded = tensor.expand_shape %arg0 [[0, 1, 2]] output_shape [3, 4, 10] : tensor<120xf32> into tensor<3x4x10xf32>
    %0 = tensor.empty() : tensor<3x4x10xf32>
    %1 = linalg.exp ins(%expanded : tensor<3x4x10xf32>) outs(%0 : tensor<3x4x10xf32>) -> tensor<3x4x10xf32>
    return %1 : tensor<3x4x10xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.exp"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %transformed, %loops:3 = transform.structured.fuse %0 tile_sizes [1, 2, 5] interchange [0, 1, 2] {apply_cleanup} : (!transform.any_op) -> (!transform.any_op, !transform.op<"scf.for">, !transform.any_op, !transform.any_op)
      transform.yield 
    }
  }
}

// -----
module {
  module {
    func.func @bubble_up_extract_slice_through_expand_shape_multiple_expanded_dims(%arg0: tensor<120x56xf32>) -> tensor<3x4x10x7x8xf32> {
      %expanded = tensor.expand_shape %arg0 [[0, 1, 2], [3, 4]] output_shape [3, 4, 10, 7, 8] : tensor<120x56xf32> into tensor<3x4x10x7x8xf32>
      %0 = tensor.empty() : tensor<3x4x10x7x8xf32>
      %1 = linalg.exp ins(%expanded : tensor<3x4x10x7x8xf32>) outs(%0 : tensor<3x4x10x7x8xf32>) -> tensor<3x4x10x7x8xf32>
      return %1 : tensor<3x4x10x7x8xf32>
    }
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.exp"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %transformed, %loops:4 = transform.structured.fuse %0 tile_sizes [1, 2, 0, 1, 4] interchange [0, 1, 2, 3, 4] {apply_cleanup} : (!transform.any_op) -> (!transform.any_op, !transform.op<"scf.for">, !transform.any_op, !transform.any_op, !transform.any_op)
      transform.yield 
    }
  }
}

// -----
module {
  module {
    func.func @bubble_up_extract_slice_through_expand_shape_and_fuse_with_expand_producer(%arg0: tensor<1x1800x256xf32>) -> tensor<1x1800x8x32xf32> {
      %0 = tensor.empty() : tensor<1x1800x256xf32>
      %1 = linalg.abs ins(%arg0 : tensor<1x1800x256xf32>) outs(%0 : tensor<1x1800x256xf32>) -> tensor<1x1800x256xf32>
      %expanded = tensor.expand_shape %1 [[0], [1], [2, 3]] output_shape [1, 1800, 8, 32] : tensor<1x1800x256xf32> into tensor<1x1800x8x32xf32>
      %2 = tensor.empty() : tensor<1x1800x8x32xf32>
      %3 = linalg.exp ins(%expanded : tensor<1x1800x8x32xf32>) outs(%2 : tensor<1x1800x8x32xf32>) -> tensor<1x1800x8x32xf32>
      return %3 : tensor<1x1800x8x32xf32>
    }
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.exp"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %transformed, %loops = transform.structured.fuse %0 tile_sizes [0, 0, 1, 0] interchange [0, 1, 2, 3] {apply_cleanup} : (!transform.any_op) -> (!transform.any_op, !transform.op<"scf.for">)
      transform.yield 
    }
  }
}

// -----
module {
  func.func @no_bubble_up_extract_slice_through_expand_shape_on_cleanup_false(%arg0: tensor<60xf32>) -> tensor<2x3x10xf32> {
    %expanded = tensor.expand_shape %arg0 [[0, 1, 2]] output_shape [2, 3, 10] : tensor<60xf32> into tensor<2x3x10xf32>
    %0 = tensor.empty() : tensor<2x3x10xf32>
    %1 = linalg.exp ins(%expanded : tensor<2x3x10xf32>) outs(%0 : tensor<2x3x10xf32>) -> tensor<2x3x10xf32>
    return %1 : tensor<2x3x10xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.exp"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %transformed, %loops:3 = transform.structured.fuse %0 tile_sizes [1, 1, 5] interchange [0, 1, 2] : (!transform.any_op) -> (!transform.any_op, !transform.op<"scf.for">, !transform.any_op, !transform.any_op)
      transform.yield 
    }
  }
}

// -----
module {
  func.func @bubble_up_extract_slice_through_collapse_shape(%arg0: tensor<1x8x1800x32xf32>) -> tensor<8x1800x32xf32> {
    %collapsed = tensor.collapse_shape %arg0 [[0, 1], [2], [3]] : tensor<1x8x1800x32xf32> into tensor<8x1800x32xf32>
    %0 = tensor.empty() : tensor<8x1800x32xf32>
    %1 = linalg.exp ins(%collapsed : tensor<8x1800x32xf32>) outs(%0 : tensor<8x1800x32xf32>) -> tensor<8x1800x32xf32>
    return %1 : tensor<8x1800x32xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.exp"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %transformed, %loops = transform.structured.fuse %0 tile_sizes [1, 0, 0] interchange [0, 1, 2] {apply_cleanup} : (!transform.any_op) -> (!transform.any_op, !transform.op<"scf.for">)
      transform.yield 
    }
  }
}

// -----
module {
  func.func @bubble_up_extract_slice_through_collapse_shape_with_collapse_producer(%arg0: tensor<1x8x1800x32xf32>) -> tensor<8x1800x32xf32> {
    %0 = tensor.empty() : tensor<1x8x1800x32xf32>
    %1 = linalg.abs ins(%arg0 : tensor<1x8x1800x32xf32>) outs(%0 : tensor<1x8x1800x32xf32>) -> tensor<1x8x1800x32xf32>
    %collapsed = tensor.collapse_shape %1 [[0, 1], [2], [3]] : tensor<1x8x1800x32xf32> into tensor<8x1800x32xf32>
    %2 = tensor.empty() : tensor<8x1800x32xf32>
    %3 = linalg.exp ins(%collapsed : tensor<8x1800x32xf32>) outs(%2 : tensor<8x1800x32xf32>) -> tensor<8x1800x32xf32>
    return %3 : tensor<8x1800x32xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.exp"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %transformed, %loops = transform.structured.fuse %0 tile_sizes [1, 0, 0] interchange [0, 1, 2] {apply_cleanup} : (!transform.any_op) -> (!transform.any_op, !transform.op<"scf.for">)
      transform.yield 
    }
  }
}

