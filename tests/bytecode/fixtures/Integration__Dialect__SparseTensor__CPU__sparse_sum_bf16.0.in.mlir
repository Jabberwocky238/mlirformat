"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?xbf16, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>, tensor<bf16>) -> tensor<bf16>, sym_name = "kernel_sum_reduce"}> ({
  ^bb0(%arg0: tensor<?x?xbf16, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>> loc("<stdin>":6:8), %arg1: tensor<bf16> loc("<stdin>":6:42)):
    %7 = "linalg.generic"(%arg0, %arg1) <{doc = "x += A(i,j)", indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> ()>], iterator_types = [#linalg.iterator_type<reduction>, #linalg.iterator_type<reduction>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg2: bf16 loc("<stdin>":8:10), %arg3: bf16 loc("<stdin>":8:23)):
      %8 = "arith.addf"(%arg3, %arg2) <{fastmath = #arith.fastmath<none>}> : (bf16, bf16) -> bf16 loc("<stdin>":9:12)
      "linalg.yield"(%8) : (bf16) -> () loc("<stdin>":10:7)
    }) : (tensor<?x?xbf16, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>, tensor<bf16>) -> tensor<bf16> loc("<stdin>":7:10)
    "func.return"(%7) : (tensor<bf16>) -> () loc("<stdin>":12:5)
  }) : () -> () loc("<stdin>":5:3)
  "func.func"() <{function_type = (index) -> !llvm.ptr, sym_name = "getTensorFilename", sym_visibility = "private"}> ({
  }) : () -> () loc("<stdin>":14:3)
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %0 = "arith.constant"() <{value = dense<[[1.101560e+00, 1.203130e+00, 0.000000e+00, 1.398440e+00], [0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00], [3.093750e+00, 0.000000e+00, 3.296880e+00, 3.406250e+00]]> : tensor<3x4xbf16>}> : () -> tensor<3x4xbf16> loc("<stdin>":17:10)
    %1 = "sparse_tensor.convert"(%0) : (tensor<3x4xbf16>) -> tensor<?x?xbf16, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>> loc("<stdin>":18:10)
    %2 = "arith.constant"() <{value = 0.000000e+00 : bf16}> : () -> bf16 loc("<stdin>":19:10)
    %3 = "tensor.from_elements"(%2) : (bf16) -> tensor<bf16> loc("<stdin>":20:10)
    %4 = "func.call"(%1, %3) <{callee = @kernel_sum_reduce}> : (tensor<?x?xbf16, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>, tensor<bf16>) -> tensor<bf16> loc("<stdin>":21:10)
    %5 = "tensor.extract"(%4) : (tensor<bf16>) -> bf16 loc("<stdin>":22:10)
    %6 = "arith.extf"(%5) : (bf16) -> f32 loc("<stdin>":23:10)
    "vector.print"(%6) <{punctuation = #vector.punctuation<newline>}> : (f32) -> () loc("<stdin>":24:5)
    "bufferization.dealloc_tensor"(%1) : (tensor<?x?xbf16, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>) -> () loc("<stdin>":25:5)
    "bufferization.dealloc_tensor"(%4) : (tensor<bf16>) -> () loc("<stdin>":26:5)
    "func.return"() : () -> () loc("<stdin>":27:5)
  }) : () -> () loc("<stdin>":16:3)
}) : () -> () loc("<stdin>":4:1)
