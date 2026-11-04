#map = affine_map<(d0, d1) -> (d0, d1)>
#map1 = affine_map<(d0, d1) -> (d0)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d2)>
#map3 = affine_map<(d0, d1, d2) -> (d2, d1)>
#map4 = affine_map<(d0, d1, d2) -> (d0, d1)>
#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d1 : compressed, d0 : compressed) }>
#sparse1 = #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>
#sparse2 = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>
#sparse3 = #sparse_tensor.encoding<{ map = (d0, d1) -> (d1 : dense, d0 : compressed) }>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?xf64, #sparse>) -> tensor<?xf64, #sparse1>, sym_name = "kernel"}> ({
  ^bb0(%arg10: tensor<?x?xf64, #sparse>):
    %8 = "arith.constant"() <{value = 0 : index}> : () -> index
    %9 = "tensor.dim"(%arg10, %8) : (tensor<?x?xf64, #sparse>, index) -> index
    %10 = "tensor.empty"(%9) : (index) -> tensor<?xf64, #sparse1>
    %11 = "linalg.generic"(%arg10, %10) <{doc = "X(i) = SUM A(i,j)", indexing_maps = [#map, #map1], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<reduction>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg11: f64, %arg12: f64):
      %12 = "arith.addf"(%arg12, %arg11) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64
      "linalg.yield"(%12) : (f64) -> ()
    }) : (tensor<?x?xf64, #sparse>, tensor<?xf64, #sparse1>) -> tensor<?xf64, #sparse1>
    "func.return"(%11) : (tensor<?xf64, #sparse1>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<8x2xf64, #sparse2>, tensor<2x4xf64, #sparse2>) -> tensor<8x4xf64, #sparse2>, sym_name = "matmul1"}> ({
  ^bb0(%arg5: tensor<8x2xf64, #sparse2>, %arg6: tensor<2x4xf64, #sparse2>):
    %4 = "tensor.empty"() : () -> tensor<8x4xf64, #sparse2>
    %5 = "linalg.matmul"(%arg5, %arg6, %4) <{indexing_maps = [#map2, #map3, #map4], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg7: f64, %arg8: f64, %arg9: f64):
      %6 = "arith.mulf"(%arg7, %arg8) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64
      %7 = "arith.addf"(%arg9, %6) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64
      "linalg.yield"(%7) : (f64) -> ()
    }) : (tensor<8x2xf64, #sparse2>, tensor<2x4xf64, #sparse2>, tensor<8x4xf64, #sparse2>) -> tensor<8x4xf64, #sparse2>
    "func.return"(%5) : (tensor<8x4xf64, #sparse2>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<8x2xf64, #sparse3>, tensor<2x4xf64, #sparse3>) -> tensor<8x4xf64, #sparse3>, sym_name = "matmul2"}> ({
  ^bb0(%arg0: tensor<8x2xf64, #sparse3>, %arg1: tensor<2x4xf64, #sparse3>):
    %0 = "tensor.empty"() : () -> tensor<8x4xf64, #sparse3>
    %1 = "linalg.matmul"(%arg0, %arg1, %0) <{indexing_maps = [#map2, #map3, #map4], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg2: f64, %arg3: f64, %arg4: f64):
      %2 = "arith.mulf"(%arg2, %arg3) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64
      %3 = "arith.addf"(%arg4, %2) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64
      "linalg.yield"(%3) : (f64) -> ()
    }) : (tensor<8x2xf64, #sparse3>, tensor<2x4xf64, #sparse3>, tensor<8x4xf64, #sparse3>) -> tensor<8x4xf64, #sparse3>
    "func.return"(%1) : (tensor<8x4xf64, #sparse3>) -> ()
  }) : () -> ()
}) : () -> ()

