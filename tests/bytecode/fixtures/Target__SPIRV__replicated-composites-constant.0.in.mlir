"builtin.module"() ({
  "spirv.module"() <{addressing_model = #spirv.addressing_model<Logical>, memory_model = #spirv.memory_model<GLSL450>, vce_triple = #spirv.vce<v1.0, [Shader, ReplicatedCompositesEXT, TensorsARM, Linkage], [SPV_EXT_replicated_composites, SPV_ARM_tensors]>}> ({
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = () -> vector<3xi32>, sym_name = "splat_vector_i32"}> ({
      %17 = "spirv.EXT.ConstantCompositeReplicate"() <{value = 1 : i32}> : () -> vector<3xi32> loc("<stdin>":4:13)
      "spirv.ReturnValue"(%17) : (vector<3xi32>) -> () loc("<stdin>":5:7)
    }) : () -> () loc("<stdin>":3:5)
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = () -> !spirv.array<3 x i32>, sym_name = "splat_array_of_i32"}> ({
      %16 = "spirv.EXT.ConstantCompositeReplicate"() <{value = 1 : i32}> : () -> !spirv.array<3 x i32> loc("<stdin>":8:13)
      "spirv.ReturnValue"(%16) : (!spirv.array<3 x i32>) -> () loc("<stdin>":9:7)
    }) : () -> () loc("<stdin>":7:5)
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = () -> !spirv.array<3 x vector<2xi32>>, sym_name = "splat_array_of_vectors_of_i32"}> ({
      %15 = "spirv.EXT.ConstantCompositeReplicate"() <{value = dense<[1, 2]> : vector<2xi32>}> : () -> !spirv.array<3 x vector<2xi32>> loc("<stdin>":12:13)
      "spirv.ReturnValue"(%15) : (!spirv.array<3 x vector<2xi32>>) -> () loc("<stdin>":13:7)
    }) : () -> () loc("<stdin>":11:5)
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = () -> !spirv.array<2 x !spirv.array<3 x i32>>, sym_name = "splat_array_of_splat_array_of_i32"}> ({
      %14 = "spirv.EXT.ConstantCompositeReplicate"() <{value = 3 : i32}> : () -> !spirv.array<2 x !spirv.array<3 x i32>> loc("<stdin>":16:13)
      "spirv.ReturnValue"(%14) : (!spirv.array<2 x !spirv.array<3 x i32>>) -> () loc("<stdin>":17:7)
    }) : () -> () loc("<stdin>":15:5)
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = () -> !spirv.array<2 x !spirv.array<3 x i32>>, sym_name = "splat_array_of_non_splat_array_of_i32"}> ({
      %13 = "spirv.EXT.ConstantCompositeReplicate"() <{value = [1 : i32, 2 : i32, 3 : i32]}> : () -> !spirv.array<2 x !spirv.array<3 x i32>> loc("<stdin>":20:13)
      "spirv.ReturnValue"(%13) : (!spirv.array<2 x !spirv.array<3 x i32>>) -> () loc("<stdin>":21:7)
    }) : () -> () loc("<stdin>":19:5)
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = () -> !spirv.array<2 x vector<2xi32>>, sym_name = "splat_array_of_splat_vectors_of_i32"}> ({
      %12 = "spirv.EXT.ConstantCompositeReplicate"() <{value = 2 : i32}> : () -> !spirv.array<2 x vector<2xi32>> loc("<stdin>":24:13)
      "spirv.ReturnValue"(%12) : (!spirv.array<2 x vector<2xi32>>) -> () loc("<stdin>":25:7)
    }) : () -> () loc("<stdin>":23:5)
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = () -> !spirv.arm.tensor<2x3xi32>, sym_name = "splat_arm_tensor_of_i32"}> ({
      %11 = "spirv.EXT.ConstantCompositeReplicate"() <{value = 2 : i32}> : () -> !spirv.arm.tensor<2x3xi32> loc("<stdin>":28:13)
      "spirv.ReturnValue"(%11) : (!spirv.arm.tensor<2x3xi32>) -> () loc("<stdin>":29:7)
    }) : () -> () loc("<stdin>":27:5)
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = () -> !spirv.array<2 x !spirv.array<2 x !spirv.array<3 x i32>>>, sym_name = "splat_array_of_non_splat_array_of_arrays_of_i32"}> ({
      %10 = "spirv.EXT.ConstantCompositeReplicate"() <{value = [[1 : i32, 2 : i32, 3 : i32], [4 : i32, 5 : i32, 6 : i32]]}> : () -> !spirv.array<2 x !spirv.array<2 x !spirv.array<3 x i32>>> loc("<stdin>":32:13)
      "spirv.ReturnValue"(%10) : (!spirv.array<2 x !spirv.array<2 x !spirv.array<3 x i32>>>) -> () loc("<stdin>":33:7)
    }) : () -> () loc("<stdin>":31:5)
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = () -> !spirv.arm.tensor<2x3xi32>, sym_name = "null_cc_arm_tensor_of_i32"}> ({
      %9 = "spirv.EXT.ConstantCompositeReplicate"() <{value = 0 : i32}> : () -> !spirv.arm.tensor<2x3xi32> loc("<stdin>":36:12)
      "spirv.ReturnValue"(%9) : (!spirv.arm.tensor<2x3xi32>) -> () loc("<stdin>":37:7)
    }) : () -> () loc("<stdin>":35:5)
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = () -> vector<3xf32>, sym_name = "splat_vector_f32"}> ({
      %8 = "spirv.EXT.ConstantCompositeReplicate"() <{value = 1.000000e+00 : f32}> : () -> vector<3xf32> loc("<stdin>":40:12)
      "spirv.ReturnValue"(%8) : (vector<3xf32>) -> () loc("<stdin>":41:7)
    }) : () -> () loc("<stdin>":39:5)
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = () -> !spirv.array<3 x f32>, sym_name = "splat_array_of_f32"}> ({
      %7 = "spirv.EXT.ConstantCompositeReplicate"() <{value = 1.000000e+00 : f32}> : () -> !spirv.array<3 x f32> loc("<stdin>":44:12)
      "spirv.ReturnValue"(%7) : (!spirv.array<3 x f32>) -> () loc("<stdin>":45:7)
    }) : () -> () loc("<stdin>":43:5)
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = () -> !spirv.array<2 x !spirv.array<3 x f32>>, sym_name = "splat_array_of_splat_array_of_f32"}> ({
      %6 = "spirv.EXT.ConstantCompositeReplicate"() <{value = 3.000000e+00 : f32}> : () -> !spirv.array<2 x !spirv.array<3 x f32>> loc("<stdin>":48:12)
      "spirv.ReturnValue"(%6) : (!spirv.array<2 x !spirv.array<3 x f32>>) -> () loc("<stdin>":49:7)
    }) : () -> () loc("<stdin>":47:5)
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = () -> !spirv.array<2 x !spirv.array<3 x f32>>, sym_name = "splat_array_of_non_splat_array_of_f32"}> ({
      %5 = "spirv.EXT.ConstantCompositeReplicate"() <{value = [1.000000e+00 : f32, 2.000000e+00 : f32, 3.000000e+00 : f32]}> : () -> !spirv.array<2 x !spirv.array<3 x f32>> loc("<stdin>":52:12)
      "spirv.ReturnValue"(%5) : (!spirv.array<2 x !spirv.array<3 x f32>>) -> () loc("<stdin>":53:7)
    }) : () -> () loc("<stdin>":51:5)
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = () -> !spirv.array<3 x vector<2xf32>>, sym_name = "splat_array_of_vectors_of_f32"}> ({
      %4 = "spirv.EXT.ConstantCompositeReplicate"() <{value = dense<[1.000000e+00, 2.000000e+00]> : vector<2xf32>}> : () -> !spirv.array<3 x vector<2xf32>> loc("<stdin>":56:12)
      "spirv.ReturnValue"(%4) : (!spirv.array<3 x vector<2xf32>>) -> () loc("<stdin>":57:7)
    }) : () -> () loc("<stdin>":55:5)
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = () -> !spirv.array<2 x vector<2xf32>>, sym_name = "splat_array_of_splat_vectors_of_f32"}> ({
      %3 = "spirv.EXT.ConstantCompositeReplicate"() <{value = 2.000000e+00 : f32}> : () -> !spirv.array<2 x vector<2xf32>> loc("<stdin>":60:12)
      "spirv.ReturnValue"(%3) : (!spirv.array<2 x vector<2xf32>>) -> () loc("<stdin>":61:7)
    }) : () -> () loc("<stdin>":59:5)
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = () -> !spirv.arm.tensor<2x3xf32>, sym_name = "splat_arm_tensor_of_f32"}> ({
      %2 = "spirv.EXT.ConstantCompositeReplicate"() <{value = 2.000000e+00 : f32}> : () -> !spirv.arm.tensor<2x3xf32> loc("<stdin>":64:12)
      "spirv.ReturnValue"(%2) : (!spirv.arm.tensor<2x3xf32>) -> () loc("<stdin>":65:7)
    }) : () -> () loc("<stdin>":63:5)
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = () -> !spirv.array<2 x !spirv.array<2 x !spirv.array<3 x f32>>>, sym_name = "splat_array_of_non_splat_array_of_arrays_of_f32"}> ({
      %1 = "spirv.EXT.ConstantCompositeReplicate"() <{value = [[1.000000e+00 : f32, 2.000000e+00 : f32, 3.000000e+00 : f32], [4.000000e+00 : f32, 5.000000e+00 : f32, 6.000000e+00 : f32]]}> : () -> !spirv.array<2 x !spirv.array<2 x !spirv.array<3 x f32>>> loc("<stdin>":68:12)
      "spirv.ReturnValue"(%1) : (!spirv.array<2 x !spirv.array<2 x !spirv.array<3 x f32>>>) -> () loc("<stdin>":69:7)
    }) : () -> () loc("<stdin>":67:5)
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = () -> !spirv.arm.tensor<2x3xf32>, sym_name = "null_cc_arm_tensor_of_f32"}> ({
      %0 = "spirv.EXT.ConstantCompositeReplicate"() <{value = 0.000000e+00 : f32}> : () -> !spirv.arm.tensor<2x3xf32> loc("<stdin>":72:12)
      "spirv.ReturnValue"(%0) : (!spirv.arm.tensor<2x3xf32>) -> () loc("<stdin>":73:7)
    }) : () -> () loc("<stdin>":71:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
