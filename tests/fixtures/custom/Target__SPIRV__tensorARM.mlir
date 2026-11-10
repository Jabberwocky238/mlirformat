module {
  spirv.func @shaped_rank2_int_arm_tensor(%arg0: !spirv.arm.tensor<2x3xi32>) "None" {
    spirv.Return
  }
}

// -----
module {
  spirv.func @ui64_arm_tensor_const() -> !spirv.arm.tensor<3xui64> "None" {
    %cst = spirv.Constant dense<[5, 6, 7]> : !spirv.arm.tensor<3xui64>
    spirv.ReturnValue %cst : !spirv.arm.tensor<3xui64>
  }
}

// -----
module {
  spirv.func @si32_arm_tensor_const() -> !spirv.arm.tensor<3xsi32> "None" {
    %cst = spirv.Constant dense<[5, 6, 7]> : !spirv.arm.tensor<3xsi32>
    spirv.ReturnValue %cst : !spirv.arm.tensor<3xsi32>
  }
}

// -----
module {
  spirv.func @float_arm_tensor_const() -> !spirv.arm.tensor<3xf32> "None" {
    %cst = spirv.Constant dense<[3.000000e+00, 4.000000e+00, 5.000000e+00]> : !spirv.arm.tensor<3xf32>
    spirv.ReturnValue %cst : !spirv.arm.tensor<3xf32>
  }
}

// -----
module {
  spirv.func @unranked_int_arm_tensor(%arg0: !spirv.arm.tensor<*xi32>) "None" {
    spirv.Return
  }
}

// -----
module {
  spirv.func @unshaped_int_arm_tensor(%arg0: !spirv.arm.tensor<?xi32>) "None" {
    spirv.Return
  }
}

// -----
module {
  spirv.func @unshaped_int_arm_tensor_2(%arg0: !spirv.arm.tensor<?x?xi32>) "None" {
    spirv.Return
  }
}

// -----
module {
  spirv.func @shaped_bf16_arm_tensor(%arg0: !spirv.arm.tensor<2xbf16>) "None" {
    spirv.Return
  }
}

// -----
module {
  spirv.func @shaped_fp8e4m3fn_arm_tensor(%arg0: !spirv.arm.tensor<2xf8E4M3FN>) "None" {
    spirv.Return
  }
}

