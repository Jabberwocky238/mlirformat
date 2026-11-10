module {
  func.func private @scalar_array_type(!spirv.array<16 x f32>, !spirv.array<8 x i32>)
  func.func private @vector_array_type(!spirv.array<32 x vector<4xf32>>)
  func.func private @array_type_stride(!spirv.array<4 x !spirv.array<4 x f32, stride=4>, stride=128>)
  func.func private @vector_array_type_bf16(!spirv.array<32 x vector<4xbf16>>)
  func.func private @scalar_array_type_f64(!spirv.array<16 x f16>, !spirv.array<16 x f64>)
  func.func private @scalar_array_type_f8(!spirv.array<16 x f8E4M3FN>, !spirv.array<16 x f8E5M2>)
}

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
module {
  func.func private @bool_ptr_type(!spirv.ptr<i1, Uniform>)
  func.func private @scalar_ptr_type(!spirv.ptr<f32, Uniform>)
  func.func private @vector_ptr_type(!spirv.ptr<vector<4xi32>, PushConstant>)
}

// -----
// -----
// -----
// -----
// -----
// -----
// -----
module {
  func.func private @scalar_runtime_array_type(!spirv.rtarray<f32>, !spirv.rtarray<i32>)
  func.func private @vector_runtime_array_type(!spirv.rtarray<vector<4xf32>>)
  func.func private @runtime_array_type_stride(!spirv.rtarray<f32, stride=4>)
}

// -----
// -----
// -----
// -----
// -----
module {
  func.func private @image_parameters_1D(!spirv.image<f32, Dim1D, NoDepth, NonArrayed, SingleSampled, SamplerUnknown, Unknown>)
}

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
module {
  func.func private @sampler_type(!spirv.sampler)
}

// -----
module {
  func.func private @sampled_image_type(!spirv.sampled_image<!spirv.image<f32, Dim1D, NoDepth, NonArrayed, SingleSampled, NoSampler, Unknown>>)
}

// -----
// -----
// -----
// -----
module {
  func.func private @struct_type(!spirv.struct<(f32)>)
  func.func private @struct_type2(!spirv.struct<(f32 [0])>)
  func.func private @struct_type_simple(!spirv.struct<(f32, !spirv.image<f32, Dim1D, NoDepth, NonArrayed, SingleSampled, SamplerUnknown, Unknown>)>)
  func.func private @struct_type_with_offset(!spirv.struct<(f32 [0], i32 [4])>)
  func.func private @nested_struct(!spirv.struct<(f32, !spirv.struct<(f32, i32)>)>)
  func.func private @nested_struct_with_offset(!spirv.struct<(f32 [0], !spirv.struct<(f32 [0], i32 [4])> [4])>)
  func.func private @struct_type_with_decoration(!spirv.struct<(f32 [NonWritable])>)
  func.func private @struct_type_with_decoration_and_offset(!spirv.struct<(f32 [0, NonWritable])>)
  func.func private @struct_type_with_decoration2(!spirv.struct<(f32 [NonWritable], i32 [NonReadable])>)
  func.func private @struct_type_with_decoration3(!spirv.struct<(f32, i32 [NonReadable])>)
  func.func private @struct_type_with_decoration4(!spirv.struct<(f32 [0], i32 [4, NonReadable])>)
  func.func private @struct_type_with_decoration5(!spirv.struct<(f32 [NonWritable, NonReadable])>)
  func.func private @struct_type_with_decoration6(!spirv.struct<(f32, !spirv.struct<(i32 [NonWritable, NonReadable])>)>)
  func.func private @struct_type_with_decoration7(!spirv.struct<(f32 [0], !spirv.struct<(i32, f32 [NonReadable])> [4])>)
  func.func private @struct_type_with_decoration8(!spirv.struct<(f32, !spirv.struct<(i32 [0], f32 [4, NonReadable])>)>)
  func.func private @struct_type_with_matrix_1(!spirv.struct<(!spirv.matrix<3 x vector<3xf32>> [0, ColMajor, MatrixStride=16])>)
  func.func private @struct_type_with_matrix_2(!spirv.struct<(!spirv.matrix<3 x vector<3xf32>> [0, RowMajor, MatrixStride=16])>)
  func.func private @struct_empty(!spirv.struct<()>)
  func.func private @struct_block(!spirv.struct<(vector<4xf32> [BuiltIn=0], f32 [BuiltIn=1]), Block>)
  func.func private @struct_two_dec(!spirv.struct<(vector<4xf32> [BuiltIn=0], f32 [BuiltIn=1]), Block, CPacked>)
}

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
module {
  func.func private @id_struct_empty(!spirv.struct<empty, ()>)
}

