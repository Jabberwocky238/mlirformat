"builtin.module"() ({
  "func.func"() <{function_type = (tensor<3x3x3xf32>, tensor<1x1x3xf32>) -> tensor<1x1x3xf32>, sym_name = "vectorize_nd_tensor_extract_transfer_read_basic"}> ({
  ^bb0(%arg0: tensor<3x3x3xf32> loc("<stdin>":4:8), %arg1: tensor<1x1x3xf32> loc("<stdin>":4:34)):
    %0 = "linalg.generic"(%arg1) <{indexing_maps = [affine_map<(d0, d1, d2) -> (d0, d1, d2)>], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 0, 1>}> ({
    ^bb0(%arg2: f32 loc("<stdin>":6:10)):
      %1 = "linalg.index"() <{dim = 0 : i64}> : () -> index loc("<stdin>":7:12)
      %2 = "linalg.index"() <{dim = 1 : i64}> : () -> index loc("<stdin>":8:12)
      %3 = "linalg.index"() <{dim = 2 : i64}> : () -> index loc("<stdin>":9:12)
      %4 = "tensor.extract"(%arg0, %1, %2, %3) : (tensor<3x3x3xf32>, index, index, index) -> f32 loc("<stdin>":10:12)
      "linalg.yield"(%4) : (f32) -> () loc("<stdin>":11:7)
    }) : (tensor<1x1x3xf32>) -> tensor<1x1x3xf32> loc("<stdin>":5:10)
    "func.return"(%0) : (tensor<1x1x3xf32>) -> () loc("<stdin>":13:5)
  }) : () -> () loc("<stdin>":3:3)
}) : () -> () loc("<stdin>":2:1)
