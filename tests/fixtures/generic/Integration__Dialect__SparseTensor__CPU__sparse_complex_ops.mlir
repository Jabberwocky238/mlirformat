#map = affine_map<(d0) -> (d0)>
#sparse = #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?xcomplex<f64>, #sparse>, tensor<?xcomplex<f64>, #sparse>) -> tensor<?xcomplex<f64>, #sparse>, sym_name = "cops"}> ({
  ^bb0(%arg18: tensor<?xcomplex<f64>, #sparse>, %arg19: tensor<?xcomplex<f64>, #sparse>):
    %43 = "arith.constant"() <{value = 0 : index}> : () -> index
    %44 = "tensor.dim"(%arg18, %43) : (tensor<?xcomplex<f64>, #sparse>, index) -> index
    %45 = "tensor.empty"(%44) : (index) -> tensor<?xcomplex<f64>, #sparse>
    %46 = "linalg.generic"(%arg18, %arg19, %45) <{doc = "x(i) = a(i) OP b(i)", indexing_maps = [#map, #map, #map], iterator_types = [#linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg20: complex<f64>, %arg21: complex<f64>, %arg22: complex<f64>):
      %47 = "complex.neg"(%arg21) <{fastmath = #arith.fastmath<none>}> : (complex<f64>) -> complex<f64>
      %48 = "complex.sub"(%arg20, %47) <{fastmath = #arith.fastmath<none>}> : (complex<f64>, complex<f64>) -> complex<f64>
      "linalg.yield"(%48) : (complex<f64>) -> ()
    }) : (tensor<?xcomplex<f64>, #sparse>, tensor<?xcomplex<f64>, #sparse>, tensor<?xcomplex<f64>, #sparse>) -> tensor<?xcomplex<f64>, #sparse>
    "func.return"(%46) : (tensor<?xcomplex<f64>, #sparse>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<?xcomplex<f64>, #sparse>) -> tensor<?xcomplex<f64>, #sparse>, sym_name = "csin"}> ({
  ^bb0(%arg15: tensor<?xcomplex<f64>, #sparse>):
    %38 = "arith.constant"() <{value = 0 : index}> : () -> index
    %39 = "tensor.dim"(%arg15, %38) : (tensor<?xcomplex<f64>, #sparse>, index) -> index
    %40 = "tensor.empty"(%39) : (index) -> tensor<?xcomplex<f64>, #sparse>
    %41 = "linalg.generic"(%arg15, %40) <{doc = "x(i) = OP a(i)", indexing_maps = [#map, #map], iterator_types = [#linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg16: complex<f64>, %arg17: complex<f64>):
      %42 = "complex.sin"(%arg16) <{fastmath = #arith.fastmath<none>}> : (complex<f64>) -> complex<f64>
      "linalg.yield"(%42) : (complex<f64>) -> ()
    }) : (tensor<?xcomplex<f64>, #sparse>, tensor<?xcomplex<f64>, #sparse>) -> tensor<?xcomplex<f64>, #sparse>
    "func.return"(%41) : (tensor<?xcomplex<f64>, #sparse>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<?xcomplex<f64>, #sparse>) -> tensor<?xcomplex<f64>, #sparse>, sym_name = "complex_sqrt"}> ({
  ^bb0(%arg12: tensor<?xcomplex<f64>, #sparse>):
    %33 = "arith.constant"() <{value = 0 : index}> : () -> index
    %34 = "tensor.dim"(%arg12, %33) : (tensor<?xcomplex<f64>, #sparse>, index) -> index
    %35 = "tensor.empty"(%34) : (index) -> tensor<?xcomplex<f64>, #sparse>
    %36 = "linalg.generic"(%arg12, %35) <{doc = "x(i) = OP a(i)", indexing_maps = [#map, #map], iterator_types = [#linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg13: complex<f64>, %arg14: complex<f64>):
      %37 = "complex.sqrt"(%arg13) <{fastmath = #arith.fastmath<none>}> : (complex<f64>) -> complex<f64>
      "linalg.yield"(%37) : (complex<f64>) -> ()
    }) : (tensor<?xcomplex<f64>, #sparse>, tensor<?xcomplex<f64>, #sparse>) -> tensor<?xcomplex<f64>, #sparse>
    "func.return"(%36) : (tensor<?xcomplex<f64>, #sparse>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<?xcomplex<f64>, #sparse>) -> tensor<?xcomplex<f64>, #sparse>, sym_name = "complex_tanh"}> ({
  ^bb0(%arg9: tensor<?xcomplex<f64>, #sparse>):
    %28 = "arith.constant"() <{value = 0 : index}> : () -> index
    %29 = "tensor.dim"(%arg9, %28) : (tensor<?xcomplex<f64>, #sparse>, index) -> index
    %30 = "tensor.empty"(%29) : (index) -> tensor<?xcomplex<f64>, #sparse>
    %31 = "linalg.generic"(%arg9, %30) <{doc = "x(i) = OP a(i)", indexing_maps = [#map, #map], iterator_types = [#linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg10: complex<f64>, %arg11: complex<f64>):
      %32 = "complex.tanh"(%arg10) <{fastmath = #arith.fastmath<none>}> : (complex<f64>) -> complex<f64>
      "linalg.yield"(%32) : (complex<f64>) -> ()
    }) : (tensor<?xcomplex<f64>, #sparse>, tensor<?xcomplex<f64>, #sparse>) -> tensor<?xcomplex<f64>, #sparse>
    "func.return"(%31) : (tensor<?xcomplex<f64>, #sparse>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<?xcomplex<f64>, #sparse>) -> tensor<?xcomplex<f64>, #sparse>, sym_name = "clog1p_expm1"}> ({
  ^bb0(%arg6: tensor<?xcomplex<f64>, #sparse>):
    %22 = "arith.constant"() <{value = 0 : index}> : () -> index
    %23 = "tensor.dim"(%arg6, %22) : (tensor<?xcomplex<f64>, #sparse>, index) -> index
    %24 = "tensor.empty"(%23) : (index) -> tensor<?xcomplex<f64>, #sparse>
    %25 = "linalg.generic"(%arg6, %24) <{doc = "x(i) = OP a(i)", indexing_maps = [#map, #map], iterator_types = [#linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg7: complex<f64>, %arg8: complex<f64>):
      %26 = "complex.log1p"(%arg7) <{fastmath = #arith.fastmath<none>}> : (complex<f64>) -> complex<f64>
      %27 = "complex.expm1"(%26) <{fastmath = #arith.fastmath<none>}> : (complex<f64>) -> complex<f64>
      "linalg.yield"(%27) : (complex<f64>) -> ()
    }) : (tensor<?xcomplex<f64>, #sparse>, tensor<?xcomplex<f64>, #sparse>) -> tensor<?xcomplex<f64>, #sparse>
    "func.return"(%25) : (tensor<?xcomplex<f64>, #sparse>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<?xcomplex<f64>, #sparse>) -> tensor<?xcomplex<f64>, #sparse>, sym_name = "cdiv"}> ({
  ^bb0(%arg3: tensor<?xcomplex<f64>, #sparse>):
    %16 = "arith.constant"() <{value = 0 : index}> : () -> index
    %17 = "tensor.dim"(%arg3, %16) : (tensor<?xcomplex<f64>, #sparse>, index) -> index
    %18 = "tensor.empty"(%17) : (index) -> tensor<?xcomplex<f64>, #sparse>
    %19 = "complex.constant"() <{value = [2.000000e+00, 0.000000e+00]}> : () -> complex<f64>
    %20 = "linalg.generic"(%arg3, %18) <{doc = "x(i) = OP a(i)", indexing_maps = [#map, #map], iterator_types = [#linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg4: complex<f64>, %arg5: complex<f64>):
      %21 = "complex.div"(%arg4, %19) <{fastmath = #arith.fastmath<none>}> : (complex<f64>, complex<f64>) -> complex<f64>
      "linalg.yield"(%21) : (complex<f64>) -> ()
    }) : (tensor<?xcomplex<f64>, #sparse>, tensor<?xcomplex<f64>, #sparse>) -> tensor<?xcomplex<f64>, #sparse>
    "func.return"(%20) : (tensor<?xcomplex<f64>, #sparse>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<?xcomplex<f64>, #sparse>) -> tensor<?xf64, #sparse>, sym_name = "cabs"}> ({
  ^bb0(%arg0: tensor<?xcomplex<f64>, #sparse>):
    %11 = "arith.constant"() <{value = 0 : index}> : () -> index
    %12 = "tensor.dim"(%arg0, %11) : (tensor<?xcomplex<f64>, #sparse>, index) -> index
    %13 = "tensor.empty"(%12) : (index) -> tensor<?xf64, #sparse>
    %14 = "linalg.generic"(%arg0, %13) <{doc = "x(i) = OP a(i)", indexing_maps = [#map, #map], iterator_types = [#linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg1: complex<f64>, %arg2: f64):
      %15 = "complex.abs"(%arg1) <{fastmath = #arith.fastmath<none>}> : (complex<f64>) -> f64
      "linalg.yield"(%15) : (f64) -> ()
    }) : (tensor<?xcomplex<f64>, #sparse>, tensor<?xf64, #sparse>) -> tensor<?xf64, #sparse>
    "func.return"(%14) : (tensor<?xf64, #sparse>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %0 = "arith.constant"() <{value = sparse<[[0], [28], [31]], [(-5.130000e+00,2.000000e+00), (3.000000e+00,4.000000e+00), (5.000000e+00,6.000000e+00)]> : tensor<32xcomplex<f64>>}> : () -> tensor<32xcomplex<f64>>
    %1 = "arith.constant"() <{value = sparse<[[1], [28], [31]], [(1.000000e+00,0.000000e+00), (-2.000000e+00,0.000000e+00), (3.000000e+00,0.000000e+00)]> : tensor<32xcomplex<f64>>}> : () -> tensor<32xcomplex<f64>>
    %2 = "sparse_tensor.convert"(%0) : (tensor<32xcomplex<f64>>) -> tensor<?xcomplex<f64>, #sparse>
    %3 = "sparse_tensor.convert"(%1) : (tensor<32xcomplex<f64>>) -> tensor<?xcomplex<f64>, #sparse>
    %4 = "func.call"(%2, %3) <{callee = @cops}> : (tensor<?xcomplex<f64>, #sparse>, tensor<?xcomplex<f64>, #sparse>) -> tensor<?xcomplex<f64>, #sparse>
    %5 = "func.call"(%2) <{callee = @csin}> : (tensor<?xcomplex<f64>, #sparse>) -> tensor<?xcomplex<f64>, #sparse>
    %6 = "func.call"(%2) <{callee = @complex_sqrt}> : (tensor<?xcomplex<f64>, #sparse>) -> tensor<?xcomplex<f64>, #sparse>
    %7 = "func.call"(%3) <{callee = @complex_tanh}> : (tensor<?xcomplex<f64>, #sparse>) -> tensor<?xcomplex<f64>, #sparse>
    %8 = "func.call"(%2) <{callee = @clog1p_expm1}> : (tensor<?xcomplex<f64>, #sparse>) -> tensor<?xcomplex<f64>, #sparse>
    %9 = "func.call"(%2) <{callee = @cdiv}> : (tensor<?xcomplex<f64>, #sparse>) -> tensor<?xcomplex<f64>, #sparse>
    %10 = "func.call"(%2) <{callee = @cabs}> : (tensor<?xcomplex<f64>, #sparse>) -> tensor<?xf64, #sparse>
    "sparse_tensor.print"(%4) : (tensor<?xcomplex<f64>, #sparse>) -> ()
    "sparse_tensor.print"(%5) : (tensor<?xcomplex<f64>, #sparse>) -> ()
    "sparse_tensor.print"(%6) : (tensor<?xcomplex<f64>, #sparse>) -> ()
    "sparse_tensor.print"(%7) : (tensor<?xcomplex<f64>, #sparse>) -> ()
    "sparse_tensor.print"(%8) : (tensor<?xcomplex<f64>, #sparse>) -> ()
    "sparse_tensor.print"(%9) : (tensor<?xcomplex<f64>, #sparse>) -> ()
    "sparse_tensor.print"(%10) : (tensor<?xf64, #sparse>) -> ()
    "bufferization.dealloc_tensor"(%2) : (tensor<?xcomplex<f64>, #sparse>) -> ()
    "bufferization.dealloc_tensor"(%3) : (tensor<?xcomplex<f64>, #sparse>) -> ()
    "bufferization.dealloc_tensor"(%4) : (tensor<?xcomplex<f64>, #sparse>) -> ()
    "bufferization.dealloc_tensor"(%5) : (tensor<?xcomplex<f64>, #sparse>) -> ()
    "bufferization.dealloc_tensor"(%6) : (tensor<?xcomplex<f64>, #sparse>) -> ()
    "bufferization.dealloc_tensor"(%7) : (tensor<?xcomplex<f64>, #sparse>) -> ()
    "bufferization.dealloc_tensor"(%8) : (tensor<?xcomplex<f64>, #sparse>) -> ()
    "bufferization.dealloc_tensor"(%9) : (tensor<?xcomplex<f64>, #sparse>) -> ()
    "bufferization.dealloc_tensor"(%10) : (tensor<?xf64, #sparse>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

