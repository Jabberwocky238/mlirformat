module {
  spirv.func @array(!spirv.array<16 x f32>, !spirv.array<32 x vector<4xf32>>) "None"
  spirv.func @array_with_natural_stride(!spirv.array<16 x f32, stride=4>) "None"
  spirv.func @pointer_scalar(!spirv.ptr<i1, Uniform>, !spirv.ptr<f32, Private>) "None"
  spirv.func @pointer_vector(!spirv.ptr<vector<4xi32>, Function>) "None"
  spirv.func @runtime_array_vector(!spirv.rtarray<vector<4xf32>>) "None"
  spirv.func @runtime_array_scalar(!spirv.rtarray<f32>) "None"
  spirv.func @struct(!spirv.struct<(f64)>) "None"
  spirv.func @struct_nested(!spirv.struct<(i32, !spirv.struct<(i64, i32)>)>) "None"
  spirv.func @struct_with_natural_offset(!spirv.struct<(i8 [0], i32 [4])>) "None"
}

