"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "builtin"}> ({
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":3:10)
    "gpu.launch_func"(%1, %1, %1, %1, %1, %1) <{kernel = @kernels::@builtin_workgroup_id_x, operandSegmentSizes = array<i32: 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0>}> : (index, index, index, index, index, index) -> () loc("<stdin>":4:5)
    "func.return"() : () -> () loc("<stdin>":5:5)
  }) : () -> () loc("<stdin>":2:3)
  "gpu.module"() <{sym_name = "kernels"}> ({
    "gpu.func"() <{function_type = () -> (), kernel}> ({
      %0 = "gpu.block_id"() <{dimension = #gpu<dim x>}> : () -> index loc("<stdin>":9:12)
      "gpu.return"() : () -> () loc("<stdin>":10:7)
    }) {spirv.entry_point_abi = #spirv.entry_point_abi<workgroup_size = [16, 1, 1]>, sym_name = "builtin_workgroup_id_x"} : () -> () loc("<stdin>":8:5)
  }) : () -> () loc("<stdin>":7:3)
}) {gpu.container_module, spirv.target_env = #spirv.target_env<#spirv.vce<v1.0, [Shader, Int64], []>, #spirv.resource_limits<>>} : () -> () loc("<stdin>":1:1)
