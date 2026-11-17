"builtin.module"() ({
  "spirv.module"() <{addressing_model = #spirv.addressing_model<Logical>, memory_model = #spirv.memory_model<Vulkan>, vce_triple = #spirv.vce<v1.3, [VulkanMemoryModel, Shader, TensorsARM, Linkage], [SPV_KHR_vulkan_memory_model, SPV_ARM_tensors]>}> ({
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = () -> !spirv.arm.tensor<3xi32>, sym_name = "rank_1_arm_tensor_of_i32"}> ({
      %11 = "spirv.Constant"() <{value = dense<[1, 2, 3]> : !spirv.arm.tensor<3xi32>}> : () -> !spirv.arm.tensor<3xi32> loc("<stdin>":4:13)
      "spirv.ReturnValue"(%11) : (!spirv.arm.tensor<3xi32>) -> () loc("<stdin>":5:7)
    }) : () -> () loc("<stdin>":3:5)
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = () -> !spirv.arm.tensor<2x3xi32>, sym_name = "rank_2_arm_tensor_of_i32"}> ({
      %10 = "spirv.Constant"() <{value = dense<[[1, 2, 3], [4, 5, 6]]> : !spirv.arm.tensor<2x3xi32>}> : () -> !spirv.arm.tensor<2x3xi32> loc("<stdin>":8:13)
      "spirv.ReturnValue"(%10) : (!spirv.arm.tensor<2x3xi32>) -> () loc("<stdin>":9:7)
    }) : () -> () loc("<stdin>":7:5)
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = () -> !spirv.arm.tensor<2x2x3xi32>, sym_name = "rank_3_arm_tensor_of_i32"}> ({
      %9 = "spirv.Constant"() <{value = dense<[[[1, 2, 3], [4, 5, 6]], [[7, 8, 9], [10, 11, 12]]]> : !spirv.arm.tensor<2x2x3xi32>}> : () -> !spirv.arm.tensor<2x2x3xi32> loc("<stdin>":12:12)
      "spirv.ReturnValue"(%9) : (!spirv.arm.tensor<2x2x3xi32>) -> () loc("<stdin>":13:7)
    }) : () -> () loc("<stdin>":11:5)
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = () -> !spirv.arm.tensor<2x3x4x5xi32>, sym_name = "rank_4_arm_tensor_of_i32"}> ({
      %8 = "spirv.Constant"() <{value = dense<5> : !spirv.arm.tensor<2x3x4x5xi32>}> : () -> !spirv.arm.tensor<2x3x4x5xi32> loc("<stdin>":16:12)
      "spirv.ReturnValue"(%8) : (!spirv.arm.tensor<2x3x4x5xi32>) -> () loc("<stdin>":17:7)
    }) : () -> () loc("<stdin>":15:5)
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = () -> !spirv.arm.tensor<2x3xi32>, sym_name = "splat_arm_tensor_of_i32"}> ({
      %7 = "spirv.Constant"() <{value = dense<2> : !spirv.arm.tensor<2x3xi32>}> : () -> !spirv.arm.tensor<2x3xi32> loc("<stdin>":20:12)
      "spirv.ReturnValue"(%7) : (!spirv.arm.tensor<2x3xi32>) -> () loc("<stdin>":21:7)
    }) : () -> () loc("<stdin>":19:5)
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = () -> !spirv.arm.tensor<3xf32>, sym_name = "rank_1_arm_tensor_of_f32"}> ({
      %6 = "spirv.Constant"() <{value = dense<[1.000000e+00, 2.000000e+00, 3.000000e+00]> : !spirv.arm.tensor<3xf32>}> : () -> !spirv.arm.tensor<3xf32> loc("<stdin>":24:12)
      "spirv.ReturnValue"(%6) : (!spirv.arm.tensor<3xf32>) -> () loc("<stdin>":25:7)
    }) : () -> () loc("<stdin>":23:5)
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = () -> !spirv.arm.tensor<2x3xf32>, sym_name = "rank_2_arm_tensor_of_f32"}> ({
      %5 = "spirv.Constant"() <{value = dense<[[1.000000e+00, 2.000000e+00, 3.000000e+00], [4.000000e+00, 5.000000e+00, 6.000000e+00]]> : !spirv.arm.tensor<2x3xf32>}> : () -> !spirv.arm.tensor<2x3xf32> loc("<stdin>":28:12)
      "spirv.ReturnValue"(%5) : (!spirv.arm.tensor<2x3xf32>) -> () loc("<stdin>":29:7)
    }) : () -> () loc("<stdin>":27:5)
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = () -> !spirv.arm.tensor<2x2x3xf32>, sym_name = "rank_3_arm_tensor_of_f32"}> ({
      %4 = "spirv.Constant"() <{value = dense<[[[1.000000e+00, 2.000000e+00, 3.000000e+00], [4.000000e+00, 5.000000e+00, 6.000000e+00]], [[7.000000e+00, 8.000000e+00, 9.000000e+00], [1.000000e+01, 1.100000e+01, 1.200000e+01]]]> : !spirv.arm.tensor<2x2x3xf32>}> : () -> !spirv.arm.tensor<2x2x3xf32> loc("<stdin>":32:12)
      "spirv.ReturnValue"(%4) : (!spirv.arm.tensor<2x2x3xf32>) -> () loc("<stdin>":33:7)
    }) : () -> () loc("<stdin>":31:5)
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = () -> !spirv.arm.tensor<2x3x4x5xf32>, sym_name = "rank_4_arm_tensor_of_f32"}> ({
      %3 = "spirv.Constant"() <{value = dense<5.000000e+00> : !spirv.arm.tensor<2x3x4x5xf32>}> : () -> !spirv.arm.tensor<2x3x4x5xf32> loc("<stdin>":36:12)
      "spirv.ReturnValue"(%3) : (!spirv.arm.tensor<2x3x4x5xf32>) -> () loc("<stdin>":37:7)
    }) : () -> () loc("<stdin>":35:5)
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = () -> !spirv.arm.tensor<2x3xf32>, sym_name = "splat_arm_tensor_of_f32"}> ({
      %2 = "spirv.Constant"() <{value = dense<2.000000e+00> : !spirv.arm.tensor<2x3xf32>}> : () -> !spirv.arm.tensor<2x3xf32> loc("<stdin>":40:12)
      "spirv.ReturnValue"(%2) : (!spirv.arm.tensor<2x3xf32>) -> () loc("<stdin>":41:7)
    }) : () -> () loc("<stdin>":39:5)
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = () -> !spirv.arm.tensor<2x3xi32>, sym_name = "null_arm_tensor_of_i32"}> ({
      %1 = "spirv.Constant"() <{value = dense<0> : !spirv.arm.tensor<2x3xi32>}> : () -> !spirv.arm.tensor<2x3xi32> loc("<stdin>":44:12)
      "spirv.ReturnValue"(%1) : (!spirv.arm.tensor<2x3xi32>) -> () loc("<stdin>":45:7)
    }) : () -> () loc("<stdin>":43:5)
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = () -> !spirv.arm.tensor<2x3xf32>, sym_name = "null_arm_tensor_of_f32"}> ({
      %0 = "spirv.Constant"() <{value = dense<0.000000e+00> : !spirv.arm.tensor<2x3xf32>}> : () -> !spirv.arm.tensor<2x3xf32> loc("<stdin>":48:12)
      "spirv.ReturnValue"(%0) : (!spirv.arm.tensor<2x3xf32>) -> () loc("<stdin>":49:7)
    }) : () -> () loc("<stdin>":47:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
