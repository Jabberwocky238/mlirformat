module {
  llvm.func @nvvm_tcgen05_mma_ws(%arg0: !llvm.ptr<6>, %arg1: !llvm.ptr<6>, %arg2: i64, %arg3: i32, %arg4: i1) {
    nvvm.tcgen05.mma.ws %arg0, %arg1, %arg2, %arg3, %arg4 {kind = #nvvm.tcgen05_mma_kind<f16>} : (!llvm.ptr<6>, !llvm.ptr<6>, i64, i32, i1)
    nvvm.tcgen05.mma.ws %arg0, %arg1, %arg2, %arg3, %arg4 {kind = #nvvm.tcgen05_mma_kind<tf32>} : (!llvm.ptr<6>, !llvm.ptr<6>, i64, i32, i1)
    nvvm.tcgen05.mma.ws %arg0, %arg1, %arg2, %arg3, %arg4 {kind = #nvvm.tcgen05_mma_kind<f8f6f4>} : (!llvm.ptr<6>, !llvm.ptr<6>, i64, i32, i1)
    nvvm.tcgen05.mma.ws %arg0, %arg1, %arg2, %arg3, %arg4 {kind = #nvvm.tcgen05_mma_kind<i8>} : (!llvm.ptr<6>, !llvm.ptr<6>, i64, i32, i1)
    nvvm.tcgen05.mma.ws %arg0, %arg1, %arg2, %arg3, %arg4 {collectorBBuffer = #nvvm.tcgen05_mma_collectorb<b1>, kind = #nvvm.tcgen05_mma_kind<f16>} : (!llvm.ptr<6>, !llvm.ptr<6>, i64, i32, i1)
    nvvm.tcgen05.mma.ws %arg0, %arg1, %arg2, %arg3, %arg4 {collectorBBuffer = #nvvm.tcgen05_mma_collectorb<b1>, kind = #nvvm.tcgen05_mma_kind<tf32>} : (!llvm.ptr<6>, !llvm.ptr<6>, i64, i32, i1)
    nvvm.tcgen05.mma.ws %arg0, %arg1, %arg2, %arg3, %arg4 {collectorBBuffer = #nvvm.tcgen05_mma_collectorb<b1>, kind = #nvvm.tcgen05_mma_kind<f8f6f4>} : (!llvm.ptr<6>, !llvm.ptr<6>, i64, i32, i1)
    nvvm.tcgen05.mma.ws %arg0, %arg1, %arg2, %arg3, %arg4 {collectorBBuffer = #nvvm.tcgen05_mma_collectorb<b1>, kind = #nvvm.tcgen05_mma_kind<i8>} : (!llvm.ptr<6>, !llvm.ptr<6>, i64, i32, i1)
    nvvm.tcgen05.mma.ws %arg0, %arg1, %arg2, %arg3, %arg4 {collectorBBuffer = #nvvm.tcgen05_mma_collectorb<b1>, collectorOp = #nvvm.tcgen05_mma_collectorop<lastuse>, kind = #nvvm.tcgen05_mma_kind<f16>} : (!llvm.ptr<6>, !llvm.ptr<6>, i64, i32, i1)
    nvvm.tcgen05.mma.ws %arg0, %arg1, %arg2, %arg3, %arg4 {collectorBBuffer = #nvvm.tcgen05_mma_collectorb<b1>, collectorOp = #nvvm.tcgen05_mma_collectorop<lastuse>, kind = #nvvm.tcgen05_mma_kind<tf32>} : (!llvm.ptr<6>, !llvm.ptr<6>, i64, i32, i1)
    nvvm.tcgen05.mma.ws %arg0, %arg1, %arg2, %arg3, %arg4 {collectorBBuffer = #nvvm.tcgen05_mma_collectorb<b1>, collectorOp = #nvvm.tcgen05_mma_collectorop<lastuse>, kind = #nvvm.tcgen05_mma_kind<f8f6f4>} : (!llvm.ptr<6>, !llvm.ptr<6>, i64, i32, i1)
    nvvm.tcgen05.mma.ws %arg0, %arg1, %arg2, %arg3, %arg4 {collectorBBuffer = #nvvm.tcgen05_mma_collectorb<b1>, collectorOp = #nvvm.tcgen05_mma_collectorop<lastuse>, kind = #nvvm.tcgen05_mma_kind<i8>} : (!llvm.ptr<6>, !llvm.ptr<6>, i64, i32, i1)
    llvm.return
  }
  llvm.func @nvvm_tcgen05_mma_ws_zero_col_mask(%arg0: !llvm.ptr<6>, %arg1: !llvm.ptr<6>, %arg2: i64, %arg3: i32, %arg4: i1, %arg5: i64) {
    nvvm.tcgen05.mma.ws %arg0, %arg1, %arg2, %arg3, %arg4, %arg5 {kind = #nvvm.tcgen05_mma_kind<f16>} : (!llvm.ptr<6>, !llvm.ptr<6>, i64, i32, i1, i64)
    nvvm.tcgen05.mma.ws %arg0, %arg1, %arg2, %arg3, %arg4, %arg5 {kind = #nvvm.tcgen05_mma_kind<tf32>} : (!llvm.ptr<6>, !llvm.ptr<6>, i64, i32, i1, i64)
    nvvm.tcgen05.mma.ws %arg0, %arg1, %arg2, %arg3, %arg4, %arg5 {kind = #nvvm.tcgen05_mma_kind<f8f6f4>} : (!llvm.ptr<6>, !llvm.ptr<6>, i64, i32, i1, i64)
    nvvm.tcgen05.mma.ws %arg0, %arg1, %arg2, %arg3, %arg4, %arg5 {kind = #nvvm.tcgen05_mma_kind<i8>} : (!llvm.ptr<6>, !llvm.ptr<6>, i64, i32, i1, i64)
    nvvm.tcgen05.mma.ws %arg0, %arg1, %arg2, %arg3, %arg4, %arg5 {collectorBBuffer = #nvvm.tcgen05_mma_collectorb<b1>, kind = #nvvm.tcgen05_mma_kind<f16>} : (!llvm.ptr<6>, !llvm.ptr<6>, i64, i32, i1, i64)
    nvvm.tcgen05.mma.ws %arg0, %arg1, %arg2, %arg3, %arg4, %arg5 {collectorBBuffer = #nvvm.tcgen05_mma_collectorb<b1>, kind = #nvvm.tcgen05_mma_kind<tf32>} : (!llvm.ptr<6>, !llvm.ptr<6>, i64, i32, i1, i64)
    nvvm.tcgen05.mma.ws %arg0, %arg1, %arg2, %arg3, %arg4, %arg5 {collectorBBuffer = #nvvm.tcgen05_mma_collectorb<b1>, kind = #nvvm.tcgen05_mma_kind<f8f6f4>} : (!llvm.ptr<6>, !llvm.ptr<6>, i64, i32, i1, i64)
    nvvm.tcgen05.mma.ws %arg0, %arg1, %arg2, %arg3, %arg4, %arg5 {collectorBBuffer = #nvvm.tcgen05_mma_collectorb<b1>, kind = #nvvm.tcgen05_mma_kind<i8>} : (!llvm.ptr<6>, !llvm.ptr<6>, i64, i32, i1, i64)
    nvvm.tcgen05.mma.ws %arg0, %arg1, %arg2, %arg3, %arg4, %arg5 {collectorBBuffer = #nvvm.tcgen05_mma_collectorb<b1>, collectorOp = #nvvm.tcgen05_mma_collectorop<lastuse>, kind = #nvvm.tcgen05_mma_kind<f16>} : (!llvm.ptr<6>, !llvm.ptr<6>, i64, i32, i1, i64)
    nvvm.tcgen05.mma.ws %arg0, %arg1, %arg2, %arg3, %arg4, %arg5 {collectorBBuffer = #nvvm.tcgen05_mma_collectorb<b1>, collectorOp = #nvvm.tcgen05_mma_collectorop<lastuse>, kind = #nvvm.tcgen05_mma_kind<tf32>} : (!llvm.ptr<6>, !llvm.ptr<6>, i64, i32, i1, i64)
    nvvm.tcgen05.mma.ws %arg0, %arg1, %arg2, %arg3, %arg4, %arg5 {collectorBBuffer = #nvvm.tcgen05_mma_collectorb<b1>, collectorOp = #nvvm.tcgen05_mma_collectorop<lastuse>, kind = #nvvm.tcgen05_mma_kind<f8f6f4>} : (!llvm.ptr<6>, !llvm.ptr<6>, i64, i32, i1, i64)
    nvvm.tcgen05.mma.ws %arg0, %arg1, %arg2, %arg3, %arg4, %arg5 {collectorBBuffer = #nvvm.tcgen05_mma_collectorb<b1>, collectorOp = #nvvm.tcgen05_mma_collectorop<lastuse>, kind = #nvvm.tcgen05_mma_kind<i8>} : (!llvm.ptr<6>, !llvm.ptr<6>, i64, i32, i1, i64)
    llvm.return
  }
}

