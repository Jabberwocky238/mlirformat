"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?xcomplex<f64>, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>, tensor<complex<f64>>) -> tensor<complex<f64>>, sym_name = "kernel_sum_reduce"}> ({
  ^bb0(%arg0: tensor<?x?xcomplex<f64>, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>> loc("<stdin>":6:8), %arg1: tensor<complex<f64>> loc("<stdin>":6:50)):
    %10 = "linalg.generic"(%arg0, %arg1) <{doc = "x += A(i,j)", indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> ()>], iterator_types = [#linalg.iterator_type<reduction>, #linalg.iterator_type<reduction>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg2: complex<f64> loc("<stdin>":8:10), %arg3: complex<f64> loc("<stdin>":8:31)):
      %11 = "complex.add"(%arg3, %arg2) <{fastmath = #arith.fastmath<none>}> : (complex<f64>, complex<f64>) -> complex<f64> loc("<stdin>":9:13)
      "linalg.yield"(%11) : (complex<f64>) -> () loc("<stdin>":10:7)
    }) : (tensor<?x?xcomplex<f64>, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>, tensor<complex<f64>>) -> tensor<complex<f64>> loc("<stdin>":7:11)
    "func.return"(%10) : (tensor<complex<f64>>) -> () loc("<stdin>":12:5)
  }) : () -> () loc("<stdin>":5:3)
  "func.func"() <{function_type = (index) -> !llvm.ptr, sym_name = "getTensorFilename", sym_visibility = "private"}> ({
  }) : () -> () loc("<stdin>":14:3)
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %0 = "complex.constant"() <{value = [0.000000e+00, 0.000000e+00]}> : () -> complex<f64> loc("<stdin>":17:10)
    %1 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":18:10)
    %2 = "tensor.empty"() : () -> tensor<complex<f64>> loc("<stdin>":19:10)
    %3 = "tensor.insert"(%0, %2) : (complex<f64>, tensor<complex<f64>>) -> tensor<complex<f64>> loc("<stdin>":20:10)
    %4 = "func.call"(%1) <{callee = @getTensorFilename}> : (index) -> !llvm.ptr loc("<stdin>":21:10)
    %5 = "sparse_tensor.new"(%4) : (!llvm.ptr) -> tensor<?x?xcomplex<f64>, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>> loc("<stdin>":22:10)
    %6 = "func.call"(%5, %3) <{callee = @kernel_sum_reduce}> : (tensor<?x?xcomplex<f64>, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>, tensor<complex<f64>>) -> tensor<complex<f64>> loc("<stdin>":23:10)
    %7 = "tensor.extract"(%6) : (tensor<complex<f64>>) -> complex<f64> loc("<stdin>":24:10)
    %8 = "complex.re"(%7) <{fastmath = #arith.fastmath<none>}> : (complex<f64>) -> f64 loc("<stdin>":25:10)
    %9 = "complex.im"(%7) <{fastmath = #arith.fastmath<none>}> : (complex<f64>) -> f64 loc("<stdin>":26:10)
    "vector.print"(%8) <{punctuation = #vector.punctuation<newline>}> : (f64) -> () loc("<stdin>":27:5)
    "vector.print"(%9) <{punctuation = #vector.punctuation<newline>}> : (f64) -> () loc("<stdin>":28:5)
    "bufferization.dealloc_tensor"(%6) : (tensor<complex<f64>>) -> () loc("<stdin>":29:5)
    "bufferization.dealloc_tensor"(%5) : (tensor<?x?xcomplex<f64>, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>) -> () loc("<stdin>":30:5)
    "func.return"() : () -> () loc("<stdin>":31:5)
  }) : () -> () loc("<stdin>":16:3)
}) : () -> () loc("<stdin>":4:1)
