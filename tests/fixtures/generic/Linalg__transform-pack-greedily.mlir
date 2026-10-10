#map = affine_map<(d0, d1, d2) -> (d0, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d2, d1)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1023x255xf32>, tensor<255x127xf32>, tensor<1023x127xf32>) -> tensor<1023x127xf32>, sym_name = "matmul_mk_kn_mn"}> ({
  ^bb0(%arg1: tensor<1023x255xf32>, %arg2: tensor<255x127xf32>, %arg3: tensor<1023x127xf32>):
    %2 = "linalg.matmul"(%arg1, %arg2, %arg3) <{indexing_maps = [#map, #map1, #map2], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg4: f32, %arg5: f32, %arg6: f32):
      %3 = "arith.mulf"(%arg4, %arg5) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %4 = "arith.addf"(%arg6, %3) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%4) : (f32) -> ()
    }) : (tensor<1023x255xf32>, tensor<255x127xf32>, tensor<1023x127xf32>) -> tensor<1023x127xf32>
    "func.return"(%2) : (tensor<1023x127xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.matmul"]}> : (!transform.any_op) -> !transform.op<"linalg.matmul">
      %1 = "transform.structured.pack_greedily"(%0) <{matmul_inner_dims_order = array<i64: 1, 2, 0>, matmul_padded_sizes_next_multiple_of = array<i64>, static_matmul_packed_sizes = array<i64: 8, 16, 32>}> : (!transform.op<"linalg.matmul">) -> !transform.op<"linalg.generic">
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d1, d2)>
#map2 = affine_map<(d0, d1, d2) -> (d1, d0)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1023x255xf32>, tensor<127x255xf32>, tensor<127x1023xf32>) -> tensor<127x1023xf32>, sym_name = "matmul_mk_nk_nm"}> ({
  ^bb0(%arg1: tensor<1023x255xf32>, %arg2: tensor<127x255xf32>, %arg3: tensor<127x1023xf32>):
    %2 = "linalg.generic"(%arg1, %arg2, %arg3) <{indexing_maps = [#map, #map1, #map2], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<reduction>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg4: f32, %arg5: f32, %arg6: f32):
      %3 = "arith.mulf"(%arg4, %arg5) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %4 = "arith.addf"(%arg6, %3) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%4) : (f32) -> ()
    }) : (tensor<1023x255xf32>, tensor<127x255xf32>, tensor<127x1023xf32>) -> tensor<127x1023xf32>
    "func.return"(%2) : (tensor<127x1023xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.generic"]}> : (!transform.any_op) -> !transform.op<"linalg.generic">
      %1 = "transform.structured.pack_greedily"(%0) <{matmul_inner_dims_order = array<i64: 1, 2, 0>, matmul_padded_sizes_next_multiple_of = array<i64>, static_matmul_packed_sizes = array<i64: 8, 16, 32>}> : (!transform.op<"linalg.generic">) -> !transform.op<"linalg.generic">
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2) -> (d1, d0)>
#map1 = affine_map<(d0, d1, d2) -> (d2, d0)>
#map2 = affine_map<(d0, d1, d2) -> (d2, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1023x255xf32>, tensor<127x255xf32>, tensor<127x1023xf32>) -> tensor<127x1023xf32>, sym_name = "matmul_mk_nk_nm_transposed"}> ({
  ^bb0(%arg1: tensor<1023x255xf32>, %arg2: tensor<127x255xf32>, %arg3: tensor<127x1023xf32>):
    %2 = "linalg.generic"(%arg1, %arg2, %arg3) <{indexing_maps = [#map, #map1, #map2], iterator_types = [#linalg.iterator_type<reduction>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg4: f32, %arg5: f32, %arg6: f32):
      %3 = "arith.mulf"(%arg4, %arg5) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %4 = "arith.addf"(%arg6, %3) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%4) : (f32) -> ()
    }) : (tensor<1023x255xf32>, tensor<127x255xf32>, tensor<127x1023xf32>) -> tensor<127x1023xf32>
    "func.return"(%2) : (tensor<127x1023xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.generic"]}> : (!transform.any_op) -> !transform.op<"linalg.generic">
      %1 = "transform.structured.pack_greedily"(%0) <{matmul_inner_dims_order = array<i64: 1, 2, 0>, matmul_padded_sizes_next_multiple_of = array<i64>, static_matmul_packed_sizes = array<i64: 8, 16, 32>}> : (!transform.op<"linalg.generic">) -> !transform.op<"linalg.generic">
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3, d4) -> (d3, d1, d0, d4)>
#map1 = affine_map<(d0, d1, d2, d3, d4) -> (d2, d0, d3)>
#map2 = affine_map<(d0, d1, d2, d3, d4) -> (d2, d3, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<42x1023x255x33xf32>, tensor<127x255x42xf32>, tensor<127x42x1023xf32>) -> tensor<127x42x1023xf32>, sym_name = "contraction_bmkm2_nkb_nbm"}> ({
  ^bb0(%arg1: tensor<42x1023x255x33xf32>, %arg2: tensor<127x255x42xf32>, %arg3: tensor<127x42x1023xf32>):
    %2 = "linalg.generic"(%arg1, %arg2, %arg3) <{indexing_maps = [#map, #map1, #map2], iterator_types = [#linalg.iterator_type<reduction>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg4: f32, %arg5: f32, %arg6: f32):
      %3 = "arith.mulf"(%arg4, %arg5) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %4 = "arith.addf"(%arg6, %3) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%4) : (f32) -> ()
    }) : (tensor<42x1023x255x33xf32>, tensor<127x255x42xf32>, tensor<127x42x1023xf32>) -> tensor<127x42x1023xf32>
    "func.return"(%2) : (tensor<127x42x1023xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.generic"]}> : (!transform.any_op) -> !transform.op<"linalg.generic">
      %1 = "transform.structured.pack_greedily"(%0) <{matmul_inner_dims_order = array<i64: 1, 2, 0>, matmul_padded_sizes_next_multiple_of = array<i64>, static_matmul_packed_sizes = array<i64: 8, 16, 32>}> : (!transform.op<"linalg.generic">) -> !transform.op<"linalg.generic">
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3, d4, d5, d6) -> (d0, d4, d2 + d5, d3 + d6)>
#map1 = affine_map<(d0, d1, d2, d3, d4, d5, d6) -> (d1, d4, d5, d6)>
#map2 = affine_map<(d0, d1, d2, d3, d4, d5, d6) -> (d0, d1, d2, d3)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x47x16x16xf32>, tensor<?x16x14x14xf32>) -> tensor<?x16x14x14xf32>, sym_name = "conv_2d_nchw_fchw"}> ({
  ^bb0(%arg1: tensor<?x47x16x16xf32>, %arg2: tensor<?x16x14x14xf32>):
    %2 = "arith.constant"() <{value = dense<1.000000e-01> : tensor<16x47x3x3xf32>}> : () -> tensor<16x47x3x3xf32>
    %3 = "linalg.conv_2d_nchw_fchw"(%arg1, %2, %arg2) <{dilations = dense<1> : tensor<2xi64>, operandSegmentSizes = array<i32: 2, 1>, strides = dense<1> : tensor<2xi64>}> ({
    ^bb0(%arg3: f32, %arg4: f32, %arg5: f32):
      %4 = "arith.mulf"(%arg3, %arg4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %5 = "arith.addf"(%arg5, %4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%5) : (f32) -> ()
    }) {linalg.memoized_indexing_maps = [#map, #map1, #map2]} : (tensor<?x47x16x16xf32>, tensor<16x47x3x3xf32>, tensor<?x16x14x14xf32>) -> tensor<?x16x14x14xf32>
    "func.return"(%3) : (tensor<?x16x14x14xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.conv_2d_nchw_fchw"]}> : (!transform.any_op) -> !transform.op<"linalg.conv_2d_nchw_fchw">
      %1 = "transform.structured.pack_greedily"(%0) <{matmul_inner_dims_order = array<i64: 1, 2, 0>, matmul_padded_sizes_next_multiple_of = array<i64>, static_matmul_packed_sizes = array<i64: 8, 16, 32>}> : (!transform.op<"linalg.conv_2d_nchw_fchw">) -> !transform.op<"linalg.generic">
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<10x100xf32>, tensor<10x100xf32>, tensor<10xf32>) -> tensor<10xf32>, sym_name = "reduce_and_map"}> ({
  ^bb0(%arg1: tensor<10x100xf32>, %arg2: tensor<10x100xf32>, %arg3: tensor<10xf32>):
    %2 = "tensor.empty"() : () -> tensor<10x100xf32>
    %3 = "linalg.map"(%arg1, %arg2, %2) ({
    ^bb0(%arg6: f32, %arg7: f32, %arg8: f32):
      %6 = "arith.addf"(%arg6, %arg7) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%6) : (f32) -> ()
    }) : (tensor<10x100xf32>, tensor<10x100xf32>, tensor<10x100xf32>) -> tensor<10x100xf32>
    %4 = "linalg.reduce"(%3, %arg3) <{dimensions = array<i64: 1>}> ({
    ^bb0(%arg4: f32, %arg5: f32):
      %5 = "arith.addf"(%arg5, %arg4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%5) : (f32) -> ()
    }) : (tensor<10x100xf32>, tensor<10xf32>) -> tensor<10xf32>
    "func.return"(%4) : (tensor<10xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.generic"]}> : (!transform.any_op) -> !transform.op<"linalg.generic">
      %1 = "transform.structured.pack_greedily"(%0) <{matmul_inner_dims_order = array<i64: 1, 2, 0>, matmul_padded_sizes_next_multiple_of = array<i64>, static_matmul_packed_sizes = array<i64: 8, 16, 32>}> : (!transform.op<"linalg.generic">) -> !transform.op<"linalg.generic">
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d1, d2)>
#map2 = affine_map<(d0, d1, d2) -> (d1, d0)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1023x255xf32>, tensor<127x255xf32>, tensor<127x1023xf32>) -> tensor<127x1023xf32>, sym_name = "matmul_mk_nk_nm"}> ({
  ^bb0(%arg1: tensor<1023x255xf32>, %arg2: tensor<127x255xf32>, %arg3: tensor<127x1023xf32>):
    %2 = "linalg.generic"(%arg1, %arg2, %arg3) <{indexing_maps = [#map, #map1, #map2], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<reduction>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg4: f32, %arg5: f32, %arg6: f32):
      %3 = "arith.mulf"(%arg4, %arg5) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %4 = "arith.addf"(%arg6, %3) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%4) : (f32) -> ()
    }) : (tensor<1023x255xf32>, tensor<127x255xf32>, tensor<127x1023xf32>) -> tensor<127x1023xf32>
    "func.return"(%2) : (tensor<127x1023xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.generic"]}> : (!transform.any_op) -> !transform.op<"linalg.generic">
      %1 = "transform.structured.pack_greedily"(%0) <{matmul_inner_dims_order = array<i64: 1, 2, 0>, matmul_padded_sizes_next_multiple_of = array<i64: 0, 10, 0>, static_matmul_packed_sizes = array<i64: 8, 0, 32>}> : (!transform.op<"linalg.generic">) -> !transform.op<"linalg.generic">
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d1, d2)>
#map2 = affine_map<(d0, d1, d2) -> (d1, d0)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1023x255xf32>, tensor<127x255xf32>, tensor<127x1023xf32>) -> tensor<127x1023xf32>, sym_name = "matmul_mk_nk_nm"}> ({
  ^bb0(%arg1: tensor<1023x255xf32>, %arg2: tensor<127x255xf32>, %arg3: tensor<127x1023xf32>):
    %2 = "linalg.generic"(%arg1, %arg2, %arg3) <{indexing_maps = [#map, #map1, #map2], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<reduction>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg4: f32, %arg5: f32, %arg6: f32):
      %3 = "arith.mulf"(%arg4, %arg5) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %4 = "arith.addf"(%arg6, %3) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%4) : (f32) -> ()
    }) : (tensor<1023x255xf32>, tensor<127x255xf32>, tensor<127x1023xf32>) -> tensor<127x1023xf32>
    "func.return"(%2) : (tensor<127x1023xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.generic"]}> : (!transform.any_op) -> !transform.op<"linalg.generic">
      %1 = "transform.structured.pack_greedily"(%0) <{matmul_inner_dims_order = array<i64: 1, 2, 0>, matmul_padded_sizes_next_multiple_of = array<i64: 0, 10, 0>, static_matmul_packed_sizes = array<i64: 0, 0, 32>}> : (!transform.op<"linalg.generic">) -> !transform.op<"linalg.generic">
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
#map1 = affine_map<(d0, d1) -> (d1)>
#map2 = affine_map<(d0, d1) -> (d0)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1023x255xf32>, tensor<255xf32>, tensor<1023xf32>) -> tensor<1023xf32>, sym_name = "matvec_fail"}> ({
  ^bb0(%arg1: tensor<1023x255xf32>, %arg2: tensor<255xf32>, %arg3: tensor<1023xf32>):
    %2 = "linalg.matvec"(%arg1, %arg2, %arg3) <{operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg4: f32, %arg5: f32, %arg6: f32):
      %3 = "arith.mulf"(%arg4, %arg5) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %4 = "arith.addf"(%arg6, %3) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%4) : (f32) -> ()
    }) {linalg.memoized_indexing_maps = [#map, #map1, #map2]} : (tensor<1023x255xf32>, tensor<255xf32>, tensor<1023xf32>) -> tensor<1023xf32>
    "func.return"(%2) : (tensor<1023xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.matvec"]}> : (!transform.any_op) -> !transform.op<"linalg.matvec">
      %1 = "transform.structured.pack_greedily"(%0) <{matmul_inner_dims_order = array<i64: 1, 2, 0>, matmul_padded_sizes_next_multiple_of = array<i64>, static_matmul_packed_sizes = array<i64: 8, 16, 32>}> : (!transform.op<"linalg.matvec">) -> !transform.any_op
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
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.matmul"]}> : (!transform.any_op) -> !transform.op<"linalg.matmul">
      %1 = "transform.structured.pack_greedily"(%0) <{matmul_inner_dims_order = array<i64: 0, 1, 2>, matmul_padded_sizes_next_multiple_of = array<i64>, static_matmul_packed_sizes = array<i64: 8, 16, 4>}> : (!transform.op<"linalg.matmul">) -> !transform.op<"linalg.generic">
      %2 = "transform.get_producer_of_operand"(%1) <{operand_number = 1 : i64}> : (!transform.op<"linalg.generic">) -> !transform.op<"linalg.pack">
      %3:3 = "transform.structured.pack_transpose"(%2, %1) <{inner_perm = array<i64: 1, 0>, outer_perm = array<i64: 1, 0>}> : (!transform.op<"linalg.pack">, !transform.op<"linalg.generic">) -> (!transform.op<"linalg.generic">, !transform.op<"linalg.pack">, !transform.any_op)
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

