"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?x?xf32>, index, index) -> tensor<?x6xf32>, sym_name = "swap_fill_insert_slice"}> ({
  ^bb0(%arg0: tensor<?x?x?xf32>, %arg1: index, %arg2: index):
    %0 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %1 = "linalg.fill"(%0, %arg0) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg3: f32, %arg4: f32):
      "linalg.yield"(%arg3) : (f32) -> ()
    }) : (f32, tensor<?x?x?xf32>) -> tensor<?x?x?xf32>
    %2 = "tensor.extract_slice"(%1, %arg1, %arg2) <{operandSegmentSizes = array<i32: 1, 1, 1, 0>, static_offsets = array<i64: -9223372036854775808, 8, 4>, static_sizes = array<i64: 1, -9223372036854775808, 6>, static_strides = array<i64: 1, 3, 1>}> : (tensor<?x?x?xf32>, index, index) -> tensor<?x6xf32>
    "func.return"(%2) : (tensor<?x6xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?x?xf32>, index, index) -> (tensor<?x?x?xf32>, tensor<2x?x6xf32>), sym_name = "dont_swap_fill_insert_slice_multi_user"}> ({
  ^bb0(%arg0: tensor<?x?x?xf32>, %arg1: index, %arg2: index):
    %0 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %1 = "linalg.fill"(%0, %arg0) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg3: f32, %arg4: f32):
      "linalg.yield"(%arg3) : (f32) -> ()
    }) : (f32, tensor<?x?x?xf32>) -> tensor<?x?x?xf32>
    %2 = "tensor.extract_slice"(%1, %arg1, %arg2) <{operandSegmentSizes = array<i32: 1, 1, 1, 0>, static_offsets = array<i64: -9223372036854775808, 8, 4>, static_sizes = array<i64: 2, -9223372036854775808, 6>, static_strides = array<i64: 1, 3, 1>}> : (tensor<?x?x?xf32>, index, index) -> tensor<2x?x6xf32>
    "func.return"(%1, %2) : (tensor<?x?x?xf32>, tensor<2x?x6xf32>) -> ()
  }) : () -> ()
}) : () -> ()

