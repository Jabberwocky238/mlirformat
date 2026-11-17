"builtin.module"() ({
  "func.func"() <{function_type = (index) -> !llvm.ptr, sym_name = "getTensorFilename", sym_visibility = "private"}> ({
  }) : () -> () loc("<stdin>":5:3)
  "func.func"() <{function_type = (tensor<?x?xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 floordiv 2 : dense, d1 floordiv 2 : compressed, d0 mod 2 : dense, d1 mod 2 : dense) }>>) -> tensor<?x?xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 floordiv 2 : dense, d1 floordiv 2 : compressed, d0 mod 2 : dense, d1 mod 2 : dense) }>>, sym_name = "scale"}> ({
  ^bb0(%arg0: tensor<?x?xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 floordiv 2 : dense, d1 floordiv 2 : compressed, d0 mod 2 : dense, d1 mod 2 : dense) }>> loc("<stdin>":8:8)):
    %6 = "arith.constant"() <{value = 3.000000e+00 : f64}> : () -> f64 loc("<stdin>":9:10)
    %7 = "linalg.generic"(%arg0) <{indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 0, 1>}> ({
    ^bb0(%arg1: f64 loc("<stdin>":11:10)):
      %8 = "arith.mulf"(%arg1, %6) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64 loc("<stdin>":12:12)
      "linalg.yield"(%8) : (f64) -> () loc("<stdin>":13:7)
    }) : (tensor<?x?xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 floordiv 2 : dense, d1 floordiv 2 : compressed, d0 mod 2 : dense, d1 mod 2 : dense) }>>) -> tensor<?x?xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 floordiv 2 : dense, d1 floordiv 2 : compressed, d0 mod 2 : dense, d1 mod 2 : dense) }>> loc("<stdin>":10:10)
    "func.return"(%7) : (tensor<?x?xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 floordiv 2 : dense, d1 floordiv 2 : compressed, d0 mod 2 : dense, d1 mod 2 : dense) }>>) -> () loc("<stdin>":15:5)
  }) : () -> () loc("<stdin>":7:3)
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":18:10)
    %1 = "arith.constant"() <{value = 0.000000e+00 : f64}> : () -> f64 loc("<stdin>":19:10)
    %2 = "func.call"(%0) <{callee = @getTensorFilename}> : (index) -> !llvm.ptr loc("<stdin>":20:10)
    %3 = "sparse_tensor.new"(%2) : (!llvm.ptr) -> tensor<?x?xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 floordiv 2 : dense, d1 floordiv 2 : compressed, d0 mod 2 : dense, d1 mod 2 : dense) }>> loc("<stdin>":21:10)
    "sparse_tensor.print"(%3) : (tensor<?x?xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 floordiv 2 : dense, d1 floordiv 2 : compressed, d0 mod 2 : dense, d1 mod 2 : dense) }>>) -> () loc("<stdin>":22:5)
    %4 = "sparse_tensor.reinterpret_map"(%3) : (tensor<?x?xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 floordiv 2 : dense, d1 floordiv 2 : compressed, d0 mod 2 : dense, d1 mod 2 : dense) }>>) -> tensor<?x?x2x2xf64, #sparse_tensor.encoding<{ map = (d0, d1, d2, d3) -> (d0 : dense, d1 : compressed, d2 : dense, d3 : dense) }>> loc("<stdin>":23:10)
    "sparse_tensor.print"(%4) : (tensor<?x?x2x2xf64, #sparse_tensor.encoding<{ map = (d0, d1, d2, d3) -> (d0 : dense, d1 : compressed, d2 : dense, d3 : dense) }>>) -> () loc("<stdin>":24:5)
    %5 = "func.call"(%3) <{callee = @scale}> : (tensor<?x?xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 floordiv 2 : dense, d1 floordiv 2 : compressed, d0 mod 2 : dense, d1 mod 2 : dense) }>>) -> tensor<?x?xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 floordiv 2 : dense, d1 floordiv 2 : compressed, d0 mod 2 : dense, d1 mod 2 : dense) }>> loc("<stdin>":25:10)
    "sparse_tensor.print"(%5) : (tensor<?x?xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 floordiv 2 : dense, d1 floordiv 2 : compressed, d0 mod 2 : dense, d1 mod 2 : dense) }>>) -> () loc("<stdin>":26:5)
    "bufferization.dealloc_tensor"(%3) : (tensor<?x?xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 floordiv 2 : dense, d1 floordiv 2 : compressed, d0 mod 2 : dense, d1 mod 2 : dense) }>>) -> () loc("<stdin>":27:5)
    "func.return"() : () -> () loc("<stdin>":28:5)
  }) : () -> () loc("<stdin>":17:3)
}) : () -> () loc("<stdin>":4:1)
