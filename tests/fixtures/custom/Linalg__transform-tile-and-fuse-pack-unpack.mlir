#map = affine_map<(d0, d1, d2, d3) -> (0, 0, d2, d3)>
#map1 = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2, d3)>
module {
  func.func @fuse_pack_as_producer(%arg0: tensor<128x256xf32>, %arg1: tensor<4x4x128x256xf32>) -> tensor<4x4x128x256xf32> {
    %0 = tensor.empty() : tensor<1x1x128x256xf32>
    %pack = linalg.pack %arg0 inner_dims_pos = [0, 1] inner_tiles = [128, 256] into %0 : tensor<128x256xf32> -> tensor<1x1x128x256xf32>
    %1 = tensor.empty() : tensor<4x4x128x256xf32>
    %2 = linalg.generic {indexing_maps = [#map, #map1, #map1], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} ins(%pack, %arg1 : tensor<1x1x128x256xf32>, tensor<4x4x128x256xf32>) outs(%1 : tensor<4x4x128x256xf32>) {
    ^bb0(%in: f32, %in_0: f32, %out: f32):
      %3 = arith.addf %in, %in_0 : f32
      linalg.yield %3 : f32
    } -> tensor<4x4x128x256xf32>
    return %2 : tensor<4x4x128x256xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.pack"]} in %arg0 : (!transform.any_op) -> !transform.op<"linalg.pack">
      %pad_op, %expand_shape_op, %transpose_op = transform.structured.lower_pack %0 {lowerPadLikeWithInsertSlice = false} : (!transform.op<"linalg.pack">) -> (!transform.op<"tensor.pad">, !transform.op<"tensor.expand_shape">, !transform.op<"linalg.transpose">)
      %1 = transform.structured.match ops{["linalg.generic"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %tiled_op, %forall_op = transform.structured.tile_using_forall %1 num_threads [4, 4] : (!transform.any_op) -> (!transform.any_op, !transform.any_op)
      %fused_op, %new_containing_op = transform.structured.fuse_into_containing_op %transpose_op into %forall_op : (!transform.op<"linalg.transpose">, !transform.any_op) -> (!transform.any_op, !transform.any_op)
      transform.yield 
    }
  }
}

// -----
#map = affine_map<(d0, d1, d2, d3) -> (0, 0, d2, d3)>
#map1 = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2, d3)>
module {
  func.func @fuse_pack_as_producer_blocked_by_insert_slice(%arg0: tensor<128x256xf32>, %arg1: tensor<4x4x128x256xf32>) -> tensor<4x4x128x256xf32> {
    %0 = tensor.empty() : tensor<1x1x128x256xf32>
    %pack = linalg.pack %arg0 inner_dims_pos = [0, 1] inner_tiles = [128, 256] into %0 : tensor<128x256xf32> -> tensor<1x1x128x256xf32>
    %1 = tensor.empty() : tensor<4x4x128x256xf32>
    %2 = linalg.generic {indexing_maps = [#map, #map1, #map1], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} ins(%pack, %arg1 : tensor<1x1x128x256xf32>, tensor<4x4x128x256xf32>) outs(%1 : tensor<4x4x128x256xf32>) {
    ^bb0(%in: f32, %in_0: f32, %out: f32):
      %3 = arith.addf %in, %in_0 : f32
      linalg.yield %3 : f32
    } -> tensor<4x4x128x256xf32>
    return %2 : tensor<4x4x128x256xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.pack"]} in %arg0 : (!transform.any_op) -> !transform.op<"linalg.pack">
      %pad_op, %expand_shape_op, %transpose_op = transform.structured.lower_pack %0 : (!transform.op<"linalg.pack">) -> (!transform.op<"tensor.pad">, !transform.op<"tensor.expand_shape">, !transform.op<"linalg.transpose">)
      %1 = transform.structured.match ops{["linalg.generic"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %tiled_op, %forall_op = transform.structured.tile_using_forall %1 num_threads [4, 4] : (!transform.any_op) -> (!transform.any_op, !transform.any_op)
      %fused_op, %new_containing_op = transform.structured.fuse_into_containing_op %transpose_op into %forall_op : (!transform.op<"linalg.transpose">, !transform.any_op) -> (!transform.any_op, !transform.any_op)
      transform.yield 
    }
  }
}

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2, d3)>
#map1 = affine_map<(d0, d1, d2, d3) -> (0, 0, d2, d3)>
module {
  func.func @fuse_unpack_as_consumer(%arg0: tensor<4x4x128x256xf32>, %arg1: tensor<4x4x128x256xf32>) -> tensor<128x256xf32> {
    %0 = tensor.empty() : tensor<1x1x128x256xf32>
    %1 = linalg.generic {indexing_maps = [#map, #map, #map1], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} ins(%arg0, %arg1 : tensor<4x4x128x256xf32>, tensor<4x4x128x256xf32>) outs(%0 : tensor<1x1x128x256xf32>) {
    ^bb0(%in: f32, %in_0: f32, %out: f32):
      %3 = arith.addf %in, %in_0 : f32
      linalg.yield %3 : f32
    } -> tensor<1x1x128x256xf32>
    %2 = tensor.empty() : tensor<128x256xf32>
    %unpack = linalg.unpack %1 inner_dims_pos = [0, 1] inner_tiles = [128, 256] into %2 : tensor<1x1x128x256xf32> -> tensor<128x256xf32>
    return %unpack : tensor<128x256xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.unpack"]} in %arg0 : (!transform.any_op) -> !transform.op<"linalg.unpack">
      %empty_op, %transpose_op, %collapse_shape_op, %extract_slice_op = transform.structured.lower_unpack %0 {lowerUnpadLikeWithExtractSlice = false} : (!transform.op<"linalg.unpack">) -> (!transform.op<"tensor.empty">, !transform.op<"linalg.transpose">, !transform.op<"tensor.collapse_shape">, !transform.op<"tensor.extract_slice">)
      %1 = transform.structured.match ops{["linalg.generic"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %tiled_op, %forall_op = transform.structured.tile_using_forall %1 num_threads [4, 4] : (!transform.any_op) -> (!transform.any_op, !transform.any_op)
      %2 = transform.structured.match ops{["tensor.parallel_insert_slice"]} in %forall_op : (!transform.any_op) -> !transform.op<"tensor.parallel_insert_slice">
      %consumer, %fused_consumer = transform.test.fuse_consumer_using_slice %2 in(%forall_op) : (!transform.op<"tensor.parallel_insert_slice">, !transform.any_op) -> (!transform.any_op, !transform.any_op)
      transform.yield 
    }
  }
}

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2, d3)>
#map1 = affine_map<(d0, d1, d2, d3) -> (0, 0, d2, d3)>
module {
  func.func @fuse_unpack_as_consumer_blocked_by_extract_slice(%arg0: tensor<4x4x128x256xf32>, %arg1: tensor<4x4x128x256xf32>) -> tensor<128x256xf32> {
    %0 = tensor.empty() : tensor<1x1x128x256xf32>
    %1 = linalg.generic {indexing_maps = [#map, #map, #map1], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} ins(%arg0, %arg1 : tensor<4x4x128x256xf32>, tensor<4x4x128x256xf32>) outs(%0 : tensor<1x1x128x256xf32>) {
    ^bb0(%in: f32, %in_0: f32, %out: f32):
      %3 = arith.addf %in, %in_0 : f32
      linalg.yield %3 : f32
    } -> tensor<1x1x128x256xf32>
    %2 = tensor.empty() : tensor<128x256xf32>
    %unpack = linalg.unpack %1 inner_dims_pos = [0, 1] inner_tiles = [128, 256] into %2 : tensor<1x1x128x256xf32> -> tensor<128x256xf32>
    return %unpack : tensor<128x256xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.unpack"]} in %arg0 : (!transform.any_op) -> !transform.op<"linalg.unpack">
      %empty_op, %transpose_op, %collapse_shape_op, %extract_slice_op = transform.structured.lower_unpack %0 : (!transform.op<"linalg.unpack">) -> (!transform.op<"tensor.empty">, !transform.op<"linalg.transpose">, !transform.op<"tensor.collapse_shape">, !transform.op<"tensor.extract_slice">)
      %1 = transform.structured.match ops{["linalg.generic"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %tiled_op, %forall_op = transform.structured.tile_using_forall %1 num_threads [4, 4] : (!transform.any_op) -> (!transform.any_op, !transform.any_op)
      %2 = transform.structured.match ops{["tensor.parallel_insert_slice"]} in %forall_op : (!transform.any_op) -> !transform.op<"tensor.parallel_insert_slice">
      transform.yield 
    }
  }
}

