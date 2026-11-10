#map = affine_map<(d0)[s0] -> (-d0 + 256, s0)>
#map1 = affine_map<(d0, d1) -> (d0, d1)>
module {
  func.func @fuse_scalable_pack_consumer_equal(%arg0: tensor<256x128xf32>, %arg1: tensor<256x128xf32>, %arg2: tensor<256x128xf32>, %arg3: tensor<?x?x?x?xf32>) -> tensor<?x?x?x?xf32> {
    %c0 = arith.constant 0 : index
    %c4 = arith.constant 4 : index
    %c8 = arith.constant 8 : index
    %c256 = arith.constant 256 : index
    %vscale = vector.vscale
    %c4_vscale = arith.muli %c4, %vscale : index
    %c8_vscale = arith.muli %c8, %vscale : index
    %0 = scf.for %arg4 = %c0 to %c256 step %c8_vscale iter_args(%arg5 = %arg2) -> (tensor<256x128xf32>) {
      %1 = affine.min #map(%arg4)[%c8_vscale]
      %extracted_slice = tensor.extract_slice %arg5[%arg4, 0] [%1, 128] [1, 1] : tensor<256x128xf32> to tensor<?x128xf32>
      %extracted_slice_0 = tensor.extract_slice %arg0[%arg4, 0] [%1, 128] [1, 1] : tensor<256x128xf32> to tensor<?x128xf32>
      %extracted_slice_1 = tensor.extract_slice %arg1[%arg4, 0] [%1, 128] [1, 1] : tensor<256x128xf32> to tensor<?x128xf32>
      %2 = linalg.generic {indexing_maps = [#map1, #map1, #map1], iterator_types = ["parallel", "parallel"]} ins(%extracted_slice_0, %extracted_slice_1 : tensor<?x128xf32>, tensor<?x128xf32>) outs(%extracted_slice : tensor<?x128xf32>) {
      ^bb0(%in: f32, %in_2: f32, %out: f32):
        %3 = arith.mulf %in, %in_2 : f32
        linalg.yield %3 : f32
      } -> tensor<?x128xf32>
      %inserted_slice = tensor.insert_slice %2 into %arg5[%arg4, 0] [%1, 128] [1, 1] : tensor<?x128xf32> into tensor<256x128xf32>
      scf.yield %inserted_slice : tensor<256x128xf32>
    }
    %pack = linalg.pack %0 outer_dims_perm = [0, 1] inner_dims_pos = [0, 1] inner_tiles = [%c8_vscale, %c4_vscale] into %arg3 : tensor<256x128xf32> -> tensor<?x?x?x?xf32>
    return %pack : tensor<?x?x?x?xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.pack"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.structured.match ops{["scf.for"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %fused_consumer, %result_loops = transform.test.fuse_consumer %0 into(%1) inner_tile_alignments = [Equal, Unknown] : (!transform.any_op, !transform.any_op) -> (!transform.any_op, !transform.any_op)
      transform.yield 
    }
  }
}

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
module {
  func.func @fuse_scalable_pack_consumer_aligned(%arg0: tensor<256x128xf32>, %arg1: tensor<256x128xf32>, %arg2: tensor<256x128xf32>, %arg3: tensor<?x?x?x?xf32>) -> tensor<?x?x?x?xf32> {
    %c0 = arith.constant 0 : index
    %c4 = arith.constant 4 : index
    %c8 = arith.constant 8 : index
    %c64 = arith.constant 64 : index
    %c256 = arith.constant 256 : index
    %vscale = vector.vscale
    %c4_vscale = arith.muli %c4, %vscale : index
    %c8_vscale = arith.muli %c8, %vscale : index
    %0 = scf.for %arg4 = %c0 to %c256 step %c64 iter_args(%arg5 = %arg2) -> (tensor<256x128xf32>) {
      %extracted_slice = tensor.extract_slice %arg5[%arg4, 0] [64, 128] [1, 1] : tensor<256x128xf32> to tensor<64x128xf32>
      %extracted_slice_0 = tensor.extract_slice %arg0[%arg4, 0] [64, 128] [1, 1] : tensor<256x128xf32> to tensor<64x128xf32>
      %extracted_slice_1 = tensor.extract_slice %arg1[%arg4, 0] [64, 128] [1, 1] : tensor<256x128xf32> to tensor<64x128xf32>
      %1 = linalg.generic {indexing_maps = [#map, #map, #map], iterator_types = ["parallel", "parallel"]} ins(%extracted_slice_0, %extracted_slice_1 : tensor<64x128xf32>, tensor<64x128xf32>) outs(%extracted_slice : tensor<64x128xf32>) {
      ^bb0(%in: f32, %in_2: f32, %out: f32):
        %2 = arith.mulf %in, %in_2 : f32
        linalg.yield %2 : f32
      } -> tensor<64x128xf32>
      %inserted_slice = tensor.insert_slice %1 into %arg5[%arg4, 0] [64, 128] [1, 1] : tensor<64x128xf32> into tensor<256x128xf32>
      scf.yield %inserted_slice : tensor<256x128xf32>
    }
    %pack = linalg.pack %0 outer_dims_perm = [0, 1] inner_dims_pos = [0, 1] inner_tiles = [%c8_vscale, %c4_vscale] into %arg3 : tensor<256x128xf32> -> tensor<?x?x?x?xf32>
    return %pack : tensor<?x?x?x?xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.pack"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.structured.match ops{["scf.for"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %fused_consumer, %result_loops = transform.test.fuse_consumer %0 into(%1) inner_tile_alignments = [Multiple, Unknown] : (!transform.any_op, !transform.any_op) -> (!transform.any_op, !transform.any_op)
      transform.yield 
    }
  }
}

