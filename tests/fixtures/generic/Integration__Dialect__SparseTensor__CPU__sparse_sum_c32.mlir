#map = affine_map<(d0, d1) -> (d0, d1)>
#map1 = affine_map<(d0, d1) -> ()>
#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?xcomplex<f64>, #sparse>, tensor<complex<f64>>) -> tensor<complex<f64>>, sym_name = "kernel_sum_reduce"}> ({
  ^bb0(%arg0: tensor<?x?xcomplex<f64>, #sparse>, %arg1: tensor<complex<f64>>):
    %10 = "linalg.generic"(%arg0, %arg1) <{doc = "x += A(i,j)", indexing_maps = [#map, #map1], iterator_types = [#linalg.iterator_type<reduction>, #linalg.iterator_type<reduction>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg2: complex<f64>, %arg3: complex<f64>):
      %11 = "complex.add"(%arg3, %arg2) <{fastmath = #arith.fastmath<none>}> : (complex<f64>, complex<f64>) -> complex<f64>
      "linalg.yield"(%11) : (complex<f64>) -> ()
    }) : (tensor<?x?xcomplex<f64>, #sparse>, tensor<complex<f64>>) -> tensor<complex<f64>>
    "func.return"(%10) : (tensor<complex<f64>>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index) -> !llvm.ptr, sym_name = "getTensorFilename", sym_visibility = "private"}> ({
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %0 = "complex.constant"() <{value = [0.000000e+00, 0.000000e+00]}> : () -> complex<f64>
    %1 = "arith.constant"() <{value = 0 : index}> : () -> index
    %2 = "tensor.empty"() : () -> tensor<complex<f64>>
    %3 = "tensor.insert"(%0, %2) : (complex<f64>, tensor<complex<f64>>) -> tensor<complex<f64>>
    %4 = "func.call"(%1) <{callee = @getTensorFilename}> : (index) -> !llvm.ptr
    %5 = "sparse_tensor.new"(%4) : (!llvm.ptr) -> tensor<?x?xcomplex<f64>, #sparse>
    %6 = "func.call"(%5, %3) <{callee = @kernel_sum_reduce}> : (tensor<?x?xcomplex<f64>, #sparse>, tensor<complex<f64>>) -> tensor<complex<f64>>
    %7 = "tensor.extract"(%6) : (tensor<complex<f64>>) -> complex<f64>
    %8 = "complex.re"(%7) <{fastmath = #arith.fastmath<none>}> : (complex<f64>) -> f64
    %9 = "complex.im"(%7) <{fastmath = #arith.fastmath<none>}> : (complex<f64>) -> f64
    "vector.print"(%8) <{punctuation = #vector.punctuation<newline>}> : (f64) -> ()
    "vector.print"(%9) <{punctuation = #vector.punctuation<newline>}> : (f64) -> ()
    "bufferization.dealloc_tensor"(%6) : (tensor<complex<f64>>) -> ()
    "bufferization.dealloc_tensor"(%5) : (tensor<?x?xcomplex<f64>, #sparse>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

