"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>, tensor<f64>) -> tensor<f64>, sym_name = "kernel_sum_reduce"}> ({
  ^bb0(%arg0: tensor<?x?xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>> loc("<stdin>":6:8), %arg1: tensor<f64> loc("<stdin>":6:41)):
    %7 = "linalg.generic"(%arg0, %arg1) <{doc = "x += A(i,j)", indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> ()>], iterator_types = [#linalg.iterator_type<reduction>, #linalg.iterator_type<reduction>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg2: f64 loc("<stdin>":8:10), %arg3: f64 loc("<stdin>":8:22)):
      %8 = "arith.addf"(%arg3, %arg2) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64 loc("<stdin>":9:12)
      "linalg.yield"(%8) : (f64) -> () loc("<stdin>":10:7)
    }) : (tensor<?x?xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>, tensor<f64>) -> tensor<f64> loc("<stdin>":7:10)
    "func.return"(%7) : (tensor<f64>) -> () loc("<stdin>":12:5)
  }) : () -> () loc("<stdin>":5:3)
  "func.func"() <{function_type = (index) -> !llvm.ptr, sym_name = "getTensorFilename", sym_visibility = "private"}> ({
  }) : () -> () loc("<stdin>":14:3)
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %0 = "arith.constant"() <{value = 0.000000e+00 : f64}> : () -> f64 loc("<stdin>":17:10)
    %1 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":18:10)
    %2 = "tensor.from_elements"(%0) : (f64) -> tensor<f64> loc("<stdin>":19:10)
    %3 = "func.call"(%1) <{callee = @getTensorFilename}> : (index) -> !llvm.ptr loc("<stdin>":20:10)
    %4 = "sparse_tensor.new"(%3) : (!llvm.ptr) -> tensor<?x?xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>> loc("<stdin>":21:10)
    %5 = "func.call"(%4, %2) <{callee = @kernel_sum_reduce}> : (tensor<?x?xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>, tensor<f64>) -> tensor<f64> loc("<stdin>":22:10)
    %6 = "tensor.extract"(%5) : (tensor<f64>) -> f64 loc("<stdin>":23:10)
    "vector.print"(%6) <{punctuation = #vector.punctuation<newline>}> : (f64) -> () loc("<stdin>":24:5)
    "bufferization.dealloc_tensor"(%4) : (tensor<?x?xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>) -> () loc("<stdin>":25:5)
    "bufferization.dealloc_tensor"(%5) : (tensor<f64>) -> () loc("<stdin>":26:5)
    "func.return"() : () -> () loc("<stdin>":27:5)
  }) : () -> () loc("<stdin>":16:3)
}) : () -> () loc("<stdin>":4:1)
