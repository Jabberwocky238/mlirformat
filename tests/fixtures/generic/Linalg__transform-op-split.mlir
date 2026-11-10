#map = affine_map<(d0) -> (d0)>
"builtin.module"() ({
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg4: !transform.any_op):
      %3 = "transform.structured.match"(%arg4) <{ops = ["linalg.generic"]}> : (!transform.any_op) -> !transform.any_op
      %4 = "transform.structured.split"(%3) <{dimension = 0 : i64, static_chunk_sizes = 42 : i64}> : (!transform.any_op) -> !transform.any_op
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
  "func.func"() <{function_type = (f32, index, index) -> f32, sym_name = "elem", sym_visibility = "private"}> ({
  }) : () -> ()
  "func.func"() <{function_type = (tensor<100xf32>, tensor<100xf32>) -> tensor<100xf32>, sym_name = "one_d_static"}> ({
  ^bb0(%arg0: tensor<100xf32>, %arg1: tensor<100xf32>):
    %0 = "linalg.generic"(%arg0, %arg1) <{indexing_maps = [#map, #map], iterator_types = [#linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg2: f32, %arg3: f32):
      %1 = "linalg.index"() <{dim = 0 : i64}> : () -> index
      %2 = "func.call"(%arg2, %1, %1) <{callee = @elem}> : (f32, index, index) -> f32
      "linalg.yield"(%2) : (f32) -> ()
    }) : (tensor<100xf32>, tensor<100xf32>) -> tensor<100xf32>
    "func.return"(%0) : (tensor<100xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0) -> (d0)>
"builtin.module"() ({
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg4: !transform.any_op):
      %3 = "transform.structured.match"(%arg4) <{ops = ["linalg.generic"]}> : (!transform.any_op) -> !transform.any_op
      %4 = "transform.structured.split"(%3) <{dimension = 0 : i64, static_chunk_sizes = 42 : i64}> : (!transform.any_op) -> !transform.any_op
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
  "func.func"() <{function_type = (f32, index, index) -> f32, sym_name = "elem", sym_visibility = "private"}> ({
  }) : () -> ()
  "func.func"() <{function_type = (tensor<10xf32>, tensor<10xf32>) -> tensor<10xf32>, sym_name = "one_d_static_overflow"}> ({
  ^bb0(%arg0: tensor<10xf32>, %arg1: tensor<10xf32>):
    %0 = "linalg.generic"(%arg0, %arg1) <{indexing_maps = [#map, #map], iterator_types = [#linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg2: f32, %arg3: f32):
      %1 = "linalg.index"() <{dim = 0 : i64}> : () -> index
      %2 = "func.call"(%arg2, %1, %1) <{callee = @elem}> : (f32, index, index) -> f32
      "linalg.yield"(%2) : (f32) -> ()
    }) : (tensor<10xf32>, tensor<10xf32>) -> tensor<10xf32>
    "func.return"(%0) : (tensor<10xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0) -> (d0)>
"builtin.module"() ({
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg4: !transform.any_op):
      %3 = "transform.structured.match"(%arg4) <{ops = ["linalg.generic"]}> : (!transform.any_op) -> !transform.any_op
      %4 = "transform.structured.match"(%arg4) <{ops = ["func.call"]}> : (!transform.any_op) -> !transform.any_op
      %5 = "transform.structured.split"(%3, %4) <{dimension = 0 : i64, static_chunk_sizes = -9223372036854775808 : i64}> : (!transform.any_op, !transform.any_op) -> !transform.any_op
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
  "func.func"() <{function_type = () -> index, sym_name = "get_size", sym_visibility = "private"}> ({
  }) : () -> ()
  "func.func"() <{function_type = (tensor<100xf32>, tensor<100xf32>) -> tensor<100xf32>, sym_name = "dynamic"}> ({
  ^bb0(%arg0: tensor<100xf32>, %arg1: tensor<100xf32>):
    %0 = "func.call"() <{callee = @get_size}> : () -> index
    %1 = "linalg.generic"(%arg0, %arg1) <{indexing_maps = [#map, #map], iterator_types = [#linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg2: f32, %arg3: f32):
      %2 = "arith.addf"(%arg2, %arg3) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%2) : (f32) -> ()
    }) : (tensor<100xf32>, tensor<100xf32>) -> tensor<100xf32>
    "func.return"(%1) : (tensor<100xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
"builtin.module"() ({
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg4: !transform.any_op):
      %4 = "transform.structured.match"(%arg4) <{ops = ["linalg.generic"]}> : (!transform.any_op) -> !transform.any_op
      %5 = "transform.structured.split"(%4) <{dimension = 0 : i64, static_chunk_sizes = 4 : i64}> : (!transform.any_op) -> !transform.any_op
      %6:2 = "transform.split_handle"(%5) <{fail_on_payload_too_small = true, pass_through_empty_handle = true}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op)
      %7 = "transform.structured.split"(%6#1) <{dimension = 1 : i64, static_chunk_sizes = 16 : i64}> : (!transform.any_op) -> !transform.any_op
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
  "func.func"() <{function_type = (f32, index, index) -> f32, sym_name = "elem", sym_visibility = "private"}> ({
  }) : () -> ()
  "func.func"() <{function_type = (tensor<10x34xf32>, tensor<10x34xf32>) -> tensor<10x34xf32>, sym_name = "two_d"}> ({
  ^bb0(%arg0: tensor<10x34xf32>, %arg1: tensor<10x34xf32>):
    %0 = "linalg.generic"(%arg0, %arg1) <{indexing_maps = [#map, #map], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg2: f32, %arg3: f32):
      %1 = "linalg.index"() <{dim = 0 : i64}> : () -> index
      %2 = "linalg.index"() <{dim = 1 : i64}> : () -> index
      %3 = "func.call"(%arg2, %1, %2) <{callee = @elem}> : (f32, index, index) -> f32
      "linalg.yield"(%3) : (f32) -> ()
    }) : (tensor<10x34xf32>, tensor<10x34xf32>) -> tensor<10x34xf32>
    "func.return"(%0) : (tensor<10x34xf32>) -> ()
  }) : () -> ()
}) : () -> ()

