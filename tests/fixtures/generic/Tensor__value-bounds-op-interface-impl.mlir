"builtin.module"() ({
  "func.func"() <{function_type = () -> index, sym_name = "unknown_op"}> ({
    %0 = "test.foo"() : () -> tensor<?x?xf32>
    %1 = "test.reify_bound"(%0) <{dim = 0 : i64, type = "EQ"}> : (tensor<?x?xf32>) -> index
    "func.return"(%1) : (index) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<10xf32>) -> index, sym_name = "cast"}> ({
  ^bb0(%arg0: tensor<10xf32>):
    %0 = "tensor.cast"(%arg0) : (tensor<10xf32>) -> tensor<?xf32>
    %1 = "test.reify_bound"(%0) <{dim = 0 : i64, type = "EQ"}> : (tensor<?xf32>) -> index
    "func.return"(%1) : (index) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<*xf32>) -> index, sym_name = "cast_unranked"}> ({
  ^bb0(%arg0: tensor<*xf32>):
    %0 = "tensor.cast"(%arg0) : (tensor<*xf32>) -> tensor<?xf32>
    %1 = "test.reify_bound"(%0) <{dim = 0 : i64, type = "EQ"}> : (tensor<?xf32>) -> index
    "func.return"(%1) : (index) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?xf32>) -> index, sym_name = "dim"}> ({
  ^bb0(%arg0: tensor<?xf32>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "tensor.dim"(%arg0, %0) : (tensor<?xf32>, index) -> index
    %2 = "test.reify_bound"(%1) <{type = "EQ"}> : (index) -> index
    "func.return"(%2) : (index) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?xf32>, index) -> (), sym_name = "dim_all_positive"}> ({
  ^bb0(%arg0: tensor<?xf32>, %arg1: index):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "tensor.dim"(%arg0, %arg1) : (tensor<?xf32>, index) -> index
    "test.compare"(%1, %0) <{cmp = "GE"}> : (index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index) -> (index, index), sym_name = "empty"}> ({
  ^bb0(%arg0: index):
    %0 = "tensor.empty"(%arg0) : (index) -> tensor<6x?xf32>
    %1 = "test.reify_bound"(%0) <{dim = 0 : i64, type = "EQ"}> : (tensor<6x?xf32>) -> index
    %2 = "test.reify_bound"(%0) <{dim = 1 : i64, type = "EQ"}> : (tensor<6x?xf32>) -> index
    "func.return"(%1, %2) : (index, index) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?xf32>, index) -> index, sym_name = "extract_slice_dynamic"}> ({
  ^bb0(%arg0: tensor<?xf32>, %arg1: index):
    %0 = "tensor.extract_slice"(%arg0, %arg1) <{operandSegmentSizes = array<i32: 1, 0, 1, 0>, static_offsets = array<i64: 2>, static_sizes = array<i64: -9223372036854775808>, static_strides = array<i64: 1>}> : (tensor<?xf32>, index) -> tensor<?xf32>
    %1 = "test.reify_bound"(%0) <{dim = 0 : i64, type = "EQ"}> : (tensor<?xf32>) -> index
    "func.return"(%1) : (index) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?xf32>) -> index, sym_name = "extract_slice_static"}> ({
  ^bb0(%arg0: tensor<?xf32>):
    %0 = "tensor.extract_slice"(%arg0) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_offsets = array<i64: 2>, static_sizes = array<i64: 5>, static_strides = array<i64: 1>}> : (tensor<?xf32>) -> tensor<5xf32>
    %1 = "test.reify_bound"(%0) <{dim = 0 : i64, type = "EQ"}> : (tensor<5xf32>) -> index
    "func.return"(%1) : (index) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?xf32>, index) -> index, sym_name = "extract_slice_dynamic_constant"}> ({
  ^bb0(%arg0: tensor<?xf32>, %arg1: index):
    %0 = "tensor.extract_slice"(%arg0, %arg1) <{operandSegmentSizes = array<i32: 1, 0, 1, 0>, static_offsets = array<i64: 2>, static_sizes = array<i64: -9223372036854775808>, static_strides = array<i64: 1>}> : (tensor<?xf32>, index) -> tensor<?xf32>
    %1 = "test.reify_bound"(%0) <{constant, dim = 0 : i64, type = "EQ"}> : (tensor<?xf32>) -> index
    "func.return"(%1) : (index) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?xf32>) -> index, sym_name = "extract_slice_static_constant"}> ({
  ^bb0(%arg0: tensor<?xf32>):
    %0 = "tensor.extract_slice"(%arg0) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_offsets = array<i64: 2>, static_sizes = array<i64: 5>, static_strides = array<i64: 1>}> : (tensor<?xf32>) -> tensor<5xf32>
    %1 = "test.reify_bound"(%0) <{constant, dim = 0 : i64, type = "EQ"}> : (tensor<5xf32>) -> index
    "func.return"(%1) : (index) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?xf32>, index) -> index, sym_name = "extract_slice_rank_reduce"}> ({
  ^bb0(%arg0: tensor<?x?xf32>, %arg1: index):
    %0 = "tensor.extract_slice"(%arg0, %arg1) <{operandSegmentSizes = array<i32: 1, 0, 1, 0>, static_offsets = array<i64: 0, 2>, static_sizes = array<i64: 1, -9223372036854775808>, static_strides = array<i64: 1, 1>}> : (tensor<?x?xf32>, index) -> tensor<?xf32>
    %1 = "test.reify_bound"(%0) <{dim = 0 : i64, type = "EQ"}> : (tensor<?xf32>) -> index
    "func.return"(%1) : (index) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?xf32>, f32, index) -> index, sym_name = "insert"}> ({
  ^bb0(%arg0: tensor<?xf32>, %arg1: f32, %arg2: index):
    %0 = "tensor.insert"(%arg1, %arg0, %arg2) : (f32, tensor<?xf32>, index) -> tensor<?xf32>
    %1 = "test.reify_bound"(%0) <{dim = 0 : i64, type = "EQ"}> : (tensor<?xf32>) -> index
    "func.return"(%1) : (index) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x7xf32>, index, index) -> (index, index), sym_name = "pad"}> ({
  ^bb0(%arg0: tensor<?x7xf32>, %arg1: index, %arg2: index):
    %0 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %1 = "tensor.pad"(%arg0, %arg1, %arg1, %arg2) <{operandSegmentSizes = array<i32: 1, 1, 2>, static_high = array<i64: -9223372036854775808, -9223372036854775808>, static_low = array<i64: -9223372036854775808, 5>}> ({
    ^bb0(%arg3: index, %arg4: index):
      "tensor.yield"(%0) : (f32) -> ()
    }) : (tensor<?x7xf32>, index, index, index) -> tensor<?x?xf32>
    %2 = "test.reify_bound"(%1) <{dim = 0 : i64, type = "EQ"}> : (tensor<?x?xf32>) -> index
    %3 = "test.reify_bound"(%1) <{dim = 1 : i64, type = "EQ"}> : (tensor<?x?xf32>) -> index
    "func.return"(%2, %3) : (index, index) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<5xf32>) -> index, sym_name = "rank"}> ({
  ^bb0(%arg0: tensor<5xf32>):
    %0 = "tensor.rank"(%arg0) : (tensor<5xf32>) -> index
    %1 = "test.reify_bound"(%0) <{type = "EQ"}> : (index) -> index
    "func.return"(%1) : (index) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?xf32>) -> (), sym_name = "dynamic_dims_are_equal"}> ({
  ^bb0(%arg0: tensor<?xf32>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "tensor.dim"(%arg0, %0) : (tensor<?xf32>, index) -> index
    %2 = "tensor.dim"(%arg0, %0) : (tensor<?xf32>, index) -> index
    "test.compare"(%1, %2) <{cmp = "EQ"}> : (index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?xf32>) -> (), sym_name = "dynamic_dims_are_different"}> ({
  ^bb0(%arg0: tensor<?xf32>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index
    %2 = "tensor.dim"(%arg0, %0) : (tensor<?xf32>, index) -> index
    %3 = "arith.addi"(%2, %1) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
    "test.compare"(%2, %3) <{cmp = "EQ"}> : (index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?xf32>) -> (), sym_name = "dynamic_dims_are_maybe_equal_1"}> ({
  ^bb0(%arg0: tensor<?xf32>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 5 : index}> : () -> index
    %2 = "tensor.dim"(%arg0, %0) : (tensor<?xf32>, index) -> index
    "test.compare"(%2, %1) <{cmp = "EQ"}> : (index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?xf32>) -> (), sym_name = "dynamic_dims_are_maybe_equal_2"}> ({
  ^bb0(%arg0: tensor<?x?xf32>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index
    %2 = "tensor.dim"(%arg0, %0) : (tensor<?x?xf32>, index) -> index
    %3 = "tensor.dim"(%arg0, %1) : (tensor<?x?xf32>, index) -> index
    "test.compare"(%2, %3) <{cmp = "EQ"}> : (index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0) -> (-d0 + 256)>
"builtin.module"() ({
  "func.func"() <{function_type = (f32, index, tensor<64x?x64xf32>) -> (), sym_name = "pad_reification"}> ({
  ^bb0(%arg0: f32, %arg1: index, %arg2: tensor<64x?x64xf32>):
    %0 = "affine.apply"(%arg1) <{map = #map}> : (index) -> index
    %1 = "tensor.extract_slice"(%arg2, %arg1) <{operandSegmentSizes = array<i32: 1, 0, 1, 0>, static_offsets = array<i64: 0, 0, 0>, static_sizes = array<i64: 1, -9223372036854775808, 64>, static_strides = array<i64: 1, 1, 1>}> : (tensor<64x?x64xf32>, index) -> tensor<1x?x64xf32>
    %2 = "tensor.pad"(%1, %0) <{operandSegmentSizes = array<i32: 1, 0, 1>, static_high = array<i64: 0, -9223372036854775808, 0>, static_low = array<i64: 0, 0, 0>}> ({
    ^bb0(%arg3: index, %arg4: index, %arg5: index):
      "tensor.yield"(%arg0) : (f32) -> ()
    }) : (tensor<1x?x64xf32>, index) -> tensor<1x?x64xf32>
    %3 = "test.reify_bound"(%2) <{constant, dim = 1 : i64, type = "EQ"}> : (tensor<1x?x64xf32>) -> index
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index) -> (index, index), sym_name = "tensor_collapse"}> ({
  ^bb0(%arg0: index):
    %0 = "tensor.empty"(%arg0) : (index) -> tensor<3x4x?x2xf32>
    %1 = "tensor.collapse_shape"(%0) <{reassociation = [[0, 1], [2, 3]]}> : (tensor<3x4x?x2xf32>) -> tensor<12x?xf32>
    %2 = "test.reify_bound"(%1) <{dim = 0 : i64, type = "EQ"}> : (tensor<12x?xf32>) -> index
    %3 = "test.reify_bound"(%1) <{dim = 1 : i64, type = "EQ"}> : (tensor<12x?xf32>) -> index
    "func.return"(%2, %3) : (index, index) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?xf32>, index) -> (index, index), sym_name = "tensor_expand"}> ({
  ^bb0(%arg0: tensor<?xf32>, %arg1: index):
    %0 = "tensor.expand_shape"(%arg0, %arg1) <{reassociation = [[0, 1]], static_output_shape = array<i64: 4, -9223372036854775808>}> : (tensor<?xf32>, index) -> tensor<4x?xf32>
    %1 = "test.reify_bound"(%0) <{dim = 0 : i64, type = "EQ"}> : (tensor<4x?xf32>) -> index
    %2 = "test.reify_bound"(%0) <{dim = 1 : i64, type = "EQ"}> : (tensor<4x?xf32>) -> index
    "func.return"(%1, %2) : (index, index) -> ()
  }) : () -> ()
}) : () -> ()

