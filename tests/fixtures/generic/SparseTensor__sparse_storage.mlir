#map = affine_map<(d0) -> (d0)>
#sparse = #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed), posWidth = 64, crdWidth = 64 }>
#sparse1 = #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed), posWidth = 32, crdWidth = 32 }>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<32xf64, #sparse>, tensor<32xf64>, tensor<32xf64>) -> tensor<32xf64>, sym_name = "mul64"}> ({
  ^bb0(%arg6: tensor<32xf64, #sparse>, %arg7: tensor<32xf64>, %arg8: tensor<32xf64>):
    %2 = "linalg.generic"(%arg6, %arg7, %arg8) <{doc = "x(i) = a(i) * b(i)", indexing_maps = [#map, #map, #map], iterator_types = [#linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg9: f64, %arg10: f64, %arg11: f64):
      %3 = "arith.mulf"(%arg9, %arg10) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64
      "linalg.yield"(%3) : (f64) -> ()
    }) : (tensor<32xf64, #sparse>, tensor<32xf64>, tensor<32xf64>) -> tensor<32xf64>
    "func.return"(%2) : (tensor<32xf64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<32xf64, #sparse1>, tensor<32xf64>, tensor<32xf64>) -> tensor<32xf64>, sym_name = "mul32"}> ({
  ^bb0(%arg0: tensor<32xf64, #sparse1>, %arg1: tensor<32xf64>, %arg2: tensor<32xf64>):
    %0 = "linalg.generic"(%arg0, %arg1, %arg2) <{doc = "x(i) = a(i) * b(i)", indexing_maps = [#map, #map, #map], iterator_types = [#linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg3: f64, %arg4: f64, %arg5: f64):
      %1 = "arith.mulf"(%arg3, %arg4) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64
      "linalg.yield"(%1) : (f64) -> ()
    }) : (tensor<32xf64, #sparse1>, tensor<32xf64>, tensor<32xf64>) -> tensor<32xf64>
    "func.return"(%0) : (tensor<32xf64>) -> ()
  }) : () -> ()
}) : () -> ()

