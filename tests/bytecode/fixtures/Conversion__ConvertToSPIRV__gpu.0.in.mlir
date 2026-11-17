"builtin.module"() ({
  "gpu.module"() <{sym_name = "kernels"}> ({
    "gpu.func"() <{function_type = (f32) -> (), kernel}> ({
    ^bb0(%arg0: f32 loc("<stdin>":4:10)):
      %0 = "gpu.all_reduce"(%arg0) <{op = #gpu<all_reduce_op add>}> ({
      }) : (f32) -> f32 loc("<stdin>":5:12)
      "gpu.return"() : () -> () loc("<stdin>":7:7)
    }) {spirv.entry_point_abi = #spirv.entry_point_abi<workgroup_size = [16, 1, 1]>, sym_name = "all_reduce"} : () -> () loc("<stdin>":3:5)
  }) : () -> () loc("<stdin>":2:3)
}) {gpu.container_module, spirv.target_env = #spirv.target_env<#spirv.vce<v1.3, [Kernel, Addresses, Groups, GroupNonUniformArithmetic, GroupUniformArithmeticKHR], []>, #spirv.resource_limits<>>} : () -> () loc("<stdin>":1:1)
