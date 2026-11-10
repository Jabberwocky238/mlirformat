module {
  spirv.GlobalVariable @entrypoint_arg_0 bind(0, 0) : !spirv.ptr<!spirv.arm.tensor<14x19xi16>, UniformConstant>
  spirv.GlobalVariable @entrypoint_res_0 bind(0, 1) : !spirv.ptr<!spirv.arm.tensor<14x19xi16>, UniformConstant>
  spirv.ARM.GraphEntryPoint @entrypoint, @entrypoint_arg_0, @entrypoint_res_0
}

