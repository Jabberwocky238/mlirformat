"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed), posWidth = 32, crdWidth = 32 }>>, tensor<?x?xf32>, tensor<?x?xf32>, tensor<?x?xf32>) -> tensor<?x?xf32>, sym_name = "sampled_dense_dense"}> ({
  ^bb0(%arg7: tensor<?x?xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed), posWidth = 32, crdWidth = 32 }>> loc("<stdin>":8:8), %arg8: tensor<?x?xf32> loc("<stdin>":8:41), %arg9: tensor<?x?xf32> loc("<stdin>":8:65), %arg10: tensor<?x?xf32> loc("<stdin>":8:89)):
    %18 = "linalg.generic"(%arg7, %arg8, %arg9, %arg10) <{doc = "X(i,j) += S(i,j) SUM_k A(i,k) B(k,j)", indexing_maps = [affine_map<(d0, d1, d2) -> (d0, d1)>, affine_map<(d0, d1, d2) -> (d0, d2)>, affine_map<(d0, d1, d2) -> (d2, d1)>, affine_map<(d0, d1, d2) -> (d0, d1)>], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<reduction>], operandSegmentSizes = array<i32: 3, 1>}> ({
    ^bb0(%arg11: f32 loc("<stdin>":10:10), %arg12: f32 loc("<stdin>":10:23), %arg13: f32 loc("<stdin>":10:36), %arg14: f32 loc("<stdin>":10:49)):
      %19 = "arith.mulf"(%arg12, %arg13) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":11:13)
      %20 = "arith.mulf"(%arg11, %19) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":12:13)
      %21 = "arith.addf"(%arg14, %20) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":13:13)
      "linalg.yield"(%21) : (f32) -> () loc("<stdin>":14:7)
    }) : (tensor<?x?xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed), posWidth = 32, crdWidth = 32 }>>, tensor<?x?xf32>, tensor<?x?xf32>, tensor<?x?xf32>) -> tensor<?x?xf32> loc("<stdin>":9:11)
    "func.return"(%18) : (tensor<?x?xf32>) -> () loc("<stdin>":16:5)
  }) : () -> () loc("<stdin>":7:3)
  "func.func"() <{function_type = (index) -> !llvm.ptr, sym_name = "getTensorFilename", sym_visibility = "private"}> ({
  }) : () -> () loc("<stdin>":18:3)
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %0 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32 loc("<stdin>":21:10)
    %1 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":22:10)
    %2 = "arith.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":23:10)
    %3 = "arith.constant"() <{value = 5 : index}> : () -> index loc("<stdin>":24:10)
    %4 = "arith.constant"() <{value = 10 : index}> : () -> index loc("<stdin>":25:10)
    %5 = "tensor.generate"(%3, %3) ({
    ^bb0(%arg5: index loc("<stdin>":27:10), %arg6: index loc("<stdin>":27:24)):
      "tensor.yield"(%0) : (f32) -> () loc("<stdin>":28:7)
    }) : (index, index) -> tensor<?x?xf32> loc("<stdin>":26:10)
    %6 = "tensor.generate"(%3, %4) ({
    ^bb0(%arg3: index loc("<stdin>":31:10), %arg4: index loc("<stdin>":31:24)):
      %15 = "arith.addi"(%arg3, %2) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index loc("<stdin>":32:13)
      %16 = "arith.index_cast"(%15) : (index) -> i32 loc("<stdin>":33:13)
      %17 = "arith.sitofp"(%16) : (i32) -> f32 loc("<stdin>":34:13)
      "tensor.yield"(%17) : (f32) -> () loc("<stdin>":35:7)
    }) : (index, index) -> tensor<?x?xf32> loc("<stdin>":30:10)
    %7 = "tensor.generate"(%4, %3) ({
    ^bb0(%arg1: index loc("<stdin>":38:10), %arg2: index loc("<stdin>":38:24)):
      %12 = "arith.addi"(%arg2, %2) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index loc("<stdin>":39:13)
      %13 = "arith.index_cast"(%12) : (index) -> i32 loc("<stdin>":40:13)
      %14 = "arith.sitofp"(%13) : (i32) -> f32 loc("<stdin>":41:13)
      "tensor.yield"(%14) : (f32) -> () loc("<stdin>":42:7)
    }) : (index, index) -> tensor<?x?xf32> loc("<stdin>":37:10)
    %8 = "func.call"(%1) <{callee = @getTensorFilename}> : (index) -> !llvm.ptr loc("<stdin>":44:10)
    %9 = "sparse_tensor.new"(%8) : (!llvm.ptr) -> tensor<?x?xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed), posWidth = 32, crdWidth = 32 }>> loc("<stdin>":45:10)
    %10 = "func.call"(%9, %6, %7, %5) <{callee = @sampled_dense_dense}> : (tensor<?x?xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed), posWidth = 32, crdWidth = 32 }>>, tensor<?x?xf32>, tensor<?x?xf32>, tensor<?x?xf32>) -> tensor<?x?xf32> loc("<stdin>":46:11)
    "scf.for"(%1, %3, %2) ({
    ^bb0(%arg0: index loc("<stdin>":48:10)):
      %11 = "vector.transfer_read"(%10, %arg0, %1, %0) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = affine_map<(d0, d1) -> (d1)>}> : (tensor<?x?xf32>, index, index, f32) -> vector<5xf32> loc("<stdin>":49:13)
      "vector.print"(%11) <{punctuation = #vector.punctuation<newline>}> : (vector<5xf32>) -> () loc("<stdin>":50:7)
      "scf.yield"() : () -> () loc("<stdin>":51:7)
    }) : (index, index, index) -> () loc("<stdin>":47:5)
    "bufferization.dealloc_tensor"(%9) : (tensor<?x?xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed), posWidth = 32, crdWidth = 32 }>>) -> () loc("<stdin>":53:5)
    "bufferization.dealloc_tensor"(%10) : (tensor<?x?xf32>) -> () loc("<stdin>":54:5)
    "bufferization.dealloc_tensor"(%6) : (tensor<?x?xf32>) -> () loc("<stdin>":55:5)
    "bufferization.dealloc_tensor"(%7) : (tensor<?x?xf32>) -> () loc("<stdin>":56:5)
    "func.return"() : () -> () loc("<stdin>":57:5)
  }) : () -> () loc("<stdin>":20:3)
}) : () -> () loc("<stdin>":6:1)
