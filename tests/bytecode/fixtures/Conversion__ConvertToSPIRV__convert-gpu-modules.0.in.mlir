"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %2 = "arith.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":3:10)
    "gpu.launch_func"(%2, %2, %2, %2, %2, %2) <{kernel = @kernels_1::@builtin_workgroup_id_x, operandSegmentSizes = array<i32: 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0>}> : (index, index, index, index, index, index) -> () loc("<stdin>":4:5)
    "gpu.launch_func"(%2, %2, %2, %2, %2, %2) <{kernel = @KERNELS_2::@builtin_workgroup_id_y, operandSegmentSizes = array<i32: 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0>}> : (index, index, index, index, index, index) -> () loc("<stdin>":5:5)
    "func.return"() : () -> () loc("<stdin>":6:5)
  }) : () -> () loc("<stdin>":2:3)
  "gpu.module"() <{sym_name = "kernels_1"}> ({
    "gpu.func"() <{function_type = () -> (), kernel}> ({
      %1 = "gpu.block_id"() <{dimension = #gpu<dim x>}> : () -> index loc("<stdin>":10:12)
      "gpu.return"() : () -> () loc("<stdin>":11:7)
    }) {spirv.entry_point_abi = #spirv.entry_point_abi<workgroup_size = [16, 1, 1]>, sym_name = "builtin_workgroup_id_x"} : () -> () loc("<stdin>":9:5)
  }) : () -> () loc("<stdin>":8:3)
  "gpu.module"() <{sym_name = "KERNELS_2"}> ({
    "gpu.func"() <{function_type = () -> (), kernel}> ({
      %0 = "gpu.block_id"() <{dimension = #gpu<dim y>}> : () -> index loc("<stdin>":16:12)
      "gpu.return"() : () -> () loc("<stdin>":17:7)
    }) {spirv.entry_point_abi = #spirv.entry_point_abi<workgroup_size = [16, 1, 1]>, sym_name = "builtin_workgroup_id_y"} : () -> () loc("<stdin>":15:5)
  }) : () -> () loc("<stdin>":14:3)
}) {gpu.container_module, spirv.target_env = #spirv.target_env<#spirv.vce<v1.0, [Shader], []>, #spirv.resource_limits<>>} : () -> () loc("<stdin>":1:1)