// -----
#map = affine_map<(d0)[s0] -> (-d0 + 256, s0)>
#map1 = affine_map<(d0, d1) -> (d0, d1)>
module {
  func.func @fuse_scalable_pack_consumer_aligned_scalable(%arg0: tensor<256x128xf32>, %arg1: tensor<256x128xf32>, %arg2: tensor<256x128xf32>, %arg3: tensor<?x?x?x?xf32>) -> tensor<?x?x?x?xf32> {
    %c0 = arith.constant 0 : index
    %c4 = arith.constant 4 : index
    %c8 = arith.constant 8 : index
    %c256 = arith.constant 256 : index
    %vscale = vector.vscale
    %c4_vscale = arith.muli %c4, %vscale : index
    %c8_vscale = arith.muli %c8, %vscale : index
    %0 = scf.for %arg4 = %c0 to %c256 step %c8_vscale iter_args(%arg5 = %arg2) -> (tensor<256x128xf32>) {
      %1 = affine.min #map(%arg4)[%c8_vscale]
      %extracted_slice = tensor.extract_slice %arg5[%arg4, 0] [%1, 128] [1, 1] : tensor<256x128xf32> to tensor<?x128xf32>
      %extracted_slice_0 = tensor.extract_slice %arg0[%arg4, 0] [%1, 128] [1, 1] : tensor<256x128xf32> to tensor<?x128xf32>
      %extracted_slice_1 = tensor.extract_slice %arg1[%arg4, 0] [%1, 128] [1, 1] : tensor<256x128xf32> to tensor<?x128xf32>
      %2 = linalg.generic {indexing_maps = [#map1, #map1, #map1], iterator_types = ["parallel", "parallel"]} ins(%extracted_slice_0, %extracted_slice_1 : tensor<?x128xf32>, tensor<?x128xf32>) outs(%extracted_slice : tensor<?x128xf32>) {
      ^bb0(%in: f32, %in_2: f32, %out: f32):
        %3 = arith.mulf %in, %in_2 : f32
        linalg.yield %3 : f32
      } -> tensor<?x128xf32>
      %inserted_slice = tensor.insert_slice %2 into %arg5[%arg4, 0] [%1, 128] [1, 1] : tensor<?x128xf32> into tensor<256x128xf32>
      scf.yield %inserted_slice : tensor<256x128xf32>
    }
    %pack = linalg.pack %0 outer_dims_perm = [0, 1] inner_dims_pos = [0, 1] inner_tiles = [%c4_vscale, %c4_vscale] into %arg3 : tensor<256x128xf32> -> tensor<?x?x?x?xf32>
    return %pack : tensor<?x?x?x?xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.pack"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.structured.match ops{["scf.for"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %fused_consumer, %result_loops = transform.test.fuse_consumer %0 into(%1) inner_tile_alignments = [Multiple, Unknown] : (!transform.any_op, !transform.any_op) -> (!transform.any_op, !transform.any_op)
      transform.yield 
    }
  }
}

