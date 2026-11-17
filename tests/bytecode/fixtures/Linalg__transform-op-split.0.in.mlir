"builtin.module"() ({
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg4: !transform.any_op loc("<stdin>":5:10)):
      %3 = "transform.structured.match"(%arg4) <{ops = ["linalg.generic"]}> : (!transform.any_op) -> !transform.any_op loc("<stdin>":6:12)
      %4 = "transform.structured.split"(%3) <{dimension = 0 : i64, static_chunk_sizes = 42 : i64}> : (!transform.any_op) -> !transform.any_op loc("<stdin>":7:12)
      "transform.yield"() : () -> () loc("<stdin>":8:7)
    }) : () -> () loc("<stdin>":4:5)
  }) {transform.with_named_sequence} : () -> () loc("<stdin>":3:3)
  "func.func"() <{function_type = (f32, index, index) -> f32, sym_name = "elem", sym_visibility = "private"}> ({
  }) : () -> () loc("<stdin>":11:3)
  "func.func"() <{function_type = (tensor<100xf32>, tensor<100xf32>) -> tensor<100xf32>, sym_name = "one_d_static"}> ({
  ^bb0(%arg0: tensor<100xf32> loc("<stdin>":14:8), %arg1: tensor<100xf32> loc("<stdin>":14:32)):
    %0 = "linalg.generic"(%arg0, %arg1) <{indexing_maps = [affine_map<(d0) -> (d0)>, affine_map<(d0) -> (d0)>], iterator_types = [#linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg2: f32 loc("<stdin>":16:10), %arg3: f32 loc("<stdin>":16:22)):
      %1 = "linalg.index"() <{dim = 0 : i64}> : () -> index loc("<stdin>":17:12)
      %2 = "func.call"(%arg2, %1, %1) <{callee = @elem}> : (f32, index, index) -> f32 loc("<stdin>":18:12)
      "linalg.yield"(%2) : (f32) -> () loc("<stdin>":19:7)
    }) : (tensor<100xf32>, tensor<100xf32>) -> tensor<100xf32> loc("<stdin>":15:10)
    "func.return"(%0) : (tensor<100xf32>) -> () loc("<stdin>":21:5)
  }) : () -> () loc("<stdin>":13:3)
}) : () -> () loc("<stdin>":2:1)
