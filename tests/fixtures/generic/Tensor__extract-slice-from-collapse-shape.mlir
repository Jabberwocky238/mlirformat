"builtin.module"() ({
  "func.func"() <{function_type = (tensor<3x5x7x11xf32>) -> tensor<20x11xf32>, sym_name = "extract_slice_static"}> ({
  ^bb0(%arg0: tensor<3x5x7x11xf32>):
    %0 = "tensor.collapse_shape"(%arg0) <{reassociation = [[0, 1, 2], [3]]}> : (tensor<3x5x7x11xf32>) -> tensor<105x11xf32>
    %1 = "tensor.extract_slice"(%0) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_offsets = array<i64: 0, 0>, static_sizes = array<i64: 20, 11>, static_strides = array<i64: 1, 1>}> : (tensor<105x11xf32>) -> tensor<20x11xf32>
    "func.return"(%1) : (tensor<20x11xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<3x5x7x11xf32>) -> tensor<10x5xf32>, sym_name = "extract_slice_static_strided"}> ({
  ^bb0(%arg0: tensor<3x5x7x11xf32>):
    %0 = "tensor.collapse_shape"(%arg0) <{reassociation = [[0, 1, 2], [3]]}> : (tensor<3x5x7x11xf32>) -> tensor<105x11xf32>
    %1 = "tensor.extract_slice"(%0) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_offsets = array<i64: 13, 0>, static_sizes = array<i64: 10, 5>, static_strides = array<i64: 2, 2>}> : (tensor<105x11xf32>) -> tensor<10x5xf32>
    "func.return"(%1) : (tensor<10x5xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<3x?x?x11xf32>, index, index) -> tensor<?x5xf32>, sym_name = "extract_slice_dynamic"}> ({
  ^bb0(%arg0: tensor<3x?x?x11xf32>, %arg1: index, %arg2: index):
    %0 = "tensor.collapse_shape"(%arg0) <{reassociation = [[0, 1, 2], [3]]}> : (tensor<3x?x?x11xf32>) -> tensor<?x11xf32>
    %1 = "tensor.extract_slice"(%0, %arg1, %arg2) <{operandSegmentSizes = array<i32: 1, 1, 1, 0>, static_offsets = array<i64: -9223372036854775808, 0>, static_sizes = array<i64: -9223372036854775808, 5>, static_strides = array<i64: 2, 2>}> : (tensor<?x11xf32>, index, index) -> tensor<?x5xf32>
    "func.return"(%1) : (tensor<?x5xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<3x?x?x11x?xf32>, index, index, index, index) -> tensor<?x?xf32>, sym_name = "extract_slice_dynamic_multidim"}> ({
  ^bb0(%arg0: tensor<3x?x?x11x?xf32>, %arg1: index, %arg2: index, %arg3: index, %arg4: index):
    %0 = "tensor.collapse_shape"(%arg0) <{reassociation = [[0, 1, 2], [3, 4]]}> : (tensor<3x?x?x11x?xf32>) -> tensor<?x?xf32>
    %1 = "tensor.extract_slice"(%0, %arg1, %arg3, %arg2, %arg4) <{operandSegmentSizes = array<i32: 1, 2, 2, 0>, static_offsets = array<i64: -9223372036854775808, -9223372036854775808>, static_sizes = array<i64: -9223372036854775808, -9223372036854775808>, static_strides = array<i64: 1, 1>}> : (tensor<?x?xf32>, index, index, index, index) -> tensor<?x?xf32>
    "func.return"(%1) : (tensor<?x?xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<3x?x?x11x2xf32>, index, index) -> tensor<?x22xf32>, sym_name = "extract_slice_non_sliced_linearized_dim"}> ({
  ^bb0(%arg0: tensor<3x?x?x11x2xf32>, %arg1: index, %arg2: index):
    %0 = "tensor.collapse_shape"(%arg0) <{reassociation = [[0, 1, 2], [3, 4]]}> : (tensor<3x?x?x11x2xf32>) -> tensor<?x22xf32>
    %1 = "tensor.extract_slice"(%0, %arg1, %arg2) <{operandSegmentSizes = array<i32: 1, 1, 1, 0>, static_offsets = array<i64: -9223372036854775808, 0>, static_sizes = array<i64: -9223372036854775808, 22>, static_strides = array<i64: 1, 1>}> : (tensor<?x22xf32>, index, index) -> tensor<?x22xf32>
    "func.return"(%1) : (tensor<?x22xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<30x11x100xf32>, index, index) -> tensor<330x?xf32>, sym_name = "no_sliced_linearized_dims"}> ({
  ^bb0(%arg0: tensor<30x11x100xf32>, %arg1: index, %arg2: index):
    %0 = "tensor.collapse_shape"(%arg0) <{reassociation = [[0, 1], [2]]}> : (tensor<30x11x100xf32>) -> tensor<330x100xf32>
    %1 = "tensor.extract_slice"(%0, %arg1, %arg2) <{operandSegmentSizes = array<i32: 1, 1, 1, 0>, static_offsets = array<i64: 0, -9223372036854775808>, static_sizes = array<i64: 330, -9223372036854775808>, static_strides = array<i64: 1, 1>}> : (tensor<330x100xf32>, index, index) -> tensor<330x?xf32>
    "func.return"(%1) : (tensor<330x?xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1x11x100xf32>, index, index) -> tensor<?x100xf32>, sym_name = "collapse_and_slice_unit_dim"}> ({
  ^bb0(%arg7: tensor<1x11x100xf32>, %arg8: index, %arg9: index):
    %6 = "tensor.collapse_shape"(%arg7) <{reassociation = [[0, 1], [2]]}> : (tensor<1x11x100xf32>) -> tensor<11x100xf32>
    %7 = "tensor.extract_slice"(%6, %arg8, %arg9) <{operandSegmentSizes = array<i32: 1, 1, 1, 0>, static_offsets = array<i64: -9223372036854775808, 0>, static_sizes = array<i64: -9223372036854775808, 100>, static_strides = array<i64: 1, 1>}> : (tensor<11x100xf32>, index, index) -> tensor<?x100xf32>
    "func.return"(%7) : (tensor<?x100xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<1x?x1x100xf32>, index, index) -> tensor<?x100xf32>, sym_name = "collapse_and_slice_multiple_unit_dim_dynamic"}> ({
  ^bb0(%arg4: tensor<1x?x1x100xf32>, %arg5: index, %arg6: index):
    %4 = "tensor.collapse_shape"(%arg4) <{reassociation = [[0, 1, 2], [3]]}> : (tensor<1x?x1x100xf32>) -> tensor<?x100xf32>
    %5 = "tensor.extract_slice"(%4, %arg5, %arg6) <{operandSegmentSizes = array<i32: 1, 1, 1, 0>, static_offsets = array<i64: -9223372036854775808, 0>, static_sizes = array<i64: -9223372036854775808, 100>, static_strides = array<i64: 1, 1>}> : (tensor<?x100xf32>, index, index) -> tensor<?x100xf32>
    "func.return"(%5) : (tensor<?x100xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<1x?x1x100x10xf32>, index, index) -> tensor<?x?xf32>, sym_name = "collapse_and_slice_multiple_unit_dim_mixed"}> ({
  ^bb0(%arg1: tensor<1x?x1x100x10xf32>, %arg2: index, %arg3: index):
    %2 = "tensor.collapse_shape"(%arg1) <{reassociation = [[0, 1, 2], [3, 4]]}> : (tensor<1x?x1x100x10xf32>) -> tensor<?x1000xf32>
    %3 = "tensor.extract_slice"(%2, %arg2, %arg2, %arg3, %arg3) <{operandSegmentSizes = array<i32: 1, 2, 2, 0>, static_offsets = array<i64: -9223372036854775808, -9223372036854775808>, static_sizes = array<i64: -9223372036854775808, -9223372036854775808>, static_strides = array<i64: 1, 1>}> : (tensor<?x1000xf32>, index, index, index, index) -> tensor<?x?xf32>
    "func.return"(%3) : (tensor<?x?xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<1x1x1x100xf32>) -> tensor<1x100xf32>, sym_name = "collapse_and_slice_multiple_all_unit_dim"}> ({
  ^bb0(%arg0: tensor<1x1x1x100xf32>):
    %0 = "tensor.collapse_shape"(%arg0) <{reassociation = [[0, 1, 2], [3]]}> : (tensor<1x1x1x100xf32>) -> tensor<1x100xf32>
    %1 = "tensor.extract_slice"(%0) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_offsets = array<i64: 0, 0>, static_sizes = array<i64: 1, 100>, static_strides = array<i64: 1, 1>}> : (tensor<1x100xf32>) -> tensor<1x100xf32>
    "func.return"(%1) : (tensor<1x100xf32>) -> ()
  }) : () -> ()
}) : () -> ()

