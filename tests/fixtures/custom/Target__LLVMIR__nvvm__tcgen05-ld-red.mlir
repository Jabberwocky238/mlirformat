module {
  llvm.func @nvvm_tcgen05_ld_32x32b_min(%arg0: !llvm.ptr<6>) {
    %data, %redVal = nvvm.tcgen05.ld.red min %arg0 {shape = #nvvm.tcgen05_ldst_shape<shape_32x32b>} : vector<2xi32>, i32
    %data_0, %redVal_1 = nvvm.tcgen05.ld.red min %arg0 {shape = #nvvm.tcgen05_ldst_shape<shape_32x32b>} : vector<4xi32>, i32
    %data_2, %redVal_3 = nvvm.tcgen05.ld.red min %arg0 {shape = #nvvm.tcgen05_ldst_shape<shape_32x32b>} : vector<8xi32>, i32
    %data_4, %redVal_5 = nvvm.tcgen05.ld.red min %arg0 {shape = #nvvm.tcgen05_ldst_shape<shape_32x32b>} : vector<16xi32>, i32
    %data_6, %redVal_7 = nvvm.tcgen05.ld.red min %arg0 {shape = #nvvm.tcgen05_ldst_shape<shape_32x32b>} : vector<32xi32>, i32
    %data_8, %redVal_9 = nvvm.tcgen05.ld.red min %arg0 {shape = #nvvm.tcgen05_ldst_shape<shape_32x32b>} : vector<64xi32>, i32
    %data_10, %redVal_11 = nvvm.tcgen05.ld.red min %arg0 {shape = #nvvm.tcgen05_ldst_shape<shape_32x32b>} : vector<128xi32>, i32
    %data_12, %redVal_13 = nvvm.tcgen05.ld.red min %arg0 {shape = #nvvm.tcgen05_ldst_shape<shape_32x32b>} : vector<2xf32>, f32
    %data_14, %redVal_15 = nvvm.tcgen05.ld.red min %arg0 {shape = #nvvm.tcgen05_ldst_shape<shape_32x32b>} : vector<4xf32>, f32
    %data_16, %redVal_17 = nvvm.tcgen05.ld.red min %arg0 {shape = #nvvm.tcgen05_ldst_shape<shape_32x32b>} : vector<8xf32>, f32
    %data_18, %redVal_19 = nvvm.tcgen05.ld.red min %arg0 {shape = #nvvm.tcgen05_ldst_shape<shape_32x32b>} : vector<16xf32>, f32
    %data_20, %redVal_21 = nvvm.tcgen05.ld.red min %arg0 {shape = #nvvm.tcgen05_ldst_shape<shape_32x32b>} : vector<32xf32>, f32
    %data_22, %redVal_23 = nvvm.tcgen05.ld.red min %arg0 {shape = #nvvm.tcgen05_ldst_shape<shape_32x32b>} : vector<64xf32>, f32
    %data_24, %redVal_25 = nvvm.tcgen05.ld.red min %arg0 {shape = #nvvm.tcgen05_ldst_shape<shape_32x32b>} : vector<128xf32>, f32
    llvm.return
  }
  llvm.func @nvvm_tcgen05_ld_32x32b_max(%arg0: !llvm.ptr<6>) {
    %data, %redVal = nvvm.tcgen05.ld.red max %arg0 {shape = #nvvm.tcgen05_ldst_shape<shape_32x32b>} : vector<2xi32>, i32
    %data_0, %redVal_1 = nvvm.tcgen05.ld.red max %arg0 {shape = #nvvm.tcgen05_ldst_shape<shape_32x32b>} : vector<4xi32>, i32
    %data_2, %redVal_3 = nvvm.tcgen05.ld.red max %arg0 {shape = #nvvm.tcgen05_ldst_shape<shape_32x32b>} : vector<8xi32>, i32
    %data_4, %redVal_5 = nvvm.tcgen05.ld.red max %arg0 {shape = #nvvm.tcgen05_ldst_shape<shape_32x32b>} : vector<16xi32>, i32
    %data_6, %redVal_7 = nvvm.tcgen05.ld.red max %arg0 {shape = #nvvm.tcgen05_ldst_shape<shape_32x32b>} : vector<32xi32>, i32
    %data_8, %redVal_9 = nvvm.tcgen05.ld.red max %arg0 {shape = #nvvm.tcgen05_ldst_shape<shape_32x32b>} : vector<64xi32>, i32
    %data_10, %redVal_11 = nvvm.tcgen05.ld.red max %arg0 {shape = #nvvm.tcgen05_ldst_shape<shape_32x32b>} : vector<128xi32>, i32
    %data_12, %redVal_13 = nvvm.tcgen05.ld.red max %arg0 {shape = #nvvm.tcgen05_ldst_shape<shape_32x32b>} : vector<2xf32>, f32
    %data_14, %redVal_15 = nvvm.tcgen05.ld.red max %arg0 {shape = #nvvm.tcgen05_ldst_shape<shape_32x32b>} : vector<4xf32>, f32
    %data_16, %redVal_17 = nvvm.tcgen05.ld.red max %arg0 {shape = #nvvm.tcgen05_ldst_shape<shape_32x32b>} : vector<8xf32>, f32
    %data_18, %redVal_19 = nvvm.tcgen05.ld.red max %arg0 {shape = #nvvm.tcgen05_ldst_shape<shape_32x32b>} : vector<16xf32>, f32
    %data_20, %redVal_21 = nvvm.tcgen05.ld.red max %arg0 {shape = #nvvm.tcgen05_ldst_shape<shape_32x32b>} : vector<32xf32>, f32
    %data_22, %redVal_23 = nvvm.tcgen05.ld.red max %arg0 {shape = #nvvm.tcgen05_ldst_shape<shape_32x32b>} : vector<64xf32>, f32
    %data_24, %redVal_25 = nvvm.tcgen05.ld.red max %arg0 {shape = #nvvm.tcgen05_ldst_shape<shape_32x32b>} : vector<128xf32>, f32
    llvm.return
  }
  llvm.func @nvvm_tcgen05_ld_32x32b_min_abs_nan(%arg0: !llvm.ptr<6>) {
    %data, %redVal = nvvm.tcgen05.ld.red min %arg0 {abs, nan, shape = #nvvm.tcgen05_ldst_shape<shape_32x32b>} : vector<2xf32>, f32
    %data_0, %redVal_1 = nvvm.tcgen05.ld.red min %arg0 {abs, nan, shape = #nvvm.tcgen05_ldst_shape<shape_32x32b>} : vector<4xf32>, f32
    %data_2, %redVal_3 = nvvm.tcgen05.ld.red min %arg0 {abs, nan, shape = #nvvm.tcgen05_ldst_shape<shape_32x32b>} : vector<8xf32>, f32
    %data_4, %redVal_5 = nvvm.tcgen05.ld.red min %arg0 {abs, nan, shape = #nvvm.tcgen05_ldst_shape<shape_32x32b>} : vector<16xf32>, f32
    %data_6, %redVal_7 = nvvm.tcgen05.ld.red min %arg0 {abs, nan, shape = #nvvm.tcgen05_ldst_shape<shape_32x32b>} : vector<32xf32>, f32
    %data_8, %redVal_9 = nvvm.tcgen05.ld.red min %arg0 {abs, nan, shape = #nvvm.tcgen05_ldst_shape<shape_32x32b>} : vector<64xf32>, f32
    %data_10, %redVal_11 = nvvm.tcgen05.ld.red min %arg0 {abs, nan, shape = #nvvm.tcgen05_ldst_shape<shape_32x32b>} : vector<128xf32>, f32
    llvm.return
  }
  llvm.func @nvvm_tcgen05_ld_32x32b_max_abs_nan(%arg0: !llvm.ptr<6>) {
    %data, %redVal = nvvm.tcgen05.ld.red max %arg0 {abs, nan, shape = #nvvm.tcgen05_ldst_shape<shape_32x32b>} : vector<2xf32>, f32
    %data_0, %redVal_1 = nvvm.tcgen05.ld.red max %arg0 {abs, nan, shape = #nvvm.tcgen05_ldst_shape<shape_32x32b>} : vector<4xf32>, f32
    %data_2, %redVal_3 = nvvm.tcgen05.ld.red max %arg0 {abs, nan, shape = #nvvm.tcgen05_ldst_shape<shape_32x32b>} : vector<8xf32>, f32
    %data_4, %redVal_5 = nvvm.tcgen05.ld.red max %arg0 {abs, nan, shape = #nvvm.tcgen05_ldst_shape<shape_32x32b>} : vector<16xf32>, f32
    %data_6, %redVal_7 = nvvm.tcgen05.ld.red max %arg0 {abs, nan, shape = #nvvm.tcgen05_ldst_shape<shape_32x32b>} : vector<32xf32>, f32
    %data_8, %redVal_9 = nvvm.tcgen05.ld.red max %arg0 {abs, nan, shape = #nvvm.tcgen05_ldst_shape<shape_32x32b>} : vector<64xf32>, f32
    %data_10, %redVal_11 = nvvm.tcgen05.ld.red max %arg0 {abs, nan, shape = #nvvm.tcgen05_ldst_shape<shape_32x32b>} : vector<128xf32>, f32
    llvm.return
  }
  llvm.func @nvvm_tcgen05_ld_16x32bx2_min(%arg0: !llvm.ptr<6>) {
    %0 = llvm.mlir.constant(0 : i64) : i64
    %data, %redVal = nvvm.tcgen05.ld.red min %arg0, %0 {shape = #nvvm.tcgen05_ldst_shape<shape_16x32bx2>} : vector<2xi32>, i32
    %data_0, %redVal_1 = nvvm.tcgen05.ld.red min %arg0, %0 {shape = #nvvm.tcgen05_ldst_shape<shape_16x32bx2>} : vector<4xi32>, i32
    %data_2, %redVal_3 = nvvm.tcgen05.ld.red min %arg0, %0 {shape = #nvvm.tcgen05_ldst_shape<shape_16x32bx2>} : vector<8xi32>, i32
    %data_4, %redVal_5 = nvvm.tcgen05.ld.red min %arg0, %0 {shape = #nvvm.tcgen05_ldst_shape<shape_16x32bx2>} : vector<16xi32>, i32
    %data_6, %redVal_7 = nvvm.tcgen05.ld.red min %arg0, %0 {shape = #nvvm.tcgen05_ldst_shape<shape_16x32bx2>} : vector<32xi32>, i32
    %data_8, %redVal_9 = nvvm.tcgen05.ld.red min %arg0, %0 {shape = #nvvm.tcgen05_ldst_shape<shape_16x32bx2>} : vector<64xi32>, i32
    %data_10, %redVal_11 = nvvm.tcgen05.ld.red min %arg0, %0 {shape = #nvvm.tcgen05_ldst_shape<shape_16x32bx2>} : vector<128xi32>, i32
    %data_12, %redVal_13 = nvvm.tcgen05.ld.red min %arg0, %0 {shape = #nvvm.tcgen05_ldst_shape<shape_16x32bx2>} : vector<2xf32>, f32
    %data_14, %redVal_15 = nvvm.tcgen05.ld.red min %arg0, %0 {shape = #nvvm.tcgen05_ldst_shape<shape_16x32bx2>} : vector<4xf32>, f32
    %data_16, %redVal_17 = nvvm.tcgen05.ld.red min %arg0, %0 {shape = #nvvm.tcgen05_ldst_shape<shape_16x32bx2>} : vector<8xf32>, f32
    %data_18, %redVal_19 = nvvm.tcgen05.ld.red min %arg0, %0 {shape = #nvvm.tcgen05_ldst_shape<shape_16x32bx2>} : vector<16xf32>, f32
    %data_20, %redVal_21 = nvvm.tcgen05.ld.red min %arg0, %0 {shape = #nvvm.tcgen05_ldst_shape<shape_16x32bx2>} : vector<32xf32>, f32
    %data_22, %redVal_23 = nvvm.tcgen05.ld.red min %arg0, %0 {shape = #nvvm.tcgen05_ldst_shape<shape_16x32bx2>} : vector<64xf32>, f32
    %data_24, %redVal_25 = nvvm.tcgen05.ld.red min %arg0, %0 {shape = #nvvm.tcgen05_ldst_shape<shape_16x32bx2>} : vector<128xf32>, f32
    llvm.return
  }
  llvm.func @nvvm_tcgen05_ld_16x32bx2_max(%arg0: !llvm.ptr<6>) {
    %0 = llvm.mlir.constant(0 : i64) : i64
    %data, %redVal = nvvm.tcgen05.ld.red max %arg0, %0 {shape = #nvvm.tcgen05_ldst_shape<shape_16x32bx2>} : vector<2xi32>, i32
    %data_0, %redVal_1 = nvvm.tcgen05.ld.red max %arg0, %0 {shape = #nvvm.tcgen05_ldst_shape<shape_16x32bx2>} : vector<4xi32>, i32
    %data_2, %redVal_3 = nvvm.tcgen05.ld.red max %arg0, %0 {shape = #nvvm.tcgen05_ldst_shape<shape_16x32bx2>} : vector<8xi32>, i32
    %data_4, %redVal_5 = nvvm.tcgen05.ld.red max %arg0, %0 {shape = #nvvm.tcgen05_ldst_shape<shape_16x32bx2>} : vector<16xi32>, i32
    %data_6, %redVal_7 = nvvm.tcgen05.ld.red max %arg0, %0 {shape = #nvvm.tcgen05_ldst_shape<shape_16x32bx2>} : vector<32xi32>, i32
    %data_8, %redVal_9 = nvvm.tcgen05.ld.red max %arg0, %0 {shape = #nvvm.tcgen05_ldst_shape<shape_16x32bx2>} : vector<64xi32>, i32
    %data_10, %redVal_11 = nvvm.tcgen05.ld.red max %arg0, %0 {shape = #nvvm.tcgen05_ldst_shape<shape_16x32bx2>} : vector<128xi32>, i32
    %data_12, %redVal_13 = nvvm.tcgen05.ld.red max %arg0, %0 {shape = #nvvm.tcgen05_ldst_shape<shape_16x32bx2>} : vector<2xf32>, f32
    %data_14, %redVal_15 = nvvm.tcgen05.ld.red max %arg0, %0 {shape = #nvvm.tcgen05_ldst_shape<shape_16x32bx2>} : vector<4xf32>, f32
    %data_16, %redVal_17 = nvvm.tcgen05.ld.red max %arg0, %0 {shape = #nvvm.tcgen05_ldst_shape<shape_16x32bx2>} : vector<8xf32>, f32
    %data_18, %redVal_19 = nvvm.tcgen05.ld.red max %arg0, %0 {shape = #nvvm.tcgen05_ldst_shape<shape_16x32bx2>} : vector<16xf32>, f32
    %data_20, %redVal_21 = nvvm.tcgen05.ld.red max %arg0, %0 {shape = #nvvm.tcgen05_ldst_shape<shape_16x32bx2>} : vector<32xf32>, f32
    %data_22, %redVal_23 = nvvm.tcgen05.ld.red max %arg0, %0 {shape = #nvvm.tcgen05_ldst_shape<shape_16x32bx2>} : vector<64xf32>, f32
    %data_24, %redVal_25 = nvvm.tcgen05.ld.red max %arg0, %0 {shape = #nvvm.tcgen05_ldst_shape<shape_16x32bx2>} : vector<128xf32>, f32
    llvm.return
  }
  llvm.func @nvvm_tcgen05_ld_16x32bx2_min_nan_abs(%arg0: !llvm.ptr<6>) {
    %0 = llvm.mlir.constant(0 : i64) : i64
    %data, %redVal = nvvm.tcgen05.ld.red min %arg0, %0 {abs, nan, shape = #nvvm.tcgen05_ldst_shape<shape_16x32bx2>} : vector<2xf32>, f32
    %data_0, %redVal_1 = nvvm.tcgen05.ld.red min %arg0, %0 {abs, nan, shape = #nvvm.tcgen05_ldst_shape<shape_16x32bx2>} : vector<4xf32>, f32
    %data_2, %redVal_3 = nvvm.tcgen05.ld.red min %arg0, %0 {abs, nan, shape = #nvvm.tcgen05_ldst_shape<shape_16x32bx2>} : vector<8xf32>, f32
    %data_4, %redVal_5 = nvvm.tcgen05.ld.red min %arg0, %0 {abs, nan, shape = #nvvm.tcgen05_ldst_shape<shape_16x32bx2>} : vector<16xf32>, f32
    %data_6, %redVal_7 = nvvm.tcgen05.ld.red min %arg0, %0 {abs, nan, shape = #nvvm.tcgen05_ldst_shape<shape_16x32bx2>} : vector<32xf32>, f32
    %data_8, %redVal_9 = nvvm.tcgen05.ld.red min %arg0, %0 {abs, nan, shape = #nvvm.tcgen05_ldst_shape<shape_16x32bx2>} : vector<64xf32>, f32
    %data_10, %redVal_11 = nvvm.tcgen05.ld.red min %arg0, %0 {abs, nan, shape = #nvvm.tcgen05_ldst_shape<shape_16x32bx2>} : vector<128xf32>, f32
    llvm.return
  }
  llvm.func @nvvm_tcgen05_ld_16x32bx2_max_nan_abs(%arg0: !llvm.ptr<6>) {
    %0 = llvm.mlir.constant(0 : i64) : i64
    %data, %redVal = nvvm.tcgen05.ld.red max %arg0, %0 {abs, nan, shape = #nvvm.tcgen05_ldst_shape<shape_16x32bx2>} : vector<2xf32>, f32
    %data_0, %redVal_1 = nvvm.tcgen05.ld.red max %arg0, %0 {abs, nan, shape = #nvvm.tcgen05_ldst_shape<shape_16x32bx2>} : vector<4xf32>, f32
    %data_2, %redVal_3 = nvvm.tcgen05.ld.red max %arg0, %0 {abs, nan, shape = #nvvm.tcgen05_ldst_shape<shape_16x32bx2>} : vector<8xf32>, f32
    %data_4, %redVal_5 = nvvm.tcgen05.ld.red max %arg0, %0 {abs, nan, shape = #nvvm.tcgen05_ldst_shape<shape_16x32bx2>} : vector<16xf32>, f32
    %data_6, %redVal_7 = nvvm.tcgen05.ld.red max %arg0, %0 {abs, nan, shape = #nvvm.tcgen05_ldst_shape<shape_16x32bx2>} : vector<32xf32>, f32
    %data_8, %redVal_9 = nvvm.tcgen05.ld.red max %arg0, %0 {abs, nan, shape = #nvvm.tcgen05_ldst_shape<shape_16x32bx2>} : vector<64xf32>, f32
    %data_10, %redVal_11 = nvvm.tcgen05.ld.red max %arg0, %0 {abs, nan, shape = #nvvm.tcgen05_ldst_shape<shape_16x32bx2>} : vector<128xf32>, f32
    llvm.return
  }
}

