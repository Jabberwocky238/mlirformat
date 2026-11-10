"builtin.module"() ({
  "func.func"() <{function_type = (!spirv.array<16 x f32>, !spirv.array<8 x i32>) -> (), sym_name = "scalar_array_type", sym_visibility = "private"}> ({
  }) : () -> ()
  "func.func"() <{function_type = (!spirv.array<32 x vector<4xf32>>) -> (), sym_name = "vector_array_type", sym_visibility = "private"}> ({
  }) : () -> ()
  "func.func"() <{function_type = (!spirv.array<4 x !spirv.array<4 x f32, stride=4>, stride=128>) -> (), sym_name = "array_type_stride", sym_visibility = "private"}> ({
  }) : () -> ()
  "func.func"() <{function_type = (!spirv.array<32 x vector<4xbf16>>) -> (), sym_name = "vector_array_type_bf16", sym_visibility = "private"}> ({
  }) : () -> ()
  "func.func"() <{function_type = (!spirv.array<16 x f16>, !spirv.array<16 x f64>) -> (), sym_name = "scalar_array_type_f64", sym_visibility = "private"}> ({
  }) : () -> ()
  "func.func"() <{function_type = (!spirv.array<16 x f8E4M3FN>, !spirv.array<16 x f8E5M2>) -> (), sym_name = "scalar_array_type_f8", sym_visibility = "private"}> ({
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
// -----
// -----
// -----
// -----
// -----
// -----
// -----
// -----
"builtin.module"() ({
  "func.func"() <{function_type = (!spirv.ptr<i1, Uniform>) -> (), sym_name = "bool_ptr_type", sym_visibility = "private"}> ({
  }) : () -> ()
  "func.func"() <{function_type = (!spirv.ptr<f32, Uniform>) -> (), sym_name = "scalar_ptr_type", sym_visibility = "private"}> ({
  }) : () -> ()
  "func.func"() <{function_type = (!spirv.ptr<vector<4xi32>, PushConstant>) -> (), sym_name = "vector_ptr_type", sym_visibility = "private"}> ({
  }) : () -> ()
}) : () -> ()

// -----
// -----
// -----
// -----
// -----
// -----
// -----
"builtin.module"() ({
  "func.func"() <{function_type = (!spirv.rtarray<f32>, !spirv.rtarray<i32>) -> (), sym_name = "scalar_runtime_array_type", sym_visibility = "private"}> ({
  }) : () -> ()
  "func.func"() <{function_type = (!spirv.rtarray<vector<4xf32>>) -> (), sym_name = "vector_runtime_array_type", sym_visibility = "private"}> ({
  }) : () -> ()
  "func.func"() <{function_type = (!spirv.rtarray<f32, stride=4>) -> (), sym_name = "runtime_array_type_stride", sym_visibility = "private"}> ({
  }) : () -> ()
}) : () -> ()

// -----
// -----
// -----
// -----
// -----
"builtin.module"() ({
  "func.func"() <{function_type = (!spirv.image<f32, Dim1D, NoDepth, NonArrayed, SingleSampled, SamplerUnknown, Unknown>) -> (), sym_name = "image_parameters_1D", sym_visibility = "private"}> ({
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
// -----
// -----
// -----
// -----
// -----
"builtin.module"() ({
  "func.func"() <{function_type = (!spirv.sampler) -> (), sym_name = "sampler_type", sym_visibility = "private"}> ({
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (!spirv.sampled_image<!spirv.image<f32, Dim1D, NoDepth, NonArrayed, SingleSampled, NoSampler, Unknown>>) -> (), sym_name = "sampled_image_type", sym_visibility = "private"}> ({
  }) : () -> ()
}) : () -> ()

// -----
// -----
// -----
// -----
"builtin.module"() ({
  "func.func"() <{function_type = (!spirv.struct<(f32)>) -> (), sym_name = "struct_type", sym_visibility = "private"}> ({
  }) : () -> ()
  "func.func"() <{function_type = (!spirv.struct<(f32 [0])>) -> (), sym_name = "struct_type2", sym_visibility = "private"}> ({
  }) : () -> ()
  "func.func"() <{function_type = (!spirv.struct<(f32, !spirv.image<f32, Dim1D, NoDepth, NonArrayed, SingleSampled, SamplerUnknown, Unknown>)>) -> (), sym_name = "struct_type_simple", sym_visibility = "private"}> ({
  }) : () -> ()
  "func.func"() <{function_type = (!spirv.struct<(f32 [0], i32 [4])>) -> (), sym_name = "struct_type_with_offset", sym_visibility = "private"}> ({
  }) : () -> ()
  "func.func"() <{function_type = (!spirv.struct<(f32, !spirv.struct<(f32, i32)>)>) -> (), sym_name = "nested_struct", sym_visibility = "private"}> ({
  }) : () -> ()
  "func.func"() <{function_type = (!spirv.struct<(f32 [0], !spirv.struct<(f32 [0], i32 [4])> [4])>) -> (), sym_name = "nested_struct_with_offset", sym_visibility = "private"}> ({
  }) : () -> ()
  "func.func"() <{function_type = (!spirv.struct<(f32 [NonWritable])>) -> (), sym_name = "struct_type_with_decoration", sym_visibility = "private"}> ({
  }) : () -> ()
  "func.func"() <{function_type = (!spirv.struct<(f32 [0, NonWritable])>) -> (), sym_name = "struct_type_with_decoration_and_offset", sym_visibility = "private"}> ({
  }) : () -> ()
  "func.func"() <{function_type = (!spirv.struct<(f32 [NonWritable], i32 [NonReadable])>) -> (), sym_name = "struct_type_with_decoration2", sym_visibility = "private"}> ({
  }) : () -> ()
  "func.func"() <{function_type = (!spirv.struct<(f32, i32 [NonReadable])>) -> (), sym_name = "struct_type_with_decoration3", sym_visibility = "private"}> ({
  }) : () -> ()
  "func.func"() <{function_type = (!spirv.struct<(f32 [0], i32 [4, NonReadable])>) -> (), sym_name = "struct_type_with_decoration4", sym_visibility = "private"}> ({
  }) : () -> ()
  "func.func"() <{function_type = (!spirv.struct<(f32 [NonWritable, NonReadable])>) -> (), sym_name = "struct_type_with_decoration5", sym_visibility = "private"}> ({
  }) : () -> ()
  "func.func"() <{function_type = (!spirv.struct<(f32, !spirv.struct<(i32 [NonWritable, NonReadable])>)>) -> (), sym_name = "struct_type_with_decoration6", sym_visibility = "private"}> ({
  }) : () -> ()
  "func.func"() <{function_type = (!spirv.struct<(f32 [0], !spirv.struct<(i32, f32 [NonReadable])> [4])>) -> (), sym_name = "struct_type_with_decoration7", sym_visibility = "private"}> ({
  }) : () -> ()
  "func.func"() <{function_type = (!spirv.struct<(f32, !spirv.struct<(i32 [0], f32 [4, NonReadable])>)>) -> (), sym_name = "struct_type_with_decoration8", sym_visibility = "private"}> ({
  }) : () -> ()
  "func.func"() <{function_type = (!spirv.struct<(!spirv.matrix<3 x vector<3xf32>> [0, ColMajor, MatrixStride=16])>) -> (), sym_name = "struct_type_with_matrix_1", sym_visibility = "private"}> ({
  }) : () -> ()
  "func.func"() <{function_type = (!spirv.struct<(!spirv.matrix<3 x vector<3xf32>> [0, RowMajor, MatrixStride=16])>) -> (), sym_name = "struct_type_with_matrix_2", sym_visibility = "private"}> ({
  }) : () -> ()
  "func.func"() <{function_type = (!spirv.struct<()>) -> (), sym_name = "struct_empty", sym_visibility = "private"}> ({
  }) : () -> ()
  "func.func"() <{function_type = (!spirv.struct<(vector<4xf32> [BuiltIn=0], f32 [BuiltIn=1]), Block>) -> (), sym_name = "struct_block", sym_visibility = "private"}> ({
  }) : () -> ()
  "func.func"() <{function_type = (!spirv.struct<(vector<4xf32> [BuiltIn=0], f32 [BuiltIn=1]), Block, CPacked>) -> (), sym_name = "struct_two_dec", sym_visibility = "private"}> ({
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
// -----
// -----
// -----
// -----
// -----
// -----
"builtin.module"() ({
  "func.func"() <{function_type = (!spirv.struct<empty, ()>) -> (), sym_name = "id_struct_empty", sym_visibility = "private"}> ({
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (!spirv.struct<simple, (f32)>) -> (), sym_name = "id_struct_simple", sym_visibility = "private"}> ({
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (!spirv.struct<multi_elements, (f32, i32)>) -> (), sym_name = "id_struct_multiple_elements", sym_visibility = "private"}> ({
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (!spirv.struct<a1, (!spirv.struct<()>)>) -> (), sym_name = "id_struct_nested_literal", sym_visibility = "private"}> ({
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (!spirv.struct<a2, (!spirv.struct<b2, ()>)>) -> (), sym_name = "id_struct_nested_id", sym_visibility = "private"}> ({
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (!spirv.struct<(!spirv.struct<a3, ()>)>) -> (), sym_name = "literal_struct_nested_id", sym_visibility = "private"}> ({
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (!spirv.struct<a4, (!spirv.ptr<!spirv.struct<a4>, Uniform>)>) -> (), sym_name = "id_struct_self_recursive", sym_visibility = "private"}> ({
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (!spirv.struct<a5, (i32, !spirv.ptr<!spirv.struct<a5>, Uniform>)>) -> (), sym_name = "id_struct_self_recursive2", sym_visibility = "private"}> ({
  }) : () -> ()
}) : () -> ()

// -----
// -----
// -----
// -----
"builtin.module"() ({
  "func.func"() <{function_type = (!spirv.struct<a9, (!spirv.ptr<!spirv.struct<b9, (!spirv.ptr<!spirv.struct<a9>, Uniform>)>, Uniform>)>) -> (), sym_name = "id_struct_recursive", sym_visibility = "private"}> ({
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (!spirv.struct<a10, (!spirv.ptr<!spirv.struct<b10, (!spirv.ptr<!spirv.struct<a10>, Uniform>, !spirv.ptr<!spirv.struct<b10>, Uniform>)>, Uniform>)>) -> (), sym_name = "id_struct_recursive", sym_visibility = "private"}> ({
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (!spirv.coopmatrix<8x16xi32, Subgroup, MatrixA>, !spirv.coopmatrix<8x8xf32, Workgroup, MatrixB>, !spirv.coopmatrix<4x8xf32, Workgroup, MatrixAcc>) -> (), sym_name = "coop_matrix_types", sym_visibility = "private"}> ({
  }) : () -> ()
  "func.func"() <{function_type = (!spirv.coopmatrix<8x16xf8E4M3FN, Subgroup, MatrixA>) -> (), sym_name = "coop_matrix_types_f8E4M3FN", sym_visibility = "private"}> ({
  }) : () -> ()
  "func.func"() <{function_type = (!spirv.coopmatrix<8x16xf8E5M2, Subgroup, MatrixA>) -> (), sym_name = "coop_matrix_types_f8E5M2", sym_visibility = "private"}> ({
  }) : () -> ()
  "func.func"() <{function_type = (!spirv.coopmatrix<8x16xbf16, Subgroup, MatrixA>) -> (), sym_name = "coop_matrix_types_bf16", sym_visibility = "private"}> ({
  }) : () -> ()
}) : () -> ()

// -----
// -----
// -----
// -----
// -----
// -----
// -----
"builtin.module"() ({
  "func.func"() <{function_type = (!spirv.matrix<2 x vector<2xf16>>) -> (), sym_name = "matrix_type", sym_visibility = "private"}> ({
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (!spirv.matrix<3 x vector<3xf32>>) -> (), sym_name = "matrix_type", sym_visibility = "private"}> ({
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (!spirv.matrix<4 x vector<4xf16>>) -> (), sym_name = "matrix_type", sym_visibility = "private"}> ({
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (!spirv.struct<(!spirv.matrix<3 x vector<3xf32>> [0])>) -> (), sym_name = "matrix_type", sym_visibility = "private"}> ({
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
// -----
// -----
// -----
// -----
// -----
// -----
"builtin.module"() ({
  "func.func"() <{function_type = (f8E4M3FN) -> (), sym_name = "type_f8E4M3FN", sym_visibility = "private"}> ({
  }) : () -> ()
  "func.func"() <{function_type = (vector<4xf8E4M3FN>) -> (), sym_name = "vector_type_f8E4M3FN", sym_visibility = "private"}> ({
  }) : () -> ()
  "func.func"() <{function_type = (f8E5M2) -> (), sym_name = "type_f8E5M2", sym_visibility = "private"}> ({
  }) : () -> ()
  "func.func"() <{function_type = (vector<4xf8E5M2>) -> (), sym_name = "vector_type_f8E5M2", sym_visibility = "private"}> ({
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (!spirv.arm.tensor<1xi32>) -> (), sym_name = "arm_tensor_type_single_dim_i32", sym_visibility = "private"}> ({
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (!spirv.arm.tensor<1x2x3xi32>) -> (), sym_name = "arm_tensor_type_multi_dim_i32", sym_visibility = "private"}> ({
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (!spirv.arm.tensor<1xf16>) -> (), sym_name = "arm_tensor_type_single_dim_f16", sym_visibility = "private"}> ({
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (!spirv.arm.tensor<1x2x3xf16>) -> (), sym_name = "arm_tensor_type_multi_dim_f16", sym_visibility = "private"}> ({
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (!spirv.arm.tensor<?xi32>) -> (), sym_name = "arm_tensor_type_dynamic_dim", sym_visibility = "private"}> ({
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (!spirv.arm.tensor<?x?xi32>) -> (), sym_name = "arm_tensor_type_dynamic_dim_2", sym_visibility = "private"}> ({
  }) : () -> ()
}) : () -> ()

// -----
// -----
// -----
"builtin.module"() ({
  "func.func"() <{function_type = (!spirv.arm.tensor<*xi32>) -> (), sym_name = "arm_tensor_type_unranked", sym_visibility = "private"}> ({
  }) : () -> ()
}) : () -> ()

// -----
// -----
"builtin.module"() ({
  "func.func"() <{function_type = (!spirv.arm.tensor<2x3xbf16>) -> (), sym_name = "arm_tensor_type_bf16", sym_visibility = "private"}> ({
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (!spirv.arm.tensor<2x3xf8E4M3FN>) -> (), sym_name = "arm_tensor_type_fp8e4m3fn", sym_visibility = "private"}> ({
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (!spirv.arm.tensor<2x3xf8E5M2>) -> (), sym_name = "arm_tensor_type_fp8e5m2", sym_visibility = "private"}> ({
  }) : () -> ()
}) : () -> ()

