"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %2 = "arith.constant"() <{value = 1 : index}> : () -> index
    "gpu.launch_func"(%2, %2, %2, %2, %2, %2) <{kernel = @kernels_1::@builtin_workgroup_id_x, operandSegmentSizes = array<i32: 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0>}> : (index, index, index, index, index, index) -> ()
    "gpu.launch_func"(%2, %2, %2, %2, %2, %2) <{kernel = @KERNELS_2::@builtin_workgroup_id_y, operandSegmentSizes = array<i32: 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0>}> : (index, index, index, index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "gpu.module"() <{sym_name = "kernels_1"}> ({
    "gpu.func"() <{function_type = () -> ()}> ({
      %1 = "gpu.block_id"() <{dimension = #gpu<dim x>}> : () -> index
      "gpu.return"() : () -> ()
    }) {gpu.kernel, spirv.entry_point_abi = #spirv.entry_point_abi<workgroup_size = [16, 1, 1]>, sym_name = "builtin_workgroup_id_x", workgroup_attributions = 0 : i64} : () -> ()
  }) : () -> ()
  "gpu.module"() <{sym_name = "KERNELS_2"}> ({
    "gpu.func"() <{function_type = () -> ()}> ({
      %0 = "gpu.block_id"() <{dimension = #gpu<dim y>}> : () -> index
      "gpu.return"() : () -> ()
    }) {gpu.kernel, spirv.entry_point_abi = #spirv.entry_point_abi<workgroup_size = [16, 1, 1]>, sym_name = "builtin_workgroup_id_y", workgroup_attributions = 0 : i64} : () -> ()
  }) : () -> ()
}) {gpu.container_module, spirv.target_env = #spirv.target_env<#spirv.vce<v1.0, [Shader], []>, #spirv.resource_limits<>>} : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<2xi32>, memref<4xi32>) -> (), sym_name = "main"}> ({
  ^bb0(%arg2: memref<2xi32>, %arg3: memref<4xi32>):
    %6 = "arith.constant"() <{value = 1 : index}> : () -> index
    "gpu.launch_func"(%6, %6, %6, %6, %6, %6, %arg2, %arg3) <{kernel = @kernels::@kernel_foo, operandSegmentSizes = array<i32: 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 2, 0>}> : (index, index, index, index, index, index, memref<2xi32>, memref<4xi32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "gpu.module"() <{sym_name = "kernels"}> ({
    "gpu.func"() <{function_type = (memref<2xi32>, memref<4xi32>) -> ()}> ({
    ^bb0(%arg0: memref<2xi32>, %arg1: memref<4xi32>):
      %0 = "arith.constant"() <{value = 0 : index}> : () -> index
      %1 = "arith.constant"() <{value = dense<0> : vector<2xi32>}> : () -> vector<2xi32>
      %2 = "memref.load"(%arg0, %0) : (memref<2xi32>, index) -> i32
      %3 = "vector.insert"(%2, %1, %0) <{static_position = array<i64: -9223372036854775808>}> : (i32, vector<2xi32>, index) -> vector<2xi32>
      %4 = "vector.shuffle"(%3, %3) <{mask = array<i64: 3, 2, 1, 0>}> : (vector<2xi32>, vector<2xi32>) -> vector<4xi32>
      %5 = "vector.extract"(%4, %0) <{static_position = array<i64: -9223372036854775808>}> : (vector<4xi32>, index) -> i32
      "memref.store"(%5, %arg1, %0) : (i32, memref<4xi32>, index) -> ()
      "gpu.return"() : () -> ()
    }) {gpu.kernel, spirv.entry_point_abi = #spirv.entry_point_abi<workgroup_size = [1, 1, 1]>, sym_name = "kernel_foo", workgroup_attributions = 0 : i64} : () -> ()
  }) : () -> ()
}) {gpu.container_module, spirv.target_env = #spirv.target_env<#spirv.vce<v1.0, [Shader], [SPV_KHR_storage_buffer_storage_class]>, #spirv.resource_limits<>>} : () -> ()

