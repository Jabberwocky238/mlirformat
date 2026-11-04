#map = affine_map<(d0, d1) -> (d0, d1)>
#map1 = affine_map<(d0, d1) -> ()>
#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?xbf16, #sparse>, tensor<bf16>) -> tensor<bf16>, sym_name = "kernel_sum_reduce"}> ({
  ^bb0(%arg0: tensor<?x?xbf16, #sparse>, %arg1: tensor<bf16>):
    %7 = "linalg.generic"(%arg0, %arg1) <{doc = "x += A(i,j)", indexing_maps = [#map, #map1], iterator_types = [#linalg.iterator_type<reduction>, #linalg.iterator_type<reduction>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg2: bf16, %arg3: bf16):
      %8 = "arith.addf"(%arg3, %arg2) <{fastmath = #arith.fastmath<none>}> : (bf16, bf16) -> bf16
      "linalg.yield"(%8) : (bf16) -> ()
    }) : (tensor<?x?xbf16, #sparse>, tensor<bf16>) -> tensor<bf16>
    "func.return"(%7) : (tensor<bf16>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index) -> !llvm.ptr, sym_name = "getTensorFilename", sym_visibility = "private"}> ({
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %0 = "arith.constant"() <{value = dense<[[1.101560e+00, 1.203130e+00, 0.000000e+00, 1.398440e+00], [0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00], [3.093750e+00, 0.000000e+00, 3.296880e+00, 3.406250e+00]]> : tensor<3x4xbf16>}> : () -> tensor<3x4xbf16>
    %1 = "sparse_tensor.convert"(%0) : (tensor<3x4xbf16>) -> tensor<?x?xbf16, #sparse>
    %2 = "arith.constant"() <{value = 0.000000e+00 : bf16}> : () -> bf16
    %3 = "tensor.from_elements"(%2) : (bf16) -> tensor<bf16>
    %4 = "func.call"(%1, %3) <{callee = @kernel_sum_reduce}> : (tensor<?x?xbf16, #sparse>, tensor<bf16>) -> tensor<bf16>
    %5 = "tensor.extract"(%4) : (tensor<bf16>) -> bf16
    %6 = "arith.extf"(%5) : (bf16) -> f32
    "vector.print"(%6) <{punctuation = #vector.punctuation<newline>}> : (f32) -> ()
    "bufferization.dealloc_tensor"(%1) : (tensor<?x?xbf16, #sparse>) -> ()
    "bufferization.dealloc_tensor"(%4) : (tensor<bf16>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

