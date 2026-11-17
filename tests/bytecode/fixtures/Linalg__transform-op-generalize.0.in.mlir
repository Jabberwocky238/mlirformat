"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?xf32>, tensor<?x?xf32>) -> tensor<?x?xf32>, sym_name = "generalize_unary"}> ({
  ^bb0(%arg5: tensor<?x?xf32> loc("<stdin>":3:8), %arg6: tensor<?x?xf32> loc("<stdin>":3:32)):
    %4 = "linalg.exp"(%arg5, %arg6) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg7: f32 loc("<stdin>":5:10), %arg8: f32 loc("<stdin>":5:22)):
      %5 = "math.exp"(%arg7) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32 loc("<stdin>":6:12)
      "linalg.yield"(%5) : (f32) -> () loc("<stdin>":7:7)
    }) : (tensor<?x?xf32>, tensor<?x?xf32>) -> tensor<?x?xf32> loc("<stdin>":4:10)
    "func.return"(%4) : (tensor<?x?xf32>) -> () loc("<stdin>":9:5)
  }) : () -> () loc("<stdin>":2:3)
  "func.func"() <{function_type = (tensor<16x32x64xf32>, tensor<16x64xf32>) -> tensor<16x64xf32>, sym_name = "map_no_inputs"}> ({
  ^bb0(%arg1: tensor<16x32x64xf32> loc("<stdin>":12:8), %arg2: tensor<16x64xf32> loc("<stdin>":12:37)):
    %2 = "linalg.reduce"(%arg1, %arg2) <{dimensions = array<i64: 1>}> ({
    ^bb0(%arg3: f32 loc("<stdin>":14:10), %arg4: f32 loc("<stdin>":14:22)):
      %3 = "arith.addf"(%arg4, %arg3) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":15:12)
      "linalg.yield"(%3) : (f32) -> () loc("<stdin>":16:7)
    }) : (tensor<16x32x64xf32>, tensor<16x64xf32>) -> tensor<16x64xf32> loc("<stdin>":13:10)
    "func.return"(%2) : (tensor<16x64xf32>) -> () loc("<stdin>":18:5)
  }) : () -> () loc("<stdin>":11:3)
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op loc("<stdin>":22:10)):
      %0 = "transform.structured.match"(%arg0) <{interface = 0 : i32}> : (!transform.any_op) -> !transform.any_op loc("<stdin>":23:12)
      %1 = "transform.structured.generalize"(%0) : (!transform.any_op) -> !transform.any_op loc("<stdin>":24:12)
      "transform.yield"() : () -> () loc("<stdin>":25:7)
    }) : () -> () loc("<stdin>":21:5)
  }) {transform.with_named_sequence} : () -> () loc("<stdin>":20:3)
}) : () -> () loc("<stdin>":1:1)
