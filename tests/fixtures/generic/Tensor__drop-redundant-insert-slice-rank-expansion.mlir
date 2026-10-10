"builtin.module"() ({
  "func.func"() <{function_type = (tensor<128x480xf32>, tensor<1x1x128x480xf32>) -> tensor<123x456xf32>, sym_name = "test_drop_rank_expansion"}> ({
  ^bb0(%arg0: tensor<128x480xf32>, %arg1: tensor<1x1x128x480xf32>):
    %0 = "tensor.insert_slice"(%arg0, %arg1) <{operandSegmentSizes = array<i32: 1, 1, 0, 0, 0>, static_offsets = array<i64: 0, 0, 0, 0>, static_sizes = array<i64: 1, 1, 128, 480>, static_strides = array<i64: 1, 1, 1, 1>}> : (tensor<128x480xf32>, tensor<1x1x128x480xf32>) -> tensor<1x1x128x480xf32>
    %1 = "tensor.extract_slice"(%0) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_offsets = array<i64: 0, 0, 0, 0>, static_sizes = array<i64: 1, 1, 123, 456>, static_strides = array<i64: 1, 1, 1, 1>}> : (tensor<1x1x128x480xf32>) -> tensor<123x456xf32>
    "func.return"(%1) : (tensor<123x456xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x8x2x8xf32>, tensor<8x1x8xf32>) -> tensor<8x1x8xf32>, sym_name = "fold_casting_insert_slice_of_extract_slice"}> ({
  ^bb0(%arg0: tensor<?x8x2x8xf32>, %arg1: tensor<8x1x8xf32>):
    %0 = "tensor.extract_slice"(%arg0) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_offsets = array<i64: 0, 0, 0, 0>, static_sizes = array<i64: 1, 8, 1, 8>, static_strides = array<i64: 1, 1, 1, 1>}> : (tensor<?x8x2x8xf32>) -> tensor<8x8xf32>
    %1 = "tensor.insert_slice"(%0, %arg1) <{operandSegmentSizes = array<i32: 1, 1, 0, 0, 0>, static_offsets = array<i64: 0, 0, 0>, static_sizes = array<i64: 8, 1, 8>, static_strides = array<i64: 1, 1, 1>}> : (tensor<8x8xf32>, tensor<8x1x8xf32>) -> tensor<8x1x8xf32>
    "func.return"(%1) : (tensor<8x1x8xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x8x2x8xf32>, tensor<1x4x8xf32>) -> tensor<1x4x8xf32>, sym_name = "fold_casting_insert_slice_of_strided_extract_slice"}> ({
  ^bb0(%arg0: tensor<?x8x2x8xf32>, %arg1: tensor<1x4x8xf32>):
    %0 = "tensor.extract_slice"(%arg0) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_offsets = array<i64: 0, 0, 0, 0>, static_sizes = array<i64: 1, 4, 1, 8>, static_strides = array<i64: 1, 2, 1, 1>}> : (tensor<?x8x2x8xf32>) -> tensor<4x8xf32>
    %1 = "tensor.insert_slice"(%0, %arg1) <{operandSegmentSizes = array<i32: 1, 1, 0, 0, 0>, static_offsets = array<i64: 0, 0, 0>, static_sizes = array<i64: 1, 4, 8>, static_strides = array<i64: 1, 1, 1>}> : (tensor<4x8xf32>, tensor<1x4x8xf32>) -> tensor<1x4x8xf32>
    "func.return"(%1) : (tensor<1x4x8xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x8x8xf32>, tensor<1x1x8x8xf32>) -> tensor<1x1x8x8xf32>, sym_name = "no_fold_more_unit_dims_insert_slice_of_extract_slice"}> ({
  ^bb0(%arg0: tensor<?x8x8xf32>, %arg1: tensor<1x1x8x8xf32>):
    %0 = "tensor.extract_slice"(%arg0) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_offsets = array<i64: 0, 0, 0>, static_sizes = array<i64: 1, 8, 8>, static_strides = array<i64: 1, 1, 1>}> : (tensor<?x8x8xf32>) -> tensor<8x8xf32>
    %1 = "tensor.insert_slice"(%0, %arg1) <{operandSegmentSizes = array<i32: 1, 1, 0, 0, 0>, static_offsets = array<i64: 0, 0, 0, 0>, static_sizes = array<i64: 1, 1, 8, 8>, static_strides = array<i64: 1, 1, 1, 1>}> : (tensor<8x8xf32>, tensor<1x1x8x8xf32>) -> tensor<1x1x8x8xf32>
    "func.return"(%1) : (tensor<1x1x8x8xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x8x2x8xf32>, tensor<1x15x15xf32>) -> tensor<1x15x15xf32>, sym_name = "no_fold_strided_insert_slice_of_extract_slice"}> ({
  ^bb0(%arg0: tensor<?x8x2x8xf32>, %arg1: tensor<1x15x15xf32>):
    %0 = "tensor.extract_slice"(%arg0) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_offsets = array<i64: 0, 0, 0, 0>, static_sizes = array<i64: 1, 8, 1, 8>, static_strides = array<i64: 1, 1, 1, 1>}> : (tensor<?x8x2x8xf32>) -> tensor<8x8xf32>
    %1 = "tensor.insert_slice"(%0, %arg1) <{operandSegmentSizes = array<i32: 1, 1, 0, 0, 0>, static_offsets = array<i64: 0, 0, 0>, static_sizes = array<i64: 1, 8, 8>, static_strides = array<i64: 1, 2, 2>}> : (tensor<8x8xf32>, tensor<1x15x15xf32>) -> tensor<1x15x15xf32>
    "func.return"(%1) : (tensor<1x15x15xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1x1x1x8x8xf32>, tensor<2x8x8xf32>) -> tensor<2x8x8xf32>, sym_name = "no_fold_non_casting_insert_slice_of_extract_slice"}> ({
  ^bb0(%arg0: tensor<1x1x1x8x8xf32>, %arg1: tensor<2x8x8xf32>):
    %0 = "tensor.extract_slice"(%arg0) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_offsets = array<i64: 0, 0, 0, 0, 0>, static_sizes = array<i64: 1, 1, 1, 8, 8>, static_strides = array<i64: 1, 1, 1, 1, 1>}> : (tensor<1x1x1x8x8xf32>) -> tensor<8x8xf32>
    %1 = "tensor.insert_slice"(%0, %arg1) <{operandSegmentSizes = array<i32: 1, 1, 0, 0, 0>, static_offsets = array<i64: 0, 0, 0>, static_sizes = array<i64: 1, 8, 8>, static_strides = array<i64: 1, 1, 1>}> : (tensor<8x8xf32>, tensor<2x8x8xf32>) -> tensor<2x8x8xf32>
    "func.return"(%1) : (tensor<2x8x8xf32>) -> ()
  }) : () -> ()
}) : () -> ()

