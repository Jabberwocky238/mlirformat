"builtin.module"() ({
  "func.func"() <{function_type = (tensor<3x7xf16>, tensor<3xf16>) -> tensor<3xf16>, sym_name = "reduction_2d_static"}> ({
  ^bb0(%arg1: tensor<3x7xf16> loc("<stdin>":5:8), %arg2: tensor<3xf16> loc("<stdin>":5:32)):
    %2 = "linalg.generic"(%arg1, %arg2) <{indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0)>], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<reduction>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg3: f16 loc("<stdin>":7:10), %arg4: f16 loc("<stdin>":7:22)):
      %3 = "arith.addf"(%arg3, %arg4) <{fastmath = #arith.fastmath<none>}> : (f16, f16) -> f16 loc("<stdin>":8:12)
      "linalg.yield"(%3) : (f16) -> () loc("<stdin>":9:7)
    }) : (tensor<3x7xf16>, tensor<3xf16>) -> tensor<3xf16> loc("<stdin>":6:10)
    "func.return"(%2) : (tensor<3xf16>) -> () loc("<stdin>":11:5)
  }) : () -> () loc("<stdin>":4:3)
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op loc("<stdin>":15:10)):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.generic"]}> : (!transform.any_op) -> !transform.any_op loc("<stdin>":16:12)
      %1 = "transform.structured.pack"(%0) <{static_packed_sizes = array<i64: 0, 4>}> : (!transform.any_op) -> !transform.op<"linalg.generic"> loc("<stdin>":17:12)
      "transform.yield"() : () -> () loc("<stdin>":18:7)
    }) : () -> () loc("<stdin>":14:5)
  }) {transform.with_named_sequence} : () -> () loc("<stdin>":13:3)
}) : () -> () loc("<stdin>":3:1)
