#map = affine_map<(d0, d1) -> (d0, d1)>
#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<32x16xf32, #sparse>, tensor<32x16xf32, #sparse>) -> tensor<32x16xf32, #sparse>, sym_name = "sparse_mult_elt"}> ({
  ^bb0(%arg0: tensor<32x16xf32, #sparse>, %arg1: tensor<32x16xf32, #sparse>):
    %7 = "tensor.empty"() : () -> tensor<32x16xf32, #sparse>
    %8 = "linalg.generic"(%arg0, %arg1, %7) <{doc = "X(i,j) = A(i,j) * B(i,j)", indexing_maps = [#map, #map, #map], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg2: f32, %arg3: f32, %arg4: f32):
      %9 = "arith.mulf"(%arg2, %arg3) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%9) : (f32) -> ()
    }) : (tensor<32x16xf32, #sparse>, tensor<32x16xf32, #sparse>, tensor<32x16xf32, #sparse>) -> tensor<32x16xf32, #sparse>
    "func.return"(%8) : (tensor<32x16xf32, #sparse>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %2 = "arith.constant"() <{value = sparse<[[2, 2], [15, 15], [31, 0], [31, 14]], [2.000000e+00, 3.000000e+00, -2.000000e+00, 4.000000e+00]> : tensor<32x16xf32>}> : () -> tensor<32x16xf32>
    %3 = "arith.constant"() <{value = sparse<[[1, 1], [2, 0], [2, 2], [2, 15], [31, 0], [31, 15]], [5.000000e+00, 6.000000e+00, 7.000000e+00, 8.000000e+00, -1.000000e+01, 9.000000e+00]> : tensor<32x16xf32>}> : () -> tensor<32x16xf32>
    %4 = "sparse_tensor.convert"(%2) : (tensor<32x16xf32>) -> tensor<32x16xf32, #sparse>
    %5 = "sparse_tensor.convert"(%3) : (tensor<32x16xf32>) -> tensor<32x16xf32, #sparse>
    %6 = "func.call"(%4, %5) <{callee = @sparse_mult_elt}> : (tensor<32x16xf32, #sparse>, tensor<32x16xf32, #sparse>) -> tensor<32x16xf32, #sparse>
    "sparse_tensor.print"(%6) : (tensor<32x16xf32, #sparse>) -> ()
    "bufferization.dealloc_tensor"(%4) : (tensor<32x16xf32, #sparse>) -> ()
    "bufferization.dealloc_tensor"(%5) : (tensor<32x16xf32, #sparse>) -> ()
    "bufferization.dealloc_tensor"(%6) : (tensor<32x16xf32, #sparse>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

