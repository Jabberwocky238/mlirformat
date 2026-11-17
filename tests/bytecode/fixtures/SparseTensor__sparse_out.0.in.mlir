"builtin.module"() ({
  "func.func"() <{function_type = (tensor<32x16xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>) -> tensor<32x16xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>, sym_name = "sparse_simply_dynamic1"}> ({
  ^bb0(%arg15: tensor<32x16xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>> loc("<stdin>":11:8)):
    %22 = "arith.constant"() <{value = 2.000000e+00 : f32}> : () -> f32 loc("<stdin>":12:11)
    %23 = "linalg.generic"(%arg15) <{doc = "X(i,j) *= 2 or X(i,j) += X(i,j)", indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 0, 1>}> ({
    ^bb0(%arg16: f32 loc("<stdin>":14:10)):
      %24 = "arith.mulf"(%arg16, %22) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":15:13)
      "linalg.yield"(%24) : (f32) -> () loc("<stdin>":16:7)
    }) : (tensor<32x16xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>) -> tensor<32x16xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>> loc("<stdin>":13:11)
    "func.return"(%23) : (tensor<32x16xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>) -> () loc("<stdin>":18:5)
  }) : () -> () loc("<stdin>":10:3)
  "func.func"() <{function_type = (tensor<32x16xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>) -> tensor<32x16xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>, sym_name = "sparse_simply_dynamic2"}> ({
  ^bb0(%arg13: tensor<32x16xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>> loc("<stdin>":21:8)):
    %20 = "linalg.generic"(%arg13) <{doc = "X(i,j) *= 2 or X(i,j) += X(i,j)", indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 0, 1>}> ({
    ^bb0(%arg14: f32 loc("<stdin>":23:10)):
      %21 = "arith.addf"(%arg14, %arg14) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":24:13)
      "linalg.yield"(%21) : (f32) -> () loc("<stdin>":25:7)
    }) : (tensor<32x16xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>) -> tensor<32x16xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>> loc("<stdin>":22:11)
    "func.return"(%20) : (tensor<32x16xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>) -> () loc("<stdin>":27:5)
  }) : () -> () loc("<stdin>":20:3)
  "func.func"() <{function_type = (tensor<10x20xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>>) -> tensor<10x20xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>, sym_name = "sparse_truly_dynamic"}> ({
  ^bb0(%arg10: tensor<10x20xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>> loc("<stdin>":30:8)):
    %16 = "arith.constant"() <{value = 2.000000e+00 : f32}> : () -> f32 loc("<stdin>":31:11)
    %17 = "tensor.empty"() : () -> tensor<10x20xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>> loc("<stdin>":32:11)
    %18 = "linalg.generic"(%arg10, %17) <{doc = "X(i,j) = A(i,j) * 2.0", indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg11: f32 loc("<stdin>":34:10), %arg12: f32 loc("<stdin>":34:23)):
      %19 = "arith.mulf"(%arg11, %16) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":35:13)
      "linalg.yield"(%19) : (f32) -> () loc("<stdin>":36:7)
    }) : (tensor<10x20xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>>, tensor<10x20xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>) -> tensor<10x20xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>> loc("<stdin>":33:11)
    "func.return"(%18) : (tensor<10x20xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>) -> () loc("<stdin>":38:5)
  }) : () -> () loc("<stdin>":29:3)
  "func.func"() <{function_type = (tensor<?x?x?xi32, #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d0 : compressed, d1 : compressed, d2 : compressed) }>>, tensor<?x?x?xi32, #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d0 : compressed, d1 : compressed, d2 : compressed) }>>) -> tensor<?x?xi32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>, sym_name = "sumred"}> ({
  ^bb0(%arg5: tensor<?x?x?xi32, #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d0 : compressed, d1 : compressed, d2 : compressed) }>> loc("<stdin>":41:8), %arg6: tensor<?x?x?xi32, #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d0 : compressed, d1 : compressed, d2 : compressed) }>> loc("<stdin>":41:44)):
    %8 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":42:10)
    %9 = "arith.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":43:10)
    %10 = "tensor.dim"(%arg5, %8) : (tensor<?x?x?xi32, #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d0 : compressed, d1 : compressed, d2 : compressed) }>>, index) -> index loc("<stdin>":44:11)
    %11 = "tensor.dim"(%arg5, %9) : (tensor<?x?x?xi32, #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d0 : compressed, d1 : compressed, d2 : compressed) }>>, index) -> index loc("<stdin>":45:11)
    %12 = "tensor.empty"(%10, %11) : (index, index) -> tensor<?x?xi32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>> loc("<stdin>":46:11)
    %13 = "linalg.generic"(%arg5, %arg6, %12) <{doc = "X(i,j) = SUM_k A(i,j,k) * B(i,j,k)", indexing_maps = [affine_map<(d0, d1, d2) -> (d0, d1, d2)>, affine_map<(d0, d1, d2) -> (d0, d1, d2)>, affine_map<(d0, d1, d2) -> (d0, d1)>], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<reduction>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg7: i32 loc("<stdin>":48:10), %arg8: i32 loc("<stdin>":48:22), %arg9: i32 loc("<stdin>":48:34)):
      %14 = "arith.muli"(%arg7, %arg8) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32 loc("<stdin>":49:13)
      %15 = "arith.addi"(%arg9, %14) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32 loc("<stdin>":50:13)
      "linalg.yield"(%15) : (i32) -> () loc("<stdin>":51:7)
    }) : (tensor<?x?x?xi32, #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d0 : compressed, d1 : compressed, d2 : compressed) }>>, tensor<?x?x?xi32, #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d0 : compressed, d1 : compressed, d2 : compressed) }>>, tensor<?x?xi32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>) -> tensor<?x?xi32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>> loc("<stdin>":47:11)
    "func.return"(%13) : (tensor<?x?xi32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>) -> () loc("<stdin>":53:5)
  }) : () -> () loc("<stdin>":40:3)
  "func.func"() <{function_type = (tensor<?x?xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>, tensor<?x?xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>) -> tensor<?x?xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>, sym_name = "matmat"}> ({
  ^bb0(%arg0: tensor<?x?xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>> loc("<stdin>":56:8), %arg1: tensor<?x?xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>> loc("<stdin>":56:41)):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":57:10)
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":58:10)
    %2 = "tensor.dim"(%arg0, %0) : (tensor<?x?xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>, index) -> index loc("<stdin>":59:10)
    %3 = "tensor.dim"(%arg1, %1) : (tensor<?x?xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>, index) -> index loc("<stdin>":60:10)
    %4 = "tensor.empty"(%2, %3) : (index, index) -> tensor<?x?xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>> loc("<stdin>":61:10)
    %5 = "linalg.generic"(%arg0, %arg1, %4) <{doc = "C(i,j) = SUM_k A(i,k) * B(k,j)", indexing_maps = [affine_map<(d0, d1, d2) -> (d0, d2)>, affine_map<(d0, d1, d2) -> (d2, d1)>, affine_map<(d0, d1, d2) -> (d0, d1)>], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<reduction>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg2: f32 loc("<stdin>":63:10), %arg3: f32 loc("<stdin>":63:22), %arg4: f32 loc("<stdin>":63:34)):
      %6 = "arith.mulf"(%arg2, %arg3) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":64:12)
      %7 = "arith.addf"(%arg4, %6) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":65:12)
      "linalg.yield"(%7) : (f32) -> () loc("<stdin>":66:7)
    }) : (tensor<?x?xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>, tensor<?x?xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>, tensor<?x?xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>) -> tensor<?x?xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>> loc("<stdin>":62:10)
    "func.return"(%5) : (tensor<?x?xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>) -> () loc("<stdin>":68:5)
  }) : () -> () loc("<stdin>":55:3)
}) : () -> () loc("<stdin>":9:1)
