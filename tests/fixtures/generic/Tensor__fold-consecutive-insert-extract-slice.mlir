"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?x?x?xf32>, index, index, index, index) -> tensor<8x16x32x?xf32>, sym_name = "extract_slice_same_rank"}> ({
  ^bb0(%arg0: tensor<?x?x?x?xf32>, %arg1: index, %arg2: index, %arg3: index, %arg4: index):
    %0 = "tensor.extract_slice"(%arg0, %arg1, %arg3) <{operandSegmentSizes = array<i32: 1, 1, 1, 0>, static_offsets = array<i64: 0, 1, 2, -9223372036854775808>, static_sizes = array<i64: 128, 128, 128, -9223372036854775808>, static_strides = array<i64: 1, 1, 1, 1>}> : (tensor<?x?x?x?xf32>, index, index) -> tensor<128x128x128x?xf32>
    %1 = "tensor.extract_slice"(%0, %arg2, %arg4) <{operandSegmentSizes = array<i32: 1, 1, 1, 0>, static_offsets = array<i64: 7, 8, 9, -9223372036854775808>, static_sizes = array<i64: 8, 16, 32, -9223372036854775808>, static_strides = array<i64: 1, 1, 1, 1>}> : (tensor<128x128x128x?xf32>, index, index) -> tensor<8x16x32x?xf32>
    "func.return"(%1) : (tensor<8x16x32x?xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?x?x?xf32>, index, index, index, index) -> tensor<16x?xf32>, sym_name = "extract_slice_rank_reducing_consumer"}> ({
  ^bb0(%arg0: tensor<?x?x?x?xf32>, %arg1: index, %arg2: index, %arg3: index, %arg4: index):
    %0 = "tensor.extract_slice"(%arg0, %arg1, %arg3) <{operandSegmentSizes = array<i32: 1, 1, 1, 0>, static_offsets = array<i64: 0, 1, 2, -9223372036854775808>, static_sizes = array<i64: 128, 128, 128, -9223372036854775808>, static_strides = array<i64: 1, 1, 1, 1>}> : (tensor<?x?x?x?xf32>, index, index) -> tensor<128x128x128x?xf32>
    %1 = "tensor.extract_slice"(%0, %arg2, %arg4) <{operandSegmentSizes = array<i32: 1, 1, 1, 0>, static_offsets = array<i64: 7, 8, 9, -9223372036854775808>, static_sizes = array<i64: 1, 16, 1, -9223372036854775808>, static_strides = array<i64: 1, 1, 1, 1>}> : (tensor<128x128x128x?xf32>, index, index) -> tensor<16x?xf32>
    "func.return"(%1) : (tensor<16x?xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?x?x?xf32>, index, index, index, index) -> tensor<8x?xf32>, sym_name = "extract_slice_rank_reducing_producer"}> ({
  ^bb0(%arg0: tensor<?x?x?x?xf32>, %arg1: index, %arg2: index, %arg3: index, %arg4: index):
    %0 = "tensor.extract_slice"(%arg0, %arg1, %arg3) <{operandSegmentSizes = array<i32: 1, 1, 1, 0>, static_offsets = array<i64: 0, 1, 2, -9223372036854775808>, static_sizes = array<i64: 1, 128, 1, -9223372036854775808>, static_strides = array<i64: 1, 1, 1, 1>}> : (tensor<?x?x?x?xf32>, index, index) -> tensor<128x?xf32>
    %1 = "tensor.extract_slice"(%0, %arg2, %arg4) <{operandSegmentSizes = array<i32: 1, 1, 1, 0>, static_offsets = array<i64: 7, -9223372036854775808>, static_sizes = array<i64: 8, -9223372036854775808>, static_strides = array<i64: 1, 1>}> : (tensor<128x?xf32>, index, index) -> tensor<8x?xf32>
    "func.return"(%1) : (tensor<8x?xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?xf32>, index, index, index, index, index, index) -> tensor<?xf32>, sym_name = "extract_slice_non_one_stride"}> ({
  ^bb0(%arg0: tensor<?xf32>, %arg1: index, %arg2: index, %arg3: index, %arg4: index, %arg5: index, %arg6: index):
    %0 = "tensor.extract_slice"(%arg0, %arg1, %arg3, %arg5) <{operandSegmentSizes = array<i32: 1, 1, 1, 1>, static_offsets = array<i64: -9223372036854775808>, static_sizes = array<i64: -9223372036854775808>, static_strides = array<i64: -9223372036854775808>}> : (tensor<?xf32>, index, index, index) -> tensor<?xf32>
    %1 = "tensor.extract_slice"(%0, %arg2, %arg4, %arg6) <{operandSegmentSizes = array<i32: 1, 1, 1, 1>, static_offsets = array<i64: -9223372036854775808>, static_sizes = array<i64: -9223372036854775808>, static_strides = array<i64: -9223372036854775808>}> : (tensor<?xf32>, index, index, index) -> tensor<?xf32>
    "func.return"(%1) : (tensor<?xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<128x128x128x128xf32>, tensor<1x16x1xf32>, tensor<16xf32>, index) -> tensor<128x128x128x128xf32>, sym_name = "insert_slice_rank_reducing"}> ({
  ^bb0(%arg0: tensor<128x128x128x128xf32>, %arg1: tensor<1x16x1xf32>, %arg2: tensor<16xf32>, %arg3: index):
    %0 = "tensor.insert_slice"(%arg2, %arg1) <{operandSegmentSizes = array<i32: 1, 1, 0, 0, 0>, static_offsets = array<i64: 0, 0, 0>, static_sizes = array<i64: 1, 16, 1>, static_strides = array<i64: 1, 1, 1>}> : (tensor<16xf32>, tensor<1x16x1xf32>) -> tensor<1x16x1xf32>
    %1 = "tensor.insert_slice"(%0, %arg0, %arg3) <{operandSegmentSizes = array<i32: 1, 1, 1, 0, 0>, static_offsets = array<i64: 6, 7, 8, -9223372036854775808>, static_sizes = array<i64: 1, 1, 16, 1>, static_strides = array<i64: 1, 1, 1, 1>}> : (tensor<1x16x1xf32>, tensor<128x128x128x128xf32>, index) -> tensor<128x128x128x128xf32>
    "func.return"(%1) : (tensor<128x128x128x128xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<128x128x128x128xf32>, tensor<1x?x1xf32>, tensor<?xf32>, index, index) -> tensor<128x128x128x128xf32>, sym_name = "insert_slice_rank_reducing_dynamic_shape"}> ({
  ^bb0(%arg0: tensor<128x128x128x128xf32>, %arg1: tensor<1x?x1xf32>, %arg2: tensor<?xf32>, %arg3: index, %arg4: index):
    %0 = "tensor.insert_slice"(%arg2, %arg1, %arg4) <{operandSegmentSizes = array<i32: 1, 1, 0, 1, 0>, static_offsets = array<i64: 0, 0, 0>, static_sizes = array<i64: 1, -9223372036854775808, 1>, static_strides = array<i64: 1, 1, 1>}> : (tensor<?xf32>, tensor<1x?x1xf32>, index) -> tensor<1x?x1xf32>
    %1 = "tensor.insert_slice"(%0, %arg0, %arg3, %arg4) <{operandSegmentSizes = array<i32: 1, 1, 1, 1, 0>, static_offsets = array<i64: 6, 7, 8, -9223372036854775808>, static_sizes = array<i64: 1, 1, -9223372036854775808, 1>, static_strides = array<i64: 1, 1, 1, 1>}> : (tensor<1x?x1xf32>, tensor<128x128x128x128xf32>, index, index) -> tensor<128x128x128x128xf32>
    "func.return"(%1) : (tensor<128x128x128x128xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1x2xf32>, tensor<f32>, tensor<1x1xf32>) -> tensor<1x2xf32>, sym_name = "parallel_insert_slice"}> ({
  ^bb0(%arg0: tensor<1x2xf32>, %arg1: tensor<f32>, %arg2: tensor<1x1xf32>):
    %0 = "arith.constant"() <{value = 1 : index}> : () -> index
    %1 = "arith.constant"() <{value = 2 : index}> : () -> index
    %2 = "scf.forall"(%0, %1, %arg0) <{operandSegmentSizes = array<i32: 0, 2, 0, 1>, staticLowerBound = array<i64: 0, 0>, staticStep = array<i64: 1, 1>, staticUpperBound = array<i64: -9223372036854775808, -9223372036854775808>}> ({
    ^bb0(%arg3: index, %arg4: index, %arg5: tensor<1x2xf32>):
      %3 = "tensor.insert_slice"(%arg1, %arg2) <{operandSegmentSizes = array<i32: 1, 1, 0, 0, 0>, static_offsets = array<i64: 0, 0>, static_sizes = array<i64: 1, 1>, static_strides = array<i64: 1, 1>}> : (tensor<f32>, tensor<1x1xf32>) -> tensor<1x1xf32>
      "scf.forall.in_parallel"() ({
        "tensor.parallel_insert_slice"(%3, %arg5, %arg3, %arg4) <{operandSegmentSizes = array<i32: 1, 1, 2, 0, 0>, static_offsets = array<i64: -9223372036854775808, -9223372036854775808>, static_sizes = array<i64: 1, 1>, static_strides = array<i64: 1, 1>}> : (tensor<1x1xf32>, tensor<1x2xf32>, index, index) -> ()
      }) : () -> ()
    }) : (index, index, tensor<1x2xf32>) -> tensor<1x2xf32>
    "func.return"(%2) : (tensor<1x2xf32>) -> ()
  }) : () -> ()
}) : () -> ()

