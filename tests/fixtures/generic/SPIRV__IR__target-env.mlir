"builtin.module"() ({
  "func.func"() <{function_type = (!spirv.ptr<i32, Workgroup>, i32, i32) -> i32, sym_name = "cmp_exchange_weak_suitable_version_capabilities"}> ({
  ^bb0(%arg44: !spirv.ptr<i32, Workgroup>, %arg45: i32, %arg46: i32):
    %30 = "test.convert_to_atomic_compare_exchange_weak_op"(%arg44, %arg45, %arg46) : (!spirv.ptr<i32, Workgroup>, i32, i32) -> i32
    "func.return"(%30) : (i32) -> ()
  }) {spirv.target_env = #spirv.target_env<#spirv.vce<v1.1, [Kernel, AtomicStorage], []>, #spirv.resource_limits<>>} : () -> ()
  "func.func"() <{function_type = (!spirv.ptr<i32, Workgroup>, i32, i32) -> i32, sym_name = "cmp_exchange_weak_unsupported_version"}> ({
  ^bb0(%arg41: !spirv.ptr<i32, Workgroup>, %arg42: i32, %arg43: i32):
    %29 = "test.convert_to_atomic_compare_exchange_weak_op"(%arg41, %arg42, %arg43) : (!spirv.ptr<i32, Workgroup>, i32, i32) -> i32
    "func.return"(%29) : (i32) -> ()
  }) {spirv.target_env = #spirv.target_env<#spirv.vce<v1.4, [Kernel, AtomicStorage], []>, #spirv.resource_limits<>>} : () -> ()
  "func.func"() <{function_type = (i1) -> vector<4xi32>, sym_name = "group_non_uniform_ballot_suitable_version"}> ({
  ^bb0(%arg40: i1):
    %28 = "test.convert_to_group_non_uniform_ballot_op"(%arg40) : (i1) -> vector<4xi32>
    "func.return"(%28) : (vector<4xi32>) -> ()
  }) {spirv.target_env = #spirv.target_env<#spirv.vce<v1.4, [GroupNonUniformBallot], []>, #spirv.resource_limits<>>} : () -> ()
  "func.func"() <{function_type = (i1) -> vector<4xi32>, sym_name = "group_non_uniform_ballot_unsupported_version"}> ({
  ^bb0(%arg39: i1):
    %27 = "test.convert_to_group_non_uniform_ballot_op"(%arg39) : (i1) -> vector<4xi32>
    "func.return"(%27) : (vector<4xi32>) -> ()
  }) {spirv.target_env = #spirv.target_env<#spirv.vce<v1.1, [GroupNonUniformBallot], []>, #spirv.resource_limits<>>} : () -> ()
  "func.func"() <{function_type = (!spirv.ptr<i32, Workgroup>, i32, i32) -> i32, sym_name = "cmp_exchange_weak_missing_capability_kernel"}> ({
  ^bb0(%arg36: !spirv.ptr<i32, Workgroup>, %arg37: i32, %arg38: i32):
    %26 = "test.convert_to_atomic_compare_exchange_weak_op"(%arg36, %arg37, %arg38) : (!spirv.ptr<i32, Workgroup>, i32, i32) -> i32
    "func.return"(%26) : (i32) -> ()
  }) {spirv.target_env = #spirv.target_env<#spirv.vce<v1.3, [AtomicStorage], []>, #spirv.resource_limits<>>} : () -> ()
  "func.func"() <{function_type = (!spirv.ptr<i32, Workgroup>, i32, i32) -> i32, sym_name = "cmp_exchange_weak_missing_capability_atomic_storage"}> ({
  ^bb0(%arg33: !spirv.ptr<i32, Workgroup>, %arg34: i32, %arg35: i32):
    %25 = "test.convert_to_atomic_compare_exchange_weak_op"(%arg33, %arg34, %arg35) : (!spirv.ptr<i32, Workgroup>, i32, i32) -> i32
    "func.return"(%25) : (i32) -> ()
  }) {spirv.target_env = #spirv.target_env<#spirv.vce<v1.3, [Kernel], []>, #spirv.resource_limits<>>} : () -> ()
  "func.func"() <{function_type = (i1) -> vector<4xi32>, sym_name = "subgroup_ballot_missing_capability"}> ({
  ^bb0(%arg32: i1):
    %24 = "test.convert_to_subgroup_ballot_op"(%arg32) : (i1) -> vector<4xi32>
    "func.return"(%24) : (vector<4xi32>) -> ()
  }) {spirv.target_env = #spirv.target_env<#spirv.vce<v1.4, [], [SPV_KHR_shader_ballot]>, #spirv.resource_limits<>>} : () -> ()
  "func.func"() <{function_type = (i32) -> i32, sym_name = "bit_reverse_directly_implied_capability"}> ({
  ^bb0(%arg31: i32):
    %23 = "test.convert_to_bit_reverse_op"(%arg31) : (i32) -> i32
    "func.return"(%23) : (i32) -> ()
  }) {spirv.target_env = #spirv.target_env<#spirv.vce<v1.0, [Geometry], []>, #spirv.resource_limits<>>} : () -> ()
  "func.func"() <{function_type = (i32) -> i32, sym_name = "bit_reverse_recursively_implied_capability"}> ({
  ^bb0(%arg30: i32):
    %22 = "test.convert_to_bit_reverse_op"(%arg30) : (i32) -> i32
    "func.return"(%22) : (i32) -> ()
  }) {spirv.target_env = #spirv.target_env<#spirv.vce<v1.0, [GeometryPointSize], []>, #spirv.resource_limits<>>} : () -> ()
  "func.func"() <{function_type = (i32) -> i32, sym_name = "sdot_scalar_i32_i32_capabilities"}> ({
  ^bb0(%arg29: i32):
    %21 = "test.convert_to_sdot_op"(%arg29, %arg29) {format = #spirv.packed_vector_format<PackedVectorFormat4x8Bit>} : (i32, i32) -> i32
    "func.return"(%21) : (i32) -> ()
  }) {spirv.target_env = #spirv.target_env<#spirv.vce<v1.0, [DotProduct, DotProductInput4x8BitPacked], [SPV_KHR_integer_dot_product]>, #spirv.resource_limits<>>} : () -> ()
  "func.func"() <{function_type = (i32) -> i32, sym_name = "sdot_scalar_i32_i32_missing_capability1"}> ({
  ^bb0(%arg28: i32):
    %20 = "test.convert_to_sdot_op"(%arg28, %arg28) {format = #spirv.packed_vector_format<PackedVectorFormat4x8Bit>} : (i32, i32) -> i32
    "func.return"(%20) : (i32) -> ()
  }) {spirv.target_env = #spirv.target_env<#spirv.vce<v1.0, [DotProduct], [SPV_KHR_integer_dot_product]>, #spirv.resource_limits<>>} : () -> ()
  "func.func"() <{function_type = (i32) -> i32, sym_name = "sdot_scalar_i32_i32_missing_capability2"}> ({
  ^bb0(%arg27: i32):
    %19 = "test.convert_to_sdot_op"(%arg27, %arg27) {format = #spirv.packed_vector_format<PackedVectorFormat4x8Bit>} : (i32, i32) -> i32
    "func.return"(%19) : (i32) -> ()
  }) {spirv.target_env = #spirv.target_env<#spirv.vce<v1.0, [DotProductInput4x8BitPacked], [SPV_KHR_integer_dot_product]>, #spirv.resource_limits<>>} : () -> ()
  "func.func"() <{function_type = (vector<4xi8>) -> i32, sym_name = "sudot_vector_4xi8_i32_capabilities"}> ({
  ^bb0(%arg26: vector<4xi8>):
    %18 = "test.convert_to_sudot_op"(%arg26, %arg26) : (vector<4xi8>, vector<4xi8>) -> i32
    "func.return"(%18) : (i32) -> ()
  }) {spirv.target_env = #spirv.target_env<#spirv.vce<v1.0, [DotProduct, DotProductInput4x8Bit], [SPV_KHR_integer_dot_product]>, #spirv.resource_limits<>>} : () -> ()
  "func.func"() <{function_type = (vector<4xi8>) -> i32, sym_name = "sudot_vector_4xi8_i32_missing_capability1"}> ({
  ^bb0(%arg25: vector<4xi8>):
    %17 = "test.convert_to_sudot_op"(%arg25, %arg25) : (vector<4xi8>, vector<4xi8>) -> i32
    "func.return"(%17) : (i32) -> ()
  }) {spirv.target_env = #spirv.target_env<#spirv.vce<v1.0, [DotProduct], [SPV_KHR_integer_dot_product]>, #spirv.resource_limits<>>} : () -> ()
  "func.func"() <{function_type = (vector<4xi8>) -> i32, sym_name = "sudot_vector_4xi8_i32_missing_capability2"}> ({
  ^bb0(%arg24: vector<4xi8>):
    %16 = "test.convert_to_sudot_op"(%arg24, %arg24) : (vector<4xi8>, vector<4xi8>) -> i32
    "func.return"(%16) : (i32) -> ()
  }) {spirv.target_env = #spirv.target_env<#spirv.vce<v1.0, [DotProductInput4x8Bit], [SPV_KHR_integer_dot_product]>, #spirv.resource_limits<>>} : () -> ()
  "func.func"() <{function_type = (vector<4xi16>) -> i64, sym_name = "udot_vector_4xi16_i64_capabilities"}> ({
  ^bb0(%arg23: vector<4xi16>):
    %15 = "test.convert_to_udot_op"(%arg23, %arg23) : (vector<4xi16>, vector<4xi16>) -> i64
    "func.return"(%15) : (i64) -> ()
  }) {spirv.target_env = #spirv.target_env<#spirv.vce<v1.0, [DotProduct, DotProductInputAll, Int16, Int64], [SPV_KHR_integer_dot_product]>, #spirv.resource_limits<>>} : () -> ()
  "func.func"() <{function_type = (vector<4xi16>) -> i64, sym_name = "udot_vector_4xi16_i64_missing_capability1"}> ({
  ^bb0(%arg22: vector<4xi16>):
    %14 = "test.convert_to_udot_op"(%arg22, %arg22) : (vector<4xi16>, vector<4xi16>) -> i64
    "func.return"(%14) : (i64) -> ()
  }) {spirv.target_env = #spirv.target_env<#spirv.vce<v1.0, [DotProduct, Int16, Int64], [SPV_KHR_integer_dot_product]>, #spirv.resource_limits<>>} : () -> ()
  "func.func"() <{function_type = (vector<4xi16>) -> i64, sym_name = "udot_vector_4xi16_i64_missing_capability2"}> ({
  ^bb0(%arg21: vector<4xi16>):
    %13 = "test.convert_to_udot_op"(%arg21, %arg21) : (vector<4xi16>, vector<4xi16>) -> i64
    "func.return"(%13) : (i64) -> ()
  }) {spirv.target_env = #spirv.target_env<#spirv.vce<v1.0, [DotProductInputAll, Int16, Int64], [SPV_KHR_integer_dot_product]>, #spirv.resource_limits<>>} : () -> ()
  "func.func"() <{function_type = (i32) -> i32, sym_name = "sdot_acc_sat_scalar_i32_i32_capabilities"}> ({
  ^bb0(%arg20: i32):
    %12 = "test.convert_to_sdot_acc_sat_op"(%arg20, %arg20, %arg20) {format = #spirv.packed_vector_format<PackedVectorFormat4x8Bit>} : (i32, i32, i32) -> i32
    "func.return"(%12) : (i32) -> ()
  }) {spirv.target_env = #spirv.target_env<#spirv.vce<v1.0, [DotProduct, DotProductInput4x8BitPacked], [SPV_KHR_integer_dot_product]>, #spirv.resource_limits<>>} : () -> ()
  "func.func"() <{function_type = (vector<4xi8>, i32) -> i32, sym_name = "sudot_acc_sat_vector_4xi8_i32_capabilities"}> ({
  ^bb0(%arg18: vector<4xi8>, %arg19: i32):
    %11 = "test.convert_to_sudot_acc_sat_op"(%arg18, %arg18, %arg19) : (vector<4xi8>, vector<4xi8>, i32) -> i32
    "func.return"(%11) : (i32) -> ()
  }) {spirv.target_env = #spirv.target_env<#spirv.vce<v1.0, [DotProduct, DotProductInput4x8Bit], [SPV_KHR_integer_dot_product]>, #spirv.resource_limits<>>} : () -> ()
  "func.func"() <{function_type = (vector<4xi8>, i32) -> i32, sym_name = "udot_acc_sat_vector_4xi8_i32_missing_capability1"}> ({
  ^bb0(%arg16: vector<4xi8>, %arg17: i32):
    %10 = "test.convert_to_udot_acc_sat_op"(%arg16, %arg16, %arg17) : (vector<4xi8>, vector<4xi8>, i32) -> i32
    "func.return"(%10) : (i32) -> ()
  }) {spirv.target_env = #spirv.target_env<#spirv.vce<v1.0, [DotProduct, DotProductInputAll, Int16, Int64], [SPV_KHR_integer_dot_product]>, #spirv.resource_limits<>>} : () -> ()
  "func.func"() <{function_type = (vector<4xi8>, i32) -> i32, sym_name = "udot_acc_sat_vector_4xi8_i32_missing_capability2"}> ({
  ^bb0(%arg14: vector<4xi8>, %arg15: i32):
    %9 = "test.convert_to_udot_acc_sat_op"(%arg14, %arg14, %arg15) : (vector<4xi8>, vector<4xi8>, i32) -> i32
    "func.return"(%9) : (i32) -> ()
  }) {spirv.target_env = #spirv.target_env<#spirv.vce<v1.0, [DotProductInputAll, DotProductInput4x8Bit, Int16, Int64], [SPV_KHR_integer_dot_product]>, #spirv.resource_limits<>>} : () -> ()
  "func.func"() <{function_type = (vector<4xi16>, i64) -> i64, sym_name = "udot_acc_sat_vector_4xi16_i64_capabilities"}> ({
  ^bb0(%arg12: vector<4xi16>, %arg13: i64):
    %8 = "test.convert_to_udot_acc_sat_op"(%arg12, %arg12, %arg13) : (vector<4xi16>, vector<4xi16>, i64) -> i64
    "func.return"(%8) : (i64) -> ()
  }) {spirv.target_env = #spirv.target_env<#spirv.vce<v1.0, [DotProduct, DotProductInputAll, Int16, Int64], [SPV_KHR_integer_dot_product]>, #spirv.resource_limits<>>} : () -> ()
  "func.func"() <{function_type = (vector<4xi16>, i64) -> i64, sym_name = "udot_acc_sat_vector_4xi16_i64_missing_capability1"}> ({
  ^bb0(%arg10: vector<4xi16>, %arg11: i64):
    %7 = "test.convert_to_udot_acc_sat_op"(%arg10, %arg10, %arg11) : (vector<4xi16>, vector<4xi16>, i64) -> i64
    "func.return"(%7) : (i64) -> ()
  }) {spirv.target_env = #spirv.target_env<#spirv.vce<v1.0, [DotProductInputAll, Int16, Int64], [SPV_KHR_integer_dot_product]>, #spirv.resource_limits<>>} : () -> ()
  "func.func"() <{function_type = (vector<4xi16>, i64) -> i64, sym_name = "udot_acc_sat_vector_4xi16_i64_missing_capability2"}> ({
  ^bb0(%arg8: vector<4xi16>, %arg9: i64):
    %6 = "test.convert_to_udot_acc_sat_op"(%arg8, %arg8, %arg9) : (vector<4xi16>, vector<4xi16>, i64) -> i64
    "func.return"(%6) : (i64) -> ()
  }) {spirv.target_env = #spirv.target_env<#spirv.vce<v1.0, [DotProduct, Int16, Int64], [SPV_KHR_integer_dot_product]>, #spirv.resource_limits<>>} : () -> ()
  "func.func"() <{function_type = (i1) -> vector<4xi32>, sym_name = "subgroup_ballot_suitable_extension"}> ({
  ^bb0(%arg7: i1):
    %5 = "test.convert_to_subgroup_ballot_op"(%arg7) : (i1) -> vector<4xi32>
    "func.return"(%5) : (vector<4xi32>) -> ()
  }) {spirv.target_env = #spirv.target_env<#spirv.vce<v1.4, [SubgroupBallotKHR], [SPV_KHR_shader_ballot]>, #spirv.resource_limits<>>} : () -> ()
  "func.func"() <{function_type = (i1) -> vector<4xi32>, sym_name = "subgroup_ballot_missing_extension"}> ({
  ^bb0(%arg6: i1):
    %4 = "test.convert_to_subgroup_ballot_op"(%arg6) : (i1) -> vector<4xi32>
    "func.return"(%4) : (vector<4xi32>) -> ()
  }) {spirv.target_env = #spirv.target_env<#spirv.vce<v1.4, [SubgroupBallotKHR], []>, #spirv.resource_limits<>>} : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "module_suitable_extension1"}> ({
    "test.convert_to_module_op"() : () -> ()
    "func.return"() : () -> ()
  }) {spirv.target_env = #spirv.target_env<#spirv.vce<v1.0, [VulkanMemoryModel, PhysicalStorageBufferAddresses], [SPV_KHR_vulkan_memory_model, SPV_EXT_physical_storage_buffer]>, #spirv.resource_limits<>>} : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "module_suitable_extension2"}> ({
    "test.convert_to_module_op"() : () -> ()
    "func.return"() : () -> ()
  }) {spirv.target_env = #spirv.target_env<#spirv.vce<v1.0, [VulkanMemoryModel, PhysicalStorageBufferAddresses], [SPV_KHR_vulkan_memory_model, SPV_KHR_physical_storage_buffer]>, #spirv.resource_limits<>>} : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "module_missing_extension_mm"}> ({
    "test.convert_to_module_op"() : () -> ()
    "func.return"() : () -> ()
  }) {spirv.target_env = #spirv.target_env<#spirv.vce<v1.0, [VulkanMemoryModel, PhysicalStorageBufferAddresses], [SPV_KHR_physical_storage_buffer]>, #spirv.resource_limits<>>} : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "module_missing_extension_am"}> ({
    "test.convert_to_module_op"() : () -> ()
    "func.return"() : () -> ()
  }) {spirv.target_env = #spirv.target_env<#spirv.vce<v1.0, [VulkanMemoryModel, PhysicalStorageBufferAddresses], [SPV_KHR_vulkan_memory_model]>, #spirv.resource_limits<>>} : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "module_implied_extension"}> ({
    "test.convert_to_module_op"() : () -> ()
    "func.return"() : () -> ()
  }) {spirv.target_env = #spirv.target_env<#spirv.vce<v1.5, [VulkanMemoryModel, PhysicalStorageBufferAddresses], []>, #spirv.resource_limits<>>} : () -> ()
  "func.func"() <{function_type = (vector<4xi16>) -> i64, sym_name = "udot_vector_4xi16_i64_implied_extension"}> ({
  ^bb0(%arg5: vector<4xi16>):
    %3 = "test.convert_to_udot_op"(%arg5, %arg5) : (vector<4xi16>, vector<4xi16>) -> i64
    "func.return"(%3) : (i64) -> ()
  }) {spirv.target_env = #spirv.target_env<#spirv.vce<v1.6, [DotProduct, DotProductInputAll, Int16, Int64], []>, #spirv.resource_limits<>>} : () -> ()
  "func.func"() <{function_type = (vector<4xi16>) -> i64, sym_name = "udot_vector_4xi16_i64_missing_extension"}> ({
  ^bb0(%arg4: vector<4xi16>):
    %2 = "test.convert_to_udot_op"(%arg4, %arg4) : (vector<4xi16>, vector<4xi16>) -> i64
    "func.return"(%2) : (i64) -> ()
  }) {spirv.target_env = #spirv.target_env<#spirv.vce<v1.5, [DotProduct, DotProductInputAll, Int16, Int64], []>, #spirv.resource_limits<>>} : () -> ()
  "func.func"() <{function_type = (vector<4xi16>, i64) -> i64, sym_name = "sdot_acc_sat_vector_4xi16_i64_implied_extension"}> ({
  ^bb0(%arg2: vector<4xi16>, %arg3: i64):
    %1 = "test.convert_to_sdot_acc_sat_op"(%arg2, %arg2, %arg3) : (vector<4xi16>, vector<4xi16>, i64) -> i64
    "func.return"(%1) : (i64) -> ()
  }) {spirv.target_env = #spirv.target_env<#spirv.vce<v1.6, [DotProduct, DotProductInputAll, Int16, Int64], []>, #spirv.resource_limits<>>} : () -> ()
  "func.func"() <{function_type = (vector<4xi16>, i64) -> i64, sym_name = "sdot_acc_sat_vector_4xi16_i64_missing_extension"}> ({
  ^bb0(%arg0: vector<4xi16>, %arg1: i64):
    %0 = "test.convert_to_sdot_acc_sat_op"(%arg0, %arg0, %arg1) : (vector<4xi16>, vector<4xi16>, i64) -> i64
    "func.return"(%0) : (i64) -> ()
  }) {spirv.target_env = #spirv.target_env<#spirv.vce<v1.5, [DotProduct, DotProductInputAll, Int16, Int64], []>, #spirv.resource_limits<>>} : () -> ()
}) : () -> ()

