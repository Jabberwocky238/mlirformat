"builtin.module"() ({
  "gpu.module"() <{sym_name = "kernels"}> ({
    "gpu.func"() <{function_type = () -> (), kernel}> ({
      %0 = "arith.constant"() <{value = 8 : i32}> : () -> i32 loc("<stdin>":4:12)
      %1 = "arith.constant"() <{value = 16 : i32}> : () -> i32 loc("<stdin>":5:12)
      %2 = "arith.constant"() <{value = 4.200000e+01 : f32}> : () -> f32 loc("<stdin>":6:12)
      %3:2 = "gpu.shuffle"(%2, %0, %1) <{mode = #gpu<shuffle_mode xor>}> : (f32, i32, i32) -> (f32, i1) loc("<stdin>":7:14)
      "gpu.return"() : () -> () loc("<stdin>":8:7)
    }) {spirv.entry_point_abi = #spirv.entry_point_abi<workgroup_size = [16, 1, 1]>, sym_name = "shuffle_xor"} : () -> () loc("<stdin>":3:5)
  }) : () -> () loc("<stdin>":2:3)
}) {gpu.container_module, spirv.target_env = #spirv.target_env<#spirv.vce<v1.4, [Shader, GroupNonUniformShuffle], []>, #spirv.resource_limits<subgroup_size = 16>>} : () -> () loc("<stdin>":1:1)
