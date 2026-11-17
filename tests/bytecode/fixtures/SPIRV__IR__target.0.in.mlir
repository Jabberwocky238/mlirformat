"builtin.module"() ({
  "gpu.module"() <{sym_name = "module_1", targets = [#spirv.target_env<#spirv.vce<v1.0, [Kernel], []>, #spirv.resource_limits<>>]}> ({
  ^bb0:
  }) : () -> () loc("<stdin>":2:3)
  "gpu.module"() <{sym_name = "module_2", targets = [#spirv.target_env<#spirv.vce<v1.0, [Kernel], []>, api=OpenCL, #spirv.resource_limits<>>]}> ({
  ^bb0:
  }) : () -> () loc("<stdin>":5:3)
  "gpu.module"() <{sym_name = "module_3", targets = [#spirv.target_env<#spirv.vce<v1.0, [Kernel], []>, api=OpenCL, Intel:IntegratedGPU, #spirv.resource_limits<>>]}> ({
  ^bb0:
  }) : () -> () loc("<stdin>":8:3)
}) : () -> () loc("<stdin>":1:1)
