#map = affine_map<(d0) -> (d0)>
#sparse = #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?xcomplex<f32>, #sparse>) -> tensor<?xf32, #sparse>, sym_name = "cre"}> ({
  ^bb0(%arg3: tensor<?xcomplex<f32>, #sparse>):
    %9 = "arith.constant"() <{value = 0 : index}> : () -> index
    %10 = "tensor.dim"(%arg3, %9) : (tensor<?xcomplex<f32>, #sparse>, index) -> index
    %11 = "tensor.empty"(%10) : (index) -> tensor<?xf32, #sparse>
    %12 = "linalg.generic"(%arg3, %11) <{doc = "x(i) = OP a(i)", indexing_maps = [#map, #map], iterator_types = [#linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg4: complex<f32>, %arg5: f32):
      %13 = "complex.re"(%arg4) <{fastmath = #arith.fastmath<none>}> : (complex<f32>) -> f32
      "linalg.yield"(%13) : (f32) -> ()
    }) : (tensor<?xcomplex<f32>, #sparse>, tensor<?xf32, #sparse>) -> tensor<?xf32, #sparse>
    "func.return"(%12) : (tensor<?xf32, #sparse>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<?xcomplex<f32>, #sparse>) -> tensor<?xf32, #sparse>, sym_name = "cim"}> ({
  ^bb0(%arg0: tensor<?xcomplex<f32>, #sparse>):
    %4 = "arith.constant"() <{value = 0 : index}> : () -> index
    %5 = "tensor.dim"(%arg0, %4) : (tensor<?xcomplex<f32>, #sparse>, index) -> index
    %6 = "tensor.empty"(%5) : (index) -> tensor<?xf32, #sparse>
    %7 = "linalg.generic"(%arg0, %6) <{doc = "x(i) = OP a(i)", indexing_maps = [#map, #map], iterator_types = [#linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg1: complex<f32>, %arg2: f32):
      %8 = "complex.im"(%arg1) <{fastmath = #arith.fastmath<none>}> : (complex<f32>) -> f32
      "linalg.yield"(%8) : (f32) -> ()
    }) : (tensor<?xcomplex<f32>, #sparse>, tensor<?xf32, #sparse>) -> tensor<?xf32, #sparse>
    "func.return"(%7) : (tensor<?xf32, #sparse>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %0 = "arith.constant"() <{value = sparse<[[0], [20], [31]], [(5.130000e+00,2.000000e+00), (3.000000e+00,4.000000e+00), (5.000000e+00,6.000000e+00)]> : tensor<32xcomplex<f32>>}> : () -> tensor<32xcomplex<f32>>
    %1 = "sparse_tensor.convert"(%0) : (tensor<32xcomplex<f32>>) -> tensor<?xcomplex<f32>, #sparse>
    %2 = "func.call"(%1) <{callee = @cre}> : (tensor<?xcomplex<f32>, #sparse>) -> tensor<?xf32, #sparse>
    %3 = "func.call"(%1) <{callee = @cim}> : (tensor<?xcomplex<f32>, #sparse>) -> tensor<?xf32, #sparse>
    "sparse_tensor.print"(%2) : (tensor<?xf32, #sparse>) -> ()
    "sparse_tensor.print"(%3) : (tensor<?xf32, #sparse>) -> ()
    "bufferization.dealloc_tensor"(%1) : (tensor<?xcomplex<f32>, #sparse>) -> ()
    "bufferization.dealloc_tensor"(%2) : (tensor<?xf32, #sparse>) -> ()
    "bufferization.dealloc_tensor"(%3) : (tensor<?xf32, #sparse>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

