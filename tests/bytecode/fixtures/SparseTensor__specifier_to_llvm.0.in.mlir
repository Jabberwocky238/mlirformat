"builtin.module"() ({
  "func.func"() <{function_type = () -> !sparse_tensor.storage_specifier<#sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>>, sym_name = "sparse_metadata_init"}> ({
    %2 = "sparse_tensor.storage_specifier.init"() : () -> !sparse_tensor.storage_specifier<#sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>> loc("<stdin>":4:10)
    "func.return"(%2) : (!sparse_tensor.storage_specifier<#sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>>) -> () loc("<stdin>":5:5)
  }) : () -> () loc("<stdin>":3:3)
  "func.func"() <{function_type = (!sparse_tensor.storage_specifier<#sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>>) -> index, sym_name = "sparse_get_md"}> ({
  ^bb0(%arg2: !sparse_tensor.storage_specifier<#sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>> loc("<stdin>":8:8)):
    %1 = "sparse_tensor.storage_specifier.get"(%arg2) <{level = 0 : index, specifierKind = #sparse_tensor<kind lvl_sz>}> : (!sparse_tensor.storage_specifier<#sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>>) -> index loc("<stdin>":9:10)
    "func.return"(%1) : (index) -> () loc("<stdin>":10:5)
  }) : () -> () loc("<stdin>":7:3)
  "func.func"() <{function_type = (!sparse_tensor.storage_specifier<#sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>>, index) -> !sparse_tensor.storage_specifier<#sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>>, sym_name = "sparse_set_md"}> ({
  ^bb0(%arg0: !sparse_tensor.storage_specifier<#sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>> loc("<stdin>":13:8), %arg1: index loc("<stdin>":13:58)):
    %0 = "sparse_tensor.storage_specifier.set"(%arg0, %arg1) <{level = 0 : index, specifierKind = #sparse_tensor<kind lvl_sz>}> : (!sparse_tensor.storage_specifier<#sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>>, index) -> !sparse_tensor.storage_specifier<#sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>> loc("<stdin>":14:10)
    "func.return"(%0) : (!sparse_tensor.storage_specifier<#sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>>) -> () loc("<stdin>":15:5)
  }) : () -> () loc("<stdin>":12:3)
}) : () -> () loc("<stdin>":2:1)
