"builtin.module"() ({
  "gpu.module"() <{sym_name = "kernels"}> ({
    "gpu.func"() <{function_type = () -> (), kernel}> ({
      %0 = "arith.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":4:12)
      %1 = "gpu.lane_id"() : () -> index loc("<stdin>":5:12)
      %2 = "arith.cmpi"(%1, %0) <{predicate = 6 : i64}> : (index, index) -> i1 loc("<stdin>":6:12)
      %3 = "gpu.ballot"(%2) : (i1) -> i32 loc("<stdin>":7:12)
      "gpu.return"() : () -> () loc("<stdin>":8:7)
    }) {spirv.entry_point_abi = #spirv.entry_point_abi<workgroup_size = [32, 1, 1]>, sym_name = "ballot_i32"} : () -> () loc("<stdin>":3:5)
  }) : () -> () loc("<stdin>":2:3)
}) {gpu.container_module, spirv.target_env = #spirv.target_env<#spirv.vce<v1.3, [Shader, GroupNonUniformBallot], []>, #spirv.resource_limits<>>} : () -> () loc("<stdin>":1:1)
