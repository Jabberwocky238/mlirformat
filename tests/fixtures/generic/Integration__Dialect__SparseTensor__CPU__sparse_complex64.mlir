#map = affine_map<(d0) -> (d0)>
#sparse = #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?xcomplex<f64>, #sparse>, tensor<?xcomplex<f64>, #sparse>) -> tensor<?xcomplex<f64>, #sparse>, sym_name = "cadd"}> ({
  ^bb0(%arg5: tensor<?xcomplex<f64>, #sparse>, %arg6: tensor<?xcomplex<f64>, #sparse>):
    %11 = "arith.constant"() <{value = 0 : index}> : () -> index
    %12 = "tensor.dim"(%arg5, %11) : (tensor<?xcomplex<f64>, #sparse>, index) -> index
    %13 = "tensor.empty"(%12) : (index) -> tensor<?xcomplex<f64>, #sparse>
    %14 = "linalg.generic"(%arg5, %arg6, %13) <{doc = "x(i) = a(i) OP b(i)", indexing_maps = [#map, #map, #map], iterator_types = [#linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg7: complex<f64>, %arg8: complex<f64>, %arg9: complex<f64>):
      %15 = "complex.add"(%arg7, %arg8) <{fastmath = #arith.fastmath<none>}> : (complex<f64>, complex<f64>) -> complex<f64>
      "linalg.yield"(%15) : (complex<f64>) -> ()
    }) : (tensor<?xcomplex<f64>, #sparse>, tensor<?xcomplex<f64>, #sparse>, tensor<?xcomplex<f64>, #sparse>) -> tensor<?xcomplex<f64>, #sparse>
    "func.return"(%14) : (tensor<?xcomplex<f64>, #sparse>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<?xcomplex<f64>, #sparse>, tensor<?xcomplex<f64>, #sparse>) -> tensor<?xcomplex<f64>, #sparse>, sym_name = "cmul"}> ({
  ^bb0(%arg0: tensor<?xcomplex<f64>, #sparse>, %arg1: tensor<?xcomplex<f64>, #sparse>):
    %6 = "arith.constant"() <{value = 0 : index}> : () -> index
    %7 = "tensor.dim"(%arg0, %6) : (tensor<?xcomplex<f64>, #sparse>, index) -> index
    %8 = "tensor.empty"(%7) : (index) -> tensor<?xcomplex<f64>, #sparse>
    %9 = "linalg.generic"(%arg0, %arg1, %8) <{doc = "x(i) = a(i) OP b(i)", indexing_maps = [#map, #map, #map], iterator_types = [#linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg2: complex<f64>, %arg3: complex<f64>, %arg4: complex<f64>):
      %10 = "complex.mul"(%arg2, %arg3) <{fastmath = #arith.fastmath<none>}> : (complex<f64>, complex<f64>) -> complex<f64>
      "linalg.yield"(%10) : (complex<f64>) -> ()
    }) : (tensor<?xcomplex<f64>, #sparse>, tensor<?xcomplex<f64>, #sparse>, tensor<?xcomplex<f64>, #sparse>) -> tensor<?xcomplex<f64>, #sparse>
    "func.return"(%9) : (tensor<?xcomplex<f64>, #sparse>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %0 = "arith.constant"() <{value = sparse<[[0], [28], [31]], [(5.111300e+02,2.000000e+00), (3.000000e+00,4.000000e+00), (5.000000e+00,6.000000e+00)]> : tensor<32xcomplex<f64>>}> : () -> tensor<32xcomplex<f64>>
    %1 = "arith.constant"() <{value = sparse<[[1], [28], [31]], [(1.000000e+00,0.000000e+00), (2.000000e+00,0.000000e+00), (3.000000e+00,0.000000e+00)]> : tensor<32xcomplex<f64>>}> : () -> tensor<32xcomplex<f64>>
    %2 = "sparse_tensor.convert"(%0) : (tensor<32xcomplex<f64>>) -> tensor<?xcomplex<f64>, #sparse>
    %3 = "sparse_tensor.convert"(%1) : (tensor<32xcomplex<f64>>) -> tensor<?xcomplex<f64>, #sparse>
    %4 = "func.call"(%2, %3) <{callee = @cadd}> : (tensor<?xcomplex<f64>, #sparse>, tensor<?xcomplex<f64>, #sparse>) -> tensor<?xcomplex<f64>, #sparse>
    %5 = "func.call"(%2, %3) <{callee = @cmul}> : (tensor<?xcomplex<f64>, #sparse>, tensor<?xcomplex<f64>, #sparse>) -> tensor<?xcomplex<f64>, #sparse>
    "sparse_tensor.print"(%4) : (tensor<?xcomplex<f64>, #sparse>) -> ()
    "sparse_tensor.print"(%5) : (tensor<?xcomplex<f64>, #sparse>) -> ()
    "bufferization.dealloc_tensor"(%2) : (tensor<?xcomplex<f64>, #sparse>) -> ()
    "bufferization.dealloc_tensor"(%3) : (tensor<?xcomplex<f64>, #sparse>) -> ()
    "bufferization.dealloc_tensor"(%4) : (tensor<?xcomplex<f64>, #sparse>) -> ()
    "bufferization.dealloc_tensor"(%5) : (tensor<?xcomplex<f64>, #sparse>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

