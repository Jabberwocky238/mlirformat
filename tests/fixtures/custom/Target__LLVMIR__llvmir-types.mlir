module {
  llvm.func @return_void()
  llvm.func @return_half() -> f16
  llvm.func @return_bfloat() -> bf16
  llvm.func @return_float() -> f32
  llvm.func @return_double() -> f64
  llvm.func @return_fp128() -> f128
  llvm.func @return_x86_fp80() -> f80
  llvm.func @return_ppc_fp128() -> !llvm.ppc_fp128
  llvm.func @f_void_i32(i32)
  llvm.func @f_i32_empty() -> i32
  llvm.func @f_i32_half_bfloat_float_double(f16, bf16, f32, f64) -> i32
  llvm.func @f_i32_i32_i32(i32, i32) -> i32
  llvm.func @f_void_variadic(...)
  llvm.func @f_void_i32_i32_variadic(i32, i32, ...)
  llvm.func @f_f_i32_i32() -> !llvm.ptr
  llvm.func @return_i1() -> i1
  llvm.func @return_i8() -> i8
  llvm.func @return_i16() -> i16
  llvm.func @return_i32() -> i32
  llvm.func @return_i64() -> i64
  llvm.func @return_i57() -> i57
  llvm.func @return_i129() -> i129
  llvm.func @return_p() -> !llvm.ptr
  llvm.func @return_p_1() -> !llvm.ptr<1>
  llvm.func @return_p_42() -> !llvm.ptr<42>
  llvm.func @return_v4_i32() -> vector<4xi32>
  llvm.func @return_v4_float() -> vector<4xf32>
  llvm.func @return_vs_4_float() -> vector<[4]xf32>
  llvm.func @return_vs_4_i32() -> vector<[4]xi32>
  llvm.func @return_vs_8_half() -> vector<[8]xf16>
  llvm.func @return_v_4_pi8() -> vector<4x!llvm.ptr>
  llvm.func @return_a10_i32() -> !llvm.array<10 x i32>
  llvm.func @return_a8_float() -> !llvm.array<8 x f32>
  llvm.func @return_a10_p_4() -> !llvm.array<10 x ptr<4>>
  llvm.func @return_a10_a4_float() -> !llvm.array<10 x array<4 x f32>>
  llvm.func @return_a10_a4_v4_float() -> !llvm.array<10 x array<4 x vector<4xf32>>>
  llvm.func @return_a10_a4_sv4_float() -> !llvm.array<10 x array<4 x vector<[4]xf32>>>
  llvm.func @return_struct_empty() -> !llvm.struct<()>
  llvm.func @return_s_i32() -> !llvm.struct<(i32)>
  llvm.func @return_s_float_i32() -> !llvm.struct<(f32, i32)>
  llvm.func @return_s_s_i32() -> !llvm.struct<(struct<(i32)>)>
  llvm.func @return_s_i32_s_i32_float() -> !llvm.struct<(i32, struct<(i32)>, f32)>
  llvm.func @return_sp_empty() -> !llvm.struct<packed ()>
  llvm.func @return_sp_i32() -> !llvm.struct<packed (i32)>
  llvm.func @return_sp_float_i32() -> !llvm.struct<packed (f32, i32)>
  llvm.func @return_sp_i32_s_i31_1_float() -> !llvm.struct<packed (i32, struct<(i32, i1)>, f32)>
  llvm.func @return_s_sp_i32() -> !llvm.struct<(struct<packed (i32)>)>
  llvm.func @return_sp_s_i32() -> !llvm.struct<packed (struct<(i32)>)>
  llvm.func @return_target_ext_no_param() -> !llvm.target<"target-no-param">
  llvm.func @return_target_ext_type_params() -> !llvm.target<"target-type-param", i32, f64>
  llvm.func @return_target_ext_int_params() -> !llvm.target<"target-int-param", 0, 42>
  llvm.func @return_target_ext_params() -> !llvm.target<"target-params", i32, f64, 0, 5>
}

// -----
module {
  llvm.func @return_s_empty() -> !llvm.struct<"empty", ()>
  llvm.func @return_s_opaque() -> !llvm.struct<"opaque", opaque>
  llvm.func @return_s_long() -> !llvm.struct<"long", (i32, struct<(i32, i1)>, f32, ptr)>
  llvm.func @return_s_unpacked() -> !llvm.struct<"unpacked", (i32)>
  llvm.func @return_s_packed() -> !llvm.struct<"packed", packed (i32)>
  llvm.func @return_s_symbols() -> !llvm.struct<"name with spaces and !^$@$#", packed (i32)>
  llvm.func @return_s_struct_of_arrays() -> !llvm.struct<"struct-of-arrays", (array<10 x i32>)>
  llvm.func @return_s_array_of_structs() -> !llvm.array<10 x struct<"array-of-structs", (i32)>>
}

