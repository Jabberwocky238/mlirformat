#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>
"builtin.module"() ({
  "func.func"() <{function_type = () -> !sparse_tensor.storage_specifier<#sparse>, sym_name = "sparse_metadata_init"}> ({
    %2 = "sparse_tensor.storage_specifier.init"() : () -> !sparse_tensor.storage_specifier<#sparse>
    "func.return"(%2) : (!sparse_tensor.storage_specifier<#sparse>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (!sparse_tensor.storage_specifier<#sparse>) -> index, sym_name = "sparse_get_md"}> ({
  ^bb0(%arg2: !sparse_tensor.storage_specifier<#sparse>):
    %1 = "sparse_tensor.storage_specifier.get"(%arg2) <{level = 0 : index, specifierKind = #sparse_tensor<kind lvl_sz>}> : (!sparse_tensor.storage_specifier<#sparse>) -> index
    "func.return"(%1) : (index) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (!sparse_tensor.storage_specifier<#sparse>, index) -> !sparse_tensor.storage_specifier<#sparse>, sym_name = "sparse_set_md"}> ({
  ^bb0(%arg0: !sparse_tensor.storage_specifier<#sparse>, %arg1: index):
    %0 = "sparse_tensor.storage_specifier.set"(%arg0, %arg1) <{level = 0 : index, specifierKind = #sparse_tensor<kind lvl_sz>}> : (!sparse_tensor.storage_specifier<#sparse>, index) -> !sparse_tensor.storage_specifier<#sparse>
    "func.return"(%0) : (!sparse_tensor.storage_specifier<#sparse>) -> ()
  }) : () -> ()
}) : () -> ()

