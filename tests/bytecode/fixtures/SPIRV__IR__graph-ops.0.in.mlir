"builtin.module"() ({
  "spirv.GlobalVariable"() <{binding = 0 : i32, descriptor_set = 0 : i32, sym_name = "entrypoint_arg_0", type = !spirv.ptr<!spirv.arm.tensor<14x19xi16>, UniformConstant>}> : () -> () loc("<stdin>":2:3)
  "spirv.GlobalVariable"() <{binding = 1 : i32, descriptor_set = 0 : i32, sym_name = "entrypoint_res_0", type = !spirv.ptr<!spirv.arm.tensor<14x19xi16>, UniformConstant>}> : () -> () loc("<stdin>":3:3)
  "spirv.ARM.GraphEntryPoint"() <{fn = @entrypoint, interface = [@entrypoint_arg_0, @entrypoint_res_0]}> : () -> () loc("<stdin>":4:3)
}) : () -> () loc("<stdin>":1:1)
