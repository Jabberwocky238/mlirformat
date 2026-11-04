#sparse = #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>
#sparse1 = #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>
#sparse2 = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed(nonunique), d1 : singleton) }>
#sparse3 = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 floordiv 2 : dense, d1 floordiv 3 : compressed, d0 mod 2 : dense, d1 mod 3 : dense) }>
#sparse4 = #sparse_tensor.encoding<{ map = (d0, d1, d2, d3) -> (d0 : dense, d1 : compressed, d2 : dense, d3 : dense) }>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<64xf32>) -> tensor<64xf32>, sym_name = "sparse_nop_dense2dense_convert"}> ({
  ^bb0(%arg14: tensor<64xf32>):
    %17 = "sparse_tensor.convert"(%arg14) : (tensor<64xf32>) -> tensor<64xf32>
    "func.return"(%17) : (tensor<64xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<64xf32>) -> (), sym_name = "sparse_dce_convert"}> ({
  ^bb0(%arg13: tensor<64xf32>):
    %16 = "sparse_tensor.convert"(%arg13) : (tensor<64xf32>) -> tensor<64xf32, #sparse>
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<64xf32, #sparse>) -> (), sym_name = "sparse_dce_getters"}> ({
  ^bb0(%arg12: tensor<64xf32, #sparse>):
    %13 = "sparse_tensor.positions"(%arg12) <{level = 0 : index}> : (tensor<64xf32, #sparse>) -> memref<?xindex>
    %14 = "sparse_tensor.coordinates"(%arg12) <{level = 0 : index}> : (tensor<64xf32, #sparse>) -> memref<?xindex>
    %15 = "sparse_tensor.values"(%arg12) : (tensor<64xf32, #sparse>) -> memref<?xf32>
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<2xf64, #sparse>, tensor<3xf64, #sparse>, tensor<4xf64, #sparse>) -> (), sym_name = "sparse_concat_dce"}> ({
  ^bb0(%arg9: tensor<2xf64, #sparse>, %arg10: tensor<3xf64, #sparse>, %arg11: tensor<4xf64, #sparse>):
    %12 = "sparse_tensor.concatenate"(%arg9, %arg10, %arg11) <{dimension = 0 : index}> : (tensor<2xf64, #sparse>, tensor<3xf64, #sparse>, tensor<4xf64, #sparse>) -> tensor<9xf64, #sparse>
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (!sparse_tensor.storage_specifier<#sparse1>, index, index) -> index, sym_name = "sparse_get_specifier_dce_fold"}> ({
  ^bb0(%arg6: !sparse_tensor.storage_specifier<#sparse1>, %arg7: index, %arg8: index):
    %9 = "sparse_tensor.storage_specifier.set"(%arg6, %arg7) <{level = 0 : index, specifierKind = #sparse_tensor<kind lvl_sz>}> : (!sparse_tensor.storage_specifier<#sparse1>, index) -> !sparse_tensor.storage_specifier<#sparse1>
    %10 = "sparse_tensor.storage_specifier.set"(%9, %arg8) <{level = 0 : index, specifierKind = #sparse_tensor<kind pos_mem_sz>}> : (!sparse_tensor.storage_specifier<#sparse1>, index) -> !sparse_tensor.storage_specifier<#sparse1>
    %11 = "sparse_tensor.storage_specifier.get"(%10) <{level = 0 : index, specifierKind = #sparse_tensor<kind lvl_sz>}> : (!sparse_tensor.storage_specifier<#sparse1>) -> index
    "func.return"(%11) : (index) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<?x?xf32, #sparse2>) -> tensor<?x?xf32, #sparse2>, sym_name = "sparse_reorder_coo"}> ({
  ^bb0(%arg5: tensor<?x?xf32, #sparse2>):
    %8 = "sparse_tensor.reorder_coo"(%arg5) <{algorithm = #sparse_tensor<SparseTensorSortAlgorithm quick_sort>}> : (tensor<?x?xf32, #sparse2>) -> tensor<?x?xf32, #sparse2>
    "func.return"(%8) : (tensor<?x?xf32, #sparse2>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index, index) -> (index, index), sym_name = "sparse_crd_translate"}> ({
  ^bb0(%arg3: index, %arg4: index):
    %6:4 = "sparse_tensor.crd_translate"(%arg3, %arg4) <{direction = #sparse_tensor<CrdTransDirection dim_to_lvl>, encoder = #sparse3}> : (index, index) -> (index, index, index, index)
    %7:2 = "sparse_tensor.crd_translate"(%6#0, %6#1, %6#2, %6#3) <{direction = #sparse_tensor<CrdTransDirection lvl_to_dim>, encoder = #sparse3}> : (index, index, index, index) -> (index, index)
    "func.return"(%7#0, %7#1) : (index, index) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<10x?xi32, #sparse3>) -> index, sym_name = "sparse_lvl_0"}> ({
  ^bb0(%arg2: tensor<10x?xi32, #sparse3>):
    %4 = "arith.constant"() <{value = 0 : index}> : () -> index
    %5 = "sparse_tensor.lvl"(%arg2, %4) : (tensor<10x?xi32, #sparse3>, index) -> index
    "func.return"(%5) : (index) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<?x?xi32, #sparse3>) -> index, sym_name = "sparse_lvl_3"}> ({
  ^bb0(%arg1: tensor<?x?xi32, #sparse3>):
    %2 = "arith.constant"() <{value = 3 : index}> : () -> index
    %3 = "sparse_tensor.lvl"(%arg1, %2) : (tensor<?x?xi32, #sparse3>, index) -> index
    "func.return"(%3) : (index) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<6x12xi32, #sparse3>) -> tensor<6x12xi32, #sparse3>, sym_name = "sparse_reinterpret_map"}> ({
  ^bb0(%arg0: tensor<6x12xi32, #sparse3>):
    %0 = "sparse_tensor.reinterpret_map"(%arg0) : (tensor<6x12xi32, #sparse3>) -> tensor<3x4x2x3xi32, #sparse4>
    %1 = "sparse_tensor.reinterpret_map"(%0) : (tensor<3x4x2x3xi32, #sparse4>) -> tensor<6x12xi32, #sparse3>
    "func.return"(%1) : (tensor<6x12xi32, #sparse3>) -> ()
  }) : () -> ()
}) : () -> ()

