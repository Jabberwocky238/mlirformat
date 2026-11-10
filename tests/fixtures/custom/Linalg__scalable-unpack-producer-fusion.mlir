module {
  func.func @unpack_elemwise_scalable(%arg0: tensor<4x8x?x?xf32>, %arg1: tensor<?x?xf32>, %arg2: index, %arg3: index) -> tensor<?x?xf32> {
    %c4 = arith.constant 4 : index
    %c8 = arith.constant 8 : index
    %c16 = arith.constant 16 : index
    %vscale = vector.vscale
    %c8_vscale = arith.muli %c8, %vscale : index
    %c4_vscale = arith.muli %c4, %vscale : index
    %c16_vscale = arith.muli %c16, %vscale : index
    %0 = tensor.empty(%arg2, %arg3) : tensor<?x?xf32>
    %unpack = linalg.unpack %arg0 inner_dims_pos = [0, 1] inner_tiles = [%c8_vscale, %c4_vscale] into %0 : tensor<4x8x?x?xf32> -> tensor<?x?xf32>
    %1 = linalg.exp ins(%unpack : tensor<?x?xf32>) outs(%arg1 : tensor<?x?xf32>) -> tensor<?x?xf32>
    return %1 : tensor<?x?xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @aligned(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.exp"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.structured.match ops{["arith.muli"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %2:3 = transform.split_handle %1 : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op)
      %transformed, %loops:2 = transform.structured.fuse %0 tile_sizes [%2#2, %2#0] interchange [0, 1] inner_tile_alignments = [Multiple, Multiple] : (!transform.any_op, !transform.any_op, !transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op)
      transform.yield 
    }
    transform.named_sequence @equal(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.exp"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.structured.match ops{["arith.muli"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %2:3 = transform.split_handle %1 : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op)
      %transformed, %loops:2 = transform.structured.fuse %0 tile_sizes [%2#0, %2#1] interchange [0, 1] inner_tile_alignments = [Equal, Equal] : (!transform.any_op, !transform.any_op, !transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op)
      transform.yield 
    }
    transform.named_sequence @unaligned(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.exp"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %transformed, %loops:2 = transform.structured.fuse %0 tile_sizes [7, 5] interchange [0, 1] : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op)
      transform.yield 
    }
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      transform.yield 
    }
  }
}

// -----
module {
  func.func @fuse_unpack_into_containing(%arg0: tensor<?x?x?x?xf32>, %arg1: tensor<?x?xf32>, %arg2: tensor<?x?xf32>, %arg3: index, %arg4: index) -> tensor<?x?xf32> {
    %c4 = arith.constant 4 : index
    %c8 = arith.constant 8 : index
    %vscale = vector.vscale
    %c8_vscale = arith.muli %c8, %vscale : index
    %c4_vscale = arith.muli %c4, %vscale : index
    %c8_vscale_0 = arith.muli %c8, %vscale : index
    %c4_vscale_1 = arith.muli %c4, %vscale : index
    %unpack = linalg.unpack %arg0 inner_dims_pos = [0, 1] inner_tiles = [%c8_vscale, %c4_vscale] into %arg1 : tensor<?x?x?x?xf32> -> tensor<?x?xf32>
    %0 = scf.forall (%arg5, %arg6) = (0, 0) to (%arg3, %arg4) step (%c8_vscale_0, %c4_vscale_1) shared_outs(%arg7 = %arg2) -> (tensor<?x?xf32>) {
      %extracted_slice = tensor.extract_slice %unpack[%arg5, %arg6] [%c8_vscale_0, %c4_vscale_1] [1, 1] : tensor<?x?xf32> to tensor<?x?xf32>
      %extracted_slice_2 = tensor.extract_slice %arg7[%arg5, %arg6] [%c8_vscale_0, %c4_vscale_1] [1, 1] : tensor<?x?xf32> to tensor<?x?xf32>
      %1 = linalg.exp ins(%extracted_slice : tensor<?x?xf32>) outs(%extracted_slice_2 : tensor<?x?xf32>) -> tensor<?x?xf32>
      scf.forall.in_parallel {
        tensor.parallel_insert_slice %1 into %arg7[%arg5, %arg6] [%c8_vscale_0, %c4_vscale_1] [1, 1] : tensor<?x?xf32> into tensor<?x?xf32>
      }
    }
    return %0 : tensor<?x?xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @equal(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.unpack"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.structured.match ops{["scf.forall"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %fused_op, %new_containing_op = transform.structured.fuse_into_containing_op %0 into %1 inner_tile_alignments = [Equal, Equal] : (!transform.any_op, !transform.any_op) -> (!transform.any_op, !transform.any_op)
      transform.yield 
    }
    transform.named_sequence @unaligned(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.unpack"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.structured.match ops{["scf.forall"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %fused_op, %new_containing_op = transform.structured.fuse_into_containing_op %0 into %1 : (!transform.any_op, !transform.any_op) -> (!transform.any_op, !transform.any_op)
      transform.yield 
    }
    transform.named_sequence @aligned(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.unpack"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.structured.match ops{["scf.forall"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %fused_op, %new_containing_op = transform.structured.fuse_into_containing_op %0 into %1 inner_tile_alignments = [Multiple, Multiple] : (!transform.any_op, !transform.any_op) -> (!transform.any_op, !transform.any_op)
      transform.yield 
    }
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      transform.yield 
    }
  }
}

