"builtin.module"() ({
  "func.func"() <{function_type = (tensor<128x32x32x1xf32>, tensor<128x32x32x1xf32>, tensor<128x32x32x1xf32>) -> tensor<128x32x32x1xf32, #sparse_tensor.encoding<{ map = (d0, d1, d2, d3) -> (d0 : compressed, d1 : compressed, d2 : compressed, d3 : dense) }>>, sym_name = "fold_convert"}> ({
  ^bb0(%arg13: tensor<128x32x32x1xf32> loc("<stdin>":7:8), %arg14: tensor<128x32x32x1xf32> loc("<stdin>":7:41), %arg15: tensor<128x32x32x1xf32> loc("<stdin>":7:74)):
    %15 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32 loc("<stdin>":8:11)
    %16 = "arith.constant"() <{value = 1.000000e+00 : f32}> : () -> f32 loc("<stdin>":9:11)
    %17 = "arith.constant"() <{value = 1.000000e+00 : f32}> : () -> f32 loc("<stdin>":10:11)
    %18 = "tensor.empty"() : () -> tensor<128x32x32x1xf32> loc("<stdin>":11:11)
    %19 = "linalg.generic"(%arg13, %arg14, %arg15, %18) <{indexing_maps = [affine_map<(d0, d1, d2, d3) -> (d0, d1, d2, d3)>, affine_map<(d0, d1, d2, d3) -> (d0, d1, d2, d3)>, affine_map<(d0, d1, d2, d3) -> (d0, d1, d2, d3)>, affine_map<(d0, d1, d2, d3) -> (d0, d1, d2, d3)>], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 3, 1>}> ({
    ^bb0(%arg16: f32 loc("<stdin>":13:10), %arg17: f32 loc("<stdin>":13:23), %arg18: f32 loc("<stdin>":13:36), %arg19: f32 loc("<stdin>":13:49)):
      %21 = "arith.subf"(%16, %arg17) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":14:13)
      %22 = "arith.mulf"(%arg16, %21) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":15:13)
      %23 = "arith.mulf"(%22, %17) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":16:13)
      %24 = "arith.addf"(%23, %arg18) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":17:13)
      %25 = "arith.subf"(%24, %16) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":18:13)
      %26 = "arith.cmpf"(%25, %15) <{fastmath = #arith.fastmath<none>, predicate = 10 : i64}> : (f32, f32) -> i1 loc("<stdin>":19:13)
      %27 = "arith.uitofp"(%26) : (i1) -> f32 loc("<stdin>":20:13)
      "linalg.yield"(%27) : (f32) -> () loc("<stdin>":21:7)
    }) : (tensor<128x32x32x1xf32>, tensor<128x32x32x1xf32>, tensor<128x32x32x1xf32>, tensor<128x32x32x1xf32>) -> tensor<128x32x32x1xf32> loc("<stdin>":12:11)
    %20 = "sparse_tensor.convert"(%19) : (tensor<128x32x32x1xf32>) -> tensor<128x32x32x1xf32, #sparse_tensor.encoding<{ map = (d0, d1, d2, d3) -> (d0 : compressed, d1 : compressed, d2 : compressed, d3 : dense) }>> loc("<stdin>":23:11)
    "func.return"(%20) : (tensor<128x32x32x1xf32, #sparse_tensor.encoding<{ map = (d0, d1, d2, d3) -> (d0 : compressed, d1 : compressed, d2 : compressed, d3 : dense) }>>) -> () loc("<stdin>":24:5)
  }) : () -> () loc("<stdin>":6:3)
  "func.func"() <{function_type = (tensor<128x32x32x1xf32>, tensor<128x32x32x1xf32>, tensor<128x32x32x1xf32>, tensor<128x32x32x1xf32>) -> (tensor<128x32x32x1xf32>, tensor<128x32x32x1xf32, #sparse_tensor.encoding<{ map = (d0, d1, d2, d3) -> (d0 : compressed, d1 : compressed, d2 : compressed, d3 : dense) }>>), sym_name = "fold_convert_multi_use"}> ({
  ^bb0(%arg3: tensor<128x32x32x1xf32> loc("<stdin>":27:8), %arg4: tensor<128x32x32x1xf32> loc("<stdin>":27:40), %arg5: tensor<128x32x32x1xf32> loc("<stdin>":27:72), %arg6: tensor<128x32x32x1xf32> loc("<stdin>":27:104)):
    %6 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32 loc("<stdin>":28:10)
    %7 = "arith.constant"() <{value = 1.000000e+00 : f32}> : () -> f32 loc("<stdin>":29:10)
    %8 = "arith.constant"() <{value = 1.000000e+00 : f32}> : () -> f32 loc("<stdin>":30:10)
    %9 = "tensor.empty"() : () -> tensor<128x32x32x1xf32> loc("<stdin>":31:10)
    %10 = "linalg.generic"(%arg3, %arg4, %9) <{indexing_maps = [affine_map<(d0, d1, d2, d3) -> (d0, d1, d2, d3)>, affine_map<(d0, d1, d2, d3) -> (d0, d1, d2, d3)>, affine_map<(d0, d1, d2, d3) -> (d0, d1, d2, d3)>], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg10: f32 loc("<stdin>":33:10), %arg11: f32 loc("<stdin>":33:23), %arg12: f32 loc("<stdin>":33:36)):
      %14 = "arith.mulf"(%arg10, %arg11) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":34:13)
      "linalg.yield"(%14) : (f32) -> () loc("<stdin>":35:7)
    }) : (tensor<128x32x32x1xf32>, tensor<128x32x32x1xf32>, tensor<128x32x32x1xf32>) -> tensor<128x32x32x1xf32> loc("<stdin>":32:11)
    %11 = "linalg.generic"(%arg5, %arg6, %9) <{indexing_maps = [affine_map<(d0, d1, d2, d3) -> (d0, d1, d2, d3)>, affine_map<(d0, d1, d2, d3) -> (d0, d1, d2, d3)>, affine_map<(d0, d1, d2, d3) -> (d0, d1, d2, d3)>], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg7: f32 loc("<stdin>":38:10), %arg8: f32 loc("<stdin>":38:22), %arg9: f32 loc("<stdin>":38:34)):
      %13 = "arith.mulf"(%arg7, %arg8) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":39:13)
      "linalg.yield"(%13) : (f32) -> () loc("<stdin>":40:7)
    }) : (tensor<128x32x32x1xf32>, tensor<128x32x32x1xf32>, tensor<128x32x32x1xf32>) -> tensor<128x32x32x1xf32> loc("<stdin>":37:11)
    %12 = "sparse_tensor.convert"(%11) : (tensor<128x32x32x1xf32>) -> tensor<128x32x32x1xf32, #sparse_tensor.encoding<{ map = (d0, d1, d2, d3) -> (d0 : compressed, d1 : compressed, d2 : compressed, d3 : dense) }>> loc("<stdin>":42:11)
    "func.return"(%10, %12) : (tensor<128x32x32x1xf32>, tensor<128x32x32x1xf32, #sparse_tensor.encoding<{ map = (d0, d1, d2, d3) -> (d0 : compressed, d1 : compressed, d2 : compressed, d3 : dense) }>>) -> () loc("<stdin>":43:5)
  }) : () -> () loc("<stdin>":26:3)
  "func.func"() <{function_type = (tensor<10x20x30xf64, #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d0 : compressed(nonunique), d1 : singleton(nonunique, soa), d2 : singleton(soa)) }>>) -> tensor<10x20x30xf64, #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d0 : compressed(nonunique), d1 : singleton(nonunique, soa), d2 : singleton(soa)) }>>, sym_name = "fold_cast"}> ({
  ^bb0(%arg0: tensor<10x20x30xf64, #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d0 : compressed(nonunique), d1 : singleton(nonunique, soa), d2 : singleton(soa)) }>> loc("<stdin>":46:8)):
    %0 = "arith.constant"() <{value = 0.000000e+00 : f64}> : () -> f64 loc("<stdin>":47:10)
    %1 = "tensor.empty"() : () -> tensor<10x20x30xf64> loc("<stdin>":48:10)
    %2 = "linalg.generic"(%arg0, %1) <{indexing_maps = [affine_map<(d0, d1, d2) -> (d0, d1, d2)>, affine_map<(d0, d1, d2) -> (d0, d1, d2)>], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg1: f64 loc("<stdin>":50:10), %arg2: f64 loc("<stdin>":50:22)):
      %4 = "arith.cmpf"(%arg1, %0) <{fastmath = #arith.fastmath<none>, predicate = 9 : i64}> : (f64, f64) -> i1 loc("<stdin>":51:12)
      %5 = "arith.select"(%4, %arg1, %0) : (i1, f64, f64) -> f64 loc("<stdin>":52:12)
      "linalg.yield"(%5) : (f64) -> () loc("<stdin>":53:7)
    }) : (tensor<10x20x30xf64, #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d0 : compressed(nonunique), d1 : singleton(nonunique, soa), d2 : singleton(soa)) }>>, tensor<10x20x30xf64>) -> tensor<10x20x30xf64> loc("<stdin>":49:10)
    %3 = "tensor.cast"(%2) : (tensor<10x20x30xf64>) -> tensor<10x20x30xf64, #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d0 : compressed(nonunique), d1 : singleton(nonunique, soa), d2 : singleton(soa)) }>> loc("<stdin>":55:10)
    "func.return"(%3) : (tensor<10x20x30xf64, #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d0 : compressed(nonunique), d1 : singleton(nonunique, soa), d2 : singleton(soa)) }>>) -> () loc("<stdin>":56:5)
  }) : () -> () loc("<stdin>":45:3)
}) : () -> () loc("<stdin>":5:1)
