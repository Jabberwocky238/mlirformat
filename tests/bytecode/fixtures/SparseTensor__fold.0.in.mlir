"builtin.module"() ({
  "func.func"() <{function_type = (tensor<64xf32>) -> tensor<64xf32>, sym_name = "sparse_nop_dense2dense_convert"}> ({
  ^bb0(%arg14: tensor<64xf32> loc("<stdin>":8:8)):
    %17 = "sparse_tensor.convert"(%arg14) : (tensor<64xf32>) -> tensor<64xf32> loc("<stdin>":9:11)
    "func.return"(%17) : (tensor<64xf32>) -> () loc("<stdin>":10:5)
  }) : () -> () loc("<stdin>":7:3)
  "func.func"() <{function_type = (tensor<64xf32>) -> (), sym_name = "sparse_dce_convert"}> ({
  ^bb0(%arg13: tensor<64xf32> loc("<stdin>":13:8)):
    %16 = "sparse_tensor.convert"(%arg13) : (tensor<64xf32>) -> tensor<64xf32, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>> loc("<stdin>":14:11)
    "func.return"() : () -> () loc("<stdin>":15:5)
  }) : () -> () loc("<stdin>":12:3)
  "func.func"() <{function_type = (tensor<64xf32, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>) -> (), sym_name = "sparse_dce_getters"}> ({
  ^bb0(%arg12: tensor<64xf32, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>> loc("<stdin>":18:8)):
    %13 = "sparse_tensor.positions"(%arg12) <{level = 0 : index}> : (tensor<64xf32, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>) -> memref<?xindex> loc("<stdin>":19:11)
    %14 = "sparse_tensor.coordinates"(%arg12) <{level = 0 : index}> : (tensor<64xf32, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>) -> memref<?xindex> loc("<stdin>":20:11)
    %15 = "sparse_tensor.values"(%arg12) : (tensor<64xf32, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>) -> memref<?xf32> loc("<stdin>":21:11)
    "func.return"() : () -> () loc("<stdin>":22:5)
  }) : () -> () loc("<stdin>":17:3)
  "func.func"() <{function_type = (tensor<2xf64, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>, tensor<3xf64, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>, tensor<4xf64, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>) -> (), sym_name = "sparse_concat_dce"}> ({
  ^bb0(%arg9: tensor<2xf64, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>> loc("<stdin>":25:8), %arg10: tensor<3xf64, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>> loc("<stdin>":25:39), %arg11: tensor<4xf64, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>> loc("<stdin>":25:71)):
    %12 = "sparse_tensor.concatenate"(%arg9, %arg10, %arg11) <{dimension = 0 : index}> : (tensor<2xf64, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>, tensor<3xf64, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>, tensor<4xf64, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>) -> tensor<9xf64, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>> loc("<stdin>":26:11)
    "func.return"() : () -> () loc("<stdin>":27:5)
  }) : () -> () loc("<stdin>":24:3)
  "func.func"() <{function_type = (!sparse_tensor.storage_specifier<#sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>, index, index) -> index, sym_name = "sparse_get_specifier_dce_fold"}> ({
  ^bb0(%arg6: !sparse_tensor.storage_specifier<#sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>> loc("<stdin>":30:8), %arg7: index loc("<stdin>":30:59), %arg8: index loc("<stdin>":30:73)):
    %9 = "sparse_tensor.storage_specifier.set"(%arg6, %arg7) <{level = 0 : index, specifierKind = #sparse_tensor<kind lvl_sz>}> : (!sparse_tensor.storage_specifier<#sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>, index) -> !sparse_tensor.storage_specifier<#sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>> loc("<stdin>":31:10)
    %10 = "sparse_tensor.storage_specifier.set"(%9, %arg8) <{level = 0 : index, specifierKind = #sparse_tensor<kind pos_mem_sz>}> : (!sparse_tensor.storage_specifier<#sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>, index) -> !sparse_tensor.storage_specifier<#sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>> loc("<stdin>":32:11)
    %11 = "sparse_tensor.storage_specifier.get"(%10) <{level = 0 : index, specifierKind = #sparse_tensor<kind lvl_sz>}> : (!sparse_tensor.storage_specifier<#sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>) -> index loc("<stdin>":33:11)
    "func.return"(%11) : (index) -> () loc("<stdin>":34:5)
  }) : () -> () loc("<stdin>":29:3)
  "func.func"() <{function_type = (tensor<?x?xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed(nonunique), d1 : singleton) }>>) -> tensor<?x?xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed(nonunique), d1 : singleton) }>>, sym_name = "sparse_reorder_coo"}> ({
  ^bb0(%arg5: tensor<?x?xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed(nonunique), d1 : singleton) }>> loc("<stdin>":37:8)):
    %8 = "sparse_tensor.reorder_coo"(%arg5) <{algorithm = #sparse_tensor<SparseTensorSortAlgorithm quick_sort>}> : (tensor<?x?xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed(nonunique), d1 : singleton) }>>) -> tensor<?x?xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed(nonunique), d1 : singleton) }>> loc("<stdin>":38:10)
    "func.return"(%8) : (tensor<?x?xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed(nonunique), d1 : singleton) }>>) -> () loc("<stdin>":39:5)
  }) : () -> () loc("<stdin>":36:3)
  "func.func"() <{function_type = (index, index) -> (index, index), sym_name = "sparse_crd_translate"}> ({
  ^bb0(%arg3: index loc("<stdin>":42:8), %arg4: index loc("<stdin>":42:22)):
    %6:4 = "sparse_tensor.crd_translate"(%arg3, %arg4) <{direction = #sparse_tensor<CrdTransDirection dim_to_lvl>, encoder = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 floordiv 2 : dense, d1 floordiv 3 : compressed, d0 mod 2 : dense, d1 mod 3 : dense) }>}> : (index, index) -> (index, index, index, index) loc("<stdin>":43:12)
    %7:2 = "sparse_tensor.crd_translate"(%6#0, %6#1, %6#2, %6#3) <{direction = #sparse_tensor<CrdTransDirection lvl_to_dim>, encoder = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 floordiv 2 : dense, d1 floordiv 3 : compressed, d0 mod 2 : dense, d1 mod 3 : dense) }>}> : (index, index, index, index) -> (index, index) loc("<stdin>":44:12)
    "func.return"(%7#0, %7#1) : (index, index) -> () loc("<stdin>":45:5)
  }) : () -> () loc("<stdin>":41:3)
  "func.func"() <{function_type = (tensor<10x?xi32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 floordiv 2 : dense, d1 floordiv 3 : compressed, d0 mod 2 : dense, d1 mod 3 : dense) }>>) -> index, sym_name = "sparse_lvl_0"}> ({
  ^bb0(%arg2: tensor<10x?xi32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 floordiv 2 : dense, d1 floordiv 3 : compressed, d0 mod 2 : dense, d1 mod 3 : dense) }>> loc("<stdin>":48:8)):
    %4 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":49:10)
    %5 = "sparse_tensor.lvl"(%arg2, %4) : (tensor<10x?xi32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 floordiv 2 : dense, d1 floordiv 3 : compressed, d0 mod 2 : dense, d1 mod 3 : dense) }>>, index) -> index loc("<stdin>":50:10)
    "func.return"(%5) : (index) -> () loc("<stdin>":51:5)
  }) : () -> () loc("<stdin>":47:3)
  "func.func"() <{function_type = (tensor<?x?xi32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 floordiv 2 : dense, d1 floordiv 3 : compressed, d0 mod 2 : dense, d1 mod 3 : dense) }>>) -> index, sym_name = "sparse_lvl_3"}> ({
  ^bb0(%arg1: tensor<?x?xi32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 floordiv 2 : dense, d1 floordiv 3 : compressed, d0 mod 2 : dense, d1 mod 3 : dense) }>> loc("<stdin>":54:8)):
    %2 = "arith.constant"() <{value = 3 : index}> : () -> index loc("<stdin>":55:10)
    %3 = "sparse_tensor.lvl"(%arg1, %2) : (tensor<?x?xi32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 floordiv 2 : dense, d1 floordiv 3 : compressed, d0 mod 2 : dense, d1 mod 3 : dense) }>>, index) -> index loc("<stdin>":56:10)
    "func.return"(%3) : (index) -> () loc("<stdin>":57:5)
  }) : () -> () loc("<stdin>":53:3)
  "func.func"() <{function_type = (tensor<6x12xi32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 floordiv 2 : dense, d1 floordiv 3 : compressed, d0 mod 2 : dense, d1 mod 3 : dense) }>>) -> tensor<6x12xi32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 floordiv 2 : dense, d1 floordiv 3 : compressed, d0 mod 2 : dense, d1 mod 3 : dense) }>>, sym_name = "sparse_reinterpret_map"}> ({
  ^bb0(%arg0: tensor<6x12xi32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 floordiv 2 : dense, d1 floordiv 3 : compressed, d0 mod 2 : dense, d1 mod 3 : dense) }>> loc("<stdin>":60:8)):
    %0 = "sparse_tensor.reinterpret_map"(%arg0) : (tensor<6x12xi32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 floordiv 2 : dense, d1 floordiv 3 : compressed, d0 mod 2 : dense, d1 mod 3 : dense) }>>) -> tensor<3x4x2x3xi32, #sparse_tensor.encoding<{ map = (d0, d1, d2, d3) -> (d0 : dense, d1 : compressed, d2 : dense, d3 : dense) }>> loc("<stdin>":61:10)
    %1 = "sparse_tensor.reinterpret_map"(%0) : (tensor<3x4x2x3xi32, #sparse_tensor.encoding<{ map = (d0, d1, d2, d3) -> (d0 : dense, d1 : compressed, d2 : dense, d3 : dense) }>>) -> tensor<6x12xi32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 floordiv 2 : dense, d1 floordiv 3 : compressed, d0 mod 2 : dense, d1 mod 3 : dense) }>> loc("<stdin>":62:10)
    "func.return"(%1) : (tensor<6x12xi32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 floordiv 2 : dense, d1 floordiv 3 : compressed, d0 mod 2 : dense, d1 mod 3 : dense) }>>) -> () loc("<stdin>":63:5)
  }) : () -> () loc("<stdin>":59:3)
}) : () -> () loc("<stdin>":6:1)
