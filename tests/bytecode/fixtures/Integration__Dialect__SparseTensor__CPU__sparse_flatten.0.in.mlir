"builtin.module"() ({
  "func.func"() <{function_type = (tensor<7x3x3x3x3x3x5x3xf64, #sparse_tensor.encoding<{ map = (d0, d1, d2, d3, d4, d5, d6, d7) -> (d7 : compressed, d6 : compressed, d1 : compressed, d2 : compressed, d0 : compressed, d3 : compressed, d4 : compressed, d5 : compressed) }>>, tensor<7x3xf64>) -> tensor<7x3xf64>, sym_name = "kernel_flatten"}> ({
  ^bb0(%arg0: tensor<7x3x3x3x3x3x5x3xf64, #sparse_tensor.encoding<{ map = (d0, d1, d2, d3, d4, d5, d6, d7) -> (d7 : compressed, d6 : compressed, d1 : compressed, d2 : compressed, d0 : compressed, d3 : compressed, d4 : compressed, d5 : compressed) }>> loc("<stdin>":6:8), %arg1: tensor<7x3xf64> loc("<stdin>":6:53)):
    %10 = "linalg.generic"(%arg0, %arg1) <{doc = "X(i,j) += A(i,j,k,l,m,n,o,p)", indexing_maps = [affine_map<(d0, d1, d2, d3, d4, d5, d6, d7) -> (d0, d1, d2, d3, d4, d5, d6, d7)>, affine_map<(d0, d1, d2, d3, d4, d5, d6, d7) -> (d0, d1)>], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<reduction>, #linalg.iterator_type<reduction>, #linalg.iterator_type<reduction>, #linalg.iterator_type<reduction>, #linalg.iterator_type<reduction>, #linalg.iterator_type<reduction>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg2: f64 loc("<stdin>":8:10), %arg3: f64 loc("<stdin>":8:22)):
      %11 = "arith.addf"(%arg3, %arg2) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64 loc("<stdin>":9:13)
      "linalg.yield"(%11) : (f64) -> () loc("<stdin>":10:7)
    }) : (tensor<7x3x3x3x3x3x5x3xf64, #sparse_tensor.encoding<{ map = (d0, d1, d2, d3, d4, d5, d6, d7) -> (d7 : compressed, d6 : compressed, d1 : compressed, d2 : compressed, d0 : compressed, d3 : compressed, d4 : compressed, d5 : compressed) }>>, tensor<7x3xf64>) -> tensor<7x3xf64> loc("<stdin>":7:11)
    "func.return"(%10) : (tensor<7x3xf64>) -> () loc("<stdin>":12:5)
  }) : () -> () loc("<stdin>":5:3)
  "func.func"() <{function_type = (index) -> !llvm.ptr, sym_name = "getTensorFilename", sym_visibility = "private"}> ({
  }) : () -> () loc("<stdin>":14:3)
  "func.func"() <{function_type = (tensor<*xf64>) -> (), sym_name = "printMemrefF64", sym_visibility = "private"}> ({
  }) : () -> () loc("<stdin>":16:3)
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %0 = "arith.constant"() <{value = 0.000000e+00 : f64}> : () -> f64 loc("<stdin>":19:10)
    %1 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":20:10)
    %2 = "arith.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":21:10)
    %3 = "arith.constant"() <{value = 3 : index}> : () -> index loc("<stdin>":22:10)
    %4 = "arith.constant"() <{value = 7 : index}> : () -> index loc("<stdin>":23:10)
    %5 = "arith.constant"() <{value = dense<0.000000e+00> : tensor<7x3xf64>}> : () -> tensor<7x3xf64> loc("<stdin>":24:10)
    %6 = "func.call"(%1) <{callee = @getTensorFilename}> : (index) -> !llvm.ptr loc("<stdin>":25:10)
    %7 = "sparse_tensor.new"(%6) : (!llvm.ptr) -> tensor<7x3x3x3x3x3x5x3xf64, #sparse_tensor.encoding<{ map = (d0, d1, d2, d3, d4, d5, d6, d7) -> (d7 : compressed, d6 : compressed, d1 : compressed, d2 : compressed, d0 : compressed, d3 : compressed, d4 : compressed, d5 : compressed) }>> loc("<stdin>":26:10)
    %8 = "func.call"(%7, %5) <{callee = @kernel_flatten}> : (tensor<7x3x3x3x3x3x5x3xf64, #sparse_tensor.encoding<{ map = (d0, d1, d2, d3, d4, d5, d6, d7) -> (d7 : compressed, d6 : compressed, d1 : compressed, d2 : compressed, d0 : compressed, d3 : compressed, d4 : compressed, d5 : compressed) }>>, tensor<7x3xf64>) -> tensor<7x3xf64> loc("<stdin>":27:10)
    %9 = "tensor.cast"(%8) : (tensor<7x3xf64>) -> tensor<*xf64> loc("<stdin>":28:10)
    "func.call"(%9) <{callee = @printMemrefF64}> : (tensor<*xf64>) -> () loc("<stdin>":29:5)
    "bufferization.dealloc_tensor"(%7) : (tensor<7x3x3x3x3x3x5x3xf64, #sparse_tensor.encoding<{ map = (d0, d1, d2, d3, d4, d5, d6, d7) -> (d7 : compressed, d6 : compressed, d1 : compressed, d2 : compressed, d0 : compressed, d3 : compressed, d4 : compressed, d5 : compressed) }>>) -> () loc("<stdin>":30:5)
    "bufferization.dealloc_tensor"(%8) : (tensor<7x3xf64>) -> () loc("<stdin>":31:5)
    "func.return"() : () -> () loc("<stdin>":32:5)
  }) : () -> () loc("<stdin>":18:3)
}) : () -> () loc("<stdin>":4:1)
