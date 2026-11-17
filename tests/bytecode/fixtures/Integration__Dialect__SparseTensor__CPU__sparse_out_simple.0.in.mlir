"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>) -> tensor<?x?xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>, sym_name = "kernel_eltwise_mult"}> ({
  ^bb0(%arg0: tensor<?x?xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>> loc("<stdin>":5:8)):
    %5 = "linalg.generic"(%arg0) <{doc = "X(i,j) *= X(i,j)", indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 0, 1>}> ({
    ^bb0(%arg1: f64 loc("<stdin>":7:10)):
      %6 = "arith.mulf"(%arg1, %arg1) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64 loc("<stdin>":8:12)
      "linalg.yield"(%6) : (f64) -> () loc("<stdin>":9:7)
    }) : (tensor<?x?xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>) -> tensor<?x?xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>> loc("<stdin>":6:10)
    "func.return"(%5) : (tensor<?x?xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>) -> () loc("<stdin>":11:5)
  }) : () -> () loc("<stdin>":4:3)
  "func.func"() <{function_type = (index) -> !llvm.ptr, sym_name = "getTensorFilename", sym_visibility = "private"}> ({
  }) : () -> () loc("<stdin>":13:3)
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %0 = "arith.constant"() <{value = 0.000000e+00 : f64}> : () -> f64 loc("<stdin>":16:10)
    %1 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":17:10)
    %2 = "func.call"(%1) <{callee = @getTensorFilename}> : (index) -> !llvm.ptr loc("<stdin>":18:10)
    %3 = "sparse_tensor.new"(%2) : (!llvm.ptr) -> tensor<?x?xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>> loc("<stdin>":19:10)
    %4 = "func.call"(%3) <{callee = @kernel_eltwise_mult}> : (tensor<?x?xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>) -> tensor<?x?xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>> loc("<stdin>":20:10)
    "sparse_tensor.print"(%4) : (tensor<?x?xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>) -> () loc("<stdin>":21:5)
    "bufferization.dealloc_tensor"(%3) : (tensor<?x?xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>) -> () loc("<stdin>":22:5)
    "func.return"() : () -> () loc("<stdin>":23:5)
  }) : () -> () loc("<stdin>":15:3)
}) : () -> () loc("<stdin>":3:1)
