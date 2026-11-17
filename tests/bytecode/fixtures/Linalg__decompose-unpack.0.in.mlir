"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1x1x1x1x8x32xf32>, tensor<1x1x32x8xf32>) -> tensor<1x1x32x8xf32>, sym_name = "simple_KCRSsr_to_KCRS"}> ({
  ^bb0(%arg0: tensor<1x1x1x1x8x32xf32> loc("<stdin>":3:8), %arg1: tensor<1x1x32x8xf32> loc("<stdin>":3:41)):
    %0 = "linalg.unpack"(%arg0, %arg1) <{inner_dims_pos = array<i64: 3, 2>, static_inner_tiles = array<i64: 8, 32>}> {operandSegmentSizes = array<i32: 1, 1, 0, 0>} : (tensor<1x1x1x1x8x32xf32>, tensor<1x1x32x8xf32>) -> tensor<1x1x32x8xf32> loc("<stdin>":4:10)
    "func.return"(%0) : (tensor<1x1x32x8xf32>) -> () loc("<stdin>":5:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
