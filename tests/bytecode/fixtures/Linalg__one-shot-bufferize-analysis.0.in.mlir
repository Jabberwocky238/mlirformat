"builtin.module"() ({
  "func.func"() <{function_type = (tensor<5x6xf32>) -> tensor<5x6xf32>, sym_name = "not_elementwise"}> ({
  ^bb0(%arg0: tensor<5x6xf32> loc("<stdin>":5:8)):
    %0 = "arith.constant"() <{value = 5.000000e+00 : f32}> : () -> f32 loc("<stdin>":6:10)
    %1 = "tensor.extract_slice"(%arg0) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_offsets = array<i64: 0, 0>, static_sizes = array<i64: 1, 6>, static_strides = array<i64: 1, 1>}> : (tensor<5x6xf32>) -> tensor<6xf32> loc("<stdin>":7:10)
    %2 = "linalg.generic"(%1, %arg0) <{indexing_maps = [affine_map<(d0, d1) -> (d1)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg1: f32 loc("<stdin>":9:10), %arg2: f32 loc("<stdin>":9:22)):
      %3 = "arith.addf"(%arg1, %arg2) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":10:12)
      "linalg.yield"(%3) : (f32) -> () loc("<stdin>":11:7)
    }) : (tensor<6xf32>, tensor<5x6xf32>) -> tensor<5x6xf32> loc("<stdin>":8:10)
    "func.return"(%2) : (tensor<5x6xf32>) -> () loc("<stdin>":13:5)
  }) : () -> () loc("<stdin>":4:3)
}) : () -> () loc("<stdin>":3:1)
