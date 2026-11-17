"builtin.module"() ({
  "spirv.module"() <{addressing_model = #spirv.addressing_model<Physical64>, memory_model = #spirv.memory_model<OpenCL>}> ({
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (f32, !spirv.ptr<!spirv.struct<(!spirv.array<12 x f32>)>, CrossWorkgroup>) -> (), sym_name = "kernel"}> ({
    ^bb0(%arg0: f32 loc("<stdin>":4:10), %arg1: !spirv.ptr<!spirv.struct<(!spirv.array<12 x f32>)>, CrossWorkgroup> loc("<stdin>":4:22)):
      "spirv.Return"() : () -> () loc("<stdin>":5:7)
    }) {spirv.entry_point_abi = #spirv.entry_point_abi<workgroup_size = [32, 1, 1], subgroup_size = 64>} : () -> () loc("<stdin>":3:5)
  }) : () -> () loc("<stdin>":2:3)
}) {spirv.target_env = #spirv.target_env<#spirv.vce<v1.0, [Kernel, Addresses], []>, #spirv.resource_limits<>>} : () -> () loc("<stdin>":1:1)
