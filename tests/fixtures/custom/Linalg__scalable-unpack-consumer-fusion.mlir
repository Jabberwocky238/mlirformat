#map = affine_map<(d0)[s0, s1] -> (-d0 + s1, s0)>
#map1 = affine_map<(d0, d1) -> (d0, d1)>
module {
  func.func @fuse_scalable_unpack_consumer(%arg0: tensor<32x?xf32>, %arg1: tensor<32x?xf32>, %arg2: tensor<32x?xf32>) -> tensor<?xf32> {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c8 = arith.constant 8 : index
    %vscale = vector.vscale
    %c8_vscale = arith.muli %c8, %vscale : index
    %dim = tensor.dim %arg2, %c1 : tensor<32x?xf32>
    %0 = scf.for %arg3 = %c0 to %dim step %c8_vscale iter_args(%arg4 = %arg2) -> (tensor<32x?xf32>) {
      %2 = affine.min #map(%arg3)[%c8_vscale, %dim]
      %extracted_slice = tensor.extract_slice %arg0[0, %arg3] [32, %2] [1, 1] : tensor<32x?xf32> to tensor<32x?xf32>
      %extracted_slice_0 = tensor.extract_slice %arg1[0, %arg3] [32, %2] [1, 1] : tensor<32x?xf32> to tensor<32x?xf32>
      %extracted_slice_1 = tensor.extract_slice %arg4[0, %arg3] [32, %2] [1, 1] : tensor<32x?xf32> to tensor<32x?xf32>
      %3 = linalg.generic {indexing_maps = [#map1, #map1, #map1], iterator_types = ["parallel", "parallel"]} ins(%extracted_slice, %extracted_slice_0 : tensor<32x?xf32>, tensor<32x?xf32>) outs(%extracted_slice_1 : tensor<32x?xf32>) {
      ^bb0(%in: f32, %in_2: f32, %out: f32):
        %4 = arith.mulf %in, %in_2 : f32
        linalg.yield %4 : f32
      } -> tensor<32x?xf32>
      %inserted_slice = tensor.insert_slice %3 into %arg4[0, %arg3] [32, %2] [1, 1] : tensor<32x?xf32> into tensor<32x?xf32>
      scf.yield %inserted_slice : tensor<32x?xf32>
    }
    %1 = tensor.empty(%dim) : tensor<?xf32>
    %unpack = linalg.unpack %0 outer_dims_perm = [0] inner_dims_pos = [0] inner_tiles = [%c8_vscale] into %1 : tensor<32x?xf32> -> tensor<?xf32>
    return %unpack : tensor<?xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.unpack"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.structured.match ops{["scf.for"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %fused_consumer, %result_loops = transform.test.fuse_consumer %0 into(%1) inner_tile_alignments = [Equal] : (!transform.any_op, !transform.any_op) -> (!transform.any_op, !transform.any_op)
      transform.yield 
    }
    transform.named_sequence @no_hint(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.unpack"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.structured.match ops{["scf.for"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %fused_consumer, %result_loops = transform.test.fuse_consumer %0 into(%1) : (!transform.any_op, !transform.any_op) -> (!transform.any_op, !transform.any_op)
      transform.yield 
    }
    transform.named_sequence @multiple(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.unpack"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.structured.match ops{["scf.for"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %fused_consumer, %result_loops = transform.test.fuse_consumer %0 into(%1) inner_tile_alignments = [Multiple] : (!transform.any_op, !transform.any_op) -> (!transform.any_op, !transform.any_op)
      transform.yield 
    }
  }
}

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2, d3)>
#map1 = affine_map<(d0, d1, d2, d3) -> (d1, d0, d3, d2)>
module {
  func.func @mmt4d_transpose_unpack(%arg0: tensor<2x2x4x2xf32>, %arg1: tensor<2x2x?x2xf32>, %arg2: tensor<2x2x4x?xf32>, %arg3: tensor<2x2x?x4xf32>, %arg4: tensor<2x2x?x4xf32>, %arg5: tensor<?x8xf32>) -> tensor<?x8xf32> {
    %c8 = arith.constant 8 : index
    %vscale = vector.vscale
    %c8_vscale = arith.muli %c8, %vscale : index
    %0 = linalg.mmt4d ins(%arg0, %arg1 : tensor<2x2x4x2xf32>, tensor<2x2x?x2xf32>) outs(%arg2 : tensor<2x2x4x?xf32>) -> tensor<2x2x4x?xf32>
    %1 = linalg.generic {indexing_maps = [#map, #map1, #map1], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} ins(%0, %arg3 : tensor<2x2x4x?xf32>, tensor<2x2x?x4xf32>) outs(%arg4 : tensor<2x2x?x4xf32>) {
    ^bb0(%in: f32, %in_0: f32, %out: f32):
      %2 = arith.addf %in, %in_0 : f32
      linalg.yield %2 : f32
    } -> tensor<2x2x?x4xf32>
    %unpack = linalg.unpack %1 outer_dims_perm = [0, 1] inner_dims_pos = [0, 1] inner_tiles = [%c8_vscale, 4] into %arg5 : tensor<2x2x?x4xf32> -> tensor<?x8xf32>
    return %unpack : tensor<?x8xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.mmt4d"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %tiled_linalg_op, %loops = transform.structured.tile_using_for %0 tile_sizes [0, 0, 0, 0, [8], 0] : (!transform.any_op) -> (!transform.any_op, !transform.any_op)
      %1 = transform.structured.match ops{["linalg.generic"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %fused_consumer, %result_loops = transform.test.fuse_consumer %1 into(%loops) : (!transform.any_op, !transform.any_op) -> (!transform.any_op, !transform.any_op)
      %2 = transform.structured.match ops{["linalg.unpack"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %fused_consumer_0, %result_loops_1 = transform.test.fuse_consumer %2 into(%result_loops) inner_tile_alignments = [Equal, Unknown] : (!transform.any_op, !transform.any_op) -> (!transform.any_op, !transform.any_op)
      transform.yield 
    }
    transform.named_sequence @no_hint(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.mmt4d"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %tiled_linalg_op, %loops = transform.structured.tile_using_for %0 tile_sizes [0, 0, 0, 0, [8], 0] : (!transform.any_op) -> (!transform.any_op, !transform.any_op)
      %1 = transform.structured.match ops{["linalg.generic"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %fused_consumer, %result_loops = transform.test.fuse_consumer %1 into(%loops) : (!transform.any_op, !transform.any_op) -> (!transform.any_op, !transform.any_op)
      %2 = transform.structured.match ops{["linalg.unpack"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %fused_consumer_0, %result_loops_1 = transform.test.fuse_consumer %2 into(%result_loops) : (!transform.any_op, !transform.any_op) -> (!transform.any_op, !transform.any_op)
      transform.yield 
    }
    transform.named_sequence @multiple(%arg0: !transform.any_op {transform.readonly}) {
      transform.yield 
    }
  }
}

