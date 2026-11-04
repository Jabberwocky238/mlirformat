#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>
module {
  func.func @sparse_metadata_init() -> !sparse_tensor.storage_specifier<#sparse> {
    %0 = sparse_tensor.storage_specifier.init : !sparse_tensor.storage_specifier<#sparse>
    return %0 : !sparse_tensor.storage_specifier<#sparse>
  }
  func.func @sparse_get_md(%arg0: !sparse_tensor.storage_specifier<#sparse>) -> index {
    %0 = sparse_tensor.storage_specifier.get %arg0  lvl_sz at 0 : !sparse_tensor.storage_specifier<#sparse>
    return %0 : index
  }
  func.func @sparse_set_md(%arg0: !sparse_tensor.storage_specifier<#sparse>, %arg1: index) -> !sparse_tensor.storage_specifier<#sparse> {
    %0 = sparse_tensor.storage_specifier.set %arg0  lvl_sz at 0 with %arg1 : !sparse_tensor.storage_specifier<#sparse>
    return %0 : !sparse_tensor.storage_specifier<#sparse>
  }
}