// -----
module {
  func.func private @id_struct_simple(!spirv.struct<simple, (f32)>)
}

// -----
module {
  func.func private @id_struct_multiple_elements(!spirv.struct<multi_elements, (f32, i32)>)
}

// -----
module {
  func.func private @id_struct_nested_literal(!spirv.struct<a1, (!spirv.struct<()>)>)
}

// -----
module {
  func.func private @id_struct_nested_id(!spirv.struct<a2, (!spirv.struct<b2, ()>)>)
}

// -----
module {
  func.func private @literal_struct_nested_id(!spirv.struct<(!spirv.struct<a3, ()>)>)
}

// -----
module {
  func.func private @id_struct_self_recursive(!spirv.struct<a4, (!spirv.ptr<!spirv.struct<a4>, Uniform>)>)
}

// -----
module {
  func.func private @id_struct_self_recursive2(!spirv.struct<a5, (i32, !spirv.ptr<!spirv.struct<a5>, Uniform>)>)
}

// -----
// -----
// -----
// -----
module {
  func.func private @id_struct_recursive(!spirv.struct<a9, (!spirv.ptr<!spirv.struct<b9, (!spirv.ptr<!spirv.struct<a9>, Uniform>)>, Uniform>)>)
}

// -----
module {
  func.func private @id_struct_recursive(!spirv.struct<a10, (!spirv.ptr<!spirv.struct<b10, (!spirv.ptr<!spirv.struct<a10>, Uniform>, !spirv.ptr<!spirv.struct<b10>, Uniform>)>, Uniform>)>)
}

// -----
module {
  func.func private @coop_matrix_types(!spirv.coopmatrix<8x16xi32, Subgroup, MatrixA>, !spirv.coopmatrix<8x8xf32, Workgroup, MatrixB>, !spirv.coopmatrix<4x8xf32, Workgroup, MatrixAcc>)
  func.func private @coop_matrix_types_f8E4M3FN(!spirv.coopmatrix<8x16xf8E4M3FN, Subgroup, MatrixA>)
  func.func private @coop_matrix_types_f8E5M2(!spirv.coopmatrix<8x16xf8E5M2, Subgroup, MatrixA>)
  func.func private @coop_matrix_types_bf16(!spirv.coopmatrix<8x16xbf16, Subgroup, MatrixA>)
}

// -----
// -----
// -----
// -----
// -----
// -----
// -----
module {
  func.func private @matrix_type(!spirv.matrix<2 x vector<2xf16>>)
}

// -----
module {
  func.func private @matrix_type(!spirv.matrix<3 x vector<3xf32>>)
}

// -----
module {
  func.func private @matrix_type(!spirv.matrix<4 x vector<4xf16>>)
}

// -----
module {
  func.func private @matrix_type(!spirv.struct<(!spirv.matrix<3 x vector<3xf32>> [0])>)
}

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
module {
  func.func private @type_f8E4M3FN(f8E4M3FN)
  func.func private @vector_type_f8E4M3FN(vector<4xf8E4M3FN>)
  func.func private @type_f8E5M2(f8E5M2)
  func.func private @vector_type_f8E5M2(vector<4xf8E5M2>)
}

// -----
module {
  func.func private @arm_tensor_type_single_dim_i32(!spirv.arm.tensor<1xi32>)
}

// -----
module {
  func.func private @arm_tensor_type_multi_dim_i32(!spirv.arm.tensor<1x2x3xi32>)
}

// -----
module {
  func.func private @arm_tensor_type_single_dim_f16(!spirv.arm.tensor<1xf16>)
}

// -----
module {
  func.func private @arm_tensor_type_multi_dim_f16(!spirv.arm.tensor<1x2x3xf16>)
}

// -----
module {
  func.func private @arm_tensor_type_dynamic_dim(!spirv.arm.tensor<?xi32>)
}

// -----
module {
  func.func private @arm_tensor_type_dynamic_dim_2(!spirv.arm.tensor<?x?xi32>)
}

// -----
// -----
// -----
module {
  func.func private @arm_tensor_type_unranked(!spirv.arm.tensor<*xi32>)
}

// -----
// -----
module {
  func.func private @arm_tensor_type_bf16(!spirv.arm.tensor<2x3xbf16>)
}

// -----
module {
  func.func private @arm_tensor_type_fp8e4m3fn(!spirv.arm.tensor<2x3xf8E4M3FN>)
}

// -----
module {
  func.func private @arm_tensor_type_fp8e5m2(!spirv.arm.tensor<2x3xf8E5M2>)
}

