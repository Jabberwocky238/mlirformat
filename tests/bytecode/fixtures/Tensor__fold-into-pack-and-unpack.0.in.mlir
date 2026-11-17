"builtin.module"() ({
  "func.func"() <{function_type = (tensor<28x2x1x16x16xf32>) -> tensor<28x28x10xf32>, sym_name = "fold_extract_slice_into_unpack_slicing_trailing_dim"}> ({
  ^bb0(%arg0: tensor<28x2x1x16x16xf32> loc("<stdin>":3:8)):
    %0 = "tensor.empty"() : () -> tensor<28x28x15xf32> loc("<stdin>":4:10)
    %1 = "linalg.unpack"(%arg0, %0) <{inner_dims_pos = array<i64: 1, 2>, static_inner_tiles = array<i64: 16, 16>}> {operandSegmentSizes = array<i32: 1, 1, 0, 0>} : (tensor<28x2x1x16x16xf32>, tensor<28x28x15xf32>) -> tensor<28x28x15xf32> loc("<stdin>":5:10)
    %2 = "tensor.extract_slice"(%1) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_offsets = array<i64: 0, 0, 0>, static_sizes = array<i64: 28, 28, 10>, static_strides = array<i64: 1, 1, 1>}> : (tensor<28x28x15xf32>) -> tensor<28x28x10xf32> loc("<stdin>":6:10)
    "func.return"(%2) : (tensor<28x28x10xf32>) -> () loc("<stdin>":7:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
