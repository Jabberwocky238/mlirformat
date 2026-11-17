"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>>, tensor<?x?xf64>, tensor<?x?xf64>) -> tensor<?x?xf64>, sym_name = "kernel_spmm"}> ({
  ^bb0(%arg4: tensor<?x?xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>> loc("<stdin>":8:8), %arg5: tensor<?x?xf64> loc("<stdin>":8:41), %arg6: tensor<?x?xf64> loc("<stdin>":8:65)):
    %15 = "linalg.generic"(%arg4, %arg5, %arg6) <{doc = "X(i,j) += A(i,k) * B(k,j)", indexing_maps = [affine_map<(d0, d1, d2) -> (d0, d2)>, affine_map<(d0, d1, d2) -> (d2, d1)>, affine_map<(d0, d1, d2) -> (d0, d1)>], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<reduction>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg7: f64 loc("<stdin>":10:10), %arg8: f64 loc("<stdin>":10:22), %arg9: f64 loc("<stdin>":10:34)):
      %16 = "arith.mulf"(%arg7, %arg8) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64 loc("<stdin>":11:13)
      %17 = "arith.addf"(%arg9, %16) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64 loc("<stdin>":12:13)
      "linalg.yield"(%17) : (f64) -> () loc("<stdin>":13:7)
    }) : (tensor<?x?xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>>, tensor<?x?xf64>, tensor<?x?xf64>) -> tensor<?x?xf64> loc("<stdin>":9:11)
    "func.return"(%15) : (tensor<?x?xf64>) -> () loc("<stdin>":15:5)
  }) : () -> () loc("<stdin>":7:3)
  "func.func"() <{function_type = (index) -> !llvm.ptr, sym_name = "getTensorFilename", sym_visibility = "private"}> ({
  }) : () -> () loc("<stdin>":17:3)
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %0 = "arith.constant"() <{value = 0.000000e+00 : f64}> : () -> f64 loc("<stdin>":20:10)
    %1 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":21:10)
    %2 = "arith.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":22:10)
    %3 = "arith.constant"() <{value = 4 : index}> : () -> index loc("<stdin>":23:10)
    %4 = "arith.constant"() <{value = 256 : index}> : () -> index loc("<stdin>":24:10)
    %5 = "func.call"(%1) <{callee = @getTensorFilename}> : (index) -> !llvm.ptr loc("<stdin>":25:10)
    %6 = "sparse_tensor.new"(%5) : (!llvm.ptr) -> tensor<?x?xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>> loc("<stdin>":26:10)
    %7 = "tensor.generate"(%4, %3) ({
    ^bb0(%arg2: index loc("<stdin>":28:10), %arg3: index loc("<stdin>":28:24)):
      %11 = "arith.muli"(%arg2, %3) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index loc("<stdin>":29:13)
      %12 = "arith.addi"(%arg3, %11) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index loc("<stdin>":30:13)
      %13 = "arith.index_cast"(%12) : (index) -> i32 loc("<stdin>":31:13)
      %14 = "arith.sitofp"(%13) : (i32) -> f64 loc("<stdin>":32:13)
      "tensor.yield"(%14) : (f64) -> () loc("<stdin>":33:7)
    }) : (index, index) -> tensor<?x?xf64> loc("<stdin>":27:10)
    %8 = "tensor.generate"(%3, %3) ({
    ^bb0(%arg0: index loc("<stdin>":36:10), %arg1: index loc("<stdin>":36:24)):
      "tensor.yield"(%0) : (f64) -> () loc("<stdin>":37:7)
    }) : (index, index) -> tensor<?x?xf64> loc("<stdin>":35:10)
    %9 = "func.call"(%6, %7, %8) <{callee = @kernel_spmm}> : (tensor<?x?xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>>, tensor<?x?xf64>, tensor<?x?xf64>) -> tensor<?x?xf64> loc("<stdin>":39:10)
    %10 = "vector.transfer_read"(%9, %1, %1, %0) <{in_bounds = [false, false], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = affine_map<(d0, d1) -> (d0, d1)>}> : (tensor<?x?xf64>, index, index, f64) -> vector<4x4xf64> loc("<stdin>":40:11)
    "vector.print"(%10) <{punctuation = #vector.punctuation<newline>}> : (vector<4x4xf64>) -> () loc("<stdin>":41:5)
    "bufferization.dealloc_tensor"(%6) : (tensor<?x?xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>>) -> () loc("<stdin>":42:5)
    "bufferization.dealloc_tensor"(%7) : (tensor<?x?xf64>) -> () loc("<stdin>":43:5)
    "bufferization.dealloc_tensor"(%9) : (tensor<?x?xf64>) -> () loc("<stdin>":44:5)
    "func.return"() : () -> () loc("<stdin>":45:5)
  }) : () -> () loc("<stdin>":19:3)
}) : () -> () loc("<stdin>":6:1)
