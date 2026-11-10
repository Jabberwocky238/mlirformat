"builtin.module"() ({
  "spirv.GlobalVariable"() <{binding = 0 : i32, descriptor_set = 0 : i32, sym_name = "entrypoint_arg_0", type = !spirv.ptr<!spirv.arm.tensor<14x19xi16>, UniformConstant>}> : () -> ()
  "spirv.GlobalVariable"() <{binding = 1 : i32, descriptor_set = 0 : i32, sym_name = "entrypoint_res_0", type = !spirv.ptr<!spirv.arm.tensor<14x19xi16>, UniformConstant>}> : () -> ()
  "spirv.ARM.GraphEntryPoint"() <{fn = @entrypoint, interface = [@entrypoint_arg_0, @entrypoint_res_0]}> : () -> ()
}) : () -> ()

