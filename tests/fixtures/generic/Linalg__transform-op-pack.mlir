#map = affine_map<(d0, d1) -> (d0, d1)>
#map1 = affine_map<(d0, d1) -> (d0)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<3x7xf16>, tensor<3xf16>) -> tensor<3xf16>, sym_name = "reduction_2d_static"}> ({
  ^bb0(%arg1: tensor<3x7xf16>, %arg2: tensor<3xf16>):
    %2 = "linalg.generic"(%arg1, %arg2) <{indexing_maps = [#map, #map1], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<reduction>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg3: f16, %arg4: f16):
      %3 = "arith.addf"(%arg3, %arg4) <{fastmath = #arith.fastmath<none>}> : (f16, f16) -> f16
      "linalg.yield"(%3) : (f16) -> ()
    }) : (tensor<3x7xf16>, tensor<3xf16>) -> tensor<3xf16>
    "func.return"(%2) : (tensor<3xf16>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.generic"]}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.structured.pack"(%0) <{static_packed_sizes = array<i64: 0, 4>}> : (!transform.any_op) -> !transform.op<"linalg.generic">
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
#map1 = affine_map<(d0, d1) -> (d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<7x3xf16>, tensor<3xf16>) -> tensor<3xf16>, sym_name = "col_reduction_2d_static"}> ({
  ^bb0(%arg1: tensor<7x3xf16>, %arg2: tensor<3xf16>):
    %4 = "linalg.generic"(%arg1, %arg2) <{indexing_maps = [#map, #map1], iterator_types = [#linalg.iterator_type<reduction>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg3: f16, %arg4: f16):
      %5 = "arith.addf"(%arg3, %arg4) <{fastmath = #arith.fastmath<none>}> : (f16, f16) -> f16
      "linalg.yield"(%5) : (f16) -> ()
    }) : (tensor<7x3xf16>, tensor<3xf16>) -> tensor<3xf16>
    "func.return"(%4) : (tensor<3xf16>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.generic"]}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.structured.pack"(%0) <{static_packed_sizes = array<i64: 4, 0>}> : (!transform.any_op) -> !transform.op<"linalg.generic">
      %2 = "transform.get_producer_of_operand"(%1) <{operand_number = 0 : i64}> : (!transform.op<"linalg.generic">) -> !transform.op<"linalg.pack">
      %3:3 = "transform.structured.pack_transpose"(%2, %1) <{outer_perm = array<i64: 1, 0>}> : (!transform.op<"linalg.pack">, !transform.op<"linalg.generic">) -> (!transform.op<"linalg.generic">, !transform.op<"linalg.pack">, !transform.any_op)
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
#map1 = affine_map<(d0, d1) -> (d0)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?xf16>, tensor<?xf16>) -> tensor<?xf16>, sym_name = "reduction_2d_dynamic"}> ({
  ^bb0(%arg1: tensor<?x?xf16>, %arg2: tensor<?xf16>):
    %2 = "linalg.generic"(%arg1, %arg2) <{indexing_maps = [#map, #map1], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<reduction>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg3: f16, %arg4: f16):
      %3 = "arith.addf"(%arg3, %arg4) <{fastmath = #arith.fastmath<none>}> : (f16, f16) -> f16
      "linalg.yield"(%3) : (f16) -> ()
    }) : (tensor<?x?xf16>, tensor<?xf16>) -> tensor<?xf16>
    "func.return"(%2) : (tensor<?xf16>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.generic"]}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.structured.pack"(%0) <{static_packed_sizes = array<i64: 0, 4>}> : (!transform.any_op) -> !transform.op<"linalg.generic">
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
#map1 = affine_map<(d0, d1) -> (d0)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?xf16>, tensor<?xf16>) -> tensor<?xf16>, sym_name = "reduction_2d_dynamic"}> ({
  ^bb0(%arg1: tensor<?x?xf16>, %arg2: tensor<?xf16>):
    %2 = "linalg.generic"(%arg1, %arg2) <{indexing_maps = [#map, #map1], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<reduction>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg3: f16, %arg4: f16):
      %3 = "arith.addf"(%arg3, %arg4) <{fastmath = #arith.fastmath<none>}> : (f16, f16) -> f16
      "linalg.yield"(%3) : (f16) -> ()
    }) : (tensor<?x?xf16>, tensor<?xf16>) -> tensor<?xf16>
    "func.return"(%2) : (tensor<?xf16>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.generic"]}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.structured.pack"(%0) <{static_packed_sizes = array<i64: 3, 4>}> : (!transform.any_op) -> !transform.op<"linalg.generic">
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d2, d1)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?xf32>, tensor<?x?xf32>, tensor<?x?xf32>) -> tensor<?x?xf32>, sym_name = "matmul"}> ({
  ^bb0(%arg1: tensor<?x?xf32>, %arg2: tensor<?x?xf32>, %arg3: tensor<?x?xf32>):
    %4 = "linalg.matmul"(%arg1, %arg2, %arg3) <{indexing_maps = [#map, #map1, #map2], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg4: f32, %arg5: f32, %arg6: f32):
      %5 = "arith.mulf"(%arg4, %arg5) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %6 = "arith.addf"(%arg6, %5) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%6) : (f32) -> ()
    }) : (tensor<?x?xf32>, tensor<?x?xf32>, tensor<?x?xf32>) -> tensor<?x?xf32>
    "func.return"(%4) : (tensor<?x?xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.matmul"]}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.structured.pack"(%0) <{static_packed_sizes = array<i64: 2, 3, 4>}> : (!transform.any_op) -> !transform.op<"linalg.generic">
      %2 = "transform.get_consumers_of_result"(%1) <{result_number = 0 : i64}> : (!transform.op<"linalg.generic">) -> !transform.op<"linalg.unpack">
      %3:3 = "transform.structured.pack_transpose"(%2, %1) <{inner_perm = array<i64: 1, 0>, outer_perm = array<i64: 1, 0>}> : (!transform.op<"linalg.unpack">, !transform.op<"linalg.generic">) -> (!transform.op<"linalg.generic">, !transform.op<"linalg.pack">, !transform.op<"linalg.unpack">)
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3, d4, d5, d6) -> (d0, d4, d2 + d5, d3 + d6)>
#map1 = affine_map<(d0, d1, d2, d3, d4, d5, d6) -> (d1, d4, d5, d6)>
#map2 = affine_map<(d0, d1, d2, d3, d4, d5, d6) -> (d0, d1, d2, d3)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<14x512x28x28xf32>, tensor<1024x512x1x1xf32>, tensor<14x1024x28x28xf32>) -> tensor<14x1024x28x28xf32>, sym_name = "conv_2d_nchw_fchw"}> ({
  ^bb0(%arg1: tensor<14x512x28x28xf32>, %arg2: tensor<1024x512x1x1xf32>, %arg3: tensor<14x1024x28x28xf32>):
    %2 = "linalg.conv_2d_nchw_fchw"(%arg1, %arg2, %arg3) <{operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg4: f32, %arg5: f32, %arg6: f32):
      %3 = "arith.mulf"(%arg4, %arg5) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %4 = "arith.addf"(%arg6, %3) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%4) : (f32) -> ()
    }) {linalg.memoized_indexing_maps = [#map, #map1, #map2]} : (tensor<14x512x28x28xf32>, tensor<1024x512x1x1xf32>, tensor<14x1024x28x28xf32>) -> tensor<14x1024x28x28xf32>
    "func.return"(%2) : (tensor<14x1024x28x28xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{interface = 0 : i32}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.structured.pack"(%0) <{static_packed_sizes = array<i64: 0, 4, 0, 0, 8, 0, 0>}> : (!transform.any_op) -> !transform.op<"linalg.generic">
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3, d4, d5, d6) -> (d0, d1 + d4, d2 + d5, d6)>
#map1 = affine_map<(d0, d1, d2, d3, d4, d5, d6) -> (d4, d5, d6, d3)>
#map2 = affine_map<(d0, d1, d2, d3, d4, d5, d6) -> (d0, d1, d2, d3)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x1x?x?xf32>, tensor<1x?x?x?xf32>, tensor<?x1x?x?xf32>) -> tensor<?x1x?x?xf32>, sym_name = "conv_2d_nhwc_hwcf"}> ({
  ^bb0(%arg1: tensor<?x1x?x?xf32>, %arg2: tensor<1x?x?x?xf32>, %arg3: tensor<?x1x?x?xf32>):
    %2 = "linalg.conv_2d_nhwc_hwcf"(%arg1, %arg2, %arg3) <{operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg4: f32, %arg5: f32, %arg6: f32):
      %3 = "arith.mulf"(%arg4, %arg5) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %4 = "arith.addf"(%arg6, %3) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%4) : (f32) -> ()
    }) {linalg.memoized_indexing_maps = [#map, #map1, #map2]} : (tensor<?x1x?x?xf32>, tensor<1x?x?x?xf32>, tensor<?x1x?x?xf32>) -> tensor<?x1x?x?xf32>
    "func.return"(%2) : (tensor<?x1x?x?xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{interface = 0 : i32}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.structured.pack"(%0) <{static_packed_sizes = array<i64: 0, 0, 0, 4, 0, 0, 6>}> : (!transform.any_op) -> !transform.op<"linalg.generic">
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d2, d1)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?xf32>, tensor<?x?xf32>, tensor<?x?xf32>) -> tensor<?x?xf32>, sym_name = "matmul_dynamic_pack_size"}> ({
  ^bb0(%arg1: tensor<?x?xf32>, %arg2: tensor<?x?xf32>, %arg3: tensor<?x?xf32>):
    %3 = "some_tile_size"() : () -> index
    %4 = "linalg.matmul"(%arg1, %arg2, %arg3) <{indexing_maps = [#map, #map1, #map2], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg4: f32, %arg5: f32, %arg6: f32):
      %5 = "arith.mulf"(%arg4, %arg5) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %6 = "arith.addf"(%arg6, %5) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%6) : (f32) -> ()
    }) : (tensor<?x?xf32>, tensor<?x?xf32>, tensor<?x?xf32>) -> tensor<?x?xf32>
    "func.return"(%4) : (tensor<?x?xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.matmul"]}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.structured.match"(%arg0) <{ops = ["some_tile_size"]}> : (!transform.any_op) -> !transform.any_op
      %2 = "transform.structured.pack"(%0, %1, %1) <{static_packed_sizes = array<i64: 0, -9223372036854775808, -9223372036854775808>}> : (!transform.any_op, !transform.any_op, !transform.any_op) -> !transform.op<"linalg.generic">
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d2, d1)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>) -> tensor<32x32xf32>, sym_name = "no_padding_on_packs"}> ({
  ^bb0(%arg1: tensor<32x32xf32>, %arg2: tensor<32x32xf32>, %arg3: tensor<32x32xf32>):
    %4 = "linalg.matmul"(%arg1, %arg2, %arg3) <{indexing_maps = [#map, #map1, #map2], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg4: f32, %arg5: f32, %arg6: f32):
      %5 = "arith.mulf"(%arg4, %arg5) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %6 = "arith.addf"(%arg6, %5) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%6) : (f32) -> ()
    }) : (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>) -> tensor<32x32xf32>
    "func.return"(%4) : (tensor<32x32xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.matmul"]}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.structured.pack"(%0) <{static_packed_sizes = array<i64: 4, 8, 8>}> : (!transform.any_op) -> !transform.op<"linalg.generic">
      %2 = "transform.get_producer_of_operand"(%1) <{operand_number = 1 : i64}> : (!transform.op<"linalg.generic">) -> !transform.op<"linalg.pack">
      %3:3 = "transform.structured.pack_transpose"(%2, %1) <{inner_perm = array<i64: 1, 0>, outer_perm = array<i64: 1, 0>}> : (!transform.op<"linalg.pack">, !transform.op<"linalg.generic">) -> (!transform.op<"linalg.generic">, !transform.op<"linalg.pack">, !transform.any_op)
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

