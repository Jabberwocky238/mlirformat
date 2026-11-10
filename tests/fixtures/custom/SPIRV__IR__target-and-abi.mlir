module {
  func.func @spv_entry_point() attributes {spirv.entry_point_abi = #spirv.entry_point_abi<workgroup_size = [64, 1, 1]>} {
    return
  }
}

// -----
module {
  func.func @interface_var(%arg0: f32 {spirv.interface_var_abi = #spirv.interface_var_abi<(0, 1), Uniform>}) {
    return
  }
}

// -----
module {
  func.func @interface_var(%arg0: f32 {spirv.interface_var_abi = #spirv.interface_var_abi<(0, 1)>}) {
    return
  }
}

// -----
module {
  func.func @resource_limits_all_default() attributes {limits = #spirv.resource_limits<>} {
    return
  }
}

// -----
module {
  func.func @resource_limits_min_max_subgroup_size() attributes {limits = #spirv.resource_limits<min_subgroup_size = 32, max_subgroup_size = 64>} {
    return
  }
}

// -----
module {
  func.func @target_env() attributes {spirv.target_env = #spirv.target_env<#spirv.vce<v1.0, [Shader], [SPV_KHR_storage_buffer_storage_class]>, #spirv.resource_limits<max_compute_workgroup_size = [128, 64, 64]>>} {
    return
  }
}

// -----
module {
  func.func @target_env_client_api() attributes {spirv.target_env = #spirv.target_env<#spirv.vce<v1.0, [], []>, api=Metal, #spirv.resource_limits<>>} {
    return
  }
}

// -----
module {
  func.func @target_env_client_api() attributes {spirv.target_env = #spirv.target_env<#spirv.vce<v1.0, [], []>, #spirv.resource_limits<>>} {
    return
  }
}

// -----
module {
  func.func @target_env_vendor_id() attributes {spirv.target_env = #spirv.target_env<#spirv.vce<v1.0, [], []>, NVIDIA, #spirv.resource_limits<>>} {
    return
  }
}

// -----
module {
  func.func @target_env_vendor_id_device_type() attributes {spirv.target_env = #spirv.target_env<#spirv.vce<v1.0, [], []>, AMD:DiscreteGPU, #spirv.resource_limits<>>} {
    return
  }
}

// -----
module {
  func.func @target_env_vendor_id_device_type_device_id() attributes {spirv.target_env = #spirv.target_env<#spirv.vce<v1.0, [], []>, Qualcomm:IntegratedGPU:100925441, #spirv.resource_limits<>>} {
    return
  }
}

// -----
module {
  func.func @target_env_client_api_vendor_id_device_type_device_id() attributes {spirv.target_env = #spirv.target_env<#spirv.vce<v1.0, [], []>, api=Vulkan, Qualcomm:IntegratedGPU:100925441, #spirv.resource_limits<>>} {
    return
  }
}

// -----
module {
  func.func @target_env_cooperative_matrix_khr() attributes {spirv.target_env = #spirv.target_env<#spirv.vce<v1.0, [Shader], [SPV_KHR_storage_buffer_storage_class, SPV_KHR_cooperative_matrix]>, #spirv.resource_limits<cooperative_matrix_properties_khr = [#spirv.coop_matrix_props_khr<m_size = 8, n_size = 8, k_size = 32, a_type = i8, b_type = i8, c_type = i32, result_type = i32, acc_sat = true, scope = <Subgroup>>, #spirv.coop_matrix_props_khr<m_size = 8, n_size = 8, k_size = 16, a_type = f16, b_type = f16, c_type = f16, result_type = f16, acc_sat = false, scope = <Subgroup>>]>>} {
    return
  }
}

// -----
module {
  func.func @vce() attributes {vce = #spirv.vce<v1.0, [Shader], [SPV_KHR_storage_buffer_storage_class]>} {
    return
  }
}

