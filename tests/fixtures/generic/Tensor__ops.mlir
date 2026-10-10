"builtin.module"() ({
  "func.func"() <{function_type = (tensor<*xf32>, tensor<4x4xf32>, tensor<?x?xf32>) -> (), sym_name = "cast"}> ({
  ^bb0(%arg0: tensor<*xf32>, %arg1: tensor<4x4xf32>, %arg2: tensor<?x?xf32>):
    %0 = "tensor.cast"(%arg0) : (tensor<*xf32>) -> tensor<?x?xf32>
    %1 = "tensor.cast"(%arg1) : (tensor<4x4xf32>) -> tensor<*xf32>
    %2 = "tensor.cast"(%arg2) : (tensor<?x?xf32>) -> tensor<4x?xf32>
    %3 = "tensor.cast"(%2) : (tensor<4x?xf32>) -> tensor<?x?xf32>
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<4x7x3xf32>, tensor<4x4x3xf32>, tensor<?x?x?xf32>) -> (), sym_name = "concat"}> ({
  ^bb0(%arg0: tensor<4x7x3xf32>, %arg1: tensor<4x4x3xf32>, %arg2: tensor<?x?x?xf32>):
    %0 = "tensor.concat"(%arg0) <{dim = 0 : i64}> : (tensor<4x7x3xf32>) -> tensor<4x7x3xf32>
    %1 = "tensor.concat"(%arg0, %arg1) <{dim = 1 : i64}> : (tensor<4x7x3xf32>, tensor<4x4x3xf32>) -> tensor<4x11x3xf32>
    %2 = "tensor.concat"(%arg0, %arg2) <{dim = 2 : i64}> : (tensor<4x7x3xf32>, tensor<?x?x?xf32>) -> tensor<?x?x?xf32>
    %3 = "tensor.concat"(%arg2, %arg2) <{dim = 1 : i64}> : (tensor<?x?x?xf32>, tensor<?x?x?xf32>) -> tensor<?x10x?xf32>
    %4 = "tensor.concat"(%arg2, %arg1, %arg0) <{dim = 1 : i64}> : (tensor<?x?x?xf32>, tensor<4x4x3xf32>, tensor<4x7x3xf32>) -> tensor<4x?x3xf32>
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index) -> tensor<5x?x6xf32>, sym_name = "empty"}> ({
  ^bb0(%arg0: index):
    %0 = "tensor.empty"(%arg0) : (index) -> tensor<5x?x6xf32>
    "func.return"(%0) : (tensor<5x?x6xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index) -> tensor<5x?x6xf32, "foo">, sym_name = "empty_with_encoding"}> ({
  ^bb0(%arg0: index):
    %0 = "tensor.empty"(%arg0) : (index) -> tensor<5x?x6xf32, "foo">
    "func.return"(%0) : (tensor<5x?x6xf32, "foo">) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?x?xf32>, index) -> (), sym_name = "extract"}> ({
  ^bb0(%arg0: tensor<?x?x?xf32>, %arg1: index):
    %0 = "tensor.extract"(%arg0, %arg1, %arg1, %arg1) : (tensor<?x?x?xf32>, index, index, index) -> f32
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (f32, index, tensor<?x?x?xf32>) -> (), sym_name = "insert"}> ({
  ^bb0(%arg0: f32, %arg1: index, %arg2: tensor<?x?x?xf32>):
    %0 = "tensor.insert"(%arg0, %arg2, %arg1, %arg1, %arg1) : (f32, tensor<?x?x?xf32>, index, index, index) -> tensor<?x?x?xf32>
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "tensor.from_elements"}> ({
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "tensor.from_elements"(%0) : (index) -> tensor<1xindex>
    %2 = "arith.constant"() <{value = 1 : index}> : () -> index
    %3 = "tensor.from_elements"(%0, %2) : (index, index) -> tensor<2xindex>
    %4 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %5 = "tensor.from_elements"(%4) : (f32) -> tensor<1xf32>
    %6 = "tensor.from_elements"() : () -> tensor<0xindex>
    %7 = "tensor.from_elements"(%0, %2, %0, %2, %0, %2) : (index, index, index, index, index, index) -> tensor<2x3xindex>
    %8 = "tensor.from_elements"(%0) : (index) -> tensor<index>
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index, index) -> tensor<?x3x?xf32>, sym_name = "tensor.generate"}> ({
  ^bb0(%arg0: index, %arg1: index):
    %0 = "tensor.generate"(%arg0, %arg1) ({
    ^bb0(%arg2: index, %arg3: index, %arg4: index):
      %1 = "arith.constant"() <{value = 8.000000e+00 : f32}> : () -> f32
      "tensor.yield"(%1) : (f32) -> ()
    }) : (index, index) -> tensor<?x3x?xf32>
    "func.return"(%0) : (tensor<?x3x?xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<*xf32>, tensor<1xi32>, tensor<2xi32>, tensor<?xi32>) -> tensor<*xf32>, sym_name = "tensor_reshape"}> ({
  ^bb0(%arg0: tensor<*xf32>, %arg1: tensor<1xi32>, %arg2: tensor<2xi32>, %arg3: tensor<?xi32>):
    %0 = "tensor.reshape"(%arg0, %arg1) : (tensor<*xf32>, tensor<1xi32>) -> tensor<?xf32>
    %1 = "tensor.reshape"(%0, %arg2) : (tensor<?xf32>, tensor<2xi32>) -> tensor<?x?xf32>
    %2 = "tensor.reshape"(%1, %arg3) : (tensor<?x?xf32>, tensor<?xi32>) -> tensor<*xf32>
    "func.return"(%2) : (tensor<*xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<8x16x4xf32>, index) -> (), sym_name = "slice"}> ({
  ^bb0(%arg0: tensor<8x16x4xf32>, %arg1: index):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index
    %2 = "tensor.extract_slice"(%arg0, %0, %0, %0, %arg1, %arg1, %arg1, %1, %1, %1) <{operandSegmentSizes = array<i32: 1, 3, 3, 3>, static_offsets = array<i64: -9223372036854775808, -9223372036854775808, -9223372036854775808>, static_sizes = array<i64: -9223372036854775808, -9223372036854775808, -9223372036854775808>, static_strides = array<i64: -9223372036854775808, -9223372036854775808, -9223372036854775808>}> : (tensor<8x16x4xf32>, index, index, index, index, index, index, index, index, index) -> tensor<?x?x?xf32>
    %3 = "tensor.extract_slice"(%arg0) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_offsets = array<i64: 0, 2, 0>, static_sizes = array<i64: 4, 4, 4>, static_strides = array<i64: 1, 1, 1>}> : (tensor<8x16x4xf32>) -> tensor<4x4x4xf32>
    %4 = "tensor.extract_slice"(%arg0) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_offsets = array<i64: 0, 2, 0>, static_sizes = array<i64: 4, 1, 4>, static_strides = array<i64: 1, 1, 1>}> : (tensor<8x16x4xf32>) -> tensor<4x4xf32>
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<8x16x4xf32>, tensor<8x?x4xf32>, tensor<16x32x8xf32>, tensor<4x4xf32>, index, index) -> (), sym_name = "insert_slice"}> ({
  ^bb0(%arg0: tensor<8x16x4xf32>, %arg1: tensor<8x?x4xf32>, %arg2: tensor<16x32x8xf32>, %arg3: tensor<4x4xf32>, %arg4: index, %arg5: index):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index
    %2 = "tensor.insert_slice"(%arg0, %arg2, %0, %0, %0, %1, %1, %1) <{operandSegmentSizes = array<i32: 1, 1, 3, 0, 3>, static_offsets = array<i64: -9223372036854775808, -9223372036854775808, -9223372036854775808>, static_sizes = array<i64: 8, 16, 4>, static_strides = array<i64: -9223372036854775808, -9223372036854775808, -9223372036854775808>}> : (tensor<8x16x4xf32>, tensor<16x32x8xf32>, index, index, index, index, index, index) -> tensor<16x32x8xf32>
    %3 = "tensor.insert_slice"(%arg0, %arg2, %0, %arg4, %0, %1, %1) <{operandSegmentSizes = array<i32: 1, 1, 3, 0, 2>, static_offsets = array<i64: -9223372036854775808, -9223372036854775808, -9223372036854775808>, static_sizes = array<i64: 8, 16, 4>, static_strides = array<i64: -9223372036854775808, 1, -9223372036854775808>}> : (tensor<8x16x4xf32>, tensor<16x32x8xf32>, index, index, index, index, index) -> tensor<16x32x8xf32>
    %4 = "tensor.insert_slice"(%arg3, %arg0) <{operandSegmentSizes = array<i32: 1, 1, 0, 0, 0>, static_offsets = array<i64: 0, 2, 0>, static_sizes = array<i64: 4, 1, 4>, static_strides = array<i64: 1, 1, 1>}> : (tensor<4x4xf32>, tensor<8x16x4xf32>) -> tensor<8x16x4xf32>
    %5 = "tensor.insert_slice"(%arg1, %arg0, %arg4, %arg5) <{operandSegmentSizes = array<i32: 1, 1, 1, 1, 0>, static_offsets = array<i64: 0, -9223372036854775808, 0>, static_sizes = array<i64: 8, -9223372036854775808, 4>, static_strides = array<i64: 1, 1, 1>}> : (tensor<8x?x4xf32>, tensor<8x16x4xf32>, index, index) -> tensor<8x16x4xf32>
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1x1xf32>, tensor<f32>) -> (tensor<f32>, tensor<1x1xf32>), sym_name = "tensor_reshape_zero_dim"}> ({
  ^bb0(%arg0: tensor<1x1xf32>, %arg1: tensor<f32>):
    %0 = "tensor.collapse_shape"(%arg0) <{reassociation = []}> : (tensor<1x1xf32>) -> tensor<f32>
    %1 = "tensor.expand_shape"(%0) <{reassociation = [], static_output_shape = array<i64: 1, 1>}> : (tensor<f32>) -> tensor<1x1xf32>
    "func.return"(%0, %1) : (tensor<f32>, tensor<1x1xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?xf32>, index, index, index) -> tensor<5x?x?x?xf32>, sym_name = "tensor_expand_shape_dynamic_dim"}> ({
  ^bb0(%arg0: tensor<?x?xf32>, %arg1: index, %arg2: index, %arg3: index):
    %0 = "tensor.expand_shape"(%arg0, %arg1, %arg2, %arg3) <{reassociation = [[0, 1], [2, 3]], static_output_shape = array<i64: 5, -9223372036854775808, -9223372036854775808, -9223372036854775808>}> : (tensor<?x?xf32>, index, index, index) -> tensor<5x?x?x?xf32>
    "func.return"(%0) : (tensor<5x?x?x?xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?x?x4x?xf32>) -> tensor<?x?x?xf32>, sym_name = "legal_collapsing_reshape_dynamic_tensor"}> ({
  ^bb0(%arg0: tensor<?x?x?x4x?xf32>):
    %0 = "tensor.collapse_shape"(%arg0) <{reassociation = [[0], [1], [2, 3, 4]]}> : (tensor<?x?x?x4x?xf32>) -> tensor<?x?x?xf32>
    "func.return"(%0) : (tensor<?x?x?xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<4x4x?xf32>) -> (), sym_name = "rank"}> ({
  ^bb0(%arg0: tensor<4x4x?xf32>):
    %0 = "tensor.rank"(%arg0) : (tensor<4x4x?xf32>) -> index
    %1 = "tensor.rank"(%arg0) : (tensor<4x4x?xf32>) -> index
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1x2x2x?xf32>, index, index, f32) -> tensor<6x?x?x?xf32>, sym_name = "pad_dynamic"}> ({
  ^bb0(%arg0: tensor<1x2x2x?xf32>, %arg1: index, %arg2: index, %arg3: f32):
    %0 = "tensor.pad"(%arg0, %arg1, %arg2) <{operandSegmentSizes = array<i32: 1, 1, 1>, static_high = array<i64: 3, 3, -9223372036854775808, 2>, static_low = array<i64: 2, -9223372036854775808, 3, 3>}> ({
    ^bb0(%arg4: index, %arg5: index, %arg6: index, %arg7: index):
      "tensor.yield"(%arg3) : (f32) -> ()
    }) : (tensor<1x2x2x?xf32>, index, index) -> tensor<6x?x?x?xf32>
    "func.return"(%0) : (tensor<6x?x?x?xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<3x4xf32>, f32) -> tensor<6x9xf32>, sym_name = "pad_static"}> ({
  ^bb0(%arg0: tensor<3x4xf32>, %arg1: f32):
    %0 = "tensor.pad"(%arg0) <{operandSegmentSizes = array<i32: 1, 0, 0>, static_high = array<i64: 2, 3>, static_low = array<i64: 1, 2>}> ({
    ^bb0(%arg2: index, %arg3: index):
      "tensor.yield"(%arg1) : (f32) -> ()
    }) : (tensor<3x4xf32>) -> tensor<6x9xf32>
    "func.return"(%0) : (tensor<6x9xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<2x3xf32>, index, index, f32) -> tensor<?x?xf32>, sym_name = "pad_asymmetrical"}> ({
  ^bb0(%arg0: tensor<2x3xf32>, %arg1: index, %arg2: index, %arg3: f32):
    %0 = "tensor.pad"(%arg0, %arg1, %arg2) <{operandSegmentSizes = array<i32: 1, 0, 2>, static_high = array<i64: -9223372036854775808, -9223372036854775808>, static_low = array<i64: 0, 0>}> ({
    ^bb0(%arg4: index, %arg5: index):
      "tensor.yield"(%arg3) : (f32) -> ()
    }) : (tensor<2x3xf32>, index, index) -> tensor<?x?xf32>
    "func.return"(%0) : (tensor<?x?xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?xf32>, index, index, f32) -> tensor<2x3xf32>, sym_name = "pad_to_static_size"}> ({
  ^bb0(%arg0: tensor<?x?xf32>, %arg1: index, %arg2: index, %arg3: f32):
    %0 = "tensor.pad"(%arg0, %arg1, %arg2) <{operandSegmentSizes = array<i32: 1, 0, 2>, static_high = array<i64: -9223372036854775808, -9223372036854775808>, static_low = array<i64: 0, 0>}> ({
    ^bb0(%arg4: index, %arg5: index):
      "tensor.yield"(%arg3) : (f32) -> ()
    }) : (tensor<?x?xf32>, index, index) -> tensor<2x3xf32>
    "func.return"(%0) : (tensor<2x3xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (f32, !llvm.ptr) -> (), sym_name = "test_splat_op"}> ({
  ^bb0(%arg3: f32, %arg4: !llvm.ptr):
    %1 = "tensor.splat"(%arg3) : (f32) -> tensor<8xf32>
    %2 = "tensor.splat"(%arg3) : (f32) -> tensor<4xf32>
    %3 = "tensor.splat"(%arg4) : (!llvm.ptr) -> tensor<8x!llvm.ptr>
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (f32, index, index) -> (), sym_name = "test_splat_op_dynamic"}> ({
  ^bb0(%arg0: f32, %arg1: index, %arg2: index):
    %0 = "tensor.splat"(%arg0, %arg1, %arg2) : (f32, index, index) -> tensor<?x8x?xf32>
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<4x5x6xf32>, tensor<1x3x2xindex>, tensor<1x3x2xi32>) -> (), sym_name = "gather_scatter"}> ({
  ^bb0(%arg0: tensor<4x5x6xf32>, %arg1: tensor<1x3x2xindex>, %arg2: tensor<1x3x2xi32>):
    %0 = "tensor.gather"(%arg0, %arg2) <{gather_dims = array<i64: 1, 2>, unique}> : (tensor<4x5x6xf32>, tensor<1x3x2xi32>) -> tensor<1x3x4x1x1xf32>
    %1 = "tensor.gather"(%arg0, %arg1) <{gather_dims = array<i64: 1, 2>, unique}> : (tensor<4x5x6xf32>, tensor<1x3x2xindex>) -> tensor<1x3x4xf32>
    %2 = "tensor.scatter"(%0, %arg0, %arg1) <{scatter_dims = array<i64: 1, 2>, unique}> : (tensor<1x3x4x1x1xf32>, tensor<4x5x6xf32>, tensor<1x3x2xindex>) -> tensor<4x5x6xf32>
    %3 = "tensor.scatter"(%1, %arg0, %arg2) <{scatter_dims = array<i64: 1, 2>, unique}> : (tensor<1x3x4xf32>, tensor<4x5x6xf32>, tensor<1x3x2xi32>) -> tensor<4x5x6xf32>
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

