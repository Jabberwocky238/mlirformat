module {
  func.func @cmp_exchange_weak_suitable_version_capabilities(%arg0: !spirv.ptr<i32, Workgroup>, %arg1: i32, %arg2: i32) -> i32 attributes {spirv.target_env = #spirv.target_env<#spirv.vce<v1.1, [Kernel, AtomicStorage], []>, #spirv.resource_limits<>>} {
    %0 = "test.convert_to_atomic_compare_exchange_weak_op"(%arg0, %arg1, %arg2) : (!spirv.ptr<i32, Workgroup>, i32, i32) -> i32
    return %0 : i32
  }
  func.func @cmp_exchange_weak_unsupported_version(%arg0: !spirv.ptr<i32, Workgroup>, %arg1: i32, %arg2: i32) -> i32 attributes {spirv.target_env = #spirv.target_env<#spirv.vce<v1.4, [Kernel, AtomicStorage], []>, #spirv.resource_limits<>>} {
    %0 = "test.convert_to_atomic_compare_exchange_weak_op"(%arg0, %arg1, %arg2) : (!spirv.ptr<i32, Workgroup>, i32, i32) -> i32
    return %0 : i32
  }
  func.func @group_non_uniform_ballot_suitable_version(%arg0: i1) -> vector<4xi32> attributes {spirv.target_env = #spirv.target_env<#spirv.vce<v1.4, [GroupNonUniformBallot], []>, #spirv.resource_limits<>>} {
    %0 = "test.convert_to_group_non_uniform_ballot_op"(%arg0) : (i1) -> vector<4xi32>
    return %0 : vector<4xi32>
  }
  func.func @group_non_uniform_ballot_unsupported_version(%arg0: i1) -> vector<4xi32> attributes {spirv.target_env = #spirv.target_env<#spirv.vce<v1.1, [GroupNonUniformBallot], []>, #spirv.resource_limits<>>} {
    %0 = "test.convert_to_group_non_uniform_ballot_op"(%arg0) : (i1) -> vector<4xi32>
    return %0 : vector<4xi32>
  }
  func.func @cmp_exchange_weak_missing_capability_kernel(%arg0: !spirv.ptr<i32, Workgroup>, %arg1: i32, %arg2: i32) -> i32 attributes {spirv.target_env = #spirv.target_env<#spirv.vce<v1.3, [AtomicStorage], []>, #spirv.resource_limits<>>} {
    %0 = "test.convert_to_atomic_compare_exchange_weak_op"(%arg0, %arg1, %arg2) : (!spirv.ptr<i32, Workgroup>, i32, i32) -> i32
    return %0 : i32
  }
  func.func @cmp_exchange_weak_missing_capability_atomic_storage(%arg0: !spirv.ptr<i32, Workgroup>, %arg1: i32, %arg2: i32) -> i32 attributes {spirv.target_env = #spirv.target_env<#spirv.vce<v1.3, [Kernel], []>, #spirv.resource_limits<>>} {
    %0 = "test.convert_to_atomic_compare_exchange_weak_op"(%arg0, %arg1, %arg2) : (!spirv.ptr<i32, Workgroup>, i32, i32) -> i32
    return %0 : i32
  }
  func.func @subgroup_ballot_missing_capability(%arg0: i1) -> vector<4xi32> attributes {spirv.target_env = #spirv.target_env<#spirv.vce<v1.4, [], [SPV_KHR_shader_ballot]>, #spirv.resource_limits<>>} {
    %0 = "test.convert_to_subgroup_ballot_op"(%arg0) : (i1) -> vector<4xi32>
    return %0 : vector<4xi32>
  }
  func.func @bit_reverse_directly_implied_capability(%arg0: i32) -> i32 attributes {spirv.target_env = #spirv.target_env<#spirv.vce<v1.0, [Geometry], []>, #spirv.resource_limits<>>} {
    %0 = "test.convert_to_bit_reverse_op"(%arg0) : (i32) -> i32
    return %0 : i32
  }
  func.func @bit_reverse_recursively_implied_capability(%arg0: i32) -> i32 attributes {spirv.target_env = #spirv.target_env<#spirv.vce<v1.0, [GeometryPointSize], []>, #spirv.resource_limits<>>} {
    %0 = "test.convert_to_bit_reverse_op"(%arg0) : (i32) -> i32
    return %0 : i32
  }
  func.func @sdot_scalar_i32_i32_capabilities(%arg0: i32) -> i32 attributes {spirv.target_env = #spirv.target_env<#spirv.vce<v1.0, [DotProduct, DotProductInput4x8BitPacked], [SPV_KHR_integer_dot_product]>, #spirv.resource_limits<>>} {
    %0 = "test.convert_to_sdot_op"(%arg0, %arg0) {format = #spirv.packed_vector_format<PackedVectorFormat4x8Bit>} : (i32, i32) -> i32
    return %0 : i32
  }
  func.func @sdot_scalar_i32_i32_missing_capability1(%arg0: i32) -> i32 attributes {spirv.target_env = #spirv.target_env<#spirv.vce<v1.0, [DotProduct], [SPV_KHR_integer_dot_product]>, #spirv.resource_limits<>>} {
    %0 = "test.convert_to_sdot_op"(%arg0, %arg0) {format = #spirv.packed_vector_format<PackedVectorFormat4x8Bit>} : (i32, i32) -> i32
    return %0 : i32
  }
  func.func @sdot_scalar_i32_i32_missing_capability2(%arg0: i32) -> i32 attributes {spirv.target_env = #spirv.target_env<#spirv.vce<v1.0, [DotProductInput4x8BitPacked], [SPV_KHR_integer_dot_product]>, #spirv.resource_limits<>>} {
    %0 = "test.convert_to_sdot_op"(%arg0, %arg0) {format = #spirv.packed_vector_format<PackedVectorFormat4x8Bit>} : (i32, i32) -> i32
    return %0 : i32
  }
  func.func @sudot_vector_4xi8_i32_capabilities(%arg0: vector<4xi8>) -> i32 attributes {spirv.target_env = #spirv.target_env<#spirv.vce<v1.0, [DotProduct, DotProductInput4x8Bit], [SPV_KHR_integer_dot_product]>, #spirv.resource_limits<>>} {
    %0 = "test.convert_to_sudot_op"(%arg0, %arg0) : (vector<4xi8>, vector<4xi8>) -> i32
    return %0 : i32
  }
  func.func @sudot_vector_4xi8_i32_missing_capability1(%arg0: vector<4xi8>) -> i32 attributes {spirv.target_env = #spirv.target_env<#spirv.vce<v1.0, [DotProduct], [SPV_KHR_integer_dot_product]>, #spirv.resource_limits<>>} {
    %0 = "test.convert_to_sudot_op"(%arg0, %arg0) : (vector<4xi8>, vector<4xi8>) -> i32
    return %0 : i32
  }
  func.func @sudot_vector_4xi8_i32_missing_capability2(%arg0: vector<4xi8>) -> i32 attributes {spirv.target_env = #spirv.target_env<#spirv.vce<v1.0, [DotProductInput4x8Bit], [SPV_KHR_integer_dot_product]>, #spirv.resource_limits<>>} {
    %0 = "test.convert_to_sudot_op"(%arg0, %arg0) : (vector<4xi8>, vector<4xi8>) -> i32
    return %0 : i32
  }
  func.func @udot_vector_4xi16_i64_capabilities(%arg0: vector<4xi16>) -> i64 attributes {spirv.target_env = #spirv.target_env<#spirv.vce<v1.0, [DotProduct, DotProductInputAll, Int16, Int64], [SPV_KHR_integer_dot_product]>, #spirv.resource_limits<>>} {
    %0 = "test.convert_to_udot_op"(%arg0, %arg0) : (vector<4xi16>, vector<4xi16>) -> i64
    return %0 : i64
  }
  func.func @udot_vector_4xi16_i64_missing_capability1(%arg0: vector<4xi16>) -> i64 attributes {spirv.target_env = #spirv.target_env<#spirv.vce<v1.0, [DotProduct, Int16, Int64], [SPV_KHR_integer_dot_product]>, #spirv.resource_limits<>>} {
    %0 = "test.convert_to_udot_op"(%arg0, %arg0) : (vector<4xi16>, vector<4xi16>) -> i64
    return %0 : i64
  }
  func.func @udot_vector_4xi16_i64_missing_capability2(%arg0: vector<4xi16>) -> i64 attributes {spirv.target_env = #spirv.target_env<#spirv.vce<v1.0, [DotProductInputAll, Int16, Int64], [SPV_KHR_integer_dot_product]>, #spirv.resource_limits<>>} {
    %0 = "test.convert_to_udot_op"(%arg0, %arg0) : (vector<4xi16>, vector<4xi16>) -> i64
    return %0 : i64
  }
  func.func @sdot_acc_sat_scalar_i32_i32_capabilities(%arg0: i32) -> i32 attributes {spirv.target_env = #spirv.target_env<#spirv.vce<v1.0, [DotProduct, DotProductInput4x8BitPacked], [SPV_KHR_integer_dot_product]>, #spirv.resource_limits<>>} {
    %0 = "test.convert_to_sdot_acc_sat_op"(%arg0, %arg0, %arg0) {format = #spirv.packed_vector_format<PackedVectorFormat4x8Bit>} : (i32, i32, i32) -> i32
    return %0 : i32
  }
  func.func @sudot_acc_sat_vector_4xi8_i32_capabilities(%arg0: vector<4xi8>, %arg1: i32) -> i32 attributes {spirv.target_env = #spirv.target_env<#spirv.vce<v1.0, [DotProduct, DotProductInput4x8Bit], [SPV_KHR_integer_dot_product]>, #spirv.resource_limits<>>} {
    %0 = "test.convert_to_sudot_acc_sat_op"(%arg0, %arg0, %arg1) : (vector<4xi8>, vector<4xi8>, i32) -> i32
    return %0 : i32
  }
  func.func @udot_acc_sat_vector_4xi8_i32_missing_capability1(%arg0: vector<4xi8>, %arg1: i32) -> i32 attributes {spirv.target_env = #spirv.target_env<#spirv.vce<v1.0, [DotProduct, DotProductInputAll, Int16, Int64], [SPV_KHR_integer_dot_product]>, #spirv.resource_limits<>>} {
    %0 = "test.convert_to_udot_acc_sat_op"(%arg0, %arg0, %arg1) : (vector<4xi8>, vector<4xi8>, i32) -> i32
    return %0 : i32
  }
  func.func @udot_acc_sat_vector_4xi8_i32_missing_capability2(%arg0: vector<4xi8>, %arg1: i32) -> i32 attributes {spirv.target_env = #spirv.target_env<#spirv.vce<v1.0, [DotProductInputAll, DotProductInput4x8Bit, Int16, Int64], [SPV_KHR_integer_dot_product]>, #spirv.resource_limits<>>} {
    %0 = "test.convert_to_udot_acc_sat_op"(%arg0, %arg0, %arg1) : (vector<4xi8>, vector<4xi8>, i32) -> i32
    return %0 : i32
  }
  func.func @udot_acc_sat_vector_4xi16_i64_capabilities(%arg0: vector<4xi16>, %arg1: i64) -> i64 attributes {spirv.target_env = #spirv.target_env<#spirv.vce<v1.0, [DotProduct, DotProductInputAll, Int16, Int64], [SPV_KHR_integer_dot_product]>, #spirv.resource_limits<>>} {
    %0 = "test.convert_to_udot_acc_sat_op"(%arg0, %arg0, %arg1) : (vector<4xi16>, vector<4xi16>, i64) -> i64
    return %0 : i64
  }
  func.func @udot_acc_sat_vector_4xi16_i64_missing_capability1(%arg0: vector<4xi16>, %arg1: i64) -> i64 attributes {spirv.target_env = #spirv.target_env<#spirv.vce<v1.0, [DotProductInputAll, Int16, Int64], [SPV_KHR_integer_dot_product]>, #spirv.resource_limits<>>} {
    %0 = "test.convert_to_udot_acc_sat_op"(%arg0, %arg0, %arg1) : (vector<4xi16>, vector<4xi16>, i64) -> i64
    return %0 : i64
  }
  func.func @udot_acc_sat_vector_4xi16_i64_missing_capability2(%arg0: vector<4xi16>, %arg1: i64) -> i64 attributes {spirv.target_env = #spirv.target_env<#spirv.vce<v1.0, [DotProduct, Int16, Int64], [SPV_KHR_integer_dot_product]>, #spirv.resource_limits<>>} {
    %0 = "test.convert_to_udot_acc_sat_op"(%arg0, %arg0, %arg1) : (vector<4xi16>, vector<4xi16>, i64) -> i64
    return %0 : i64
  }
  func.func @subgroup_ballot_suitable_extension(%arg0: i1) -> vector<4xi32> attributes {spirv.target_env = #spirv.target_env<#spirv.vce<v1.4, [SubgroupBallotKHR], [SPV_KHR_shader_ballot]>, #spirv.resource_limits<>>} {
    %0 = "test.convert_to_subgroup_ballot_op"(%arg0) : (i1) -> vector<4xi32>
    return %0 : vector<4xi32>
  }
  func.func @subgroup_ballot_missing_extension(%arg0: i1) -> vector<4xi32> attributes {spirv.target_env = #spirv.target_env<#spirv.vce<v1.4, [SubgroupBallotKHR], []>, #spirv.resource_limits<>>} {
    %0 = "test.convert_to_subgroup_ballot_op"(%arg0) : (i1) -> vector<4xi32>
    return %0 : vector<4xi32>
  }
  func.func @module_suitable_extension1() attributes {spirv.target_env = #spirv.target_env<#spirv.vce<v1.0, [VulkanMemoryModel, PhysicalStorageBufferAddresses], [SPV_KHR_vulkan_memory_model, SPV_EXT_physical_storage_buffer]>, #spirv.resource_limits<>>} {
    "test.convert_to_module_op"() : () -> ()
    return
  }
  func.func @module_suitable_extension2() attributes {spirv.target_env = #spirv.target_env<#spirv.vce<v1.0, [VulkanMemoryModel, PhysicalStorageBufferAddresses], [SPV_KHR_vulkan_memory_model, SPV_KHR_physical_storage_buffer]>, #spirv.resource_limits<>>} {
    "test.convert_to_module_op"() : () -> ()
    return
  }
  func.func @module_missing_extension_mm() attributes {spirv.target_env = #spirv.target_env<#spirv.vce<v1.0, [VulkanMemoryModel, PhysicalStorageBufferAddresses], [SPV_KHR_physical_storage_buffer]>, #spirv.resource_limits<>>} {
    "test.convert_to_module_op"() : () -> ()
    return
  }
  func.func @module_missing_extension_am() attributes {spirv.target_env = #spirv.target_env<#spirv.vce<v1.0, [VulkanMemoryModel, PhysicalStorageBufferAddresses], [SPV_KHR_vulkan_memory_model]>, #spirv.resource_limits<>>} {
    "test.convert_to_module_op"() : () -> ()
    return
  }
  func.func @module_implied_extension() attributes {spirv.target_env = #spirv.target_env<#spirv.vce<v1.5, [VulkanMemoryModel, PhysicalStorageBufferAddresses], []>, #spirv.resource_limits<>>} {
    "test.convert_to_module_op"() : () -> ()
    return
  }
  func.func @udot_vector_4xi16_i64_implied_extension(%arg0: vector<4xi16>) -> i64 attributes {spirv.target_env = #spirv.target_env<#spirv.vce<v1.6, [DotProduct, DotProductInputAll, Int16, Int64], []>, #spirv.resource_limits<>>} {
    %0 = "test.convert_to_udot_op"(%arg0, %arg0) : (vector<4xi16>, vector<4xi16>) -> i64
    return %0 : i64
  }
  func.func @udot_vector_4xi16_i64_missing_extension(%arg0: vector<4xi16>) -> i64 attributes {spirv.target_env = #spirv.target_env<#spirv.vce<v1.5, [DotProduct, DotProductInputAll, Int16, Int64], []>, #spirv.resource_limits<>>} {
    %0 = "test.convert_to_udot_op"(%arg0, %arg0) : (vector<4xi16>, vector<4xi16>) -> i64
    return %0 : i64
  }
  func.func @sdot_acc_sat_vector_4xi16_i64_implied_extension(%arg0: vector<4xi16>, %arg1: i64) -> i64 attributes {spirv.target_env = #spirv.target_env<#spirv.vce<v1.6, [DotProduct, DotProductInputAll, Int16, Int64], []>, #spirv.resource_limits<>>} {
    %0 = "test.convert_to_sdot_acc_sat_op"(%arg0, %arg0, %arg1) : (vector<4xi16>, vector<4xi16>, i64) -> i64
    return %0 : i64
  }
  func.func @sdot_acc_sat_vector_4xi16_i64_missing_extension(%arg0: vector<4xi16>, %arg1: i64) -> i64 attributes {spirv.target_env = #spirv.target_env<#spirv.vce<v1.5, [DotProduct, DotProductInputAll, Int16, Int64], []>, #spirv.resource_limits<>>} {
    %0 = "test.convert_to_sdot_acc_sat_op"(%arg0, %arg0, %arg1) : (vector<4xi16>, vector<4xi16>, i64) -> i64
    return %0 : i64
  }
}

