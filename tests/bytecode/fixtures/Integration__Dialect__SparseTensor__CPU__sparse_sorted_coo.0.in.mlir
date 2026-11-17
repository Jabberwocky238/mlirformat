"builtin.module"() ({
  "func.func"() <{function_type = (index) -> !llvm.ptr, sym_name = "getTensorFilename", sym_visibility = "private"}> ({
  }) : () -> () loc("<stdin>":7:3)
  "func.func"() <{function_type = (tensor<?x?xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed(nonunique), d1 : singleton(soa)) }>>) -> tensor<?x?xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed(nonunique), d1 : singleton(soa)) }>>, sym_name = "sparse_scale"}> ({
  ^bb0(%arg0: tensor<?x?xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed(nonunique), d1 : singleton(soa)) }>> loc("<stdin>":10:8)):
    %11 = "arith.constant"() <{value = 2.000000e+00 : f64}> : () -> f64 loc("<stdin>":11:11)
    %12 = "linalg.generic"(%arg0) <{doc = "X(i,j) = X(i,j) * 2.0", indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 0, 1>}> ({
    ^bb0(%arg1: f64 loc("<stdin>":13:10)):
      %13 = "arith.mulf"(%arg1, %11) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64 loc("<stdin>":14:13)
      "linalg.yield"(%13) : (f64) -> () loc("<stdin>":15:7)
    }) : (tensor<?x?xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed(nonunique), d1 : singleton(soa)) }>>) -> tensor<?x?xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed(nonunique), d1 : singleton(soa)) }>> loc("<stdin>":12:11)
    "func.return"(%12) : (tensor<?x?xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed(nonunique), d1 : singleton(soa)) }>>) -> () loc("<stdin>":17:5)
  }) : () -> () loc("<stdin>":9:3)
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":20:10)
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":21:10)
    %2 = "func.call"(%0) <{callee = @getTensorFilename}> : (index) -> !llvm.ptr loc("<stdin>":22:10)
    %3 = "func.call"(%1) <{callee = @getTensorFilename}> : (index) -> !llvm.ptr loc("<stdin>":23:10)
    %4 = "sparse_tensor.new"(%2) : (!llvm.ptr) -> tensor<?x?xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed(nonunique), d1 : singleton(soa)) }>> loc("<stdin>":24:10)
    %5 = "sparse_tensor.new"(%2) : (!llvm.ptr) -> tensor<?x?xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d1 : compressed(nonunique), d0 : singleton(soa)) }>> loc("<stdin>":25:10)
    %6 = "sparse_tensor.new"(%3) : (!llvm.ptr) -> tensor<?x?x?xf64, #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d0 : compressed(nonunique), d1 : singleton(nonunique, soa), d2 : singleton(soa)) }>> loc("<stdin>":26:10)
    %7 = "sparse_tensor.new"(%3) : (!llvm.ptr) -> tensor<?x?x?xf64, #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d2 : compressed(nonunique), d0 : singleton(nonunique, soa), d1 : singleton(soa)) }>> loc("<stdin>":27:10)
    %8 = "arith.constant"() <{value = sparse<[[0, 0], [1, 3], [2, 0], [2, 3], [3, 1], [4, 1]], [6.000000e+00, 5.000000e+00, 4.000000e+00, 3.000000e+00, 2.000000e+00, 1.100000e+01]> : tensor<5x4xf64>}> : () -> tensor<5x4xf64> loc("<stdin>":28:10)
    %9 = "sparse_tensor.convert"(%8) : (tensor<5x4xf64>) -> tensor<?x?xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed(nonunique), d1 : singleton(soa)) }>> loc("<stdin>":29:10)
    "sparse_tensor.print"(%4) : (tensor<?x?xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed(nonunique), d1 : singleton(soa)) }>>) -> () loc("<stdin>":30:5)
    "sparse_tensor.print"(%5) : (tensor<?x?xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d1 : compressed(nonunique), d0 : singleton(soa)) }>>) -> () loc("<stdin>":31:5)
    "sparse_tensor.print"(%6) : (tensor<?x?x?xf64, #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d0 : compressed(nonunique), d1 : singleton(nonunique, soa), d2 : singleton(soa)) }>>) -> () loc("<stdin>":32:5)
    "sparse_tensor.print"(%7) : (tensor<?x?x?xf64, #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d2 : compressed(nonunique), d0 : singleton(nonunique, soa), d1 : singleton(soa)) }>>) -> () loc("<stdin>":33:5)
    "sparse_tensor.print"(%9) : (tensor<?x?xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed(nonunique), d1 : singleton(soa)) }>>) -> () loc("<stdin>":34:5)
    %10 = "func.call"(%9) <{callee = @sparse_scale}> : (tensor<?x?xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed(nonunique), d1 : singleton(soa)) }>>) -> tensor<?x?xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed(nonunique), d1 : singleton(soa)) }>> loc("<stdin>":35:11)
    "sparse_tensor.print"(%10) : (tensor<?x?xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed(nonunique), d1 : singleton(soa)) }>>) -> () loc("<stdin>":36:5)
    "bufferization.dealloc_tensor"(%4) : (tensor<?x?xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed(nonunique), d1 : singleton(soa)) }>>) -> () loc("<stdin>":37:5)
    "bufferization.dealloc_tensor"(%5) : (tensor<?x?xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d1 : compressed(nonunique), d0 : singleton(soa)) }>>) -> () loc("<stdin>":38:5)
    "bufferization.dealloc_tensor"(%6) : (tensor<?x?x?xf64, #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d0 : compressed(nonunique), d1 : singleton(nonunique, soa), d2 : singleton(soa)) }>>) -> () loc("<stdin>":39:5)
    "bufferization.dealloc_tensor"(%7) : (tensor<?x?x?xf64, #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d2 : compressed(nonunique), d0 : singleton(nonunique, soa), d1 : singleton(soa)) }>>) -> () loc("<stdin>":40:5)
    "bufferization.dealloc_tensor"(%9) : (tensor<?x?xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed(nonunique), d1 : singleton(soa)) }>>) -> () loc("<stdin>":41:5)
    "func.return"() : () -> () loc("<stdin>":42:5)
  }) : () -> () loc("<stdin>":19:3)
}) : () -> () loc("<stdin>":6:1)
