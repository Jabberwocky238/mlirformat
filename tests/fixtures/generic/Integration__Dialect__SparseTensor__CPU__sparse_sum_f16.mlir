#map = affine_map<(d0, d1) -> (d0, d1)>
#map1 = affine_map<(d0, d1) -> ()>
#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?xf16, #sparse>, tensor<f16>) -> tensor<f16>, sym_name = "kernel_sum_reduce"}> ({
  ^bb0(%arg0: tensor<?x?xf16, #sparse>, %arg1: tensor<f16>):
    %7 = "linalg.generic"(%arg0, %arg1) <{doc = "x += A(i,j)", indexing_maps = [#map, #map1], iterator_types = [#linalg.iterator_type<reduction>, #linalg.iterator_type<reduction>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg2: f16, %arg3: f16):
      %8 = "arith.addf"(%arg3, %arg2) <{fastmath = #arith.fastmath<none>}> : (f16, f16) -> f16
      "linalg.yield"(%8) : (f16) -> ()
    }) : (tensor<?x?xf16, #sparse>, tensor<f16>) -> tensor<f16>
    "func.return"(%7) : (tensor<f16>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index) -> !llvm.ptr, sym_name = "getTensorFilename", sym_visibility = "private"}> ({
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %0 = "arith.constant"() <{value = dense<[[1.099610e+00, 1.200200e+00, 0.000000e+00, 1.400390e+00], [0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00], [3.099610e+00, 0.000000e+00, 3.300780e+00, 3.400390e+00]]> : tensor<3x4xf16>}> : () -> tensor<3x4xf16>
    %1 = "sparse_tensor.convert"(%0) : (tensor<3x4xf16>) -> tensor<?x?xf16, #sparse>
    %2 = "arith.constant"() <{value = 0.000000e+00 : f16}> : () -> f16
    %3 = "tensor.from_elements"(%2) : (f16) -> tensor<f16>
    %4 = "func.call"(%1, %3) <{callee = @kernel_sum_reduce}> : (tensor<?x?xf16, #sparse>, tensor<f16>) -> tensor<f16>
    %5 = "tensor.extract"(%4) : (tensor<f16>) -> f16
    %6 = "arith.extf"(%5) : (f16) -> f32
    "vector.print"(%6) <{punctuation = #vector.punctuation<newline>}> : (f32) -> ()
    "bufferization.dealloc_tensor"(%4) : (tensor<f16>) -> ()
    "bufferization.dealloc_tensor"(%1) : (tensor<?x?xf16, #sparse>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

