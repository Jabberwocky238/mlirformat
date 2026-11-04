"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "correct_int_types_success"}> ({
    %0:4 = "test.int_types"() : () -> (i16, si32, ui64, i8)
    %1:4 = "test.int_types"() : () -> (si16, si32, ui64, ui64)
    %2:4 = "test.int_types"() : () -> (ui16, si32, ui64, si128)
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
// -----
// -----
// -----
// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "complex_f64_success"}> ({
    %0 = "test.complex_f64"() : () -> complex<f64>
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "complex_f64_tensor_success"}> ({
    %0 = "test.complex_f64_tensor"() : () -> tensor<complex<f64>>
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "tuple_success"}> ({
    %0 = "test.tuple_32_bit"() : () -> tuple<i32>
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "tuple_mixed_success"}> ({
    %0 = "test.tuple_32_bit"() : () -> tuple<i32, f32>
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "tuple_empty_success"}> ({
    %0 = "test.tuple_32_bit"() : () -> tuple<>
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
// -----
// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "nested_tuple_empty_success"}> ({
    %0 = "test.nested_tuple_32_bit"() : () -> tuple<>
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "nested_tuple_one_level_success"}> ({
    %0 = "test.nested_tuple_32_bit"() : () -> tuple<i32>
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "nested_tuple_multi_level_success"}> ({
    %0 = "test.nested_tuple_32_bit"() : () -> tuple<i32, tuple<i32, tuple<i32>>>
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "nested_tuple_multi_level_mixed_success"}> ({
    %0 = "test.nested_tuple_32_bit"() : () -> tuple<i32, tuple<f32, tuple<i32>>>
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "rank_less_than_2_I8_F32_memref_success"}> ({
    %0 = "test.rank_less_than_2_I8_F32_memref"() : () -> memref<i8>
    %1 = "test.rank_less_than_2_I8_F32_memref"() : () -> memref<3xi8>
    %2 = "test.rank_less_than_2_I8_F32_memref"() : () -> memref<f32>
    %3 = "test.rank_less_than_2_I8_F32_memref"() : () -> memref<1xf32>
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
// -----
// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<f32>, tensor<10xf32>, tensor<20x30xi16>, tensor<40x50x60xi16>, tensor<70x80x90x100xi16>) -> (), sym_name = "nd_tensor_of_success"}> ({
  ^bb0(%arg0: tensor<f32>, %arg1: tensor<10xf32>, %arg2: tensor<20x30xi16>, %arg3: tensor<40x50x60xi16>, %arg4: tensor<70x80x90x100xi16>):
    "test.nd_tensor_of"(%arg0, %arg1, %arg2, %arg3, %arg4) : (tensor<f32>, tensor<10xf32>, tensor<20x30xi16>, tensor<40x50x60xi16>, tensor<70x80x90x100xi16>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
// -----
// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<i8>, tensor<1xi32>, tensor<?x?xf32>) -> (), sym_name = "ranked_tensor_success"}> ({
  ^bb0(%arg0: tensor<i8>, %arg1: tensor<1xi32>, %arg2: tensor<?x?xf32>):
    "test.ranked_tensor_op"(%arg0) : (tensor<i8>) -> ()
    "test.ranked_tensor_op"(%arg1) : (tensor<1xi32>) -> ()
    "test.ranked_tensor_op"(%arg2) : (tensor<?x?xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
// -----
// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<i8>, tensor<i32>, tensor<f32>, tensor<1xi8>, tensor<1xi32>, tensor<1xf32>) -> (), sym_name = "multi_tensor_rank_of_success"}> ({
  ^bb0(%arg0: tensor<i8>, %arg1: tensor<i32>, %arg2: tensor<f32>, %arg3: tensor<1xi8>, %arg4: tensor<1xi32>, %arg5: tensor<1xf32>):
    "test.multi_tensor_rank_of"(%arg0) : (tensor<i8>) -> ()
    "test.multi_tensor_rank_of"(%arg1) : (tensor<i32>) -> ()
    "test.multi_tensor_rank_of"(%arg2) : (tensor<f32>) -> ()
    "test.multi_tensor_rank_of"(%arg3) : (tensor<1xi8>) -> ()
    "test.multi_tensor_rank_of"(%arg4) : (tensor<1xi32>) -> ()
    "test.multi_tensor_rank_of"(%arg5) : (tensor<1xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
// -----
// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<*xi32>, tensor<*xf32>, memref<2x3xi32>, vector<2xf32>) -> (), sym_name = "fixed_element_types"}> ({
  ^bb0(%arg0: tensor<*xi32>, %arg1: tensor<*xf32>, %arg2: memref<2x3xi32>, %arg3: vector<2xf32>):
    %0 = "test.arg_and_res_have_fixed_element_types"(%arg0, %arg1) : (tensor<*xi32>, tensor<*xf32>) -> tensor<*xi16>
    %1 = "test.arg_and_res_have_fixed_element_types"(%arg2, %arg3) : (memref<2x3xi32>, vector<2xf32>) -> memref<1x2xi16>
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
// -----
// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<*xi32>, i32, memref<2x3xi32>) -> (), sym_name = "same_element_types_success"}> ({
  ^bb0(%arg0: tensor<*xi32>, %arg1: i32, %arg2: memref<2x3xi32>):
    "test.operands_have_same_element_type"(%arg0, %arg0) : (tensor<*xi32>, tensor<*xi32>) -> ()
    "test.operands_have_same_element_type"(%arg1, %arg0) : (i32, tensor<*xi32>) -> ()
    "test.operands_have_same_element_type"(%arg1, %arg2) : (i32, memref<2x3xi32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<*xi32>, tensor<*xf32>) -> (), sym_name = "same_element_types_success"}> ({
  ^bb0(%arg0: tensor<*xi32>, %arg1: tensor<*xf32>):
    %0 = "test.operand0_and_result_have_same_element_type"(%arg1, %arg0) : (tensor<*xf32>, tensor<*xi32>) -> tensor<*xf32>
    %1 = "test.operand0_and_result_have_same_element_type"(%arg1, %arg0) : (tensor<*xf32>, tensor<*xi32>) -> memref<2x3xf32>
    %2 = "test.operand0_and_result_have_same_element_type"(%arg1, %arg0) : (tensor<*xf32>, tensor<*xi32>) -> f32
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<*xi32>, tensor<*xf32>) -> (), sym_name = "same_types"}> ({
  ^bb0(%arg0: tensor<*xi32>, %arg1: tensor<*xf32>):
    "test.operands_have_same_type"(%arg0, %arg0) : (tensor<*xi32>, tensor<*xi32>) -> ()
    %0 = "test.operand0_and_result_have_same_type"(%arg0, %arg1) : (tensor<*xi32>, tensor<*xf32>) -> tensor<*xi32>
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
// -----
// -----
// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1xi32>, tensor<2xf32>, memref<3xi32>, tensor<1x2xf32>, tensor<1x2xi32>) -> (), sym_name = "same_rank_success"}> ({
  ^bb0(%arg0: tensor<1xi32>, %arg1: tensor<2xf32>, %arg2: memref<3xi32>, %arg3: tensor<1x2xf32>, %arg4: tensor<1x2xi32>):
    "test.operands_have_same_rank"(%arg0, %arg1) : (tensor<1xi32>, tensor<2xf32>) -> ()
    "test.operands_have_same_rank"(%arg0, %arg2) : (tensor<1xi32>, memref<3xi32>) -> ()
    %0 = "test.operand0_and_result_have_same_rank"(%arg0, %arg3) : (tensor<1xi32>, tensor<1x2xf32>) -> tensor<3xf32>
    %1 = "test.operand0_and_result_have_same_rank"(%arg4, %arg3) : (tensor<1x2xi32>, tensor<1x2xf32>) -> tensor<3x3xf64>
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
// -----
// -----
// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1xi32>, tensor<2xf32>, memref<3xi32>, tensor<1x2xf32>, tensor<*xi32>) -> (), sym_name = "same_rank_if_known_success"}> ({
  ^bb0(%arg0: tensor<1xi32>, %arg1: tensor<2xf32>, %arg2: memref<3xi32>, %arg3: tensor<1x2xf32>, %arg4: tensor<*xi32>):
    %0 = "test.operands_and_result_have_same_rank"(%arg0, %arg1) : (tensor<1xi32>, tensor<2xf32>) -> tensor<3xf64>
    %1 = "test.operands_and_result_have_same_rank"(%arg0, %arg2) : (tensor<1xi32>, memref<3xi32>) -> tensor<3xi64>
    %2 = "test.operands_and_result_have_same_rank"(%arg4, %arg1) : (tensor<*xi32>, tensor<2xf32>) -> tensor<2xf32>
    %3 = "test.operands_and_result_have_same_rank"(%arg3, %arg4) : (tensor<1x2xf32>, tensor<*xi32>) -> tensor<1x2xf64>
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
// -----
// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<2x3xi32>, memref<2x3xf32>, vector<2x3xi32>, tensor<4x5xi32>) -> (), sym_name = "same_shape_success"}> ({
  ^bb0(%arg0: tensor<2x3xi32>, %arg1: memref<2x3xf32>, %arg2: vector<2x3xi32>, %arg3: tensor<4x5xi32>):
    %0 = "test.operand0_and_result_have_same_shape"(%arg0, %arg3) : (tensor<2x3xi32>, tensor<4x5xi32>) -> tensor<2x3xf32>
    %1 = "test.operand0_and_result_have_same_shape"(%arg0, %arg3) : (tensor<2x3xi32>, tensor<4x5xi32>) -> memref<2x3xf32>
    %2 = "test.operand0_and_result_have_same_shape"(%arg0, %arg3) : (tensor<2x3xi32>, tensor<4x5xi32>) -> vector<2x3xf32>
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<36xi32>, tensor<1x2xf32>, tensor<f32>) -> (), sym_name = "same_element_count_success"}> ({
  ^bb0(%arg0: tensor<36xi32>, %arg1: tensor<1x2xf32>, %arg2: tensor<f32>):
    %0 = "test.operand0_and_result_have_same_element_count"(%arg0, %arg1) : (tensor<36xi32>, tensor<1x2xf32>) -> tensor<3x4x3xf32>
    %1 = "test.operand0_and_result_have_same_element_count"(%arg0, %arg1) : (tensor<36xi32>, tensor<1x2xf32>) -> tensor<3x12xf64>
    %2 = "test.operand0_and_result_have_same_element_count"(%arg2, %arg1) : (tensor<f32>, tensor<1x2xf32>) -> memref<1x1x1xi32>
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
// -----
// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1x2x3x4xi32>) -> (), sym_name = "operand_rank_equals_result_size_success"}> ({
  ^bb0(%arg0: tensor<1x2x3x4xi32>):
    %0 = "test.operand_rank_equals_result_size"(%arg0) : (tensor<1x2x3x4xi32>) -> tensor<4xi32>
    %1 = "test.operand_rank_equals_result_size"(%arg0) : (tensor<1x2x3x4xi32>) -> memref<2x2xf32>
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
// -----
// -----
// -----
// -----
// -----
// -----
// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1x2xi32>) -> (), sym_name = "elements_attr_i32"}> ({
  ^bb0(%arg0: tensor<1x2xi32>):
    "test.i32ElementsAttr"() <{attr = dense<[1, 2]> : tensor<2xi32>}> : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "elements_attr_index"}> ({
    "test.indexElementsAttr"() <{attr = dense<[1, 2]> : tensor<2xindex>}> : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "struct_success"}> ({
    %0 = "test.simple_struct"() : () -> !test.struct<{a,i32}, {b,f64}>
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "struct_with_field_names_like_types"}> ({
    %0 = "test.struct_with_field_names_like_types"() : () -> !test.struct<{i32,i32}, {f64,f64}>
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
