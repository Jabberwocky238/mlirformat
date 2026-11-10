"builtin.module"() ({
  "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (!spirv.arm.tensor<2x3xi32>) -> (), sym_name = "shaped_rank2_int_arm_tensor"}> ({
  ^bb0(%arg0: !spirv.arm.tensor<2x3xi32>):
    "spirv.Return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = () -> !spirv.arm.tensor<3xui64>, sym_name = "ui64_arm_tensor_const"}> ({
    %0 = "spirv.Constant"() <{value = dense<[5, 6, 7]> : !spirv.arm.tensor<3xui64>}> : () -> !spirv.arm.tensor<3xui64>
    "spirv.ReturnValue"(%0) : (!spirv.arm.tensor<3xui64>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = () -> !spirv.arm.tensor<3xsi32>, sym_name = "si32_arm_tensor_const"}> ({
    %0 = "spirv.Constant"() <{value = dense<[5, 6, 7]> : !spirv.arm.tensor<3xsi32>}> : () -> !spirv.arm.tensor<3xsi32>
    "spirv.ReturnValue"(%0) : (!spirv.arm.tensor<3xsi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = () -> !spirv.arm.tensor<3xf32>, sym_name = "float_arm_tensor_const"}> ({
    %0 = "spirv.Constant"() <{value = dense<[3.000000e+00, 4.000000e+00, 5.000000e+00]> : !spirv.arm.tensor<3xf32>}> : () -> !spirv.arm.tensor<3xf32>
    "spirv.ReturnValue"(%0) : (!spirv.arm.tensor<3xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (!spirv.arm.tensor<*xi32>) -> (), sym_name = "unranked_int_arm_tensor"}> ({
  ^bb0(%arg0: !spirv.arm.tensor<*xi32>):
    "spirv.Return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (!spirv.arm.tensor<?xi32>) -> (), sym_name = "unshaped_int_arm_tensor"}> ({
  ^bb0(%arg0: !spirv.arm.tensor<?xi32>):
    "spirv.Return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (!spirv.arm.tensor<?x?xi32>) -> (), sym_name = "unshaped_int_arm_tensor_2"}> ({
  ^bb0(%arg0: !spirv.arm.tensor<?x?xi32>):
    "spirv.Return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (!spirv.arm.tensor<2xbf16>) -> (), sym_name = "shaped_bf16_arm_tensor"}> ({
  ^bb0(%arg0: !spirv.arm.tensor<2xbf16>):
    "spirv.Return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (!spirv.arm.tensor<2xf8E4M3FN>) -> (), sym_name = "shaped_fp8e4m3fn_arm_tensor"}> ({
  ^bb0(%arg0: !spirv.arm.tensor<2xf8E4M3FN>):
    "spirv.Return"() : () -> ()
  }) : () -> ()
}) : () -> ()

