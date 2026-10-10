"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "replace_op_with_op_of_same_type"}> ({
    %0 = "test.foo"() {replaced} : () -> tensor<5xf32>
    %1 = "test.foo"() {replacement_0 = 0 : i64} : () -> tensor<5xf32>
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "replace_op_with_op_of_different_type"}> ({
    %0 = "tensor.empty"() {replaced} : () -> tensor<5xf32>
    %1 = "test.foo"() {replacement_0 = 0 : i64} : () -> tensor<5xf32>
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "multi_result_replacement"}> ({
    %0:2 = "test.foo"() {replaced} : () -> (tensor<5xf32>, tensor<6xf32>)
    %1:2 = "test.foo"() {replacement_0 = 0 : i64, replacement_1 = 1 : i64} : () -> (tensor<5xf32>, tensor<6xf32>)
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "multi_result_replacement_with_multiple_ops"}> ({
    %0:2 = "test.foo"() {replaced} : () -> (tensor<5xf32>, tensor<6xf32>)
    %1:2 = "test.foo"() {replacement_0 = 0 : i64} : () -> (tensor<5xf32>, tensor<6xf32>)
    %2:2 = "test.foo"() {replacement_1 = 1 : i64} : () -> (tensor<5xf32>, tensor<6xf32>)
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "replacement_wrapped_in_cast"}> ({
    %0 = "test.foo"() {replaced} : () -> tensor<5xf32>
    %1 = "test.foo"() : () -> tensor<?xf32>
    %2 = "tensor.cast"(%1) {replacement_0 = 0 : i64} : (tensor<?xf32>) -> tensor<5xf32>
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "replacement_wrapped_in_chain_of_casts"}> ({
    %0 = "test.foo"() {replaced} : () -> tensor<5xf32>
    %1 = "test.foo"() : () -> tensor<?xf32>
    %2 = "tensor.cast"(%1) : (tensor<?xf32>) -> tensor<5xf32>
    %3 = "tensor.cast"(%2) : (tensor<5xf32>) -> tensor<?xf32>
    %4 = "tensor.cast"(%3) {replacement_0 = 0 : i64} : (tensor<?xf32>) -> tensor<5xf32>
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1x5xf32>) -> (), sym_name = "cast_like_insert_slice"}> ({
  ^bb0(%arg0: tensor<1x5xf32>):
    %0 = "test.foo"() {replaced} : () -> tensor<5xf32>
    %1 = "test.foo"() : () -> tensor<5xf32>
    %2 = "tensor.insert_slice"(%1, %arg0) <{operandSegmentSizes = array<i32: 1, 1, 0, 0, 0>, static_offsets = array<i64: 0, 0>, static_sizes = array<i64: 1, 5>, static_strides = array<i64: 1, 1>}> {replacement_0 = 0 : i64} : (tensor<5xf32>, tensor<1x5xf32>) -> tensor<1x5xf32>
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<7xf32>) -> (), sym_name = "non_cast_like_insert_slice"}> ({
  ^bb0(%arg0: tensor<7xf32>):
    %0 = "test.foo"() {replaced} : () -> tensor<5xf32>
    %1 = "test.foo"() : () -> tensor<5xf32>
    %2 = "tensor.insert_slice"(%1, %arg0) <{operandSegmentSizes = array<i32: 1, 1, 0, 0, 0>, static_offsets = array<i64: 0>, static_sizes = array<i64: 5>, static_strides = array<i64: 1>}> {replacement_0 = 0 : i64} : (tensor<5xf32>, tensor<7xf32>) -> tensor<7xf32>
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1x?x1xf32>, f32, index) -> (), sym_name = "cast_like_insert_slice_dynamic"}> ({
  ^bb0(%arg0: tensor<1x?x1xf32>, %arg1: f32, %arg2: index):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "tensor.insert"(%arg1, %arg0, %0, %arg2, %0) {replaced} : (f32, tensor<1x?x1xf32>, index, index, index) -> tensor<1x?x1xf32>
    %2 = "arith.constant"() <{value = 1 : index}> : () -> index
    %3 = "tensor.dim"(%arg0, %2) : (tensor<1x?x1xf32>, index) -> index
    %4 = "tensor.extract_slice"(%arg0, %3) <{operandSegmentSizes = array<i32: 1, 0, 1, 0>, static_offsets = array<i64: 0, 0, 0>, static_sizes = array<i64: 1, -9223372036854775808, 1>, static_strides = array<i64: 1, 1, 1>}> : (tensor<1x?x1xf32>, index) -> tensor<?xf32>
    %5 = "tensor.insert"(%arg1, %4, %0) : (f32, tensor<?xf32>, index) -> tensor<?xf32>
    %6 = "tensor.dim"(%4, %0) : (tensor<?xf32>, index) -> index
    %7 = "tensor.insert_slice"(%5, %arg0, %6) <{operandSegmentSizes = array<i32: 1, 1, 0, 1, 0>, static_offsets = array<i64: 0, 0, 0>, static_sizes = array<i64: 1, -9223372036854775808, 1>, static_strides = array<i64: 1, 1, 1>}> {replacement_0 = 0 : i64} : (tensor<?xf32>, tensor<1x?x1xf32>, index) -> tensor<1x?x1xf32>
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "cast_like_extract_slice"}> ({
    %0 = "test.foo"() {replaced} : () -> tensor<5xf32>
    %1 = "test.foo"() : () -> tensor<1x5x1x1xf32>
    %2 = "tensor.extract_slice"(%1) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_offsets = array<i64: 0, 0, 0, 0>, static_sizes = array<i64: 1, 5, 1, 1>, static_strides = array<i64: 1, 1, 1, 1>}> {replacement_0 = 0 : i64} : (tensor<1x5x1x1xf32>) -> tensor<5xf32>
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "cast_like_extract_slice_dynamic"}> ({
    %0 = "test.foo"() {replaced} : () -> tensor<?xf32>
    %1 = "test.foo"() : () -> tensor<1x?x1x1xf32>
    %2 = "arith.constant"() <{value = 1 : index}> : () -> index
    %3 = "tensor.dim"(%1, %2) : (tensor<1x?x1x1xf32>, index) -> index
    %4 = "tensor.extract_slice"(%1, %3) <{operandSegmentSizes = array<i32: 1, 0, 1, 0>, static_offsets = array<i64: 0, 0, 0, 0>, static_sizes = array<i64: 1, -9223372036854775808, 1, 1>, static_strides = array<i64: 1, 1, 1, 1>}> {replacement_0 = 0 : i64} : (tensor<1x?x1x1xf32>, index) -> tensor<?xf32>
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "non_cast_like_extract_slice"}> ({
    %0 = "test.foo"() {replaced} : () -> tensor<5xf32>
    %1 = "test.foo"() : () -> tensor<1x5x1x1xf32>
    %2 = "tensor.extract_slice"(%1) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_offsets = array<i64: 0, 0, 0, 0>, static_sizes = array<i64: 1, 3, 1, 1>, static_strides = array<i64: 1, 1, 1, 1>}> {replacement_0 = 0 : i64} : (tensor<1x5x1x1xf32>) -> tensor<3xf32>
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "non_cast_like_extract_slice_drop_non_unit_dim"}> ({
    %0 = "test.foo"() {replaced} : () -> tensor<f32>
    %1 = "test.foo"() : () -> tensor<1x5x1x1xf32>
    %2 = "tensor.extract_slice"(%1) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_offsets = array<i64: 0, 0, 0, 0>, static_sizes = array<i64: 1, 1, 1, 1>, static_strides = array<i64: 1, 1, 1, 1>}> {replacement_0 = 0 : i64} : (tensor<1x5x1x1xf32>) -> tensor<f32>
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

