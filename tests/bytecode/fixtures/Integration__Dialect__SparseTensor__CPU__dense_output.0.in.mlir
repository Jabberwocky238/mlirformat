"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>>) -> tensor<?x?xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : dense) }>>, sym_name = "dense_output"}> ({
  ^bb0(%arg0: tensor<?x?xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>> loc("<stdin>":6:8)):
    %6 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":7:10)
    %7 = "arith.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":8:10)
    %8 = "arith.constant"() <{value = 2.000000e+00 : f64}> : () -> f64 loc("<stdin>":9:10)
    %9 = "tensor.dim"(%arg0, %6) : (tensor<?x?xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>>, index) -> index loc("<stdin>":10:10)
    %10 = "tensor.dim"(%arg0, %7) : (tensor<?x?xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>>, index) -> index loc("<stdin>":11:11)
    %11 = "tensor.empty"(%9, %10) : (index, index) -> tensor<?x?xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : dense) }>> loc("<stdin>":12:11)
    %12 = "linalg.generic"(%arg0, %11) <{doc = "X(i,j) = A(i,j) * 2", indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg1: f64 loc("<stdin>":14:10), %arg2: f64 loc("<stdin>":14:22)):
      %13 = "arith.mulf"(%arg1, %8) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64 loc("<stdin>":15:13)
      "linalg.yield"(%13) : (f64) -> () loc("<stdin>":16:7)
    }) : (tensor<?x?xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>>, tensor<?x?xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : dense) }>>) -> tensor<?x?xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : dense) }>> loc("<stdin>":13:11)
    "func.return"(%12) : (tensor<?x?xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : dense) }>>) -> () loc("<stdin>":18:5)
  }) : () -> () loc("<stdin>":5:3)
  "func.func"() <{function_type = (index) -> !llvm.ptr, sym_name = "getTensorFilename", sym_visibility = "private"}> ({
  }) : () -> () loc("<stdin>":20:3)
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %0 = "arith.constant"() <{value = 0.000000e+00 : f64}> : () -> f64 loc("<stdin>":23:10)
    %1 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":24:10)
    %2 = "arith.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":25:10)
    %3 = "func.call"(%1) <{callee = @getTensorFilename}> : (index) -> !llvm.ptr loc("<stdin>":26:10)
    %4 = "sparse_tensor.new"(%3) : (!llvm.ptr) -> tensor<?x?xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>> loc("<stdin>":27:10)
    %5 = "func.call"(%4) <{callee = @dense_output}> : (tensor<?x?xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>>) -> tensor<?x?xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : dense) }>> loc("<stdin>":28:10)
    "sparse_tensor.print"(%5) : (tensor<?x?xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : dense) }>>) -> () loc("<stdin>":29:5)
    "bufferization.dealloc_tensor"(%4) : (tensor<?x?xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>>) -> () loc("<stdin>":30:5)
    "bufferization.dealloc_tensor"(%5) : (tensor<?x?xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : dense) }>>) -> () loc("<stdin>":31:5)
    "func.return"() : () -> () loc("<stdin>":32:5)
  }) : () -> () loc("<stdin>":22:3)
}) : () -> () loc("<stdin>":4:1)
