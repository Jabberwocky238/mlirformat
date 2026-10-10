"builtin.module"() ({
  "func.func"() <{function_type = (tensor<4x5xf32>, f32) -> tensor<2x1xf32>, sym_name = "static_data_only"}> ({
  ^bb0(%arg0: tensor<4x5xf32>, %arg1: f32):
    %0 = "tensor.pad"(%arg0) <{operandSegmentSizes = array<i32: 1, 0, 0>, static_high = array<i64: 7, 8>, static_low = array<i64: 0, 0>}> ({
    ^bb0(%arg2: index, %arg3: index):
      "tensor.yield"(%arg1) : (f32) -> ()
    }) : (tensor<4x5xf32>) -> tensor<11x13xf32>
    %1 = "tensor.extract_slice"(%0) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_offsets = array<i64: 1, 2>, static_sizes = array<i64: 2, 1>, static_strides = array<i64: 1, 1>}> : (tensor<11x13xf32>) -> tensor<2x1xf32>
    "func.return"(%1) : (tensor<2x1xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<4x5xf32>, f32) -> tensor<2x4xf32>, sym_name = "static_high_pad_only"}> ({
  ^bb0(%arg0: tensor<4x5xf32>, %arg1: f32):
    %0 = "tensor.pad"(%arg0) <{operandSegmentSizes = array<i32: 1, 0, 0>, static_high = array<i64: 7, 8>, static_low = array<i64: 0, 0>}> ({
    ^bb0(%arg2: index, %arg3: index):
      "tensor.yield"(%arg1) : (f32) -> ()
    }) : (tensor<4x5xf32>) -> tensor<11x13xf32>
    %1 = "tensor.extract_slice"(%0) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_offsets = array<i64: 4, 5>, static_sizes = array<i64: 2, 4>, static_strides = array<i64: 1, 1>}> : (tensor<11x13xf32>) -> tensor<2x4xf32>
    "func.return"(%1) : (tensor<2x4xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<4x5xf32>, f32) -> tensor<2x3xf32>, sym_name = "static_low_pad_only"}> ({
  ^bb0(%arg0: tensor<4x5xf32>, %arg1: f32):
    %0 = "tensor.pad"(%arg0) <{operandSegmentSizes = array<i32: 1, 0, 0>, static_high = array<i64: 7, 8>, static_low = array<i64: 3, 7>}> ({
    ^bb0(%arg2: index, %arg3: index):
      "tensor.yield"(%arg1) : (f32) -> ()
    }) : (tensor<4x5xf32>) -> tensor<14x20xf32>
    %1 = "tensor.extract_slice"(%0) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_offsets = array<i64: 1, 3>, static_sizes = array<i64: 2, 3>, static_strides = array<i64: 1, 1>}> : (tensor<14x20xf32>) -> tensor<2x3xf32>
    "func.return"(%1) : (tensor<2x3xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<4x5xf32>, f32) -> tensor<1x3xf32>, sym_name = "static_low_pad_only_2"}> ({
  ^bb0(%arg0: tensor<4x5xf32>, %arg1: f32):
    %0 = "tensor.pad"(%arg0) <{operandSegmentSizes = array<i32: 1, 0, 0>, static_high = array<i64: 7, 8>, static_low = array<i64: 3, 7>}> ({
    ^bb0(%arg2: index, %arg3: index):
      "tensor.yield"(%arg1) : (f32) -> ()
    }) : (tensor<4x5xf32>) -> tensor<14x20xf32>
    %1 = "tensor.extract_slice"(%0) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_offsets = array<i64: 1, 3>, static_sizes = array<i64: 1, 3>, static_strides = array<i64: 1, 1>}> : (tensor<14x20xf32>) -> tensor<1x3xf32>
    "func.return"(%1) : (tensor<1x3xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<4x5xf32>, f32) -> tensor<3x4xf32>, sym_name = "static_mixed_data_high_pad"}> ({
  ^bb0(%arg0: tensor<4x5xf32>, %arg1: f32):
    %0 = "tensor.pad"(%arg0) <{operandSegmentSizes = array<i32: 1, 0, 0>, static_high = array<i64: 7, 8>, static_low = array<i64: 0, 0>}> ({
    ^bb0(%arg2: index, %arg3: index):
      "tensor.yield"(%arg1) : (f32) -> ()
    }) : (tensor<4x5xf32>) -> tensor<11x13xf32>
    %1 = "tensor.extract_slice"(%0) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_offsets = array<i64: 2, 4>, static_sizes = array<i64: 3, 4>, static_strides = array<i64: 1, 1>}> : (tensor<11x13xf32>) -> tensor<3x4xf32>
    "func.return"(%1) : (tensor<3x4xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<4x5xf32>, f32) -> tensor<3x4xf32>, sym_name = "static_mixed_data_low_pad"}> ({
  ^bb0(%arg0: tensor<4x5xf32>, %arg1: f32):
    %0 = "tensor.pad"(%arg0) <{operandSegmentSizes = array<i32: 1, 0, 0>, static_high = array<i64: 7, 8>, static_low = array<i64: 3, 7>}> ({
    ^bb0(%arg2: index, %arg3: index):
      "tensor.yield"(%arg1) : (f32) -> ()
    }) : (tensor<4x5xf32>) -> tensor<14x20xf32>
    %1 = "tensor.extract_slice"(%0) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_offsets = array<i64: 2, 4>, static_sizes = array<i64: 3, 4>, static_strides = array<i64: 1, 1>}> : (tensor<14x20xf32>) -> tensor<3x4xf32>
    "func.return"(%1) : (tensor<3x4xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<4x5xf32>, f32) -> tensor<7x9xf32>, sym_name = "static_mixed_data_low_high_pad"}> ({
  ^bb0(%arg0: tensor<4x5xf32>, %arg1: f32):
    %0 = "tensor.pad"(%arg0) <{operandSegmentSizes = array<i32: 1, 0, 0>, static_high = array<i64: 7, 8>, static_low = array<i64: 2, 3>}> ({
    ^bb0(%arg2: index, %arg3: index):
      "tensor.yield"(%arg1) : (f32) -> ()
    }) : (tensor<4x5xf32>) -> tensor<13x16xf32>
    %1 = "tensor.extract_slice"(%0) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_offsets = array<i64: 1, 2>, static_sizes = array<i64: 7, 9>, static_strides = array<i64: 1, 1>}> : (tensor<13x16xf32>) -> tensor<7x9xf32>
    "func.return"(%1) : (tensor<7x9xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<8x16x4xf32>, f32) -> tensor<16x4xf32>, sym_name = "static_rank_reduce"}> ({
  ^bb0(%arg0: tensor<8x16x4xf32>, %arg1: f32):
    %0 = "tensor.pad"(%arg0) <{operandSegmentSizes = array<i32: 1, 0, 0>, static_high = array<i64: 0, 0, 0>, static_low = array<i64: 0, 2, 0>}> ({
    ^bb0(%arg2: index, %arg3: index, %arg4: index):
      "tensor.yield"(%arg1) : (f32) -> ()
    }) : (tensor<8x16x4xf32>) -> tensor<8x18x4xf32>
    %1 = "tensor.extract_slice"(%0) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_offsets = array<i64: 0, 0, 0>, static_sizes = array<i64: 1, 16, 4>, static_strides = array<i64: 1, 1, 1>}> : (tensor<8x18x4xf32>) -> tensor<16x4xf32>
    "func.return"(%1) : (tensor<16x4xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x5xf32>, index, f32) -> tensor<3x4xf32>, sym_name = "dynamic_high_pad"}> ({
  ^bb0(%arg0: tensor<?x5xf32>, %arg1: index, %arg2: f32):
    %0 = "tensor.pad"(%arg0, %arg1) <{operandSegmentSizes = array<i32: 1, 0, 1>, static_high = array<i64: -9223372036854775808, 8>, static_low = array<i64: 0, 0>}> ({
    ^bb0(%arg3: index, %arg4: index):
      "tensor.yield"(%arg2) : (f32) -> ()
    }) : (tensor<?x5xf32>, index) -> tensor<?x13xf32>
    %1 = "tensor.extract_slice"(%0) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_offsets = array<i64: 2, 4>, static_sizes = array<i64: 3, 4>, static_strides = array<i64: 1, 1>}> : (tensor<?x13xf32>) -> tensor<3x4xf32>
    "func.return"(%1) : (tensor<3x4xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x5xf32>, index, f32) -> tensor<?x4xf32>, sym_name = "dynamic_extract_size"}> ({
  ^bb0(%arg0: tensor<?x5xf32>, %arg1: index, %arg2: f32):
    %0 = "tensor.pad"(%arg0) <{operandSegmentSizes = array<i32: 1, 0, 0>, static_high = array<i64: 7, 8>, static_low = array<i64: 0, 0>}> ({
    ^bb0(%arg3: index, %arg4: index):
      "tensor.yield"(%arg2) : (f32) -> ()
    }) : (tensor<?x5xf32>) -> tensor<?x13xf32>
    %1 = "tensor.extract_slice"(%0, %arg1) <{operandSegmentSizes = array<i32: 1, 0, 1, 0>, static_offsets = array<i64: 2, 4>, static_sizes = array<i64: -9223372036854775808, 4>, static_strides = array<i64: 1, 1>}> : (tensor<?x13xf32>, index) -> tensor<?x4xf32>
    "func.return"(%1) : (tensor<?x4xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?xf32>, f32, index, index, index, index) -> tensor<?x?xf32>, sym_name = "dynamic_zero_low_padding"}> ({
  ^bb0(%arg0: tensor<?x?xf32>, %arg1: f32, %arg2: index, %arg3: index, %arg4: index, %arg5: index):
    %0 = "tensor.pad"(%arg0) <{operandSegmentSizes = array<i32: 1, 0, 0>, static_high = array<i64: 7, 8>, static_low = array<i64: 0, 0>}> ({
    ^bb0(%arg6: index, %arg7: index):
      "tensor.yield"(%arg1) : (f32) -> ()
    }) : (tensor<?x?xf32>) -> tensor<?x?xf32>
    %1 = "tensor.extract_slice"(%0, %arg2, %arg3, %arg4, %arg5) <{operandSegmentSizes = array<i32: 1, 2, 2, 0>, static_offsets = array<i64: -9223372036854775808, -9223372036854775808>, static_sizes = array<i64: -9223372036854775808, -9223372036854775808>, static_strides = array<i64: 1, 1>}> : (tensor<?x?xf32>, index, index, index, index) -> tensor<?x?xf32>
    "func.return"(%1) : (tensor<?x?xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?xf32>, f32, index, index, index, index) -> tensor<?x?xf32>, sym_name = "dynamic_zero_high_padding"}> ({
  ^bb0(%arg0: tensor<?x?xf32>, %arg1: f32, %arg2: index, %arg3: index, %arg4: index, %arg5: index):
    %0 = "tensor.pad"(%arg0) <{operandSegmentSizes = array<i32: 1, 0, 0>, static_high = array<i64: 0, 0>, static_low = array<i64: 7, 8>}> ({
    ^bb0(%arg6: index, %arg7: index):
      "tensor.yield"(%arg1) : (f32) -> ()
    }) : (tensor<?x?xf32>) -> tensor<?x?xf32>
    %1 = "tensor.extract_slice"(%0, %arg2, %arg3, %arg4, %arg5) <{operandSegmentSizes = array<i32: 1, 2, 2, 0>, static_offsets = array<i64: -9223372036854775808, -9223372036854775808>, static_sizes = array<i64: -9223372036854775808, -9223372036854775808>, static_strides = array<i64: 1, 1>}> : (tensor<?x?xf32>, index, index, index, index) -> tensor<?x?xf32>
    "func.return"(%1) : (tensor<?x?xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x5xf32>, index, f32) -> tensor<4xf32>, sym_name = "dynamic_rank_reduce"}> ({
  ^bb0(%arg0: tensor<?x5xf32>, %arg1: index, %arg2: f32):
    %0 = "tensor.pad"(%arg0) <{operandSegmentSizes = array<i32: 1, 0, 0>, static_high = array<i64: 7, 8>, static_low = array<i64: 0, 0>}> ({
    ^bb0(%arg3: index, %arg4: index):
      "tensor.yield"(%arg2) : (f32) -> ()
    }) : (tensor<?x5xf32>) -> tensor<?x13xf32>
    %1 = "tensor.extract_slice"(%0) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_offsets = array<i64: 2, 4>, static_sizes = array<i64: 1, 4>, static_strides = array<i64: 1, 1>}> : (tensor<?x13xf32>) -> tensor<4xf32>
    "func.return"(%1) : (tensor<4xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<3x4x5xf32>, f32, index) -> tensor<?x2x1xf32>, sym_name = "nopaddim_with_dynamic_extract"}> ({
  ^bb0(%arg0: tensor<3x4x5xf32>, %arg1: f32, %arg2: index):
    %0 = "tensor.pad"(%arg0) <{operandSegmentSizes = array<i32: 1, 0, 0>, static_high = array<i64: 0, 7, 8>, static_low = array<i64: 0, 0, 0>}> ({
    ^bb0(%arg3: index, %arg4: index, %arg5: index):
      "tensor.yield"(%arg1) : (f32) -> ()
    }) : (tensor<3x4x5xf32>) -> tensor<3x11x13xf32>
    %1 = "tensor.extract_slice"(%0, %arg2, %arg2) <{operandSegmentSizes = array<i32: 1, 1, 1, 0>, static_offsets = array<i64: -9223372036854775808, 1, 2>, static_sizes = array<i64: -9223372036854775808, 2, 1>, static_strides = array<i64: 1, 1, 1>}> : (tensor<3x11x13xf32>, index, index) -> tensor<?x2x1xf32>
    "func.return"(%1) : (tensor<?x2x1xf32>) -> ()
  }) : () -> ()
}) : () -> ()

