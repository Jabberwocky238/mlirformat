#map = affine_map<(d0) -> (d0)>
#map1 = affine_map<(d0) -> ()>
#sparse = #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1024xf32, #sparse>, tensor<1024xf32, #sparse>, tensor<f32>) -> tensor<f32>, sym_name = "sparse_dot"}> ({
  ^bb0(%arg0: tensor<1024xf32, #sparse>, %arg1: tensor<1024xf32, #sparse>, %arg2: tensor<f32>):
    %9 = "linalg.dot"(%arg0, %arg1, %arg2) <{operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg3: f32, %arg4: f32, %arg5: f32):
      %10 = "arith.mulf"(%arg3, %arg4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %11 = "arith.addf"(%arg5, %10) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%11) : (f32) -> ()
    }) {linalg.memoized_indexing_maps = [#map, #map, #map1]} : (tensor<1024xf32, #sparse>, tensor<1024xf32, #sparse>, tensor<f32>) -> tensor<f32>
    "func.return"(%9) : (tensor<f32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %0 = "arith.constant"() <{value = sparse<[[0], [1], [22], [23], [1022]], [1.000000e+00, 2.000000e+00, 3.000000e+00, 4.000000e+00, 5.000000e+00]> : tensor<1024xf32>}> : () -> tensor<1024xf32>
    %1 = "arith.constant"() <{value = sparse<[[22], [1022], [1023]], [6.000000e+00, 7.000000e+00, 8.000000e+00]> : tensor<1024xf32>}> : () -> tensor<1024xf32>
    %2 = "sparse_tensor.convert"(%0) : (tensor<1024xf32>) -> tensor<1024xf32, #sparse>
    %3 = "sparse_tensor.convert"(%1) : (tensor<1024xf32>) -> tensor<1024xf32, #sparse>
    "sparse_tensor.print"(%2) : (tensor<1024xf32, #sparse>) -> ()
    "sparse_tensor.print"(%3) : (tensor<1024xf32, #sparse>) -> ()
    %4 = "tensor.empty"() : () -> tensor<f32>
    %5 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %6 = "tensor.insert"(%5, %4) : (f32, tensor<f32>) -> tensor<f32>
    %7 = "func.call"(%2, %3, %6) <{callee = @sparse_dot}> : (tensor<1024xf32, #sparse>, tensor<1024xf32, #sparse>, tensor<f32>) -> tensor<f32>
    %8 = "tensor.extract"(%7) : (tensor<f32>) -> f32
    "vector.print"(%8) <{punctuation = #vector.punctuation<newline>}> : (f32) -> ()
    "bufferization.dealloc_tensor"(%7) : (tensor<f32>) -> ()
    "bufferization.dealloc_tensor"(%2) : (tensor<1024xf32, #sparse>) -> ()
    "bufferization.dealloc_tensor"(%3) : (tensor<1024xf32, #sparse>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

