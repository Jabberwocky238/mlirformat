module {
  llvm.func @nvvm_special_regs() -> i32 {
    %0 = nvvm.read.ptx.sreg.tid.x : i32
    %1 = nvvm.read.ptx.sreg.tid.y : i32
    %2 = nvvm.read.ptx.sreg.tid.z : i32
    %3 = nvvm.read.ptx.sreg.ntid.x : i32
    %4 = nvvm.read.ptx.sreg.ntid.y : i32
    %5 = nvvm.read.ptx.sreg.ntid.z : i32
    %6 = nvvm.read.ptx.sreg.ctaid.x : i32
    %7 = nvvm.read.ptx.sreg.ctaid.y : i32
    %8 = nvvm.read.ptx.sreg.ctaid.z : i32
    %9 = nvvm.read.ptx.sreg.nctaid.x : i32
    %10 = nvvm.read.ptx.sreg.nctaid.y : i32
    %11 = nvvm.read.ptx.sreg.nctaid.z : i32
    %12 = nvvm.read.ptx.sreg.warpsize : i32
    %13 = nvvm.read.ptx.sreg.laneid : i32
    %14 = nvvm.read.ptx.sreg.clusterid.x : i32
    %15 = nvvm.read.ptx.sreg.clusterid.y : i32
    %16 = nvvm.read.ptx.sreg.clusterid.z : i32
    %17 = nvvm.read.ptx.sreg.nclusterid.x : i32
    %18 = nvvm.read.ptx.sreg.nclusterid.y : i32
    %19 = nvvm.read.ptx.sreg.nclusterid.z : i32
    %20 = nvvm.read.ptx.sreg.cluster.ctaid.x : i32
    %21 = nvvm.read.ptx.sreg.cluster.ctaid.y : i32
    %22 = nvvm.read.ptx.sreg.cluster.ctaid.z : i32
    %23 = nvvm.read.ptx.sreg.cluster.nctaid.x : i32
    %24 = nvvm.read.ptx.sreg.cluster.nctaid.y : i32
    %25 = nvvm.read.ptx.sreg.cluster.nctaid.z : i32
    %26 = nvvm.read.ptx.sreg.cluster.ctarank : i32
    %27 = nvvm.read.ptx.sreg.cluster.nctarank : i32
    %28 = nvvm.read.ptx.sreg.clock : i32
    %29 = nvvm.read.ptx.sreg.clock64 : i64
    %30 = nvvm.read.ptx.sreg.globaltimer : i64
    %31 = nvvm.read.ptx.sreg.globaltimer.lo : i32
    %32 = nvvm.read.ptx.sreg.tid.x range <i32, 0, 64> : i32
    %33 = nvvm.read.ptx.sreg.warpid : i32
    %34 = nvvm.read.ptx.sreg.nwarpid : i32
    %35 = nvvm.read.ptx.sreg.smid : i32
    %36 = nvvm.read.ptx.sreg.nsmid : i32
    %37 = nvvm.read.ptx.sreg.gridid : i32
    %38 = nvvm.read.ptx.sreg.envreg0 : i32
    %39 = nvvm.read.ptx.sreg.envreg1 : i32
    %40 = nvvm.read.ptx.sreg.envreg2 : i32
    %41 = nvvm.read.ptx.sreg.envreg3 : i32
    %42 = nvvm.read.ptx.sreg.envreg4 : i32
    %43 = nvvm.read.ptx.sreg.envreg5 : i32
    %44 = nvvm.read.ptx.sreg.envreg6 : i32
    %45 = nvvm.read.ptx.sreg.envreg7 : i32
    %46 = nvvm.read.ptx.sreg.envreg8 : i32
    %47 = nvvm.read.ptx.sreg.envreg9 : i32
    %48 = nvvm.read.ptx.sreg.envreg10 : i32
    %49 = nvvm.read.ptx.sreg.envreg11 : i32
    %50 = nvvm.read.ptx.sreg.envreg12 : i32
    %51 = nvvm.read.ptx.sreg.envreg13 : i32
    %52 = nvvm.read.ptx.sreg.envreg14 : i32
    %53 = nvvm.read.ptx.sreg.envreg15 : i32
    %54 = nvvm.read.ptx.sreg.envreg16 : i32
    %55 = nvvm.read.ptx.sreg.envreg17 : i32
    %56 = nvvm.read.ptx.sreg.envreg18 : i32
    %57 = nvvm.read.ptx.sreg.envreg19 : i32
    %58 = nvvm.read.ptx.sreg.envreg20 : i32
    %59 = nvvm.read.ptx.sreg.envreg21 : i32
    %60 = nvvm.read.ptx.sreg.envreg22 : i32
    %61 = nvvm.read.ptx.sreg.envreg23 : i32
    %62 = nvvm.read.ptx.sreg.envreg24 : i32
    %63 = nvvm.read.ptx.sreg.envreg25 : i32
    %64 = nvvm.read.ptx.sreg.envreg26 : i32
    %65 = nvvm.read.ptx.sreg.envreg27 : i32
    %66 = nvvm.read.ptx.sreg.envreg28 : i32
    %67 = nvvm.read.ptx.sreg.envreg29 : i32
    %68 = nvvm.read.ptx.sreg.envreg30 : i32
    %69 = nvvm.read.ptx.sreg.envreg31 : i32
    %70 = nvvm.read.ptx.sreg.lanemask.eq : i32
    %71 = nvvm.read.ptx.sreg.lanemask.le : i32
    %72 = nvvm.read.ptx.sreg.lanemask.lt : i32
    %73 = nvvm.read.ptx.sreg.lanemask.ge : i32
    %74 = nvvm.read.ptx.sreg.lanemask.gt : i32
    %75 = nvvm.read.ptx.sreg.tid.x range <i32, 0, 0> : i32
    %76 = nvvm.read.ptx.sreg.tid.x range <i32, -1, -1> : i32
    %77 = nvvm.read.ptx.sreg.total.smem.size : i32
    %78 = nvvm.read.ptx.sreg.dynamic.smem.size : i32
    %79 = nvvm.read.ptx.sreg.aggr.smem.size : i32
    llvm.return %0 : i32
  }
  llvm.func @nvvm_rcp(%arg0: f32) -> f32 {
    %0 = nvvm.rcp.approx.ftz.f %arg0 : f32
    llvm.return %0 : f32
  }
  llvm.func @llvm_nvvm_cluster_arrive() {
    nvvm.cluster.arrive
    nvvm.cluster.arrive {aligned}
    llvm.return
  }
  llvm.func @llvm_nvvm_cluster_arrive_relaxed() {
    nvvm.cluster.arrive.relaxed
    nvvm.cluster.arrive.relaxed {aligned}
    llvm.return
  }
  llvm.func @llvm_nvvm_cluster_wait() {
    nvvm.cluster.wait
    nvvm.cluster.wait {aligned}
    llvm.return
  }
  llvm.func @nvvm_shfl(%arg0: i32, %arg1: i32, %arg2: i32, %arg3: i32, %arg4: f32) -> i32 {
    %0 = nvvm.shfl.sync bfly %arg0, %arg3, %arg1, %arg2 : i32 -> i32
    %1 = nvvm.shfl.sync bfly %arg0, %arg4, %arg1, %arg2 : f32 -> f32
    %2 = nvvm.shfl.sync up %arg0, %arg3, %arg1, %arg2 : i32 -> i32
    %3 = nvvm.shfl.sync up %arg0, %arg4, %arg1, %arg2 : f32 -> f32
    %4 = nvvm.shfl.sync down %arg0, %arg3, %arg1, %arg2 : i32 -> i32
    %5 = nvvm.shfl.sync down %arg0, %arg4, %arg1, %arg2 : f32 -> f32
    %6 = nvvm.shfl.sync idx %arg0, %arg3, %arg1, %arg2 : i32 -> i32
    %7 = nvvm.shfl.sync idx %arg0, %arg4, %arg1, %arg2 : f32 -> f32
    llvm.return %0 : i32
  }
  llvm.func @nvvm_shfl_pred(%arg0: i32, %arg1: i32, %arg2: i32, %arg3: i32, %arg4: f32) -> !llvm.struct<(i32, i1)> {
    %0 = nvvm.shfl.sync bfly %arg0, %arg3, %arg1, %arg2 {return_value_and_is_valid} : i32 -> !llvm.struct<(i32, i1)>
    %1 = nvvm.shfl.sync bfly %arg0, %arg4, %arg1, %arg2 {return_value_and_is_valid} : f32 -> !llvm.struct<(f32, i1)>
    %2 = nvvm.shfl.sync up %arg0, %arg3, %arg1, %arg2 {return_value_and_is_valid} : i32 -> !llvm.struct<(i32, i1)>
    %3 = nvvm.shfl.sync up %arg0, %arg4, %arg1, %arg2 {return_value_and_is_valid} : f32 -> !llvm.struct<(f32, i1)>
    %4 = nvvm.shfl.sync down %arg0, %arg3, %arg1, %arg2 {return_value_and_is_valid} : i32 -> !llvm.struct<(i32, i1)>
    %5 = nvvm.shfl.sync down %arg0, %arg4, %arg1, %arg2 {return_value_and_is_valid} : f32 -> !llvm.struct<(f32, i1)>
    %6 = nvvm.shfl.sync idx %arg0, %arg3, %arg1, %arg2 {return_value_and_is_valid} : i32 -> !llvm.struct<(i32, i1)>
    %7 = nvvm.shfl.sync idx %arg0, %arg4, %arg1, %arg2 {return_value_and_is_valid} : f32 -> !llvm.struct<(f32, i1)>
    llvm.return %0 : !llvm.struct<(i32, i1)>
  }
  llvm.func @nvvm_vote(%arg0: i32, %arg1: i1) -> i32 {
    %0 = nvvm.vote.sync ballot %arg0, %arg1 -> i32
    %1 = nvvm.vote.sync all %arg0, %arg1 -> i1
    %2 = nvvm.vote.sync any %arg0, %arg1 -> i1
    %3 = nvvm.vote.sync uni %arg0, %arg1 -> i1
    llvm.return %0 : i32
  }
  llvm.func @nvvm_mma_mn8n8k4_row_col_f32_f32(%arg0: vector<2xf16>, %arg1: vector<2xf16>, %arg2: vector<2xf16>, %arg3: vector<2xf16>, %arg4: f32, %arg5: f32, %arg6: f32, %arg7: f32, %arg8: f32, %arg9: f32, %arg10: f32, %arg11: f32) -> !llvm.struct<(f32, f32, f32, f32, f32, f32, f32, f32)> {
    %0 = nvvm.mma.sync A[%arg0, %arg1]  B[%arg2, %arg3]  C[%arg4, %arg5, %arg6, %arg7, %arg8, %arg9, %arg10, %arg11]  {layoutA = #nvvm.mma_layout<row>, layoutB = #nvvm.mma_layout<col>, shape = #nvvm.shape<m = 8, n = 8, k = 4>} : (vector<2xf16>, vector<2xf16>, f32) -> !llvm.struct<(f32, f32, f32, f32, f32, f32, f32, f32)>
    llvm.return %0 : !llvm.struct<(f32, f32, f32, f32, f32, f32, f32, f32)>
  }
  llvm.func @nvvm_mma_m16n8k16_f16_f16(%arg0: vector<2xf16>, %arg1: vector<2xf16>, %arg2: vector<2xf16>, %arg3: vector<2xf16>, %arg4: vector<2xf16>, %arg5: vector<2xf16>, %arg6: vector<2xf16>, %arg7: vector<2xf16>) -> !llvm.struct<(vector<2xf16>, vector<2xf16>)> {
    %0 = nvvm.mma.sync A[%arg0, %arg1, %arg2, %arg3]  B[%arg4, %arg5]  C[%arg6, %arg7]  {layoutA = #nvvm.mma_layout<row>, layoutB = #nvvm.mma_layout<col>, shape = #nvvm.shape<m = 16, n = 8, k = 16>} : (vector<2xf16>, vector<2xf16>, vector<2xf16>) -> !llvm.struct<(vector<2xf16>, vector<2xf16>)>
    llvm.return %0 : !llvm.struct<(vector<2xf16>, vector<2xf16>)>
  }
  llvm.func @nvvm_mma_m16n8k16_bf16_bf16(%arg0: i32, %arg1: i32, %arg2: i32, %arg3: i32, %arg4: i32, %arg5: i32, %arg6: f32, %arg7: f32, %arg8: f32, %arg9: f32) -> !llvm.struct<(f32, f32, f32, f32)> {
    %0 = nvvm.mma.sync A[%arg0, %arg1, %arg2, %arg3]  B[%arg4, %arg5]  C[%arg6, %arg7, %arg8, %arg9]  {layoutA = #nvvm.mma_layout<row>, layoutB = #nvvm.mma_layout<col>, multiplicandAPtxType = #nvvm.mma_type<bf16>, multiplicandBPtxType = #nvvm.mma_type<bf16>, shape = #nvvm.shape<m = 16, n = 8, k = 16>} : (i32, i32, f32) -> !llvm.struct<(f32, f32, f32, f32)>
    llvm.return %0 : !llvm.struct<(f32, f32, f32, f32)>
  }
  llvm.func @nvvm_mma_m16n8k16_e4m3_e4m3(%arg0: i32, %arg1: i32, %arg2: i32, %arg3: f32, %arg4: f32, %arg5: f32, %arg6: f32) -> !llvm.struct<(f32, f32, f32, f32)> {
    %0 = nvvm.mma.sync A[%arg0, %arg1]  B[%arg2]  C[%arg3, %arg4, %arg5, %arg6]  {layoutA = #nvvm.mma_layout<row>, layoutB = #nvvm.mma_layout<col>, multiplicandAPtxType = #nvvm.mma_type<e4m3>, multiplicandBPtxType = #nvvm.mma_type<e4m3>, shape = #nvvm.shape<m = 16, n = 8, k = 16>} : (i32, i32, f32) -> !llvm.struct<(f32, f32, f32, f32)>
    llvm.return %0 : !llvm.struct<(f32, f32, f32, f32)>
  }
  llvm.func @nvvm_mma_m16n8k32_e4m3_e5m2(%arg0: i32, %arg1: i32, %arg2: i32, %arg3: i32, %arg4: i32, %arg5: i32, %arg6: f32, %arg7: f32, %arg8: f32, %arg9: f32) -> !llvm.struct<(f32, f32, f32, f32)> {
    %0 = nvvm.mma.sync A[%arg0, %arg1, %arg2, %arg3]  B[%arg4, %arg5]  C[%arg6, %arg7, %arg8, %arg9]  {layoutA = #nvvm.mma_layout<row>, layoutB = #nvvm.mma_layout<col>, multiplicandAPtxType = #nvvm.mma_type<e4m3>, multiplicandBPtxType = #nvvm.mma_type<e5m2>, shape = #nvvm.shape<m = 16, n = 8, k = 32>} : (i32, i32, f32) -> !llvm.struct<(f32, f32, f32, f32)>
    llvm.return %0 : !llvm.struct<(f32, f32, f32, f32)>
  }
  llvm.func @nvvm_mma_m16n8k16_e4m3_e4m3_f16(%arg0: i32, %arg1: i32, %arg2: i32, %arg3: vector<2xf16>, %arg4: vector<2xf16>) -> !llvm.struct<(vector<2xf16>, vector<2xf16>)> {
    %0 = nvvm.mma.sync A[%arg0, %arg1]  B[%arg2]  C[%arg3, %arg4]  {layoutA = #nvvm.mma_layout<row>, layoutB = #nvvm.mma_layout<col>, multiplicandAPtxType = #nvvm.mma_type<e4m3>, multiplicandBPtxType = #nvvm.mma_type<e4m3>, shape = #nvvm.shape<m = 16, n = 8, k = 16>} : (i32, i32, vector<2xf16>) -> !llvm.struct<(vector<2xf16>, vector<2xf16>)>
    llvm.return %0 : !llvm.struct<(vector<2xf16>, vector<2xf16>)>
  }
  llvm.func @nvvm_mma_m16n8k32_e4m3_e5m2_f16(%arg0: i32, %arg1: i32, %arg2: i32, %arg3: i32, %arg4: i32, %arg5: i32, %arg6: vector<2xf16>, %arg7: vector<2xf16>) -> !llvm.struct<(vector<2xf16>, vector<2xf16>)> {
    %0 = nvvm.mma.sync A[%arg0, %arg1, %arg2, %arg3]  B[%arg4, %arg5]  C[%arg6, %arg7]  {layoutA = #nvvm.mma_layout<row>, layoutB = #nvvm.mma_layout<col>, multiplicandAPtxType = #nvvm.mma_type<e4m3>, multiplicandBPtxType = #nvvm.mma_type<e5m2>, shape = #nvvm.shape<m = 16, n = 8, k = 32>} : (i32, i32, vector<2xf16>) -> !llvm.struct<(vector<2xf16>, vector<2xf16>)>
    llvm.return %0 : !llvm.struct<(vector<2xf16>, vector<2xf16>)>
  }
  llvm.func @nvvm_mma_m16n8k16_f32_f32(%arg0: vector<2xf16>, %arg1: vector<2xf16>, %arg2: vector<2xf16>, %arg3: vector<2xf16>, %arg4: vector<2xf16>, %arg5: vector<2xf16>, %arg6: f32, %arg7: f32, %arg8: f32, %arg9: f32) -> !llvm.struct<(f32, f32, f32, f32)> {
    %0 = nvvm.mma.sync A[%arg0, %arg1, %arg2, %arg3]  B[%arg4, %arg5]  C[%arg6, %arg7, %arg8, %arg9]  {layoutA = #nvvm.mma_layout<row>, layoutB = #nvvm.mma_layout<col>, shape = #nvvm.shape<m = 16, n = 8, k = 16>} : (vector<2xf16>, vector<2xf16>, f32) -> !llvm.struct<(f32, f32, f32, f32)>
    llvm.return %0 : !llvm.struct<(f32, f32, f32, f32)>
  }
  llvm.func @nvvm_mma_m16n8k16_s8_s8(%arg0: i32, %arg1: i32, %arg2: i32, %arg3: i32, %arg4: i32, %arg5: i32, %arg6: i32) -> !llvm.struct<(i32, i32, i32, i32)> {
    %0 = nvvm.mma.sync A[%arg0, %arg1]  B[%arg2]  C[%arg3, %arg4, %arg5, %arg6]  {intOverflowBehavior = #nvvm.mma_int_overflow<wrapped>, layoutA = #nvvm.mma_layout<row>, layoutB = #nvvm.mma_layout<col>, multiplicandAPtxType = #nvvm.mma_type<s8>, multiplicandBPtxType = #nvvm.mma_type<s8>, shape = #nvvm.shape<m = 16, n = 8, k = 16>} : (i32, i32, i32) -> !llvm.struct<(i32, i32, i32, i32)>
    llvm.return %0 : !llvm.struct<(i32, i32, i32, i32)>
  }
  llvm.func @nvvm_mma_m16n8k16_s8_u8(%arg0: i32, %arg1: i32, %arg2: i32, %arg3: i32, %arg4: i32, %arg5: i32, %arg6: i32) -> !llvm.struct<(i32, i32, i32, i32)> {
    %0 = nvvm.mma.sync A[%arg0, %arg1]  B[%arg2]  C[%arg3, %arg4, %arg5, %arg6]  {intOverflowBehavior = #nvvm.mma_int_overflow<satfinite>, layoutA = #nvvm.mma_layout<row>, layoutB = #nvvm.mma_layout<col>, multiplicandAPtxType = #nvvm.mma_type<s8>, multiplicandBPtxType = #nvvm.mma_type<u8>, shape = #nvvm.shape<m = 16, n = 8, k = 16>} : (i32, i32, i32) -> !llvm.struct<(i32, i32, i32, i32)>
    llvm.return %0 : !llvm.struct<(i32, i32, i32, i32)>
  }
  llvm.func @nvvm_mma_m16n8k128_b1_b1(%arg0: i32, %arg1: i32, %arg2: i32, %arg3: i32, %arg4: i32, %arg5: i32, %arg6: i32) -> !llvm.struct<(i32, i32, i32, i32)> {
    %0 = nvvm.mma.sync A[%arg0, %arg1]  B[%arg2]  C[%arg3, %arg4, %arg5, %arg6]  {b1Op = #nvvm.mma_b1op<xor_popc>, layoutA = #nvvm.mma_layout<row>, layoutB = #nvvm.mma_layout<col>, multiplicandAPtxType = #nvvm.mma_type<b1>, multiplicandBPtxType = #nvvm.mma_type<b1>, shape = #nvvm.shape<m = 16, n = 8, k = 128>} : (i32, i32, i32) -> !llvm.struct<(i32, i32, i32, i32)>
    llvm.return %0 : !llvm.struct<(i32, i32, i32, i32)>
  }
  llvm.func @nvvm_mma_m16n8k32_s4_s4(%arg0: i32, %arg1: i32, %arg2: i32, %arg3: i32, %arg4: i32, %arg5: i32, %arg6: i32) -> !llvm.struct<(i32, i32, i32, i32)> {
    %0 = nvvm.mma.sync A[%arg0, %arg1]  B[%arg2]  C[%arg3, %arg4, %arg5, %arg6]  {intOverflowBehavior = #nvvm.mma_int_overflow<satfinite>, layoutA = #nvvm.mma_layout<row>, layoutB = #nvvm.mma_layout<col>, multiplicandAPtxType = #nvvm.mma_type<s4>, multiplicandBPtxType = #nvvm.mma_type<s4>, shape = #nvvm.shape<m = 16, n = 8, k = 32>} : (i32, i32, i32) -> !llvm.struct<(i32, i32, i32, i32)>
    llvm.return %0 : !llvm.struct<(i32, i32, i32, i32)>
  }
  llvm.func @nvvm_mma_m8n8k4_f64_f64(%arg0: f64, %arg1: f64, %arg2: f64, %arg3: f64) -> !llvm.struct<(f64, f64)> {
    %0 = nvvm.mma.sync A[%arg0]  B[%arg1]  C[%arg2, %arg3]  {layoutA = #nvvm.mma_layout<row>, layoutB = #nvvm.mma_layout<col>, shape = #nvvm.shape<m = 8, n = 8, k = 4>} : (f64, f64, f64) -> !llvm.struct<(f64, f64)>
    llvm.return %0 : !llvm.struct<(f64, f64)>
  }
  llvm.func @nvvm_mma_m16n8k4_tf32_f32(%arg0: i32, %arg1: i32, %arg2: i32, %arg3: f32, %arg4: f32, %arg5: f32, %arg6: f32) -> !llvm.struct<(f32, f32, f32, f32)> {
    %0 = nvvm.mma.sync A[%arg0, %arg1]  B[%arg2]  C[%arg3, %arg4, %arg5, %arg6]  {layoutA = #nvvm.mma_layout<row>, layoutB = #nvvm.mma_layout<col>, multiplicandAPtxType = #nvvm.mma_type<tf32>, multiplicandBPtxType = #nvvm.mma_type<tf32>, shape = #nvvm.shape<m = 16, n = 8, k = 4>} : (i32, i32, f32) -> !llvm.struct<(f32, f32, f32, f32)>
    llvm.return %0 : !llvm.struct<(f32, f32, f32, f32)>
  }
  llvm.func @gpu_wmma_load_op(%arg0: !llvm.ptr<3>, %arg1: i32) {
    %0 = nvvm.wmma.load %arg0, %arg1 {eltype = #nvvm.mma_type<f16>, frag = #nvvm.mma_frag<a>, k = 16 : i32, layout = #nvvm.mma_layout<row>, m = 16 : i32, n = 16 : i32} : (!llvm.ptr<3>) -> !llvm.struct<(vector<2xf16>, vector<2xf16>, vector<2xf16>, vector<2xf16>, vector<2xf16>, vector<2xf16>, vector<2xf16>, vector<2xf16>)>
    llvm.return
  }
  llvm.func @gpu_wmma_store_op(%arg0: !llvm.ptr<3>, %arg1: i32, %arg2: vector<2xf16>, %arg3: vector<2xf16>, %arg4: vector<2xf16>, %arg5: vector<2xf16>) {
    nvvm.wmma.store %arg0, %arg1, %arg2, %arg3, %arg4, %arg5 {eltype = #nvvm.mma_type<f16>, k = 16 : i32, layout = #nvvm.mma_layout<row>, m = 16 : i32, n = 16 : i32} : !llvm.ptr<3>, vector<2xf16>, vector<2xf16>, vector<2xf16>, vector<2xf16>
    llvm.return
  }
  llvm.func @gpu_wmma_mma_op(%arg0: vector<2xf16>, %arg1: vector<2xf16>, %arg2: vector<2xf16>, %arg3: vector<2xf16>, %arg4: vector<2xf16>, %arg5: vector<2xf16>, %arg6: vector<2xf16>, %arg7: vector<2xf16>, %arg8: vector<2xf16>, %arg9: vector<2xf16>, %arg10: vector<2xf16>, %arg11: vector<2xf16>, %arg12: vector<2xf16>, %arg13: vector<2xf16>, %arg14: vector<2xf16>, %arg15: vector<2xf16>, %arg16: vector<2xf16>, %arg17: vector<2xf16>, %arg18: vector<2xf16>, %arg19: vector<2xf16>) {
    %0 = nvvm.wmma.mma %arg0, %arg1, %arg2, %arg3, %arg4, %arg5, %arg6, %arg7, %arg8, %arg9, %arg10, %arg11, %arg12, %arg13, %arg14, %arg15, %arg16, %arg17, %arg18, %arg19 {eltypeA = #nvvm.mma_type<f16>, eltypeB = #nvvm.mma_type<f16>, k = 16 : i32, layoutA = #nvvm.mma_layout<row>, layoutB = #nvvm.mma_layout<row>, m = 16 : i32, n = 16 : i32} : (vector<2xf16>, vector<2xf16>, vector<2xf16>, vector<2xf16>, vector<2xf16>, vector<2xf16>, vector<2xf16>, vector<2xf16>, vector<2xf16>, vector<2xf16>, vector<2xf16>, vector<2xf16>, vector<2xf16>, vector<2xf16>, vector<2xf16>, vector<2xf16>, vector<2xf16>, vector<2xf16>, vector<2xf16>, vector<2xf16>) -> !llvm.struct<(vector<2xf16>, vector<2xf16>, vector<2xf16>, vector<2xf16>)>
    llvm.return
  }
  llvm.func @nvvm_wmma_load_tf32(%arg0: !llvm.ptr, %arg1: i32) {
    %0 = nvvm.wmma.load %arg0, %arg1 {eltype = #nvvm.mma_type<tf32>, frag = #nvvm.mma_frag<a>, k = 8 : i32, layout = #nvvm.mma_layout<row>, m = 16 : i32, n = 16 : i32} : (!llvm.ptr) -> !llvm.struct<(i32, i32, i32, i32)>
    llvm.return
  }
  llvm.func @nvvm_wmma_mma(%arg0: i32, %arg1: i32, %arg2: i32, %arg3: i32, %arg4: i32, %arg5: i32, %arg6: i32, %arg7: i32, %arg8: f32, %arg9: f32, %arg10: f32, %arg11: f32, %arg12: f32, %arg13: f32, %arg14: f32, %arg15: f32) {
    %0 = nvvm.wmma.mma %arg0, %arg1, %arg2, %arg3, %arg4, %arg5, %arg6, %arg7, %arg8, %arg9, %arg10, %arg11, %arg12, %arg13, %arg14, %arg15 {eltypeA = #nvvm.mma_type<tf32>, eltypeB = #nvvm.mma_type<f32>, k = 8 : i32, layoutA = #nvvm.mma_layout<row>, layoutB = #nvvm.mma_layout<row>, m = 16 : i32, n = 16 : i32} : (i32, i32, i32, i32, i32, i32, i32, i32, f32, f32, f32, f32, f32, f32, f32, f32) -> !llvm.struct<(f32, f32, f32, f32, f32, f32, f32, f32)>
    llvm.return
  }
  llvm.func @nvvm_wmma_load_a_f64(%arg0: !llvm.ptr, %arg1: i32) {
    %0 = nvvm.wmma.load %arg0, %arg1 {eltype = #nvvm.mma_type<f64>, frag = #nvvm.mma_frag<a>, k = 4 : i32, layout = #nvvm.mma_layout<row>, m = 8 : i32, n = 8 : i32} : (!llvm.ptr) -> f64
    llvm.return
  }
  llvm.func @nvvm_wmma_load_c_f64(%arg0: !llvm.ptr, %arg1: i32) {
    %0 = nvvm.wmma.load %arg0, %arg1 {eltype = #nvvm.mma_type<f64>, frag = #nvvm.mma_frag<c>, k = 4 : i32, layout = #nvvm.mma_layout<row>, m = 8 : i32, n = 8 : i32} : (!llvm.ptr) -> !llvm.struct<(f64, f64)>
    llvm.return
  }
  llvm.func @nvvm_wmma_mma_f64(%arg0: f64, %arg1: f64, %arg2: f64, %arg3: f64) {
    %0 = nvvm.wmma.mma %arg0, %arg1, %arg2, %arg3 {eltypeA = #nvvm.mma_type<f64>, eltypeB = #nvvm.mma_type<f64>, k = 4 : i32, layoutA = #nvvm.mma_layout<row>, layoutB = #nvvm.mma_layout<col>, m = 8 : i32, n = 8 : i32} : (f64, f64, f64, f64) -> !llvm.struct<(f64, f64)>
    llvm.return
  }
  llvm.func @nvvm_wmma_store_d_f64(%arg0: !llvm.ptr, %arg1: i32, %arg2: f64, %arg3: f64) {
    nvvm.wmma.store %arg0, %arg1, %arg2, %arg3 {eltype = #nvvm.mma_type<f64>, k = 4 : i32, layout = #nvvm.mma_layout<row>, m = 8 : i32, n = 8 : i32} : !llvm.ptr, f64, f64
    llvm.return
  }
  llvm.func @cp_async(%arg0: !llvm.ptr<3>, %arg1: !llvm.ptr<1>) {
    nvvm.cp.async.shared.global %arg0, %arg1, 4, cache = ca : !llvm.ptr<3>, !llvm.ptr<1>
    nvvm.cp.async.shared.global %arg0, %arg1, 8, cache = ca : !llvm.ptr<3>, !llvm.ptr<1>
    nvvm.cp.async.shared.global %arg0, %arg1, 16, cache = ca : !llvm.ptr<3>, !llvm.ptr<1>
    nvvm.cp.async.shared.global %arg0, %arg1, 16, cache = cg : !llvm.ptr<3>, !llvm.ptr<1>
    nvvm.cp.async.commit.group
    nvvm.cp.async.wait.group 0
    llvm.return
  }
  llvm.func @async_cp_zfill(%arg0: !llvm.ptr<3>, %arg1: !llvm.ptr<1>, %arg2: i32) {
    nvvm.cp.async.shared.global %arg0, %arg1, 4, cache = ca, %arg2 : !llvm.ptr<3>, !llvm.ptr<1>, i32
    nvvm.cp.async.shared.global %arg0, %arg1, 8, cache = ca, %arg2 : !llvm.ptr<3>, !llvm.ptr<1>, i32
    nvvm.cp.async.shared.global %arg0, %arg1, 16, cache = ca, %arg2 : !llvm.ptr<3>, !llvm.ptr<1>, i32
    nvvm.cp.async.shared.global %arg0, %arg1, 16, cache = cg, %arg2 : !llvm.ptr<3>, !llvm.ptr<1>, i32
    llvm.return
  }
  llvm.func @llvm_nvvm_setmaxregister() {
    nvvm.setmaxregister increase 256
    nvvm.setmaxregister decrease 24
    llvm.return
  }
  llvm.func @llvm_nvvm_cp_async_bulk_commit_group() {
    nvvm.cp.async.bulk.commit.group
    llvm.return
  }
  llvm.func @llvm_nvvm_cp_async_bulk_wait_group() {
    nvvm.cp.async.bulk.wait_group 0
    nvvm.cp.async.bulk.wait_group 3
    nvvm.cp.async.bulk.wait_group 0 {read}
    nvvm.cp.async.bulk.wait_group 3 {read}
    llvm.return
  }
  llvm.func @ld_matrix(%arg0: !llvm.ptr<3>) {
    %0 = nvvm.ldmatrix %arg0 {eltType = #nvvm.ld_st_matrix_elt_type<b16>, layout = #nvvm.mma_layout<row>, num = 1 : i32, shape = #nvvm.ld_st_matrix_shape<m = 8, n = 8>} : (!llvm.ptr<3>) -> i32
    %1 = nvvm.ldmatrix %arg0 {eltType = #nvvm.ld_st_matrix_elt_type<b16>, layout = #nvvm.mma_layout<row>, num = 2 : i32, shape = #nvvm.ld_st_matrix_shape<m = 8, n = 8>} : (!llvm.ptr<3>) -> !llvm.struct<(i32, i32)>
    %2 = nvvm.ldmatrix %arg0 {eltType = #nvvm.ld_st_matrix_elt_type<b16>, layout = #nvvm.mma_layout<row>, num = 4 : i32, shape = #nvvm.ld_st_matrix_shape<m = 8, n = 8>} : (!llvm.ptr<3>) -> !llvm.struct<(i32, i32, i32, i32)>
    %3 = nvvm.ldmatrix %arg0 {eltType = #nvvm.ld_st_matrix_elt_type<b16>, layout = #nvvm.mma_layout<col>, num = 1 : i32, shape = #nvvm.ld_st_matrix_shape<m = 8, n = 8>} : (!llvm.ptr<3>) -> i32
    %4 = nvvm.ldmatrix %arg0 {eltType = #nvvm.ld_st_matrix_elt_type<b16>, layout = #nvvm.mma_layout<col>, num = 2 : i32, shape = #nvvm.ld_st_matrix_shape<m = 8, n = 8>} : (!llvm.ptr<3>) -> !llvm.struct<(i32, i32)>
    %5 = nvvm.ldmatrix %arg0 {eltType = #nvvm.ld_st_matrix_elt_type<b16>, layout = #nvvm.mma_layout<col>, num = 4 : i32, shape = #nvvm.ld_st_matrix_shape<m = 8, n = 8>} : (!llvm.ptr<3>) -> !llvm.struct<(i32, i32, i32, i32)>
    %6 = nvvm.ldmatrix %arg0 {eltType = #nvvm.ld_st_matrix_elt_type<b8x16.b6x16_p32>, layout = #nvvm.mma_layout<row>, num = 1 : i32, shape = #nvvm.ld_st_matrix_shape<m = 8, n = 16>} : (!llvm.ptr<3>) -> i32
    %7 = nvvm.ldmatrix %arg0 {eltType = #nvvm.ld_st_matrix_elt_type<b8x16.b6x16_p32>, layout = #nvvm.mma_layout<row>, num = 2 : i32, shape = #nvvm.ld_st_matrix_shape<m = 8, n = 16>} : (!llvm.ptr<3>) -> !llvm.struct<(i32, i32)>
    %8 = nvvm.ldmatrix %arg0 {eltType = #nvvm.ld_st_matrix_elt_type<b8x16.b6x16_p32>, layout = #nvvm.mma_layout<row>, num = 4 : i32, shape = #nvvm.ld_st_matrix_shape<m = 8, n = 16>} : (!llvm.ptr<3>) -> !llvm.struct<(i32, i32, i32, i32)>
    %9 = nvvm.ldmatrix %arg0 {eltType = #nvvm.ld_st_matrix_elt_type<b8x16.b4x16_p64>, layout = #nvvm.mma_layout<row>, num = 1 : i32, shape = #nvvm.ld_st_matrix_shape<m = 8, n = 16>} : (!llvm.ptr<3>) -> i32
    %10 = nvvm.ldmatrix %arg0 {eltType = #nvvm.ld_st_matrix_elt_type<b8x16.b4x16_p64>, layout = #nvvm.mma_layout<row>, num = 2 : i32, shape = #nvvm.ld_st_matrix_shape<m = 8, n = 16>} : (!llvm.ptr<3>) -> !llvm.struct<(i32, i32)>
    %11 = nvvm.ldmatrix %arg0 {eltType = #nvvm.ld_st_matrix_elt_type<b8x16.b4x16_p64>, layout = #nvvm.mma_layout<row>, num = 4 : i32, shape = #nvvm.ld_st_matrix_shape<m = 8, n = 16>} : (!llvm.ptr<3>) -> !llvm.struct<(i32, i32, i32, i32)>
    %12 = nvvm.ldmatrix %arg0 {eltType = #nvvm.ld_st_matrix_elt_type<b8>, layout = #nvvm.mma_layout<col>, num = 1 : i32, shape = #nvvm.ld_st_matrix_shape<m = 16, n = 16>} : (!llvm.ptr<3>) -> !llvm.struct<(i32, i32)>
    %13 = nvvm.ldmatrix %arg0 {eltType = #nvvm.ld_st_matrix_elt_type<b8>, layout = #nvvm.mma_layout<col>, num = 2 : i32, shape = #nvvm.ld_st_matrix_shape<m = 16, n = 16>} : (!llvm.ptr<3>) -> !llvm.struct<(i32, i32, i32, i32)>
    %14 = nvvm.ldmatrix %arg0 {eltType = #nvvm.ld_st_matrix_elt_type<b8x16.b6x16_p32>, layout = #nvvm.mma_layout<col>, num = 1 : i32, shape = #nvvm.ld_st_matrix_shape<m = 16, n = 16>} : (!llvm.ptr<3>) -> !llvm.struct<(i32, i32)>
    %15 = nvvm.ldmatrix %arg0 {eltType = #nvvm.ld_st_matrix_elt_type<b8x16.b6x16_p32>, layout = #nvvm.mma_layout<col>, num = 2 : i32, shape = #nvvm.ld_st_matrix_shape<m = 16, n = 16>} : (!llvm.ptr<3>) -> !llvm.struct<(i32, i32, i32, i32)>
    %16 = nvvm.ldmatrix %arg0 {eltType = #nvvm.ld_st_matrix_elt_type<b8x16.b4x16_p64>, layout = #nvvm.mma_layout<col>, num = 1 : i32, shape = #nvvm.ld_st_matrix_shape<m = 16, n = 16>} : (!llvm.ptr<3>) -> !llvm.struct<(i32, i32)>
    %17 = nvvm.ldmatrix %arg0 {eltType = #nvvm.ld_st_matrix_elt_type<b8x16.b4x16_p64>, layout = #nvvm.mma_layout<col>, num = 2 : i32, shape = #nvvm.ld_st_matrix_shape<m = 16, n = 16>} : (!llvm.ptr<3>) -> !llvm.struct<(i32, i32, i32, i32)>
    llvm.return
  }
  llvm.func @st_matrix(%arg0: !llvm.ptr<3>, %arg1: i32, %arg2: i32, %arg3: i32, %arg4: i32) {
    nvvm.stmatrix %arg0, %arg1 {eltType = #nvvm.ld_st_matrix_elt_type<b16>, layout = #nvvm.mma_layout<row>, shape = #nvvm.ld_st_matrix_shape<m = 8, n = 8>} : !llvm.ptr<3>, i32
    nvvm.stmatrix %arg0, %arg1 {eltType = #nvvm.ld_st_matrix_elt_type<b16>, layout = #nvvm.mma_layout<col>, shape = #nvvm.ld_st_matrix_shape<m = 8, n = 8>} : !llvm.ptr<3>, i32
    nvvm.stmatrix %arg0, %arg1 {eltType = #nvvm.ld_st_matrix_elt_type<b8>, layout = #nvvm.mma_layout<col>, shape = #nvvm.ld_st_matrix_shape<m = 16, n = 8>} : !llvm.ptr<3>, i32
    nvvm.stmatrix %arg0, %arg1, %arg2 {eltType = #nvvm.ld_st_matrix_elt_type<b16>, layout = #nvvm.mma_layout<row>, shape = #nvvm.ld_st_matrix_shape<m = 8, n = 8>} : !llvm.ptr<3>, i32, i32
    nvvm.stmatrix %arg0, %arg1, %arg2 {eltType = #nvvm.ld_st_matrix_elt_type<b16>, layout = #nvvm.mma_layout<col>, shape = #nvvm.ld_st_matrix_shape<m = 8, n = 8>} : !llvm.ptr<3>, i32, i32
    nvvm.stmatrix %arg0, %arg1, %arg2 {eltType = #nvvm.ld_st_matrix_elt_type<b8>, layout = #nvvm.mma_layout<col>, shape = #nvvm.ld_st_matrix_shape<m = 16, n = 8>} : !llvm.ptr<3>, i32, i32
    nvvm.stmatrix %arg0, %arg1, %arg2, %arg3, %arg4 {eltType = #nvvm.ld_st_matrix_elt_type<b16>, layout = #nvvm.mma_layout<row>, shape = #nvvm.ld_st_matrix_shape<m = 8, n = 8>} : !llvm.ptr<3>, i32, i32, i32, i32
    nvvm.stmatrix %arg0, %arg1, %arg2, %arg3, %arg4 {eltType = #nvvm.ld_st_matrix_elt_type<b16>, layout = #nvvm.mma_layout<col>, shape = #nvvm.ld_st_matrix_shape<m = 8, n = 8>} : !llvm.ptr<3>, i32, i32, i32, i32
    nvvm.stmatrix %arg0, %arg1, %arg2, %arg3, %arg4 {eltType = #nvvm.ld_st_matrix_elt_type<b8>, layout = #nvvm.mma_layout<col>, shape = #nvvm.ld_st_matrix_shape<m = 16, n = 8>} : !llvm.ptr<3>, i32, i32, i32, i32
    llvm.return
  }
  llvm.func @nvvm_movmatrix(%arg0: i32) -> i32 {
    %0 = nvvm.movmatrix %arg0 {eltType = #nvvm.ld_st_matrix_elt_type<b16>, shape = #nvvm.ld_st_matrix_shape<m = 8, n = 8>} : i32
    llvm.return %0 : i32
  }
  llvm.func @kernel_func() attributes {nvvm.kernel} {
    llvm.return
  }
}

// -----
module {
  llvm.func @kernel_func() attributes {nvvm.kernel, nvvm.maxntid = array<i32: 1, 23, 32>} {
    llvm.return
  }
}

// -----
module {
  llvm.func @kernel_func() attributes {nvvm.kernel, nvvm.reqntid = array<i32: 1, 23, 32>} {
    llvm.return
  }
}

// -----
module {
  llvm.func @kernel_func() attributes {nvvm.cluster_dim = array<i32: 3, 5, 7>, nvvm.kernel} {
    llvm.return
  }
}

// -----
module {
  llvm.func @kernel_func() attributes {nvvm.cluster_max_blocks = 8 : i64, nvvm.kernel} {
    llvm.return
  }
}

// -----
module {
  llvm.func @kernel_func() attributes {nvvm.kernel, nvvm.minctasm = 16 : i64} {
    llvm.return
  }
}

// -----
module {
  llvm.func @kernel_func() attributes {nvvm.kernel, nvvm.maxnreg = 16 : i64} {
    llvm.return
  }
}

// -----
module {
  llvm.func @kernel_func() attributes {nvvm.kernel, nvvm.maxnreg = 32 : i64, nvvm.maxntid = array<i32: 1, 23, 32>, nvvm.minctasm = 16 : i64} {
    llvm.return
  }
}

// -----
module {
  llvm.func @kernel_func() attributes {nvvm.blocksareclusters, nvvm.cluster_dim = array<i32: 3, 5, 7>, nvvm.kernel, nvvm.reqntid = array<i32: 1, 23, 32>} {
    llvm.return
  }
}

// -----
module {
  llvm.func @kernel_func(%arg0: !llvm.ptr {llvm.byval = i32, nvvm.grid_constant}) attributes {nvvm.kernel} {
    llvm.return
  }
}

// -----
module {
  llvm.func @kernel_func(%arg0: !llvm.ptr {llvm.byval = i32, nvvm.grid_constant}, %arg1: f32, %arg2: !llvm.ptr {llvm.byval = f32, nvvm.grid_constant}) attributes {nvvm.kernel} {
    llvm.return
  }
}

// -----
module {
  llvm.func @nvvm_exit() {
    nvvm.exit
    llvm.return
  }
}

// -----
module {
  llvm.func @nvvm_breakpoint() {
    nvvm.breakpoint
    llvm.return
  }
}

// -----
module {
  llvm.func @nvvm_wgmma_fence_aligned() {
    nvvm.wgmma.fence.aligned
    llvm.return
  }
}

// -----
module {
  llvm.func @nvvm_wgmma_commit_group_aligned() {
    nvvm.wgmma.commit.group.sync.aligned
    llvm.return
  }
}

// -----
module {
  llvm.func @nvvm_wgmma_wait_group_aligned() {
    nvvm.wgmma.wait.group.sync.aligned 0
    nvvm.wgmma.wait.group.sync.aligned 20
    llvm.return
  }
}

// -----
module {
  llvm.func @nvvm_griddepcontrol_wait() {
    nvvm.griddepcontrol wait
    llvm.return
  }
}

// -----
module {
  llvm.func @nvvm_griddepcontrol_launch_dependents() {
    nvvm.griddepcontrol launch_dependents
    llvm.return
  }
}

// -----
module {
  llvm.func @nvvm_mapa(%arg0: !llvm.ptr, %arg1: !llvm.ptr<3>, %arg2: i32) {
    %0 = nvvm.mapa %arg0, %arg2 : !llvm.ptr -> !llvm.ptr
    %1 = nvvm.mapa %arg1, %arg2 : !llvm.ptr<3> -> !llvm.ptr<7>
    llvm.return
  }
}

// -----
module {
  llvm.func @nvvm_redux_sync(%arg0: i32, %arg1: i32) {
    %0 = nvvm.redux.sync add %arg0, %arg1 : i32 -> i32
    %1 = nvvm.redux.sync umax %arg0, %arg1 : i32 -> i32
    %2 = nvvm.redux.sync umin %arg0, %arg1 : i32 -> i32
    %3 = nvvm.redux.sync and %arg0, %arg1 : i32 -> i32
    %4 = nvvm.redux.sync or %arg0, %arg1 : i32 -> i32
    %5 = nvvm.redux.sync xor %arg0, %arg1 : i32 -> i32
    %6 = nvvm.redux.sync max %arg0, %arg1 : i32 -> i32
    %7 = nvvm.redux.sync min %arg0, %arg1 : i32 -> i32
    llvm.return
  }
  llvm.func @nvvm_redux_sync_f32(%arg0: f32, %arg1: i32) {
    %0 = nvvm.redux.sync fmin %arg0, %arg1 : f32 -> f32
    %1 = nvvm.redux.sync fmin %arg0, %arg1 {abs = true} : f32 -> f32
    %2 = nvvm.redux.sync fmin %arg0, %arg1 {nan = true} : f32 -> f32
    %3 = nvvm.redux.sync fmin %arg0, %arg1 {abs = true, nan = true} : f32 -> f32
    %4 = nvvm.redux.sync fmax %arg0, %arg1 : f32 -> f32
    %5 = nvvm.redux.sync fmax %arg0, %arg1 {abs = true} : f32 -> f32
    %6 = nvvm.redux.sync fmax %arg0, %arg1 {nan = true} : f32 -> f32
    %7 = nvvm.redux.sync fmax %arg0, %arg1 {abs = true, nan = true} : f32 -> f32
    llvm.return
  }
}

// -----
module {
  llvm.func @nvvm_match_sync(%arg0: i32, %arg1: i32, %arg2: i64) {
    %0 = nvvm.match.sync any %arg0, %arg1 : i32 -> i32
    %1 = nvvm.match.sync all %arg0, %arg1 : i32 -> !llvm.struct<(i32, i1)>
    %2 = nvvm.match.sync any %arg0, %arg2 : i64 -> i32
    %3 = nvvm.match.sync all %arg0, %arg2 : i64 -> !llvm.struct<(i32, i1)>
    llvm.return
  }
}

// -----
module {
  llvm.func @nvvm_st_bulk(%arg0: !llvm.ptr, %arg1: !llvm.ptr<3>, %arg2: i64) {
    nvvm.st.bulk %arg0, size = %arg2 : !llvm.ptr
    nvvm.st.bulk %arg1, size = %arg2 : !llvm.ptr<3>
    nvvm.st.bulk %arg0, size = %arg2 : !llvm.ptr
    nvvm.st.bulk %arg1, size = %arg2 : !llvm.ptr<3>
    llvm.return
  }
}

// -----
module {
  llvm.func @nvvm_dot_accumulate_4way(%arg0: vector<4xi8>, %arg1: vector<4xi8>, %arg2: i32) {
    %0 = nvvm.dot.accumulate.4way %arg0 <unsigned>, %arg1 <unsigned>, %arg2 : vector<4xi8>, vector<4xi8>
    %1 = nvvm.dot.accumulate.4way %arg0 <signed>, %arg1 <unsigned>, %arg2 : vector<4xi8>, vector<4xi8>
    %2 = nvvm.dot.accumulate.4way %arg0 <unsigned>, %arg1 <signed>, %arg2 : vector<4xi8>, vector<4xi8>
    %3 = nvvm.dot.accumulate.4way %arg0 <signed>, %arg1 <signed>, %arg2 : vector<4xi8>, vector<4xi8>
    llvm.return
  }
}

// -----
module {
  llvm.func @nvvm_dot_accumulate_2way(%arg0: vector<2xi16>, %arg1: vector<4xi8>, %arg2: i32) {
    %0 = nvvm.dot.accumulate.2way %arg0 <unsigned>, %arg1 <unsigned>, %arg2 {b_hi = false} : vector<2xi16>, vector<4xi8>
    %1 = nvvm.dot.accumulate.2way %arg0 <unsigned>, %arg1 <unsigned>, %arg2 {b_hi = true} : vector<2xi16>, vector<4xi8>
    %2 = nvvm.dot.accumulate.2way %arg0 <signed>, %arg1 <unsigned>, %arg2 {b_hi = false} : vector<2xi16>, vector<4xi8>
    %3 = nvvm.dot.accumulate.2way %arg0 <signed>, %arg1 <unsigned>, %arg2 {b_hi = true} : vector<2xi16>, vector<4xi8>
    %4 = nvvm.dot.accumulate.2way %arg0 <unsigned>, %arg1 <signed>, %arg2 {b_hi = false} : vector<2xi16>, vector<4xi8>
    %5 = nvvm.dot.accumulate.2way %arg0 <unsigned>, %arg1 <signed>, %arg2 {b_hi = true} : vector<2xi16>, vector<4xi8>
    %6 = nvvm.dot.accumulate.2way %arg0 <signed>, %arg1 <signed>, %arg2 {b_hi = false} : vector<2xi16>, vector<4xi8>
    %7 = nvvm.dot.accumulate.2way %arg0 <signed>, %arg1 <signed>, %arg2 {b_hi = true} : vector<2xi16>, vector<4xi8>
    llvm.return
  }
}

// -----
module {
  llvm.func @nanosleep(%arg0: i32) {
    nvvm.nanosleep %arg0
    llvm.return
  }
}

// -----
module {
  llvm.mlir.global external @managed_g(0 : i32) {addr_space = 1 : i32, nvvm.managed} : i32
  llvm.mlir.global external @managed_decl() {addr_space = 1 : i32, nvvm.managed} : i32
}

