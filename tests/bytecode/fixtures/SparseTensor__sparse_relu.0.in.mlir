"builtin.module"() ({
  "func.func"() <{function_type = (tensor<10x20x30xf64, #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d0 : dense, d1 : dense, d2 : compressed) }>>) -> tensor<10x20x30xf64, #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d0 : dense, d1 : dense, d2 : compressed) }>>, sym_name = "relu"}> ({
  ^bb0(%arg0: tensor<10x20x30xf64, #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d0 : dense, d1 : dense, d2 : compressed) }>> loc("<stdin>":5:8)):
    %0 = "arith.constant"() <{value = 0.000000e+00 : f64}> : () -> f64 loc("<stdin>":6:10)
    %1 = "tensor.empty"() : () -> tensor<10x20x30xf64> loc("<stdin>":7:10)
    %2 = "linalg.generic"(%arg0, %1) <{indexing_maps = [affine_map<(d0, d1, d2) -> (d0, d1, d2)>, affine_map<(d0, d1, d2) -> (d0, d1, d2)>], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg1: f64 loc("<stdin>":9:10), %arg2: f64 loc("<stdin>":9:22)):
      %4 = "arith.cmpf"(%arg1, %0) <{fastmath = #arith.fastmath<none>, predicate = 9 : i64}> : (f64, f64) -> i1 loc("<stdin>":10:12)
      %5 = "arith.select"(%4, %arg1, %0) : (i1, f64, f64) -> f64 loc("<stdin>":11:12)
      "linalg.yield"(%5) : (f64) -> () loc("<stdin>":12:7)
    }) : (tensor<10x20x30xf64, #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d0 : dense, d1 : dense, d2 : compressed) }>>, tensor<10x20x30xf64>) -> tensor<10x20x30xf64> loc("<stdin>":8:10)
    %3 = "tensor.cast"(%2) : (tensor<10x20x30xf64>) -> tensor<10x20x30xf64, #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d0 : dense, d1 : dense, d2 : compressed) }>> loc("<stdin>":14:10)
    "func.return"(%3) : (tensor<10x20x30xf64, #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d0 : dense, d1 : dense, d2 : compressed) }>>) -> () loc("<stdin>":15:5)
  }) : () -> () loc("<stdin>":4:3)
}) : () -> () loc("<stdin>":3:1)
