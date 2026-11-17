"builtin.module"() ({
  "func.func"() <{function_type = (tensor<256xf32>) -> tensor<8x32xf32>, sym_name = "single_dim_packing"}> ({
  ^bb0(%arg0: tensor<256xf32> loc("<stdin>":3:8)):
    %0 = "tensor.empty"() : () -> tensor<8x32xf32> loc("<stdin>":4:10)
    %1 = "linalg.pack"(%arg0, %0) <{inner_dims_pos = array<i64: 0>, operandSegmentSizes = array<i32: 1, 1, 0, 0>, static_inner_tiles = array<i64: 32>}> : (tensor<256xf32>, tensor<8x32xf32>) -> tensor<8x32xf32> loc("<stdin>":5:10)
    "func.return"(%1) : (tensor<8x32xf32>) -> () loc("<stdin>":6:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
