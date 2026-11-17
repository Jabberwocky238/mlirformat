"builtin.module"() ({
  "gpu.module"() <{sym_name = "kernels", targets = [#spirv.target_env<#spirv.vce<v1.0, [Shader], [SPV_KHR_storage_buffer_storage_class]>, #spirv.resource_limits<>>]}> ({
    "gpu.func"() <{function_type = (memref<12x4xf32>) -> (), kernel}> ({
    ^bb0(%arg0: memref<12x4xf32> loc("<stdin>":4:10)):
      %0 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":5:12)
      %1 = "memref.load"(%arg0, %0, %0) : (memref<12x4xf32>, index, index) -> f32 loc("<stdin>":6:12)
      "gpu.return"() : () -> () loc("<stdin>":7:7)
    }) {spirv.entry_point_abi = #spirv.entry_point_abi<workgroup_size = [16, 1, 1]>, sym_name = "load_kernel"} : () -> () loc("<stdin>":3:5)
  }) : () -> () loc("<stdin>":2:3)
}) {gpu.container_module} : () -> () loc("<stdin>":1:1)