// -----
#map = affine_map<(d0)[s0] -> (-d0 + 256, s0)>
#map1 = affine_map<(d0, d1) -> (d0, d1)>
module {
  func.func @fuse_pack_consumer_transposed_outer(%arg0: tensor<256x128xf32>, %arg1: tensor<256x128xf32>, %arg2: tensor<256x128xf32>, %arg3: tensor<?x?x?x?xf32>) -> tensor<?x?x?x?xf32> {
    %c0 = arith.constant 0 : index
    %c4 = arith.constant 4 : index
    %c8 = arith.constant 8 : index
    %c256 = arith.constant 256 : index
    %vscale = vector.vscale
    %c4_vscale = arith.muli %c4, %vscale : index
    %c8_vscale = arith.muli %c8, %vscale : index
    %0 = scf.for %arg4 = %c0 to %c256 step %c8_vscale iter_args(%arg5 = %arg2) -> (tensor<256x128xf32>) {
      %1 = affine.min #map(%arg4)[%c8_vscale]
      %extracted_slice = tensor.extract_slice %arg5[%arg4, 0] [%1, 128] [1, 1] : tensor<256x128xf32> to tensor<?x128xf32>
      %extracted_slice_0 = tensor.extract_slice %arg0[%arg4, 0] [%1, 128] [1, 1] : tensor<256x128xf32> to tensor<?x128xf32>
      %extracted_slice_1 = tensor.extract_slice %arg1[%arg4, 0] [%1, 128] [1, 1] : tensor<256x128xf32> to tensor<?x128xf32>
      %2 = linalg.generic {indexing_maps = [#map1, #map1, #map1], iterator_types = ["parallel", "parallel"]} ins(%extracted_slice_0, %extracted_slice_1 : tensor<?x128xf32>, tensor<?x128xf32>) outs(%extracted_slice : tensor<?x128xf32>) {
      ^bb0(%in: f32, %in_2: f32, %out: f32):
        %3 = arith.mulf %in, %in_2 : f32
        linalg.yield %3 : f32
      } -> tensor<?x128xf32>
      %inserted_slice = tensor.insert_slice %2 into %arg5[%arg4, 0] [%1, 128] [1, 1] : tensor<?x128xf32> into tensor<256x128xf32>
      scf.yield %inserted_slice : tensor<256x128xf32>
    }
    %pack = linalg.pack %0 outer_dims_perm = [1, 0] inner_dims_pos = [0, 1] inner_tiles = [%c8_vscale, %c4_vscale] into %arg3 : tensor<256x128xf32> -> tensor<?x?x?x?xf32>
    return %pack : tensor<?x?x?x?xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.pack"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.structured.match ops{["scf.for"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %fused_consumer, %result_loops = transform.test.fuse_consumer %0 into(%1) inner_tile_alignments = [Equal, Unknown] : (!transform.any_op, !transform.any_op) -> (!transform.any_op, !transform.any_op)
      transform.yield 
    }
  }
}

