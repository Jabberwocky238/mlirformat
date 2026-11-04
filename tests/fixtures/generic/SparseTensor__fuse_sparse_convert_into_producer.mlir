#map = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2, d3)>
#map1 = affine_map<(d0, d1, d2) -> (d0, d1, d2)>
#sparse = #sparse_tensor.encoding<{ map = (d0, d1, d2, d3) -> (d0 : compressed, d1 : compressed, d2 : compressed, d3 : dense) }>
#sparse1 = #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d0 : compressed(nonunique), d1 : singleton(nonunique, soa), d2 : singleton(soa)) }>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<128x32x32x1xf32>, tensor<128x32x32x1xf32>, tensor<128x32x32x1xf32>) -> tensor<128x32x32x1xf32, #sparse>, sym_name = "fold_convert"}> ({
  ^bb0(%arg13: tensor<128x32x32x1xf32>, %arg14: tensor<128x32x32x1xf32>, %arg15: tensor<128x32x32x1xf32>):
    %15 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %16 = "arith.constant"() <{value = 1.000000e+00 : f32}> : () -> f32
    %17 = "arith.constant"() <{value = 1.000000e+00 : f32}> : () -> f32
    %18 = "tensor.empty"() : () -> tensor<128x32x32x1xf32>
    %19 = "linalg.generic"(%arg13, %arg14, %arg15, %18) <{indexing_maps = [#map, #map, #map, #map], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 3, 1>}> ({
    ^bb0(%arg16: f32, %arg17: f32, %arg18: f32, %arg19: f32):
      %21 = "arith.subf"(%16, %arg17) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %22 = "arith.mulf"(%arg16, %21) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %23 = "arith.mulf"(%22, %17) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %24 = "arith.addf"(%23, %arg18) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %25 = "arith.subf"(%24, %16) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %26 = "arith.cmpf"(%25, %15) <{fastmath = #arith.fastmath<none>, predicate = 10 : i64}> : (f32, f32) -> i1
      %27 = "arith.uitofp"(%26) : (i1) -> f32
      "linalg.yield"(%27) : (f32) -> ()
    }) : (tensor<128x32x32x1xf32>, tensor<128x32x32x1xf32>, tensor<128x32x32x1xf32>, tensor<128x32x32x1xf32>) -> tensor<128x32x32x1xf32>
    %20 = "sparse_tensor.convert"(%19) : (tensor<128x32x32x1xf32>) -> tensor<128x32x32x1xf32, #sparse>
    "func.return"(%20) : (tensor<128x32x32x1xf32, #sparse>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<128x32x32x1xf32>, tensor<128x32x32x1xf32>, tensor<128x32x32x1xf32>, tensor<128x32x32x1xf32>) -> (tensor<128x32x32x1xf32>, tensor<128x32x32x1xf32, #sparse>), sym_name = "fold_convert_multi_use"}> ({
  ^bb0(%arg3: tensor<128x32x32x1xf32>, %arg4: tensor<128x32x32x1xf32>, %arg5: tensor<128x32x32x1xf32>, %arg6: tensor<128x32x32x1xf32>):
    %6 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %7 = "arith.constant"() <{value = 1.000000e+00 : f32}> : () -> f32
    %8 = "arith.constant"() <{value = 1.000000e+00 : f32}> : () -> f32
    %9 = "tensor.empty"() : () -> tensor<128x32x32x1xf32>
    %10 = "linalg.generic"(%arg3, %arg4, %9) <{indexing_maps = [#map, #map, #map], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg10: f32, %arg11: f32, %arg12: f32):
      %14 = "arith.mulf"(%arg10, %arg11) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%14) : (f32) -> ()
    }) : (tensor<128x32x32x1xf32>, tensor<128x32x32x1xf32>, tensor<128x32x32x1xf32>) -> tensor<128x32x32x1xf32>
    %11 = "linalg.generic"(%arg5, %arg6, %9) <{indexing_maps = [#map, #map, #map], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg7: f32, %arg8: f32, %arg9: f32):
      %13 = "arith.mulf"(%arg7, %arg8) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%13) : (f32) -> ()
    }) : (tensor<128x32x32x1xf32>, tensor<128x32x32x1xf32>, tensor<128x32x32x1xf32>) -> tensor<128x32x32x1xf32>
    %12 = "sparse_tensor.convert"(%11) : (tensor<128x32x32x1xf32>) -> tensor<128x32x32x1xf32, #sparse>
    "func.return"(%10, %12) : (tensor<128x32x32x1xf32>, tensor<128x32x32x1xf32, #sparse>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<10x20x30xf64, #sparse1>) -> tensor<10x20x30xf64, #sparse1>, sym_name = "fold_cast"}> ({
  ^bb0(%arg0: tensor<10x20x30xf64, #sparse1>):
    %0 = "arith.constant"() <{value = 0.000000e+00 : f64}> : () -> f64
    %1 = "tensor.empty"() : () -> tensor<10x20x30xf64>
    %2 = "linalg.generic"(%arg0, %1) <{indexing_maps = [#map1, #map1], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg1: f64, %arg2: f64):
      %4 = "arith.cmpf"(%arg1, %0) <{fastmath = #arith.fastmath<none>, predicate = 9 : i64}> : (f64, f64) -> i1
      %5 = "arith.select"(%4, %arg1, %0) : (i1, f64, f64) -> f64
      "linalg.yield"(%5) : (f64) -> ()
    }) : (tensor<10x20x30xf64, #sparse1>, tensor<10x20x30xf64>) -> tensor<10x20x30xf64>
    %3 = "tensor.cast"(%2) : (tensor<10x20x30xf64>) -> tensor<10x20x30xf64, #sparse1>
    "func.return"(%3) : (tensor<10x20x30xf64, #sparse1>) -> ()
  }) : () -> ()
}) : () -> ()

