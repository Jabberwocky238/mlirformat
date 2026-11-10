"builtin.module"() ({
  "func.func"() <{function_type = (tensor<2x1xf32>) -> tensor<1x1xf32>, sym_name = "slice_constant"}> ({
  ^bb0(%arg0: tensor<2x1xf32>):
    %0 = "arith.constant"() <{value = dense<[[1.000000e+01], [1.100000e+01]]> : tensor<2x1xf32>}> : () -> tensor<2x1xf32>
    %1 = "tensor.extract_slice"(%0) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_offsets = array<i64: 0, 0>, static_sizes = array<i64: 1, 1>, static_strides = array<i64: 1, 1>}> : (tensor<2x1xf32>) -> tensor<1x1xf32>
    "func.return"(%1) : (tensor<1x1xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<3x4xf32>) -> tensor<2x2xf32>, sym_name = "slice_constant_3x4"}> ({
  ^bb0(%arg0: tensor<3x4xf32>):
    %0 = "arith.constant"() <{value = dense<[[1.000000e+01, 9.000000e+00, 8.000000e+00, 7.000000e+00], [1.100000e+01, 1.200000e+01, 1.300000e+01, 1.400000e+01], [1.000000e+00, 3.000000e+00, 5.000000e+00, 7.000000e+00]]> : tensor<3x4xf32>}> : () -> tensor<3x4xf32>
    %1 = "tensor.extract_slice"(%0) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_offsets = array<i64: 0, 0>, static_sizes = array<i64: 2, 2>, static_strides = array<i64: 1, 1>}> : (tensor<3x4xf32>) -> tensor<2x2xf32>
    "func.return"(%1) : (tensor<2x2xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<3x4xf32>) -> tensor<2x2xf32>, sym_name = "slice_constant_3x4_offsets"}> ({
  ^bb0(%arg0: tensor<3x4xf32>):
    %0 = "arith.constant"() <{value = dense<[[1.000000e+01, 9.000000e+00, 8.000000e+00, 7.000000e+00], [1.100000e+01, 1.200000e+01, 1.300000e+01, 1.400000e+01], [1.000000e+00, 3.000000e+00, 5.000000e+00, 7.000000e+00]]> : tensor<3x4xf32>}> : () -> tensor<3x4xf32>
    %1 = "tensor.extract_slice"(%0) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_offsets = array<i64: 1, 1>, static_sizes = array<i64: 2, 2>, static_strides = array<i64: 1, 1>}> : (tensor<3x4xf32>) -> tensor<2x2xf32>
    "func.return"(%1) : (tensor<2x2xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> tensor<2x!test.dense_element>, sym_name = "slice_constant_dense_element_type"}> ({
    %0 = "arith.constant"() <{value = dense<tensor<4x!test.dense_element> : [10 : i32, 9 : i32, 8 : i32, 7 : i32]>}> : () -> tensor<4x!test.dense_element>
    %1 = "tensor.extract_slice"(%0) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_offsets = array<i64: 1>, static_sizes = array<i64: 2>, static_strides = array<i64: 1>}> : (tensor<4x!test.dense_element>) -> tensor<2x!test.dense_element>
    "func.return"(%1) : (tensor<2x!test.dense_element>) -> ()
  }) : () -> ()
}) : () -> ()

