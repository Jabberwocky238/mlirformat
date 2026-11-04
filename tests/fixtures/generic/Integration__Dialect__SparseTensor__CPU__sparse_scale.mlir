#map = affine_map<(d0, d1) -> (d0, d1)>
#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<8x8xf32, #sparse>) -> tensor<8x8xf32, #sparse>, sym_name = "sparse_scale"}> ({
  ^bb0(%arg0: tensor<8x8xf32, #sparse>):
    %5 = "arith.constant"() <{value = 2.000000e+00 : f32}> : () -> f32
    %6 = "linalg.generic"(%arg0) <{doc = "X(i,j) = X(i,j) * 2", indexing_maps = [#map], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 0, 1>}> ({
    ^bb0(%arg1: f32):
      %7 = "arith.mulf"(%arg1, %5) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%7) : (f32) -> ()
    }) : (tensor<8x8xf32, #sparse>) -> tensor<8x8xf32, #sparse>
    "func.return"(%6) : (tensor<8x8xf32, #sparse>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %2 = "arith.constant"() <{value = dense<[[1.000000e+00, 0.000000e+00, 1.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 1.000000e+00], [0.000000e+00, 2.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00], [0.000000e+00, 0.000000e+00, 3.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00], [0.000000e+00, 0.000000e+00, 0.000000e+00, 4.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00], [0.000000e+00, 1.000000e+00, 0.000000e+00, 0.000000e+00, 5.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00], [0.000000e+00, 1.000000e+00, 1.000000e+00, 0.000000e+00, 0.000000e+00, 6.000000e+00, 0.000000e+00, 0.000000e+00], [0.000000e+00, 0.000000e+00, 1.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 7.000000e+00, 1.000000e+00], [0.000000e+00, 0.000000e+00, 1.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 8.000000e+00]]> : tensor<8x8xf32>}> : () -> tensor<8x8xf32>
    %3 = "sparse_tensor.convert"(%2) : (tensor<8x8xf32>) -> tensor<8x8xf32, #sparse>
    %4 = "func.call"(%3) <{callee = @sparse_scale}> : (tensor<8x8xf32, #sparse>) -> tensor<8x8xf32, #sparse>
    "sparse_tensor.print"(%4) : (tensor<8x8xf32, #sparse>) -> ()
    "bufferization.dealloc_tensor"(%3) : (tensor<8x8xf32, #sparse>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

