"builtin.module"() ({
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg4: !transform.any_op loc("<stdin>":5:10)):
      %4 = "transform.structured.match"(%arg4) <{ops = ["linalg.generic"]}> : (!transform.any_op) -> !transform.any_op loc("<stdin>":6:12)
      %5:3 = "transform.structured.multitile_sizes"(%4) <{dimension = 0 : i64, divisor = 1 : i64, target_size = 3 : i64}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op) loc("<stdin>":7:14)
      %6 = "transform.structured.split"(%4, %5#2) <{dimension = 0 : i64, static_chunk_sizes = -9223372036854775808 : i64}> : (!transform.any_op, !transform.any_op) -> !transform.any_op loc("<stdin>":8:12)
      %7:2 = "transform.split_handle"(%6) <{fail_on_payload_too_small = true, pass_through_empty_handle = true}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op) loc("<stdin>":9:14)
      %8:2 = "transform.structured.tile_using_for"(%7#0, %5#0) <{scalable_sizes = array<i1: false>, static_sizes = array<i64: -9223372036854775808>}> : (!transform.any_op, !transform.any_op) -> (!transform.any_op, !transform.any_op) loc("<stdin>":10:14)
      %9:2 = "transform.structured.tile_using_for"(%7#1, %5#1) <{scalable_sizes = array<i1: false>, static_sizes = array<i64: -9223372036854775808>}> : (!transform.any_op, !transform.any_op) -> (!transform.any_op, !transform.any_op) loc("<stdin>":11:14)
      %10 = "transform.merge_handles"(%8#0, %9#0) : (!transform.any_op, !transform.any_op) -> !transform.any_op loc("<stdin>":12:13)
      "transform.foreach"(%10) ({
      ^bb0(%arg5: !transform.any_op loc("<stdin>":14:12)):
        %11:3 = "transform.structured.multitile_sizes"(%arg5) <{dimension = 1 : i64, divisor = 1 : i64, target_size = 10 : i64}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op) loc("<stdin>":15:17)
        %12 = "transform.structured.split"(%arg5, %11#2) <{dimension = 1 : i64, static_chunk_sizes = -9223372036854775808 : i64}> : (!transform.any_op, !transform.any_op) -> !transform.any_op loc("<stdin>":16:15)
        %13:2 = "transform.split_handle"(%12) <{fail_on_payload_too_small = true, pass_through_empty_handle = true}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op) loc("<stdin>":17:17)
        %14:2 = "transform.structured.tile_using_for"(%13#0, %11#0) <{scalable_sizes = array<i1: false, false>, static_sizes = array<i64: 0, -9223372036854775808>}> : (!transform.any_op, !transform.any_op) -> (!transform.any_op, !transform.any_op) loc("<stdin>":18:17)
        %15:2 = "transform.structured.tile_using_for"(%13#1, %11#1) <{scalable_sizes = array<i1: false, false>, static_sizes = array<i64: 0, -9223372036854775808>}> : (!transform.any_op, !transform.any_op) -> (!transform.any_op, !transform.any_op) loc("<stdin>":19:17)
        "transform.yield"() : () -> () loc("<stdin>":20:9)
      }) : (!transform.any_op) -> () loc("<stdin>":13:7)
      "transform.yield"() : () -> () loc("<stdin>":22:7)
    }) : () -> () loc("<stdin>":4:5)
  }) {transform.with_named_sequence} : () -> () loc("<stdin>":3:3)
  "func.func"() <{function_type = (f32, index, index) -> f32, sym_name = "elem", sym_visibility = "private"}> ({
  }) : () -> () loc("<stdin>":25:3)
  "func.func"() <{function_type = (tensor<10x34xf32>, tensor<10x34xf32>) -> tensor<10x34xf32>, sym_name = "two_d"}> ({
  ^bb0(%arg0: tensor<10x34xf32> loc("<stdin>":28:8), %arg1: tensor<10x34xf32> loc("<stdin>":28:34)):
    %0 = "linalg.generic"(%arg0, %arg1) <{indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg2: f32 loc("<stdin>":30:10), %arg3: f32 loc("<stdin>":30:22)):
      %1 = "linalg.index"() <{dim = 0 : i64}> : () -> index loc("<stdin>":31:12)
      %2 = "linalg.index"() <{dim = 1 : i64}> : () -> index loc("<stdin>":32:12)
      %3 = "func.call"(%arg2, %1, %2) <{callee = @elem}> : (f32, index, index) -> f32 loc("<stdin>":33:12)
      "linalg.yield"(%3) : (f32) -> () loc("<stdin>":34:7)
    }) : (tensor<10x34xf32>, tensor<10x34xf32>) -> tensor<10x34xf32> loc("<stdin>":29:10)
    "func.return"(%0) : (tensor<10x34xf32>) -> () loc("<stdin>":36:5)
  }) : () -> () loc("<stdin>":27:3)
}) : () -> () loc("<stdin>":2:1)
