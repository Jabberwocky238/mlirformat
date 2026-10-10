"builtin.module"() ({
  "func.func"() <{function_type = (tensor<8x4xf32>, tensor<?x?xf32>) -> tensor<?x?xf32>, sym_name = "decompose_dynamic_concat"}> ({
  ^bb0(%arg9: tensor<8x4xf32>, %arg10: tensor<?x?xf32>):
    %4 = "tensor.concat"(%arg9, %arg10) <{dim = 1 : i64}> : (tensor<8x4xf32>, tensor<?x?xf32>) -> tensor<?x?xf32>
    "func.return"(%4) : (tensor<?x?xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<1xf32>, tensor<2xf32>, tensor<3xf32>, tensor<4xf32>) -> tensor<10xf32>, sym_name = "decompose_1d_concat"}> ({
  ^bb0(%arg5: tensor<1xf32>, %arg6: tensor<2xf32>, %arg7: tensor<3xf32>, %arg8: tensor<4xf32>):
    %3 = "tensor.concat"(%arg5, %arg6, %arg7, %arg8) <{dim = 0 : i64}> : (tensor<1xf32>, tensor<2xf32>, tensor<3xf32>, tensor<4xf32>) -> tensor<10xf32>
    "func.return"(%3) : (tensor<10xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<1x?x64xf32>, tensor<1x?x64xf32>) -> tensor<1x?x128xf32>, sym_name = "decompose_static_concat_dim"}> ({
  ^bb0(%arg3: tensor<1x?x64xf32>, %arg4: tensor<1x?x64xf32>):
    %2 = "tensor.concat"(%arg3, %arg4) <{dim = 2 : i64}> : (tensor<1x?x64xf32>, tensor<1x?x64xf32>) -> tensor<1x?x128xf32>
    "func.return"(%2) : (tensor<1x?x128xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<1x?x?xf32>, tensor<1x?x?xf32>) -> tensor<1x?x128xf32>, sym_name = "decompose_dynamic_into_static_concat_dim"}> ({
  ^bb0(%arg1: tensor<1x?x?xf32>, %arg2: tensor<1x?x?xf32>):
    %1 = "tensor.concat"(%arg1, %arg2) <{dim = 2 : i64}> : (tensor<1x?x?xf32>, tensor<1x?x?xf32>) -> tensor<1x?x128xf32>
    "func.return"(%1) : (tensor<1x?x128xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["func.func"]}> : (!transform.any_op) -> !transform.op<"func.func">
      "transform.apply_patterns"(%0) <{max_iterations = -1 : i64, max_num_rewrites = -1 : i64}> ({
        "transform.apply_patterns.tensor.decompose_concat"() : () -> ()
      }) : (!transform.op<"func.func">) -> ()
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

