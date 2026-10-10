"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?xf32>, tensor<?x?xf32>) -> tensor<?x?xf32>, sym_name = "generalize_unary"}> ({
  ^bb0(%arg5: tensor<?x?xf32>, %arg6: tensor<?x?xf32>):
    %4 = "linalg.exp"(%arg5, %arg6) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg7: f32, %arg8: f32):
      %5 = "math.exp"(%arg7) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
      "linalg.yield"(%5) : (f32) -> ()
    }) : (tensor<?x?xf32>, tensor<?x?xf32>) -> tensor<?x?xf32>
    "func.return"(%4) : (tensor<?x?xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<16x32x64xf32>, tensor<16x64xf32>) -> tensor<16x64xf32>, sym_name = "map_no_inputs"}> ({
  ^bb0(%arg1: tensor<16x32x64xf32>, %arg2: tensor<16x64xf32>):
    %2 = "linalg.reduce"(%arg1, %arg2) <{dimensions = array<i64: 1>}> ({
    ^bb0(%arg3: f32, %arg4: f32):
      %3 = "arith.addf"(%arg4, %arg3) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%3) : (f32) -> ()
    }) : (tensor<16x32x64xf32>, tensor<16x64xf32>) -> tensor<16x64xf32>
    "func.return"(%2) : (tensor<16x64xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{interface = 0 : i32}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.structured.generalize"(%0) : (!transform.any_op) -> !transform.any_op
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

