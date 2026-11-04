module {
  llvm.func @nvvm_tcgen05_mma_sp_cta_1(%arg0: !llvm.ptr<6>, %arg1: i64, %arg2: i64, %arg3: i64, %arg4: i32, %arg5: i1, %arg6: !llvm.ptr<6>) {
    nvvm.tcgen05.mma.sp %arg0, %arg1, %arg3, %arg4, %arg5, %arg6 {ctaGroup = #nvvm.cta_group<cta_1>, kind = #nvvm.tcgen05_mma_kind<f16>} : (!llvm.ptr<6>, i64, i64, i32, i1, !llvm.ptr<6>)
    nvvm.tcgen05.mma.sp %arg0, %arg1, %arg3, %arg4, %arg5, %arg6 {ctaGroup = #nvvm.cta_group<cta_1>, kind = #nvvm.tcgen05_mma_kind<tf32>} : (!llvm.ptr<6>, i64, i64, i32, i1, !llvm.ptr<6>)
    nvvm.tcgen05.mma.sp %arg0, %arg1, %arg3, %arg4, %arg5, %arg6 {ctaGroup = #nvvm.cta_group<cta_1>, kind = #nvvm.tcgen05_mma_kind<f8f6f4>} : (!llvm.ptr<6>, i64, i64, i32, i1, !llvm.ptr<6>)
    nvvm.tcgen05.mma.sp %arg0, %arg1, %arg3, %arg4, %arg5, %arg6 {ctaGroup = #nvvm.cta_group<cta_1>, kind = #nvvm.tcgen05_mma_kind<i8>} : (!llvm.ptr<6>, i64, i64, i32, i1, !llvm.ptr<6>)
    nvvm.tcgen05.mma.sp %arg0, %arg1, %arg3, %arg4, %arg5, %arg6 {collectorOp = #nvvm.tcgen05_mma_collectorop<lastuse>, ctaGroup = #nvvm.cta_group<cta_1>, kind = #nvvm.tcgen05_mma_kind<f16>} : (!llvm.ptr<6>, i64, i64, i32, i1, !llvm.ptr<6>)
    nvvm.tcgen05.mma.sp %arg0, %arg1, %arg3, %arg4, %arg5, %arg6 {collectorOp = #nvvm.tcgen05_mma_collectorop<lastuse>, ctaGroup = #nvvm.cta_group<cta_1>, kind = #nvvm.tcgen05_mma_kind<tf32>} : (!llvm.ptr<6>, i64, i64, i32, i1, !llvm.ptr<6>)
    nvvm.tcgen05.mma.sp %arg0, %arg1, %arg3, %arg4, %arg5, %arg6 {collectorOp = #nvvm.tcgen05_mma_collectorop<lastuse>, ctaGroup = #nvvm.cta_group<cta_1>, kind = #nvvm.tcgen05_mma_kind<f8f6f4>} : (!llvm.ptr<6>, i64, i64, i32, i1, !llvm.ptr<6>)
    nvvm.tcgen05.mma.sp %arg0, %arg1, %arg3, %arg4, %arg5, %arg6 {collectorOp = #nvvm.tcgen05_mma_collectorop<lastuse>, ctaGroup = #nvvm.cta_group<cta_1>, kind = #nvvm.tcgen05_mma_kind<i8>} : (!llvm.ptr<6>, i64, i64, i32, i1, !llvm.ptr<6>)
    nvvm.tcgen05.mma.sp %arg0, %arg1, %arg3, %arg4, %arg5, %arg6 {collectorOp = #nvvm.tcgen05_mma_collectorop<fill>, ctaGroup = #nvvm.cta_group<cta_1>, kind = #nvvm.tcgen05_mma_kind<f16>} : (!llvm.ptr<6>, i64, i64, i32, i1, !llvm.ptr<6>)
    nvvm.tcgen05.mma.sp %arg0, %arg1, %arg3, %arg4, %arg5, %arg6 {collectorOp = #nvvm.tcgen05_mma_collectorop<fill>, ctaGroup = #nvvm.cta_group<cta_1>, kind = #nvvm.tcgen05_mma_kind<tf32>} : (!llvm.ptr<6>, i64, i64, i32, i1, !llvm.ptr<6>)
    nvvm.tcgen05.mma.sp %arg0, %arg1, %arg3, %arg4, %arg5, %arg6 {collectorOp = #nvvm.tcgen05_mma_collectorop<fill>, ctaGroup = #nvvm.cta_group<cta_1>, kind = #nvvm.tcgen05_mma_kind<f8f6f4>} : (!llvm.ptr<6>, i64, i64, i32, i1, !llvm.ptr<6>)
    nvvm.tcgen05.mma.sp %arg0, %arg1, %arg3, %arg4, %arg5, %arg6 {collectorOp = #nvvm.tcgen05_mma_collectorop<fill>, ctaGroup = #nvvm.cta_group<cta_1>, kind = #nvvm.tcgen05_mma_kind<i8>} : (!llvm.ptr<6>, i64, i64, i32, i1, !llvm.ptr<6>)
    nvvm.tcgen05.mma.sp %arg0, %arg1, %arg3, %arg4, %arg5, %arg6 {collectorOp = #nvvm.tcgen05_mma_collectorop<use>, ctaGroup = #nvvm.cta_group<cta_1>, kind = #nvvm.tcgen05_mma_kind<f16>} : (!llvm.ptr<6>, i64, i64, i32, i1, !llvm.ptr<6>)
    nvvm.tcgen05.mma.sp %arg0, %arg1, %arg3, %arg4, %arg5, %arg6 {collectorOp = #nvvm.tcgen05_mma_collectorop<use>, ctaGroup = #nvvm.cta_group<cta_1>, kind = #nvvm.tcgen05_mma_kind<tf32>} : (!llvm.ptr<6>, i64, i64, i32, i1, !llvm.ptr<6>)
    nvvm.tcgen05.mma.sp %arg0, %arg1, %arg3, %arg4, %arg5, %arg6 {collectorOp = #nvvm.tcgen05_mma_collectorop<use>, ctaGroup = #nvvm.cta_group<cta_1>, kind = #nvvm.tcgen05_mma_kind<f8f6f4>} : (!llvm.ptr<6>, i64, i64, i32, i1, !llvm.ptr<6>)
    nvvm.tcgen05.mma.sp %arg0, %arg1, %arg3, %arg4, %arg5, %arg6 {collectorOp = #nvvm.tcgen05_mma_collectorop<use>, ctaGroup = #nvvm.cta_group<cta_1>, kind = #nvvm.tcgen05_mma_kind<i8>} : (!llvm.ptr<6>, i64, i64, i32, i1, !llvm.ptr<6>)
    llvm.return
  }
  llvm.func @nvvm_tcgen05_mma_sp_cta_2(%arg0: !llvm.ptr<6>, %arg1: i64, %arg2: i64, %arg3: i64, %arg4: i32, %arg5: i1, %arg6: !llvm.ptr<6>) {
    nvvm.tcgen05.mma.sp %arg0, %arg1, %arg3, %arg4, %arg5, %arg6 {ctaGroup = #nvvm.cta_group<cta_2>, kind = #nvvm.tcgen05_mma_kind<f16>} : (!llvm.ptr<6>, i64, i64, i32, i1, !llvm.ptr<6>)
    nvvm.tcgen05.mma.sp %arg0, %arg1, %arg3, %arg4, %arg5, %arg6 {ctaGroup = #nvvm.cta_group<cta_2>, kind = #nvvm.tcgen05_mma_kind<tf32>} : (!llvm.ptr<6>, i64, i64, i32, i1, !llvm.ptr<6>)
    nvvm.tcgen05.mma.sp %arg0, %arg1, %arg3, %arg4, %arg5, %arg6 {ctaGroup = #nvvm.cta_group<cta_2>, kind = #nvvm.tcgen05_mma_kind<f8f6f4>} : (!llvm.ptr<6>, i64, i64, i32, i1, !llvm.ptr<6>)
    nvvm.tcgen05.mma.sp %arg0, %arg1, %arg3, %arg4, %arg5, %arg6 {ctaGroup = #nvvm.cta_group<cta_2>, kind = #nvvm.tcgen05_mma_kind<i8>} : (!llvm.ptr<6>, i64, i64, i32, i1, !llvm.ptr<6>)
    nvvm.tcgen05.mma.sp %arg0, %arg1, %arg3, %arg4, %arg5, %arg6 {collectorOp = #nvvm.tcgen05_mma_collectorop<lastuse>, ctaGroup = #nvvm.cta_group<cta_2>, kind = #nvvm.tcgen05_mma_kind<f16>} : (!llvm.ptr<6>, i64, i64, i32, i1, !llvm.ptr<6>)
    nvvm.tcgen05.mma.sp %arg0, %arg1, %arg3, %arg4, %arg5, %arg6 {collectorOp = #nvvm.tcgen05_mma_collectorop<lastuse>, ctaGroup = #nvvm.cta_group<cta_2>, kind = #nvvm.tcgen05_mma_kind<tf32>} : (!llvm.ptr<6>, i64, i64, i32, i1, !llvm.ptr<6>)
    nvvm.tcgen05.mma.sp %arg0, %arg1, %arg3, %arg4, %arg5, %arg6 {collectorOp = #nvvm.tcgen05_mma_collectorop<lastuse>, ctaGroup = #nvvm.cta_group<cta_2>, kind = #nvvm.tcgen05_mma_kind<f8f6f4>} : (!llvm.ptr<6>, i64, i64, i32, i1, !llvm.ptr<6>)
    nvvm.tcgen05.mma.sp %arg0, %arg1, %arg3, %arg4, %arg5, %arg6 {collectorOp = #nvvm.tcgen05_mma_collectorop<lastuse>, ctaGroup = #nvvm.cta_group<cta_2>, kind = #nvvm.tcgen05_mma_kind<i8>} : (!llvm.ptr<6>, i64, i64, i32, i1, !llvm.ptr<6>)
    nvvm.tcgen05.mma.sp %arg0, %arg1, %arg3, %arg4, %arg5, %arg6 {collectorOp = #nvvm.tcgen05_mma_collectorop<fill>, ctaGroup = #nvvm.cta_group<cta_2>, kind = #nvvm.tcgen05_mma_kind<f16>} : (!llvm.ptr<6>, i64, i64, i32, i1, !llvm.ptr<6>)
    nvvm.tcgen05.mma.sp %arg0, %arg1, %arg3, %arg4, %arg5, %arg6 {collectorOp = #nvvm.tcgen05_mma_collectorop<fill>, ctaGroup = #nvvm.cta_group<cta_2>, kind = #nvvm.tcgen05_mma_kind<tf32>} : (!llvm.ptr<6>, i64, i64, i32, i1, !llvm.ptr<6>)
    nvvm.tcgen05.mma.sp %arg0, %arg1, %arg3, %arg4, %arg5, %arg6 {collectorOp = #nvvm.tcgen05_mma_collectorop<fill>, ctaGroup = #nvvm.cta_group<cta_2>, kind = #nvvm.tcgen05_mma_kind<f8f6f4>} : (!llvm.ptr<6>, i64, i64, i32, i1, !llvm.ptr<6>)
    nvvm.tcgen05.mma.sp %arg0, %arg1, %arg3, %arg4, %arg5, %arg6 {collectorOp = #nvvm.tcgen05_mma_collectorop<fill>, ctaGroup = #nvvm.cta_group<cta_2>, kind = #nvvm.tcgen05_mma_kind<i8>} : (!llvm.ptr<6>, i64, i64, i32, i1, !llvm.ptr<6>)
    nvvm.tcgen05.mma.sp %arg0, %arg1, %arg3, %arg4, %arg5, %arg6 {collectorOp = #nvvm.tcgen05_mma_collectorop<use>, ctaGroup = #nvvm.cta_group<cta_2>, kind = #nvvm.tcgen05_mma_kind<f16>} : (!llvm.ptr<6>, i64, i64, i32, i1, !llvm.ptr<6>)
    nvvm.tcgen05.mma.sp %arg0, %arg1, %arg3, %arg4, %arg5, %arg6 {collectorOp = #nvvm.tcgen05_mma_collectorop<use>, ctaGroup = #nvvm.cta_group<cta_2>, kind = #nvvm.tcgen05_mma_kind<tf32>} : (!llvm.ptr<6>, i64, i64, i32, i1, !llvm.ptr<6>)
    nvvm.tcgen05.mma.sp %arg0, %arg1, %arg3, %arg4, %arg5, %arg6 {collectorOp = #nvvm.tcgen05_mma_collectorop<use>, ctaGroup = #nvvm.cta_group<cta_2>, kind = #nvvm.tcgen05_mma_kind<f8f6f4>} : (!llvm.ptr<6>, i64, i64, i32, i1, !llvm.ptr<6>)
    nvvm.tcgen05.mma.sp %arg0, %arg1, %arg3, %arg4, %arg5, %arg6 {collectorOp = #nvvm.tcgen05_mma_collectorop<use>, ctaGroup = #nvvm.cta_group<cta_2>, kind = #nvvm.tcgen05_mma_kind<i8>} : (!llvm.ptr<6>, i64, i64, i32, i1, !llvm.ptr<6>)
    llvm.return
  }
  llvm.func @nvvm_tcgen05_mma_sp_scale_d_imm_cta_1(%arg0: !llvm.ptr<6>, %arg1: i64, %arg2: i64, %arg3: i64, %arg4: i32, %arg5: i1, %arg6: !llvm.ptr<6>) {
    %0 = llvm.mlir.constant(0 : i64) : i64
    nvvm.tcgen05.mma.sp %arg0, %arg1, %arg3, %arg4, %arg5, %arg6 scale = %0 {ctaGroup = #nvvm.cta_group<cta_1>, kind = #nvvm.tcgen05_mma_kind<f16>} : (!llvm.ptr<6>, i64, i64, i32, i1, !llvm.ptr<6>, i64)
    nvvm.tcgen05.mma.sp %arg0, %arg1, %arg3, %arg4, %arg5, %arg6 scale = %0 {ctaGroup = #nvvm.cta_group<cta_1>, kind = #nvvm.tcgen05_mma_kind<tf32>} : (!llvm.ptr<6>, i64, i64, i32, i1, !llvm.ptr<6>, i64)
    nvvm.tcgen05.mma.sp %arg0, %arg1, %arg3, %arg4, %arg5, %arg6 scale = %0 {collectorOp = #nvvm.tcgen05_mma_collectorop<lastuse>, ctaGroup = #nvvm.cta_group<cta_1>, kind = #nvvm.tcgen05_mma_kind<f16>} : (!llvm.ptr<6>, i64, i64, i32, i1, !llvm.ptr<6>, i64)
    nvvm.tcgen05.mma.sp %arg0, %arg1, %arg3, %arg4, %arg5, %arg6 scale = %0 {collectorOp = #nvvm.tcgen05_mma_collectorop<lastuse>, ctaGroup = #nvvm.cta_group<cta_1>, kind = #nvvm.tcgen05_mma_kind<tf32>} : (!llvm.ptr<6>, i64, i64, i32, i1, !llvm.ptr<6>, i64)
    nvvm.tcgen05.mma.sp %arg0, %arg1, %arg3, %arg4, %arg5, %arg6 scale = %0 {collectorOp = #nvvm.tcgen05_mma_collectorop<fill>, ctaGroup = #nvvm.cta_group<cta_1>, kind = #nvvm.tcgen05_mma_kind<f16>} : (!llvm.ptr<6>, i64, i64, i32, i1, !llvm.ptr<6>, i64)
    nvvm.tcgen05.mma.sp %arg0, %arg1, %arg3, %arg4, %arg5, %arg6 scale = %0 {collectorOp = #nvvm.tcgen05_mma_collectorop<fill>, ctaGroup = #nvvm.cta_group<cta_1>, kind = #nvvm.tcgen05_mma_kind<tf32>} : (!llvm.ptr<6>, i64, i64, i32, i1, !llvm.ptr<6>, i64)
    nvvm.tcgen05.mma.sp %arg0, %arg1, %arg3, %arg4, %arg5, %arg6 scale = %0 {collectorOp = #nvvm.tcgen05_mma_collectorop<use>, ctaGroup = #nvvm.cta_group<cta_1>, kind = #nvvm.tcgen05_mma_kind<f16>} : (!llvm.ptr<6>, i64, i64, i32, i1, !llvm.ptr<6>, i64)
    nvvm.tcgen05.mma.sp %arg0, %arg1, %arg3, %arg4, %arg5, %arg6 scale = %0 {collectorOp = #nvvm.tcgen05_mma_collectorop<use>, ctaGroup = #nvvm.cta_group<cta_1>, kind = #nvvm.tcgen05_mma_kind<tf32>} : (!llvm.ptr<6>, i64, i64, i32, i1, !llvm.ptr<6>, i64)
    llvm.return
  }
  llvm.func @nvvm_tcgen05_mma_sp_scale_d_imm_cta_2(%arg0: !llvm.ptr<6>, %arg1: i64, %arg2: i64, %arg3: i64, %arg4: i32, %arg5: i1, %arg6: !llvm.ptr<6>) {
    %0 = llvm.mlir.constant(0 : i64) : i64
    nvvm.tcgen05.mma.sp %arg0, %arg1, %arg3, %arg4, %arg5, %arg6 scale = %0 {ctaGroup = #nvvm.cta_group<cta_2>, kind = #nvvm.tcgen05_mma_kind<f16>} : (!llvm.ptr<6>, i64, i64, i32, i1, !llvm.ptr<6>, i64)
    nvvm.tcgen05.mma.sp %arg0, %arg1, %arg3, %arg4, %arg5, %arg6 scale = %0 {ctaGroup = #nvvm.cta_group<cta_2>, kind = #nvvm.tcgen05_mma_kind<tf32>} : (!llvm.ptr<6>, i64, i64, i32, i1, !llvm.ptr<6>, i64)
    nvvm.tcgen05.mma.sp %arg0, %arg1, %arg3, %arg4, %arg5, %arg6 scale = %0 {collectorOp = #nvvm.tcgen05_mma_collectorop<lastuse>, ctaGroup = #nvvm.cta_group<cta_2>, kind = #nvvm.tcgen05_mma_kind<f16>} : (!llvm.ptr<6>, i64, i64, i32, i1, !llvm.ptr<6>, i64)
    nvvm.tcgen05.mma.sp %arg0, %arg1, %arg3, %arg4, %arg5, %arg6 scale = %0 {collectorOp = #nvvm.tcgen05_mma_collectorop<lastuse>, ctaGroup = #nvvm.cta_group<cta_2>, kind = #nvvm.tcgen05_mma_kind<tf32>} : (!llvm.ptr<6>, i64, i64, i32, i1, !llvm.ptr<6>, i64)
    nvvm.tcgen05.mma.sp %arg0, %arg1, %arg3, %arg4, %arg5, %arg6 scale = %0 {collectorOp = #nvvm.tcgen05_mma_collectorop<fill>, ctaGroup = #nvvm.cta_group<cta_2>, kind = #nvvm.tcgen05_mma_kind<f16>} : (!llvm.ptr<6>, i64, i64, i32, i1, !llvm.ptr<6>, i64)
    nvvm.tcgen05.mma.sp %arg0, %arg1, %arg3, %arg4, %arg5, %arg6 scale = %0 {collectorOp = #nvvm.tcgen05_mma_collectorop<fill>, ctaGroup = #nvvm.cta_group<cta_2>, kind = #nvvm.tcgen05_mma_kind<tf32>} : (!llvm.ptr<6>, i64, i64, i32, i1, !llvm.ptr<6>, i64)
    nvvm.tcgen05.mma.sp %arg0, %arg1, %arg3, %arg4, %arg5, %arg6 scale = %0 {collectorOp = #nvvm.tcgen05_mma_collectorop<use>, ctaGroup = #nvvm.cta_group<cta_2>, kind = #nvvm.tcgen05_mma_kind<f16>} : (!llvm.ptr<6>, i64, i64, i32, i1, !llvm.ptr<6>, i64)
    nvvm.tcgen05.mma.sp %arg0, %arg1, %arg3, %arg4, %arg5, %arg6 scale = %0 {collectorOp = #nvvm.tcgen05_mma_collectorop<use>, ctaGroup = #nvvm.cta_group<cta_2>, kind = #nvvm.tcgen05_mma_kind<tf32>} : (!llvm.ptr<6>, i64, i64, i32, i1, !llvm.ptr<6>, i64)
    llvm.return
  }
  llvm.func @nvvm_tcgen05_mma_sp_disable_output_lane_cta_1(%arg0: !llvm.ptr<6>, %arg1: i64, %arg2: i64, %arg3: i64, %arg4: i32, %arg5: i1, %arg6: vector<4xi32>, %arg7: !llvm.ptr<6>) {
    nvvm.tcgen05.mma.sp %arg0, %arg1, %arg3, %arg4, %arg5, %arg7 mask = %arg6 {ctaGroup = #nvvm.cta_group<cta_1>, kind = #nvvm.tcgen05_mma_kind<f16>} : (!llvm.ptr<6>, i64, i64, i32, i1, !llvm.ptr<6>, vector<4xi32>)
    nvvm.tcgen05.mma.sp %arg0, %arg1, %arg3, %arg4, %arg5, %arg7 mask = %arg6 {ctaGroup = #nvvm.cta_group<cta_1>, kind = #nvvm.tcgen05_mma_kind<tf32>} : (!llvm.ptr<6>, i64, i64, i32, i1, !llvm.ptr<6>, vector<4xi32>)
    nvvm.tcgen05.mma.sp %arg0, %arg1, %arg3, %arg4, %arg5, %arg7 mask = %arg6 {ctaGroup = #nvvm.cta_group<cta_1>, kind = #nvvm.tcgen05_mma_kind<f8f6f4>} : (!llvm.ptr<6>, i64, i64, i32, i1, !llvm.ptr<6>, vector<4xi32>)
    nvvm.tcgen05.mma.sp %arg0, %arg1, %arg3, %arg4, %arg5, %arg7 mask = %arg6 {ctaGroup = #nvvm.cta_group<cta_1>, kind = #nvvm.tcgen05_mma_kind<i8>} : (!llvm.ptr<6>, i64, i64, i32, i1, !llvm.ptr<6>, vector<4xi32>)
    nvvm.tcgen05.mma.sp %arg0, %arg1, %arg3, %arg4, %arg5, %arg7 mask = %arg6 {collectorOp = #nvvm.tcgen05_mma_collectorop<lastuse>, ctaGroup = #nvvm.cta_group<cta_1>, kind = #nvvm.tcgen05_mma_kind<f16>} : (!llvm.ptr<6>, i64, i64, i32, i1, !llvm.ptr<6>, vector<4xi32>)
    nvvm.tcgen05.mma.sp %arg0, %arg1, %arg3, %arg4, %arg5, %arg7 mask = %arg6 {collectorOp = #nvvm.tcgen05_mma_collectorop<lastuse>, ctaGroup = #nvvm.cta_group<cta_1>, kind = #nvvm.tcgen05_mma_kind<tf32>} : (!llvm.ptr<6>, i64, i64, i32, i1, !llvm.ptr<6>, vector<4xi32>)
    nvvm.tcgen05.mma.sp %arg0, %arg1, %arg3, %arg4, %arg5, %arg7 mask = %arg6 {collectorOp = #nvvm.tcgen05_mma_collectorop<lastuse>, ctaGroup = #nvvm.cta_group<cta_1>, kind = #nvvm.tcgen05_mma_kind<f8f6f4>} : (!llvm.ptr<6>, i64, i64, i32, i1, !llvm.ptr<6>, vector<4xi32>)
    nvvm.tcgen05.mma.sp %arg0, %arg1, %arg3, %arg4, %arg5, %arg7 mask = %arg6 {collectorOp = #nvvm.tcgen05_mma_collectorop<lastuse>, ctaGroup = #nvvm.cta_group<cta_1>, kind = #nvvm.tcgen05_mma_kind<i8>} : (!llvm.ptr<6>, i64, i64, i32, i1, !llvm.ptr<6>, vector<4xi32>)
    nvvm.tcgen05.mma.sp %arg0, %arg1, %arg3, %arg4, %arg5, %arg7 mask = %arg6 {collectorOp = #nvvm.tcgen05_mma_collectorop<fill>, ctaGroup = #nvvm.cta_group<cta_1>, kind = #nvvm.tcgen05_mma_kind<f16>} : (!llvm.ptr<6>, i64, i64, i32, i1, !llvm.ptr<6>, vector<4xi32>)
    nvvm.tcgen05.mma.sp %arg0, %arg1, %arg3, %arg4, %arg5, %arg7 mask = %arg6 {collectorOp = #nvvm.tcgen05_mma_collectorop<fill>, ctaGroup = #nvvm.cta_group<cta_1>, kind = #nvvm.tcgen05_mma_kind<tf32>} : (!llvm.ptr<6>, i64, i64, i32, i1, !llvm.ptr<6>, vector<4xi32>)
    nvvm.tcgen05.mma.sp %arg0, %arg1, %arg3, %arg4, %arg5, %arg7 mask = %arg6 {collectorOp = #nvvm.tcgen05_mma_collectorop<fill>, ctaGroup = #nvvm.cta_group<cta_1>, kind = #nvvm.tcgen05_mma_kind<f8f6f4>} : (!llvm.ptr<6>, i64, i64, i32, i1, !llvm.ptr<6>, vector<4xi32>)
    nvvm.tcgen05.mma.sp %arg0, %arg1, %arg3, %arg4, %arg5, %arg7 mask = %arg6 {collectorOp = #nvvm.tcgen05_mma_collectorop<fill>, ctaGroup = #nvvm.cta_group<cta_1>, kind = #nvvm.tcgen05_mma_kind<i8>} : (!llvm.ptr<6>, i64, i64, i32, i1, !llvm.ptr<6>, vector<4xi32>)
    nvvm.tcgen05.mma.sp %arg0, %arg1, %arg3, %arg4, %arg5, %arg7 mask = %arg6 {collectorOp = #nvvm.tcgen05_mma_collectorop<use>, ctaGroup = #nvvm.cta_group<cta_1>, kind = #nvvm.tcgen05_mma_kind<f16>} : (!llvm.ptr<6>, i64, i64, i32, i1, !llvm.ptr<6>, vector<4xi32>)
    nvvm.tcgen05.mma.sp %arg0, %arg1, %arg3, %arg4, %arg5, %arg7 mask = %arg6 {collectorOp = #nvvm.tcgen05_mma_collectorop<use>, ctaGroup = #nvvm.cta_group<cta_1>, kind = #nvvm.tcgen05_mma_kind<tf32>} : (!llvm.ptr<6>, i64, i64, i32, i1, !llvm.ptr<6>, vector<4xi32>)
    nvvm.tcgen05.mma.sp %arg0, %arg1, %arg3, %arg4, %arg5, %arg7 mask = %arg6 {collectorOp = #nvvm.tcgen05_mma_collectorop<use>, ctaGroup = #nvvm.cta_group<cta_1>, kind = #nvvm.tcgen05_mma_kind<f8f6f4>} : (!llvm.ptr<6>, i64, i64, i32, i1, !llvm.ptr<6>, vector<4xi32>)
    nvvm.tcgen05.mma.sp %arg0, %arg1, %arg3, %arg4, %arg5, %arg7 mask = %arg6 {collectorOp = #nvvm.tcgen05_mma_collectorop<use>, ctaGroup = #nvvm.cta_group<cta_1>, kind = #nvvm.tcgen05_mma_kind<i8>} : (!llvm.ptr<6>, i64, i64, i32, i1, !llvm.ptr<6>, vector<4xi32>)
    llvm.return
  }
  llvm.func @nvvm_tcgen05_mma_sp_disable_output_lane_cta_2(%arg0: !llvm.ptr<6>, %arg1: i64, %arg2: i64, %arg3: i64, %arg4: i32, %arg5: i1, %arg6: vector<8xi32>, %arg7: !llvm.ptr<6>) {
    nvvm.tcgen05.mma.sp %arg0, %arg1, %arg3, %arg4, %arg5, %arg7 mask = %arg6 {ctaGroup = #nvvm.cta_group<cta_2>, kind = #nvvm.tcgen05_mma_kind<f16>} : (!llvm.ptr<6>, i64, i64, i32, i1, !llvm.ptr<6>, vector<8xi32>)
    nvvm.tcgen05.mma.sp %arg0, %arg1, %arg3, %arg4, %arg5, %arg7 mask = %arg6 {ctaGroup = #nvvm.cta_group<cta_2>, kind = #nvvm.tcgen05_mma_kind<tf32>} : (!llvm.ptr<6>, i64, i64, i32, i1, !llvm.ptr<6>, vector<8xi32>)
    nvvm.tcgen05.mma.sp %arg0, %arg1, %arg3, %arg4, %arg5, %arg7 mask = %arg6 {ctaGroup = #nvvm.cta_group<cta_2>, kind = #nvvm.tcgen05_mma_kind<f8f6f4>} : (!llvm.ptr<6>, i64, i64, i32, i1, !llvm.ptr<6>, vector<8xi32>)
    nvvm.tcgen05.mma.sp %arg0, %arg1, %arg3, %arg4, %arg5, %arg7 mask = %arg6 {ctaGroup = #nvvm.cta_group<cta_2>, kind = #nvvm.tcgen05_mma_kind<i8>} : (!llvm.ptr<6>, i64, i64, i32, i1, !llvm.ptr<6>, vector<8xi32>)
    nvvm.tcgen05.mma.sp %arg0, %arg1, %arg3, %arg4, %arg5, %arg7 mask = %arg6 {collectorOp = #nvvm.tcgen05_mma_collectorop<lastuse>, ctaGroup = #nvvm.cta_group<cta_2>, kind = #nvvm.tcgen05_mma_kind<f16>} : (!llvm.ptr<6>, i64, i64, i32, i1, !llvm.ptr<6>, vector<8xi32>)
    nvvm.tcgen05.mma.sp %arg0, %arg1, %arg3, %arg4, %arg5, %arg7 mask = %arg6 {collectorOp = #nvvm.tcgen05_mma_collectorop<lastuse>, ctaGroup = #nvvm.cta_group<cta_2>, kind = #nvvm.tcgen05_mma_kind<tf32>} : (!llvm.ptr<6>, i64, i64, i32, i1, !llvm.ptr<6>, vector<8xi32>)
    nvvm.tcgen05.mma.sp %arg0, %arg1, %arg3, %arg4, %arg5, %arg7 mask = %arg6 {collectorOp = #nvvm.tcgen05_mma_collectorop<lastuse>, ctaGroup = #nvvm.cta_group<cta_2>, kind = #nvvm.tcgen05_mma_kind<f8f6f4>} : (!llvm.ptr<6>, i64, i64, i32, i1, !llvm.ptr<6>, vector<8xi32>)
    nvvm.tcgen05.mma.sp %arg0, %arg1, %arg3, %arg4, %arg5, %arg7 mask = %arg6 {collectorOp = #nvvm.tcgen05_mma_collectorop<lastuse>, ctaGroup = #nvvm.cta_group<cta_2>, kind = #nvvm.tcgen05_mma_kind<i8>} : (!llvm.ptr<6>, i64, i64, i32, i1, !llvm.ptr<6>, vector<8xi32>)
    nvvm.tcgen05.mma.sp %arg0, %arg1, %arg3, %arg4, %arg5, %arg7 mask = %arg6 {collectorOp = #nvvm.tcgen05_mma_collectorop<fill>, ctaGroup = #nvvm.cta_group<cta_2>, kind = #nvvm.tcgen05_mma_kind<f16>} : (!llvm.ptr<6>, i64, i64, i32, i1, !llvm.ptr<6>, vector<8xi32>)
    nvvm.tcgen05.mma.sp %arg0, %arg1, %arg3, %arg4, %arg5, %arg7 mask = %arg6 {collectorOp = #nvvm.tcgen05_mma_collectorop<fill>, ctaGroup = #nvvm.cta_group<cta_2>, kind = #nvvm.tcgen05_mma_kind<tf32>} : (!llvm.ptr<6>, i64, i64, i32, i1, !llvm.ptr<6>, vector<8xi32>)
    nvvm.tcgen05.mma.sp %arg0, %arg1, %arg3, %arg4, %arg5, %arg7 mask = %arg6 {collectorOp = #nvvm.tcgen05_mma_collectorop<fill>, ctaGroup = #nvvm.cta_group<cta_2>, kind = #nvvm.tcgen05_mma_kind<f8f6f4>} : (!llvm.ptr<6>, i64, i64, i32, i1, !llvm.ptr<6>, vector<8xi32>)
    nvvm.tcgen05.mma.sp %arg0, %arg1, %arg3, %arg4, %arg5, %arg7 mask = %arg6 {collectorOp = #nvvm.tcgen05_mma_collectorop<fill>, ctaGroup = #nvvm.cta_group<cta_2>, kind = #nvvm.tcgen05_mma_kind<i8>} : (!llvm.ptr<6>, i64, i64, i32, i1, !llvm.ptr<6>, vector<8xi32>)
    nvvm.tcgen05.mma.sp %arg0, %arg1, %arg3, %arg4, %arg5, %arg7 mask = %arg6 {collectorOp = #nvvm.tcgen05_mma_collectorop<use>, ctaGroup = #nvvm.cta_group<cta_2>, kind = #nvvm.tcgen05_mma_kind<f16>} : (!llvm.ptr<6>, i64, i64, i32, i1, !llvm.ptr<6>, vector<8xi32>)
    nvvm.tcgen05.mma.sp %arg0, %arg1, %arg3, %arg4, %arg5, %arg7 mask = %arg6 {collectorOp = #nvvm.tcgen05_mma_collectorop<use>, ctaGroup = #nvvm.cta_group<cta_2>, kind = #nvvm.tcgen05_mma_kind<tf32>} : (!llvm.ptr<6>, i64, i64, i32, i1, !llvm.ptr<6>, vector<8xi32>)
    nvvm.tcgen05.mma.sp %arg0, %arg1, %arg3, %arg4, %arg5, %arg7 mask = %arg6 {collectorOp = #nvvm.tcgen05_mma_collectorop<use>, ctaGroup = #nvvm.cta_group<cta_2>, kind = #nvvm.tcgen05_mma_kind<f8f6f4>} : (!llvm.ptr<6>, i64, i64, i32, i1, !llvm.ptr<6>, vector<8xi32>)
    nvvm.tcgen05.mma.sp %arg0, %arg1, %arg3, %arg4, %arg5, %arg7 mask = %arg6 {collectorOp = #nvvm.tcgen05_mma_collectorop<use>, ctaGroup = #nvvm.cta_group<cta_2>, kind = #nvvm.tcgen05_mma_kind<i8>} : (!llvm.ptr<6>, i64, i64, i32, i1, !llvm.ptr<6>, vector<8xi32>)
    llvm.return
  }
  llvm.func @nvvm_tcgen05_mma_sp_scale_d_imm_disable_output_lane_cta_1(%arg0: !llvm.ptr<6>, %arg1: i64, %arg2: i64, %arg3: i64, %arg4: i32, %arg5: i1, %arg6: vector<4xi32>, %arg7: !llvm.ptr<6>) {
    %0 = llvm.mlir.constant(0 : i64) : i64
    nvvm.tcgen05.mma.sp %arg0, %arg1, %arg3, %arg4, %arg5, %arg7 scale = %0 mask = %arg6 {ctaGroup = #nvvm.cta_group<cta_1>, kind = #nvvm.tcgen05_mma_kind<f16>} : (!llvm.ptr<6>, i64, i64, i32, i1, !llvm.ptr<6>, i64, vector<4xi32>)
    nvvm.tcgen05.mma.sp %arg0, %arg1, %arg3, %arg4, %arg5, %arg7 scale = %0 mask = %arg6 {ctaGroup = #nvvm.cta_group<cta_1>, kind = #nvvm.tcgen05_mma_kind<tf32>} : (!llvm.ptr<6>, i64, i64, i32, i1, !llvm.ptr<6>, i64, vector<4xi32>)
    nvvm.tcgen05.mma.sp %arg0, %arg1, %arg3, %arg4, %arg5, %arg7 scale = %0 mask = %arg6 {collectorOp = #nvvm.tcgen05_mma_collectorop<lastuse>, ctaGroup = #nvvm.cta_group<cta_1>, kind = #nvvm.tcgen05_mma_kind<f16>} : (!llvm.ptr<6>, i64, i64, i32, i1, !llvm.ptr<6>, i64, vector<4xi32>)
    nvvm.tcgen05.mma.sp %arg0, %arg1, %arg3, %arg4, %arg5, %arg7 scale = %0 mask = %arg6 {collectorOp = #nvvm.tcgen05_mma_collectorop<lastuse>, ctaGroup = #nvvm.cta_group<cta_1>, kind = #nvvm.tcgen05_mma_kind<tf32>} : (!llvm.ptr<6>, i64, i64, i32, i1, !llvm.ptr<6>, i64, vector<4xi32>)
    nvvm.tcgen05.mma.sp %arg0, %arg1, %arg3, %arg4, %arg5, %arg7 scale = %0 mask = %arg6 {collectorOp = #nvvm.tcgen05_mma_collectorop<fill>, ctaGroup = #nvvm.cta_group<cta_1>, kind = #nvvm.tcgen05_mma_kind<f16>} : (!llvm.ptr<6>, i64, i64, i32, i1, !llvm.ptr<6>, i64, vector<4xi32>)
    nvvm.tcgen05.mma.sp %arg0, %arg1, %arg3, %arg4, %arg5, %arg7 scale = %0 mask = %arg6 {collectorOp = #nvvm.tcgen05_mma_collectorop<fill>, ctaGroup = #nvvm.cta_group<cta_1>, kind = #nvvm.tcgen05_mma_kind<tf32>} : (!llvm.ptr<6>, i64, i64, i32, i1, !llvm.ptr<6>, i64, vector<4xi32>)
    nvvm.tcgen05.mma.sp %arg0, %arg1, %arg3, %arg4, %arg5, %arg7 scale = %0 mask = %arg6 {collectorOp = #nvvm.tcgen05_mma_collectorop<use>, ctaGroup = #nvvm.cta_group<cta_1>, kind = #nvvm.tcgen05_mma_kind<f16>} : (!llvm.ptr<6>, i64, i64, i32, i1, !llvm.ptr<6>, i64, vector<4xi32>)
    nvvm.tcgen05.mma.sp %arg0, %arg1, %arg3, %arg4, %arg5, %arg7 scale = %0 mask = %arg6 {collectorOp = #nvvm.tcgen05_mma_collectorop<use>, ctaGroup = #nvvm.cta_group<cta_1>, kind = #nvvm.tcgen05_mma_kind<tf32>} : (!llvm.ptr<6>, i64, i64, i32, i1, !llvm.ptr<6>, i64, vector<4xi32>)
    llvm.return
  }
  llvm.func @nvvm_tcgen05_mma_sp_scale_d_imm_disable_output_lane_cta_2(%arg0: !llvm.ptr<6>, %arg1: i64, %arg2: i64, %arg3: i64, %arg4: i32, %arg5: i1, %arg6: vector<8xi32>, %arg7: !llvm.ptr<6>) {
    %0 = llvm.mlir.constant(0 : i64) : i64
    nvvm.tcgen05.mma.sp %arg0, %arg1, %arg3, %arg4, %arg5, %arg7 scale = %0 mask = %arg6 {ctaGroup = #nvvm.cta_group<cta_2>, kind = #nvvm.tcgen05_mma_kind<f16>} : (!llvm.ptr<6>, i64, i64, i32, i1, !llvm.ptr<6>, i64, vector<8xi32>)
    nvvm.tcgen05.mma.sp %arg0, %arg1, %arg3, %arg4, %arg5, %arg7 scale = %0 mask = %arg6 {ctaGroup = #nvvm.cta_group<cta_2>, kind = #nvvm.tcgen05_mma_kind<tf32>} : (!llvm.ptr<6>, i64, i64, i32, i1, !llvm.ptr<6>, i64, vector<8xi32>)
    nvvm.tcgen05.mma.sp %arg0, %arg1, %arg3, %arg4, %arg5, %arg7 scale = %0 mask = %arg6 {collectorOp = #nvvm.tcgen05_mma_collectorop<lastuse>, ctaGroup = #nvvm.cta_group<cta_2>, kind = #nvvm.tcgen05_mma_kind<f16>} : (!llvm.ptr<6>, i64, i64, i32, i1, !llvm.ptr<6>, i64, vector<8xi32>)
    nvvm.tcgen05.mma.sp %arg0, %arg1, %arg3, %arg4, %arg5, %arg7 scale = %0 mask = %arg6 {collectorOp = #nvvm.tcgen05_mma_collectorop<lastuse>, ctaGroup = #nvvm.cta_group<cta_2>, kind = #nvvm.tcgen05_mma_kind<tf32>} : (!llvm.ptr<6>, i64, i64, i32, i1, !llvm.ptr<6>, i64, vector<8xi32>)
    nvvm.tcgen05.mma.sp %arg0, %arg1, %arg3, %arg4, %arg5, %arg7 scale = %0 mask = %arg6 {collectorOp = #nvvm.tcgen05_mma_collectorop<fill>, ctaGroup = #nvvm.cta_group<cta_2>, kind = #nvvm.tcgen05_mma_kind<f16>} : (!llvm.ptr<6>, i64, i64, i32, i1, !llvm.ptr<6>, i64, vector<8xi32>)
    nvvm.tcgen05.mma.sp %arg0, %arg1, %arg3, %arg4, %arg5, %arg7 scale = %0 mask = %arg6 {collectorOp = #nvvm.tcgen05_mma_collectorop<fill>, ctaGroup = #nvvm.cta_group<cta_2>, kind = #nvvm.tcgen05_mma_kind<tf32>} : (!llvm.ptr<6>, i64, i64, i32, i1, !llvm.ptr<6>, i64, vector<8xi32>)
    nvvm.tcgen05.mma.sp %arg0, %arg1, %arg3, %arg4, %arg5, %arg7 scale = %0 mask = %arg6 {collectorOp = #nvvm.tcgen05_mma_collectorop<use>, ctaGroup = #nvvm.cta_group<cta_2>, kind = #nvvm.tcgen05_mma_kind<f16>} : (!llvm.ptr<6>, i64, i64, i32, i1, !llvm.ptr<6>, i64, vector<8xi32>)
    nvvm.tcgen05.mma.sp %arg0, %arg1, %arg3, %arg4, %arg5, %arg7 scale = %0 mask = %arg6 {collectorOp = #nvvm.tcgen05_mma_collectorop<use>, ctaGroup = #nvvm.cta_group<cta_2>, kind = #nvvm.tcgen05_mma_kind<tf32>} : (!llvm.ptr<6>, i64, i64, i32, i1, !llvm.ptr<6>, i64, vector<8xi32>)
    llvm.return
  }
}