// -----
#map = affine_map<(d0, d1) -> (d1, d0)>
#map1 = affine_map<(d0, d1) -> (d0, d1)>
module {
  func.func @unpack_transposed_consumer_scalable(%arg0: tensor<2x4x?x?xf32>, %arg1: tensor<?x?xf32>, %arg2: index, %arg3: index) -> tensor<?x?xf32> {
    %c4 = arith.constant 4 : index
    %c8 = arith.constant 8 : index
    %c16 = arith.constant 16 : index
    %vscale = vector.vscale
    %c8_vscale = arith.muli %c8, %vscale : index
    %c4_vscale = arith.muli %c4, %vscale : index
    %c4_vscale_0 = arith.muli %c4, %vscale : index
    %c16_vscale = arith.muli %c16, %vscale : index
    %0 = tensor.empty(%arg2, %arg3) : tensor<?x?xf32>
    %unpack = linalg.unpack %arg0 inner_dims_pos = [0, 1] inner_tiles = [%c8_vscale, %c4_vscale] into %0 : tensor<2x4x?x?xf32> -> tensor<?x?xf32>
    %1 = linalg.generic {indexing_maps = [#map, #map1], iterator_types = ["parallel", "parallel"]} ins(%unpack : tensor<?x?xf32>) outs(%arg1 : tensor<?x?xf32>) {
    ^bb0(%in: f32, %out: f32):
      linalg.yield %in : f32
    } -> tensor<?x?xf32>
    return %1 : tensor<?x?xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.generic"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.structured.match ops{["arith.muli"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %2:4 = transform.split_handle %1 : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op, !transform.any_op)
      %transformed, %loops:2 = transform.structured.fuse %0 tile_sizes [%2#2, %2#3] inner_tile_alignments = [Multiple, Equal] : (!transform.any_op, !transform.any_op, !transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op)
      transform.yield 
    }
    transform.named_sequence @aligned(%arg0: !transform.any_op {transform.readonly}) {
      transform.yield 
    }
    transform.named_sequence @equal(%arg0: !transform.any_op {transform.readonly}) {
      transform.yield 
    }
    transform.named_sequence @unaligned(%arg0: !transform.any_op {transform.readonly}) {
      transform.yield 
    }
  }
}

// -----
module {
  func.func @fuse_unpack_through_block_arg(%arg0: tensor<?x?x?x?xf32>, %arg1: tensor<?x?xf32>, %arg2: index, %arg3: index) -> tensor<?x?xf32> {
    %c4 = arith.constant 4 : index
    %c8 = arith.constant 8 : index
    %vscale = vector.vscale
    %c8_vscale = arith.muli %c8, %vscale : index
    %c4_vscale = arith.muli %c4, %vscale : index
    %unpack = linalg.unpack %arg0 inner_dims_pos = [0, 1] inner_tiles = [%c8_vscale, %c4_vscale] into %arg1 : tensor<?x?x?x?xf32> -> tensor<?x?xf32>
    %0 = scf.forall (%arg4, %arg5) = (0, 0) to (%arg2, %arg3) step (%c8_vscale, %c4_vscale) shared_outs(%arg6 = %unpack) -> (tensor<?x?xf32>) {
      %extracted_slice = tensor.extract_slice %arg6[%arg4, %arg5] [%c8_vscale, %c4_vscale] [1, 1] : tensor<?x?xf32> to tensor<?x?xf32>
      %1 = linalg.exp ins(%extracted_slice : tensor<?x?xf32>) outs(%extracted_slice : tensor<?x?xf32>) -> tensor<?x?xf32>
      scf.forall.in_parallel {
        tensor.parallel_insert_slice %1 into %arg6[%arg4, %arg5] [%c8_vscale, %c4_vscale] [1, 1] : tensor<?x?xf32> into tensor<?x?xf32>
      }
    }
    return %0 : tensor<?x?xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.unpack"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.structured.match ops{["scf.forall"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %fused_op, %new_containing_op = transform.structured.fuse_into_containing_op %0 into %1 inner_tile_alignments = [Equal, Equal] : (!transform.any_op, !transform.any_op) -> (!transform.any_op, !transform.any_op)
      transform.yield 
    }
    transform.named_sequence @aligned(%arg0: !transform.any_op {transform.readonly}) {
      transform.yield 
    }
    transform.named_sequence @equal(%arg0: !transform.any_op {transform.readonly}) {
      transform.yield 
    }
    transform.named_sequence @unaligned(%arg0: !transform.any_op {transform.readonly}) {
      transform.yield 
    }
  }
}

