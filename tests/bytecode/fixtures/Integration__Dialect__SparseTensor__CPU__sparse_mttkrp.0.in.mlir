"builtin.module"() ({
  "func.func"() <{function_type = (tensor<*xf64>) -> (), sym_name = "printMemrefF64", sym_visibility = "private"}> ({
  }) : () -> () loc("<stdin>":7:3)
  "func.func"() <{function_type = (tensor<?x?x?xf64, #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d0 : compressed, d1 : compressed, d2 : compressed) }>>, tensor<?x?xf64>, tensor<?x?xf64>, tensor<?x?xf64>) -> tensor<?x?xf64>, sym_name = "kernel_mttkrp"}> ({
  ^bb0(%arg6: tensor<?x?x?xf64, #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d0 : compressed, d1 : compressed, d2 : compressed) }>> loc("<stdin>":10:8), %arg7: tensor<?x?xf64> loc("<stdin>":10:43), %arg8: tensor<?x?xf64> loc("<stdin>":10:67), %arg9: tensor<?x?xf64> loc("<stdin>":10:91)):
    %23 = "linalg.generic"(%arg6, %arg7, %arg8, %arg9) <{doc = "A(i,j) += B(i,k,l) * D(l,j) * C(k,j)", indexing_maps = [affine_map<(d0, d1, d2, d3) -> (d0, d2, d3)>, affine_map<(d0, d1, d2, d3) -> (d2, d1)>, affine_map<(d0, d1, d2, d3) -> (d3, d1)>, affine_map<(d0, d1, d2, d3) -> (d0, d1)>], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<reduction>, #linalg.iterator_type<reduction>], operandSegmentSizes = array<i32: 3, 1>}> ({
    ^bb0(%arg10: f64 loc("<stdin>":12:10), %arg11: f64 loc("<stdin>":12:23), %arg12: f64 loc("<stdin>":12:36), %arg13: f64 loc("<stdin>":12:49)):
      %24 = "arith.mulf"(%arg10, %arg11) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64 loc("<stdin>":13:13)
      %25 = "arith.mulf"(%arg12, %24) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64 loc("<stdin>":14:13)
      %26 = "arith.addf"(%arg13, %25) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64 loc("<stdin>":15:13)
      "linalg.yield"(%26) : (f64) -> () loc("<stdin>":16:7)
    }) : (tensor<?x?x?xf64, #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d0 : compressed, d1 : compressed, d2 : compressed) }>>, tensor<?x?xf64>, tensor<?x?xf64>, tensor<?x?xf64>) -> tensor<?x?xf64> loc("<stdin>":11:11)
    "func.return"(%23) : (tensor<?x?xf64>) -> () loc("<stdin>":18:5)
  }) : () -> () loc("<stdin>":9:3)
  "func.func"() <{function_type = (index) -> !llvm.ptr, sym_name = "getTensorFilename", sym_visibility = "private"}> ({
  }) : () -> () loc("<stdin>":20:3)
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %0 = "arith.constant"() <{value = 0.000000e+00 : f64}> : () -> f64 loc("<stdin>":23:10)
    %1 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":24:10)
    %2 = "arith.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":25:10)
    %3 = "arith.constant"() <{value = 2 : index}> : () -> index loc("<stdin>":26:10)
    %4 = "func.call"(%1) <{callee = @getTensorFilename}> : (index) -> !llvm.ptr loc("<stdin>":27:10)
    %5 = "sparse_tensor.new"(%4) : (!llvm.ptr) -> tensor<?x?x?xf64, #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d0 : compressed, d1 : compressed, d2 : compressed) }>> loc("<stdin>":28:10)
    %6 = "tensor.dim"(%5, %1) : (tensor<?x?x?xf64, #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d0 : compressed, d1 : compressed, d2 : compressed) }>>, index) -> index loc("<stdin>":29:10)
    %7 = "arith.constant"() <{value = 5 : index}> : () -> index loc("<stdin>":30:10)
    %8 = "tensor.dim"(%5, %2) : (tensor<?x?x?xf64, #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d0 : compressed, d1 : compressed, d2 : compressed) }>>, index) -> index loc("<stdin>":31:10)
    %9 = "tensor.dim"(%5, %3) : (tensor<?x?x?xf64, #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d0 : compressed, d1 : compressed, d2 : compressed) }>>, index) -> index loc("<stdin>":32:10)
    %10 = "tensor.generate"(%8, %7) ({
    ^bb0(%arg4: index loc("<stdin>":34:10), %arg5: index loc("<stdin>":34:24)):
      %19 = "arith.muli"(%arg4, %7) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index loc("<stdin>":35:13)
      %20 = "arith.addi"(%19, %arg5) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index loc("<stdin>":36:13)
      %21 = "arith.index_cast"(%20) : (index) -> i32 loc("<stdin>":37:13)
      %22 = "arith.sitofp"(%21) : (i32) -> f64 loc("<stdin>":38:13)
      "tensor.yield"(%22) : (f64) -> () loc("<stdin>":39:7)
    }) : (index, index) -> tensor<?x?xf64> loc("<stdin>":33:11)
    %11 = "tensor.generate"(%9, %7) ({
    ^bb0(%arg2: index loc("<stdin>":42:10), %arg3: index loc("<stdin>":42:24)):
      %15 = "arith.muli"(%arg2, %7) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index loc("<stdin>":43:13)
      %16 = "arith.addi"(%15, %arg3) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index loc("<stdin>":44:13)
      %17 = "arith.index_cast"(%16) : (index) -> i32 loc("<stdin>":45:13)
      %18 = "arith.sitofp"(%17) : (i32) -> f64 loc("<stdin>":46:13)
      "tensor.yield"(%18) : (f64) -> () loc("<stdin>":47:7)
    }) : (index, index) -> tensor<?x?xf64> loc("<stdin>":41:11)
    %12 = "tensor.generate"(%6, %7) ({
    ^bb0(%arg0: index loc("<stdin>":50:10), %arg1: index loc("<stdin>":50:24)):
      "tensor.yield"(%0) : (f64) -> () loc("<stdin>":51:7)
    }) : (index, index) -> tensor<?x?xf64> loc("<stdin>":49:11)
    %13 = "func.call"(%5, %10, %11, %12) <{callee = @kernel_mttkrp}> : (tensor<?x?x?xf64, #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d0 : compressed, d1 : compressed, d2 : compressed) }>>, tensor<?x?xf64>, tensor<?x?xf64>, tensor<?x?xf64>) -> tensor<?x?xf64> loc("<stdin>":53:11)
    %14 = "tensor.cast"(%13) : (tensor<?x?xf64>) -> tensor<*xf64> loc("<stdin>":54:11)
    "func.call"(%14) <{callee = @printMemrefF64}> : (tensor<*xf64>) -> () loc("<stdin>":55:5)
    "bufferization.dealloc_tensor"(%5) : (tensor<?x?x?xf64, #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d0 : compressed, d1 : compressed, d2 : compressed) }>>) -> () loc("<stdin>":56:5)
    "bufferization.dealloc_tensor"(%10) : (tensor<?x?xf64>) -> () loc("<stdin>":57:5)
    "bufferization.dealloc_tensor"(%11) : (tensor<?x?xf64>) -> () loc("<stdin>":58:5)
    "bufferization.dealloc_tensor"(%12) : (tensor<?x?xf64>) -> () loc("<stdin>":59:5)
    "func.return"() : () -> () loc("<stdin>":60:5)
  }) : () -> () loc("<stdin>":22:3)
}) : () -> () loc("<stdin>":6:1)
