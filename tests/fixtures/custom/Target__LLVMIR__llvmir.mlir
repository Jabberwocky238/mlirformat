module {
  llvm.mlir.global private @global_aligned32(42 : i64) {addr_space = 0 : i32, alignment = 32 : i64} : i64
  llvm.mlir.global private @global_aligned64(42 : i64) {addr_space = 0 : i32, alignment = 64 : i64} : i64
  llvm.mlir.global private @global_aligned64_native(42 : i64) {addr_space = 0 : i32, alignment = 64 : i64} : i64
  llvm.mlir.global internal @i32_global(42 : i32) {addr_space = 0 : i32} : i32
  llvm.mlir.global internal constant @i32_const(52 : i53) {addr_space = 0 : i32} : i53
  llvm.mlir.global internal @int_global_array(dense<62> : vector<3xi32>) {addr_space = 0 : i32} : !llvm.array<3 x i32>
  llvm.mlir.global internal constant @int_global_array_zero_elements(dense<> : tensor<3x0x4xf32>) {addr_space = 0 : i32} : !llvm.array<3 x array<0 x array<4 x f32>>>
  llvm.mlir.global internal constant @int_global_array_zero_elements_1d(dense<> : tensor<0xf32>) {addr_space = 0 : i32} : !llvm.array<0 x f32>
  llvm.mlir.global internal @i32_global_addr_space(62 : i32) {addr_space = 7 : i32} : i32
  llvm.mlir.global internal @float_global(0.000000e+00 : f32) {addr_space = 0 : i32} : f32
  llvm.mlir.global internal @float_global_array(dense<-5.000000e+00> : vector<1xf32>) {addr_space = 0 : i32} : !llvm.array<1 x f32>
  llvm.mlir.global internal @splat_float_global_array(dense<4.200000e+01> : tensor<4xf32>) {addr_space = 0 : i32} : !llvm.array<4 x f32>
  llvm.mlir.global internal @splat_double_global_array(dense<4.200000e+01> : tensor<3xf64>) {addr_space = 0 : i32} : !llvm.array<3 x f64>
  llvm.mlir.global internal @splat_neg_float_global_array(dense<-1.350000e+01> : tensor<4xf32>) {addr_space = 0 : i32} : !llvm.array<4 x f32>
  llvm.mlir.global internal @splat_neg_double_global_array(dense<-1.350000e+01> : tensor<3xf64>) {addr_space = 0 : i32} : !llvm.array<3 x f64>
  llvm.mlir.global internal @splat_half_global_array(dense<4.200000e+01> : tensor<4xf16>) {addr_space = 0 : i32} : !llvm.array<4 x f16>
  llvm.mlir.global internal @splat_bfloat_global_array(dense<4.200000e+01> : tensor<3xbf16>) {addr_space = 0 : i32} : !llvm.array<3 x bf16>
  llvm.mlir.global internal @splat_neg_half_global_array(dense<-1.350000e+01> : tensor<4xf16>) {addr_space = 0 : i32} : !llvm.array<4 x f16>
  llvm.mlir.global internal @splat_neg_bfloat_global_array(dense<-1.350000e+01> : tensor<3xbf16>) {addr_space = 0 : i32} : !llvm.array<3 x bf16>
  llvm.mlir.global internal constant @string_const("foobar") {addr_space = 0 : i32}
  llvm.mlir.global internal @int_global_undef() {addr_space = 0 : i32} : i64
  llvm.mlir.global internal @externally_initialized_global(0 : i32) {addr_space = 0 : i32, externally_initialized} : i32
  llvm.mlir.global internal @f4E2M1FN_global_as_i4(1.500000e+00 : f4E2M1FN) {addr_space = 0 : i32} : i4
  llvm.mlir.global internal @f6E2M3FN_global_as_i6(1.500000e+00 : f6E2M3FN) {addr_space = 0 : i32} : i6
  llvm.mlir.global internal @f6E3M2FN_global_as_i6(1.500000e+00 : f6E3M2FN) {addr_space = 0 : i32} : i6
  llvm.mlir.global internal @f8E3M4_global_as_i8(1.500000e+00 : f8E3M4) {addr_space = 0 : i32} : i8
  llvm.mlir.global internal @f8E4M3_global_as_i8(1.500000e+00 : f8E4M3) {addr_space = 0 : i32} : i8
  llvm.mlir.global internal @f8E4M3FN_global_as_i8(1.500000e+00 : f8E4M3FN) {addr_space = 0 : i32} : i8
  llvm.mlir.global internal @f8E5M2_global_as_i8(1.500000e+00 : f8E5M2) {addr_space = 0 : i32} : i8
  llvm.mlir.global internal @f8E4M3FNUZ_global_as_i8(1.500000e+00 : f8E4M3FNUZ) {addr_space = 0 : i32} : i8
  llvm.mlir.global internal @f8E5M2FNUZ_global_as_i8(1.500000e+00 : f8E5M2FNUZ) {addr_space = 0 : i32} : i8
  llvm.mlir.global internal @f8E4M3B11FNUZ_global_as_i8(1.500000e+00 : f8E4M3B11FNUZ) {addr_space = 0 : i32} : i8
  llvm.mlir.global internal @f8E8M0FNU_global_as_i8(1.000000e+00 : f8E8M0FNU) {addr_space = 0 : i32} : i8
  llvm.mlir.global internal @bf16_global_as_i16(1.500000e+00 : bf16) {addr_space = 0 : i32} : i16
  llvm.mlir.global internal @bool_global_as_i8(true) {addr_space = 0 : i32} : i8
  llvm.mlir.global external @explicit_undef() {addr_space = 0 : i32} : i32 {
    %0 = llvm.mlir.undef : i32
    llvm.return %0 : i32
  }
  llvm.mlir.global internal constant @int_gep() {addr_space = 0 : i32} : !llvm.ptr {
    %0 = llvm.mlir.addressof @i32_global : !llvm.ptr
    %1 = llvm.mlir.constant(2 : i32) : i32
    %2 = llvm.getelementptr %0[%1] : (!llvm.ptr, i32) -> !llvm.ptr, i32
    llvm.return %2 : !llvm.ptr
  }
  llvm.mlir.global internal @dense_float_vector(dense<[1.000000e+00, 2.000000e+00, 3.000000e+00]> : vector<3xf32>) {addr_space = 0 : i32} : vector<3xf32>
  llvm.mlir.global internal @splat_float_vector(dense<4.200000e+01> : vector<3xf32>) {addr_space = 0 : i32} : vector<3xf32>
  llvm.mlir.global internal @dense_double_vector(dense<[1.000000e+00, 2.000000e+00, 3.000000e+00]> : vector<3xf64>) {addr_space = 0 : i32} : vector<3xf64>
  llvm.mlir.global internal @splat_double_vector(dense<4.200000e+01> : vector<3xf64>) {addr_space = 0 : i32} : vector<3xf64>
  llvm.mlir.global internal @dense_i64_vector(dense<[1, 2, 3]> : vector<3xi64>) {addr_space = 0 : i32} : vector<3xi64>
  llvm.mlir.global internal @splat_i64_vector(dense<42> : vector<3xi64>) {addr_space = 0 : i32} : vector<3xi64>
  llvm.mlir.global internal @dense_float_vector_2d(dense<[[1.000000e+00, 2.000000e+00], [3.000000e+00, 4.000000e+00]]> : vector<2x2xf32>) {addr_space = 0 : i32} : !llvm.array<2 x vector<2xf32>>
  llvm.mlir.global internal @splat_float_vector_2d(dense<4.200000e+01> : vector<2x2xf32>) {addr_space = 0 : i32} : !llvm.array<2 x vector<2xf32>>
  llvm.mlir.global internal @dense_float_vector_3d(dense<[[[1.000000e+00, 2.000000e+00], [3.000000e+00, 4.000000e+00]], [[5.000000e+00, 6.000000e+00], [7.000000e+00, 8.000000e+00]]]> : vector<2x2x2xf32>) {addr_space = 0 : i32} : !llvm.array<2 x array<2 x vector<2xf32>>>
  llvm.mlir.global internal @splat_float_vector_3d(dense<4.200000e+01> : vector<2x2x2xf32>) {addr_space = 0 : i32} : !llvm.array<2 x array<2 x vector<2xf32>>>
  llvm.mlir.global private @private(42 : i32) {addr_space = 0 : i32} : i32
  llvm.mlir.global internal @internal(42 : i32) {addr_space = 0 : i32} : i32
  llvm.mlir.global available_externally @available_externally(42 : i32) {addr_space = 0 : i32} : i32
  llvm.mlir.global linkonce @linkonce(42 : i32) {addr_space = 0 : i32} : i32
  llvm.mlir.global weak @weak(42 : i32) {addr_space = 0 : i32} : i32
  llvm.mlir.global common @common(0 : i32) {addr_space = 0 : i32} : i32
  llvm.mlir.global appending @appending(dense<[1, 2, 3]> : tensor<3xi32>) {addr_space = 0 : i32} : !llvm.array<3 x i32>
  llvm.mlir.global extern_weak @extern_weak() {addr_space = 0 : i32} : i32
  llvm.mlir.global linkonce_odr @linkonce_odr(42 : i32) {addr_space = 0 : i32} : i32
  llvm.mlir.global weak_odr @weak_odr(42 : i32) {addr_space = 0 : i32} : i32
  llvm.mlir.global external @external() {addr_space = 0 : i32} : i32
  llvm.mlir.global external hidden constant @hidden("string") {addr_space = 0 : i32}
  llvm.mlir.global external protected constant @protected(42 : i64) {addr_space = 0 : i32} : i64
  llvm.mlir.global private constant @no_unnamed_addr(42 : i64) {addr_space = 0 : i32} : i64
  llvm.mlir.global private local_unnamed_addr constant @local_unnamed_addr(42 : i64) {addr_space = 0 : i32} : i64
  llvm.mlir.global private unnamed_addr constant @unnamed_addr(42 : i64) {addr_space = 0 : i32} : i64
  llvm.mlir.global external @has_dso_local(42 : i64) {addr_space = 0 : i32, dso_local} : i64
  llvm.mlir.global external thread_local @has_thr_local(42 : i64) {addr_space = 0 : i32} : i64
  llvm.mlir.global internal constant @sectionvar("teststring") {addr_space = 0 : i32, section = ".mysection"}
  llvm.func @malloc(i64) -> !llvm.ptr
  llvm.func @free(!llvm.ptr)
  llvm.func @empty() {
    llvm.return
  }
  llvm.func @global_refs() {
    %0 = llvm.mlir.addressof @i32_global : !llvm.ptr
    %1 = llvm.load %0 : !llvm.ptr -> i32
    %2 = llvm.mlir.addressof @string_const : !llvm.ptr
    %3 = llvm.mlir.constant(0 : index) : i64
    %4 = llvm.getelementptr %2[%3, %3] : (!llvm.ptr, i64, i64) -> !llvm.ptr, !llvm.array<6 x i8>
    %5 = llvm.load %4 : !llvm.ptr -> i8
    llvm.return
  }
  llvm.func @body(i64)
  llvm.func @simple_loop() {
    llvm.br ^bb1
  ^bb1:  // pred: ^bb0
    %0 = llvm.mlir.constant(1 : index) : i64
    %1 = llvm.mlir.constant(42 : index) : i64
    llvm.br ^bb2(%0 : i64)
  ^bb2(%2: i64):  // 2 preds: ^bb1, ^bb3
    %3 = llvm.icmp "slt" %2, %1 : i64
    llvm.cond_br %3, ^bb3, ^bb4
  ^bb3:  // pred: ^bb2
    llvm.call @body(%2) : (i64) -> ()
    %4 = llvm.mlir.constant(1 : index) : i64
    %5 = llvm.add %2, %4 : i64
    llvm.br ^bb2(%5 : i64)
  ^bb4:  // pred: ^bb2
    llvm.return
  }
  llvm.func @simple_caller() {
    llvm.call @simple_loop() : () -> ()
    llvm.return
  }
  llvm.func @ml_caller() {
    llvm.call @simple_loop() : () -> ()
    llvm.call @more_imperfectly_nested_loops() : () -> ()
    llvm.return
  }
  llvm.func @body_args(i64) -> i64
  llvm.func @other(i64, i32) -> i32
  llvm.func @func_args(%arg0: i32, %arg1: i32) -> i32 {
    %0 = llvm.mlir.constant(0 : i32) : i32
    llvm.br ^bb1
  ^bb1:  // pred: ^bb0
    %1 = llvm.mlir.constant(0 : index) : i64
    %2 = llvm.mlir.constant(42 : index) : i64
    llvm.br ^bb2(%1 : i64)
  ^bb2(%3: i64):  // 2 preds: ^bb1, ^bb3
    %4 = llvm.icmp "slt" %3, %2 : i64
    llvm.cond_br %4, ^bb3, ^bb4
  ^bb3:  // pred: ^bb2
    %5 = llvm.call @body_args(%3) : (i64) -> i64
    %6 = llvm.call @other(%5, %arg0) : (i64, i32) -> i32
    %7 = llvm.call @other(%5, %6) : (i64, i32) -> i32
    %8 = llvm.call @other(%5, %arg1) : (i64, i32) -> i32
    %9 = llvm.mlir.constant(1 : index) : i64
    %10 = llvm.add %3, %9 : i64
    llvm.br ^bb2(%10 : i64)
  ^bb4:  // pred: ^bb2
    %11 = llvm.mlir.constant(0 : index) : i64
    %12 = llvm.call @other(%11, %0) : (i64, i32) -> i32
    llvm.return %12 : i32
  }
  llvm.func @pre(i64)
  llvm.func @body2(i64, i64)
  llvm.func @post(i64)
  llvm.func @imperfectly_nested_loops() {
    llvm.br ^bb1
  ^bb1:  // pred: ^bb0
    %0 = llvm.mlir.constant(0 : index) : i64
    %1 = llvm.mlir.constant(42 : index) : i64
    llvm.br ^bb2(%0 : i64)
  ^bb2(%2: i64):  // 2 preds: ^bb1, ^bb7
    %3 = llvm.icmp "slt" %2, %1 : i64
    llvm.cond_br %3, ^bb3, ^bb8
  ^bb3:  // pred: ^bb2
    llvm.call @pre(%2) : (i64) -> ()
    llvm.br ^bb4
  ^bb4:  // pred: ^bb3
    %4 = llvm.mlir.constant(7 : index) : i64
    %5 = llvm.mlir.constant(56 : index) : i64
    llvm.br ^bb5(%4 : i64)
  ^bb5(%6: i64):  // 2 preds: ^bb4, ^bb6
    %7 = llvm.icmp "slt" %6, %5 : i64
    llvm.cond_br %7, ^bb6, ^bb7
  ^bb6:  // pred: ^bb5
    llvm.call @body2(%2, %6) : (i64, i64) -> ()
    %8 = llvm.mlir.constant(2 : index) : i64
    %9 = llvm.add %6, %8 : i64
    llvm.br ^bb5(%9 : i64)
  ^bb7:  // pred: ^bb5
    llvm.call @post(%2) : (i64) -> ()
    %10 = llvm.mlir.constant(1 : index) : i64
    %11 = llvm.add %2, %10 : i64
    llvm.br ^bb2(%11 : i64)
  ^bb8:  // pred: ^bb2
    llvm.return
  }
  llvm.func @mid(i64)
  llvm.func @body3(i64, i64)
  llvm.func @more_imperfectly_nested_loops() {
    llvm.br ^bb1
  ^bb1:  // pred: ^bb0
    %0 = llvm.mlir.constant(0 : index) : i64
    %1 = llvm.mlir.constant(42 : index) : i64
    llvm.br ^bb2(%0 : i64)
  ^bb2(%2: i64):  // 2 preds: ^bb1, ^bb11
    %3 = llvm.icmp "slt" %2, %1 : i64
    llvm.cond_br %3, ^bb3, ^bb12
  ^bb3:  // pred: ^bb2
    llvm.call @pre(%2) : (i64) -> ()
    llvm.br ^bb4
  ^bb4:  // pred: ^bb3
    %4 = llvm.mlir.constant(7 : index) : i64
    %5 = llvm.mlir.constant(56 : index) : i64
    llvm.br ^bb5(%4 : i64)
  ^bb5(%6: i64):  // 2 preds: ^bb4, ^bb6
    %7 = llvm.icmp "slt" %6, %5 : i64
    llvm.cond_br %7, ^bb6, ^bb7
  ^bb6:  // pred: ^bb5
    llvm.call @body2(%2, %6) : (i64, i64) -> ()
    %8 = llvm.mlir.constant(2 : index) : i64
    %9 = llvm.add %6, %8 : i64
    llvm.br ^bb5(%9 : i64)
  ^bb7:  // pred: ^bb5
    llvm.call @mid(%2) : (i64) -> ()
    llvm.br ^bb8
  ^bb8:  // pred: ^bb7
    %10 = llvm.mlir.constant(18 : index) : i64
    %11 = llvm.mlir.constant(37 : index) : i64
    llvm.br ^bb9(%10 : i64)
  ^bb9(%12: i64):  // 2 preds: ^bb8, ^bb10
    %13 = llvm.icmp "slt" %12, %11 : i64
    llvm.cond_br %13, ^bb10, ^bb11
  ^bb10:  // pred: ^bb9
    llvm.call @body3(%2, %12) : (i64, i64) -> ()
    %14 = llvm.mlir.constant(3 : index) : i64
    %15 = llvm.add %12, %14 : i64
    llvm.br ^bb9(%15 : i64)
  ^bb11:  // pred: ^bb9
    llvm.call @post(%2) : (i64) -> ()
    %16 = llvm.mlir.constant(1 : index) : i64
    %17 = llvm.add %2, %16 : i64
    llvm.br ^bb2(%17 : i64)
  ^bb12:  // pred: ^bb2
    llvm.return
  }
  llvm.func internal @func_internal() {
    llvm.return
  }
  llvm.func hidden @hidden_func() {
    llvm.return
  }
  llvm.func protected @protected_func() {
    llvm.return
  }
  llvm.func @dso_local_func() attributes {dso_local} {
    llvm.return
  }
  llvm.func @memref_alloc() {
    %0 = llvm.mlir.constant(10 : index) : i64
    %1 = llvm.mlir.constant(10 : index) : i64
    %2 = llvm.mul %0, %1 : i64
    %3 = llvm.mlir.undef : !llvm.struct<(ptr)>
    %4 = llvm.mlir.constant(4 : index) : i64
    %5 = llvm.mul %2, %4 : i64
    %6 = llvm.call @malloc(%5) : (i64) -> !llvm.ptr
    %7 = llvm.insertvalue %6, %3[0] : !llvm.struct<(ptr)> 
    llvm.return
  }
  llvm.func @get_index() -> i64
  llvm.func @store_load_static() {
    %0 = llvm.mlir.constant(10 : index) : i64
    %1 = llvm.mlir.undef : !llvm.struct<(ptr)>
    %2 = llvm.mlir.constant(4 : index) : i64
    %3 = llvm.mul %0, %2 : i64
    %4 = llvm.call @malloc(%3) : (i64) -> !llvm.ptr
    %5 = llvm.insertvalue %4, %1[0] : !llvm.struct<(ptr)> 
    %6 = llvm.mlir.constant(1.000000e+00 : f32) : f32
    llvm.br ^bb1
  ^bb1:  // pred: ^bb0
    %7 = llvm.mlir.constant(0 : index) : i64
    %8 = llvm.mlir.constant(10 : index) : i64
    llvm.br ^bb2(%7 : i64)
  ^bb2(%9: i64):  // 2 preds: ^bb1, ^bb3
    %10 = llvm.icmp "slt" %9, %8 : i64
    llvm.cond_br %10, ^bb3, ^bb4
  ^bb3:  // pred: ^bb2
    %11 = llvm.mlir.constant(10 : index) : i64
    %12 = llvm.extractvalue %5[0] : !llvm.struct<(ptr)> 
    %13 = llvm.getelementptr %12[%9] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %6, %13 : f32, !llvm.ptr
    %14 = llvm.mlir.constant(1 : index) : i64
    %15 = llvm.add %9, %14 : i64
    llvm.br ^bb2(%15 : i64)
  ^bb4:  // pred: ^bb2
    llvm.br ^bb5
  ^bb5:  // pred: ^bb4
    %16 = llvm.mlir.constant(0 : index) : i64
    %17 = llvm.mlir.constant(10 : index) : i64
    llvm.br ^bb6(%16 : i64)
  ^bb6(%18: i64):  // 2 preds: ^bb5, ^bb7
    %19 = llvm.icmp "slt" %18, %17 : i64
    llvm.cond_br %19, ^bb7, ^bb8
  ^bb7:  // pred: ^bb6
    %20 = llvm.mlir.constant(10 : index) : i64
    %21 = llvm.extractvalue %5[0] : !llvm.struct<(ptr)> 
    %22 = llvm.getelementptr %21[%18] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %23 = llvm.load %22 : !llvm.ptr -> f32
    %24 = llvm.mlir.constant(1 : index) : i64
    %25 = llvm.add %18, %24 : i64
    llvm.br ^bb6(%25 : i64)
  ^bb8:  // pred: ^bb6
    llvm.return
  }
  llvm.func @store_load_dynamic(%arg0: i64) {
    %0 = llvm.mlir.undef : !llvm.struct<(ptr, i64)>
    %1 = llvm.mlir.constant(4 : index) : i64
    %2 = llvm.mul %arg0, %1 : i64
    %3 = llvm.call @malloc(%2) : (i64) -> !llvm.ptr
    %4 = llvm.insertvalue %3, %0[0] : !llvm.struct<(ptr, i64)> 
    %5 = llvm.insertvalue %arg0, %4[1] : !llvm.struct<(ptr, i64)> 
    %6 = llvm.mlir.constant(1.000000e+00 : f32) : f32
    llvm.br ^bb1
  ^bb1:  // pred: ^bb0
    %7 = llvm.mlir.constant(0 : index) : i64
    llvm.br ^bb2(%7 : i64)
  ^bb2(%8: i64):  // 2 preds: ^bb1, ^bb3
    %9 = llvm.icmp "slt" %8, %arg0 : i64
    llvm.cond_br %9, ^bb3, ^bb4
  ^bb3:  // pred: ^bb2
    %10 = llvm.extractvalue %5[1] : !llvm.struct<(ptr, i64)> 
    %11 = llvm.extractvalue %5[0] : !llvm.struct<(ptr, i64)> 
    %12 = llvm.getelementptr %11[%8] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %6, %12 : f32, !llvm.ptr
    %13 = llvm.mlir.constant(1 : index) : i64
    %14 = llvm.add %8, %13 : i64
    llvm.br ^bb2(%14 : i64)
  ^bb4:  // pred: ^bb2
    llvm.br ^bb5
  ^bb5:  // pred: ^bb4
    %15 = llvm.mlir.constant(0 : index) : i64
    llvm.br ^bb6(%15 : i64)
  ^bb6(%16: i64):  // 2 preds: ^bb5, ^bb7
    %17 = llvm.icmp "slt" %16, %arg0 : i64
    llvm.cond_br %17, ^bb7, ^bb8
  ^bb7:  // pred: ^bb6
    %18 = llvm.extractvalue %5[1] : !llvm.struct<(ptr, i64)> 
    %19 = llvm.extractvalue %5[0] : !llvm.struct<(ptr, i64)> 
    %20 = llvm.getelementptr %19[%16] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %21 = llvm.load %20 : !llvm.ptr -> f32
    %22 = llvm.mlir.constant(1 : index) : i64
    %23 = llvm.add %16, %22 : i64
    llvm.br ^bb6(%23 : i64)
  ^bb8:  // pred: ^bb6
    llvm.return
  }
  llvm.func @store_load_mixed(%arg0: i64) {
    %0 = llvm.mlir.constant(10 : index) : i64
    %1 = llvm.mlir.constant(2 : index) : i64
    %2 = llvm.mlir.constant(4 : index) : i64
    %3 = llvm.mul %1, %arg0 : i64
    %4 = llvm.mul %3, %2 : i64
    %5 = llvm.mul %4, %0 : i64
    %6 = llvm.mlir.undef : !llvm.struct<(ptr, i64, i64)>
    %7 = llvm.mlir.constant(4 : index) : i64
    %8 = llvm.mul %5, %7 : i64
    %9 = llvm.call @malloc(%8) : (i64) -> !llvm.ptr
    %10 = llvm.insertvalue %9, %6[0] : !llvm.struct<(ptr, i64, i64)> 
    %11 = llvm.insertvalue %arg0, %10[1] : !llvm.struct<(ptr, i64, i64)> 
    %12 = llvm.insertvalue %0, %11[2] : !llvm.struct<(ptr, i64, i64)> 
    %13 = llvm.mlir.constant(1 : index) : i64
    %14 = llvm.mlir.constant(2 : index) : i64
    %15 = llvm.call @get_index() : () -> i64
    %16 = llvm.call @get_index() : () -> i64
    %17 = llvm.mlir.constant(4.200000e+01 : f32) : f32
    %18 = llvm.mlir.constant(2 : index) : i64
    %19 = llvm.extractvalue %12[1] : !llvm.struct<(ptr, i64, i64)> 
    %20 = llvm.mlir.constant(4 : index) : i64
    %21 = llvm.extractvalue %12[2] : !llvm.struct<(ptr, i64, i64)> 
    %22 = llvm.mul %13, %19 : i64
    %23 = llvm.add %22, %14 : i64
    %24 = llvm.mul %23, %20 : i64
    %25 = llvm.add %24, %15 : i64
    %26 = llvm.mul %25, %21 : i64
    %27 = llvm.add %26, %16 : i64
    %28 = llvm.extractvalue %12[0] : !llvm.struct<(ptr, i64, i64)> 
    %29 = llvm.getelementptr %28[%27] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %17, %29 : f32, !llvm.ptr
    %30 = llvm.mlir.constant(2 : index) : i64
    %31 = llvm.extractvalue %12[1] : !llvm.struct<(ptr, i64, i64)> 
    %32 = llvm.mlir.constant(4 : index) : i64
    %33 = llvm.extractvalue %12[2] : !llvm.struct<(ptr, i64, i64)> 
    %34 = llvm.mul %16, %31 : i64
    %35 = llvm.add %34, %15 : i64
    %36 = llvm.mul %35, %32 : i64
    %37 = llvm.add %36, %14 : i64
    %38 = llvm.mul %37, %33 : i64
    %39 = llvm.add %38, %13 : i64
    %40 = llvm.extractvalue %12[0] : !llvm.struct<(ptr, i64, i64)> 
    %41 = llvm.getelementptr %40[%39] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %42 = llvm.load %41 : !llvm.ptr -> f32
    llvm.return
  }
  llvm.func @memref_args_rets(%arg0: !llvm.struct<(ptr)>, %arg1: !llvm.struct<(ptr, i64)>, %arg2: !llvm.struct<(ptr, i64)>) -> !llvm.struct<(ptr, i64)> {
    %0 = llvm.mlir.constant(7 : index) : i64
    %1 = llvm.call @get_index() : () -> i64
    %2 = llvm.mlir.constant(4.200000e+01 : f32) : f32
    %3 = llvm.mlir.constant(10 : index) : i64
    %4 = llvm.extractvalue %arg0[0] : !llvm.struct<(ptr)> 
    %5 = llvm.getelementptr %4[%0] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %2, %5 : f32, !llvm.ptr
    %6 = llvm.extractvalue %arg1[1] : !llvm.struct<(ptr, i64)> 
    %7 = llvm.extractvalue %arg1[0] : !llvm.struct<(ptr, i64)> 
    %8 = llvm.getelementptr %7[%0] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %2, %8 : f32, !llvm.ptr
    %9 = llvm.mlir.constant(10 : index) : i64
    %10 = llvm.extractvalue %arg2[1] : !llvm.struct<(ptr, i64)> 
    %11 = llvm.mul %0, %10 : i64
    %12 = llvm.add %11, %1 : i64
    %13 = llvm.extractvalue %arg2[0] : !llvm.struct<(ptr, i64)> 
    %14 = llvm.getelementptr %13[%12] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %2, %14 : f32, !llvm.ptr
    %15 = llvm.mlir.constant(10 : index) : i64
    %16 = llvm.mul %15, %1 : i64
    %17 = llvm.mlir.undef : !llvm.struct<(ptr, i64)>
    %18 = llvm.mlir.constant(4 : index) : i64
    %19 = llvm.mul %16, %18 : i64
    %20 = llvm.call @malloc(%19) : (i64) -> !llvm.ptr
    %21 = llvm.insertvalue %20, %17[0] : !llvm.struct<(ptr, i64)> 
    %22 = llvm.insertvalue %1, %21[1] : !llvm.struct<(ptr, i64)> 
    llvm.return %22 : !llvm.struct<(ptr, i64)>
  }
  llvm.func @memref_dim(%arg0: !llvm.struct<(ptr, i64, i64)>) -> i64 {
    %0 = llvm.mlir.constant(42 : index) : i64
    %1 = llvm.extractvalue %arg0[1] : !llvm.struct<(ptr, i64, i64)> 
    %2 = llvm.mlir.constant(10 : index) : i64
    %3 = llvm.extractvalue %arg0[2] : !llvm.struct<(ptr, i64, i64)> 
    %4 = llvm.add %0, %1 : i64
    %5 = llvm.add %2, %3 : i64
    %6 = llvm.add %4, %5 : i64
    llvm.return %6 : i64
  }
  llvm.func @get_i64() -> i64
  llvm.func @get_f32() -> f32
  llvm.func @get_memref() -> !llvm.struct<(ptr, i64, i64)>
  llvm.func @multireturn() -> !llvm.struct<(i64, f32, struct<(ptr, i64, i64)>)> {
    %0 = llvm.call @get_i64() : () -> i64
    %1 = llvm.call @get_f32() : () -> f32
    %2 = llvm.call @get_memref() : () -> !llvm.struct<(ptr, i64, i64)>
    %3 = llvm.mlir.undef : !llvm.struct<(i64, f32, struct<(ptr, i64, i64)>)>
    %4 = llvm.insertvalue %0, %3[0] : !llvm.struct<(i64, f32, struct<(ptr, i64, i64)>)> 
    %5 = llvm.insertvalue %1, %4[1] : !llvm.struct<(i64, f32, struct<(ptr, i64, i64)>)> 
    %6 = llvm.insertvalue %2, %5[2] : !llvm.struct<(i64, f32, struct<(ptr, i64, i64)>)> 
    llvm.return %6 : !llvm.struct<(i64, f32, struct<(ptr, i64, i64)>)>
  }
  llvm.func @multireturn_caller() {
    %0 = llvm.call @multireturn() : () -> !llvm.struct<(i64, f32, struct<(ptr, i64, i64)>)>
    %1 = llvm.extractvalue %0[0] : !llvm.struct<(i64, f32, struct<(ptr, i64, i64)>)> 
    %2 = llvm.extractvalue %0[1] : !llvm.struct<(i64, f32, struct<(ptr, i64, i64)>)> 
    %3 = llvm.extractvalue %0[2] : !llvm.struct<(i64, f32, struct<(ptr, i64, i64)>)> 
    %4 = llvm.mlir.constant(42 : i64) : i64
    %5 = llvm.add %1, %4 : i64
    %6 = llvm.mlir.constant(4.200000e+01 : f32) : f32
    %7 = llvm.fadd %2, %6 : f32
    %8 = llvm.mlir.constant(0 : index) : i64
    %9 = llvm.mlir.constant(42 : index) : i64
    %10 = llvm.extractvalue %3[1] : !llvm.struct<(ptr, i64, i64)> 
    %11 = llvm.mlir.constant(10 : index) : i64
    %12 = llvm.extractvalue %3[2] : !llvm.struct<(ptr, i64, i64)> 
    %13 = llvm.mul %8, %10 : i64
    %14 = llvm.add %13, %8 : i64
    %15 = llvm.mul %14, %11 : i64
    %16 = llvm.add %15, %8 : i64
    %17 = llvm.mul %16, %12 : i64
    %18 = llvm.add %17, %8 : i64
    %19 = llvm.extractvalue %3[0] : !llvm.struct<(ptr, i64, i64)> 
    %20 = llvm.getelementptr %19[%18] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %21 = llvm.load %20 : !llvm.ptr -> f32
    llvm.return
  }
  llvm.func @vector_ops(%arg0: vector<4xf32>, %arg1: vector<4xi1>, %arg2: vector<4xi64>) -> vector<4xf32> {
    %0 = llvm.mlir.constant(dense<4.200000e+01> : vector<4xf32>) : vector<4xf32>
    %1 = llvm.fadd %arg0, %0 : vector<4xf32>
    %2 = llvm.select %arg1, %1, %arg0 : vector<4xi1>, vector<4xf32>
    %3 = llvm.sdiv %arg2, %arg2 : vector<4xi64>
    %4 = llvm.udiv %arg2, %arg2 : vector<4xi64>
    %5 = llvm.srem %arg2, %arg2 : vector<4xi64>
    %6 = llvm.urem %arg2, %arg2 : vector<4xi64>
    %7 = llvm.fdiv %arg0, %0 : vector<4xf32>
    %8 = llvm.frem %arg0, %0 : vector<4xf32>
    %9 = llvm.and %arg2, %arg2 : vector<4xi64>
    %10 = llvm.or %arg2, %arg2 : vector<4xi64>
    %11 = llvm.xor %arg2, %arg2 : vector<4xi64>
    %12 = llvm.shl %arg2, %arg2 : vector<4xi64>
    %13 = llvm.lshr %arg2, %arg2 : vector<4xi64>
    %14 = llvm.ashr %arg2, %arg2 : vector<4xi64>
    llvm.return %1 : vector<4xf32>
  }
  llvm.func @vector_splat_1d() -> vector<4xf32> {
    %0 = llvm.mlir.constant(dense<0.000000e+00> : vector<4xf32>) : vector<4xf32>
    llvm.return %0 : vector<4xf32>
  }
  llvm.func @vector_splat_1d_scalable() -> vector<[4]xf32> {
    %0 = llvm.mlir.constant(dense<0.000000e+00> : vector<[4]xf32>) : vector<[4]xf32>
    llvm.return %0 : vector<[4]xf32>
  }
  llvm.func @vector_splat_2d() -> !llvm.array<4 x vector<16xf32>> {
    %0 = llvm.mlir.constant(dense<0.000000e+00> : vector<4x16xf32>) : !llvm.array<4 x vector<16xf32>>
    llvm.return %0 : !llvm.array<4 x vector<16xf32>>
  }
  llvm.func @vector_splat_3d() -> !llvm.array<4 x array<16 x vector<4xf32>>> {
    %0 = llvm.mlir.constant(dense<0.000000e+00> : vector<4x16x4xf32>) : !llvm.array<4 x array<16 x vector<4xf32>>>
    llvm.return %0 : !llvm.array<4 x array<16 x vector<4xf32>>>
  }
  llvm.func @vector_splat_nonzero() -> vector<4xf32> {
    %0 = llvm.mlir.constant(dense<1.000000e+00> : vector<4xf32>) : vector<4xf32>
    llvm.return %0 : vector<4xf32>
  }
  llvm.func @vector_splat_nonzero_scalable() -> vector<[4]xf32> {
    %0 = llvm.mlir.constant(dense<1.000000e+00> : vector<[4]xf32>) : vector<[4]xf32>
    llvm.return %0 : vector<[4]xf32>
  }
  llvm.func @ops(%arg0: f32, %arg1: f32, %arg2: i32, %arg3: i32) -> !llvm.struct<(f32, i32)> {
    %0 = llvm.fsub %arg0, %arg1 : f32
    %1 = llvm.sub %arg2, %arg3 : i32
    %2 = llvm.icmp "slt" %arg2, %1 : i32
    %3 = llvm.select %2, %arg2, %1 : i1, i32
    %4 = llvm.sdiv %arg2, %arg3 : i32
    %5 = llvm.udiv %arg2, %arg3 : i32
    %6 = llvm.srem %arg2, %arg3 : i32
    %7 = llvm.urem %arg2, %arg3 : i32
    %8 = llvm.mlir.undef : !llvm.struct<(f32, i32)>
    %9 = llvm.insertvalue %0, %8[0] : !llvm.struct<(f32, i32)> 
    %10 = llvm.insertvalue %3, %9[1] : !llvm.struct<(f32, i32)> 
    %11 = llvm.fdiv %arg0, %arg1 : f32
    %12 = llvm.frem %arg0, %arg1 : f32
    %13 = llvm.and %arg2, %arg3 : i32
    %14 = llvm.or %arg2, %arg3 : i32
    %15 = llvm.xor %arg2, %arg3 : i32
    %16 = llvm.shl %arg2, %arg3 : i32
    %17 = llvm.lshr %arg2, %arg3 : i32
    %18 = llvm.ashr %arg2, %arg3 : i32
    %19 = llvm.fneg %arg0 : f32
    llvm.return %10 : !llvm.struct<(f32, i32)>
  }
  llvm.func @gep(%arg0: !llvm.ptr, %arg1: i64, %arg2: !llvm.ptr) {
    %0 = llvm.getelementptr %arg0[%arg1, 1, 0] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.struct<(i32, struct<(i32, f32)>)>
    %1 = llvm.getelementptr inbounds %arg2[%arg1, 0, %arg1] : (!llvm.ptr, i64, i64) -> !llvm.ptr, !llvm.struct<(array<10 x f32>)>
    %2 = llvm.getelementptr inbounds|nuw %arg2[%arg1, 0, %arg1] : (!llvm.ptr, i64, i64) -> !llvm.ptr, !llvm.struct<(array<10 x f32>)>
    %3 = llvm.getelementptr nusw %arg2[%arg1, 0, %arg1] : (!llvm.ptr, i64, i64) -> !llvm.ptr, !llvm.struct<(array<10 x f32>)>
    %4 = llvm.getelementptr nusw|nuw %arg2[%arg1, 0, %arg1] : (!llvm.ptr, i64, i64) -> !llvm.ptr, !llvm.struct<(array<10 x f32>)>
    %5 = llvm.getelementptr nuw %arg2[%arg1, 0, %arg1] : (!llvm.ptr, i64, i64) -> !llvm.ptr, !llvm.struct<(array<10 x f32>)>
    llvm.return
  }
  llvm.func @indirect_const_call(%arg0: i64) {
    %0 = llvm.mlir.addressof @body : !llvm.ptr
    llvm.call %0(%arg0) : !llvm.ptr, (i64) -> ()
    llvm.return
  }
  llvm.func @indirect_call(%arg0: !llvm.ptr<42>, %arg1: f32) -> i32 {
    %0 = llvm.call %arg0(%arg1) : !llvm.ptr<42>, (f32) -> i32
    llvm.return %0 : i32
  }
  llvm.func @cond_br_arguments(%arg0: i1, %arg1: i1) {
    llvm.cond_br %arg0, ^bb1(%arg0 : i1), ^bb2
  ^bb1(%0: i1):  // 2 preds: ^bb0, ^bb2
    llvm.return
  ^bb2:  // pred: ^bb0
    llvm.br ^bb1(%arg1 : i1)
  }
  llvm.func @llvm_noalias(%arg0: !llvm.ptr {llvm.noalias}) {
    llvm.return
  }
  llvm.func @llvm_noalias_decl(!llvm.ptr {llvm.noalias})
  llvm.func @byrefattr(%arg0: !llvm.ptr {llvm.byref = i32}) {
    llvm.return
  }
  llvm.func @byrefattr_decl(!llvm.ptr {llvm.byref = i32})
  llvm.func @byvalattr(%arg0: !llvm.ptr {llvm.byval = i32}) {
    llvm.return
  }
  llvm.func @byvalattr_decl(!llvm.ptr {llvm.byval = i32})
  llvm.func @sretattr(%arg0: !llvm.ptr {llvm.sret = i32}) {
    llvm.return
  }
  llvm.func @sretattr_decl(!llvm.ptr {llvm.sret = i32})
  llvm.func @nestattr(%arg0: !llvm.ptr {llvm.nest}) {
    llvm.return
  }
  llvm.func @nestattr_decl(!llvm.ptr {llvm.nest})
  llvm.func @noundefattr(%arg0: i32 {llvm.noundef}) {
    llvm.return
  }
  llvm.func @noundefattr_decl(i32 {llvm.noundef})
  llvm.func @llvm_align(%arg0: !llvm.ptr {llvm.align = 4 : i64}) {
    llvm.return
  }
  llvm.func @llvm_align_decl(!llvm.ptr {llvm.align = 4 : i64})
  llvm.func @inallocaattr(%arg0: !llvm.ptr {llvm.inalloca = i32}) {
    llvm.return
  }
  llvm.func @inallocaattr_decl(!llvm.ptr {llvm.inalloca = i32})
  llvm.func @signextattr(%arg0: i1 {llvm.signext}) {
    llvm.return
  }
  llvm.func @signextattr_decl(i1 {llvm.signext})
  llvm.func @zeroextattr(%arg0: i1 {llvm.zeroext}) {
    llvm.return
  }
  llvm.func @zeroextattr_decl(i1 {llvm.zeroext})
  llvm.func @alignattr_decl(!llvm.ptr {llvm.align = 64 : i64})
  llvm.func @dereferenceableattr_decl(!llvm.ptr {llvm.dereferenceable = 32 : i64})
  llvm.func @dereferenceableornullattr_decl(!llvm.ptr {llvm.dereferenceable_or_null = 32 : i64})
  llvm.func @inregattr_decl(!llvm.ptr {llvm.inreg})
  llvm.func @nocaptureattr_decl(!llvm.ptr {llvm.nocapture})
  llvm.func @nofreeattr_decl(!llvm.ptr {llvm.nofree})
  llvm.func @nonnullattr_decl(!llvm.ptr {llvm.nonnull})
  llvm.func @preallocatedattr_decl(!llvm.ptr {llvm.preallocated = f32})
  llvm.func @returnedattr_decl(!llvm.ptr {llvm.returned}) -> !llvm.ptr
  llvm.func @alignstackattr_decl(!llvm.ptr {llvm.alignstack = 32 : i64})
  llvm.func @writeonlyattr_decl(!llvm.ptr {llvm.writeonly})
  llvm.func @writableattr(%arg0: !llvm.ptr {llvm.writable}) {
    llvm.return
  }
  llvm.func @writableattr_decl(!llvm.ptr {llvm.writable})
  llvm.func @deadonunwindattr(%arg0: !llvm.ptr {llvm.dead_on_unwind}) {
    llvm.return
  }
  llvm.func @deadonunwindattr_decl(!llvm.ptr {llvm.dead_on_unwind})
  llvm.func @deadonreturnattr(%arg0: !llvm.ptr {llvm.dead_on_return = 8 : i64}) {
    llvm.return
  }
  llvm.func @deadonreturnattr_decl(!llvm.ptr {llvm.dead_on_return = 8 : i64})
  llvm.func @nofpclassattr(%arg0: f32 {llvm.nofpclass = 519 : i64}) {
    llvm.return
  }
  llvm.func @nofpclassattr_decl(f32 {llvm.nofpclass = 519 : i64})
  llvm.func @nofpclassattr_ret_decl() -> (f32 {llvm.nofpclass = 519 : i64})
  llvm.func @alignattr_ret_decl() -> (!llvm.ptr {llvm.align = 4 : i64})
  llvm.func @noaliasattr_ret_decl() -> (!llvm.ptr {llvm.noalias})
  llvm.func @noundefattr_ret_decl() -> (!llvm.ptr {llvm.noundef})
  llvm.func @signextattr_ret_decl() -> (i1 {llvm.signext})
  llvm.func @zeroextattr_ret_decl() -> (i1 {llvm.zeroext})
  llvm.func @nonnullattr_ret_decl() -> (!llvm.ptr {llvm.nonnull})
  llvm.func @dereferenceableattr_ret_decl() -> (!llvm.ptr {llvm.dereferenceable = 32 : i64})
  llvm.func @dereferenceableornullattr_ret_decl() -> (!llvm.ptr {llvm.dereferenceable_or_null = 16 : i64})
  llvm.func @inregattr_ret_decl() -> (!llvm.ptr {llvm.inreg})
  llvm.func @varargs(...) -> f32
  llvm.func @varargs_call(%arg0: i32) {
    %0 = llvm.call @varargs(%arg0) vararg(!llvm.func<f32 (...)>) : (i32) -> f32
    %1 = llvm.call @varargs(%arg0) vararg(!llvm.func<f32 (...)>) {fastmathFlags = #llvm.fastmath<nnan>} : (i32) -> f32
    llvm.return
  }
  llvm.func @indirect_varargs_call(%arg0: !llvm.ptr, %arg1: i32) {
    %0 = llvm.call %arg0(%arg1) vararg(!llvm.func<f32 (...)>) : !llvm.ptr, (i32) -> f32
    %1 = llvm.call %arg0(%arg1) vararg(!llvm.func<f32 (...)>) {fastmathFlags = #llvm.fastmath<nnan>} : !llvm.ptr, (i32) -> f32
    llvm.return
  }
  llvm.func @intpointerconversion(%arg0: i32) -> i32 {
    %0 = llvm.inttoptr %arg0 : i32 to !llvm.ptr
    %1 = llvm.ptrtoint %0 : !llvm.ptr to i32
    llvm.return %1 : i32
  }
  llvm.func @addrpointerconversion_scalar(%arg0: !llvm.ptr) -> i64 {
    %0 = llvm.ptrtoaddr %arg0 : !llvm.ptr to i64
    llvm.return %0 : i64
  }
  llvm.func @addrpointerconversion_vector(%arg0: vector<3x!llvm.ptr>) -> vector<3xi64> {
    %0 = llvm.ptrtoaddr %arg0 : vector<3x!llvm.ptr> to vector<3xi64>
    llvm.return %0 : vector<3xi64>
  }
  llvm.func @fpconversion(%arg0: i32) -> i32 {
    %0 = llvm.sitofp %arg0 : i32 to f32
    %1 = llvm.fptosi %0 : f32 to i32
    %2 = llvm.uitofp %1 : i32 to f32
    %3 = llvm.fptoui %2 : f32 to i32
    llvm.return %3 : i32
  }
  llvm.func @addrspace(%arg0: !llvm.ptr) -> !llvm.ptr<2> {
    %0 = llvm.addrspacecast %arg0 : !llvm.ptr to !llvm.ptr<2>
    llvm.return %0 : !llvm.ptr<2>
  }
  llvm.func @stringconstant() -> !llvm.array<12 x i8> {
    %0 = llvm.mlir.constant("Hello world!") : !llvm.array<12 x i8>
    llvm.return %0 : !llvm.array<12 x i8>
  }
  llvm.func @complexfpconstant() -> !llvm.struct<(f32, f32)> {
    %0 = llvm.mlir.constant([-1.000000e+00 : f32, 0.000000e+00 : f32]) : !llvm.struct<(f32, f32)>
    llvm.return %0 : !llvm.struct<(f32, f32)>
  }
  llvm.func @complexintconstant() -> !llvm.struct<(i32, i32)> {
    %0 = llvm.mlir.constant([-1 : i32, 0 : i32]) : !llvm.struct<(i32, i32)>
    llvm.return %0 : !llvm.struct<(i32, i32)>
  }
  llvm.func @complexintconstantsplat() -> !llvm.array<2 x struct<(i32, i32)>> {
    %0 = llvm.mlir.constant(dense<(0,1)> : tensor<2xcomplex<i32>>) : !llvm.array<2 x struct<(i32, i32)>>
    llvm.return %0 : !llvm.array<2 x struct<(i32, i32)>>
  }
  llvm.func @complexintconstantsingle() -> !llvm.array<1 x struct<(i32, i32)>> {
    %0 = llvm.mlir.constant(dense<(0,1)> : tensor<complex<i32>>) : !llvm.array<1 x struct<(i32, i32)>>
    llvm.return %0 : !llvm.array<1 x struct<(i32, i32)>>
  }
  llvm.func @complexintconstantarray() -> !llvm.array<2 x array<2 x struct<(i32, i32)>>> {
    %0 = llvm.mlir.constant(dense<[[(0,1), (2,3)], [(4,5), (6,7)]]> : tensor<2x2xcomplex<i32>>) : !llvm.array<2 x array<2 x struct<(i32, i32)>>>
    llvm.return %0 : !llvm.array<2 x array<2 x struct<(i32, i32)>>>
  }
  llvm.func @structconstant() -> !llvm.struct<(i32, f32)> {
    %0 = llvm.mlir.constant([1 : i32, 2.000000e+00 : f32]) : !llvm.struct<(i32, f32)>
    llvm.return %0 : !llvm.struct<(i32, f32)>
  }
  llvm.func @indexconstantsplat() -> vector<3xi32> {
    %0 = llvm.mlir.constant(dense<42> : vector<3xindex>) : vector<3xi32>
    llvm.return %0 : vector<3xi32>
  }
  llvm.func @indexconstantarray() -> vector<3xi32> {
    %0 = llvm.mlir.constant(dense<[0, 1, 2]> : vector<3xindex>) : vector<3xi32>
    llvm.return %0 : vector<3xi32>
  }
  llvm.func @noreach() {
    llvm.unreachable
  }
  llvm.func @fcmp(%arg0: f32, %arg1: f32) {
    %0 = llvm.fcmp "oeq" %arg0, %arg1 : f32
    %1 = llvm.fcmp "ogt" %arg0, %arg1 : f32
    %2 = llvm.fcmp "oge" %arg0, %arg1 : f32
    %3 = llvm.fcmp "olt" %arg0, %arg1 : f32
    %4 = llvm.fcmp "ole" %arg0, %arg1 : f32
    %5 = llvm.fcmp "one" %arg0, %arg1 : f32
    %6 = llvm.fcmp "ord" %arg0, %arg1 : f32
    %7 = llvm.fcmp "ueq" %arg0, %arg1 : f32
    %8 = llvm.fcmp "ugt" %arg0, %arg1 : f32
    %9 = llvm.fcmp "uge" %arg0, %arg1 : f32
    %10 = llvm.fcmp "ult" %arg0, %arg1 : f32
    %11 = llvm.fcmp "ule" %arg0, %arg1 : f32
    %12 = llvm.fcmp "une" %arg0, %arg1 : f32
    %13 = llvm.fcmp "uno" %arg0, %arg1 : f32
    llvm.return
  }
  llvm.func @vect(%arg0: vector<4xf32>, %arg1: i32, %arg2: f32) {
    %0 = llvm.extractelement %arg0[%arg1 : i32] : vector<4xf32>
    %1 = llvm.insertelement %arg2, %arg0[%arg1 : i32] : vector<4xf32>
    %2 = llvm.shufflevector %arg0, %arg0 [0, 0, 0, 0, 7] : vector<4xf32> 
    llvm.return
  }
  llvm.func @vect_i64idx(%arg0: vector<4xf32>, %arg1: i64, %arg2: f32) {
    %0 = llvm.extractelement %arg0[%arg1 : i64] : vector<4xf32>
    %1 = llvm.insertelement %arg2, %arg0[%arg1 : i64] : vector<4xf32>
    llvm.return
  }
  llvm.func @scalable_vect(%arg0: vector<[4]xf32>, %arg1: i32, %arg2: f32) {
    %0 = llvm.extractelement %arg0[%arg1 : i32] : vector<[4]xf32>
    %1 = llvm.insertelement %arg2, %arg0[%arg1 : i32] : vector<[4]xf32>
    %2 = llvm.shufflevector %arg0, %arg0 [0, 0, 0, 0] : vector<[4]xf32> 
    llvm.return
  }
  llvm.func @scalable_vect_i64idx(%arg0: vector<[4]xf32>, %arg1: i64, %arg2: f32) {
    %0 = llvm.extractelement %arg0[%arg1 : i64] : vector<[4]xf32>
    %1 = llvm.insertelement %arg2, %arg0[%arg1 : i64] : vector<[4]xf32>
    llvm.return
  }
  llvm.func @alloca(%arg0: i64) {
    %0 = llvm.alloca %arg0 x i32 : (i64) -> !llvm.ptr
    %1 = llvm.alloca %arg0 x i32 {alignment = 8 : i64} : (i64) -> !llvm.ptr
    %2 = llvm.alloca %arg0 x i32 : (i64) -> !llvm.ptr<3>
    %3 = llvm.alloca inalloca %arg0 x i32 : (i64) -> !llvm.ptr
    llvm.return
  }
  llvm.func @constants() -> vector<4xf32> {
    %0 = llvm.mlir.constant(sparse<0, 4.200000e+01> : vector<4xf32>) : vector<4xf32>
    llvm.return %0 : vector<4xf32>
  }
  llvm.func @fp_casts(%arg0: f32, %arg1: f64) -> i16 {
    %0 = llvm.fptrunc %arg1 : f64 to f32
    %1 = llvm.fpext %arg0 : f32 to f64
    %2 = llvm.fptosi %1 : f64 to i16
    llvm.return %2 : i16
  }
  llvm.func @integer_extension_and_truncation(%arg0: i32) {
    %0 = llvm.sext %arg0 : i32 to i64
    %1 = llvm.zext %arg0 : i32 to i64
    %2 = llvm.trunc %arg0 : i32 to i16
    llvm.return
  }
  llvm.func @null() -> !llvm.ptr {
    %0 = llvm.mlir.zero : !llvm.ptr
    llvm.return %0 : !llvm.ptr
  }
  llvm.func @elements_constant_3d_vector() -> !llvm.array<2 x array<2 x vector<2xi32>>> {
    %0 = llvm.mlir.constant(dense<[[[1, 2], [3, 4]], [[42, 43], [44, 45]]]> : vector<2x2x2xi32>) : !llvm.array<2 x array<2 x vector<2xi32>>>
    llvm.return %0 : !llvm.array<2 x array<2 x vector<2xi32>>>
  }
  llvm.func @elements_constant_3d_array() -> !llvm.array<2 x array<2 x array<2 x i32>>> {
    %0 = llvm.mlir.constant(dense<[[[1, 2], [3, 4]], [[42, 43], [44, 45]]]> : tensor<2x2x2xi32>) : !llvm.array<2 x array<2 x array<2 x i32>>>
    llvm.return %0 : !llvm.array<2 x array<2 x array<2 x i32>>>
  }
  llvm.func @atomicrmw(%arg0: !llvm.ptr, %arg1: f32, %arg2: !llvm.ptr, %arg3: i32, %arg4: !llvm.ptr, %arg5: vector<2xf16>) {
    %0 = llvm.atomicrmw fadd %arg0, %arg1 monotonic : !llvm.ptr, f32
    %1 = llvm.atomicrmw fsub %arg0, %arg1 monotonic : !llvm.ptr, f32
    %2 = llvm.atomicrmw fmax %arg0, %arg1 monotonic : !llvm.ptr, f32
    %3 = llvm.atomicrmw fmin %arg0, %arg1 monotonic : !llvm.ptr, f32
    %4 = llvm.atomicrmw xchg %arg0, %arg1 monotonic : !llvm.ptr, f32
    %5 = llvm.atomicrmw add %arg2, %arg3 acquire : !llvm.ptr, i32
    %6 = llvm.atomicrmw sub %arg2, %arg3 release : !llvm.ptr, i32
    %7 = llvm.atomicrmw _and %arg2, %arg3 acq_rel : !llvm.ptr, i32
    %8 = llvm.atomicrmw nand %arg2, %arg3 seq_cst : !llvm.ptr, i32
    %9 = llvm.atomicrmw _or %arg2, %arg3 monotonic : !llvm.ptr, i32
    %10 = llvm.atomicrmw _xor %arg2, %arg3 monotonic : !llvm.ptr, i32
    %11 = llvm.atomicrmw max %arg2, %arg3 monotonic : !llvm.ptr, i32
    %12 = llvm.atomicrmw min %arg2, %arg3 monotonic : !llvm.ptr, i32
    %13 = llvm.atomicrmw umax %arg2, %arg3 monotonic : !llvm.ptr, i32
    %14 = llvm.atomicrmw umin %arg2, %arg3 monotonic : !llvm.ptr, i32
    %15 = llvm.atomicrmw uinc_wrap %arg2, %arg3 monotonic : !llvm.ptr, i32
    %16 = llvm.atomicrmw udec_wrap %arg2, %arg3 monotonic : !llvm.ptr, i32
    %17 = llvm.atomicrmw usub_cond %arg2, %arg3 monotonic : !llvm.ptr, i32
    %18 = llvm.atomicrmw usub_sat %arg2, %arg3 monotonic : !llvm.ptr, i32
    %19 = llvm.atomicrmw fadd %arg4, %arg5 monotonic : !llvm.ptr, vector<2xf16>
    %20 = llvm.atomicrmw fsub %arg4, %arg5 monotonic : !llvm.ptr, vector<2xf16>
    %21 = llvm.atomicrmw fmax %arg4, %arg5 monotonic : !llvm.ptr, vector<2xf16>
    %22 = llvm.atomicrmw fmin %arg4, %arg5 monotonic : !llvm.ptr, vector<2xf16>
    %23 = llvm.atomicrmw fmaximum %arg0, %arg1 monotonic : !llvm.ptr, f32
    %24 = llvm.atomicrmw fminimum %arg0, %arg1 monotonic : !llvm.ptr, f32
    %25 = llvm.atomicrmw fmaximum %arg4, %arg5 monotonic : !llvm.ptr, vector<2xf16>
    %26 = llvm.atomicrmw fminimum %arg4, %arg5 monotonic : !llvm.ptr, vector<2xf16>
    %27 = llvm.atomicrmw volatile udec_wrap %arg2, %arg3 syncscope("singlethread") monotonic {alignment = 8 : i64} : !llvm.ptr, i32
    llvm.return
  }
  llvm.func @cmpxchg(%arg0: !llvm.ptr, %arg1: i32, %arg2: i32) {
    %0 = llvm.cmpxchg %arg0, %arg1, %arg2 acq_rel monotonic : !llvm.ptr, i32
    %1 = llvm.extractvalue %0[0] : !llvm.struct<(i32, i1)> 
    %2 = llvm.extractvalue %0[1] : !llvm.struct<(i32, i1)> 
    %3 = llvm.cmpxchg weak volatile %arg0, %arg1, %arg2 syncscope("singlethread") acq_rel monotonic {alignment = 8 : i64} : !llvm.ptr, i32
    llvm.return
  }
  llvm.mlir.global external constant @_ZTIi() {addr_space = 0 : i32} : !llvm.ptr
  llvm.func @foo(!llvm.ptr)
  llvm.func @vararg_foo(!llvm.ptr, ...)
  llvm.func @bar(!llvm.ptr) -> !llvm.ptr
  llvm.func @__gxx_personality_v0(...) -> i32
  llvm.func @invokeLandingpad() -> i32 attributes {personality = @__gxx_personality_v0} {
    %0 = llvm.mlir.constant(0 : i32) : i32
    %1 = llvm.mlir.constant(dense<0> : vector<1xi8>) : !llvm.array<1 x i8>
    %2 = llvm.mlir.addressof @_ZTIi : !llvm.ptr
    %3 = llvm.mlir.zero : !llvm.ptr
    %4 = llvm.mlir.constant(1 : i32) : i32
    %5 = llvm.alloca %4 x i8 : (i32) -> !llvm.ptr
    llvm.invoke @foo(%5) to ^bb2 unwind ^bb1 : (!llvm.ptr) -> ()
  ^bb1:  // 4 preds: ^bb0, ^bb3, ^bb4, ^bb5
    %6 = llvm.landingpad (catch %3 : !llvm.ptr) (catch %2 : !llvm.ptr) (filter %1 : !llvm.array<1 x i8>) : !llvm.struct<(ptr, i32)>
    llvm.br ^bb3
  ^bb2:  // 4 preds: ^bb0, ^bb3, ^bb4, ^bb5
    llvm.return %4 : i32
  ^bb3:  // pred: ^bb1
    %7 = llvm.invoke @bar(%5) to ^bb2 unwind ^bb1 : (!llvm.ptr) -> !llvm.ptr
  ^bb4:  // no predecessors
    llvm.invoke @vararg_foo(%5, %0) to ^bb2 unwind ^bb1 vararg(!llvm.func<void (ptr, ...)>) : (!llvm.ptr, i32) -> ()
  ^bb5:  // no predecessors
    %8 = llvm.mlir.undef : !llvm.ptr
    llvm.invoke %8(%5, %0) to ^bb2 unwind ^bb1 vararg(!llvm.func<void (ptr, ...)>) : !llvm.ptr, (!llvm.ptr, i32) -> ()
  }
}

// -----
module {
  llvm.func @foo() -> i8
  llvm.func @__gxx_personality_v0(...) -> i32
  llvm.func @invoke_result(%arg0: !llvm.ptr) attributes {personality = @__gxx_personality_v0} {
    %0 = llvm.invoke @foo() to ^bb1 unwind ^bb2 : () -> i8
  ^bb1:  // pred: ^bb0
    llvm.store %0, %arg0 : i8, !llvm.ptr
    llvm.return
  ^bb2:  // pred: ^bb0
    %1 = llvm.landingpad cleanup : !llvm.struct<(ptr, i32)>
    llvm.return
  }
}

// -----
module {
  llvm.func @foo()
  llvm.func @__gxx_personality_v0(...) -> i32
  llvm.func @invoke_phis() -> i32 attributes {personality = @__gxx_personality_v0} {
    %0 = llvm.mlir.constant(0 : i32) : i32
    llvm.invoke @foo() to ^bb1(%0 : i32) unwind ^bb2 : () -> ()
  ^bb1(%1: i32):  // 2 preds: ^bb0, ^bb2
    llvm.return %1 : i32
  ^bb2:  // pred: ^bb0
    %2 = llvm.landingpad cleanup : !llvm.struct<(ptr, i32)>
    %3 = llvm.mlir.constant(1 : i32) : i32
    llvm.br ^bb1(%3 : i32)
  }
}

// -----
module {
  llvm.func @hasGCFunction() attributes {garbageCollector = "statepoint-example"} {
    llvm.return
  }
}

// -----
module {
  llvm.func @gc_decl() attributes {garbageCollector = "statepoint-example"}
}

// -----
module {
  llvm.func @section_func() attributes {section = ".section.name"} {
    llvm.return
  }
}

// -----
module {
  llvm.func local_unnamed_addr @local_unnamed_addr_func() {
    llvm.return
  }
}

// -----
module {
  llvm.func unnamed_addr @unnamed_addr_func()
}

// -----
module {
  llvm.func @align_func() attributes {alignment = 2 : i64} {
    llvm.return
  }
}

// -----
module {
  llvm.func @align_decl() attributes {alignment = 64 : i64}
}

// -----
module {
  llvm.func @callFreezeOp(%arg0: i32) {
    %0 = llvm.freeze %arg0 : i32
    %1 = llvm.mlir.undef : i32
    %2 = llvm.freeze %1 : i32
    %3 = llvm.mlir.poison : i32
    %4 = llvm.freeze %3 : i32
    llvm.return
  }
  llvm.func @freezeUsed(%arg0: i32) -> i64 {
    %0 = llvm.freeze %arg0 : i32
    %1 = llvm.sext %0 : i32 to i64
    llvm.return %1 : i64
  }
  llvm.func @boolConstArg() -> i1 {
    %0 = llvm.mlir.constant(true) : i1
    %1 = llvm.mlir.constant(false) : i1
    %2 = llvm.and %0, %1 : i1
    llvm.return %2 : i1
  }
  llvm.func @callFenceInst() {
    llvm.fence syncscope("agent") release
    llvm.fence release
    llvm.fence syncscope("") release
    llvm.return
  }
  llvm.func @passthrough() attributes {passthrough = [["alignstack", "4"], "null_pointer_is_valid", ["foo", "bar"]]} {
    llvm.return
  }
}

// -----
module {
  llvm.func @my_allocator(i64) attributes {passthrough = [["allocsize", "4294967295"]]}
}

// -----
module {
  llvm.func @functionEntryCount() attributes {function_entry_count = #llvm.function_entry_count<entry_count = 4242>} {
    llvm.return
  }
}

// -----
module {
  llvm.func @syntheticFunctionEntryCount() attributes {function_entry_count = #llvm.function_entry_count<entry_count = 7, count_type = synthetic>} {
    llvm.return
  }
}

// -----
module {
  llvm.func @syntheticFunctionEntryCountWithImports() attributes {function_entry_count = #llvm.function_entry_count<entry_count = 7, count_type = synthetic, imports = 1234, 4, 1234>} {
    llvm.return
  }
}

// -----
module {
  llvm.func @functionEntryCountWithImports() attributes {function_entry_count = #llvm.function_entry_count<entry_count = 7, imports = 1234, 4, 18446744073709551615, 1234>} {
    llvm.return
  }
}

// -----
module {
  llvm.func @functionEntryCountNegativeCount() attributes {function_entry_count = #llvm.function_entry_count<entry_count = 18446744073709551615>} {
    llvm.return
  }
}

// -----
module {
  llvm.func @constant_bf16() -> bf16 {
    %0 = llvm.mlir.constant(1.000000e+01 : bf16) : bf16
    llvm.return %0 : bf16
  }
}

// -----
module {
  llvm.func @address_taken() {
    llvm.return
  }
  llvm.mlir.global internal constant @taker_of_address() {addr_space = 0 : i32} : !llvm.ptr {
    %0 = llvm.mlir.addressof @address_taken : !llvm.ptr
    llvm.return %0 : !llvm.ptr
  }
}

// -----
module {
  llvm.mlir.global linkonce @forward_use_of_address() {addr_space = 0 : i32} : !llvm.ptr {
    %0 = llvm.mlir.addressof @address_declared_after_use : !llvm.ptr
    llvm.return %0 : !llvm.ptr
  }
  llvm.mlir.global linkonce @address_declared_after_use() {addr_space = 0 : i32} : f32
}

// -----
module {
  llvm.mlir.global linkonce @take_self_address() {addr_space = 0 : i32} : !llvm.struct<(i32, ptr)> {
    %0 = llvm.mlir.constant(0 : i32) : i32
    %1 = llvm.mlir.undef : !llvm.struct<(i32, ptr)>
    %2 = llvm.mlir.addressof @take_self_address : !llvm.ptr
    %3 = llvm.getelementptr %2[%0, 0] : (!llvm.ptr, i32) -> !llvm.ptr, !llvm.struct<(i32, ptr)>
    %4 = llvm.insertvalue %0, %1[0] : !llvm.struct<(i32, ptr)> 
    %5 = llvm.insertvalue %3, %4[1] : !llvm.struct<(i32, ptr)> 
    llvm.return %5 : !llvm.struct<(i32, ptr)>
  }
}

// -----
module {
  llvm.mlir.global_ctors ctors = [@foo], priorities = [0 : i32], data = [#llvm.zero]
  llvm.func @foo() {
    llvm.return
  }
}

// -----
module {
  llvm.mlir.global_ctors ctors = [], priorities = [], data = []
  llvm.mlir.global_dtors dtors = [], priorities = [], data = []
}

// -----
module {
  llvm.mlir.global_dtors dtors = [@foo], priorities = [0 : i32], data = [#llvm.zero]
  llvm.func @foo() {
    llvm.return
  }
}

// -----
module {
  llvm.func @cond_br_weights(%arg0: i1, %arg1: i32, %arg2: i32) -> i32 {
    llvm.cond_br %arg0 weights([5, 10]), ^bb1, ^bb2
  ^bb1:  // pred: ^bb0
    llvm.return %arg1 : i32
  ^bb2:  // pred: ^bb0
    llvm.return %arg2 : i32
  }
}

// -----
module {
  llvm.func @foo()
  llvm.func @__gxx_personality_v0(...) -> i32
  llvm.func @invoke_branch_weights() -> i32 attributes {personality = @__gxx_personality_v0} {
    %0 = llvm.mlir.constant(1 : i32) : i32
    llvm.invoke @foo() to ^bb2 unwind ^bb1 {branch_weights = array<i32: 42, 99>} : () -> ()
  ^bb1:  // pred: ^bb0
    %1 = llvm.landingpad cleanup : !llvm.struct<(ptr, i32)>
    llvm.br ^bb2
  ^bb2:  // 2 preds: ^bb0, ^bb1
    llvm.return %0 : i32
  }
}

// -----
module {
  llvm.func @volatile_store_and_load() {
    %0 = llvm.mlir.constant(5 : i32) : i32
    %1 = llvm.mlir.constant(1 : i64) : i64
    %2 = llvm.alloca %1 x i32 : (i64) -> !llvm.ptr
    llvm.store volatile %0, %2 : i32, !llvm.ptr
    %3 = llvm.load volatile %2 : !llvm.ptr -> i32
    llvm.return
  }
}

// -----
module {
  llvm.func @nontemporal_store_and_load() {
    %0 = llvm.mlir.constant(5 : i32) : i32
    %1 = llvm.mlir.constant(1 : i64) : i64
    %2 = llvm.alloca %1 x i32 : (i64) -> !llvm.ptr
    llvm.store %0, %2 {nontemporal} : i32, !llvm.ptr
    %3 = llvm.load %2 {nontemporal} : !llvm.ptr -> i32
    llvm.return
  }
}

// -----
module {
  llvm.func @nontemporal_store_and_load(%arg0: !llvm.ptr) -> i32 {
    %0 = llvm.load %arg0 invariant : !llvm.ptr -> i32
    llvm.return %0 : i32
  }
}

// -----
module {
  llvm.func @nontemporal_store_and_load(%arg0: !llvm.ptr) -> i32 {
    %0 = llvm.mlir.constant(42 : i32) : i32
    llvm.store %0, %arg0 invariant_group : i32, !llvm.ptr
    %1 = llvm.load %arg0 invariant_group : !llvm.ptr -> i32
    llvm.return %1 : i32
  }
}

// -----
module {
  llvm.func @atomic_store_and_load(%arg0: !llvm.ptr) {
    %0 = llvm.load %arg0 atomic acquire {alignment = 4 : i64} : !llvm.ptr -> f32
    %1 = llvm.load %arg0 atomic syncscope("singlethread") acquire {alignment = 4 : i64} : !llvm.ptr -> f32
    llvm.store %0, %arg0 atomic release {alignment = 4 : i64} : f32, !llvm.ptr
    llvm.store %1, %arg0 atomic syncscope("singlethread") release {alignment = 4 : i64} : f32, !llvm.ptr
    llvm.return
  }
}

// -----
module {
  llvm.func @module_default_layout()
}

// -----
module attributes {llvm.data_layout = "E"} {
  llvm.func @module_big_endian()
}

// -----
module attributes {llvm.target_triple = "x86_64-pc-windows-msvc"} {
}

// -----
module attributes {llvm.target_triple = "aarch64-linux-android"} {
}

// -----
module {
}

// -----
module {
  llvm.func @useInlineAsm(%arg0: i32, %arg1: !llvm.ptr) {
    llvm.inline_asm "foo", "r" %arg0 : (i32) -> ()
    %0 = llvm.inline_asm "foo", "=r,r" %arg0 : (i32) -> i8
    %1 = llvm.inline_asm "foo", "=r,r,r" %arg0, %arg0 : (i32, i32) -> i8
    %2 = llvm.inline_asm has_side_effects "foo", "=r,r,r" %arg0, %arg0 : (i32, i32) -> i8
    %3 = llvm.inline_asm is_align_stack "foo", "=r,r,r" %arg0, %arg0 : (i32, i32) -> i8
    %4 = llvm.inline_asm asm_dialect = intel "foo", "=r,r,r" %arg0, %arg0 : (i32, i32) -> i8
    %5 = llvm.inline_asm "foo", "=r,=r,r" %arg0 : (i32) -> !llvm.struct<(i8, i8)>
    %6 = llvm.inline_asm has_side_effects tail_call_kind = <tail> operand_attrs = [{elementtype = !llvm.ptr}] "", "*m,~{memory}" %arg1 : (!llvm.ptr) -> !llvm.void
    %7 = llvm.inline_asm "foo", "=r,=r,r" %arg0 : (i32) -> !llvm.struct<(i8, i8)>
    %8 = llvm.inline_asm tail_call_kind = <notail> "foo", "=r,=r,r" %arg0 : (i32) -> !llvm.struct<(i8, i8)>
    llvm.return
  }
}

// -----
module {
  llvm.func @useInlineAsm2(%arg0: !llvm.ptr, %arg1: i64, %arg2: !llvm.ptr, %arg3: i64) {
    %0 = llvm.inline_asm has_side_effects operand_attrs = [{elementtype = !llvm.array<16 x i64>}, {}, {elementtype = !llvm.array<16 x i64>}, {}, {}, {}, {elementtype = !llvm.array<16 x i64>}] "ldr x4, [$2], #8   \0A\09ldr x5, [$1]       \0A\09mul x6, x4, $4     \0A\09", "=r,=r,=r,=*m,r,*m,0,1,2,*m,~{x4},~{x5},~{x6},~{x7},~{cc}" %arg0, %arg1, %arg2, %arg3, %arg0, %arg2, %arg0 : (!llvm.ptr, i64, !llvm.ptr, i64, !llvm.ptr, !llvm.ptr, !llvm.ptr) -> !llvm.struct<(i64, ptr, ptr)>
    llvm.return
  }
}

// -----
module {
  llvm.func @fastmathFlagsFunc(f32) -> f32
  llvm.func @fastmathFlags(%arg0: f32, %arg1: vector<2xf32>) {
    %0 = llvm.fadd %arg0, %arg0 {fastmathFlags = #llvm.fastmath<nnan, ninf>} : f32
    %1 = llvm.fsub %arg0, %arg0 {fastmathFlags = #llvm.fastmath<nnan, ninf>} : f32
    %2 = llvm.fmul %arg0, %arg0 {fastmathFlags = #llvm.fastmath<nnan, ninf>} : f32
    %3 = llvm.fdiv %arg0, %arg0 {fastmathFlags = #llvm.fastmath<nnan, ninf>} : f32
    %4 = llvm.frem %arg0, %arg0 {fastmathFlags = #llvm.fastmath<nnan, ninf>} : f32
    %5 = llvm.fcmp "oeq" %arg0, %arg0 {fastmathFlags = #llvm.fastmath<nnan, ninf>} : f32
    %6 = llvm.fneg %arg0 {fastmathFlags = #llvm.fastmath<nnan, ninf>} : f32
    %7 = llvm.call @fastmathFlagsFunc(%arg0) : (f32) -> f32
    %8 = llvm.call @fastmathFlagsFunc(%arg0) {fastmathFlags = #llvm.fastmath<nnan>} : (f32) -> f32
    %9 = llvm.call @fastmathFlagsFunc(%arg0) {fastmathFlags = #llvm.fastmath<ninf>} : (f32) -> f32
    %10 = llvm.call @fastmathFlagsFunc(%arg0) {fastmathFlags = #llvm.fastmath<nsz>} : (f32) -> f32
    %11 = llvm.call @fastmathFlagsFunc(%arg0) {fastmathFlags = #llvm.fastmath<arcp>} : (f32) -> f32
    %12 = llvm.call @fastmathFlagsFunc(%arg0) {fastmathFlags = #llvm.fastmath<contract>} : (f32) -> f32
    %13 = llvm.call @fastmathFlagsFunc(%arg0) {fastmathFlags = #llvm.fastmath<afn>} : (f32) -> f32
    %14 = llvm.call @fastmathFlagsFunc(%arg0) {fastmathFlags = #llvm.fastmath<reassoc>} : (f32) -> f32
    %15 = llvm.call @fastmathFlagsFunc(%arg0) {fastmathFlags = #llvm.fastmath<fast>} : (f32) -> f32
    %16 = llvm.intr.copysign(%arg0, %arg0) {fastmathFlags = #llvm.fastmath<fast>} : (f32, f32) -> f32
    %17 = llvm.intr.copysign(%arg0, %arg0) {fastmathFlags = #llvm.fastmath<afn>} : (f32, f32) -> f32
    %18 = llvm.mlir.constant(1 : i32) : i32
    %19 = llvm.intr.powi(%arg0, %18) {fastmathFlags = #llvm.fastmath<fast>} : (f32, i32) -> f32
    %20 = llvm.intr.powi(%arg0, %18) {fastmathFlags = #llvm.fastmath<afn>} : (f32, i32) -> f32
    %21 = llvm.intr.vector.reduce.fmax(%arg1) {fastmathFlags = #llvm.fastmath<nnan>} : (vector<2xf32>) -> f32
    %22 = llvm.intr.vector.reduce.fmin(%arg1) {fastmathFlags = #llvm.fastmath<nnan>} : (vector<2xf32>) -> f32
    %23 = llvm.intr.vector.reduce.fmaximum(%arg1) {fastmathFlags = #llvm.fastmath<nnan>} : (vector<2xf32>) -> f32
    %24 = llvm.intr.vector.reduce.fminimum(%arg1) {fastmathFlags = #llvm.fastmath<nnan>} : (vector<2xf32>) -> f32
    %25 = llvm.mlir.constant(true) : i1
    %26 = llvm.select %25, %arg0, %20 {fastmathFlags = #llvm.fastmath<contract>} : i1, f32
    %27 = llvm.fpext %arg0 fastmath<nnan> : f32 to f64
    %28 = llvm.fptrunc %arg0 fastmath<fast> : f32 to f16
    llvm.return
  }
}

// -----
module {
  llvm.func @switch_empty(%arg0: i32) -> i32 {
    llvm.switch %arg0 : i32, ^bb1 [
    ]
  ^bb1:  // pred: ^bb0
    llvm.return %arg0 : i32
  }
}

// -----
module {
  llvm.func @switch_args(%arg0: i32) -> i32 {
    %0 = llvm.mlir.constant(5 : i32) : i32
    %1 = llvm.mlir.constant(7 : i32) : i32
    %2 = llvm.mlir.constant(11 : i32) : i32
    llvm.switch %arg0 : i32, ^bb1 [
      -1: ^bb2(%0 : i32),
      1: ^bb3(%1, %2 : i32, i32)
    ]
  ^bb1:  // pred: ^bb0
    llvm.return %arg0 : i32
  ^bb2(%3: i32):  // pred: ^bb0
    llvm.return %1 : i32
  ^bb3(%4: i32, %5: i32):  // pred: ^bb0
    llvm.return %4 : i32
  }
  llvm.func @switch_weights(%arg0: i32) -> i32 {
    %0 = llvm.mlir.constant(19 : i32) : i32
    %1 = llvm.mlir.constant(23 : i32) : i32
    %2 = llvm.mlir.constant(29 : i32) : i32
    llvm.switch %arg0 : i32, ^bb1(%0 : i32) [
      9: ^bb2(%1, %2 : i32, i32),
      99: ^bb3
    ] {branch_weights = array<i32: 13, 17, 19>}
  ^bb1(%3: i32):  // pred: ^bb0
    llvm.return %3 : i32
  ^bb2(%4: i32, %5: i32):  // pred: ^bb0
    llvm.return %5 : i32
  ^bb3:  // pred: ^bb0
    llvm.return %arg0 : i32
  }
}

// -----
module {
  llvm.func @duplicate_block_in_switch(%arg0: i32, %arg1: f32, %arg2: f32) {
    llvm.switch %arg0 : i32, ^bb1(%arg1 : f32) [
      105: ^bb2,
      108: ^bb3(%arg2 : f32),
      106: ^bb2
    ]
  ^bb1(%0: f32):  // pred: ^bb0
    llvm.call @bar(%0) : (f32) -> ()
    llvm.return
  ^bb2:  // 2 preds: ^bb0, ^bb0
    llvm.call @baz() : () -> ()
    llvm.return
  ^bb3(%1: f32):  // pred: ^bb0
    llvm.call @qux(%1) : (f32) -> ()
    llvm.return
  }
  llvm.func @duplicate_block_with_args_in_switch(%arg0: i32, %arg1: f32, %arg2: f32) {
    llvm.switch %arg0 : i32, ^bb1(%arg1 : f32) [
      106: ^bb3(%arg1 : f32),
      105: ^bb2,
      108: ^bb3(%arg2 : f32)
    ]
  ^bb1(%0: f32):  // pred: ^bb0
    llvm.call @bar(%0) : (f32) -> ()
    llvm.return
  ^bb2:  // pred: ^bb0
    llvm.call @baz() : () -> ()
    llvm.return
  ^bb3(%1: f32):  // 2 preds: ^bb0, ^bb0
    llvm.call @qux(%1) : (f32) -> ()
    llvm.return
  }
  llvm.func @bar(f32)
  llvm.func @baz()
  llvm.func @qux(f32)
}

// -----
module {
  llvm.func @vararg_function(%arg0: i32, ...) -> i32 {
    %0 = llvm.mlir.constant(1 : i32) : i32
    %1 = llvm.mlir.constant(1 : i32) : i32
    %2 = llvm.alloca %1 x !llvm.struct<"struct.va_list", (ptr)> {alignment = 8 : i64} : (i32) -> !llvm.ptr
    llvm.intr.vastart %2 : !llvm.ptr
    %3 = llvm.alloca %0 x !llvm.ptr {alignment = 8 : i64} : (i32) -> !llvm.ptr
    llvm.intr.vacopy %2 to %3 : !llvm.ptr, !llvm.ptr
    %4 = llvm.va_arg %3 : (!llvm.ptr) -> i32
    llvm.intr.vaend %3 : !llvm.ptr
    llvm.intr.vaend %2 : !llvm.ptr
    llvm.return %4 : i32
  }
}

// -----
module {
  llvm.func @range_arg_function(i64 {llvm.range = #llvm.constant_range<i64, 0, 4097>})
}

// -----
module {
  llvm.func @range_res_function() -> (i64 {llvm.range = #llvm.constant_range<i64, 0, 4097>})
}

// -----
module {
  llvm.func @readonly_function(!llvm.ptr {llvm.readonly})
}

// -----
module {
  llvm.func @arg_mem_none_func() attributes {memory_effects = #llvm.memory_effects<other = readwrite, argMem = none, inaccessibleMem = readwrite, errnoMem = none, targetMem0 = none, targetMem1 = none>}
}

// -----
module {
  llvm.func @readwrite_func() attributes {memory_effects = #llvm.memory_effects<other = readwrite, argMem = readwrite, inaccessibleMem = readwrite, errnoMem = none, targetMem0 = none, targetMem1 = none>}
}

// -----
module {
  llvm.func @tf(!llvm.ptr) attributes {target_features = #llvm.target_features<["+fix-cortex-a53-835769", "+fp-armv8", "+neon", "+outline-atomics", "+v8a"]>}
}

// -----
module {
  llvm.func @streaming_func() attributes {arm_streaming} {
    llvm.return
  }
}

// -----
module {
  llvm.func @locally_streaming_func() attributes {arm_locally_streaming} {
    llvm.return
  }
}

// -----
module {
  llvm.func @streaming_compatible_func() attributes {arm_streaming_compatible} {
    llvm.return
  }
}

// -----
module {
  llvm.func @new_za_func() attributes {arm_new_za} {
    llvm.return
  }
}

// -----
module {
  llvm.func @in_za_func() attributes {arm_in_za} {
    llvm.return
  }
}

// -----
module {
  llvm.func @out_za_func() attributes {arm_out_za} {
    llvm.return
  }
}

// -----
module {
  llvm.func @inout_za_func() attributes {arm_inout_za} {
    llvm.return
  }
}

// -----
module {
  llvm.func @preserves_za_func() attributes {arm_preserves_za} {
    llvm.return
  }
}

// -----
module {
  llvm.func @t(!llvm.ptr) attributes {frame_pointer = #llvm.framePointerKind<"non-leaf">}
}

// -----
module {
  llvm.mlir.global linkonce @partially_zeroinit_aggregate() {addr_space = 0 : i32} : !llvm.struct<(i32, i64, array<3 x i8>)> {
    %0 = llvm.mlir.zero : !llvm.struct<(i32, i64, array<3 x i8>)>
    %1 = llvm.mlir.constant(1 : i64) : i64
    %2 = llvm.insertvalue %1, %0[1] : !llvm.struct<(i32, i64, array<3 x i8>)> 
    llvm.return %2 : !llvm.struct<(i32, i64, array<3 x i8>)>
  }
  llvm.func @zeroinit_complex_local_aggregate() {
    %0 = llvm.mlir.constant(1 : i64) : i64
    %1 = llvm.alloca %0 x !llvm.array<1000 x struct<(i32, array<3 x struct<(f64, vector<4x!llvm.ptr>, array<2 x ptr>)>>, array<6 x ptr>)>> : (i64) -> !llvm.ptr
    %2 = llvm.mlir.zero : !llvm.array<1000 x struct<(i32, array<3 x struct<(f64, vector<4x!llvm.ptr>, array<2 x ptr>)>>, array<6 x ptr>)>>
    llvm.store %2, %1 : !llvm.array<1000 x struct<(i32, array<3 x struct<(f64, vector<4x!llvm.ptr>, array<2 x ptr>)>>, array<6 x ptr>)>>, !llvm.ptr
    llvm.return
  }
  llvm.linker_options ["/DEFAULTLIB:", "libcmt"]
  llvm.linker_options ["/DEFAULTLIB:", "libcmtd"]
}

// -----
module {
  llvm.mlir.global common @big_(dense<0> : vector<4294967296xi8>) {addr_space = 0 : i32} : !llvm.array<4294967296 x i8>
}

// -----
module {
  llvm.func @no_inline() attributes {no_inline} {
    llvm.return
  }
}

// -----
module {
  llvm.func @always_inline() attributes {always_inline} {
    llvm.return
  }
}

// -----
module {
  llvm.func @inline_hint() attributes {inline_hint} {
    llvm.return
  }
}

// -----
module {
  llvm.func @optimize_none() attributes {no_inline, optimize_none} {
    llvm.return
  }
}

// -----
module {
  llvm.func @convergent() attributes {convergent} {
    llvm.return
  }
}

// -----
module {
  llvm.func @function_entry_instrument_test() attributes {instrument_function_entry = "__cyg_profile_func_enter"} {
    llvm.return
  }
}

// -----
module {
  llvm.func @function_exit_instrument_test() attributes {instrument_function_exit = "__cyg_profile_func_exit"} {
    llvm.return
  }
}

// -----
module {
  llvm.func @nounwind() attributes {no_unwind} {
    llvm.return
  }
}

// -----
module {
  llvm.func @willreturn() attributes {will_return} {
    llvm.return
  }
}

// -----
module {
  llvm.func @noreturn() attributes {noreturn} {
    llvm.return
  }
}

// -----
module {
  llvm.func @returnstwice() attributes {returns_twice} {
    llvm.return
  }
}

// -----
module {
  llvm.func @hot() attributes {hot} {
    llvm.return
  }
}

// -----
module {
  llvm.func @cold() attributes {cold} {
    llvm.return
  }
}

// -----
module {
  llvm.func @noduplicate() attributes {noduplicate} {
    llvm.return
  }
}

// -----
module {
  llvm.func @no_caller_saved_registers() attributes {no_caller_saved_registers} {
    llvm.return
  }
}

// -----
module {
  llvm.func @nocallback() attributes {nocallback} {
    llvm.return
  }
}

// -----
module {
  llvm.func @modular_format(%arg0: i32) attributes {modular_format = "ident,1,1,foo,bar"} {
    llvm.return
  }
}

// -----
module {
  llvm.func @no_builtins_all() attributes {nobuiltins = []} {
    llvm.return
  }
}

// -----
module {
  llvm.func @no_builtins_2() attributes {nobuiltins = ["asdf", "defg"]} {
    llvm.return
  }
}

// -----
module {
  llvm.func @f()
  llvm.func @no_builtins_call_all() {
    llvm.call @f() {nobuiltins = []} : () -> ()
    llvm.return
  }
}

// -----
module {
  llvm.func @f()
  llvm.func @no_builtins_call_2() {
    llvm.call @f() {nobuiltins = ["asdf", "defg"]} : () -> ()
    llvm.return
  }
}

// -----
module {
  llvm.func @allocsize_1(%arg0: i32, %arg1: i32) attributes {allocsize = array<i32: 1>} {
    llvm.return
  }
}

// -----
module {
  llvm.func @allocsize_2(%arg0: i32, %arg1: i32) attributes {allocsize = array<i32: 0, 1>} {
    llvm.return
  }
}

// -----
module {
  llvm.func @f(i32, i32)
  llvm.func @allocsize_call_1() {
    %0 = llvm.mlir.constant(0 : i32) : i32
    llvm.call @f(%0, %0) {allocsize = array<i32: 1>} : (i32, i32) -> ()
    llvm.return
  }
}

// -----
module {
  llvm.func @f(i32, i32)
  llvm.func @allocsize_call_2() {
    %0 = llvm.mlir.constant(0 : i32) : i32
    llvm.call @f(%0, %0) {allocsize = array<i32: 1, 0>} : (i32, i32) -> ()
    llvm.return
  }
}

// -----
module {
  llvm.func @minsize() attributes {minsize} {
    llvm.return
  }
}

// -----
module {
  llvm.func @f()
  llvm.func @minsize_call() {
    llvm.call @f() {minsize} : () -> ()
    llvm.return
  }
}

// -----
module {
  llvm.func @f()
  llvm.func @optsize() attributes {optsize} {
    llvm.return
  }
}

// -----
module {
  llvm.func @f()
  llvm.func @optsize_call() {
    llvm.call @f() {optsize} : () -> ()
    llvm.return
  }
}

// -----
module {
  llvm.func @f()
  llvm.func @save_reg_params() attributes {save_reg_params} {
    llvm.return
  }
}

// -----
module {
  llvm.func @f()
  llvm.func @save_reg_params_call() {
    llvm.call @f() {save_reg_params} : () -> ()
    llvm.return
  }
}

// -----
module {
  llvm.func @f()
  llvm.func @zero_call_used_regs_1() attributes {zero_call_used_regs = "skip"} {
    llvm.return
  }
}

// -----
module {
  llvm.func @f()
  llvm.func @zero_call_used_regs_2() attributes {zero_call_used_regs = "all"} {
    llvm.return
  }
}

// -----
module {
  llvm.func @f()
  llvm.func @zero_call_used_regs_call_1() {
    llvm.call @f() {zero_call_used_regs = "used_gpr_all"} : () -> ()
    llvm.return
  }
}

// -----
module {
  llvm.func @f()
  llvm.func @zero_call_used_regs_call_2() {
    llvm.call @f() {zero_call_used_regs = "used"} : () -> ()
    llvm.return
  }
}

// -----
module {
  llvm.func @f()
  llvm.func @trap_func_name_call() {
    llvm.call @f() {trap_func_name = "whatever"} : () -> ()
    llvm.return
  }
}

// -----
module {
  llvm.func @f()
  llvm.func @default_func_attrs() attributes {default_func_attrs = {justKey, key = "value"}} {
    llvm.return
  }
}

// -----
module {
  llvm.func @f()
  llvm.func @default_func_attrs_call() {
    llvm.call @f() {default_func_attrs = {justKey, key = "value"}} : () -> ()
    llvm.return
  }
}

// -----
module {
  llvm.func @f()
  llvm.func @builtin_call() {
    llvm.call @f() {builtin} : () -> ()
    llvm.return
  }
}

// -----
module {
  llvm.func @f()
  llvm.func @nobuiltin_call() {
    llvm.call @f() {nobuiltin} : () -> ()
    llvm.return
  }
}

// -----
module {
  llvm.func @f()
  llvm.func @convergent_call() {
    llvm.call @f() {convergent} : () -> ()
    llvm.return
  }
}

// -----
module {
  llvm.func @f()
  llvm.func @nounwind_call() {
    llvm.call @f() {no_unwind} : () -> ()
    llvm.return
  }
}

// -----
module {
  llvm.func @f()
  llvm.func @willreturn_call() {
    llvm.call @f() {will_return} : () -> ()
    llvm.return
  }
}

// -----
module {
  llvm.func @f()
  llvm.func @noreturn_call() {
    llvm.call @f() {noreturn} : () -> ()
    llvm.return
  }
}

// -----
module {
  llvm.func @f()
  llvm.func @no_inline_call() {
    llvm.call @f() {no_inline} : () -> ()
    llvm.return
  }
}

// -----
module {
  llvm.func @f()
  llvm.func @always_inline_call() {
    llvm.call @f() {always_inline} : () -> ()
    llvm.return
  }
}

// -----
module {
  llvm.func @f()
  llvm.func @inline_hint_call() {
    llvm.call @f() {inline_hint} : () -> ()
    llvm.return
  }
}

// -----
module {
  llvm.func @fa()
  llvm.func @fb()
  llvm.func @fc()
  llvm.func @fd()
  llvm.func @mem_effects_call() {
    llvm.call @fa() {memory_effects = #llvm.memory_effects<other = none, argMem = none, inaccessibleMem = none, errnoMem = none, targetMem0 = none, targetMem1 = none>} : () -> ()
    llvm.call @fb() {memory_effects = #llvm.memory_effects<other = read, argMem = none, inaccessibleMem = write, errnoMem = none, targetMem0 = none, targetMem1 = none>} : () -> ()
    llvm.call @fc() {memory_effects = #llvm.memory_effects<other = read, argMem = read, inaccessibleMem = write, errnoMem = none, targetMem0 = none, targetMem1 = none>} : () -> ()
    llvm.call @fd() {memory_effects = #llvm.memory_effects<other = readwrite, argMem = read, inaccessibleMem = readwrite, errnoMem = none, targetMem0 = none, targetMem1 = none>} : () -> ()
    llvm.return
  }
}

// -----
module {
  llvm.func @vec_type_hint() attributes {vec_type_hint = #llvm.vec_type_hint<hint = i32>}
  llvm.func @vec_type_hint_signed() attributes {vec_type_hint = #llvm.vec_type_hint<hint = i32, is_signed = true>}
  llvm.func @vec_type_hint_signed_vec() attributes {vec_type_hint = #llvm.vec_type_hint<hint = vector<2xi32>, is_signed = true>}
  llvm.func @vec_type_hint_float_vec() attributes {vec_type_hint = #llvm.vec_type_hint<hint = vector<3xf32>>}
  llvm.func @vec_type_hint_bfloat_vec() attributes {vec_type_hint = #llvm.vec_type_hint<hint = vector<8xbf16>>}
}

// -----
module {
  llvm.func @work_group_size_hint() attributes {work_group_size_hint = array<i32: 128, 128, 128>}
}

// -----
module {
  llvm.func @reqd_work_group_size() attributes {reqd_work_group_size = array<i32: 128, 256, 128>}
}

// -----
module {
  llvm.func @intel_reqd_sub_group_size() attributes {intel_reqd_sub_group_size = 32 : i32}
}

// -----
module {
  llvm.func @foo()
  llvm.func @call_with_empty_opbundle() {
    llvm.call @foo() : () -> ()
    llvm.return
  }
  llvm.func @call_with_empty_opbundle_operands() {
    llvm.call @foo() ["tag"()] : () -> ()
    llvm.return
  }
  llvm.func @call_with_opbundle() {
    %0 = llvm.mlir.constant(1 : i32) : i32
    %1 = llvm.mlir.constant(2 : i32) : i32
    %2 = llvm.mlir.constant(3 : i32) : i32
    llvm.call @foo() ["tag1"(%0, %1 : i32, i32), "tag2"(%2 : i32)] : () -> ()
    llvm.return
  }
  llvm.func @__gxx_personality_v0(...) -> i32
  llvm.func @invoke_with_opbundle() attributes {personality = @__gxx_personality_v0} {
    %0 = llvm.mlir.constant(1 : i32) : i32
    %1 = llvm.mlir.constant(2 : i32) : i32
    %2 = llvm.mlir.constant(3 : i32) : i32
    llvm.invoke @foo() to ^bb2 unwind ^bb1 ["tag1"(%0, %1 : i32, i32), "tag2"(%2 : i32)] : () -> ()
  ^bb1:  // pred: ^bb0
    %3 = llvm.landingpad cleanup : !llvm.struct<(ptr, i32)>
    llvm.return
  ^bb2:  // pred: ^bb0
    llvm.return
  }
  llvm.func @call_intrin_with_opbundle(%arg0: !llvm.ptr) {
    %0 = llvm.mlir.constant(true) : i1
    %1 = llvm.mlir.constant(16 : i32) : i32
    llvm.call_intrinsic "llvm.assume"(%0) ["align"(%arg0, %1 : !llvm.ptr, i32)] : (i1) -> ()
    llvm.return
  }
}

// -----
module {
  llvm.module_flags [#llvm.mlir.module_flag<error, "wchar_size", 4 : i32>, #llvm.mlir.module_flag<min, "PIC Level", 2 : i32>, #llvm.mlir.module_flag<max, "PIE Level", 2 : i32>, #llvm.mlir.module_flag<max, "uwtable", 2 : i32>, #llvm.mlir.module_flag<max, "frame-pointer", 1 : i32>]
}

// -----
module {
  llvm.module_flags [#llvm.mlir.module_flag<warning, "Debug Info Version", 3 : i32>]
}

// -----
module {
  llvm.module_flags [#llvm.mlir.module_flag<append, "CG Profile", [#llvm.cgprofile_entry<from = @from, to = @to, count = 222>, #llvm.cgprofile_entry<from = @from, count = 222>, #llvm.cgprofile_entry<from = @to, to = @from, count = 222>]>]
  llvm.func @from(i32)
  llvm.func @to()
}

// -----
module {
  llvm.module_flags [#llvm.mlir.module_flag<error, "ProfileSummary", #llvm.profile_summary<format = InstrProf, total_count = 263646, max_count = 86427, max_internal_count = 86427, max_function_count = 4691, num_counts = 3712, num_functions = 796, is_partial_profile = 0, partial_profile_ratio = 0.000000e+00 : f64, detailed_summary = <cut_off = 10000, min_count = 86427, num_counts = 1>, <cut_off = 100000, min_count = 86427, num_counts = 1>>>]
}

// -----
module {
  llvm.module_flags [#llvm.mlir.module_flag<error, "riscv-isa", ["rv64i2p1", "m2p0"]>]
}

// -----
module attributes {llvm.dependent_libraries = ["foo", "bar"]} {
}

// -----
module {
  llvm.mlir.global external constant @const() {addr_space = 0 : i32, dso_local} : i32 {
    %0 = llvm.mlir.addressof @const : !llvm.ptr
    %1 = llvm.ptrtoint %0 : !llvm.ptr to i64
    %2 = llvm.dso_local_equivalent @extern_func : !llvm.ptr
    %3 = llvm.ptrtoint %2 : !llvm.ptr to i64
    %4 = llvm.sub %3, %1 : i64
    %5 = llvm.trunc %4 : i64 to i32
    llvm.return %5 : i32
  }
  llvm.func @extern_func()
}

// -----
module {
  llvm.func @extern_func() -> i32
  llvm.func @call_extern_func() {
    %0 = llvm.dso_local_equivalent @extern_func : !llvm.ptr
    %1 = llvm.call %0() : !llvm.ptr, () -> (i32 {llvm.noundef})
    llvm.return
  }
}

// -----
module {
  llvm.mlir.alias external @alias_func : !llvm.func<void ()> {
    %0 = llvm.mlir.addressof @aliasee_func : !llvm.ptr
    llvm.return %0 : !llvm.ptr
  }
  llvm.func @aliasee_func() {
    llvm.return
  }
  llvm.func @call_alias_func() {
    %0 = llvm.dso_local_equivalent @alias_func : !llvm.ptr
    llvm.call %0() : !llvm.ptr, () -> ()
    llvm.return
  }
}

// -----
module {
  llvm.func local_unnamed_addr @testfn(!llvm.array<2 x f32> {llvm.alignstack = 8 : i64})
  llvm.func internal @g(%arg0: !llvm.array<2 x f32>) attributes {dso_local} {
    llvm.call @testfn(%arg0) : (!llvm.array<2 x f32> {llvm.alignstack = 8 : i64}) -> ()
    llvm.return
  }
  llvm.func local_unnamed_addr @testfn2(!llvm.struct<(i8, i8)> {llvm.alignstack = 8 : i64})
  llvm.func internal @h(%arg0: !llvm.struct<(i8, i8)>) attributes {dso_local} {
    llvm.call @testfn2(%arg0) : (!llvm.struct<(i8, i8)> {llvm.alignstack = 8 : i64}) -> ()
    llvm.return
  }
  llvm.func local_unnamed_addr @testfn3(i32 {llvm.alignstack = 8 : i64})
  llvm.func internal @i(%arg0: i32) attributes {dso_local} {
    llvm.call @testfn3(%arg0) : (i32 {llvm.alignstack = 8 : i64}) -> ()
    llvm.return
  }
}

// -----
module {
  llvm.mlir.global external @test_array_attr_2() {addr_space = 0 : i32} : !llvm.array<2 x struct<(i32, f32)>> {
    %0 = llvm.mlir.constant([[42 : i32, 1.000000e+00 : f32], [42 : i32, 1.000000e+00 : f32]]) : !llvm.array<2 x struct<(i32, f32)>>
    llvm.return %0 : !llvm.array<2 x struct<(i32, f32)>>
  }
  llvm.mlir.global external @test_array_attr_3() {addr_space = 0 : i32} : !llvm.array<2 x array<3 x struct<(i32, f32)>>> {
    %0 = llvm.mlir.constant([[[1 : i32, 1.000000e+00 : f32], [2 : i32, 1.000000e+00 : f32], [3 : i32, 1.000000e+00 : f32]], [[4 : i32, 1.000000e+00 : f32], [5 : i32, 1.000000e+00 : f32], [6 : i32, 1.000000e+00 : f32]]]) : !llvm.array<2 x array<3 x struct<(i32, f32)>>>
    llvm.return %0 : !llvm.array<2 x array<3 x struct<(i32, f32)>>>
  }
  llvm.mlir.global internal constant @test_array_attr_struct_with_ptr() {addr_space = 0 : i32} : !llvm.array<2 x struct<(ptr)>> {
    %0 = llvm.mlir.constant([[#llvm.zero], [#llvm.undef]]) : !llvm.array<2 x struct<(ptr)>>
    llvm.return %0 : !llvm.array<2 x struct<(ptr)>>
  }
  llvm.mlir.global internal constant @test_array_attr_struct_with_struct() {addr_space = 0 : i32} : !llvm.array<3 x struct<(i32, f32)>> {
    %0 = llvm.mlir.constant([#llvm.zero, [2 : i32, 1.000000e+00 : f32], #llvm.undef]) : !llvm.array<3 x struct<(i32, f32)>>
    llvm.return %0 : !llvm.array<3 x struct<(i32, f32)>>
  }
}

// -----
module {
  llvm.mlir.global external @target_specific_attrs_only() {addr_space = 0 : i32, target_specific_attrs = [["memory", "0"], ["int-attr", "4"], "no-enum-attr", ["string-attr", "string"]]} : f64
}

// -----
module {
  llvm.mlir.global external @target_specific_attrs_combined(2 : i32) {addr_space = 0 : i32, alignment = 4 : i64, section = "mysection", target_specific_attrs = ["norecurse", ["bss-section", "my_bss.1"]]} : i32
}

// -----
module {
  llvm.func @byte_type(%arg0: !llvm.byte<8>) -> !llvm.byte<8> {
    llvm.return %arg0 : !llvm.byte<8>
  }
}

