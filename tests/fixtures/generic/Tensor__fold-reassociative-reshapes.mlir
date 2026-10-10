"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?x?x?xf32>, index) -> (tensor<?x1x1x5xf32>, tensor<?x1x1x5xf32>), sym_name = "expand_shape_of_rank_reducing_extract"}> ({
  ^bb0(%arg0: tensor<?x?x?x?xf32>, %arg1: index):
    %0 = "tensor.extract_slice"(%arg0, %arg1) <{operandSegmentSizes = array<i32: 1, 0, 1, 0>, static_offsets = array<i64: 0, 0, 0, 0>, static_sizes = array<i64: -9223372036854775808, 1, 1, 5>, static_strides = array<i64: 1, 1, 1, 1>}> : (tensor<?x?x?x?xf32>, index) -> tensor<?x1x5xf32>
    %1 = "arith.constant"() <{value = 0 : index}> : () -> index
    %2 = "tensor.dim"(%0, %1) : (tensor<?x1x5xf32>, index) -> index
    %3 = "tensor.expand_shape"(%0, %2) <{reassociation = [[0], [1, 2], [3]], static_output_shape = array<i64: -9223372036854775808, 1, 1, 5>}> : (tensor<?x1x5xf32>, index) -> tensor<?x1x1x5xf32>
    %4 = "tensor.expand_shape"(%0, %2) <{reassociation = [[0, 1], [2], [3]], static_output_shape = array<i64: -9223372036854775808, 1, 1, 5>}> : (tensor<?x1x5xf32>, index) -> tensor<?x1x1x5xf32>
    "func.return"(%3, %4) : (tensor<?x1x1x5xf32>, tensor<?x1x1x5xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?x?x?xf32>, index, index) -> tensor<?x?xf32>, sym_name = "unpadding_collapse_of_extract_slice"}> ({
  ^bb0(%arg0: tensor<?x?x?x?xf32>, %arg1: index, %arg2: index):
    %0 = "arith.constant"() <{value = 1 : index}> : () -> index
    %1 = "arith.constant"() <{value = 3 : index}> : () -> index
    %2 = "tensor.dim"(%arg0, %0) : (tensor<?x?x?x?xf32>, index) -> index
    %3 = "tensor.dim"(%arg0, %1) : (tensor<?x?x?x?xf32>, index) -> index
    %4 = "tensor.extract_slice"(%arg0, %arg1, %arg2, %2, %3) <{operandSegmentSizes = array<i32: 1, 2, 2, 0>, static_offsets = array<i64: -9223372036854775808, -9223372036854775808, 0, 0>, static_sizes = array<i64: 1, -9223372036854775808, 1, -9223372036854775808>, static_strides = array<i64: 1, 1, 1, 1>}> : (tensor<?x?x?x?xf32>, index, index, index, index) -> tensor<1x?x1x?xf32>
    %5 = "tensor.collapse_shape"(%4) <{reassociation = [[0, 1], [2, 3]]}> : (tensor<1x?x1x?xf32>) -> tensor<?x?xf32>
    "func.return"(%5) : (tensor<?x?xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?x?x?xf32>, index, index, index) -> tensor<?x?xf32>, sym_name = "non_unpadding_collapse_of_extract_slice"}> ({
  ^bb0(%arg0: tensor<?x?x?x?xf32>, %arg1: index, %arg2: index, %arg3: index):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index
    %2 = "tensor.dim"(%arg0, %0) : (tensor<?x?x?x?xf32>, index) -> index
    %3 = "tensor.dim"(%arg0, %1) : (tensor<?x?x?x?xf32>, index) -> index
    %4 = "tensor.extract_slice"(%arg0, %arg1, %arg2, %2, %3, %arg3) <{operandSegmentSizes = array<i32: 1, 2, 3, 0>, static_offsets = array<i64: -9223372036854775808, -9223372036854775808, 0, 0>, static_sizes = array<i64: -9223372036854775808, -9223372036854775808, -9223372036854775808, 1>, static_strides = array<i64: 1, 1, 1, 1>}> : (tensor<?x?x?x?xf32>, index, index, index, index, index) -> tensor<?x?x?xf32>
    %5 = "tensor.collapse_shape"(%4) <{reassociation = [[0], [1, 2]]}> : (tensor<?x?x?xf32>) -> tensor<?x?xf32>
    "func.return"(%5) : (tensor<?x?xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?x?x?xf32>, index, index) -> (tensor<1x?x1x?xf32>, tensor<?x?xf32>), sym_name = "unpadding_collapse_of_extract_slice_with_multiple_users"}> ({
  ^bb0(%arg0: tensor<?x?x?x?xf32>, %arg1: index, %arg2: index):
    %0 = "arith.constant"() <{value = 1 : index}> : () -> index
    %1 = "arith.constant"() <{value = 3 : index}> : () -> index
    %2 = "tensor.dim"(%arg0, %0) : (tensor<?x?x?x?xf32>, index) -> index
    %3 = "tensor.dim"(%arg0, %1) : (tensor<?x?x?x?xf32>, index) -> index
    %4 = "tensor.extract_slice"(%arg0, %arg1, %arg2, %2, %3) <{operandSegmentSizes = array<i32: 1, 2, 2, 0>, static_offsets = array<i64: -9223372036854775808, -9223372036854775808, 0, 0>, static_sizes = array<i64: 1, -9223372036854775808, 1, -9223372036854775808>, static_strides = array<i64: 1, 1, 1, 1>}> : (tensor<?x?x?x?xf32>, index, index, index, index) -> tensor<1x?x1x?xf32>
    %5 = "tensor.collapse_shape"(%4) <{reassociation = [[0, 1], [2, 3]]}> : (tensor<1x?x1x?xf32>) -> tensor<?x?xf32>
    "func.return"(%4, %5) : (tensor<1x?x1x?xf32>, tensor<?x?xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x1x1x5xf32>, tensor<?x?x?x?xf32>, index) -> tensor<?x?x?x?xf32>, sym_name = "rank_reducing_insert_of_collapse_shape"}> ({
  ^bb0(%arg0: tensor<?x1x1x5xf32>, %arg1: tensor<?x?x?x?xf32>, %arg2: index):
    %0 = "tensor.collapse_shape"(%arg0) <{reassociation = [[0, 1], [2], [3]]}> : (tensor<?x1x1x5xf32>) -> tensor<?x1x5xf32>
    %1 = "tensor.insert_slice"(%0, %arg1, %arg2) <{operandSegmentSizes = array<i32: 1, 1, 0, 1, 0>, static_offsets = array<i64: 0, 0, 0, 0>, static_sizes = array<i64: -9223372036854775808, 1, 1, 5>, static_strides = array<i64: 1, 1, 1, 1>}> : (tensor<?x1x5xf32>, tensor<?x?x?x?xf32>, index) -> tensor<?x?x?x?xf32>
    "func.return"(%1) : (tensor<?x?x?x?xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x1x1x5xf32>, tensor<?x?x?x?xf32>, index, index) -> tensor<?x?x?x?xf32>, sym_name = "rank_reducing_parallel_insert_of_collapse_shape"}> ({
  ^bb0(%arg0: tensor<?x1x1x5xf32>, %arg1: tensor<?x?x?x?xf32>, %arg2: index, %arg3: index):
    %0 = "tensor.collapse_shape"(%arg0) <{reassociation = [[0, 1], [2], [3]]}> : (tensor<?x1x1x5xf32>) -> tensor<?x1x5xf32>
    %1 = "scf.forall"(%arg3, %arg1) <{operandSegmentSizes = array<i32: 0, 1, 0, 1>, staticLowerBound = array<i64: 0>, staticStep = array<i64: 1>, staticUpperBound = array<i64: -9223372036854775808>}> ({
    ^bb0(%arg4: index, %arg5: tensor<?x?x?x?xf32>):
      "scf.forall.in_parallel"() ({
        "tensor.parallel_insert_slice"(%0, %arg5, %arg2) <{operandSegmentSizes = array<i32: 1, 1, 0, 1, 0>, static_offsets = array<i64: 0, 0, 0, 0>, static_sizes = array<i64: -9223372036854775808, 1, 1, 5>, static_strides = array<i64: 1, 1, 1, 1>}> : (tensor<?x1x5xf32>, tensor<?x?x?x?xf32>, index) -> ()
      }) : () -> ()
    }) : (index, tensor<?x?x?x?xf32>) -> tensor<?x?x?x?xf32>
    "func.return"(%1) : (tensor<?x?x?x?xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?xf32>, tensor<?x?x?x?xf32>, index, index) -> tensor<?x?x?x?xf32>, sym_name = "insert_of_padding_expand_shape"}> ({
  ^bb0(%arg0: tensor<?x?xf32>, %arg1: tensor<?x?x?x?xf32>, %arg2: index, %arg3: index):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index
    %2 = "tensor.dim"(%arg0, %0) : (tensor<?x?xf32>, index) -> index
    %3 = "tensor.dim"(%arg0, %1) : (tensor<?x?xf32>, index) -> index
    %4 = "tensor.expand_shape"(%arg0, %2, %3) <{reassociation = [[0, 1], [2, 3]], static_output_shape = array<i64: 1, -9223372036854775808, 1, -9223372036854775808>}> : (tensor<?x?xf32>, index, index) -> tensor<1x?x1x?xf32>
    %5 = "tensor.insert_slice"(%4, %arg1, %arg2, %arg3, %2, %3) <{operandSegmentSizes = array<i32: 1, 1, 2, 2, 0>, static_offsets = array<i64: -9223372036854775808, -9223372036854775808, 0, 0>, static_sizes = array<i64: 1, -9223372036854775808, 1, -9223372036854775808>, static_strides = array<i64: 1, 1, 1, 1>}> : (tensor<1x?x1x?xf32>, tensor<?x?x?x?xf32>, index, index, index, index) -> tensor<?x?x?x?xf32>
    "func.return"(%5) : (tensor<?x?x?x?xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?xf32>, tensor<?x?x?x?xf32>, index, index, index) -> tensor<?x?x?x?xf32>, sym_name = "insert_of_non_padding_expand_shape"}> ({
  ^bb0(%arg0: tensor<?x?xf32>, %arg1: tensor<?x?x?x?xf32>, %arg2: index, %arg3: index, %arg4: index):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index
    %2 = "tensor.dim"(%arg0, %0) : (tensor<?x?xf32>, index) -> index
    %3 = "tensor.dim"(%arg0, %1) : (tensor<?x?xf32>, index) -> index
    %4 = "tensor.expand_shape"(%arg0, %arg4, %2, %3) <{reassociation = [[0, 1], [2]], static_output_shape = array<i64: -9223372036854775808, -9223372036854775808, -9223372036854775808>}> : (tensor<?x?xf32>, index, index, index) -> tensor<?x?x?xf32>
    %5 = "tensor.insert_slice"(%4, %arg1, %arg2, %arg3, %arg4, %2, %3) <{operandSegmentSizes = array<i32: 1, 1, 2, 3, 0>, static_offsets = array<i64: -9223372036854775808, -9223372036854775808, 0, 0>, static_sizes = array<i64: -9223372036854775808, 1, -9223372036854775808, -9223372036854775808>, static_strides = array<i64: 1, 1, 1, 1>}> : (tensor<?x?x?xf32>, tensor<?x?x?x?xf32>, index, index, index, index, index) -> tensor<?x?x?x?xf32>
    "func.return"(%5) : (tensor<?x?x?x?xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?xf32>, tensor<?x?x?x?xf32>, index, index) -> tensor<?x?x?x?xf32>, sym_name = "parallel_insert_of_padding_expand_shape"}> ({
  ^bb0(%arg0: tensor<?x?xf32>, %arg1: tensor<?x?x?x?xf32>, %arg2: index, %arg3: index):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index
    %2 = "tensor.dim"(%arg0, %0) : (tensor<?x?xf32>, index) -> index
    %3 = "tensor.dim"(%arg0, %1) : (tensor<?x?xf32>, index) -> index
    %4 = "tensor.expand_shape"(%arg0, %2, %3) <{reassociation = [[0, 1], [2, 3]], static_output_shape = array<i64: 1, -9223372036854775808, 1, -9223372036854775808>}> : (tensor<?x?xf32>, index, index) -> tensor<1x?x1x?xf32>
    %5 = "scf.forall"(%arg2, %arg3, %arg1) <{operandSegmentSizes = array<i32: 0, 2, 0, 1>, staticLowerBound = array<i64: 0, 0>, staticStep = array<i64: 1, 1>, staticUpperBound = array<i64: -9223372036854775808, -9223372036854775808>}> ({
    ^bb0(%arg4: index, %arg5: index, %arg6: tensor<?x?x?x?xf32>):
      "scf.forall.in_parallel"() ({
        "tensor.parallel_insert_slice"(%4, %arg6, %arg4, %arg5, %2, %3) <{operandSegmentSizes = array<i32: 1, 1, 2, 2, 0>, static_offsets = array<i64: -9223372036854775808, -9223372036854775808, 0, 0>, static_sizes = array<i64: 1, -9223372036854775808, 1, -9223372036854775808>, static_strides = array<i64: 1, 1, 1, 1>}> : (tensor<1x?x1x?xf32>, tensor<?x?x?x?xf32>, index, index, index, index) -> ()
      }) : () -> ()
    }) : (index, index, tensor<?x?x?x?xf32>) -> tensor<?x?x?x?xf32>
    "func.return"(%5) : (tensor<?x?x?x?xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?xf32>, tensor<?x?x?x?xf32>, index, index, index) -> tensor<?x?x?x?xf32>, sym_name = "parallel_insert_of_non_padding_expand_shape"}> ({
  ^bb0(%arg0: tensor<?x?xf32>, %arg1: tensor<?x?x?x?xf32>, %arg2: index, %arg3: index, %arg4: index):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index
    %2 = "tensor.dim"(%arg0, %0) : (tensor<?x?xf32>, index) -> index
    %3 = "tensor.dim"(%arg0, %1) : (tensor<?x?xf32>, index) -> index
    %4 = "tensor.expand_shape"(%arg0, %arg4, %2, %3) <{reassociation = [[0, 1], [2]], static_output_shape = array<i64: -9223372036854775808, -9223372036854775808, -9223372036854775808>}> : (tensor<?x?xf32>, index, index, index) -> tensor<?x?x?xf32>
    %5 = "scf.forall"(%arg2, %arg3, %arg1) <{operandSegmentSizes = array<i32: 0, 2, 0, 1>, staticLowerBound = array<i64: 0, 0>, staticStep = array<i64: 1, 1>, staticUpperBound = array<i64: -9223372036854775808, -9223372036854775808>}> ({
    ^bb0(%arg5: index, %arg6: index, %arg7: tensor<?x?x?x?xf32>):
      "scf.forall.in_parallel"() ({
        "tensor.parallel_insert_slice"(%4, %arg7, %arg5, %arg6, %arg4, %2, %3) <{operandSegmentSizes = array<i32: 1, 1, 2, 3, 0>, static_offsets = array<i64: -9223372036854775808, -9223372036854775808, 0, 0>, static_sizes = array<i64: -9223372036854775808, 1, -9223372036854775808, -9223372036854775808>, static_strides = array<i64: 1, 1, 1, 1>}> : (tensor<?x?x?xf32>, tensor<?x?x?x?xf32>, index, index, index, index, index) -> ()
      }) : () -> ()
    }) : (index, index, tensor<?x?x?x?xf32>) -> tensor<?x?x?x?xf32>
    "func.return"(%5) : (tensor<?x?x?x?xf32>) -> ()
  }) : () -> ()
}) : () -> ()

