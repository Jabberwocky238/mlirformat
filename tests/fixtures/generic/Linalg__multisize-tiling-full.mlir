#map = affine_map<(d0, d1) -> (d0, d1)>
"builtin.module"() ({
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg4: !transform.any_op):
      %4 = "transform.structured.match"(%arg4) <{ops = ["linalg.generic"]}> : (!transform.any_op) -> !transform.any_op
      %5:3 = "transform.structured.multitile_sizes"(%4) <{dimension = 0 : i64, divisor = 1 : i64, target_size = 3 : i64}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op)
      %6 = "transform.structured.split"(%4, %5#2) <{dimension = 0 : i64, static_chunk_sizes = -9223372036854775808 : i64}> : (!transform.any_op, !transform.any_op) -> !transform.any_op
      %7:2 = "transform.split_handle"(%6) <{fail_on_payload_too_small = true, pass_through_empty_handle = true}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op)
      %8:2 = "transform.structured.tile_using_for"(%7#0, %5#0) <{scalable_sizes = array<i1: false>, static_sizes = array<i64: -9223372036854775808>}> : (!transform.any_op, !transform.any_op) -> (!transform.any_op, !transform.any_op)
      %9:2 = "transform.structured.tile_using_for"(%7#1, %5#1) <{scalable_sizes = array<i1: false>, static_sizes = array<i64: -9223372036854775808>}> : (!transform.any_op, !transform.any_op) -> (!transform.any_op, !transform.any_op)
      %10 = "transform.merge_handles"(%8#0, %9#0) : (!transform.any_op, !transform.any_op) -> !transform.any_op
      "transform.foreach"(%10) ({
      ^bb0(%arg5: !transform.any_op):
        %11:3 = "transform.structured.multitile_sizes"(%arg5) <{dimension = 1 : i64, divisor = 1 : i64, target_size = 10 : i64}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op)
        %12 = "transform.structured.split"(%arg5, %11#2) <{dimension = 1 : i64, static_chunk_sizes = -9223372036854775808 : i64}> : (!transform.any_op, !transform.any_op) -> !transform.any_op
        %13:2 = "transform.split_handle"(%12) <{fail_on_payload_too_small = true, pass_through_empty_handle = true}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op)
        %14:2 = "transform.structured.tile_using_for"(%13#0, %11#0) <{scalable_sizes = array<i1: false, false>, static_sizes = array<i64: 0, -9223372036854775808>}> : (!transform.any_op, !transform.any_op) -> (!transform.any_op, !transform.any_op)
        %15:2 = "transform.structured.tile_using_for"(%13#1, %11#1) <{scalable_sizes = array<i1: false, false>, static_sizes = array<i64: 0, -9223372036854775808>}> : (!transform.any_op, !transform.any_op) -> (!transform.any_op, !transform.any_op)
        "transform.yield"() : () -> ()
      }) : (!transform.any_op) -> ()
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

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
"builtin.module"() ({
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg4: !transform.any_op):
      %4 = "transform.structured.match"(%arg4) <{ops = ["linalg.generic"]}> : (!transform.any_op) -> !transform.any_op
      %5:3 = "transform.structured.multitile_sizes"(%4) <{dimension = 0 : i64, divisor = 1 : i64, target_size = 3 : i64}> : (!transform.any_op) -> (!transform.param<i64>, !transform.param<i64>, !transform.param<i64>)
      %6:3 = "transform.structured.multitile_sizes"(%4) <{dimension = 1 : i64, divisor = 1 : i64, target_size = 10 : i64}> : (!transform.any_op) -> (!transform.param<i64>, !transform.param<i64>, !transform.param<i64>)
      %7 = "transform.structured.split"(%4, %5#2) <{dimension = 0 : i64, static_chunk_sizes = -9223372036854775808 : i64}> : (!transform.any_op, !transform.param<i64>) -> !transform.any_op
      %8:2 = "transform.split_handle"(%7) <{fail_on_payload_too_small = true, pass_through_empty_handle = true}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op)
      %9:2 = "transform.structured.tile_using_for"(%8#0, %5#0) <{scalable_sizes = array<i1: false>, static_sizes = array<i64: -9223372036854775808>}> : (!transform.any_op, !transform.param<i64>) -> (!transform.any_op, !transform.any_op)
      %10:2 = "transform.structured.tile_using_for"(%8#1, %5#1) <{scalable_sizes = array<i1: false>, static_sizes = array<i64: -9223372036854775808>}> : (!transform.any_op, !transform.param<i64>) -> (!transform.any_op, !transform.any_op)
      %11 = "transform.merge_handles"(%9#0, %10#0) : (!transform.any_op, !transform.any_op) -> !transform.any_op
      %12:3 = "transform.replicate"(%11, %6#0, %6#1, %6#2) : (!transform.any_op, !transform.param<i64>, !transform.param<i64>, !transform.param<i64>) -> (!transform.param<i64>, !transform.param<i64>, !transform.param<i64>)
      "transform.foreach"(%11, %12#0, %12#1, %12#2) ({
      ^bb0(%arg5: !transform.any_op, %arg6: !transform.param<i64>, %arg7: !transform.param<i64>, %arg8: !transform.param<i64>):
        %13 = "transform.structured.split"(%arg5, %arg8) <{dimension = 1 : i64, static_chunk_sizes = -9223372036854775808 : i64}> : (!transform.any_op, !transform.param<i64>) -> !transform.any_op
        %14:2 = "transform.split_handle"(%13) <{fail_on_payload_too_small = true, pass_through_empty_handle = true}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op)
        %15:2 = "transform.structured.tile_using_for"(%14#0, %arg6) <{scalable_sizes = array<i1: false, false>, static_sizes = array<i64: 0, -9223372036854775808>}> : (!transform.any_op, !transform.param<i64>) -> (!transform.any_op, !transform.any_op)
        %16:2 = "transform.structured.tile_using_for"(%14#1, %arg7) <{scalable_sizes = array<i1: false, false>, static_sizes = array<i64: 0, -9223372036854775808>}> : (!transform.any_op, !transform.param<i64>) -> (!transform.any_op, !transform.any_op)
        "transform.yield"() : () -> ()
      }) : (!transform.any_op, !transform.param<i64>, !transform.param<i64>, !transform.param<i64>) -> ()
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
  "func.func"() <{function_type = (f32, index, index) -> f32, sym_name = "elem", sym_visibility = "private"}> ({
  }) : () -> ()
  "func.func"() <{function_type = (tensor<10x34xf32>, tensor<10x34xf32>) -> tensor<10x34xf32>, sym_name = "two_d_param"}> ({
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

