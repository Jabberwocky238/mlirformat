"builtin.module"() ({
  "llvm.mlir.global"() <{addr_space = 0 : i32, alignment = 32 : i64, global_type = i64, linkage = #llvm.linkage<private>, sym_name = "global_aligned32", value = 42 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.mlir.global"() <{addr_space = 0 : i32, alignment = 64 : i64, global_type = i64, linkage = #llvm.linkage<private>, sym_name = "global_aligned64", unnamed_addr = 0 : i64, value = 42 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.mlir.global"() <{addr_space = 0 : i32, alignment = 64 : i64, global_type = i64, linkage = #llvm.linkage<private>, sym_name = "global_aligned64_native", unnamed_addr = 0 : i64, value = 42 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.mlir.global"() <{addr_space = 0 : i32, global_type = i32, linkage = #llvm.linkage<internal>, sym_name = "i32_global", unnamed_addr = 0 : i64, value = 42 : i32, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.mlir.global"() <{addr_space = 0 : i32, constant, global_type = i53, linkage = #llvm.linkage<internal>, sym_name = "i32_const", unnamed_addr = 0 : i64, value = 52 : i53, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.mlir.global"() <{addr_space = 0 : i32, global_type = !llvm.array<3 x i32>, linkage = #llvm.linkage<internal>, sym_name = "int_global_array", unnamed_addr = 0 : i64, value = dense<62> : vector<3xi32>, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.mlir.global"() <{addr_space = 0 : i32, constant, global_type = !llvm.array<3 x array<0 x array<4 x f32>>>, linkage = #llvm.linkage<internal>, sym_name = "int_global_array_zero_elements", unnamed_addr = 0 : i64, value = dense<> : tensor<3x0x4xf32>, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.mlir.global"() <{addr_space = 0 : i32, constant, global_type = !llvm.array<0 x f32>, linkage = #llvm.linkage<internal>, sym_name = "int_global_array_zero_elements_1d", unnamed_addr = 0 : i64, value = dense<> : tensor<0xf32>, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.mlir.global"() <{addr_space = 7 : i32, global_type = i32, linkage = #llvm.linkage<internal>, sym_name = "i32_global_addr_space", unnamed_addr = 0 : i64, value = 62 : i32, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.mlir.global"() <{addr_space = 0 : i32, global_type = f32, linkage = #llvm.linkage<internal>, sym_name = "float_global", unnamed_addr = 0 : i64, value = 0.000000e+00 : f32, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.mlir.global"() <{addr_space = 0 : i32, global_type = !llvm.array<1 x f32>, linkage = #llvm.linkage<internal>, sym_name = "float_global_array", unnamed_addr = 0 : i64, value = dense<-5.000000e+00> : vector<1xf32>, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.mlir.global"() <{addr_space = 0 : i32, global_type = !llvm.array<4 x f32>, linkage = #llvm.linkage<internal>, sym_name = "splat_float_global_array", unnamed_addr = 0 : i64, value = dense<4.200000e+01> : tensor<4xf32>, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.mlir.global"() <{addr_space = 0 : i32, global_type = !llvm.array<3 x f64>, linkage = #llvm.linkage<internal>, sym_name = "splat_double_global_array", unnamed_addr = 0 : i64, value = dense<4.200000e+01> : tensor<3xf64>, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.mlir.global"() <{addr_space = 0 : i32, global_type = !llvm.array<4 x f32>, linkage = #llvm.linkage<internal>, sym_name = "splat_neg_float_global_array", unnamed_addr = 0 : i64, value = dense<-1.350000e+01> : tensor<4xf32>, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.mlir.global"() <{addr_space = 0 : i32, global_type = !llvm.array<3 x f64>, linkage = #llvm.linkage<internal>, sym_name = "splat_neg_double_global_array", unnamed_addr = 0 : i64, value = dense<-1.350000e+01> : tensor<3xf64>, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.mlir.global"() <{addr_space = 0 : i32, global_type = !llvm.array<4 x f16>, linkage = #llvm.linkage<internal>, sym_name = "splat_half_global_array", unnamed_addr = 0 : i64, value = dense<4.200000e+01> : tensor<4xf16>, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.mlir.global"() <{addr_space = 0 : i32, global_type = !llvm.array<3 x bf16>, linkage = #llvm.linkage<internal>, sym_name = "splat_bfloat_global_array", unnamed_addr = 0 : i64, value = dense<4.200000e+01> : tensor<3xbf16>, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.mlir.global"() <{addr_space = 0 : i32, global_type = !llvm.array<4 x f16>, linkage = #llvm.linkage<internal>, sym_name = "splat_neg_half_global_array", unnamed_addr = 0 : i64, value = dense<-1.350000e+01> : tensor<4xf16>, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.mlir.global"() <{addr_space = 0 : i32, global_type = !llvm.array<3 x bf16>, linkage = #llvm.linkage<internal>, sym_name = "splat_neg_bfloat_global_array", unnamed_addr = 0 : i64, value = dense<-1.350000e+01> : tensor<3xbf16>, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.mlir.global"() <{addr_space = 0 : i32, constant, global_type = !llvm.array<6 x i8>, linkage = #llvm.linkage<internal>, sym_name = "string_const", unnamed_addr = 0 : i64, value = "foobar", visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.mlir.global"() <{addr_space = 0 : i32, global_type = i64, linkage = #llvm.linkage<internal>, sym_name = "int_global_undef", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.mlir.global"() <{addr_space = 0 : i32, externally_initialized, global_type = i32, linkage = #llvm.linkage<internal>, sym_name = "externally_initialized_global", unnamed_addr = 0 : i64, value = 0 : i32, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.mlir.global"() <{addr_space = 0 : i32, global_type = i4, linkage = #llvm.linkage<internal>, sym_name = "f4E2M1FN_global_as_i4", unnamed_addr = 0 : i64, value = 1.500000e+00 : f4E2M1FN, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.mlir.global"() <{addr_space = 0 : i32, global_type = i6, linkage = #llvm.linkage<internal>, sym_name = "f6E2M3FN_global_as_i6", unnamed_addr = 0 : i64, value = 1.500000e+00 : f6E2M3FN, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.mlir.global"() <{addr_space = 0 : i32, global_type = i6, linkage = #llvm.linkage<internal>, sym_name = "f6E3M2FN_global_as_i6", unnamed_addr = 0 : i64, value = 1.500000e+00 : f6E3M2FN, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.mlir.global"() <{addr_space = 0 : i32, global_type = i8, linkage = #llvm.linkage<internal>, sym_name = "f8E3M4_global_as_i8", unnamed_addr = 0 : i64, value = 1.500000e+00 : f8E3M4, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.mlir.global"() <{addr_space = 0 : i32, global_type = i8, linkage = #llvm.linkage<internal>, sym_name = "f8E4M3_global_as_i8", unnamed_addr = 0 : i64, value = 1.500000e+00 : f8E4M3, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.mlir.global"() <{addr_space = 0 : i32, global_type = i8, linkage = #llvm.linkage<internal>, sym_name = "f8E4M3FN_global_as_i8", unnamed_addr = 0 : i64, value = 1.500000e+00 : f8E4M3FN, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.mlir.global"() <{addr_space = 0 : i32, global_type = i8, linkage = #llvm.linkage<internal>, sym_name = "f8E5M2_global_as_i8", unnamed_addr = 0 : i64, value = 1.500000e+00 : f8E5M2, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.mlir.global"() <{addr_space = 0 : i32, global_type = i8, linkage = #llvm.linkage<internal>, sym_name = "f8E4M3FNUZ_global_as_i8", unnamed_addr = 0 : i64, value = 1.500000e+00 : f8E4M3FNUZ, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.mlir.global"() <{addr_space = 0 : i32, global_type = i8, linkage = #llvm.linkage<internal>, sym_name = "f8E5M2FNUZ_global_as_i8", unnamed_addr = 0 : i64, value = 1.500000e+00 : f8E5M2FNUZ, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.mlir.global"() <{addr_space = 0 : i32, global_type = i8, linkage = #llvm.linkage<internal>, sym_name = "f8E4M3B11FNUZ_global_as_i8", unnamed_addr = 0 : i64, value = 1.500000e+00 : f8E4M3B11FNUZ, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.mlir.global"() <{addr_space = 0 : i32, global_type = i8, linkage = #llvm.linkage<internal>, sym_name = "f8E8M0FNU_global_as_i8", unnamed_addr = 0 : i64, value = 1.000000e+00 : f8E8M0FNU, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.mlir.global"() <{addr_space = 0 : i32, global_type = i16, linkage = #llvm.linkage<internal>, sym_name = "bf16_global_as_i16", unnamed_addr = 0 : i64, value = 1.500000e+00 : bf16, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.mlir.global"() <{addr_space = 0 : i32, global_type = i8, linkage = #llvm.linkage<internal>, sym_name = "bool_global_as_i8", unnamed_addr = 0 : i64, value = true, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.mlir.global"() <{addr_space = 0 : i32, global_type = i32, linkage = #llvm.linkage<external>, sym_name = "explicit_undef", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %369 = "llvm.mlir.undef"() : () -> i32
    "llvm.return"(%369) : (i32) -> ()
  }) : () -> ()
  "llvm.mlir.global"() <{addr_space = 0 : i32, constant, global_type = !llvm.ptr, linkage = #llvm.linkage<internal>, sym_name = "int_gep", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %366 = "llvm.mlir.addressof"() <{global_name = @i32_global}> : () -> !llvm.ptr
    %367 = "llvm.mlir.constant"() <{value = 2 : i32}> : () -> i32
    %368 = "llvm.getelementptr"(%366, %367) <{elem_type = i32, noWrapFlags = 0 : i32, rawConstantIndices = array<i32: -2147483648>}> : (!llvm.ptr, i32) -> !llvm.ptr
    "llvm.return"(%368) : (!llvm.ptr) -> ()
  }) : () -> ()
  "llvm.mlir.global"() <{addr_space = 0 : i32, global_type = vector<3xf32>, linkage = #llvm.linkage<internal>, sym_name = "dense_float_vector", unnamed_addr = 0 : i64, value = dense<[1.000000e+00, 2.000000e+00, 3.000000e+00]> : vector<3xf32>, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.mlir.global"() <{addr_space = 0 : i32, global_type = vector<3xf32>, linkage = #llvm.linkage<internal>, sym_name = "splat_float_vector", unnamed_addr = 0 : i64, value = dense<4.200000e+01> : vector<3xf32>, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.mlir.global"() <{addr_space = 0 : i32, global_type = vector<3xf64>, linkage = #llvm.linkage<internal>, sym_name = "dense_double_vector", unnamed_addr = 0 : i64, value = dense<[1.000000e+00, 2.000000e+00, 3.000000e+00]> : vector<3xf64>, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.mlir.global"() <{addr_space = 0 : i32, global_type = vector<3xf64>, linkage = #llvm.linkage<internal>, sym_name = "splat_double_vector", unnamed_addr = 0 : i64, value = dense<4.200000e+01> : vector<3xf64>, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.mlir.global"() <{addr_space = 0 : i32, global_type = vector<3xi64>, linkage = #llvm.linkage<internal>, sym_name = "dense_i64_vector", unnamed_addr = 0 : i64, value = dense<[1, 2, 3]> : vector<3xi64>, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.mlir.global"() <{addr_space = 0 : i32, global_type = vector<3xi64>, linkage = #llvm.linkage<internal>, sym_name = "splat_i64_vector", unnamed_addr = 0 : i64, value = dense<42> : vector<3xi64>, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.mlir.global"() <{addr_space = 0 : i32, global_type = !llvm.array<2 x vector<2xf32>>, linkage = #llvm.linkage<internal>, sym_name = "dense_float_vector_2d", unnamed_addr = 0 : i64, value = dense<[[1.000000e+00, 2.000000e+00], [3.000000e+00, 4.000000e+00]]> : vector<2x2xf32>, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.mlir.global"() <{addr_space = 0 : i32, global_type = !llvm.array<2 x vector<2xf32>>, linkage = #llvm.linkage<internal>, sym_name = "splat_float_vector_2d", unnamed_addr = 0 : i64, value = dense<4.200000e+01> : vector<2x2xf32>, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.mlir.global"() <{addr_space = 0 : i32, global_type = !llvm.array<2 x array<2 x vector<2xf32>>>, linkage = #llvm.linkage<internal>, sym_name = "dense_float_vector_3d", unnamed_addr = 0 : i64, value = dense<[[[1.000000e+00, 2.000000e+00], [3.000000e+00, 4.000000e+00]], [[5.000000e+00, 6.000000e+00], [7.000000e+00, 8.000000e+00]]]> : vector<2x2x2xf32>, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.mlir.global"() <{addr_space = 0 : i32, global_type = !llvm.array<2 x array<2 x vector<2xf32>>>, linkage = #llvm.linkage<internal>, sym_name = "splat_float_vector_3d", unnamed_addr = 0 : i64, value = dense<4.200000e+01> : vector<2x2x2xf32>, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.mlir.global"() <{addr_space = 0 : i32, global_type = i32, linkage = #llvm.linkage<private>, sym_name = "private", unnamed_addr = 0 : i64, value = 42 : i32, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.mlir.global"() <{addr_space = 0 : i32, global_type = i32, linkage = #llvm.linkage<internal>, sym_name = "internal", unnamed_addr = 0 : i64, value = 42 : i32, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.mlir.global"() <{addr_space = 0 : i32, global_type = i32, linkage = #llvm.linkage<available_externally>, sym_name = "available_externally", unnamed_addr = 0 : i64, value = 42 : i32, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.mlir.global"() <{addr_space = 0 : i32, global_type = i32, linkage = #llvm.linkage<linkonce>, sym_name = "linkonce", unnamed_addr = 0 : i64, value = 42 : i32, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.mlir.global"() <{addr_space = 0 : i32, global_type = i32, linkage = #llvm.linkage<weak>, sym_name = "weak", unnamed_addr = 0 : i64, value = 42 : i32, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.mlir.global"() <{addr_space = 0 : i32, global_type = i32, linkage = #llvm.linkage<common>, sym_name = "common", unnamed_addr = 0 : i64, value = 0 : i32, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.mlir.global"() <{addr_space = 0 : i32, global_type = !llvm.array<3 x i32>, linkage = #llvm.linkage<appending>, sym_name = "appending", unnamed_addr = 0 : i64, value = dense<[1, 2, 3]> : tensor<3xi32>, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.mlir.global"() <{addr_space = 0 : i32, global_type = i32, linkage = #llvm.linkage<extern_weak>, sym_name = "extern_weak", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.mlir.global"() <{addr_space = 0 : i32, global_type = i32, linkage = #llvm.linkage<linkonce_odr>, sym_name = "linkonce_odr", unnamed_addr = 0 : i64, value = 42 : i32, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.mlir.global"() <{addr_space = 0 : i32, global_type = i32, linkage = #llvm.linkage<weak_odr>, sym_name = "weak_odr", unnamed_addr = 0 : i64, value = 42 : i32, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.mlir.global"() <{addr_space = 0 : i32, global_type = i32, linkage = #llvm.linkage<external>, sym_name = "external", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.mlir.global"() <{addr_space = 0 : i32, constant, global_type = !llvm.array<6 x i8>, linkage = #llvm.linkage<external>, sym_name = "hidden", unnamed_addr = 0 : i64, value = "string", visibility_ = 1 : i64}> ({
  }) : () -> ()
  "llvm.mlir.global"() <{addr_space = 0 : i32, constant, global_type = i64, linkage = #llvm.linkage<external>, sym_name = "protected", unnamed_addr = 0 : i64, value = 42 : i64, visibility_ = 2 : i64}> ({
  }) : () -> ()
  "llvm.mlir.global"() <{addr_space = 0 : i32, constant, global_type = i64, linkage = #llvm.linkage<private>, sym_name = "no_unnamed_addr", unnamed_addr = 0 : i64, value = 42 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.mlir.global"() <{addr_space = 0 : i32, constant, global_type = i64, linkage = #llvm.linkage<private>, sym_name = "local_unnamed_addr", unnamed_addr = 1 : i64, value = 42 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.mlir.global"() <{addr_space = 0 : i32, constant, global_type = i64, linkage = #llvm.linkage<private>, sym_name = "unnamed_addr", unnamed_addr = 2 : i64, value = 42 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.mlir.global"() <{addr_space = 0 : i32, dso_local, global_type = i64, linkage = #llvm.linkage<external>, sym_name = "has_dso_local", unnamed_addr = 0 : i64, value = 42 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.mlir.global"() <{addr_space = 0 : i32, global_type = i64, linkage = #llvm.linkage<external>, sym_name = "has_thr_local", thread_local_, unnamed_addr = 0 : i64, value = 42 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.mlir.global"() <{addr_space = 0 : i32, constant, global_type = !llvm.array<10 x i8>, linkage = #llvm.linkage<internal>, section = ".mysection", sym_name = "sectionvar", unnamed_addr = 0 : i64, value = "teststring", visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<ptr (i64)>, linkage = #llvm.linkage<external>, sym_name = "malloc", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr)>, linkage = #llvm.linkage<external>, sym_name = "free", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "empty", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "global_refs", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %360 = "llvm.mlir.addressof"() <{global_name = @i32_global}> : () -> !llvm.ptr
    %361 = "llvm.load"(%360) <{ordering = 0 : i64}> : (!llvm.ptr) -> i32
    %362 = "llvm.mlir.addressof"() <{global_name = @string_const}> : () -> !llvm.ptr
    %363 = "llvm.mlir.constant"() <{value = 0 : index}> : () -> i64
    %364 = "llvm.getelementptr"(%362, %363, %363) <{elem_type = !llvm.array<6 x i8>, noWrapFlags = 0 : i32, rawConstantIndices = array<i32: -2147483648, -2147483648>}> : (!llvm.ptr, i64, i64) -> !llvm.ptr
    %365 = "llvm.load"(%364) <{ordering = 0 : i64}> : (!llvm.ptr) -> i8
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (i64)>, linkage = #llvm.linkage<external>, sym_name = "body", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "simple_loop", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "llvm.br"()[^bb1] : () -> ()
  ^bb1:  // pred: ^bb0
    %354 = "llvm.mlir.constant"() <{value = 1 : index}> : () -> i64
    %355 = "llvm.mlir.constant"() <{value = 42 : index}> : () -> i64
    "llvm.br"(%354)[^bb2] : (i64) -> ()
  ^bb2(%356: i64):  // 2 preds: ^bb1, ^bb3
    %357 = "llvm.icmp"(%356, %355) <{predicate = 2 : i64}> : (i64, i64) -> i1
    "llvm.cond_br"(%357)[^bb3, ^bb4] <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (i1) -> ()
  ^bb3:  // pred: ^bb2
    "llvm.call"(%356) <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @body, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 1, 0>}> : (i64) -> ()
    %358 = "llvm.mlir.constant"() <{value = 1 : index}> : () -> i64
    %359 = "llvm.add"(%356, %358) <{overflowFlags = 0 : i32}> : (i64, i64) -> i64
    "llvm.br"(%359)[^bb2] : (i64) -> ()
  ^bb4:  // pred: ^bb2
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "simple_caller", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "llvm.call"() <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @simple_loop, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 0, 0>}> : () -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "ml_caller", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "llvm.call"() <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @simple_loop, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 0, 0>}> : () -> ()
    "llvm.call"() <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @more_imperfectly_nested_loops, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 0, 0>}> : () -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<i64 (i64)>, linkage = #llvm.linkage<external>, sym_name = "body_args", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<i32 (i64, i32)>, linkage = #llvm.linkage<external>, sym_name = "other", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<i32 (i32, i32)>, linkage = #llvm.linkage<external>, sym_name = "func_args", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg70: i32, %arg71: i32):
    %341 = "llvm.mlir.constant"() <{value = 0 : i32}> : () -> i32
    "llvm.br"()[^bb1] : () -> ()
  ^bb1:  // pred: ^bb0
    %342 = "llvm.mlir.constant"() <{value = 0 : index}> : () -> i64
    %343 = "llvm.mlir.constant"() <{value = 42 : index}> : () -> i64
    "llvm.br"(%342)[^bb2] : (i64) -> ()
  ^bb2(%344: i64):  // 2 preds: ^bb1, ^bb3
    %345 = "llvm.icmp"(%344, %343) <{predicate = 2 : i64}> : (i64, i64) -> i1
    "llvm.cond_br"(%345)[^bb3, ^bb4] <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (i1) -> ()
  ^bb3:  // pred: ^bb2
    %346 = "llvm.call"(%344) <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @body_args, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 1, 0>}> : (i64) -> i64
    %347 = "llvm.call"(%346, %arg70) <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @other, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 2, 0>}> : (i64, i32) -> i32
    %348 = "llvm.call"(%346, %347) <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @other, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 2, 0>}> : (i64, i32) -> i32
    %349 = "llvm.call"(%346, %arg71) <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @other, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 2, 0>}> : (i64, i32) -> i32
    %350 = "llvm.mlir.constant"() <{value = 1 : index}> : () -> i64
    %351 = "llvm.add"(%344, %350) <{overflowFlags = 0 : i32}> : (i64, i64) -> i64
    "llvm.br"(%351)[^bb2] : (i64) -> ()
  ^bb4:  // pred: ^bb2
    %352 = "llvm.mlir.constant"() <{value = 0 : index}> : () -> i64
    %353 = "llvm.call"(%352, %341) <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @other, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 2, 0>}> : (i64, i32) -> i32
    "llvm.return"(%353) : (i32) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (i64)>, linkage = #llvm.linkage<external>, sym_name = "pre", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (i64, i64)>, linkage = #llvm.linkage<external>, sym_name = "body2", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (i64)>, linkage = #llvm.linkage<external>, sym_name = "post", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "imperfectly_nested_loops", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "llvm.br"()[^bb1] : () -> ()
  ^bb1:  // pred: ^bb0
    %329 = "llvm.mlir.constant"() <{value = 0 : index}> : () -> i64
    %330 = "llvm.mlir.constant"() <{value = 42 : index}> : () -> i64
    "llvm.br"(%329)[^bb2] : (i64) -> ()
  ^bb2(%331: i64):  // 2 preds: ^bb1, ^bb7
    %332 = "llvm.icmp"(%331, %330) <{predicate = 2 : i64}> : (i64, i64) -> i1
    "llvm.cond_br"(%332)[^bb3, ^bb8] <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (i1) -> ()
  ^bb3:  // pred: ^bb2
    "llvm.call"(%331) <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @pre, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 1, 0>}> : (i64) -> ()
    "llvm.br"()[^bb4] : () -> ()
  ^bb4:  // pred: ^bb3
    %333 = "llvm.mlir.constant"() <{value = 7 : index}> : () -> i64
    %334 = "llvm.mlir.constant"() <{value = 56 : index}> : () -> i64
    "llvm.br"(%333)[^bb5] : (i64) -> ()
  ^bb5(%335: i64):  // 2 preds: ^bb4, ^bb6
    %336 = "llvm.icmp"(%335, %334) <{predicate = 2 : i64}> : (i64, i64) -> i1
    "llvm.cond_br"(%336)[^bb6, ^bb7] <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (i1) -> ()
  ^bb6:  // pred: ^bb5
    "llvm.call"(%331, %335) <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @body2, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 2, 0>}> : (i64, i64) -> ()
    %337 = "llvm.mlir.constant"() <{value = 2 : index}> : () -> i64
    %338 = "llvm.add"(%335, %337) <{overflowFlags = 0 : i32}> : (i64, i64) -> i64
    "llvm.br"(%338)[^bb5] : (i64) -> ()
  ^bb7:  // pred: ^bb5
    "llvm.call"(%331) <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @post, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 1, 0>}> : (i64) -> ()
    %339 = "llvm.mlir.constant"() <{value = 1 : index}> : () -> i64
    %340 = "llvm.add"(%331, %339) <{overflowFlags = 0 : i32}> : (i64, i64) -> i64
    "llvm.br"(%340)[^bb2] : (i64) -> ()
  ^bb8:  // pred: ^bb2
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (i64)>, linkage = #llvm.linkage<external>, sym_name = "mid", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (i64, i64)>, linkage = #llvm.linkage<external>, sym_name = "body3", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "more_imperfectly_nested_loops", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "llvm.br"()[^bb1] : () -> ()
  ^bb1:  // pred: ^bb0
    %311 = "llvm.mlir.constant"() <{value = 0 : index}> : () -> i64
    %312 = "llvm.mlir.constant"() <{value = 42 : index}> : () -> i64
    "llvm.br"(%311)[^bb2] : (i64) -> ()
  ^bb2(%313: i64):  // 2 preds: ^bb1, ^bb11
    %314 = "llvm.icmp"(%313, %312) <{predicate = 2 : i64}> : (i64, i64) -> i1
    "llvm.cond_br"(%314)[^bb3, ^bb12] <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (i1) -> ()
  ^bb3:  // pred: ^bb2
    "llvm.call"(%313) <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @pre, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 1, 0>}> : (i64) -> ()
    "llvm.br"()[^bb4] : () -> ()
  ^bb4:  // pred: ^bb3
    %315 = "llvm.mlir.constant"() <{value = 7 : index}> : () -> i64
    %316 = "llvm.mlir.constant"() <{value = 56 : index}> : () -> i64
    "llvm.br"(%315)[^bb5] : (i64) -> ()
  ^bb5(%317: i64):  // 2 preds: ^bb4, ^bb6
    %318 = "llvm.icmp"(%317, %316) <{predicate = 2 : i64}> : (i64, i64) -> i1
    "llvm.cond_br"(%318)[^bb6, ^bb7] <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (i1) -> ()
  ^bb6:  // pred: ^bb5
    "llvm.call"(%313, %317) <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @body2, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 2, 0>}> : (i64, i64) -> ()
    %319 = "llvm.mlir.constant"() <{value = 2 : index}> : () -> i64
    %320 = "llvm.add"(%317, %319) <{overflowFlags = 0 : i32}> : (i64, i64) -> i64
    "llvm.br"(%320)[^bb5] : (i64) -> ()
  ^bb7:  // pred: ^bb5
    "llvm.call"(%313) <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @mid, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 1, 0>}> : (i64) -> ()
    "llvm.br"()[^bb8] : () -> ()
  ^bb8:  // pred: ^bb7
    %321 = "llvm.mlir.constant"() <{value = 18 : index}> : () -> i64
    %322 = "llvm.mlir.constant"() <{value = 37 : index}> : () -> i64
    "llvm.br"(%321)[^bb9] : (i64) -> ()
  ^bb9(%323: i64):  // 2 preds: ^bb8, ^bb10
    %324 = "llvm.icmp"(%323, %322) <{predicate = 2 : i64}> : (i64, i64) -> i1
    "llvm.cond_br"(%324)[^bb10, ^bb11] <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (i1) -> ()
  ^bb10:  // pred: ^bb9
    "llvm.call"(%313, %323) <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @body3, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 2, 0>}> : (i64, i64) -> ()
    %325 = "llvm.mlir.constant"() <{value = 3 : index}> : () -> i64
    %326 = "llvm.add"(%323, %325) <{overflowFlags = 0 : i32}> : (i64, i64) -> i64
    "llvm.br"(%326)[^bb9] : (i64) -> ()
  ^bb11:  // pred: ^bb9
    "llvm.call"(%313) <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @post, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 1, 0>}> : (i64) -> ()
    %327 = "llvm.mlir.constant"() <{value = 1 : index}> : () -> i64
    %328 = "llvm.add"(%313, %327) <{overflowFlags = 0 : i32}> : (i64, i64) -> i64
    "llvm.br"(%328)[^bb2] : (i64) -> ()
  ^bb12:  // pred: ^bb2
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<internal>, sym_name = "func_internal", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "hidden_func", unnamed_addr = 0 : i64, visibility_ = 1 : i64}> ({
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "protected_func", unnamed_addr = 0 : i64, visibility_ = 2 : i64}> ({
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, dso_local, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "dso_local_func", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "memref_alloc", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %303 = "llvm.mlir.constant"() <{value = 10 : index}> : () -> i64
    %304 = "llvm.mlir.constant"() <{value = 10 : index}> : () -> i64
    %305 = "llvm.mul"(%303, %304) <{overflowFlags = 0 : i32}> : (i64, i64) -> i64
    %306 = "llvm.mlir.undef"() : () -> !llvm.struct<(ptr)>
    %307 = "llvm.mlir.constant"() <{value = 4 : index}> : () -> i64
    %308 = "llvm.mul"(%305, %307) <{overflowFlags = 0 : i32}> : (i64, i64) -> i64
    %309 = "llvm.call"(%308) <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @malloc, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 1, 0>}> : (i64) -> !llvm.ptr
    %310 = "llvm.insertvalue"(%306, %309) <{position = array<i64: 0>}> : (!llvm.struct<(ptr)>, !llvm.ptr) -> !llvm.struct<(ptr)>
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<i64 ()>, linkage = #llvm.linkage<external>, sym_name = "get_index", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "store_load_static", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %277 = "llvm.mlir.constant"() <{value = 10 : index}> : () -> i64
    %278 = "llvm.mlir.undef"() : () -> !llvm.struct<(ptr)>
    %279 = "llvm.mlir.constant"() <{value = 4 : index}> : () -> i64
    %280 = "llvm.mul"(%277, %279) <{overflowFlags = 0 : i32}> : (i64, i64) -> i64
    %281 = "llvm.call"(%280) <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @malloc, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 1, 0>}> : (i64) -> !llvm.ptr
    %282 = "llvm.insertvalue"(%278, %281) <{position = array<i64: 0>}> : (!llvm.struct<(ptr)>, !llvm.ptr) -> !llvm.struct<(ptr)>
    %283 = "llvm.mlir.constant"() <{value = 1.000000e+00 : f32}> : () -> f32
    "llvm.br"()[^bb1] : () -> ()
  ^bb1:  // pred: ^bb0
    %284 = "llvm.mlir.constant"() <{value = 0 : index}> : () -> i64
    %285 = "llvm.mlir.constant"() <{value = 10 : index}> : () -> i64
    "llvm.br"(%284)[^bb2] : (i64) -> ()
  ^bb2(%286: i64):  // 2 preds: ^bb1, ^bb3
    %287 = "llvm.icmp"(%286, %285) <{predicate = 2 : i64}> : (i64, i64) -> i1
    "llvm.cond_br"(%287)[^bb3, ^bb4] <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (i1) -> ()
  ^bb3:  // pred: ^bb2
    %288 = "llvm.mlir.constant"() <{value = 10 : index}> : () -> i64
    %289 = "llvm.extractvalue"(%282) <{position = array<i64: 0>}> : (!llvm.struct<(ptr)>) -> !llvm.ptr
    %290 = "llvm.getelementptr"(%289, %286) <{elem_type = f32, noWrapFlags = 0 : i32, rawConstantIndices = array<i32: -2147483648>}> : (!llvm.ptr, i64) -> !llvm.ptr
    "llvm.store"(%283, %290) <{ordering = 0 : i64}> : (f32, !llvm.ptr) -> ()
    %291 = "llvm.mlir.constant"() <{value = 1 : index}> : () -> i64
    %292 = "llvm.add"(%286, %291) <{overflowFlags = 0 : i32}> : (i64, i64) -> i64
    "llvm.br"(%292)[^bb2] : (i64) -> ()
  ^bb4:  // pred: ^bb2
    "llvm.br"()[^bb5] : () -> ()
  ^bb5:  // pred: ^bb4
    %293 = "llvm.mlir.constant"() <{value = 0 : index}> : () -> i64
    %294 = "llvm.mlir.constant"() <{value = 10 : index}> : () -> i64
    "llvm.br"(%293)[^bb6] : (i64) -> ()
  ^bb6(%295: i64):  // 2 preds: ^bb5, ^bb7
    %296 = "llvm.icmp"(%295, %294) <{predicate = 2 : i64}> : (i64, i64) -> i1
    "llvm.cond_br"(%296)[^bb7, ^bb8] <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (i1) -> ()
  ^bb7:  // pred: ^bb6
    %297 = "llvm.mlir.constant"() <{value = 10 : index}> : () -> i64
    %298 = "llvm.extractvalue"(%282) <{position = array<i64: 0>}> : (!llvm.struct<(ptr)>) -> !llvm.ptr
    %299 = "llvm.getelementptr"(%298, %295) <{elem_type = f32, noWrapFlags = 0 : i32, rawConstantIndices = array<i32: -2147483648>}> : (!llvm.ptr, i64) -> !llvm.ptr
    %300 = "llvm.load"(%299) <{ordering = 0 : i64}> : (!llvm.ptr) -> f32
    %301 = "llvm.mlir.constant"() <{value = 1 : index}> : () -> i64
    %302 = "llvm.add"(%295, %301) <{overflowFlags = 0 : i32}> : (i64, i64) -> i64
    "llvm.br"(%302)[^bb6] : (i64) -> ()
  ^bb8:  // pred: ^bb6
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (i64)>, linkage = #llvm.linkage<external>, sym_name = "store_load_dynamic", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg69: i64):
    %253 = "llvm.mlir.undef"() : () -> !llvm.struct<(ptr, i64)>
    %254 = "llvm.mlir.constant"() <{value = 4 : index}> : () -> i64
    %255 = "llvm.mul"(%arg69, %254) <{overflowFlags = 0 : i32}> : (i64, i64) -> i64
    %256 = "llvm.call"(%255) <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @malloc, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 1, 0>}> : (i64) -> !llvm.ptr
    %257 = "llvm.insertvalue"(%253, %256) <{position = array<i64: 0>}> : (!llvm.struct<(ptr, i64)>, !llvm.ptr) -> !llvm.struct<(ptr, i64)>
    %258 = "llvm.insertvalue"(%257, %arg69) <{position = array<i64: 1>}> : (!llvm.struct<(ptr, i64)>, i64) -> !llvm.struct<(ptr, i64)>
    %259 = "llvm.mlir.constant"() <{value = 1.000000e+00 : f32}> : () -> f32
    "llvm.br"()[^bb1] : () -> ()
  ^bb1:  // pred: ^bb0
    %260 = "llvm.mlir.constant"() <{value = 0 : index}> : () -> i64
    "llvm.br"(%260)[^bb2] : (i64) -> ()
  ^bb2(%261: i64):  // 2 preds: ^bb1, ^bb3
    %262 = "llvm.icmp"(%261, %arg69) <{predicate = 2 : i64}> : (i64, i64) -> i1
    "llvm.cond_br"(%262)[^bb3, ^bb4] <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (i1) -> ()
  ^bb3:  // pred: ^bb2
    %263 = "llvm.extractvalue"(%258) <{position = array<i64: 1>}> : (!llvm.struct<(ptr, i64)>) -> i64
    %264 = "llvm.extractvalue"(%258) <{position = array<i64: 0>}> : (!llvm.struct<(ptr, i64)>) -> !llvm.ptr
    %265 = "llvm.getelementptr"(%264, %261) <{elem_type = f32, noWrapFlags = 0 : i32, rawConstantIndices = array<i32: -2147483648>}> : (!llvm.ptr, i64) -> !llvm.ptr
    "llvm.store"(%259, %265) <{ordering = 0 : i64}> : (f32, !llvm.ptr) -> ()
    %266 = "llvm.mlir.constant"() <{value = 1 : index}> : () -> i64
    %267 = "llvm.add"(%261, %266) <{overflowFlags = 0 : i32}> : (i64, i64) -> i64
    "llvm.br"(%267)[^bb2] : (i64) -> ()
  ^bb4:  // pred: ^bb2
    "llvm.br"()[^bb5] : () -> ()
  ^bb5:  // pred: ^bb4
    %268 = "llvm.mlir.constant"() <{value = 0 : index}> : () -> i64
    "llvm.br"(%268)[^bb6] : (i64) -> ()
  ^bb6(%269: i64):  // 2 preds: ^bb5, ^bb7
    %270 = "llvm.icmp"(%269, %arg69) <{predicate = 2 : i64}> : (i64, i64) -> i1
    "llvm.cond_br"(%270)[^bb7, ^bb8] <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (i1) -> ()
  ^bb7:  // pred: ^bb6
    %271 = "llvm.extractvalue"(%258) <{position = array<i64: 1>}> : (!llvm.struct<(ptr, i64)>) -> i64
    %272 = "llvm.extractvalue"(%258) <{position = array<i64: 0>}> : (!llvm.struct<(ptr, i64)>) -> !llvm.ptr
    %273 = "llvm.getelementptr"(%272, %269) <{elem_type = f32, noWrapFlags = 0 : i32, rawConstantIndices = array<i32: -2147483648>}> : (!llvm.ptr, i64) -> !llvm.ptr
    %274 = "llvm.load"(%273) <{ordering = 0 : i64}> : (!llvm.ptr) -> f32
    %275 = "llvm.mlir.constant"() <{value = 1 : index}> : () -> i64
    %276 = "llvm.add"(%269, %275) <{overflowFlags = 0 : i32}> : (i64, i64) -> i64
    "llvm.br"(%276)[^bb6] : (i64) -> ()
  ^bb8:  // pred: ^bb6
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (i64)>, linkage = #llvm.linkage<external>, sym_name = "store_load_mixed", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg68: i64):
    %210 = "llvm.mlir.constant"() <{value = 10 : index}> : () -> i64
    %211 = "llvm.mlir.constant"() <{value = 2 : index}> : () -> i64
    %212 = "llvm.mlir.constant"() <{value = 4 : index}> : () -> i64
    %213 = "llvm.mul"(%211, %arg68) <{overflowFlags = 0 : i32}> : (i64, i64) -> i64
    %214 = "llvm.mul"(%213, %212) <{overflowFlags = 0 : i32}> : (i64, i64) -> i64
    %215 = "llvm.mul"(%214, %210) <{overflowFlags = 0 : i32}> : (i64, i64) -> i64
    %216 = "llvm.mlir.undef"() : () -> !llvm.struct<(ptr, i64, i64)>
    %217 = "llvm.mlir.constant"() <{value = 4 : index}> : () -> i64
    %218 = "llvm.mul"(%215, %217) <{overflowFlags = 0 : i32}> : (i64, i64) -> i64
    %219 = "llvm.call"(%218) <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @malloc, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 1, 0>}> : (i64) -> !llvm.ptr
    %220 = "llvm.insertvalue"(%216, %219) <{position = array<i64: 0>}> : (!llvm.struct<(ptr, i64, i64)>, !llvm.ptr) -> !llvm.struct<(ptr, i64, i64)>
    %221 = "llvm.insertvalue"(%220, %arg68) <{position = array<i64: 1>}> : (!llvm.struct<(ptr, i64, i64)>, i64) -> !llvm.struct<(ptr, i64, i64)>
    %222 = "llvm.insertvalue"(%221, %210) <{position = array<i64: 2>}> : (!llvm.struct<(ptr, i64, i64)>, i64) -> !llvm.struct<(ptr, i64, i64)>
    %223 = "llvm.mlir.constant"() <{value = 1 : index}> : () -> i64
    %224 = "llvm.mlir.constant"() <{value = 2 : index}> : () -> i64
    %225 = "llvm.call"() <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @get_index, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 0, 0>}> : () -> i64
    %226 = "llvm.call"() <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @get_index, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 0, 0>}> : () -> i64
    %227 = "llvm.mlir.constant"() <{value = 4.200000e+01 : f32}> : () -> f32
    %228 = "llvm.mlir.constant"() <{value = 2 : index}> : () -> i64
    %229 = "llvm.extractvalue"(%222) <{position = array<i64: 1>}> : (!llvm.struct<(ptr, i64, i64)>) -> i64
    %230 = "llvm.mlir.constant"() <{value = 4 : index}> : () -> i64
    %231 = "llvm.extractvalue"(%222) <{position = array<i64: 2>}> : (!llvm.struct<(ptr, i64, i64)>) -> i64
    %232 = "llvm.mul"(%223, %229) <{overflowFlags = 0 : i32}> : (i64, i64) -> i64
    %233 = "llvm.add"(%232, %224) <{overflowFlags = 0 : i32}> : (i64, i64) -> i64
    %234 = "llvm.mul"(%233, %230) <{overflowFlags = 0 : i32}> : (i64, i64) -> i64
    %235 = "llvm.add"(%234, %225) <{overflowFlags = 0 : i32}> : (i64, i64) -> i64
    %236 = "llvm.mul"(%235, %231) <{overflowFlags = 0 : i32}> : (i64, i64) -> i64
    %237 = "llvm.add"(%236, %226) <{overflowFlags = 0 : i32}> : (i64, i64) -> i64
    %238 = "llvm.extractvalue"(%222) <{position = array<i64: 0>}> : (!llvm.struct<(ptr, i64, i64)>) -> !llvm.ptr
    %239 = "llvm.getelementptr"(%238, %237) <{elem_type = f32, noWrapFlags = 0 : i32, rawConstantIndices = array<i32: -2147483648>}> : (!llvm.ptr, i64) -> !llvm.ptr
    "llvm.store"(%227, %239) <{ordering = 0 : i64}> : (f32, !llvm.ptr) -> ()
    %240 = "llvm.mlir.constant"() <{value = 2 : index}> : () -> i64
    %241 = "llvm.extractvalue"(%222) <{position = array<i64: 1>}> : (!llvm.struct<(ptr, i64, i64)>) -> i64
    %242 = "llvm.mlir.constant"() <{value = 4 : index}> : () -> i64
    %243 = "llvm.extractvalue"(%222) <{position = array<i64: 2>}> : (!llvm.struct<(ptr, i64, i64)>) -> i64
    %244 = "llvm.mul"(%226, %241) <{overflowFlags = 0 : i32}> : (i64, i64) -> i64
    %245 = "llvm.add"(%244, %225) <{overflowFlags = 0 : i32}> : (i64, i64) -> i64
    %246 = "llvm.mul"(%245, %242) <{overflowFlags = 0 : i32}> : (i64, i64) -> i64
    %247 = "llvm.add"(%246, %224) <{overflowFlags = 0 : i32}> : (i64, i64) -> i64
    %248 = "llvm.mul"(%247, %243) <{overflowFlags = 0 : i32}> : (i64, i64) -> i64
    %249 = "llvm.add"(%248, %223) <{overflowFlags = 0 : i32}> : (i64, i64) -> i64
    %250 = "llvm.extractvalue"(%222) <{position = array<i64: 0>}> : (!llvm.struct<(ptr, i64, i64)>) -> !llvm.ptr
    %251 = "llvm.getelementptr"(%250, %249) <{elem_type = f32, noWrapFlags = 0 : i32, rawConstantIndices = array<i32: -2147483648>}> : (!llvm.ptr, i64) -> !llvm.ptr
    %252 = "llvm.load"(%251) <{ordering = 0 : i64}> : (!llvm.ptr) -> f32
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<struct<(ptr, i64)> (struct<(ptr)>, struct<(ptr, i64)>, struct<(ptr, i64)>)>, linkage = #llvm.linkage<external>, sym_name = "memref_args_rets", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg65: !llvm.struct<(ptr)>, %arg66: !llvm.struct<(ptr, i64)>, %arg67: !llvm.struct<(ptr, i64)>):
    %187 = "llvm.mlir.constant"() <{value = 7 : index}> : () -> i64
    %188 = "llvm.call"() <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @get_index, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 0, 0>}> : () -> i64
    %189 = "llvm.mlir.constant"() <{value = 4.200000e+01 : f32}> : () -> f32
    %190 = "llvm.mlir.constant"() <{value = 10 : index}> : () -> i64
    %191 = "llvm.extractvalue"(%arg65) <{position = array<i64: 0>}> : (!llvm.struct<(ptr)>) -> !llvm.ptr
    %192 = "llvm.getelementptr"(%191, %187) <{elem_type = f32, noWrapFlags = 0 : i32, rawConstantIndices = array<i32: -2147483648>}> : (!llvm.ptr, i64) -> !llvm.ptr
    "llvm.store"(%189, %192) <{ordering = 0 : i64}> : (f32, !llvm.ptr) -> ()
    %193 = "llvm.extractvalue"(%arg66) <{position = array<i64: 1>}> : (!llvm.struct<(ptr, i64)>) -> i64
    %194 = "llvm.extractvalue"(%arg66) <{position = array<i64: 0>}> : (!llvm.struct<(ptr, i64)>) -> !llvm.ptr
    %195 = "llvm.getelementptr"(%194, %187) <{elem_type = f32, noWrapFlags = 0 : i32, rawConstantIndices = array<i32: -2147483648>}> : (!llvm.ptr, i64) -> !llvm.ptr
    "llvm.store"(%189, %195) <{ordering = 0 : i64}> : (f32, !llvm.ptr) -> ()
    %196 = "llvm.mlir.constant"() <{value = 10 : index}> : () -> i64
    %197 = "llvm.extractvalue"(%arg67) <{position = array<i64: 1>}> : (!llvm.struct<(ptr, i64)>) -> i64
    %198 = "llvm.mul"(%187, %197) <{overflowFlags = 0 : i32}> : (i64, i64) -> i64
    %199 = "llvm.add"(%198, %188) <{overflowFlags = 0 : i32}> : (i64, i64) -> i64
    %200 = "llvm.extractvalue"(%arg67) <{position = array<i64: 0>}> : (!llvm.struct<(ptr, i64)>) -> !llvm.ptr
    %201 = "llvm.getelementptr"(%200, %199) <{elem_type = f32, noWrapFlags = 0 : i32, rawConstantIndices = array<i32: -2147483648>}> : (!llvm.ptr, i64) -> !llvm.ptr
    "llvm.store"(%189, %201) <{ordering = 0 : i64}> : (f32, !llvm.ptr) -> ()
    %202 = "llvm.mlir.constant"() <{value = 10 : index}> : () -> i64
    %203 = "llvm.mul"(%202, %188) <{overflowFlags = 0 : i32}> : (i64, i64) -> i64
    %204 = "llvm.mlir.undef"() : () -> !llvm.struct<(ptr, i64)>
    %205 = "llvm.mlir.constant"() <{value = 4 : index}> : () -> i64
    %206 = "llvm.mul"(%203, %205) <{overflowFlags = 0 : i32}> : (i64, i64) -> i64
    %207 = "llvm.call"(%206) <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @malloc, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 1, 0>}> : (i64) -> !llvm.ptr
    %208 = "llvm.insertvalue"(%204, %207) <{position = array<i64: 0>}> : (!llvm.struct<(ptr, i64)>, !llvm.ptr) -> !llvm.struct<(ptr, i64)>
    %209 = "llvm.insertvalue"(%208, %188) <{position = array<i64: 1>}> : (!llvm.struct<(ptr, i64)>, i64) -> !llvm.struct<(ptr, i64)>
    "llvm.return"(%209) : (!llvm.struct<(ptr, i64)>) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<i64 (struct<(ptr, i64, i64)>)>, linkage = #llvm.linkage<external>, sym_name = "memref_dim", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg64: !llvm.struct<(ptr, i64, i64)>):
    %180 = "llvm.mlir.constant"() <{value = 42 : index}> : () -> i64
    %181 = "llvm.extractvalue"(%arg64) <{position = array<i64: 1>}> : (!llvm.struct<(ptr, i64, i64)>) -> i64
    %182 = "llvm.mlir.constant"() <{value = 10 : index}> : () -> i64
    %183 = "llvm.extractvalue"(%arg64) <{position = array<i64: 2>}> : (!llvm.struct<(ptr, i64, i64)>) -> i64
    %184 = "llvm.add"(%180, %181) <{overflowFlags = 0 : i32}> : (i64, i64) -> i64
    %185 = "llvm.add"(%182, %183) <{overflowFlags = 0 : i32}> : (i64, i64) -> i64
    %186 = "llvm.add"(%184, %185) <{overflowFlags = 0 : i32}> : (i64, i64) -> i64
    "llvm.return"(%186) : (i64) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<i64 ()>, linkage = #llvm.linkage<external>, sym_name = "get_i64", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<f32 ()>, linkage = #llvm.linkage<external>, sym_name = "get_f32", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<struct<(ptr, i64, i64)> ()>, linkage = #llvm.linkage<external>, sym_name = "get_memref", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<struct<(i64, f32, struct<(ptr, i64, i64)>)> ()>, linkage = #llvm.linkage<external>, sym_name = "multireturn", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %173 = "llvm.call"() <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @get_i64, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 0, 0>}> : () -> i64
    %174 = "llvm.call"() <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @get_f32, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 0, 0>}> : () -> f32
    %175 = "llvm.call"() <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @get_memref, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 0, 0>}> : () -> !llvm.struct<(ptr, i64, i64)>
    %176 = "llvm.mlir.undef"() : () -> !llvm.struct<(i64, f32, struct<(ptr, i64, i64)>)>
    %177 = "llvm.insertvalue"(%176, %173) <{position = array<i64: 0>}> : (!llvm.struct<(i64, f32, struct<(ptr, i64, i64)>)>, i64) -> !llvm.struct<(i64, f32, struct<(ptr, i64, i64)>)>
    %178 = "llvm.insertvalue"(%177, %174) <{position = array<i64: 1>}> : (!llvm.struct<(i64, f32, struct<(ptr, i64, i64)>)>, f32) -> !llvm.struct<(i64, f32, struct<(ptr, i64, i64)>)>
    %179 = "llvm.insertvalue"(%178, %175) <{position = array<i64: 2>}> : (!llvm.struct<(i64, f32, struct<(ptr, i64, i64)>)>, !llvm.struct<(ptr, i64, i64)>) -> !llvm.struct<(i64, f32, struct<(ptr, i64, i64)>)>
    "llvm.return"(%179) : (!llvm.struct<(i64, f32, struct<(ptr, i64, i64)>)>) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "multireturn_caller", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %151 = "llvm.call"() <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @multireturn, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 0, 0>}> : () -> !llvm.struct<(i64, f32, struct<(ptr, i64, i64)>)>
    %152 = "llvm.extractvalue"(%151) <{position = array<i64: 0>}> : (!llvm.struct<(i64, f32, struct<(ptr, i64, i64)>)>) -> i64
    %153 = "llvm.extractvalue"(%151) <{position = array<i64: 1>}> : (!llvm.struct<(i64, f32, struct<(ptr, i64, i64)>)>) -> f32
    %154 = "llvm.extractvalue"(%151) <{position = array<i64: 2>}> : (!llvm.struct<(i64, f32, struct<(ptr, i64, i64)>)>) -> !llvm.struct<(ptr, i64, i64)>
    %155 = "llvm.mlir.constant"() <{value = 42 : i64}> : () -> i64
    %156 = "llvm.add"(%152, %155) <{overflowFlags = 0 : i32}> : (i64, i64) -> i64
    %157 = "llvm.mlir.constant"() <{value = 4.200000e+01 : f32}> : () -> f32
    %158 = "llvm.fadd"(%153, %157) <{fastmathFlags = #llvm.fastmath<none>}> : (f32, f32) -> f32
    %159 = "llvm.mlir.constant"() <{value = 0 : index}> : () -> i64
    %160 = "llvm.mlir.constant"() <{value = 42 : index}> : () -> i64
    %161 = "llvm.extractvalue"(%154) <{position = array<i64: 1>}> : (!llvm.struct<(ptr, i64, i64)>) -> i64
    %162 = "llvm.mlir.constant"() <{value = 10 : index}> : () -> i64
    %163 = "llvm.extractvalue"(%154) <{position = array<i64: 2>}> : (!llvm.struct<(ptr, i64, i64)>) -> i64
    %164 = "llvm.mul"(%159, %161) <{overflowFlags = 0 : i32}> : (i64, i64) -> i64
    %165 = "llvm.add"(%164, %159) <{overflowFlags = 0 : i32}> : (i64, i64) -> i64
    %166 = "llvm.mul"(%165, %162) <{overflowFlags = 0 : i32}> : (i64, i64) -> i64
    %167 = "llvm.add"(%166, %159) <{overflowFlags = 0 : i32}> : (i64, i64) -> i64
    %168 = "llvm.mul"(%167, %163) <{overflowFlags = 0 : i32}> : (i64, i64) -> i64
    %169 = "llvm.add"(%168, %159) <{overflowFlags = 0 : i32}> : (i64, i64) -> i64
    %170 = "llvm.extractvalue"(%154) <{position = array<i64: 0>}> : (!llvm.struct<(ptr, i64, i64)>) -> !llvm.ptr
    %171 = "llvm.getelementptr"(%170, %169) <{elem_type = f32, noWrapFlags = 0 : i32, rawConstantIndices = array<i32: -2147483648>}> : (!llvm.ptr, i64) -> !llvm.ptr
    %172 = "llvm.load"(%171) <{ordering = 0 : i64}> : (!llvm.ptr) -> f32
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<vector<4xf32> (vector<4xf32>, vector<4xi1>, vector<4xi64>)>, linkage = #llvm.linkage<external>, sym_name = "vector_ops", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg61: vector<4xf32>, %arg62: vector<4xi1>, %arg63: vector<4xi64>):
    %136 = "llvm.mlir.constant"() <{value = dense<4.200000e+01> : vector<4xf32>}> : () -> vector<4xf32>
    %137 = "llvm.fadd"(%arg61, %136) <{fastmathFlags = #llvm.fastmath<none>}> : (vector<4xf32>, vector<4xf32>) -> vector<4xf32>
    %138 = "llvm.select"(%arg62, %137, %arg61) <{fastmathFlags = #llvm.fastmath<none>}> : (vector<4xi1>, vector<4xf32>, vector<4xf32>) -> vector<4xf32>
    %139 = "llvm.sdiv"(%arg63, %arg63) : (vector<4xi64>, vector<4xi64>) -> vector<4xi64>
    %140 = "llvm.udiv"(%arg63, %arg63) : (vector<4xi64>, vector<4xi64>) -> vector<4xi64>
    %141 = "llvm.srem"(%arg63, %arg63) : (vector<4xi64>, vector<4xi64>) -> vector<4xi64>
    %142 = "llvm.urem"(%arg63, %arg63) : (vector<4xi64>, vector<4xi64>) -> vector<4xi64>
    %143 = "llvm.fdiv"(%arg61, %136) <{fastmathFlags = #llvm.fastmath<none>}> : (vector<4xf32>, vector<4xf32>) -> vector<4xf32>
    %144 = "llvm.frem"(%arg61, %136) <{fastmathFlags = #llvm.fastmath<none>}> : (vector<4xf32>, vector<4xf32>) -> vector<4xf32>
    %145 = "llvm.and"(%arg63, %arg63) : (vector<4xi64>, vector<4xi64>) -> vector<4xi64>
    %146 = "llvm.or"(%arg63, %arg63) : (vector<4xi64>, vector<4xi64>) -> vector<4xi64>
    %147 = "llvm.xor"(%arg63, %arg63) : (vector<4xi64>, vector<4xi64>) -> vector<4xi64>
    %148 = "llvm.shl"(%arg63, %arg63) <{overflowFlags = 0 : i32}> : (vector<4xi64>, vector<4xi64>) -> vector<4xi64>
    %149 = "llvm.lshr"(%arg63, %arg63) : (vector<4xi64>, vector<4xi64>) -> vector<4xi64>
    %150 = "llvm.ashr"(%arg63, %arg63) : (vector<4xi64>, vector<4xi64>) -> vector<4xi64>
    "llvm.return"(%137) : (vector<4xf32>) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<vector<4xf32> ()>, linkage = #llvm.linkage<external>, sym_name = "vector_splat_1d", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %135 = "llvm.mlir.constant"() <{value = dense<0.000000e+00> : vector<4xf32>}> : () -> vector<4xf32>
    "llvm.return"(%135) : (vector<4xf32>) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<vector<[4]xf32> ()>, linkage = #llvm.linkage<external>, sym_name = "vector_splat_1d_scalable", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %134 = "llvm.mlir.constant"() <{value = dense<0.000000e+00> : vector<[4]xf32>}> : () -> vector<[4]xf32>
    "llvm.return"(%134) : (vector<[4]xf32>) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<array<4 x vector<16xf32>> ()>, linkage = #llvm.linkage<external>, sym_name = "vector_splat_2d", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %133 = "llvm.mlir.constant"() <{value = dense<0.000000e+00> : vector<4x16xf32>}> : () -> !llvm.array<4 x vector<16xf32>>
    "llvm.return"(%133) : (!llvm.array<4 x vector<16xf32>>) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<array<4 x array<16 x vector<4xf32>>> ()>, linkage = #llvm.linkage<external>, sym_name = "vector_splat_3d", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %132 = "llvm.mlir.constant"() <{value = dense<0.000000e+00> : vector<4x16x4xf32>}> : () -> !llvm.array<4 x array<16 x vector<4xf32>>>
    "llvm.return"(%132) : (!llvm.array<4 x array<16 x vector<4xf32>>>) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<vector<4xf32> ()>, linkage = #llvm.linkage<external>, sym_name = "vector_splat_nonzero", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %131 = "llvm.mlir.constant"() <{value = dense<1.000000e+00> : vector<4xf32>}> : () -> vector<4xf32>
    "llvm.return"(%131) : (vector<4xf32>) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<vector<[4]xf32> ()>, linkage = #llvm.linkage<external>, sym_name = "vector_splat_nonzero_scalable", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %130 = "llvm.mlir.constant"() <{value = dense<1.000000e+00> : vector<[4]xf32>}> : () -> vector<[4]xf32>
    "llvm.return"(%130) : (vector<[4]xf32>) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<struct<(f32, i32)> (f32, f32, i32, i32)>, linkage = #llvm.linkage<external>, sym_name = "ops", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg57: f32, %arg58: f32, %arg59: i32, %arg60: i32):
    %110 = "llvm.fsub"(%arg57, %arg58) <{fastmathFlags = #llvm.fastmath<none>}> : (f32, f32) -> f32
    %111 = "llvm.sub"(%arg59, %arg60) <{overflowFlags = 0 : i32}> : (i32, i32) -> i32
    %112 = "llvm.icmp"(%arg59, %111) <{predicate = 2 : i64}> : (i32, i32) -> i1
    %113 = "llvm.select"(%112, %arg59, %111) <{fastmathFlags = #llvm.fastmath<none>}> : (i1, i32, i32) -> i32
    %114 = "llvm.sdiv"(%arg59, %arg60) : (i32, i32) -> i32
    %115 = "llvm.udiv"(%arg59, %arg60) : (i32, i32) -> i32
    %116 = "llvm.srem"(%arg59, %arg60) : (i32, i32) -> i32
    %117 = "llvm.urem"(%arg59, %arg60) : (i32, i32) -> i32
    %118 = "llvm.mlir.undef"() : () -> !llvm.struct<(f32, i32)>
    %119 = "llvm.insertvalue"(%118, %110) <{position = array<i64: 0>}> : (!llvm.struct<(f32, i32)>, f32) -> !llvm.struct<(f32, i32)>
    %120 = "llvm.insertvalue"(%119, %113) <{position = array<i64: 1>}> : (!llvm.struct<(f32, i32)>, i32) -> !llvm.struct<(f32, i32)>
    %121 = "llvm.fdiv"(%arg57, %arg58) <{fastmathFlags = #llvm.fastmath<none>}> : (f32, f32) -> f32
    %122 = "llvm.frem"(%arg57, %arg58) <{fastmathFlags = #llvm.fastmath<none>}> : (f32, f32) -> f32
    %123 = "llvm.and"(%arg59, %arg60) : (i32, i32) -> i32
    %124 = "llvm.or"(%arg59, %arg60) : (i32, i32) -> i32
    %125 = "llvm.xor"(%arg59, %arg60) : (i32, i32) -> i32
    %126 = "llvm.shl"(%arg59, %arg60) <{overflowFlags = 0 : i32}> : (i32, i32) -> i32
    %127 = "llvm.lshr"(%arg59, %arg60) : (i32, i32) -> i32
    %128 = "llvm.ashr"(%arg59, %arg60) : (i32, i32) -> i32
    %129 = "llvm.fneg"(%arg57) <{fastmathFlags = #llvm.fastmath<none>}> : (f32) -> f32
    "llvm.return"(%120) : (!llvm.struct<(f32, i32)>) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr, i64, ptr)>, linkage = #llvm.linkage<external>, sym_name = "gep", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg54: !llvm.ptr, %arg55: i64, %arg56: !llvm.ptr):
    %104 = "llvm.getelementptr"(%arg54, %arg55) <{elem_type = !llvm.struct<(i32, struct<(i32, f32)>)>, noWrapFlags = 0 : i32, rawConstantIndices = array<i32: -2147483648, 1, 0>}> : (!llvm.ptr, i64) -> !llvm.ptr
    %105 = "llvm.getelementptr"(%arg56, %arg55, %arg55) <{elem_type = !llvm.struct<(array<10 x f32>)>, noWrapFlags = 3 : i32, rawConstantIndices = array<i32: -2147483648, 0, -2147483648>}> : (!llvm.ptr, i64, i64) -> !llvm.ptr
    %106 = "llvm.getelementptr"(%arg56, %arg55, %arg55) <{elem_type = !llvm.struct<(array<10 x f32>)>, noWrapFlags = 7 : i32, rawConstantIndices = array<i32: -2147483648, 0, -2147483648>}> : (!llvm.ptr, i64, i64) -> !llvm.ptr
    %107 = "llvm.getelementptr"(%arg56, %arg55, %arg55) <{elem_type = !llvm.struct<(array<10 x f32>)>, noWrapFlags = 2 : i32, rawConstantIndices = array<i32: -2147483648, 0, -2147483648>}> : (!llvm.ptr, i64, i64) -> !llvm.ptr
    %108 = "llvm.getelementptr"(%arg56, %arg55, %arg55) <{elem_type = !llvm.struct<(array<10 x f32>)>, noWrapFlags = 6 : i32, rawConstantIndices = array<i32: -2147483648, 0, -2147483648>}> : (!llvm.ptr, i64, i64) -> !llvm.ptr
    %109 = "llvm.getelementptr"(%arg56, %arg55, %arg55) <{elem_type = !llvm.struct<(array<10 x f32>)>, noWrapFlags = 4 : i32, rawConstantIndices = array<i32: -2147483648, 0, -2147483648>}> : (!llvm.ptr, i64, i64) -> !llvm.ptr
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (i64)>, linkage = #llvm.linkage<external>, sym_name = "indirect_const_call", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg53: i64):
    %103 = "llvm.mlir.addressof"() <{global_name = @body}> : () -> !llvm.ptr
    "llvm.call"(%103, %arg53) <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 2, 0>}> : (!llvm.ptr, i64) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<i32 (ptr<42>, f32)>, linkage = #llvm.linkage<external>, sym_name = "indirect_call", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg51: !llvm.ptr<42>, %arg52: f32):
    %102 = "llvm.call"(%arg51, %arg52) <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 2, 0>}> : (!llvm.ptr<42>, f32) -> i32
    "llvm.return"(%102) : (i32) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (i1, i1)>, linkage = #llvm.linkage<external>, sym_name = "cond_br_arguments", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg49: i1, %arg50: i1):
    "llvm.cond_br"(%arg49, %arg49)[^bb1, ^bb2] <{operandSegmentSizes = array<i32: 1, 1, 0>}> : (i1, i1) -> ()
  ^bb1(%101: i1):  // 2 preds: ^bb0, ^bb2
    "llvm.return"() : () -> ()
  ^bb2:  // pred: ^bb0
    "llvm.br"(%arg50)[^bb1] : (i1) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, arg_attrs = [{llvm.noalias}], function_type = !llvm.func<void (ptr)>, linkage = #llvm.linkage<external>, sym_name = "llvm_noalias", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg48: !llvm.ptr):
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, arg_attrs = [{llvm.noalias}], function_type = !llvm.func<void (ptr)>, linkage = #llvm.linkage<external>, sym_name = "llvm_noalias_decl", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, arg_attrs = [{llvm.byref = i32}], function_type = !llvm.func<void (ptr)>, linkage = #llvm.linkage<external>, sym_name = "byrefattr", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg47: !llvm.ptr):
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, arg_attrs = [{llvm.byref = i32}], function_type = !llvm.func<void (ptr)>, linkage = #llvm.linkage<external>, sym_name = "byrefattr_decl", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, arg_attrs = [{llvm.byval = i32}], function_type = !llvm.func<void (ptr)>, linkage = #llvm.linkage<external>, sym_name = "byvalattr", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg46: !llvm.ptr):
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, arg_attrs = [{llvm.byval = i32}], function_type = !llvm.func<void (ptr)>, linkage = #llvm.linkage<external>, sym_name = "byvalattr_decl", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, arg_attrs = [{llvm.sret = i32}], function_type = !llvm.func<void (ptr)>, linkage = #llvm.linkage<external>, sym_name = "sretattr", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg45: !llvm.ptr):
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, arg_attrs = [{llvm.sret = i32}], function_type = !llvm.func<void (ptr)>, linkage = #llvm.linkage<external>, sym_name = "sretattr_decl", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, arg_attrs = [{llvm.nest}], function_type = !llvm.func<void (ptr)>, linkage = #llvm.linkage<external>, sym_name = "nestattr", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg44: !llvm.ptr):
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, arg_attrs = [{llvm.nest}], function_type = !llvm.func<void (ptr)>, linkage = #llvm.linkage<external>, sym_name = "nestattr_decl", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, arg_attrs = [{llvm.noundef}], function_type = !llvm.func<void (i32)>, linkage = #llvm.linkage<external>, sym_name = "noundefattr", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg43: i32):
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, arg_attrs = [{llvm.noundef}], function_type = !llvm.func<void (i32)>, linkage = #llvm.linkage<external>, sym_name = "noundefattr_decl", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, arg_attrs = [{llvm.align = 4 : i64}], function_type = !llvm.func<void (ptr)>, linkage = #llvm.linkage<external>, sym_name = "llvm_align", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg42: !llvm.ptr):
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, arg_attrs = [{llvm.align = 4 : i64}], function_type = !llvm.func<void (ptr)>, linkage = #llvm.linkage<external>, sym_name = "llvm_align_decl", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, arg_attrs = [{llvm.inalloca = i32}], function_type = !llvm.func<void (ptr)>, linkage = #llvm.linkage<external>, sym_name = "inallocaattr", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg41: !llvm.ptr):
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, arg_attrs = [{llvm.inalloca = i32}], function_type = !llvm.func<void (ptr)>, linkage = #llvm.linkage<external>, sym_name = "inallocaattr_decl", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, arg_attrs = [{llvm.signext}], function_type = !llvm.func<void (i1)>, linkage = #llvm.linkage<external>, sym_name = "signextattr", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg40: i1):
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, arg_attrs = [{llvm.signext}], function_type = !llvm.func<void (i1)>, linkage = #llvm.linkage<external>, sym_name = "signextattr_decl", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, arg_attrs = [{llvm.zeroext}], function_type = !llvm.func<void (i1)>, linkage = #llvm.linkage<external>, sym_name = "zeroextattr", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg39: i1):
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, arg_attrs = [{llvm.zeroext}], function_type = !llvm.func<void (i1)>, linkage = #llvm.linkage<external>, sym_name = "zeroextattr_decl", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, arg_attrs = [{llvm.align = 64 : i64}], function_type = !llvm.func<void (ptr)>, linkage = #llvm.linkage<external>, sym_name = "alignattr_decl", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, arg_attrs = [{llvm.dereferenceable = 32 : i64}], function_type = !llvm.func<void (ptr)>, linkage = #llvm.linkage<external>, sym_name = "dereferenceableattr_decl", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, arg_attrs = [{llvm.dereferenceable_or_null = 32 : i64}], function_type = !llvm.func<void (ptr)>, linkage = #llvm.linkage<external>, sym_name = "dereferenceableornullattr_decl", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, arg_attrs = [{llvm.inreg}], function_type = !llvm.func<void (ptr)>, linkage = #llvm.linkage<external>, sym_name = "inregattr_decl", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, arg_attrs = [{llvm.nocapture}], function_type = !llvm.func<void (ptr)>, linkage = #llvm.linkage<external>, sym_name = "nocaptureattr_decl", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, arg_attrs = [{llvm.nofree}], function_type = !llvm.func<void (ptr)>, linkage = #llvm.linkage<external>, sym_name = "nofreeattr_decl", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, arg_attrs = [{llvm.nonnull}], function_type = !llvm.func<void (ptr)>, linkage = #llvm.linkage<external>, sym_name = "nonnullattr_decl", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, arg_attrs = [{llvm.preallocated = f32}], function_type = !llvm.func<void (ptr)>, linkage = #llvm.linkage<external>, sym_name = "preallocatedattr_decl", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, arg_attrs = [{llvm.returned}], function_type = !llvm.func<ptr (ptr)>, linkage = #llvm.linkage<external>, sym_name = "returnedattr_decl", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, arg_attrs = [{llvm.alignstack = 32 : i64}], function_type = !llvm.func<void (ptr)>, linkage = #llvm.linkage<external>, sym_name = "alignstackattr_decl", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, arg_attrs = [{llvm.writeonly}], function_type = !llvm.func<void (ptr)>, linkage = #llvm.linkage<external>, sym_name = "writeonlyattr_decl", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, arg_attrs = [{llvm.writable}], function_type = !llvm.func<void (ptr)>, linkage = #llvm.linkage<external>, sym_name = "writableattr", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg38: !llvm.ptr):
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, arg_attrs = [{llvm.writable}], function_type = !llvm.func<void (ptr)>, linkage = #llvm.linkage<external>, sym_name = "writableattr_decl", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, arg_attrs = [{llvm.dead_on_unwind}], function_type = !llvm.func<void (ptr)>, linkage = #llvm.linkage<external>, sym_name = "deadonunwindattr", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg37: !llvm.ptr):
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, arg_attrs = [{llvm.dead_on_unwind}], function_type = !llvm.func<void (ptr)>, linkage = #llvm.linkage<external>, sym_name = "deadonunwindattr_decl", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, arg_attrs = [{llvm.dead_on_return = 8 : i64}], function_type = !llvm.func<void (ptr)>, linkage = #llvm.linkage<external>, sym_name = "deadonreturnattr", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg36: !llvm.ptr):
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, arg_attrs = [{llvm.dead_on_return = 8 : i64}], function_type = !llvm.func<void (ptr)>, linkage = #llvm.linkage<external>, sym_name = "deadonreturnattr_decl", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, arg_attrs = [{llvm.nofpclass = 519 : i64}], function_type = !llvm.func<void (f32)>, linkage = #llvm.linkage<external>, sym_name = "nofpclassattr", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg35: f32):
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, arg_attrs = [{llvm.nofpclass = 519 : i64}], function_type = !llvm.func<void (f32)>, linkage = #llvm.linkage<external>, sym_name = "nofpclassattr_decl", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<f32 ()>, linkage = #llvm.linkage<external>, res_attrs = [{llvm.nofpclass = 519 : i64}], sym_name = "nofpclassattr_ret_decl", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<ptr ()>, linkage = #llvm.linkage<external>, res_attrs = [{llvm.align = 4 : i64}], sym_name = "alignattr_ret_decl", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<ptr ()>, linkage = #llvm.linkage<external>, res_attrs = [{llvm.noalias}], sym_name = "noaliasattr_ret_decl", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<ptr ()>, linkage = #llvm.linkage<external>, res_attrs = [{llvm.noundef}], sym_name = "noundefattr_ret_decl", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<i1 ()>, linkage = #llvm.linkage<external>, res_attrs = [{llvm.signext}], sym_name = "signextattr_ret_decl", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<i1 ()>, linkage = #llvm.linkage<external>, res_attrs = [{llvm.zeroext}], sym_name = "zeroextattr_ret_decl", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<ptr ()>, linkage = #llvm.linkage<external>, res_attrs = [{llvm.nonnull}], sym_name = "nonnullattr_ret_decl", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<ptr ()>, linkage = #llvm.linkage<external>, res_attrs = [{llvm.dereferenceable = 32 : i64}], sym_name = "dereferenceableattr_ret_decl", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<ptr ()>, linkage = #llvm.linkage<external>, res_attrs = [{llvm.dereferenceable_or_null = 16 : i64}], sym_name = "dereferenceableornullattr_ret_decl", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<ptr ()>, linkage = #llvm.linkage<external>, res_attrs = [{llvm.inreg}], sym_name = "inregattr_ret_decl", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<f32 (...)>, linkage = #llvm.linkage<external>, sym_name = "varargs", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (i32)>, linkage = #llvm.linkage<external>, sym_name = "varargs_call", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg34: i32):
    %99 = "llvm.call"(%arg34) <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @varargs, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 1, 0>, var_callee_type = !llvm.func<f32 (...)>}> : (i32) -> f32
    %100 = "llvm.call"(%arg34) <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @varargs, fastmathFlags = #llvm.fastmath<nnan>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 1, 0>, var_callee_type = !llvm.func<f32 (...)>}> : (i32) -> f32
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr, i32)>, linkage = #llvm.linkage<external>, sym_name = "indirect_varargs_call", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg32: !llvm.ptr, %arg33: i32):
    %97 = "llvm.call"(%arg32, %arg33) <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 2, 0>, var_callee_type = !llvm.func<f32 (...)>}> : (!llvm.ptr, i32) -> f32
    %98 = "llvm.call"(%arg32, %arg33) <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, fastmathFlags = #llvm.fastmath<nnan>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 2, 0>, var_callee_type = !llvm.func<f32 (...)>}> : (!llvm.ptr, i32) -> f32
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<i32 (i32)>, linkage = #llvm.linkage<external>, sym_name = "intpointerconversion", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg31: i32):
    %95 = "llvm.inttoptr"(%arg31) : (i32) -> !llvm.ptr
    %96 = "llvm.ptrtoint"(%95) : (!llvm.ptr) -> i32
    "llvm.return"(%96) : (i32) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<i64 (ptr)>, linkage = #llvm.linkage<external>, sym_name = "addrpointerconversion_scalar", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg30: !llvm.ptr):
    %94 = "llvm.ptrtoaddr"(%arg30) : (!llvm.ptr) -> i64
    "llvm.return"(%94) : (i64) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<vector<3xi64> (vector<3x!llvm.ptr>)>, linkage = #llvm.linkage<external>, sym_name = "addrpointerconversion_vector", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg29: vector<3x!llvm.ptr>):
    %93 = "llvm.ptrtoaddr"(%arg29) : (vector<3x!llvm.ptr>) -> vector<3xi64>
    "llvm.return"(%93) : (vector<3xi64>) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<i32 (i32)>, linkage = #llvm.linkage<external>, sym_name = "fpconversion", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg28: i32):
    %89 = "llvm.sitofp"(%arg28) : (i32) -> f32
    %90 = "llvm.fptosi"(%89) : (f32) -> i32
    %91 = "llvm.uitofp"(%90) : (i32) -> f32
    %92 = "llvm.fptoui"(%91) : (f32) -> i32
    "llvm.return"(%92) : (i32) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<ptr<2> (ptr)>, linkage = #llvm.linkage<external>, sym_name = "addrspace", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg27: !llvm.ptr):
    %88 = "llvm.addrspacecast"(%arg27) : (!llvm.ptr) -> !llvm.ptr<2>
    "llvm.return"(%88) : (!llvm.ptr<2>) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<array<12 x i8> ()>, linkage = #llvm.linkage<external>, sym_name = "stringconstant", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %87 = "llvm.mlir.constant"() <{value = "Hello world!"}> : () -> !llvm.array<12 x i8>
    "llvm.return"(%87) : (!llvm.array<12 x i8>) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<struct<(f32, f32)> ()>, linkage = #llvm.linkage<external>, sym_name = "complexfpconstant", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %86 = "llvm.mlir.constant"() <{value = [-1.000000e+00 : f32, 0.000000e+00 : f32]}> : () -> !llvm.struct<(f32, f32)>
    "llvm.return"(%86) : (!llvm.struct<(f32, f32)>) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<struct<(i32, i32)> ()>, linkage = #llvm.linkage<external>, sym_name = "complexintconstant", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %85 = "llvm.mlir.constant"() <{value = [-1 : i32, 0 : i32]}> : () -> !llvm.struct<(i32, i32)>
    "llvm.return"(%85) : (!llvm.struct<(i32, i32)>) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<array<2 x struct<(i32, i32)>> ()>, linkage = #llvm.linkage<external>, sym_name = "complexintconstantsplat", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %84 = "llvm.mlir.constant"() <{value = dense<(0,1)> : tensor<2xcomplex<i32>>}> : () -> !llvm.array<2 x struct<(i32, i32)>>
    "llvm.return"(%84) : (!llvm.array<2 x struct<(i32, i32)>>) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<array<1 x struct<(i32, i32)>> ()>, linkage = #llvm.linkage<external>, sym_name = "complexintconstantsingle", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %83 = "llvm.mlir.constant"() <{value = dense<(0,1)> : tensor<complex<i32>>}> : () -> !llvm.array<1 x struct<(i32, i32)>>
    "llvm.return"(%83) : (!llvm.array<1 x struct<(i32, i32)>>) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<array<2 x array<2 x struct<(i32, i32)>>> ()>, linkage = #llvm.linkage<external>, sym_name = "complexintconstantarray", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %82 = "llvm.mlir.constant"() <{value = dense<[[(0,1), (2,3)], [(4,5), (6,7)]]> : tensor<2x2xcomplex<i32>>}> : () -> !llvm.array<2 x array<2 x struct<(i32, i32)>>>
    "llvm.return"(%82) : (!llvm.array<2 x array<2 x struct<(i32, i32)>>>) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<struct<(i32, f32)> ()>, linkage = #llvm.linkage<external>, sym_name = "structconstant", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %81 = "llvm.mlir.constant"() <{value = [1 : i32, 2.000000e+00 : f32]}> : () -> !llvm.struct<(i32, f32)>
    "llvm.return"(%81) : (!llvm.struct<(i32, f32)>) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<vector<3xi32> ()>, linkage = #llvm.linkage<external>, sym_name = "indexconstantsplat", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %80 = "llvm.mlir.constant"() <{value = dense<42> : vector<3xindex>}> : () -> vector<3xi32>
    "llvm.return"(%80) : (vector<3xi32>) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<vector<3xi32> ()>, linkage = #llvm.linkage<external>, sym_name = "indexconstantarray", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %79 = "llvm.mlir.constant"() <{value = dense<[0, 1, 2]> : vector<3xindex>}> : () -> vector<3xi32>
    "llvm.return"(%79) : (vector<3xi32>) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "noreach", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "llvm.unreachable"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (f32, f32)>, linkage = #llvm.linkage<external>, sym_name = "fcmp", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg25: f32, %arg26: f32):
    %65 = "llvm.fcmp"(%arg25, %arg26) <{fastmathFlags = #llvm.fastmath<none>, predicate = 1 : i64}> : (f32, f32) -> i1
    %66 = "llvm.fcmp"(%arg25, %arg26) <{fastmathFlags = #llvm.fastmath<none>, predicate = 2 : i64}> : (f32, f32) -> i1
    %67 = "llvm.fcmp"(%arg25, %arg26) <{fastmathFlags = #llvm.fastmath<none>, predicate = 3 : i64}> : (f32, f32) -> i1
    %68 = "llvm.fcmp"(%arg25, %arg26) <{fastmathFlags = #llvm.fastmath<none>, predicate = 4 : i64}> : (f32, f32) -> i1
    %69 = "llvm.fcmp"(%arg25, %arg26) <{fastmathFlags = #llvm.fastmath<none>, predicate = 5 : i64}> : (f32, f32) -> i1
    %70 = "llvm.fcmp"(%arg25, %arg26) <{fastmathFlags = #llvm.fastmath<none>, predicate = 6 : i64}> : (f32, f32) -> i1
    %71 = "llvm.fcmp"(%arg25, %arg26) <{fastmathFlags = #llvm.fastmath<none>, predicate = 7 : i64}> : (f32, f32) -> i1
    %72 = "llvm.fcmp"(%arg25, %arg26) <{fastmathFlags = #llvm.fastmath<none>, predicate = 8 : i64}> : (f32, f32) -> i1
    %73 = "llvm.fcmp"(%arg25, %arg26) <{fastmathFlags = #llvm.fastmath<none>, predicate = 9 : i64}> : (f32, f32) -> i1
    %74 = "llvm.fcmp"(%arg25, %arg26) <{fastmathFlags = #llvm.fastmath<none>, predicate = 10 : i64}> : (f32, f32) -> i1
    %75 = "llvm.fcmp"(%arg25, %arg26) <{fastmathFlags = #llvm.fastmath<none>, predicate = 11 : i64}> : (f32, f32) -> i1
    %76 = "llvm.fcmp"(%arg25, %arg26) <{fastmathFlags = #llvm.fastmath<none>, predicate = 12 : i64}> : (f32, f32) -> i1
    %77 = "llvm.fcmp"(%arg25, %arg26) <{fastmathFlags = #llvm.fastmath<none>, predicate = 13 : i64}> : (f32, f32) -> i1
    %78 = "llvm.fcmp"(%arg25, %arg26) <{fastmathFlags = #llvm.fastmath<none>, predicate = 14 : i64}> : (f32, f32) -> i1
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (vector<4xf32>, i32, f32)>, linkage = #llvm.linkage<external>, sym_name = "vect", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg22: vector<4xf32>, %arg23: i32, %arg24: f32):
    %62 = "llvm.extractelement"(%arg22, %arg23) : (vector<4xf32>, i32) -> f32
    %63 = "llvm.insertelement"(%arg22, %arg24, %arg23) : (vector<4xf32>, f32, i32) -> vector<4xf32>
    %64 = "llvm.shufflevector"(%arg22, %arg22) <{mask = array<i32: 0, 0, 0, 0, 7>}> : (vector<4xf32>, vector<4xf32>) -> vector<5xf32>
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (vector<4xf32>, i64, f32)>, linkage = #llvm.linkage<external>, sym_name = "vect_i64idx", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg19: vector<4xf32>, %arg20: i64, %arg21: f32):
    %60 = "llvm.extractelement"(%arg19, %arg20) : (vector<4xf32>, i64) -> f32
    %61 = "llvm.insertelement"(%arg19, %arg21, %arg20) : (vector<4xf32>, f32, i64) -> vector<4xf32>
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (vector<[4]xf32>, i32, f32)>, linkage = #llvm.linkage<external>, sym_name = "scalable_vect", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg16: vector<[4]xf32>, %arg17: i32, %arg18: f32):
    %57 = "llvm.extractelement"(%arg16, %arg17) : (vector<[4]xf32>, i32) -> f32
    %58 = "llvm.insertelement"(%arg16, %arg18, %arg17) : (vector<[4]xf32>, f32, i32) -> vector<[4]xf32>
    %59 = "llvm.shufflevector"(%arg16, %arg16) <{mask = array<i32: 0, 0, 0, 0>}> : (vector<[4]xf32>, vector<[4]xf32>) -> vector<[4]xf32>
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (vector<[4]xf32>, i64, f32)>, linkage = #llvm.linkage<external>, sym_name = "scalable_vect_i64idx", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg13: vector<[4]xf32>, %arg14: i64, %arg15: f32):
    %55 = "llvm.extractelement"(%arg13, %arg14) : (vector<[4]xf32>, i64) -> f32
    %56 = "llvm.insertelement"(%arg13, %arg15, %arg14) : (vector<[4]xf32>, f32, i64) -> vector<[4]xf32>
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (i64)>, linkage = #llvm.linkage<external>, sym_name = "alloca", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg12: i64):
    %51 = "llvm.alloca"(%arg12) <{elem_type = i32}> : (i64) -> !llvm.ptr
    %52 = "llvm.alloca"(%arg12) <{alignment = 8 : i64, elem_type = i32}> : (i64) -> !llvm.ptr
    %53 = "llvm.alloca"(%arg12) <{elem_type = i32}> : (i64) -> !llvm.ptr<3>
    %54 = "llvm.alloca"(%arg12) <{elem_type = i32, inalloca}> : (i64) -> !llvm.ptr
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<vector<4xf32> ()>, linkage = #llvm.linkage<external>, sym_name = "constants", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %50 = "llvm.mlir.constant"() <{value = sparse<0, 4.200000e+01> : vector<4xf32>}> : () -> vector<4xf32>
    "llvm.return"(%50) : (vector<4xf32>) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<i16 (f32, f64)>, linkage = #llvm.linkage<external>, sym_name = "fp_casts", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg10: f32, %arg11: f64):
    %47 = "llvm.fptrunc"(%arg11) <{fastmathFlags = #llvm.fastmath<none>}> : (f64) -> f32
    %48 = "llvm.fpext"(%arg10) <{fastmathFlags = #llvm.fastmath<none>}> : (f32) -> f64
    %49 = "llvm.fptosi"(%48) : (f64) -> i16
    "llvm.return"(%49) : (i16) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (i32)>, linkage = #llvm.linkage<external>, sym_name = "integer_extension_and_truncation", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg9: i32):
    %44 = "llvm.sext"(%arg9) : (i32) -> i64
    %45 = "llvm.zext"(%arg9) : (i32) -> i64
    %46 = "llvm.trunc"(%arg9) <{overflowFlags = 0 : i32}> : (i32) -> i16
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<ptr ()>, linkage = #llvm.linkage<external>, sym_name = "null", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %43 = "llvm.mlir.zero"() : () -> !llvm.ptr
    "llvm.return"(%43) : (!llvm.ptr) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<array<2 x array<2 x vector<2xi32>>> ()>, linkage = #llvm.linkage<external>, sym_name = "elements_constant_3d_vector", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %42 = "llvm.mlir.constant"() <{value = dense<[[[1, 2], [3, 4]], [[42, 43], [44, 45]]]> : vector<2x2x2xi32>}> : () -> !llvm.array<2 x array<2 x vector<2xi32>>>
    "llvm.return"(%42) : (!llvm.array<2 x array<2 x vector<2xi32>>>) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<array<2 x array<2 x array<2 x i32>>> ()>, linkage = #llvm.linkage<external>, sym_name = "elements_constant_3d_array", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %41 = "llvm.mlir.constant"() <{value = dense<[[[1, 2], [3, 4]], [[42, 43], [44, 45]]]> : tensor<2x2x2xi32>}> : () -> !llvm.array<2 x array<2 x array<2 x i32>>>
    "llvm.return"(%41) : (!llvm.array<2 x array<2 x array<2 x i32>>>) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr, f32, ptr, i32, ptr, vector<2xf16>)>, linkage = #llvm.linkage<external>, sym_name = "atomicrmw", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg3: !llvm.ptr, %arg4: f32, %arg5: !llvm.ptr, %arg6: i32, %arg7: !llvm.ptr, %arg8: vector<2xf16>):
    %13 = "llvm.atomicrmw"(%arg3, %arg4) <{bin_op = 11 : i64, ordering = 2 : i64}> : (!llvm.ptr, f32) -> f32
    %14 = "llvm.atomicrmw"(%arg3, %arg4) <{bin_op = 12 : i64, ordering = 2 : i64}> : (!llvm.ptr, f32) -> f32
    %15 = "llvm.atomicrmw"(%arg3, %arg4) <{bin_op = 13 : i64, ordering = 2 : i64}> : (!llvm.ptr, f32) -> f32
    %16 = "llvm.atomicrmw"(%arg3, %arg4) <{bin_op = 14 : i64, ordering = 2 : i64}> : (!llvm.ptr, f32) -> f32
    %17 = "llvm.atomicrmw"(%arg3, %arg4) <{bin_op = 0 : i64, ordering = 2 : i64}> : (!llvm.ptr, f32) -> f32
    %18 = "llvm.atomicrmw"(%arg5, %arg6) <{bin_op = 1 : i64, ordering = 4 : i64}> : (!llvm.ptr, i32) -> i32
    %19 = "llvm.atomicrmw"(%arg5, %arg6) <{bin_op = 2 : i64, ordering = 5 : i64}> : (!llvm.ptr, i32) -> i32
    %20 = "llvm.atomicrmw"(%arg5, %arg6) <{bin_op = 3 : i64, ordering = 6 : i64}> : (!llvm.ptr, i32) -> i32
    %21 = "llvm.atomicrmw"(%arg5, %arg6) <{bin_op = 4 : i64, ordering = 7 : i64}> : (!llvm.ptr, i32) -> i32
    %22 = "llvm.atomicrmw"(%arg5, %arg6) <{bin_op = 5 : i64, ordering = 2 : i64}> : (!llvm.ptr, i32) -> i32
    %23 = "llvm.atomicrmw"(%arg5, %arg6) <{bin_op = 6 : i64, ordering = 2 : i64}> : (!llvm.ptr, i32) -> i32
    %24 = "llvm.atomicrmw"(%arg5, %arg6) <{bin_op = 7 : i64, ordering = 2 : i64}> : (!llvm.ptr, i32) -> i32
    %25 = "llvm.atomicrmw"(%arg5, %arg6) <{bin_op = 8 : i64, ordering = 2 : i64}> : (!llvm.ptr, i32) -> i32
    %26 = "llvm.atomicrmw"(%arg5, %arg6) <{bin_op = 9 : i64, ordering = 2 : i64}> : (!llvm.ptr, i32) -> i32
    %27 = "llvm.atomicrmw"(%arg5, %arg6) <{bin_op = 10 : i64, ordering = 2 : i64}> : (!llvm.ptr, i32) -> i32
    %28 = "llvm.atomicrmw"(%arg5, %arg6) <{bin_op = 15 : i64, ordering = 2 : i64}> : (!llvm.ptr, i32) -> i32
    %29 = "llvm.atomicrmw"(%arg5, %arg6) <{bin_op = 16 : i64, ordering = 2 : i64}> : (!llvm.ptr, i32) -> i32
    %30 = "llvm.atomicrmw"(%arg5, %arg6) <{bin_op = 17 : i64, ordering = 2 : i64}> : (!llvm.ptr, i32) -> i32
    %31 = "llvm.atomicrmw"(%arg5, %arg6) <{bin_op = 18 : i64, ordering = 2 : i64}> : (!llvm.ptr, i32) -> i32
    %32 = "llvm.atomicrmw"(%arg7, %arg8) <{bin_op = 11 : i64, ordering = 2 : i64}> : (!llvm.ptr, vector<2xf16>) -> vector<2xf16>
    %33 = "llvm.atomicrmw"(%arg7, %arg8) <{bin_op = 12 : i64, ordering = 2 : i64}> : (!llvm.ptr, vector<2xf16>) -> vector<2xf16>
    %34 = "llvm.atomicrmw"(%arg7, %arg8) <{bin_op = 13 : i64, ordering = 2 : i64}> : (!llvm.ptr, vector<2xf16>) -> vector<2xf16>
    %35 = "llvm.atomicrmw"(%arg7, %arg8) <{bin_op = 14 : i64, ordering = 2 : i64}> : (!llvm.ptr, vector<2xf16>) -> vector<2xf16>
    %36 = "llvm.atomicrmw"(%arg3, %arg4) <{bin_op = 19 : i64, ordering = 2 : i64}> : (!llvm.ptr, f32) -> f32
    %37 = "llvm.atomicrmw"(%arg3, %arg4) <{bin_op = 20 : i64, ordering = 2 : i64}> : (!llvm.ptr, f32) -> f32
    %38 = "llvm.atomicrmw"(%arg7, %arg8) <{bin_op = 19 : i64, ordering = 2 : i64}> : (!llvm.ptr, vector<2xf16>) -> vector<2xf16>
    %39 = "llvm.atomicrmw"(%arg7, %arg8) <{bin_op = 20 : i64, ordering = 2 : i64}> : (!llvm.ptr, vector<2xf16>) -> vector<2xf16>
    %40 = "llvm.atomicrmw"(%arg5, %arg6) <{alignment = 8 : i64, bin_op = 16 : i64, ordering = 2 : i64, syncscope = "singlethread", volatile_}> : (!llvm.ptr, i32) -> i32
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr, i32, i32)>, linkage = #llvm.linkage<external>, sym_name = "cmpxchg", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: !llvm.ptr, %arg1: i32, %arg2: i32):
    %9 = "llvm.cmpxchg"(%arg0, %arg1, %arg2) <{failure_ordering = 2 : i64, success_ordering = 6 : i64}> : (!llvm.ptr, i32, i32) -> !llvm.struct<(i32, i1)>
    %10 = "llvm.extractvalue"(%9) <{position = array<i64: 0>}> : (!llvm.struct<(i32, i1)>) -> i32
    %11 = "llvm.extractvalue"(%9) <{position = array<i64: 1>}> : (!llvm.struct<(i32, i1)>) -> i1
    %12 = "llvm.cmpxchg"(%arg0, %arg1, %arg2) <{alignment = 8 : i64, failure_ordering = 2 : i64, success_ordering = 6 : i64, syncscope = "singlethread", volatile_, weak}> : (!llvm.ptr, i32, i32) -> !llvm.struct<(i32, i1)>
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.mlir.global"() <{addr_space = 0 : i32, constant, global_type = !llvm.ptr, linkage = #llvm.linkage<external>, sym_name = "_ZTIi", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr)>, linkage = #llvm.linkage<external>, sym_name = "foo", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr, ...)>, linkage = #llvm.linkage<external>, sym_name = "vararg_foo", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<ptr (ptr)>, linkage = #llvm.linkage<external>, sym_name = "bar", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<i32 (...)>, linkage = #llvm.linkage<external>, sym_name = "__gxx_personality_v0", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<i32 ()>, linkage = #llvm.linkage<external>, personality = @__gxx_personality_v0, sym_name = "invokeLandingpad", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %0 = "llvm.mlir.constant"() <{value = 0 : i32}> : () -> i32
    %1 = "llvm.mlir.constant"() <{value = dense<0> : vector<1xi8>}> : () -> !llvm.array<1 x i8>
    %2 = "llvm.mlir.addressof"() <{global_name = @_ZTIi}> : () -> !llvm.ptr
    %3 = "llvm.mlir.zero"() : () -> !llvm.ptr
    %4 = "llvm.mlir.constant"() <{value = 1 : i32}> : () -> i32
    %5 = "llvm.alloca"(%4) <{elem_type = i8}> : (i32) -> !llvm.ptr
    "llvm.invoke"(%5)[^bb2, ^bb1] <{CConv = #llvm.cconv<ccc>, callee = @foo, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 1, 0, 0, 0>}> : (!llvm.ptr) -> ()
  ^bb1:  // 4 preds: ^bb0, ^bb3, ^bb4, ^bb5
    %6 = "llvm.landingpad"(%3, %2, %1) : (!llvm.ptr, !llvm.ptr, !llvm.array<1 x i8>) -> !llvm.struct<(ptr, i32)>
    "llvm.br"()[^bb3] : () -> ()
  ^bb2:  // 4 preds: ^bb0, ^bb3, ^bb4, ^bb5
    "llvm.return"(%4) : (i32) -> ()
  ^bb3:  // pred: ^bb1
    %7 = "llvm.invoke"(%5)[^bb2, ^bb1] <{CConv = #llvm.cconv<ccc>, callee = @bar, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 1, 0, 0, 0>}> : (!llvm.ptr) -> !llvm.ptr
  ^bb4:  // no predecessors
    "llvm.invoke"(%5, %0)[^bb2, ^bb1] <{CConv = #llvm.cconv<ccc>, callee = @vararg_foo, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 2, 0, 0, 0>, var_callee_type = !llvm.func<void (ptr, ...)>}> : (!llvm.ptr, i32) -> ()
  ^bb5:  // no predecessors
    %8 = "llvm.mlir.undef"() : () -> !llvm.ptr
    "llvm.invoke"(%8, %5, %0)[^bb2, ^bb1] <{CConv = #llvm.cconv<ccc>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 3, 0, 0, 0>, var_callee_type = !llvm.func<void (ptr, ...)>}> : (!llvm.ptr, !llvm.ptr, i32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<i8 ()>, linkage = #llvm.linkage<external>, sym_name = "foo", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<i32 (...)>, linkage = #llvm.linkage<external>, sym_name = "__gxx_personality_v0", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr)>, linkage = #llvm.linkage<external>, personality = @__gxx_personality_v0, sym_name = "invoke_result", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: !llvm.ptr):
    %0 = "llvm.invoke"()[^bb1, ^bb2] <{CConv = #llvm.cconv<ccc>, callee = @foo, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 0, 0, 0, 0>}> : () -> i8
  ^bb1:  // pred: ^bb0
    "llvm.store"(%0, %arg0) <{ordering = 0 : i64}> : (i8, !llvm.ptr) -> ()
    "llvm.return"() : () -> ()
  ^bb2:  // pred: ^bb0
    %1 = "llvm.landingpad"() <{cleanup}> : () -> !llvm.struct<(ptr, i32)>
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "foo", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<i32 (...)>, linkage = #llvm.linkage<external>, sym_name = "__gxx_personality_v0", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<i32 ()>, linkage = #llvm.linkage<external>, personality = @__gxx_personality_v0, sym_name = "invoke_phis", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %0 = "llvm.mlir.constant"() <{value = 0 : i32}> : () -> i32
    "llvm.invoke"(%0)[^bb1, ^bb2] <{CConv = #llvm.cconv<ccc>, callee = @foo, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 0, 1, 0, 0>}> : (i32) -> ()
  ^bb1(%1: i32):  // 2 preds: ^bb0, ^bb2
    "llvm.return"(%1) : (i32) -> ()
  ^bb2:  // pred: ^bb0
    %2 = "llvm.landingpad"() <{cleanup}> : () -> !llvm.struct<(ptr, i32)>
    %3 = "llvm.mlir.constant"() <{value = 1 : i32}> : () -> i32
    "llvm.br"(%3)[^bb1] : (i32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, garbageCollector = "statepoint-example", linkage = #llvm.linkage<external>, sym_name = "hasGCFunction", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, garbageCollector = "statepoint-example", linkage = #llvm.linkage<external>, sym_name = "gc_decl", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, section = ".section.name", sym_name = "section_func", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "local_unnamed_addr_func", unnamed_addr = 1 : i64, visibility_ = 0 : i64}> ({
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "unnamed_addr_func", unnamed_addr = 2 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, alignment = 2 : i64, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "align_func", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, alignment = 64 : i64, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "align_decl", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (i32)>, linkage = #llvm.linkage<external>, sym_name = "callFreezeOp", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg1: i32):
    %5 = "llvm.freeze"(%arg1) : (i32) -> i32
    %6 = "llvm.mlir.undef"() : () -> i32
    %7 = "llvm.freeze"(%6) : (i32) -> i32
    %8 = "llvm.mlir.poison"() : () -> i32
    %9 = "llvm.freeze"(%8) : (i32) -> i32
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<i64 (i32)>, linkage = #llvm.linkage<external>, sym_name = "freezeUsed", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: i32):
    %3 = "llvm.freeze"(%arg0) : (i32) -> i32
    %4 = "llvm.sext"(%3) : (i32) -> i64
    "llvm.return"(%4) : (i64) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<i1 ()>, linkage = #llvm.linkage<external>, sym_name = "boolConstArg", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %0 = "llvm.mlir.constant"() <{value = true}> : () -> i1
    %1 = "llvm.mlir.constant"() <{value = false}> : () -> i1
    %2 = "llvm.and"(%0, %1) : (i1, i1) -> i1
    "llvm.return"(%2) : (i1) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "callFenceInst", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "llvm.fence"() <{ordering = 5 : i64, syncscope = "agent"}> : () -> ()
    "llvm.fence"() <{ordering = 5 : i64}> : () -> ()
    "llvm.fence"() <{ordering = 5 : i64, syncscope = ""}> : () -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, passthrough = [["alignstack", "4"], "null_pointer_is_valid", ["foo", "bar"]], sym_name = "passthrough", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (i64)>, linkage = #llvm.linkage<external>, passthrough = [["allocsize", "4294967295"]], sym_name = "my_allocator", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_entry_count = #llvm.function_entry_count<entry_count = 4242>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "functionEntryCount", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_entry_count = #llvm.function_entry_count<entry_count = 7, count_type = synthetic>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "syntheticFunctionEntryCount", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_entry_count = #llvm.function_entry_count<entry_count = 7, count_type = synthetic, imports = 1234, 4, 1234>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "syntheticFunctionEntryCountWithImports", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_entry_count = #llvm.function_entry_count<entry_count = 7, imports = 1234, 4, 18446744073709551615, 1234>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "functionEntryCountWithImports", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_entry_count = #llvm.function_entry_count<entry_count = 18446744073709551615>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "functionEntryCountNegativeCount", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<bf16 ()>, linkage = #llvm.linkage<external>, sym_name = "constant_bf16", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %0 = "llvm.mlir.constant"() <{value = 1.000000e+01 : bf16}> : () -> bf16
    "llvm.return"(%0) : (bf16) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "address_taken", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.mlir.global"() <{addr_space = 0 : i32, constant, global_type = !llvm.ptr, linkage = #llvm.linkage<internal>, sym_name = "taker_of_address", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %0 = "llvm.mlir.addressof"() <{global_name = @address_taken}> : () -> !llvm.ptr
    "llvm.return"(%0) : (!llvm.ptr) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.mlir.global"() <{addr_space = 0 : i32, global_type = !llvm.ptr, linkage = #llvm.linkage<linkonce>, sym_name = "forward_use_of_address", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %0 = "llvm.mlir.addressof"() <{global_name = @address_declared_after_use}> : () -> !llvm.ptr
    "llvm.return"(%0) : (!llvm.ptr) -> ()
  }) : () -> ()
  "llvm.mlir.global"() <{addr_space = 0 : i32, global_type = f32, linkage = #llvm.linkage<linkonce>, sym_name = "address_declared_after_use", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.mlir.global"() <{addr_space = 0 : i32, global_type = !llvm.struct<(i32, ptr)>, linkage = #llvm.linkage<linkonce>, sym_name = "take_self_address", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %0 = "llvm.mlir.constant"() <{value = 0 : i32}> : () -> i32
    %1 = "llvm.mlir.undef"() : () -> !llvm.struct<(i32, ptr)>
    %2 = "llvm.mlir.addressof"() <{global_name = @take_self_address}> : () -> !llvm.ptr
    %3 = "llvm.getelementptr"(%2, %0) <{elem_type = !llvm.struct<(i32, ptr)>, noWrapFlags = 0 : i32, rawConstantIndices = array<i32: -2147483648, 0>}> : (!llvm.ptr, i32) -> !llvm.ptr
    %4 = "llvm.insertvalue"(%1, %0) <{position = array<i64: 0>}> : (!llvm.struct<(i32, ptr)>, i32) -> !llvm.struct<(i32, ptr)>
    %5 = "llvm.insertvalue"(%4, %3) <{position = array<i64: 1>}> : (!llvm.struct<(i32, ptr)>, !llvm.ptr) -> !llvm.struct<(i32, ptr)>
    "llvm.return"(%5) : (!llvm.struct<(i32, ptr)>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.mlir.global_ctors"() <{ctors = [@foo], data = [#llvm.zero], priorities = [0 : i32]}> : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "foo", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.mlir.global_ctors"() <{ctors = [], data = [], priorities = []}> : () -> ()
  "llvm.mlir.global_dtors"() <{data = [], dtors = [], priorities = []}> : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.mlir.global_dtors"() <{data = [#llvm.zero], dtors = [@foo], priorities = [0 : i32]}> : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "foo", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<i32 (i1, i32, i32)>, linkage = #llvm.linkage<external>, sym_name = "cond_br_weights", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: i1, %arg1: i32, %arg2: i32):
    "llvm.cond_br"(%arg0)[^bb1, ^bb2] <{branch_weights = array<i32: 5, 10>, operandSegmentSizes = array<i32: 1, 0, 0>}> : (i1) -> ()
  ^bb1:  // pred: ^bb0
    "llvm.return"(%arg1) : (i32) -> ()
  ^bb2:  // pred: ^bb0
    "llvm.return"(%arg2) : (i32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "foo", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<i32 (...)>, linkage = #llvm.linkage<external>, sym_name = "__gxx_personality_v0", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<i32 ()>, linkage = #llvm.linkage<external>, personality = @__gxx_personality_v0, sym_name = "invoke_branch_weights", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %0 = "llvm.mlir.constant"() <{value = 1 : i32}> : () -> i32
    "llvm.invoke"()[^bb2, ^bb1] <{CConv = #llvm.cconv<ccc>, branch_weights = array<i32: 42, 99>, callee = @foo, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 0, 0, 0, 0>}> : () -> ()
  ^bb1:  // pred: ^bb0
    %1 = "llvm.landingpad"() <{cleanup}> : () -> !llvm.struct<(ptr, i32)>
    "llvm.br"()[^bb2] : () -> ()
  ^bb2:  // 2 preds: ^bb0, ^bb1
    "llvm.return"(%0) : (i32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "volatile_store_and_load", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %0 = "llvm.mlir.constant"() <{value = 5 : i32}> : () -> i32
    %1 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64
    %2 = "llvm.alloca"(%1) <{elem_type = i32}> : (i64) -> !llvm.ptr
    "llvm.store"(%0, %2) <{ordering = 0 : i64, volatile_}> : (i32, !llvm.ptr) -> ()
    %3 = "llvm.load"(%2) <{ordering = 0 : i64, volatile_}> : (!llvm.ptr) -> i32
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "nontemporal_store_and_load", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %0 = "llvm.mlir.constant"() <{value = 5 : i32}> : () -> i32
    %1 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64
    %2 = "llvm.alloca"(%1) <{elem_type = i32}> : (i64) -> !llvm.ptr
    "llvm.store"(%0, %2) <{nontemporal, ordering = 0 : i64}> : (i32, !llvm.ptr) -> ()
    %3 = "llvm.load"(%2) <{nontemporal, ordering = 0 : i64}> : (!llvm.ptr) -> i32
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<i32 (ptr)>, linkage = #llvm.linkage<external>, sym_name = "nontemporal_store_and_load", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: !llvm.ptr):
    %0 = "llvm.load"(%arg0) <{invariant, ordering = 0 : i64}> : (!llvm.ptr) -> i32
    "llvm.return"(%0) : (i32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<i32 (ptr)>, linkage = #llvm.linkage<external>, sym_name = "nontemporal_store_and_load", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: !llvm.ptr):
    %0 = "llvm.mlir.constant"() <{value = 42 : i32}> : () -> i32
    "llvm.store"(%0, %arg0) <{invariantGroup, ordering = 0 : i64}> : (i32, !llvm.ptr) -> ()
    %1 = "llvm.load"(%arg0) <{invariantGroup, ordering = 0 : i64}> : (!llvm.ptr) -> i32
    "llvm.return"(%1) : (i32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr)>, linkage = #llvm.linkage<external>, sym_name = "atomic_store_and_load", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: !llvm.ptr):
    %0 = "llvm.load"(%arg0) <{alignment = 4 : i64, ordering = 4 : i64}> : (!llvm.ptr) -> f32
    %1 = "llvm.load"(%arg0) <{alignment = 4 : i64, ordering = 4 : i64, syncscope = "singlethread"}> : (!llvm.ptr) -> f32
    "llvm.store"(%0, %arg0) <{alignment = 4 : i64, ordering = 5 : i64}> : (f32, !llvm.ptr) -> ()
    "llvm.store"(%1, %arg0) <{alignment = 4 : i64, ordering = 5 : i64, syncscope = "singlethread"}> : (f32, !llvm.ptr) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "module_default_layout", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "module_big_endian", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
}) {llvm.data_layout = "E"} : () -> ()

// -----
"builtin.module"() ({
^bb0:
}) {llvm.target_triple = "x86_64-pc-windows-msvc"} : () -> ()

// -----
"builtin.module"() ({
^bb0:
}) {llvm.target_triple = "aarch64-linux-android"} : () -> ()

// -----
"builtin.module"() ({
^bb0:
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (i32, ptr)>, linkage = #llvm.linkage<external>, sym_name = "useInlineAsm", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: i32, %arg1: !llvm.ptr):
    "llvm.inline_asm"(%arg0) <{asm_string = "foo", constraints = "r", tail_call_kind = #llvm.tailcallkind<none>}> : (i32) -> ()
    %0 = "llvm.inline_asm"(%arg0) <{asm_string = "foo", constraints = "=r,r", tail_call_kind = #llvm.tailcallkind<none>}> : (i32) -> i8
    %1 = "llvm.inline_asm"(%arg0, %arg0) <{asm_string = "foo", constraints = "=r,r,r", tail_call_kind = #llvm.tailcallkind<none>}> : (i32, i32) -> i8
    %2 = "llvm.inline_asm"(%arg0, %arg0) <{asm_string = "foo", constraints = "=r,r,r", has_side_effects, tail_call_kind = #llvm.tailcallkind<none>}> : (i32, i32) -> i8
    %3 = "llvm.inline_asm"(%arg0, %arg0) <{asm_string = "foo", constraints = "=r,r,r", is_align_stack, tail_call_kind = #llvm.tailcallkind<none>}> : (i32, i32) -> i8
    %4 = "llvm.inline_asm"(%arg0, %arg0) <{asm_dialect = 1 : i64, asm_string = "foo", constraints = "=r,r,r", tail_call_kind = #llvm.tailcallkind<none>}> : (i32, i32) -> i8
    %5 = "llvm.inline_asm"(%arg0) <{asm_string = "foo", constraints = "=r,=r,r", tail_call_kind = #llvm.tailcallkind<none>}> : (i32) -> !llvm.struct<(i8, i8)>
    %6 = "llvm.inline_asm"(%arg1) <{asm_string = "", constraints = "*m,~{memory}", has_side_effects, operand_attrs = [{elementtype = !llvm.ptr}], tail_call_kind = #llvm.tailcallkind<tail>}> : (!llvm.ptr) -> !llvm.void
    %7 = "llvm.inline_asm"(%arg0) <{asm_string = "foo", constraints = "=r,=r,r", tail_call_kind = #llvm.tailcallkind<none>}> : (i32) -> !llvm.struct<(i8, i8)>
    %8 = "llvm.inline_asm"(%arg0) <{asm_string = "foo", constraints = "=r,=r,r", tail_call_kind = #llvm.tailcallkind<notail>}> : (i32) -> !llvm.struct<(i8, i8)>
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr, i64, ptr, i64)>, linkage = #llvm.linkage<external>, sym_name = "useInlineAsm2", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: !llvm.ptr, %arg1: i64, %arg2: !llvm.ptr, %arg3: i64):
    %0 = "llvm.inline_asm"(%arg0, %arg1, %arg2, %arg3, %arg0, %arg2, %arg0) <{asm_string = "ldr x4, [$2], #8   \0A\09ldr x5, [$1]       \0A\09mul x6, x4, $4     \0A\09", constraints = "=r,=r,=r,=*m,r,*m,0,1,2,*m,~{x4},~{x5},~{x6},~{x7},~{cc}", has_side_effects, operand_attrs = [{elementtype = !llvm.array<16 x i64>}, {}, {elementtype = !llvm.array<16 x i64>}, {}, {}, {}, {elementtype = !llvm.array<16 x i64>}], tail_call_kind = #llvm.tailcallkind<none>}> : (!llvm.ptr, i64, !llvm.ptr, i64, !llvm.ptr, !llvm.ptr, !llvm.ptr) -> !llvm.struct<(i64, ptr, ptr)>
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<f32 (f32)>, linkage = #llvm.linkage<external>, sym_name = "fastmathFlagsFunc", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (f32, vector<2xf32>)>, linkage = #llvm.linkage<external>, sym_name = "fastmathFlags", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: f32, %arg1: vector<2xf32>):
    %0 = "llvm.fadd"(%arg0, %arg0) <{fastmathFlags = #llvm.fastmath<nnan, ninf>}> : (f32, f32) -> f32
    %1 = "llvm.fsub"(%arg0, %arg0) <{fastmathFlags = #llvm.fastmath<nnan, ninf>}> : (f32, f32) -> f32
    %2 = "llvm.fmul"(%arg0, %arg0) <{fastmathFlags = #llvm.fastmath<nnan, ninf>}> : (f32, f32) -> f32
    %3 = "llvm.fdiv"(%arg0, %arg0) <{fastmathFlags = #llvm.fastmath<nnan, ninf>}> : (f32, f32) -> f32
    %4 = "llvm.frem"(%arg0, %arg0) <{fastmathFlags = #llvm.fastmath<nnan, ninf>}> : (f32, f32) -> f32
    %5 = "llvm.fcmp"(%arg0, %arg0) <{fastmathFlags = #llvm.fastmath<nnan, ninf>, predicate = 1 : i64}> : (f32, f32) -> i1
    %6 = "llvm.fneg"(%arg0) <{fastmathFlags = #llvm.fastmath<nnan, ninf>}> : (f32) -> f32
    %7 = "llvm.call"(%arg0) <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @fastmathFlagsFunc, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 1, 0>}> : (f32) -> f32
    %8 = "llvm.call"(%arg0) <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @fastmathFlagsFunc, fastmathFlags = #llvm.fastmath<nnan>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 1, 0>}> : (f32) -> f32
    %9 = "llvm.call"(%arg0) <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @fastmathFlagsFunc, fastmathFlags = #llvm.fastmath<ninf>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 1, 0>}> : (f32) -> f32
    %10 = "llvm.call"(%arg0) <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @fastmathFlagsFunc, fastmathFlags = #llvm.fastmath<nsz>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 1, 0>}> : (f32) -> f32
    %11 = "llvm.call"(%arg0) <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @fastmathFlagsFunc, fastmathFlags = #llvm.fastmath<arcp>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 1, 0>}> : (f32) -> f32
    %12 = "llvm.call"(%arg0) <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @fastmathFlagsFunc, fastmathFlags = #llvm.fastmath<contract>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 1, 0>}> : (f32) -> f32
    %13 = "llvm.call"(%arg0) <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @fastmathFlagsFunc, fastmathFlags = #llvm.fastmath<afn>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 1, 0>}> : (f32) -> f32
    %14 = "llvm.call"(%arg0) <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @fastmathFlagsFunc, fastmathFlags = #llvm.fastmath<reassoc>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 1, 0>}> : (f32) -> f32
    %15 = "llvm.call"(%arg0) <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @fastmathFlagsFunc, fastmathFlags = #llvm.fastmath<fast>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 1, 0>}> : (f32) -> f32
    %16 = "llvm.intr.copysign"(%arg0, %arg0) <{fastmathFlags = #llvm.fastmath<fast>}> : (f32, f32) -> f32
    %17 = "llvm.intr.copysign"(%arg0, %arg0) <{fastmathFlags = #llvm.fastmath<afn>}> : (f32, f32) -> f32
    %18 = "llvm.mlir.constant"() <{value = 1 : i32}> : () -> i32
    %19 = "llvm.intr.powi"(%arg0, %18) <{fastmathFlags = #llvm.fastmath<fast>}> : (f32, i32) -> f32
    %20 = "llvm.intr.powi"(%arg0, %18) <{fastmathFlags = #llvm.fastmath<afn>}> : (f32, i32) -> f32
    %21 = "llvm.intr.vector.reduce.fmax"(%arg1) <{fastmathFlags = #llvm.fastmath<nnan>}> : (vector<2xf32>) -> f32
    %22 = "llvm.intr.vector.reduce.fmin"(%arg1) <{fastmathFlags = #llvm.fastmath<nnan>}> : (vector<2xf32>) -> f32
    %23 = "llvm.intr.vector.reduce.fmaximum"(%arg1) <{fastmathFlags = #llvm.fastmath<nnan>}> : (vector<2xf32>) -> f32
    %24 = "llvm.intr.vector.reduce.fminimum"(%arg1) <{fastmathFlags = #llvm.fastmath<nnan>}> : (vector<2xf32>) -> f32
    %25 = "llvm.mlir.constant"() <{value = true}> : () -> i1
    %26 = "llvm.select"(%25, %arg0, %20) <{fastmathFlags = #llvm.fastmath<contract>}> : (i1, f32, f32) -> f32
    %27 = "llvm.fpext"(%arg0) <{fastmathFlags = #llvm.fastmath<nnan>}> : (f32) -> f64
    %28 = "llvm.fptrunc"(%arg0) <{fastmathFlags = #llvm.fastmath<fast>}> : (f32) -> f16
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<i32 (i32)>, linkage = #llvm.linkage<external>, sym_name = "switch_empty", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: i32):
    "llvm.switch"(%arg0)[^bb1] <{case_operand_segments = array<i32>, operandSegmentSizes = array<i32: 1, 0, 0>}> : (i32) -> ()
  ^bb1:  // pred: ^bb0
    "llvm.return"(%arg0) : (i32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<i32 (i32)>, linkage = #llvm.linkage<external>, sym_name = "switch_args", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg1: i32):
    %6 = "llvm.mlir.constant"() <{value = 5 : i32}> : () -> i32
    %7 = "llvm.mlir.constant"() <{value = 7 : i32}> : () -> i32
    %8 = "llvm.mlir.constant"() <{value = 11 : i32}> : () -> i32
    "llvm.switch"(%arg1, %6, %7, %8)[^bb1, ^bb2, ^bb3] <{case_operand_segments = array<i32: 1, 2>, case_values = dense<[-1, 1]> : vector<2xi32>, operandSegmentSizes = array<i32: 1, 0, 3>}> : (i32, i32, i32, i32) -> ()
  ^bb1:  // pred: ^bb0
    "llvm.return"(%arg1) : (i32) -> ()
  ^bb2(%9: i32):  // pred: ^bb0
    "llvm.return"(%7) : (i32) -> ()
  ^bb3(%10: i32, %11: i32):  // pred: ^bb0
    "llvm.return"(%10) : (i32) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<i32 (i32)>, linkage = #llvm.linkage<external>, sym_name = "switch_weights", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: i32):
    %0 = "llvm.mlir.constant"() <{value = 19 : i32}> : () -> i32
    %1 = "llvm.mlir.constant"() <{value = 23 : i32}> : () -> i32
    %2 = "llvm.mlir.constant"() <{value = 29 : i32}> : () -> i32
    "llvm.switch"(%arg0, %0, %1, %2)[^bb1, ^bb2, ^bb3] <{branch_weights = array<i32: 13, 17, 19>, case_operand_segments = array<i32: 2, 0>, case_values = dense<[9, 99]> : vector<2xi32>, operandSegmentSizes = array<i32: 1, 1, 2>}> : (i32, i32, i32, i32) -> ()
  ^bb1(%3: i32):  // pred: ^bb0
    "llvm.return"(%3) : (i32) -> ()
  ^bb2(%4: i32, %5: i32):  // pred: ^bb0
    "llvm.return"(%5) : (i32) -> ()
  ^bb3:  // pred: ^bb0
    "llvm.return"(%arg0) : (i32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (i32, f32, f32)>, linkage = #llvm.linkage<external>, sym_name = "duplicate_block_in_switch", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg3: i32, %arg4: f32, %arg5: f32):
    "llvm.switch"(%arg3, %arg4, %arg5)[^bb1, ^bb2, ^bb3, ^bb2] <{case_operand_segments = array<i32: 0, 1, 0>, case_values = dense<[105, 108, 106]> : vector<3xi32>, operandSegmentSizes = array<i32: 1, 1, 1>}> : (i32, f32, f32) -> ()
  ^bb1(%2: f32):  // pred: ^bb0
    "llvm.call"(%2) <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @bar, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 1, 0>}> : (f32) -> ()
    "llvm.return"() : () -> ()
  ^bb2:  // 2 preds: ^bb0, ^bb0
    "llvm.call"() <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @baz, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 0, 0>}> : () -> ()
    "llvm.return"() : () -> ()
  ^bb3(%3: f32):  // pred: ^bb0
    "llvm.call"(%3) <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @qux, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 1, 0>}> : (f32) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (i32, f32, f32)>, linkage = #llvm.linkage<external>, sym_name = "duplicate_block_with_args_in_switch", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: i32, %arg1: f32, %arg2: f32):
    "llvm.switch"(%arg0, %arg1, %arg1, %arg2)[^bb1, ^bb3, ^bb2, ^bb3] <{case_operand_segments = array<i32: 1, 0, 1>, case_values = dense<[106, 105, 108]> : vector<3xi32>, operandSegmentSizes = array<i32: 1, 1, 2>}> : (i32, f32, f32, f32) -> ()
  ^bb1(%0: f32):  // pred: ^bb0
    "llvm.call"(%0) <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @bar, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 1, 0>}> : (f32) -> ()
    "llvm.return"() : () -> ()
  ^bb2:  // pred: ^bb0
    "llvm.call"() <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @baz, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 0, 0>}> : () -> ()
    "llvm.return"() : () -> ()
  ^bb3(%1: f32):  // 2 preds: ^bb0, ^bb0
    "llvm.call"(%1) <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @qux, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 1, 0>}> : (f32) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (f32)>, linkage = #llvm.linkage<external>, sym_name = "bar", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "baz", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (f32)>, linkage = #llvm.linkage<external>, sym_name = "qux", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<i32 (i32, ...)>, linkage = #llvm.linkage<external>, sym_name = "vararg_function", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: i32):
    %0 = "llvm.mlir.constant"() <{value = 1 : i32}> : () -> i32
    %1 = "llvm.mlir.constant"() <{value = 1 : i32}> : () -> i32
    %2 = "llvm.alloca"(%1) <{alignment = 8 : i64, elem_type = !llvm.struct<"struct.va_list", (ptr)>}> : (i32) -> !llvm.ptr
    "llvm.intr.vastart"(%2) : (!llvm.ptr) -> ()
    %3 = "llvm.alloca"(%0) <{alignment = 8 : i64, elem_type = !llvm.ptr}> : (i32) -> !llvm.ptr
    "llvm.intr.vacopy"(%3, %2) : (!llvm.ptr, !llvm.ptr) -> ()
    %4 = "llvm.va_arg"(%3) : (!llvm.ptr) -> i32
    "llvm.intr.vaend"(%3) : (!llvm.ptr) -> ()
    "llvm.intr.vaend"(%2) : (!llvm.ptr) -> ()
    "llvm.return"(%4) : (i32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, arg_attrs = [{llvm.range = #llvm.constant_range<i64, 0, 4097>}], function_type = !llvm.func<void (i64)>, linkage = #llvm.linkage<external>, sym_name = "range_arg_function", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<i64 ()>, linkage = #llvm.linkage<external>, res_attrs = [{llvm.range = #llvm.constant_range<i64, 0, 4097>}], sym_name = "range_res_function", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, arg_attrs = [{llvm.readonly}], function_type = !llvm.func<void (ptr)>, linkage = #llvm.linkage<external>, sym_name = "readonly_function", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, memory_effects = #llvm.memory_effects<other = readwrite, argMem = none, inaccessibleMem = readwrite, errnoMem = none, targetMem0 = none, targetMem1 = none>, sym_name = "arg_mem_none_func", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, memory_effects = #llvm.memory_effects<other = readwrite, argMem = readwrite, inaccessibleMem = readwrite, errnoMem = none, targetMem0 = none, targetMem1 = none>, sym_name = "readwrite_func", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr)>, linkage = #llvm.linkage<external>, sym_name = "tf", target_features = #llvm.target_features<["+fix-cortex-a53-835769", "+fp-armv8", "+neon", "+outline-atomics", "+v8a"]>, unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, arm_streaming, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "streaming_func", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, arm_locally_streaming, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "locally_streaming_func", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, arm_streaming_compatible, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "streaming_compatible_func", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, arm_new_za, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "new_za_func", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, arm_in_za, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "in_za_func", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, arm_out_za, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "out_za_func", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, arm_inout_za, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "inout_za_func", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, arm_preserves_za, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "preserves_za_func", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, frame_pointer = #llvm.framePointerKind<"non-leaf">, function_type = !llvm.func<void (ptr)>, linkage = #llvm.linkage<external>, sym_name = "t", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.mlir.global"() <{addr_space = 0 : i32, global_type = !llvm.struct<(i32, i64, array<3 x i8>)>, linkage = #llvm.linkage<linkonce>, sym_name = "partially_zeroinit_aggregate", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %3 = "llvm.mlir.zero"() : () -> !llvm.struct<(i32, i64, array<3 x i8>)>
    %4 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64
    %5 = "llvm.insertvalue"(%3, %4) <{position = array<i64: 1>}> : (!llvm.struct<(i32, i64, array<3 x i8>)>, i64) -> !llvm.struct<(i32, i64, array<3 x i8>)>
    "llvm.return"(%5) : (!llvm.struct<(i32, i64, array<3 x i8>)>) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "zeroinit_complex_local_aggregate", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %0 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64
    %1 = "llvm.alloca"(%0) <{elem_type = !llvm.array<1000 x struct<(i32, array<3 x struct<(f64, vector<4x!llvm.ptr>, array<2 x ptr>)>>, array<6 x ptr>)>>}> : (i64) -> !llvm.ptr
    %2 = "llvm.mlir.zero"() : () -> !llvm.array<1000 x struct<(i32, array<3 x struct<(f64, vector<4x!llvm.ptr>, array<2 x ptr>)>>, array<6 x ptr>)>>
    "llvm.store"(%2, %1) <{ordering = 0 : i64}> : (!llvm.array<1000 x struct<(i32, array<3 x struct<(f64, vector<4x!llvm.ptr>, array<2 x ptr>)>>, array<6 x ptr>)>>, !llvm.ptr) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.linker_options"() <{options = ["/DEFAULTLIB:", "libcmt"]}> : () -> ()
  "llvm.linker_options"() <{options = ["/DEFAULTLIB:", "libcmtd"]}> : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.mlir.global"() <{addr_space = 0 : i32, global_type = !llvm.array<4294967296 x i8>, linkage = #llvm.linkage<common>, sym_name = "big_", unnamed_addr = 0 : i64, value = dense<0> : vector<4294967296xi8>, visibility_ = 0 : i64}> ({
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, no_inline, sym_name = "no_inline", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, always_inline, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "always_inline", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, inline_hint, linkage = #llvm.linkage<external>, sym_name = "inline_hint", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, no_inline, optimize_none, sym_name = "optimize_none", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, convergent, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "convergent", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, instrument_function_entry = "__cyg_profile_func_enter", linkage = #llvm.linkage<external>, sym_name = "function_entry_instrument_test", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, instrument_function_exit = "__cyg_profile_func_exit", linkage = #llvm.linkage<external>, sym_name = "function_exit_instrument_test", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, no_unwind, sym_name = "nounwind", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "willreturn", unnamed_addr = 0 : i64, visibility_ = 0 : i64, will_return}> ({
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, noreturn, sym_name = "noreturn", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, returns_twice, sym_name = "returnstwice", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, hot, linkage = #llvm.linkage<external>, sym_name = "hot", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, cold, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "cold", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, noduplicate, sym_name = "noduplicate", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, no_caller_saved_registers, sym_name = "no_caller_saved_registers", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, nocallback, sym_name = "nocallback", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (i32)>, linkage = #llvm.linkage<external>, modular_format = "ident,1,1,foo,bar", sym_name = "modular_format", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: i32):
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, nobuiltins = [], sym_name = "no_builtins_all", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, nobuiltins = ["asdf", "defg"], sym_name = "no_builtins_2", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "f", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "no_builtins_call_all", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "llvm.call"() <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @f, fastmathFlags = #llvm.fastmath<none>, nobuiltins = [], op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 0, 0>}> : () -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "f", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "no_builtins_call_2", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "llvm.call"() <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @f, fastmathFlags = #llvm.fastmath<none>, nobuiltins = ["asdf", "defg"], op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 0, 0>}> : () -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, allocsize = array<i32: 1>, function_type = !llvm.func<void (i32, i32)>, linkage = #llvm.linkage<external>, sym_name = "allocsize_1", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: i32, %arg1: i32):
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, allocsize = array<i32: 0, 1>, function_type = !llvm.func<void (i32, i32)>, linkage = #llvm.linkage<external>, sym_name = "allocsize_2", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: i32, %arg1: i32):
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (i32, i32)>, linkage = #llvm.linkage<external>, sym_name = "f", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "allocsize_call_1", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %0 = "llvm.mlir.constant"() <{value = 0 : i32}> : () -> i32
    "llvm.call"(%0, %0) <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, allocsize = array<i32: 1>, callee = @f, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 2, 0>}> : (i32, i32) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (i32, i32)>, linkage = #llvm.linkage<external>, sym_name = "f", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "allocsize_call_2", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %0 = "llvm.mlir.constant"() <{value = 0 : i32}> : () -> i32
    "llvm.call"(%0, %0) <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, allocsize = array<i32: 1, 0>, callee = @f, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 2, 0>}> : (i32, i32) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, minsize, sym_name = "minsize", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "f", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "minsize_call", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "llvm.call"() <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @f, fastmathFlags = #llvm.fastmath<none>, minsize, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 0, 0>}> : () -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "f", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, optsize, sym_name = "optsize", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "f", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "optsize_call", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "llvm.call"() <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @f, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 0, 0>, optsize}> : () -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "f", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, save_reg_params, sym_name = "save_reg_params", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "f", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "save_reg_params_call", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "llvm.call"() <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @f, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 0, 0>, save_reg_params}> : () -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "f", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "zero_call_used_regs_1", unnamed_addr = 0 : i64, visibility_ = 0 : i64, zero_call_used_regs = "skip"}> ({
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "f", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "zero_call_used_regs_2", unnamed_addr = 0 : i64, visibility_ = 0 : i64, zero_call_used_regs = "all"}> ({
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "f", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "zero_call_used_regs_call_1", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "llvm.call"() <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @f, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 0, 0>, zero_call_used_regs = "used_gpr_all"}> : () -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "f", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "zero_call_used_regs_call_2", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "llvm.call"() <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @f, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 0, 0>, zero_call_used_regs = "used"}> : () -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "f", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "trap_func_name_call", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "llvm.call"() <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @f, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 0, 0>, trap_func_name = "whatever"}> : () -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "f", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, default_func_attrs = {justKey, key = "value"}, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "default_func_attrs", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "f", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "default_func_attrs_call", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "llvm.call"() <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @f, default_func_attrs = {justKey, key = "value"}, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 0, 0>}> : () -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "f", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "builtin_call", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "llvm.call"() <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, builtin, callee = @f, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 0, 0>}> : () -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "f", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "nobuiltin_call", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "llvm.call"() <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @f, fastmathFlags = #llvm.fastmath<none>, nobuiltin, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 0, 0>}> : () -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "f", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "convergent_call", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "llvm.call"() <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @f, convergent, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 0, 0>}> : () -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "f", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "nounwind_call", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "llvm.call"() <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @f, fastmathFlags = #llvm.fastmath<none>, no_unwind, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 0, 0>}> : () -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "f", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "willreturn_call", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "llvm.call"() <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @f, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 0, 0>, will_return}> : () -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "f", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "noreturn_call", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "llvm.call"() <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @f, fastmathFlags = #llvm.fastmath<none>, noreturn, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 0, 0>}> : () -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "f", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "no_inline_call", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "llvm.call"() <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @f, fastmathFlags = #llvm.fastmath<none>, no_inline, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 0, 0>}> : () -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "f", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "always_inline_call", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "llvm.call"() <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, always_inline, callee = @f, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 0, 0>}> : () -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "f", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "inline_hint_call", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "llvm.call"() <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @f, fastmathFlags = #llvm.fastmath<none>, inline_hint, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 0, 0>}> : () -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "fa", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "fb", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "fc", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "fd", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "mem_effects_call", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "llvm.call"() <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @fa, fastmathFlags = #llvm.fastmath<none>, memory_effects = #llvm.memory_effects<other = none, argMem = none, inaccessibleMem = none, errnoMem = none, targetMem0 = none, targetMem1 = none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 0, 0>}> : () -> ()
    "llvm.call"() <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @fb, fastmathFlags = #llvm.fastmath<none>, memory_effects = #llvm.memory_effects<other = read, argMem = none, inaccessibleMem = write, errnoMem = none, targetMem0 = none, targetMem1 = none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 0, 0>}> : () -> ()
    "llvm.call"() <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @fc, fastmathFlags = #llvm.fastmath<none>, memory_effects = #llvm.memory_effects<other = read, argMem = read, inaccessibleMem = write, errnoMem = none, targetMem0 = none, targetMem1 = none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 0, 0>}> : () -> ()
    "llvm.call"() <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @fd, fastmathFlags = #llvm.fastmath<none>, memory_effects = #llvm.memory_effects<other = readwrite, argMem = read, inaccessibleMem = readwrite, errnoMem = none, targetMem0 = none, targetMem1 = none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 0, 0>}> : () -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "vec_type_hint", unnamed_addr = 0 : i64, vec_type_hint = #llvm.vec_type_hint<hint = i32>, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "vec_type_hint_signed", unnamed_addr = 0 : i64, vec_type_hint = #llvm.vec_type_hint<hint = i32, is_signed = true>, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "vec_type_hint_signed_vec", unnamed_addr = 0 : i64, vec_type_hint = #llvm.vec_type_hint<hint = vector<2xi32>, is_signed = true>, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "vec_type_hint_float_vec", unnamed_addr = 0 : i64, vec_type_hint = #llvm.vec_type_hint<hint = vector<3xf32>>, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "vec_type_hint_bfloat_vec", unnamed_addr = 0 : i64, vec_type_hint = #llvm.vec_type_hint<hint = vector<8xbf16>>, visibility_ = 0 : i64}> ({
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "work_group_size_hint", unnamed_addr = 0 : i64, visibility_ = 0 : i64, work_group_size_hint = array<i32: 128, 128, 128>}> ({
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, reqd_work_group_size = array<i32: 128, 256, 128>, sym_name = "reqd_work_group_size", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, intel_reqd_sub_group_size = 32 : i32, linkage = #llvm.linkage<external>, sym_name = "intel_reqd_sub_group_size", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "foo", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "call_with_empty_opbundle", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "llvm.call"() <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @foo, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 0, 0>}> : () -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "call_with_empty_opbundle_operands", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "llvm.call"() <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @foo, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32: 0>, op_bundle_tags = ["tag"], operandSegmentSizes = array<i32: 0, 0>}> : () -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "call_with_opbundle", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %6 = "llvm.mlir.constant"() <{value = 1 : i32}> : () -> i32
    %7 = "llvm.mlir.constant"() <{value = 2 : i32}> : () -> i32
    %8 = "llvm.mlir.constant"() <{value = 3 : i32}> : () -> i32
    "llvm.call"(%6, %7, %8) <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @foo, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32: 2, 1>, op_bundle_tags = ["tag1", "tag2"], operandSegmentSizes = array<i32: 0, 3>}> : (i32, i32, i32) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<i32 (...)>, linkage = #llvm.linkage<external>, sym_name = "__gxx_personality_v0", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, personality = @__gxx_personality_v0, sym_name = "invoke_with_opbundle", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %2 = "llvm.mlir.constant"() <{value = 1 : i32}> : () -> i32
    %3 = "llvm.mlir.constant"() <{value = 2 : i32}> : () -> i32
    %4 = "llvm.mlir.constant"() <{value = 3 : i32}> : () -> i32
    "llvm.invoke"(%2, %3, %4)[^bb2, ^bb1] <{CConv = #llvm.cconv<ccc>, callee = @foo, op_bundle_sizes = array<i32: 2, 1>, op_bundle_tags = ["tag1", "tag2"], operandSegmentSizes = array<i32: 0, 0, 0, 3>}> : (i32, i32, i32) -> ()
  ^bb1:  // pred: ^bb0
    %5 = "llvm.landingpad"() <{cleanup}> : () -> !llvm.struct<(ptr, i32)>
    "llvm.return"() : () -> ()
  ^bb2:  // pred: ^bb0
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr)>, linkage = #llvm.linkage<external>, sym_name = "call_intrin_with_opbundle", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: !llvm.ptr):
    %0 = "llvm.mlir.constant"() <{value = true}> : () -> i1
    %1 = "llvm.mlir.constant"() <{value = 16 : i32}> : () -> i32
    "llvm.call_intrinsic"(%0, %arg0, %1) <{fastmathFlags = #llvm.fastmath<none>, intrin = "llvm.assume", op_bundle_sizes = array<i32: 2>, op_bundle_tags = ["align"], operandSegmentSizes = array<i32: 1, 2>}> : (i1, !llvm.ptr, i32) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.module_flags"() <{flags = [#llvm.mlir.module_flag<error, "wchar_size", 4 : i32>, #llvm.mlir.module_flag<min, "PIC Level", 2 : i32>, #llvm.mlir.module_flag<max, "PIE Level", 2 : i32>, #llvm.mlir.module_flag<max, "uwtable", 2 : i32>, #llvm.mlir.module_flag<max, "frame-pointer", 1 : i32>]}> : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.module_flags"() <{flags = [#llvm.mlir.module_flag<warning, "Debug Info Version", 3 : i32>]}> : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.module_flags"() <{flags = [#llvm.mlir.module_flag<append, "CG Profile", [#llvm.cgprofile_entry<from = @from, to = @to, count = 222>, #llvm.cgprofile_entry<from = @from, count = 222>, #llvm.cgprofile_entry<from = @to, to = @from, count = 222>]>]}> : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (i32)>, linkage = #llvm.linkage<external>, sym_name = "from", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "to", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.module_flags"() <{flags = [#llvm.mlir.module_flag<error, "ProfileSummary", #llvm.profile_summary<format = InstrProf, total_count = 263646, max_count = 86427, max_internal_count = 86427, max_function_count = 4691, num_counts = 3712, num_functions = 796, is_partial_profile = 0, partial_profile_ratio = 0.000000e+00 : f64, detailed_summary = <cut_off = 10000, min_count = 86427, num_counts = 1>, <cut_off = 100000, min_count = 86427, num_counts = 1>>>]}> : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.module_flags"() <{flags = [#llvm.mlir.module_flag<error, "riscv-isa", ["rv64i2p1", "m2p0"]>]}> : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
^bb0:
}) {llvm.dependent_libraries = ["foo", "bar"]} : () -> ()

// -----
"builtin.module"() ({
  "llvm.mlir.global"() <{addr_space = 0 : i32, constant, dso_local, global_type = i32, linkage = #llvm.linkage<external>, sym_name = "const", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %0 = "llvm.mlir.addressof"() <{global_name = @const}> : () -> !llvm.ptr
    %1 = "llvm.ptrtoint"(%0) : (!llvm.ptr) -> i64
    %2 = "llvm.dso_local_equivalent"() <{function_name = @extern_func}> : () -> !llvm.ptr
    %3 = "llvm.ptrtoint"(%2) : (!llvm.ptr) -> i64
    %4 = "llvm.sub"(%3, %1) <{overflowFlags = 0 : i32}> : (i64, i64) -> i64
    %5 = "llvm.trunc"(%4) <{overflowFlags = 0 : i32}> : (i64) -> i32
    "llvm.return"(%5) : (i32) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "extern_func", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<i32 ()>, linkage = #llvm.linkage<external>, sym_name = "extern_func", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "call_extern_func", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %0 = "llvm.dso_local_equivalent"() <{function_name = @extern_func}> : () -> !llvm.ptr
    %1 = "llvm.call"(%0) <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 1, 0>, res_attrs = [{llvm.noundef}]}> : (!llvm.ptr) -> i32
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.mlir.alias"() <{alias_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "alias_func", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %1 = "llvm.mlir.addressof"() <{global_name = @aliasee_func}> : () -> !llvm.ptr
    "llvm.return"(%1) : (!llvm.ptr) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "aliasee_func", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "call_alias_func", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %0 = "llvm.dso_local_equivalent"() <{function_name = @alias_func}> : () -> !llvm.ptr
    "llvm.call"(%0) <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 1, 0>}> : (!llvm.ptr) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, arg_attrs = [{llvm.alignstack = 8 : i64}], function_type = !llvm.func<void (array<2 x f32>)>, linkage = #llvm.linkage<external>, sym_name = "testfn", unnamed_addr = 1 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, dso_local, function_type = !llvm.func<void (array<2 x f32>)>, linkage = #llvm.linkage<internal>, sym_name = "g", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg2: !llvm.array<2 x f32>):
    "llvm.call"(%arg2) <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, arg_attrs = [{llvm.alignstack = 8 : i64}], callee = @testfn, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 1, 0>}> : (!llvm.array<2 x f32>) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, arg_attrs = [{llvm.alignstack = 8 : i64}], function_type = !llvm.func<void (struct<(i8, i8)>)>, linkage = #llvm.linkage<external>, sym_name = "testfn2", unnamed_addr = 1 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, dso_local, function_type = !llvm.func<void (struct<(i8, i8)>)>, linkage = #llvm.linkage<internal>, sym_name = "h", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg1: !llvm.struct<(i8, i8)>):
    "llvm.call"(%arg1) <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, arg_attrs = [{llvm.alignstack = 8 : i64}], callee = @testfn2, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 1, 0>}> : (!llvm.struct<(i8, i8)>) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, arg_attrs = [{llvm.alignstack = 8 : i64}], function_type = !llvm.func<void (i32)>, linkage = #llvm.linkage<external>, sym_name = "testfn3", unnamed_addr = 1 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, dso_local, function_type = !llvm.func<void (i32)>, linkage = #llvm.linkage<internal>, sym_name = "i", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: i32):
    "llvm.call"(%arg0) <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, arg_attrs = [{llvm.alignstack = 8 : i64}], callee = @testfn3, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 1, 0>}> : (i32) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.mlir.global"() <{addr_space = 0 : i32, global_type = !llvm.array<2 x struct<(i32, f32)>>, linkage = #llvm.linkage<external>, sym_name = "test_array_attr_2", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %3 = "llvm.mlir.constant"() <{value = [[42 : i32, 1.000000e+00 : f32], [42 : i32, 1.000000e+00 : f32]]}> : () -> !llvm.array<2 x struct<(i32, f32)>>
    "llvm.return"(%3) : (!llvm.array<2 x struct<(i32, f32)>>) -> ()
  }) : () -> ()
  "llvm.mlir.global"() <{addr_space = 0 : i32, global_type = !llvm.array<2 x array<3 x struct<(i32, f32)>>>, linkage = #llvm.linkage<external>, sym_name = "test_array_attr_3", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %2 = "llvm.mlir.constant"() <{value = [[[1 : i32, 1.000000e+00 : f32], [2 : i32, 1.000000e+00 : f32], [3 : i32, 1.000000e+00 : f32]], [[4 : i32, 1.000000e+00 : f32], [5 : i32, 1.000000e+00 : f32], [6 : i32, 1.000000e+00 : f32]]]}> : () -> !llvm.array<2 x array<3 x struct<(i32, f32)>>>
    "llvm.return"(%2) : (!llvm.array<2 x array<3 x struct<(i32, f32)>>>) -> ()
  }) : () -> ()
  "llvm.mlir.global"() <{addr_space = 0 : i32, constant, global_type = !llvm.array<2 x struct<(ptr)>>, linkage = #llvm.linkage<internal>, sym_name = "test_array_attr_struct_with_ptr", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %1 = "llvm.mlir.constant"() <{value = [[#llvm.zero], [#llvm.undef]]}> : () -> !llvm.array<2 x struct<(ptr)>>
    "llvm.return"(%1) : (!llvm.array<2 x struct<(ptr)>>) -> ()
  }) : () -> ()
  "llvm.mlir.global"() <{addr_space = 0 : i32, constant, global_type = !llvm.array<3 x struct<(i32, f32)>>, linkage = #llvm.linkage<internal>, sym_name = "test_array_attr_struct_with_struct", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %0 = "llvm.mlir.constant"() <{value = [#llvm.zero, [2 : i32, 1.000000e+00 : f32], #llvm.undef]}> : () -> !llvm.array<3 x struct<(i32, f32)>>
    "llvm.return"(%0) : (!llvm.array<3 x struct<(i32, f32)>>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.mlir.global"() <{addr_space = 0 : i32, global_type = f64, linkage = #llvm.linkage<external>, sym_name = "target_specific_attrs_only", target_specific_attrs = [["memory", "0"], ["int-attr", "4"], "no-enum-attr", ["string-attr", "string"]], unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.mlir.global"() <{addr_space = 0 : i32, alignment = 4 : i64, global_type = i32, linkage = #llvm.linkage<external>, section = "mysection", sym_name = "target_specific_attrs_combined", target_specific_attrs = ["norecurse", ["bss-section", "my_bss.1"]], unnamed_addr = 0 : i64, value = 2 : i32, visibility_ = 0 : i64}> ({
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<byte<8> (byte<8>)>, linkage = #llvm.linkage<external>, sym_name = "byte_type", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: !llvm.byte<8>):
    "llvm.return"(%arg0) : (!llvm.byte<8>) -> ()
  }) : () -> ()
}) : () -> ()

