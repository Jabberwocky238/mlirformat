#map = affine_map<(d0, d1, d2) -> (d0, d1, d2)>
#sparse = #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d0 : dense, d1 : dense, d2 : compressed) }>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<10x20x30xf64, #sparse>) -> tensor<10x20x30xf64, #sparse>, sym_name = "relu"}> ({
  ^bb0(%arg0: tensor<10x20x30xf64, #sparse>):
    %0 = "arith.constant"() <{value = 0.000000e+00 : f64}> : () -> f64
    %1 = "tensor.empty"() : () -> tensor<10x20x30xf64>
    %2 = "linalg.generic"(%arg0, %1) <{indexing_maps = [#map, #map], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg1: f64, %arg2: f64):
      %4 = "arith.cmpf"(%arg1, %0) <{fastmath = #arith.fastmath<none>, predicate = 9 : i64}> : (f64, f64) -> i1
      %5 = "arith.select"(%4, %arg1, %0) : (i1, f64, f64) -> f64
      "linalg.yield"(%5) : (f64) -> ()
    }) : (tensor<10x20x30xf64, #sparse>, tensor<10x20x30xf64>) -> tensor<10x20x30xf64>
    %3 = "tensor.cast"(%2) : (tensor<10x20x30xf64>) -> tensor<10x20x30xf64, #sparse>
    "func.return"(%3) : (tensor<10x20x30xf64, #sparse>) -> ()
  }) : () -> ()
}) : () -> ()

