"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index
    "gpu.launch_func"(%1, %1, %1, %1, %1, %1) <{kernel = @kernels_1::@builtin_workgroup_id_x, operandSegmentSizes = array<i32: 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0>}> : (index, index, index, index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "gpu.module"() <{sym_name = "kernels_1"}> ({
    "gpu.func"() <{function_type = () -> ()}> ({
      %0 = "gpu.block_id"() <{dimension = #gpu<dim x>}> : () -> index
      "gpu.return"() : () -> ()
    }) {gpu.kernel, spirv.entry_point_abi = #spirv.entry_point_abi<workgroup_size = [16, 1, 1]>, sym_name = "builtin_workgroup_id_x", workgroup_attributions = 0 : i64} : () -> ()
  }) : () -> ()
}) {gpu.container_module, spirv.target_env = #spirv.target_env<#spirv.vce<v1.0, [Shader], []>, #spirv.resource_limits<>>} : () -> ()

