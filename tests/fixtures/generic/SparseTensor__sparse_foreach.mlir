#map = affine_map<(d0, d1) -> (d1, d0)>
#sparse = #sparse_tensor.encoding<{ map = (d0 : #sparse_tensor<slice(?, ?, ?)>, d1 : #sparse_tensor<slice(?, ?, ?)>) -> (d0 : compressed, d1 : compressed) }>
#sparse1 = #sparse_tensor.encoding<{ map = (d0 : #sparse_tensor<slice(0, 4, 1)>, d1 : #sparse_tensor<slice(2, 4, 1)>) -> (d0 : compressed, d1 : compressed) }>
#sparse2 = #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d0 : dense, d1 : loose_compressed(nonunique), d2 : singleton) }>
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "sparse_foreach_constant"}> ({
    %0 = "arith.constant"() <{value = sparse<[[2, 1], [1, 1], [1, 2]], [1.000000e+00, 5.000000e+00, 6.000000e+00]> : tensor<8x7xf32>}> : () -> tensor<8x7xf32>
    "sparse_tensor.foreach"(%0) <{order = #map}> ({
    ^bb0(%arg16: index, %arg17: index, %arg18: f32):
      "test.use"(%arg16, %arg17, %arg18) : (index, index, f32) -> ()
      "sparse_tensor.yield"() : () -> ()
    }) : (tensor<8x7xf32>) -> ()
    "sparse_tensor.foreach"(%0) ({
    ^bb0(%arg13: index, %arg14: index, %arg15: f32):
      "test.use"(%arg13, %arg14, %arg15) : (index, index, f32) -> ()
      "sparse_tensor.yield"() : () -> ()
    }) : (tensor<8x7xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<?x?xf64, #sparse>) -> (), sym_name = "foreach_print_slice_dyn"}> ({
  ^bb0(%arg9: tensor<?x?xf64, #sparse>):
    "sparse_tensor.foreach"(%arg9) ({
    ^bb0(%arg10: index, %arg11: index, %arg12: f64):
      "test.use"(%arg12) : (f64) -> ()
      "sparse_tensor.yield"() : () -> ()
    }) : (tensor<?x?xf64, #sparse>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<4x4xf64, #sparse1>) -> (), sym_name = "foreach_print_slice"}> ({
  ^bb0(%arg5: tensor<4x4xf64, #sparse1>):
    "sparse_tensor.foreach"(%arg5) ({
    ^bb0(%arg6: index, %arg7: index, %arg8: f64):
      "test.use"(%arg8) : (f64) -> ()
      "sparse_tensor.yield"() : () -> ()
    }) : (tensor<4x4xf64, #sparse1>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<4x4x4xf64, #sparse2>) -> (), sym_name = "foreach_bcoo"}> ({
  ^bb0(%arg0: tensor<4x4x4xf64, #sparse2>):
    "sparse_tensor.foreach"(%arg0) ({
    ^bb0(%arg1: index, %arg2: index, %arg3: index, %arg4: f64):
      "test.use"(%arg4) : (f64) -> ()
      "sparse_tensor.yield"() : () -> ()
    }) : (tensor<4x4x4xf64, #sparse2>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

