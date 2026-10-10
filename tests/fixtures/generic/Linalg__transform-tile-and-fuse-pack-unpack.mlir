#map = affine_map<(d0, d1, d2, d3) -> (0, 0, d2, d3)>
#map1 = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2, d3)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<128x256xf32>, tensor<4x4x128x256xf32>) -> tensor<4x4x128x256xf32>, sym_name = "fuse_pack_as_producer"}> ({
  ^bb0(%arg1: tensor<128x256xf32>, %arg2: tensor<4x4x128x256xf32>):
    %5 = "tensor.empty"() : () -> tensor<1x1x128x256xf32>
    %6 = "linalg.pack"(%arg1, %5) <{inner_dims_pos = array<i64: 0, 1>, operandSegmentSizes = array<i32: 1, 1, 0, 0>, static_inner_tiles = array<i64: 128, 256>}> : (tensor<128x256xf32>, tensor<1x1x128x256xf32>) -> tensor<1x1x128x256xf32>
    %7 = "tensor.empty"() : () -> tensor<4x4x128x256xf32>
    %8 = "linalg.generic"(%6, %arg2, %7) <{indexing_maps = [#map, #map1, #map1], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg3: f32, %arg4: f32, %arg5: f32):
      %9 = "arith.addf"(%arg3, %arg4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%9) : (f32) -> ()
    }) : (tensor<1x1x128x256xf32>, tensor<4x4x128x256xf32>, tensor<4x4x128x256xf32>) -> tensor<4x4x128x256xf32>
    "func.return"(%8) : (tensor<4x4x128x256xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.pack"]}> : (!transform.any_op) -> !transform.op<"linalg.pack">
      %1:3 = "transform.structured.lower_pack"(%0) <{lowerPadLikeWithInsertSlice = false}> : (!transform.op<"linalg.pack">) -> (!transform.op<"tensor.pad">, !transform.op<"tensor.expand_shape">, !transform.op<"linalg.transpose">)
      %2 = "transform.structured.match"(%arg0) <{ops = ["linalg.generic"]}> : (!transform.any_op) -> !transform.any_op
      %3:2 = "transform.structured.tile_using_forall"(%2) <{operandSegmentSizes = array<i32: 1, 0, 0, 0, 0>, static_num_threads = array<i64: 4, 4>}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op)
      %4:2 = "transform.structured.fuse_into_containing_op"(%1#2, %3#1) : (!transform.op<"linalg.transpose">, !transform.any_op) -> (!transform.any_op, !transform.any_op)
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3) -> (0, 0, d2, d3)>
#map1 = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2, d3)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<128x256xf32>, tensor<4x4x128x256xf32>) -> tensor<4x4x128x256xf32>, sym_name = "fuse_pack_as_producer_blocked_by_insert_slice"}> ({
  ^bb0(%arg1: tensor<128x256xf32>, %arg2: tensor<4x4x128x256xf32>):
    %5 = "tensor.empty"() : () -> tensor<1x1x128x256xf32>
    %6 = "linalg.pack"(%arg1, %5) <{inner_dims_pos = array<i64: 0, 1>, operandSegmentSizes = array<i32: 1, 1, 0, 0>, static_inner_tiles = array<i64: 128, 256>}> : (tensor<128x256xf32>, tensor<1x1x128x256xf32>) -> tensor<1x1x128x256xf32>
    %7 = "tensor.empty"() : () -> tensor<4x4x128x256xf32>
    %8 = "linalg.generic"(%6, %arg2, %7) <{indexing_maps = [#map, #map1, #map1], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg3: f32, %arg4: f32, %arg5: f32):
      %9 = "arith.addf"(%arg3, %arg4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%9) : (f32) -> ()
    }) : (tensor<1x1x128x256xf32>, tensor<4x4x128x256xf32>, tensor<4x4x128x256xf32>) -> tensor<4x4x128x256xf32>
    "func.return"(%8) : (tensor<4x4x128x256xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.pack"]}> : (!transform.any_op) -> !transform.op<"linalg.pack">
      %1:3 = "transform.structured.lower_pack"(%0) <{lowerPadLikeWithInsertSlice = true}> : (!transform.op<"linalg.pack">) -> (!transform.op<"tensor.pad">, !transform.op<"tensor.expand_shape">, !transform.op<"linalg.transpose">)
      %2 = "transform.structured.match"(%arg0) <{ops = ["linalg.generic"]}> : (!transform.any_op) -> !transform.any_op
      %3:2 = "transform.structured.tile_using_forall"(%2) <{operandSegmentSizes = array<i32: 1, 0, 0, 0, 0>, static_num_threads = array<i64: 4, 4>}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op)
      %4:2 = "transform.structured.fuse_into_containing_op"(%1#2, %3#1) : (!transform.op<"linalg.transpose">, !transform.any_op) -> (!transform.any_op, !transform.any_op)
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2, d3)>
#map1 = affine_map<(d0, d1, d2, d3) -> (0, 0, d2, d3)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<4x4x128x256xf32>, tensor<4x4x128x256xf32>) -> tensor<128x256xf32>, sym_name = "fuse_unpack_as_consumer"}> ({
  ^bb0(%arg1: tensor<4x4x128x256xf32>, %arg2: tensor<4x4x128x256xf32>):
    %6 = "tensor.empty"() : () -> tensor<1x1x128x256xf32>
    %7 = "linalg.generic"(%arg1, %arg2, %6) <{indexing_maps = [#map, #map, #map1], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg3: f32, %arg4: f32, %arg5: f32):
      %10 = "arith.addf"(%arg3, %arg4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%10) : (f32) -> ()
    }) : (tensor<4x4x128x256xf32>, tensor<4x4x128x256xf32>, tensor<1x1x128x256xf32>) -> tensor<1x1x128x256xf32>
    %8 = "tensor.empty"() : () -> tensor<128x256xf32>
    %9 = "linalg.unpack"(%7, %8) <{inner_dims_pos = array<i64: 0, 1>, static_inner_tiles = array<i64: 128, 256>}> : (tensor<1x1x128x256xf32>, tensor<128x256xf32>) -> tensor<128x256xf32>
    "func.return"(%9) : (tensor<128x256xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.unpack"]}> : (!transform.any_op) -> !transform.op<"linalg.unpack">
      %1:4 = "transform.structured.lower_unpack"(%0) <{lowerUnpadLikeWithExtractSlice = false}> : (!transform.op<"linalg.unpack">) -> (!transform.op<"tensor.empty">, !transform.op<"linalg.transpose">, !transform.op<"tensor.collapse_shape">, !transform.op<"tensor.extract_slice">)
      %2 = "transform.structured.match"(%arg0) <{ops = ["linalg.generic"]}> : (!transform.any_op) -> !transform.any_op
      %3:2 = "transform.structured.tile_using_forall"(%2) <{operandSegmentSizes = array<i32: 1, 0, 0, 0, 0>, static_num_threads = array<i64: 4, 4>}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op)
      %4 = "transform.structured.match"(%3#1) <{ops = ["tensor.parallel_insert_slice"]}> : (!transform.any_op) -> !transform.op<"tensor.parallel_insert_slice">
      %5:2 = "transform.test.fuse_consumer_using_slice"(%4, %3#1) <{num_consumer_to_fuse = 1 : i32, operandSegmentSizes = array<i32: 1, 1>}> : (!transform.op<"tensor.parallel_insert_slice">, !transform.any_op) -> (!transform.any_op, !transform.any_op)
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2, d3)>
#map1 = affine_map<(d0, d1, d2, d3) -> (0, 0, d2, d3)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<4x4x128x256xf32>, tensor<4x4x128x256xf32>) -> tensor<128x256xf32>, sym_name = "fuse_unpack_as_consumer_blocked_by_extract_slice"}> ({
  ^bb0(%arg1: tensor<4x4x128x256xf32>, %arg2: tensor<4x4x128x256xf32>):
    %5 = "tensor.empty"() : () -> tensor<1x1x128x256xf32>
    %6 = "linalg.generic"(%arg1, %arg2, %5) <{indexing_maps = [#map, #map, #map1], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg3: f32, %arg4: f32, %arg5: f32):
      %9 = "arith.addf"(%arg3, %arg4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%9) : (f32) -> ()
    }) : (tensor<4x4x128x256xf32>, tensor<4x4x128x256xf32>, tensor<1x1x128x256xf32>) -> tensor<1x1x128x256xf32>
    %7 = "tensor.empty"() : () -> tensor<128x256xf32>
    %8 = "linalg.unpack"(%6, %7) <{inner_dims_pos = array<i64: 0, 1>, static_inner_tiles = array<i64: 128, 256>}> : (tensor<1x1x128x256xf32>, tensor<128x256xf32>) -> tensor<128x256xf32>
    "func.return"(%8) : (tensor<128x256xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.unpack"]}> : (!transform.any_op) -> !transform.op<"linalg.unpack">
      %1:4 = "transform.structured.lower_unpack"(%0) <{lowerUnpadLikeWithExtractSlice = true}> : (!transform.op<"linalg.unpack">) -> (!transform.op<"tensor.empty">, !transform.op<"linalg.transpose">, !transform.op<"tensor.collapse_shape">, !transform.op<"tensor.extract_slice">)
      %2 = "transform.structured.match"(%arg0) <{ops = ["linalg.generic"]}> : (!transform.any_op) -> !transform.any_op
      %3:2 = "transform.structured.tile_using_forall"(%2) <{operandSegmentSizes = array<i32: 1, 0, 0, 0, 0>, static_num_threads = array<i64: 4, 4>}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op)
      %4 = "transform.structured.match"(%3#1) <{ops = ["tensor.parallel_insert_slice"]}> : (!transform.any_op) -> !transform.op<"tensor.parallel_insert_slice">
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

