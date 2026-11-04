module {
  func.func @nvvm_special_regs() -> i32 {
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
    llvm.return %0 : i32
  }
  func.func @nvvm_rcp(%arg0: f32) -> f32 {
    %0 = nvvm.rcp.approx.ftz.f %arg0 : f32
    llvm.return %0 : f32
  }
  func.func @llvm_nvvm_barrier0() {
    nvvm.barrier0
    llvm.return
  }
  llvm.func @llvm_nvvm_barrier(%arg0: i32, %arg1: i32) {
    nvvm.barrier
    nvvm.barrier id = %arg0
    nvvm.barrier id = %arg0 number_of_threads = %arg1
    llvm.return
  }
  llvm.func @llvm_nvvm_barrier_arrive(%arg0: i32, %arg1: i32) {
    nvvm.barrier.arrive number_of_threads = %arg1
    nvvm.barrier.arrive id = %arg0 number_of_threads = %arg1
    llvm.return
  }
  func.func @llvm_nvvm_cluster_arrive() {
    nvvm.cluster.arrive
    nvvm.cluster.arrive {aligned}
    llvm.return
  }
  func.func @llvm_nvvm_cluster_arrive_relaxed() {
    nvvm.cluster.arrive.relaxed
    nvvm.cluster.arrive.relaxed {aligned}
    llvm.return
  }
  func.func @llvm_nvvm_cluster_wait() {
    nvvm.cluster.wait
    nvvm.cluster.wait {aligned}
    llvm.return
  }
  func.func @nvvm_shfl(%arg0: i32, %arg1: i32, %arg2: i32, %arg3: i32, %arg4: f32) -> i32 {
    %0 = nvvm.shfl.sync  bfly %arg0, %arg3, %arg1, %arg2 : i32 -> i32
    %1 = nvvm.shfl.sync  bfly %arg0, %arg4, %arg1, %arg2 : f32 -> f32
    %2 = nvvm.shfl.sync  up %arg0, %arg4, %arg1, %arg2 : f32 -> f32
    %3 = nvvm.shfl.sync  down %arg0, %arg4, %arg1, %arg2 : f32 -> f32
    %4 = nvvm.shfl.sync  idx %arg0, %arg4, %arg1, %arg2 : f32 -> f32
    llvm.return %0 : i32
  }
  func.func @nvvm_shfl_pred(%arg0: i32, %arg1: i32, %arg2: i32, %arg3: i32, %arg4: f32) -> !llvm.struct<(i32, i1)> {
    %0 = nvvm.shfl.sync  bfly %arg0, %arg3, %arg1, %arg2 {return_value_and_is_valid} : i32 -> !llvm.struct<(i32, i1)>
    %1 = nvvm.shfl.sync  bfly %arg0, %arg4, %arg1, %arg2 {return_value_and_is_valid} : f32 -> !llvm.struct<(f32, i1)>
    llvm.return %0 : !llvm.struct<(i32, i1)>
  }
  func.func @nvvm_vote(%arg0: i32, %arg1: i1) -> i32 {
    %0 = nvvm.vote.sync  ballot %arg0, %arg1 -> i32
    %1 = nvvm.vote.sync  all %arg0, %arg1 -> i1
    %2 = nvvm.vote.sync  any %arg0, %arg1 -> i1
    %3 = nvvm.vote.sync  uni %arg0, %arg1 -> i1
    llvm.return %0 : i32
  }
  func.func @llvm_nvvm_bar_warp_sync(%arg0: i32) {
    nvvm.bar.warp.sync %arg0 : i32
    llvm.return
  }
  func.func @nvvm_mma_m8n8k4_row_col_f32_f32(%arg0: vector<2xf16>, %arg1: vector<2xf16>, %arg2: vector<2xf16>, %arg3: vector<2xf16>, %arg4: f32, %arg5: f32, %arg6: f32, %arg7: f32, %arg8: f32, %arg9: f32, %arg10: f32, %arg11: f32) {
    %0 = nvvm.mma.sync A[%arg0, %arg1]  B[%arg2, %arg3]  C[%arg4, %arg5, %arg6, %arg7, %arg8, %arg9, %arg10, %arg11]  {layoutA = #nvvm.mma_layout<row>, layoutB = #nvvm.mma_layout<col>, shape = #nvvm.shape<m = 8, n = 8, k = 4>} : (vector<2xf16>, vector<2xf16>, f32) -> !llvm.struct<(f32, f32, f32, f32, f32, f32, f32, f32)>
    llvm.return %0 : !llvm.struct<(f32, f32, f32, f32, f32, f32, f32, f32)>
  }
  func.func @nvvm_mma_m8n8k4_f16_f16(%arg0: vector<2xf16>, %arg1: vector<2xf16>, %arg2: vector<2xf16>, %arg3: vector<2xf16>, %arg4: vector<2xf16>, %arg5: vector<2xf16>, %arg6: vector<2xf16>, %arg7: vector<2xf16>) {
    %0 = nvvm.mma.sync A[%arg0, %arg1]  B[%arg2, %arg3]  C[%arg4, %arg5, %arg6, %arg7]  {layoutA = #nvvm.mma_layout<row>, layoutB = #nvvm.mma_layout<col>, shape = #nvvm.shape<m = 8, n = 8, k = 4>} : (vector<2xf16>, vector<2xf16>, vector<2xf16>) -> !llvm.struct<(vector<2xf16>, vector<2xf16>, vector<2xf16>, vector<2xf16>)>
    llvm.return %0 : !llvm.struct<(vector<2xf16>, vector<2xf16>, vector<2xf16>, vector<2xf16>)>
  }
  func.func @nvvm_mma_m16n8k8_bf16_bf16(%arg0: i32, %arg1: i32, %arg2: i32, %arg3: f32, %arg4: f32, %arg5: f32, %arg6: f32) {
    %0 = nvvm.mma.sync A[%arg0, %arg1]  B[%arg2]  C[%arg3, %arg4, %arg5, %arg6]  {layoutA = #nvvm.mma_layout<row>, layoutB = #nvvm.mma_layout<col>, multiplicandAPtxType = #nvvm.mma_type<bf16>, multiplicandBPtxType = #nvvm.mma_type<bf16>, shape = #nvvm.shape<m = 16, n = 8, k = 8>} : (i32, i32, f32) -> !llvm.struct<(f32, f32, f32, f32)>
    llvm.return %0 : !llvm.struct<(f32, f32, f32, f32)>
  }
  func.func @nvvm_mma_m16n8k16_bf16_bf16(%arg0: i32, %arg1: i32, %arg2: i32, %arg3: i32, %arg4: i32, %arg5: i32, %arg6: f32, %arg7: f32, %arg8: f32, %arg9: f32) {
    %0 = nvvm.mma.sync A[%arg0, %arg1, %arg2, %arg3]  B[%arg4, %arg5]  C[%arg6, %arg7, %arg8, %arg9]  {layoutA = #nvvm.mma_layout<row>, layoutB = #nvvm.mma_layout<col>, multiplicandAPtxType = #nvvm.mma_type<bf16>, multiplicandBPtxType = #nvvm.mma_type<bf16>, shape = #nvvm.shape<m = 16, n = 8, k = 16>} : (i32, i32, f32) -> !llvm.struct<(f32, f32, f32, f32)>
    llvm.return %0 : !llvm.struct<(f32, f32, f32, f32)>
  }
  func.func @nvvm_mma_m8n8k16_s8_s8(%arg0: i32, %arg1: i32, %arg2: i32, %arg3: i32) {
    %0 = nvvm.mma.sync A[%arg0]  B[%arg1]  C[%arg2, %arg3]  {intOverflowBehavior = #nvvm.mma_int_overflow<wrapped>, layoutA = #nvvm.mma_layout<row>, layoutB = #nvvm.mma_layout<col>, multiplicandAPtxType = #nvvm.mma_type<s8>, multiplicandBPtxType = #nvvm.mma_type<s8>, shape = #nvvm.shape<m = 8, n = 8, k = 16>} : (i32, i32, i32) -> !llvm.struct<(i32, i32)>
    llvm.return %0 : !llvm.struct<(i32, i32)>
  }
  func.func @nvvm_mma_m16n8k8_f16_f16(%arg0: vector<2xf16>, %arg1: vector<2xf16>, %arg2: vector<2xf16>, %arg3: vector<2xf16>, %arg4: vector<2xf16>) {
    %0 = nvvm.mma.sync A[%arg0, %arg1]  B[%arg2]  C[%arg3, %arg4]  {layoutA = #nvvm.mma_layout<row>, layoutB = #nvvm.mma_layout<col>, shape = #nvvm.shape<m = 16, n = 8, k = 8>} : (vector<2xf16>, vector<2xf16>, vector<2xf16>) -> !llvm.struct<(vector<2xf16>, vector<2xf16>)>
    llvm.return %0 : !llvm.struct<(vector<2xf16>, vector<2xf16>)>
  }
  func.func @nvvm_mma_m16n8k16_f16_f16(%arg0: vector<2xf16>, %arg1: vector<2xf16>, %arg2: vector<2xf16>, %arg3: vector<2xf16>, %arg4: vector<2xf16>, %arg5: vector<2xf16>, %arg6: vector<2xf16>, %arg7: vector<2xf16>) {
    %0 = nvvm.mma.sync A[%arg0, %arg1, %arg2, %arg3]  B[%arg4, %arg5]  C[%arg6, %arg7]  {layoutA = #nvvm.mma_layout<row>, layoutB = #nvvm.mma_layout<col>, shape = #nvvm.shape<m = 16, n = 8, k = 16>} : (vector<2xf16>, vector<2xf16>, vector<2xf16>) -> !llvm.struct<(vector<2xf16>, vector<2xf16>)>
    llvm.return %0 : !llvm.struct<(vector<2xf16>, vector<2xf16>)>
  }
  func.func @nvvm_mma_m16n8k16_f32_f32(%arg0: vector<2xf16>, %arg1: vector<2xf16>, %arg2: vector<2xf16>, %arg3: vector<2xf16>, %arg4: vector<2xf16>, %arg5: vector<2xf16>, %arg6: f32, %arg7: f32, %arg8: f32, %arg9: f32) {
    %0 = nvvm.mma.sync A[%arg0, %arg1, %arg2, %arg3]  B[%arg4, %arg5]  C[%arg6, %arg7, %arg8, %arg9]  {layoutA = #nvvm.mma_layout<row>, layoutB = #nvvm.mma_layout<col>, shape = #nvvm.shape<m = 16, n = 8, k = 16>} : (vector<2xf16>, vector<2xf16>, f32) -> !llvm.struct<(f32, f32, f32, f32)>
    llvm.return %0 : !llvm.struct<(f32, f32, f32, f32)>
  }
  func.func @nvvm_mma_m16n8k4_tf32_f32(%arg0: i32, %arg1: i32, %arg2: i32, %arg3: f32, %arg4: f32, %arg5: f32, %arg6: f32) {
    %0 = nvvm.mma.sync A[%arg0, %arg1]  B[%arg2]  C[%arg3, %arg4, %arg5, %arg6]  {layoutA = #nvvm.mma_layout<row>, layoutB = #nvvm.mma_layout<col>, multiplicandAPtxType = #nvvm.mma_type<tf32>, multiplicandBPtxType = #nvvm.mma_type<tf32>, shape = #nvvm.shape<m = 16, n = 8, k = 4>} : (i32, i32, f32) -> !llvm.struct<(f32, f32, f32, f32)>
    llvm.return %0 : !llvm.struct<(f32, f32, f32, f32)>
  }
  func.func @nvvm_mma_m16n8k16_s8_s8(%arg0: i32, %arg1: i32, %arg2: i32, %arg3: i32, %arg4: i32, %arg5: i32, %arg6: i32) {
    %0 = nvvm.mma.sync A[%arg0, %arg1]  B[%arg2]  C[%arg3, %arg4, %arg5, %arg6]  {intOverflowBehavior = #nvvm.mma_int_overflow<wrapped>, layoutA = #nvvm.mma_layout<row>, layoutB = #nvvm.mma_layout<col>, multiplicandAPtxType = #nvvm.mma_type<s8>, multiplicandBPtxType = #nvvm.mma_type<s8>, shape = #nvvm.shape<m = 16, n = 8, k = 16>} : (i32, i32, i32) -> !llvm.struct<(i32, i32, i32, i32)>
    llvm.return %0 : !llvm.struct<(i32, i32, i32, i32)>
  }
  func.func @nvvm_mma_m16n8k16_s8_u8(%arg0: i32, %arg1: i32, %arg2: i32, %arg3: i32, %arg4: i32, %arg5: i32, %arg6: i32) {
    %0 = nvvm.mma.sync A[%arg0, %arg1]  B[%arg2]  C[%arg3, %arg4, %arg5, %arg6]  {intOverflowBehavior = #nvvm.mma_int_overflow<satfinite>, layoutA = #nvvm.mma_layout<row>, layoutB = #nvvm.mma_layout<col>, multiplicandAPtxType = #nvvm.mma_type<s8>, multiplicandBPtxType = #nvvm.mma_type<u8>, shape = #nvvm.shape<m = 16, n = 8, k = 16>} : (i32, i32, i32) -> !llvm.struct<(i32, i32, i32, i32)>
    llvm.return %0 : !llvm.struct<(i32, i32, i32, i32)>
  }
  func.func @nvvm_mma_m16n8k256_b1_b1(%arg0: i32, %arg1: i32, %arg2: i32, %arg3: i32, %arg4: i32, %arg5: i32, %arg6: i32, %arg7: i32, %arg8: i32, %arg9: i32) {
    %0 = nvvm.mma.sync A[%arg0, %arg1, %arg2, %arg3]  B[%arg4, %arg5]  C[%arg6, %arg7, %arg8, %arg9]  {b1Op = #nvvm.mma_b1op<xor_popc>, layoutA = #nvvm.mma_layout<row>, layoutB = #nvvm.mma_layout<col>, multiplicandAPtxType = #nvvm.mma_type<b1>, multiplicandBPtxType = #nvvm.mma_type<b1>, shape = #nvvm.shape<m = 16, n = 8, k = 256>} : (i32, i32, i32) -> !llvm.struct<(i32, i32, i32, i32)>
    llvm.return %0 : !llvm.struct<(i32, i32, i32, i32)>
  }
  func.func @nvvm_mma_m16n8k128_b1_b1(%arg0: i32, %arg1: i32, %arg2: i32, %arg3: i32, %arg4: i32, %arg5: i32, %arg6: i32) {
    %0 = nvvm.mma.sync A[%arg0, %arg1]  B[%arg2]  C[%arg3, %arg4, %arg5, %arg6]  {b1Op = #nvvm.mma_b1op<xor_popc>, layoutA = #nvvm.mma_layout<row>, layoutB = #nvvm.mma_layout<col>, multiplicandAPtxType = #nvvm.mma_type<b1>, multiplicandBPtxType = #nvvm.mma_type<b1>, shape = #nvvm.shape<m = 16, n = 8, k = 128>} : (i32, i32, i32) -> !llvm.struct<(i32, i32, i32, i32)>
    llvm.return %0 : !llvm.struct<(i32, i32, i32, i32)>
  }
  func.func @nvvm_mma_m8n8k128_b1_b1(%arg0: i32, %arg1: i32, %arg2: i32, %arg3: i32) {
    %0 = nvvm.mma.sync A[%arg0]  B[%arg1]  C[%arg2, %arg3]  {b1Op = #nvvm.mma_b1op<xor_popc>, layoutA = #nvvm.mma_layout<row>, layoutB = #nvvm.mma_layout<col>, multiplicandAPtxType = #nvvm.mma_type<b1>, multiplicandBPtxType = #nvvm.mma_type<b1>, shape = #nvvm.shape<m = 8, n = 8, k = 128>} : (i32, i32, i32) -> !llvm.struct<(i32, i32)>
    llvm.return %0 : !llvm.struct<(i32, i32)>
  }
  func.func @nvvm_mma_m16n8k32_s4_s4(%arg0: i32, %arg1: i32, %arg2: i32, %arg3: i32, %arg4: i32, %arg5: i32, %arg6: i32) {
    %0 = nvvm.mma.sync A[%arg0, %arg1]  B[%arg2]  C[%arg3, %arg4, %arg5, %arg6]  {intOverflowBehavior = #nvvm.mma_int_overflow<wrapped>, layoutA = #nvvm.mma_layout<row>, layoutB = #nvvm.mma_layout<col>, multiplicandAPtxType = #nvvm.mma_type<s4>, multiplicandBPtxType = #nvvm.mma_type<s4>, shape = #nvvm.shape<m = 16, n = 8, k = 32>} : (i32, i32, i32) -> !llvm.struct<(i32, i32, i32, i32)>
    llvm.return %0 : !llvm.struct<(i32, i32, i32, i32)>
  }
  func.func @nvvm_wmma_load_tf32(%arg0: !llvm.ptr, %arg1: i32) -> !llvm.struct<(i32, i32, i32, i32)> {
    %0 = nvvm.wmma.load %arg0, %arg1 {eltype = #nvvm.mma_type<tf32>, frag = #nvvm.mma_frag<a>, k = 8 : i32, layout = #nvvm.mma_layout<row>, m = 16 : i32, n = 16 : i32} : (!llvm.ptr) -> !llvm.struct<(i32, i32, i32, i32)>
    llvm.return %0 : !llvm.struct<(i32, i32, i32, i32)>
  }
  func.func @nvvm_wmma_mma(%arg0: i32, %arg1: i32, %arg2: i32, %arg3: i32, %arg4: i32, %arg5: i32, %arg6: i32, %arg7: i32, %arg8: f32, %arg9: f32, %arg10: f32, %arg11: f32, %arg12: f32, %arg13: f32, %arg14: f32, %arg15: f32) -> !llvm.struct<(f32, f32, f32, f32, f32, f32, f32, f32)> {
    %0 = nvvm.wmma.mma %arg0, %arg1, %arg2, %arg3, %arg4, %arg5, %arg6, %arg7, %arg8, %arg9, %arg10, %arg11, %arg12, %arg13, %arg14, %arg15 {eltypeA = #nvvm.mma_type<tf32>, eltypeB = #nvvm.mma_type<f32>, k = 8 : i32, layoutA = #nvvm.mma_layout<row>, layoutB = #nvvm.mma_layout<row>, m = 16 : i32, n = 16 : i32} : (i32, i32, i32, i32, i32, i32, i32, i32, f32, f32, f32, f32, f32, f32, f32, f32) -> !llvm.struct<(f32, f32, f32, f32, f32, f32, f32, f32)>
    llvm.return %0 : !llvm.struct<(f32, f32, f32, f32, f32, f32, f32, f32)>
  }
  llvm.func @cp_async(%arg0: !llvm.ptr<3>, %arg1: !llvm.ptr<1>) {
    nvvm.cp.async.shared.global %arg0, %arg1, 16, cache =  ca : !llvm.ptr<3>, !llvm.ptr<1>
    nvvm.cp.async.shared.global %arg0, %arg1, 16, cache =  cg : !llvm.ptr<3>, !llvm.ptr<1>
    nvvm.cp.async.commit.group
    nvvm.cp.async.wait.group 0
    llvm.return
  }
  llvm.func @redux_sync(%arg0: i32, %arg1: i32) -> i32 {
    %0 = nvvm.redux.sync  add %arg0, %arg1 : i32 -> i32
    %1 = nvvm.redux.sync  max %arg0, %arg1 : i32 -> i32
    %2 = nvvm.redux.sync  min %arg0, %arg1 : i32 -> i32
    %3 = nvvm.redux.sync  umax %arg0, %arg1 : i32 -> i32
    %4 = nvvm.redux.sync  umin %arg0, %arg1 : i32 -> i32
    %5 = nvvm.redux.sync  and %arg0, %arg1 : i32 -> i32
    %6 = nvvm.redux.sync  or %arg0, %arg1 : i32 -> i32
    %7 = nvvm.redux.sync  xor %arg0, %arg1 : i32 -> i32
    llvm.return %0 : i32
  }
  llvm.func @redux_sync_f32(%arg0: f32, %arg1: i32) -> f32 {
    %0 = nvvm.redux.sync  fmin %arg0, %arg1 : f32 -> f32
    %1 = nvvm.redux.sync  fmin %arg0, %arg1 {abs = true} : f32 -> f32
    %2 = nvvm.redux.sync  fmin %arg0, %arg1 {NaN = true} : f32 -> f32
    %3 = nvvm.redux.sync  fmin %arg0, %arg1 {NaN = true, abs = true} : f32 -> f32
    %4 = nvvm.redux.sync  fmax %arg0, %arg1 : f32 -> f32
    %5 = nvvm.redux.sync  fmax %arg0, %arg1 {abs = true} : f32 -> f32
    %6 = nvvm.redux.sync  fmax %arg0, %arg1 {NaN = true} : f32 -> f32
    %7 = nvvm.redux.sync  fmax %arg0, %arg1 {NaN = true, abs = true} : f32 -> f32
    llvm.return %0 : f32
  }
}

// -----
// -----
module {
  llvm.func private @mbarrier_init_generic(%arg0: !llvm.ptr) {
    %0 = nvvm.read.ptx.sreg.ntid.x : i32
    nvvm.mbarrier.init %arg0, %0 : !llvm.ptr, i32
    llvm.return
  }
  llvm.func private @mbarrier_init_shared(%arg0: !llvm.ptr<3>) {
    %0 = nvvm.read.ptx.sreg.ntid.x : i32
    nvvm.mbarrier.init %arg0, %0 : !llvm.ptr<3>, i32
    llvm.return
  }
  llvm.func private @mbarrier_inval_generic(%arg0: !llvm.ptr) {
    nvvm.mbarrier.inval %arg0 : !llvm.ptr
    llvm.return
  }
  llvm.func private @mbarrier_inval_shared(%arg0: !llvm.ptr<3>) {
    nvvm.mbarrier.inval %arg0 : !llvm.ptr<3>
    llvm.return
  }
  llvm.func private @mbarrier_arrive(%arg0: !llvm.ptr) {
    %0 = nvvm.mbarrier.arrive %arg0 : !llvm.ptr -> i64
    llvm.return
  }
  llvm.func private @mbarrier_arrive_shared(%arg0: !llvm.ptr<3>) {
    %0 = nvvm.mbarrier.arrive %arg0 : !llvm.ptr<3> -> i64
    llvm.return
  }
  llvm.func private @mbarrier_arrive_nocomplete(%arg0: !llvm.ptr) {
    %0 = nvvm.read.ptx.sreg.ntid.x : i32
    %1 = nvvm.mbarrier.arrive.nocomplete %arg0, %0 : !llvm.ptr, i32 -> i64
    llvm.return
  }
  llvm.func private @mbarrier_arrive_nocomplete_shared(%arg0: !llvm.ptr<3>) {
    %0 = nvvm.read.ptx.sreg.ntid.x : i32
    %1 = nvvm.mbarrier.arrive.nocomplete %arg0, %0 : !llvm.ptr<3>, i32 -> i64
    llvm.return
  }
  func.func @wgmma_fence_aligned() {
    nvvm.wgmma.fence.aligned
    return
  }
  func.func @wgmma_commit_group_sync_aligned() {
    nvvm.wgmma.commit.group.sync.aligned
    return
  }
  func.func @wgmma_wait_group_sync_aligned() {
    nvvm.wgmma.wait.group.sync.aligned 0
    return
  }
  func.func @griddepcontrol_wait() {
    nvvm.griddepcontrol  wait
    return
  }
  func.func @griddepcontrol_launch_dependents() {
    nvvm.griddepcontrol  launch_dependents
    return
  }
  func.func @mapa(%arg0: !llvm.ptr, %arg1: !llvm.ptr<3>, %arg2: i32) {
    %0 = nvvm.mapa %arg0, %arg2 : !llvm.ptr -> !llvm.ptr
    %1 = nvvm.mapa %arg1, %arg2 : !llvm.ptr<3> -> !llvm.ptr<7>
    return
  }
  func.func @match_sync(%arg0: i32, %arg1: i64, %arg2: i32) {
    %0 = nvvm.match.sync  any %arg2, %arg0 : i32 -> i32
    %1 = nvvm.match.sync  all %arg2, %arg0 : i32 -> !llvm.struct<(i32, i1)>
    %2 = nvvm.match.sync  any %arg2, %arg1 : i64 -> i32
    %3 = nvvm.match.sync  all %arg2, %arg1 : i64 -> !llvm.struct<(i32, i1)>
    return
  }
  func.func @st_bulk(%arg0: !llvm.ptr, %arg1: !llvm.ptr<3>, %arg2: i64) {
    nvvm.st.bulk %arg0, size = %arg2 : !llvm.ptr
    nvvm.st.bulk %arg1, size = %arg2 : !llvm.ptr<3>
    return
  }
  func.func @dot_accumulate_4way(%arg0: vector<4xi8>, %arg1: vector<4xi8>, %arg2: i32) {
    %0 = nvvm.dot.accumulate.4way %arg0 <unsigned>, %arg1 <unsigned>, %arg2 : vector<4xi8>, vector<4xi8>
    %1 = nvvm.dot.accumulate.4way %arg0 <signed>, %arg1 <signed>, %arg2 : vector<4xi8>, vector<4xi8>
    return
  }
  func.func @dot_accumulate_2way(%arg0: vector<2xi16>, %arg1: vector<4xi8>, %arg2: i32) {
    %0 = nvvm.dot.accumulate.2way %arg0 <unsigned>, %arg1 <unsigned>, %arg2 {b_hi = false} : vector<2xi16>, vector<4xi8>
    %1 = nvvm.dot.accumulate.2way %arg0 <signed>, %arg1 <signed>, %arg2 {b_hi = true} : vector<2xi16>, vector<4xi8>
    return
  }
  func.func @prefetch(%arg0: !llvm.ptr, %arg1: !llvm.ptr<5>, %arg2: !llvm.ptr<1>, %arg3: !llvm.ptr<4>) {
    nvvm.prefetch level =  L1, %arg0 : !llvm.ptr
    nvvm.prefetch level =  L1, %arg1 : !llvm.ptr<5>
    nvvm.prefetch level =  L1, %arg2 : !llvm.ptr<1>
    nvvm.prefetch level =  L2, %arg0 : !llvm.ptr
    nvvm.prefetch level =  L2, %arg1 : !llvm.ptr<5>
    nvvm.prefetch level =  L2, %arg2 : !llvm.ptr<1>
    nvvm.prefetch level =  L2, evict_priority =  evict_last, %arg2 : !llvm.ptr<1>
    nvvm.prefetch level =  L2, evict_priority =  evict_normal, %arg2 : !llvm.ptr<1>
    nvvm.prefetch level =  L1 uniform, %arg0 : !llvm.ptr
    nvvm.prefetch tensormap, %arg0 : !llvm.ptr
    nvvm.prefetch tensormap, %arg3 : !llvm.ptr<4>
    nvvm.prefetch tensormap in_param_space, %arg0 : !llvm.ptr
    return
  }
  func.func @prefetch_tensormap(%arg0: !llvm.ptr, %arg1: !llvm.ptr<4>) {
    return
  }
  func.func private @nvvm_address_space(!ptr.ptr<#nvvm.memory_space<global>>, !ptr.ptr<#nvvm.memory_space<shared>>, !ptr.ptr<#nvvm.memory_space<constant>>, !ptr.ptr<#nvvm.memory_space<local>>, !ptr.ptr<#nvvm.memory_space<tensor>>, !ptr.ptr<#nvvm.memory_space<shared_cluster>>) -> !ptr.ptr<#nvvm.memory_space<generic>>
}

// -----
module {
  gpu.module @module_1 [#nvvm.target<chip = "sm_90", features = "+ptx70", flags = {fast, ftz}, link = ["my_device_lib.bc"]>] {
  }
  gpu.module @module_2 [#nvvm.target<chip = "sm_90">, #nvvm.target<chip = "sm_80">, #nvvm.target<chip = "sm_70">] {
  }
  llvm.func @kernel_func(%arg0: !llvm.ptr {llvm.byval = i32, nvvm.grid_constant}) attributes {nvvm.kernel} {
    llvm.return
  }
}

// -----
// -----
// -----
