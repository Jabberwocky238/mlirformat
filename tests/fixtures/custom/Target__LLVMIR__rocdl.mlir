module {
  llvm.func @rocdl_special_regs() -> i32 {
    %0 = rocdl.workitem.id.x : i32
    %1 = rocdl.workitem.id.y : i32
    %2 = rocdl.workitem.id.z : i32
    %3 = rocdl.workgroup.id.x : i32
    %4 = rocdl.workgroup.id.y : i32
    %5 = rocdl.workgroup.id.z : i32
    %6 = rocdl.cluster.id.x : i32
    %7 = rocdl.cluster.id.y : i32
    %8 = rocdl.cluster.id.z : i32
    %9 = rocdl.cluster.workgroup.id.x range <i32, 0, 16> : i32
    %10 = rocdl.cluster.workgroup.id.y range <i32, 0, 16> : i32
    %11 = rocdl.cluster.workgroup.id.z range <i32, 0, 16> : i32
    %12 = rocdl.workitem.id.x range <i32, 0, 64> : i32
    %13 = rocdl.wave.id : i32
    %14 = rocdl.wave.id range <i32, 32, 65> : i32
    %15 = rocdl.wavefrontsize : i32
    %16 = rocdl.wavefrontsize range <i32, 32, 65> : i32
    llvm.return %0 : i32
  }
  llvm.func @kernel_func() attributes {rocdl.kernel} {
    llvm.return
  }
  llvm.func @kernel_func_workgroups() attributes {rocdl.kernel, rocdl.max_flat_work_group_size = 1024 : index} {
    llvm.return
  }
  llvm.func @kernel_math_ops(%arg0: f32, %arg1: f16, %arg2: bf16) {
    %0 = rocdl.tanh %arg0 f32 -> f32
    %1 = rocdl.tanh %arg1 f16 -> f16
    %2 = rocdl.tanh %arg2 bf16 -> bf16
    %3 = rocdl.sin %arg0 f32 -> f32
    %4 = rocdl.sin %arg1 f16 -> f16
    %5 = rocdl.sin %arg2 bf16 -> bf16
    %6 = rocdl.cos %arg0 f32 -> f32
    %7 = rocdl.cos %arg1 f16 -> f16
    %8 = rocdl.cos %arg2 bf16 -> bf16
    %9 = rocdl.rcp %arg0 f32 -> f32
    %10 = rocdl.rcp %arg1 f16 -> f16
    %11 = rocdl.rcp %arg2 bf16 -> bf16
    %12 = rocdl.exp2 %arg0 f32 -> f32
    %13 = rocdl.exp2 %arg1 f16 -> f16
    %14 = rocdl.exp2 %arg2 bf16 -> bf16
    %15 = rocdl.log %arg0 f32 -> f32
    %16 = rocdl.log %arg1 f16 -> f16
    %17 = rocdl.log %arg2 bf16 -> bf16
    %18 = rocdl.sqrt %arg0 f32 -> f32
    %19 = rocdl.sqrt %arg1 f16 -> f16
    %20 = rocdl.sqrt %arg2 bf16 -> bf16
    %21 = rocdl.rsq %arg0 f32 -> f32
    %22 = rocdl.rsq %arg1 f16 -> f16
    %23 = rocdl.rsq %arg2 bf16 -> bf16
    llvm.return
  }
  llvm.func @known_block_sizes() attributes {rocdl.flat_work_group_size = "128,128", rocdl.kernel, rocdl.reqd_work_group_size = array<i32: 16, 4, 2>} {
    llvm.return
  }
  llvm.func @known_block_sizes_from_reqd() attributes {rocdl.kernel, rocdl.reqd_work_group_size = array<i32: 8, 4, 2>} {
    llvm.return
  }
  llvm.func @kernel_func_no_uniform_work_groups() attributes {rocdl.kernel, rocdl.uniform_work_group_size = false} {
    llvm.return
  }
  llvm.func @kernel_func_waves_per_eu() attributes {rocdl.kernel, rocdl.waves_per_eu = 2 : i32} {
    llvm.return
  }
  llvm.func @kernel_func_unsafe_fp_atomics() attributes {rocdl.kernel, rocdl.unsafe_fp_atomics = true} {
    llvm.return
  }
  llvm.func @rocdl.lane_id() -> i32 {
    %0 = llvm.mlir.constant(-1 : i32) : i32
    %1 = llvm.mlir.constant(0 : i32) : i32
    %2 = rocdl.mbcnt.lo %0, %1 {res_attrs = [{llvm.noundef, llvm.range = #llvm.constant_range<i32, 0, 32>}]} : (i32, i32) -> i32
    %3 = rocdl.mbcnt.hi %0, %2 {res_attrs = [{llvm.noundef, llvm.range = #llvm.constant_range<i32, 0, 64>}]} : (i32, i32) -> i32
    llvm.return %3 : i32
  }
  llvm.func @rocdl.swizzle(%arg0: i32) -> i32 {
    %0 = llvm.mlir.constant(100 : i32) : i32
    %1 = rocdl.ds_swizzle %arg0, %0 : (i32, i32) -> i32
    llvm.return %1 : i32
  }
  llvm.func @rocdl.bpermute(%arg0: i32) -> i32 {
    %0 = llvm.mlir.constant(10 : i32) : i32
    %1 = rocdl.ds_bpermute %0, %arg0 : (i32, i32) -> i32
    llvm.return %1 : i32
  }
  llvm.func @rocdl.ballot32(%arg0: i1) -> i32 {
    %0 = rocdl.ballot %arg0 : i32
    llvm.return %0 : i32
  }
  llvm.func @rocdl.ballot64(%arg0: i1) -> i64 {
    %0 = rocdl.ballot %arg0 : i64
    llvm.return %0 : i64
  }
  llvm.func @rocdl.readfirstlane(%arg0: f32, %arg1: f64, %arg2: i32, %arg3: vector<2xf32>) -> f32 {
    %0 = rocdl.readfirstlane %arg0 : f32
    %1 = rocdl.readfirstlane %arg1 : f64
    %2 = rocdl.readfirstlane %arg2 : i32
    %3 = rocdl.readfirstlane %arg3 : vector<2xf32>
    llvm.return %0 : f32
  }
  llvm.func @rocdl.readlane(%arg0: f32, %arg1: f64, %arg2: i32, %arg3: vector<2xf32>) -> f32 {
    %0 = llvm.mlir.constant(0 : i32) : i32
    %1 = rocdl.readlane %arg0, %0 : (f32, i32) -> f32
    %2 = rocdl.readlane %arg1, %0 : (f64, i32) -> f64
    %3 = rocdl.readlane %arg2, %0 : (i32, i32) -> i32
    %4 = rocdl.readlane %arg3, %0 : (vector<2xf32>, i32) -> vector<2xf32>
    llvm.return %1 : f32
  }
  llvm.func @rocdl.s.waitcnt() {
    rocdl.s.waitcnt 0
    llvm.return
  }
  llvm.func @rocdl.s.sleep() {
    rocdl.s.sleep 0
    llvm.return
  }
  llvm.func @rocdl.s.nop() {
    rocdl.s.nop 0
    llvm.return
  }
  llvm.func @rocdl.s.barrier() {
    rocdl.s.barrier
    llvm.return
  }
  llvm.func @rocdl.barrier() {
    rocdl.barrier
    llvm.return
  }
  llvm.func @rocdl.wave_barrier() {
    rocdl.wave.barrier
    llvm.return
  }
  llvm.func @rocdl.s.barrier.init(%arg0: !llvm.ptr<3>) {
    rocdl.s.barrier.init %arg0 member_cnt = 1 : !llvm.ptr<3>
    llvm.return
  }
  llvm.func @rocdl.s.barrier.signal() {
    rocdl.s.barrier.signal id = -1
    llvm.return
  }
  llvm.func @rocdl.s.barrier.signal.var(%arg0: !llvm.ptr<3>) {
    rocdl.s.barrier.signal.var %arg0 member_cnt = 1 : !llvm.ptr<3>
    llvm.return
  }
  llvm.func @rocdl.s.barrier.join(%arg0: !llvm.ptr<3>) {
    rocdl.s.barrier.join %arg0 : !llvm.ptr<3>
    llvm.return
  }
  llvm.func @rocdl.s.barrier.leave() {
    rocdl.s.barrier.leave id = 1
    llvm.return
  }
  llvm.func @rocdl.s.barrier.wait() {
    rocdl.s.barrier.wait id = -1
    llvm.return
  }
  llvm.func @rocdl.s.barrier.signal.isfirst() {
    %0 = rocdl.s.barrier.signal.isfirst id = 1 -> i1
    llvm.return
  }
  llvm.func @rocdl.s.get.barrier.state() {
    %0 = rocdl.s.get.barrier.state id = 1 -> i32
    llvm.return
  }
  llvm.func @rocdl.s.get.named.barrier.state(%arg0: !llvm.ptr<3>) {
    %0 = rocdl.s.get.named.barrier.state %arg0 : !llvm.ptr<3> -> i32
    llvm.return
  }
  llvm.func @rocdl.s.wakeup.barrier(%arg0: !llvm.ptr<3>) {
    rocdl.s.wakeup.barrier %arg0 : !llvm.ptr<3>
    llvm.return
  }
  llvm.func @rocdl.s.wait.dscnt() {
    rocdl.s.wait.dscnt 0
    llvm.return
  }
  llvm.func @rocdl.s.wait.loadcnt() {
    rocdl.s.wait.loadcnt 0
    llvm.return
  }
  llvm.func @rocdl.s.wait.storecnt() {
    rocdl.s.wait.storecnt 0
    llvm.return
  }
  llvm.func @rocdl.s.wait.expcnt() {
    rocdl.s.wait.expcnt 0
    llvm.return
  }
  llvm.func @rocdl.s.wait.asynccnt() {
    rocdl.s.wait.asynccnt 0
    llvm.return
  }
  llvm.func @rocdl.s.wait.tensorcnt() {
    rocdl.s.wait.tensorcnt 0
    llvm.return
  }
  llvm.func @rocdl.asyncmark() {
    rocdl.asyncmark
    llvm.return
  }
  llvm.func @rocdl.wait.asyncmark() {
    rocdl.wait.asyncmark 0
    llvm.return
  }
  llvm.func @rocdl.setprio() {
    rocdl.s.setprio 0
    rocdl.s.setprio 1
    llvm.return
  }
  llvm.func @rocdl.schedbarrier() {
    rocdl.sched.barrier none
    rocdl.sched.barrier non_mem_non_sideeffect
    rocdl.sched.barrier valu|all_vmem
    rocdl.sched.barrier ldsdma
    rocdl.sched.barrier all
    llvm.return
  }
  llvm.func @rocdl.sched.group.barrier() {
    rocdl.sched.group.barrier mfma_wmma, 1, 0
    rocdl.sched.group.barrier ldsdma, 2, 3
    llvm.return
  }
  llvm.func @rocdl.iglp.opt() {
    rocdl.iglp.opt 0
    rocdl.iglp.opt 1
    llvm.return
  }
  llvm.func @rocdl.xdlops(%arg0: f32, %arg1: f32, %arg2: vector<32xf32>, %arg3: i32, %arg4: vector<16xf32>, %arg5: vector<4xf32>, %arg6: vector<4xf16>, %arg7: vector<32xi32>, %arg8: vector<16xi32>, %arg9: vector<4xi32>, %arg10: vector<2xi16>, %arg11: i64, %arg12: vector<8xbf16>, %arg13: vector<4xi32>, %arg14: vector<8xf16>, %arg15: f64, %arg16: vector<4xf64>) -> vector<32xf32> {
    %0 = rocdl.mfma.f32.32x32x1f32 %arg0, %arg1, %arg2, 0, 0, bcast_first_32 : (f32, f32, vector<32xf32>) -> vector<32xf32>
    %1 = rocdl.mfma.f32.16x16x1f32 %arg0, %arg1, %arg4, 0, 0, none : (f32, f32, vector<16xf32>) -> vector<16xf32>
    %2 = rocdl.mfma.f32.16x16x4f32 %arg0, %arg1, %arg5, 0, 0, none : (f32, f32, vector<4xf32>) -> vector<4xf32>
    %3 = rocdl.mfma.f32.4x4x1f32 %arg0, %arg1, %arg5, 0, 0, none : (f32, f32, vector<4xf32>) -> vector<4xf32>
    %4 = rocdl.mfma.f32.32x32x2f32 %arg0, %arg1, %arg4, 0, 0, none : (f32, f32, vector<16xf32>) -> vector<16xf32>
    %5 = rocdl.mfma.f32.32x32x4f16 %arg6, %arg6, %arg2, 0, 0, none : (vector<4xf16>, vector<4xf16>, vector<32xf32>) -> vector<32xf32>
    %6 = rocdl.mfma.f32.16x16x4f16 %arg6, %arg6, %arg4, 0, 0, none : (vector<4xf16>, vector<4xf16>, vector<16xf32>) -> vector<16xf32>
    %7 = rocdl.mfma.f32.4x4x4f16 %arg6, %arg6, %arg5, 0, 0, none : (vector<4xf16>, vector<4xf16>, vector<4xf32>) -> vector<4xf32>
    %8 = rocdl.mfma.f32.32x32x8f16 %arg6, %arg6, %arg4, 0, 0, none : (vector<4xf16>, vector<4xf16>, vector<16xf32>) -> vector<16xf32>
    %9 = rocdl.mfma.f32.16x16x16f16 %arg6, %arg6, %arg5, 0, 0, none : (vector<4xf16>, vector<4xf16>, vector<4xf32>) -> vector<4xf32>
    %10 = rocdl.mfma.i32.32x32x4i8 %arg3, %arg3, %arg7, 0, 0, none : (i32, i32, vector<32xi32>) -> vector<32xi32>
    %11 = rocdl.mfma.i32.16x16x4i8 %arg3, %arg3, %arg8, 0, 0, none : (i32, i32, vector<16xi32>) -> vector<16xi32>
    %12 = rocdl.mfma.i32.4x4x4i8 %arg3, %arg3, %arg9, 0, 0, none : (i32, i32, vector<4xi32>) -> vector<4xi32>
    %13 = rocdl.mfma.i32.32x32x8i8 %arg3, %arg3, %arg8, 0, 0, none : (i32, i32, vector<16xi32>) -> vector<16xi32>
    %14 = rocdl.mfma.i32.16x16x16i8 %arg3, %arg3, %arg9, 0, 0, none : (i32, i32, vector<4xi32>) -> vector<4xi32>
    %15 = rocdl.mfma.f32.32x32x2bf16 %arg10, %arg10, %arg2, 0, 0, none : (vector<2xi16>, vector<2xi16>, vector<32xf32>) -> vector<32xf32>
    %16 = rocdl.mfma.f32.16x16x2bf16 %arg10, %arg10, %arg4, 0, 0, none : (vector<2xi16>, vector<2xi16>, vector<16xf32>) -> vector<16xf32>
    %17 = rocdl.mfma.f32.4x4x2bf16 %arg10, %arg10, %arg5, 0, 0, none : (vector<2xi16>, vector<2xi16>, vector<4xf32>) -> vector<4xf32>
    %18 = rocdl.mfma.f32.32x32x4bf16 %arg10, %arg10, %arg4, 0, 0, none : (vector<2xi16>, vector<2xi16>, vector<16xf32>) -> vector<16xf32>
    %19 = rocdl.mfma.f32.16x16x8bf16 %arg10, %arg10, %arg5, 0, 0, none : (vector<2xi16>, vector<2xi16>, vector<4xf32>) -> vector<4xf32>
    %20 = rocdl.mfma.f32.16x16x32.bf8.bf8 %arg11, %arg11, %arg5, 0, 0, none : (i64, i64, vector<4xf32>) -> vector<4xf32>
    %21 = rocdl.mfma.f32.16x16x32.bf8.fp8 %arg11, %arg11, %arg5, 0, 0, none : (i64, i64, vector<4xf32>) -> vector<4xf32>
    %22 = rocdl.mfma.f32.16x16x32.fp8.bf8 %arg11, %arg11, %arg5, 0, 0, none : (i64, i64, vector<4xf32>) -> vector<4xf32>
    %23 = rocdl.mfma.f32.16x16x32.fp8.fp8 %arg11, %arg11, %arg5, 0, 0, none : (i64, i64, vector<4xf32>) -> vector<4xf32>
    %24 = rocdl.mfma.f32.32x32x16.bf8.bf8 %arg11, %arg11, %arg4, 0, 0, none : (i64, i64, vector<16xf32>) -> vector<16xf32>
    %25 = rocdl.mfma.f32.32x32x16.bf8.fp8 %arg11, %arg11, %arg4, 0, 0, none : (i64, i64, vector<16xf32>) -> vector<16xf32>
    %26 = rocdl.mfma.f32.32x32x16.fp8.bf8 %arg11, %arg11, %arg4, 0, 0, none : (i64, i64, vector<16xf32>) -> vector<16xf32>
    %27 = rocdl.mfma.f32.32x32x16.bf8.bf8 %arg11, %arg11, %arg4, 0, 0, none : (i64, i64, vector<16xf32>) -> vector<16xf32>
    %28 = rocdl.mfma.f32.16x16x32.bf16 %arg12, %arg12, %arg5, 0, 0, none : (vector<8xbf16>, vector<8xbf16>, vector<4xf32>) -> vector<4xf32>
    %29 = rocdl.mfma.i32.16x16x64.i8 %arg9, %arg9, %arg9, 0, 0, none : (vector<4xi32>, vector<4xi32>, vector<4xi32>) -> vector<4xi32>
    %30 = rocdl.mfma.f32.16x16x32.f16 %arg14, %arg14, %arg5, 0, 0, none : (vector<8xf16>, vector<8xf16>, vector<4xf32>) -> vector<4xf32>
    %31 = rocdl.mfma.f32.32x32x16.bf16 %arg12, %arg12, %arg4, 0, 0, none : (vector<8xbf16>, vector<8xbf16>, vector<16xf32>) -> vector<16xf32>
    %32 = rocdl.mfma.i32.32x32x32.i8 %arg9, %arg9, %arg8, 0, 0, none : (vector<4xi32>, vector<4xi32>, vector<16xi32>) -> vector<16xi32>
    %33 = rocdl.mfma.f32.32x32x16.f16 %arg14, %arg14, %arg4, 0, 0, none : (vector<8xf16>, vector<8xf16>, vector<16xf32>) -> vector<16xf32>
    %34 = rocdl.mfma.f64.16x16x4f64 %arg15, %arg15, %arg16, 0, 0, neg_a|neg_b : (f64, f64, vector<4xf64>) -> vector<4xf64>
    llvm.return %0 : vector<32xf32>
  }
  llvm.func @rocdl.smfmac(%arg0: i32, %arg1: vector<4xf16>, %arg2: vector<8xf16>, %arg3: vector<4xf32>, %arg4: vector<16xf32>, %arg5: vector<4xi16>, %arg6: vector<8xi16>, %arg7: vector<2xi32>, %arg8: vector<4xi32>, %arg9: vector<16xi32>, %arg10: vector<16xf16>, %arg11: vector<8xbf16>, %arg12: vector<16xbf16>, %arg13: vector<8xi32>) -> vector<4xf32> {
    %0 = llvm.mlir.constant(42 : i32) : i32
    %1 = rocdl.smfmac.f32.16x16x32.f16 %arg1, %arg2, %arg3, %0, 0, 0 : (vector<4xf16>, vector<8xf16>, vector<4xf32>, i32) -> vector<4xf32>
    %2 = rocdl.smfmac.f32.32x32x16.f16 %arg1, %arg2, %arg4, %0, 0, 0 : (vector<4xf16>, vector<8xf16>, vector<16xf32>, i32) -> vector<16xf32>
    %3 = rocdl.smfmac.f32.16x16x32.bf16 %arg5, %arg6, %arg3, %0, 0, 0 : (vector<4xi16>, vector<8xi16>, vector<4xf32>, i32) -> vector<4xf32>
    %4 = rocdl.smfmac.f32.32x32x16.bf16 %arg5, %arg6, %arg4, %0, 0, 0 : (vector<4xi16>, vector<8xi16>, vector<16xf32>, i32) -> vector<16xf32>
    %5 = rocdl.smfmac.i32.16x16x64.i8 %arg7, %arg8, %arg8, %0, 0, 0 : (vector<2xi32>, vector<4xi32>, vector<4xi32>, i32) -> vector<4xi32>
    %6 = rocdl.smfmac.i32.32x32x32.i8 %arg7, %arg8, %arg9, %0, 0, 0 : (vector<2xi32>, vector<4xi32>, vector<16xi32>, i32) -> vector<16xi32>
    %7 = rocdl.smfmac.f32.16x16x64.bf8.bf8 %arg7, %arg8, %arg3, %0, 0, 0 : (vector<2xi32>, vector<4xi32>, vector<4xf32>, i32) -> vector<4xf32>
    %8 = rocdl.smfmac.f32.16x16x64.bf8.fp8 %arg7, %arg8, %arg3, %0, 0, 0 : (vector<2xi32>, vector<4xi32>, vector<4xf32>, i32) -> vector<4xf32>
    %9 = rocdl.smfmac.f32.16x16x64.fp8.bf8 %arg7, %arg8, %arg3, %0, 0, 0 : (vector<2xi32>, vector<4xi32>, vector<4xf32>, i32) -> vector<4xf32>
    %10 = rocdl.smfmac.f32.16x16x64.fp8.fp8 %arg7, %arg8, %arg3, %0, 0, 0 : (vector<2xi32>, vector<4xi32>, vector<4xf32>, i32) -> vector<4xf32>
    %11 = rocdl.smfmac.f32.32x32x32.bf8.bf8 %arg7, %arg8, %arg4, %0, 0, 0 : (vector<2xi32>, vector<4xi32>, vector<16xf32>, i32) -> vector<16xf32>
    %12 = rocdl.smfmac.f32.32x32x32.bf8.fp8 %arg7, %arg8, %arg4, %0, 0, 0 : (vector<2xi32>, vector<4xi32>, vector<16xf32>, i32) -> vector<16xf32>
    %13 = rocdl.smfmac.f32.32x32x32.fp8.bf8 %arg7, %arg8, %arg4, %0, 0, 0 : (vector<2xi32>, vector<4xi32>, vector<16xf32>, i32) -> vector<16xf32>
    %14 = rocdl.smfmac.f32.32x32x32.fp8.fp8 %arg7, %arg8, %arg4, %0, 0, 0 : (vector<2xi32>, vector<4xi32>, vector<16xf32>, i32) -> vector<16xf32>
    %15 = rocdl.smfmac.f32.16x16x64.f16 %arg2, %arg10, %arg3, %0, 0, 0 : (vector<8xf16>, vector<16xf16>, vector<4xf32>, i32) -> vector<4xf32>
    %16 = rocdl.smfmac.f32.32x32x32.f16 %arg2, %arg10, %arg4, %0, 0, 0 : (vector<8xf16>, vector<16xf16>, vector<16xf32>, i32) -> vector<16xf32>
    %17 = rocdl.smfmac.f32.16x16x64.bf16 %arg11, %arg12, %arg3, %0, 0, 0 : (vector<8xbf16>, vector<16xbf16>, vector<4xf32>, i32) -> vector<4xf32>
    %18 = rocdl.smfmac.f32.32x32x32.bf16 %arg11, %arg12, %arg4, %0, 0, 0 : (vector<8xbf16>, vector<16xbf16>, vector<16xf32>, i32) -> vector<16xf32>
    %19 = rocdl.smfmac.i32.16x16x128.i8 %arg8, %arg13, %arg8, %0, 0, 0 : (vector<4xi32>, vector<8xi32>, vector<4xi32>, i32) -> vector<4xi32>
    %20 = rocdl.smfmac.f32.16x16x128.bf8.bf8 %arg8, %arg13, %arg3, %0, 0, 0 : (vector<4xi32>, vector<8xi32>, vector<4xf32>, i32) -> vector<4xf32>
    %21 = rocdl.smfmac.f32.16x16x128.bf8.fp8 %arg8, %arg13, %arg3, %0, 0, 0 : (vector<4xi32>, vector<8xi32>, vector<4xf32>, i32) -> vector<4xf32>
    %22 = rocdl.smfmac.f32.16x16x128.fp8.bf8 %arg8, %arg13, %arg3, %0, 0, 0 : (vector<4xi32>, vector<8xi32>, vector<4xf32>, i32) -> vector<4xf32>
    %23 = rocdl.smfmac.f32.16x16x128.fp8.fp8 %arg8, %arg13, %arg3, %0, 0, 0 : (vector<4xi32>, vector<8xi32>, vector<4xf32>, i32) -> vector<4xf32>
    %24 = rocdl.smfmac.i32.32x32x64.i8 %arg8, %arg13, %arg9, %0, 0, 0 : (vector<4xi32>, vector<8xi32>, vector<16xi32>, i32) -> vector<16xi32>
    %25 = rocdl.smfmac.f32.32x32x64.bf8.bf8 %arg8, %arg13, %arg4, %0, 0, 0 : (vector<4xi32>, vector<8xi32>, vector<16xf32>, i32) -> vector<16xf32>
    %26 = rocdl.smfmac.f32.32x32x64.bf8.fp8 %arg8, %arg13, %arg4, %0, 0, 0 : (vector<4xi32>, vector<8xi32>, vector<16xf32>, i32) -> vector<16xf32>
    %27 = rocdl.smfmac.f32.32x32x64.fp8.bf8 %arg8, %arg13, %arg4, %0, 0, 0 : (vector<4xi32>, vector<8xi32>, vector<16xf32>, i32) -> vector<16xf32>
    %28 = rocdl.smfmac.f32.32x32x64.fp8.fp8 %arg8, %arg13, %arg4, %0, 0, 0 : (vector<4xi32>, vector<8xi32>, vector<16xf32>, i32) -> vector<16xf32>
    llvm.return %1 : vector<4xf32>
  }
  llvm.func @rocdl.mfma.scale.f32.32x32x64.f8f6f4(%arg0: i32, %arg1: vector<16xf32>, %arg2: vector<8xi32>, %arg3: vector<6xi32>, %arg4: vector<4xi32>) -> vector<16xf32> {
    %0 = rocdl.mfma.scale.f32.32x32x64.f8f6f4 %arg2, %arg2, %arg1, fp8_e4m3, fp8_e4m3, 0, %arg0, 0, %arg0 : (vector<8xi32>, vector<8xi32>, vector<16xf32>, i32, i32) -> vector<16xf32>
    %1 = rocdl.mfma.scale.f32.32x32x64.f8f6f4 %arg2, %arg2, %arg1, fp8_e4m3, fp8_e5m2, 0, %arg0, 0, %arg0 : (vector<8xi32>, vector<8xi32>, vector<16xf32>, i32, i32) -> vector<16xf32>
    %2 = rocdl.mfma.scale.f32.32x32x64.f8f6f4 %arg2, %arg3, %arg1, fp8_e4m3, fp6_e2m3, 0, %arg0, 0, %arg0 : (vector<8xi32>, vector<6xi32>, vector<16xf32>, i32, i32) -> vector<16xf32>
    %3 = rocdl.mfma.scale.f32.32x32x64.f8f6f4 %arg2, %arg3, %arg1, fp8_e4m3, fp6_e3m2, 0, %arg0, 0, %arg0 : (vector<8xi32>, vector<6xi32>, vector<16xf32>, i32, i32) -> vector<16xf32>
    %4 = rocdl.mfma.scale.f32.32x32x64.f8f6f4 %arg2, %arg4, %arg1, fp8_e4m3, fp4_e2m1, 0, %arg0, 0, %arg0 : (vector<8xi32>, vector<4xi32>, vector<16xf32>, i32, i32) -> vector<16xf32>
    %5 = rocdl.mfma.scale.f32.32x32x64.f8f6f4 %arg2, %arg2, %arg1, fp8_e5m2, fp8_e4m3, 0, %arg0, 0, %arg0 : (vector<8xi32>, vector<8xi32>, vector<16xf32>, i32, i32) -> vector<16xf32>
    %6 = rocdl.mfma.scale.f32.32x32x64.f8f6f4 %arg2, %arg2, %arg1, fp8_e5m2, fp8_e5m2, 0, %arg0, 0, %arg0 : (vector<8xi32>, vector<8xi32>, vector<16xf32>, i32, i32) -> vector<16xf32>
    %7 = rocdl.mfma.scale.f32.32x32x64.f8f6f4 %arg2, %arg3, %arg1, fp8_e5m2, fp6_e2m3, 0, %arg0, 0, %arg0 : (vector<8xi32>, vector<6xi32>, vector<16xf32>, i32, i32) -> vector<16xf32>
    %8 = rocdl.mfma.scale.f32.32x32x64.f8f6f4 %arg2, %arg3, %arg1, fp8_e5m2, fp6_e3m2, 0, %arg0, 0, %arg0 : (vector<8xi32>, vector<6xi32>, vector<16xf32>, i32, i32) -> vector<16xf32>
    %9 = rocdl.mfma.scale.f32.32x32x64.f8f6f4 %arg2, %arg4, %arg1, fp8_e5m2, fp4_e2m1, 0, %arg0, 0, %arg0 : (vector<8xi32>, vector<4xi32>, vector<16xf32>, i32, i32) -> vector<16xf32>
    %10 = rocdl.mfma.scale.f32.32x32x64.f8f6f4 %arg3, %arg2, %arg1, fp6_e2m3, fp8_e4m3, 0, %arg0, 0, %arg0 : (vector<6xi32>, vector<8xi32>, vector<16xf32>, i32, i32) -> vector<16xf32>
    %11 = rocdl.mfma.scale.f32.32x32x64.f8f6f4 %arg3, %arg2, %arg1, fp6_e2m3, fp8_e5m2, 0, %arg0, 0, %arg0 : (vector<6xi32>, vector<8xi32>, vector<16xf32>, i32, i32) -> vector<16xf32>
    %12 = rocdl.mfma.scale.f32.32x32x64.f8f6f4 %arg3, %arg3, %arg1, fp6_e2m3, fp6_e2m3, 0, %arg0, 0, %arg0 : (vector<6xi32>, vector<6xi32>, vector<16xf32>, i32, i32) -> vector<16xf32>
    %13 = rocdl.mfma.scale.f32.32x32x64.f8f6f4 %arg3, %arg3, %arg1, fp6_e2m3, fp6_e3m2, 0, %arg0, 0, %arg0 : (vector<6xi32>, vector<6xi32>, vector<16xf32>, i32, i32) -> vector<16xf32>
    %14 = rocdl.mfma.scale.f32.32x32x64.f8f6f4 %arg3, %arg4, %arg1, fp6_e2m3, fp4_e2m1, 0, %arg0, 0, %arg0 : (vector<6xi32>, vector<4xi32>, vector<16xf32>, i32, i32) -> vector<16xf32>
    %15 = rocdl.mfma.scale.f32.32x32x64.f8f6f4 %arg3, %arg2, %arg1, fp6_e3m2, fp8_e4m3, 0, %arg0, 0, %arg0 : (vector<6xi32>, vector<8xi32>, vector<16xf32>, i32, i32) -> vector<16xf32>
    %16 = rocdl.mfma.scale.f32.32x32x64.f8f6f4 %arg3, %arg2, %arg1, fp6_e3m2, fp8_e5m2, 0, %arg0, 0, %arg0 : (vector<6xi32>, vector<8xi32>, vector<16xf32>, i32, i32) -> vector<16xf32>
    %17 = rocdl.mfma.scale.f32.32x32x64.f8f6f4 %arg3, %arg3, %arg1, fp6_e3m2, fp6_e2m3, 0, %arg0, 0, %arg0 : (vector<6xi32>, vector<6xi32>, vector<16xf32>, i32, i32) -> vector<16xf32>
    %18 = rocdl.mfma.scale.f32.32x32x64.f8f6f4 %arg3, %arg3, %arg1, fp6_e3m2, fp6_e3m2, 0, %arg0, 0, %arg0 : (vector<6xi32>, vector<6xi32>, vector<16xf32>, i32, i32) -> vector<16xf32>
    %19 = rocdl.mfma.scale.f32.32x32x64.f8f6f4 %arg3, %arg4, %arg1, fp6_e3m2, fp4_e2m1, 0, %arg0, 0, %arg0 : (vector<6xi32>, vector<4xi32>, vector<16xf32>, i32, i32) -> vector<16xf32>
    %20 = rocdl.mfma.scale.f32.32x32x64.f8f6f4 %arg4, %arg2, %arg1, fp4_e2m1, fp8_e4m3, 0, %arg0, 0, %arg0 : (vector<4xi32>, vector<8xi32>, vector<16xf32>, i32, i32) -> vector<16xf32>
    %21 = rocdl.mfma.scale.f32.32x32x64.f8f6f4 %arg4, %arg2, %arg1, fp4_e2m1, fp8_e5m2, 0, %arg0, 0, %arg0 : (vector<4xi32>, vector<8xi32>, vector<16xf32>, i32, i32) -> vector<16xf32>
    %22 = rocdl.mfma.scale.f32.32x32x64.f8f6f4 %arg4, %arg3, %arg1, fp4_e2m1, fp6_e2m3, 0, %arg0, 0, %arg0 : (vector<4xi32>, vector<6xi32>, vector<16xf32>, i32, i32) -> vector<16xf32>
    %23 = rocdl.mfma.scale.f32.32x32x64.f8f6f4 %arg4, %arg3, %arg1, fp4_e2m1, fp6_e3m2, 0, %arg0, 0, %arg0 : (vector<4xi32>, vector<6xi32>, vector<16xf32>, i32, i32) -> vector<16xf32>
    %24 = rocdl.mfma.scale.f32.32x32x64.f8f6f4 %arg4, %arg4, %arg1, fp4_e2m1, fp4_e2m1, 0, %arg0, 0, %arg0 : (vector<4xi32>, vector<4xi32>, vector<16xf32>, i32, i32) -> vector<16xf32>
    llvm.return %0 : vector<16xf32>
  }
  llvm.func @rocdl.mfma.scale.f32.16x16x128.f8f6f4(%arg0: i32, %arg1: vector<4xf32>, %arg2: vector<8xi32>, %arg3: vector<6xi32>, %arg4: vector<4xi32>) -> vector<4xf32> {
    %0 = rocdl.mfma.scale.f32.16x16x128.f8f6f4 %arg2, %arg2, %arg1, fp8_e4m3, fp8_e4m3, 0, %arg0, 0, %arg0 : (vector<8xi32>, vector<8xi32>, vector<4xf32>, i32, i32) -> vector<4xf32>
    %1 = rocdl.mfma.scale.f32.16x16x128.f8f6f4 %arg2, %arg2, %arg1, fp8_e4m3, fp8_e5m2, 0, %arg0, 0, %arg0 : (vector<8xi32>, vector<8xi32>, vector<4xf32>, i32, i32) -> vector<4xf32>
    %2 = rocdl.mfma.scale.f32.16x16x128.f8f6f4 %arg2, %arg3, %arg1, fp8_e4m3, fp6_e2m3, 0, %arg0, 0, %arg0 : (vector<8xi32>, vector<6xi32>, vector<4xf32>, i32, i32) -> vector<4xf32>
    %3 = rocdl.mfma.scale.f32.16x16x128.f8f6f4 %arg2, %arg3, %arg1, fp8_e4m3, fp6_e3m2, 0, %arg0, 0, %arg0 : (vector<8xi32>, vector<6xi32>, vector<4xf32>, i32, i32) -> vector<4xf32>
    %4 = rocdl.mfma.scale.f32.16x16x128.f8f6f4 %arg2, %arg4, %arg1, fp8_e4m3, fp4_e2m1, 0, %arg0, 0, %arg0 : (vector<8xi32>, vector<4xi32>, vector<4xf32>, i32, i32) -> vector<4xf32>
    %5 = rocdl.mfma.scale.f32.16x16x128.f8f6f4 %arg2, %arg2, %arg1, fp8_e5m2, fp8_e4m3, 0, %arg0, 0, %arg0 : (vector<8xi32>, vector<8xi32>, vector<4xf32>, i32, i32) -> vector<4xf32>
    %6 = rocdl.mfma.scale.f32.16x16x128.f8f6f4 %arg2, %arg2, %arg1, fp8_e5m2, fp8_e5m2, 0, %arg0, 0, %arg0 : (vector<8xi32>, vector<8xi32>, vector<4xf32>, i32, i32) -> vector<4xf32>
    %7 = rocdl.mfma.scale.f32.16x16x128.f8f6f4 %arg2, %arg3, %arg1, fp8_e5m2, fp6_e2m3, 0, %arg0, 0, %arg0 : (vector<8xi32>, vector<6xi32>, vector<4xf32>, i32, i32) -> vector<4xf32>
    %8 = rocdl.mfma.scale.f32.16x16x128.f8f6f4 %arg2, %arg3, %arg1, fp8_e5m2, fp6_e3m2, 0, %arg0, 0, %arg0 : (vector<8xi32>, vector<6xi32>, vector<4xf32>, i32, i32) -> vector<4xf32>
    %9 = rocdl.mfma.scale.f32.16x16x128.f8f6f4 %arg2, %arg4, %arg1, fp8_e5m2, fp4_e2m1, 0, %arg0, 0, %arg0 : (vector<8xi32>, vector<4xi32>, vector<4xf32>, i32, i32) -> vector<4xf32>
    %10 = rocdl.mfma.scale.f32.16x16x128.f8f6f4 %arg3, %arg2, %arg1, fp6_e2m3, fp8_e4m3, 0, %arg0, 0, %arg0 : (vector<6xi32>, vector<8xi32>, vector<4xf32>, i32, i32) -> vector<4xf32>
    %11 = rocdl.mfma.scale.f32.16x16x128.f8f6f4 %arg3, %arg2, %arg1, fp6_e2m3, fp8_e5m2, 0, %arg0, 0, %arg0 : (vector<6xi32>, vector<8xi32>, vector<4xf32>, i32, i32) -> vector<4xf32>
    %12 = rocdl.mfma.scale.f32.16x16x128.f8f6f4 %arg3, %arg3, %arg1, fp6_e2m3, fp6_e2m3, 0, %arg0, 0, %arg0 : (vector<6xi32>, vector<6xi32>, vector<4xf32>, i32, i32) -> vector<4xf32>
    %13 = rocdl.mfma.scale.f32.16x16x128.f8f6f4 %arg3, %arg3, %arg1, fp6_e2m3, fp6_e3m2, 0, %arg0, 0, %arg0 : (vector<6xi32>, vector<6xi32>, vector<4xf32>, i32, i32) -> vector<4xf32>
    %14 = rocdl.mfma.scale.f32.16x16x128.f8f6f4 %arg3, %arg4, %arg1, fp6_e2m3, fp4_e2m1, 0, %arg0, 0, %arg0 : (vector<6xi32>, vector<4xi32>, vector<4xf32>, i32, i32) -> vector<4xf32>
    %15 = rocdl.mfma.scale.f32.16x16x128.f8f6f4 %arg3, %arg2, %arg1, fp6_e3m2, fp8_e4m3, 0, %arg0, 0, %arg0 : (vector<6xi32>, vector<8xi32>, vector<4xf32>, i32, i32) -> vector<4xf32>
    %16 = rocdl.mfma.scale.f32.16x16x128.f8f6f4 %arg3, %arg2, %arg1, fp6_e3m2, fp8_e5m2, 0, %arg0, 0, %arg0 : (vector<6xi32>, vector<8xi32>, vector<4xf32>, i32, i32) -> vector<4xf32>
    %17 = rocdl.mfma.scale.f32.16x16x128.f8f6f4 %arg3, %arg3, %arg1, fp6_e3m2, fp6_e2m3, 0, %arg0, 0, %arg0 : (vector<6xi32>, vector<6xi32>, vector<4xf32>, i32, i32) -> vector<4xf32>
    %18 = rocdl.mfma.scale.f32.16x16x128.f8f6f4 %arg3, %arg3, %arg1, fp6_e3m2, fp6_e3m2, 0, %arg0, 0, %arg0 : (vector<6xi32>, vector<6xi32>, vector<4xf32>, i32, i32) -> vector<4xf32>
    %19 = rocdl.mfma.scale.f32.16x16x128.f8f6f4 %arg3, %arg4, %arg1, fp6_e3m2, fp4_e2m1, 0, %arg0, 0, %arg0 : (vector<6xi32>, vector<4xi32>, vector<4xf32>, i32, i32) -> vector<4xf32>
    %20 = rocdl.mfma.scale.f32.16x16x128.f8f6f4 %arg4, %arg2, %arg1, fp4_e2m1, fp8_e4m3, 0, %arg0, 0, %arg0 : (vector<4xi32>, vector<8xi32>, vector<4xf32>, i32, i32) -> vector<4xf32>
    %21 = rocdl.mfma.scale.f32.16x16x128.f8f6f4 %arg4, %arg2, %arg1, fp4_e2m1, fp8_e5m2, 0, %arg0, 0, %arg0 : (vector<4xi32>, vector<8xi32>, vector<4xf32>, i32, i32) -> vector<4xf32>
    %22 = rocdl.mfma.scale.f32.16x16x128.f8f6f4 %arg4, %arg3, %arg1, fp4_e2m1, fp6_e2m3, 0, %arg0, 0, %arg0 : (vector<4xi32>, vector<6xi32>, vector<4xf32>, i32, i32) -> vector<4xf32>
    %23 = rocdl.mfma.scale.f32.16x16x128.f8f6f4 %arg4, %arg3, %arg1, fp4_e2m1, fp6_e3m2, 0, %arg0, 0, %arg0 : (vector<4xi32>, vector<6xi32>, vector<4xf32>, i32, i32) -> vector<4xf32>
    %24 = rocdl.mfma.scale.f32.16x16x128.f8f6f4 %arg4, %arg4, %arg1, fp4_e2m1, fp4_e2m1, 0, %arg0, 0, %arg0 : (vector<4xi32>, vector<4xi32>, vector<4xf32>, i32, i32) -> vector<4xf32>
    llvm.return %0 : vector<4xf32>
  }
  llvm.func @rocdl.wmma(%arg0: vector<8xf32>, %arg1: vector<16xf16>, %arg2: vector<16xi16>, %arg3: vector<8xi32>, %arg4: vector<2xi32>, %arg5: vector<4xi32>, %arg6: vector<4xf32>, %arg7: vector<8xf16>, %arg8: vector<8xi16>, %arg9: vector<32xf16>, %arg10: vector<16xf32>, %arg11: vector<4xf32>, %arg12: vector<32xf32>, %arg13: vector<64xf32>, %arg14: vector<64xi32>, %arg15: vector<64xf16>, %arg16: vector<16xbf16>, %arg17: vector<32xbf16>) -> vector<8xf32> {
    %0 = rocdl.wmma.f32.16x16x16.f16 %arg1, %arg1, %arg0 : (vector<16xf16>, vector<16xf16>, vector<8xf32>) -> vector<8xf32>
    %1 = rocdl.wmma.f32.16x16x16.bf16 %arg2, %arg2, %arg0 : (vector<16xi16>, vector<16xi16>, vector<8xf32>) -> vector<8xf32>
    %2 = rocdl.wmma.f16.16x16x16.f16 %arg1, %arg1, %arg1 : (vector<16xf16>, vector<16xf16>, vector<16xf16>) -> vector<16xf16>
    %3 = rocdl.wmma.bf16.16x16x16.bf16 %arg2, %arg2, %arg2 : (vector<16xi16>, vector<16xi16>, vector<16xi16>) -> vector<16xi16>
    %4 = rocdl.wmma.i32.16x16x16.iu8 %arg5, %arg5, %arg3 : (vector<4xi32>, vector<4xi32>, vector<8xi32>) -> vector<8xi32>
    %5 = rocdl.wmma.i32.16x16x16.iu4 %arg4, %arg4, %arg3 : (vector<2xi32>, vector<2xi32>, vector<8xi32>) -> vector<8xi32>
    %6 = rocdl.wmma.i32.16x16x32.iu4 %arg4, %arg4, %arg3 : (vector<2xi32>, vector<2xi32>, vector<8xi32>) -> vector<8xi32>
    %7 = rocdl.wmma.i32.16x16x16.iu8 %arg5, %arg5, %arg3 {signA = true} : (vector<4xi32>, vector<4xi32>, vector<8xi32>) -> vector<8xi32>
    %8 = rocdl.wmma.i32.16x16x16.iu8 %arg5, %arg5, %arg3 {signB = true} : (vector<4xi32>, vector<4xi32>, vector<8xi32>) -> vector<8xi32>
    %9 = rocdl.wmma.i32.16x16x16.iu8 %arg5, %arg5, %arg3 {clamp = true, signA = true, signB = true} : (vector<4xi32>, vector<4xi32>, vector<8xi32>) -> vector<8xi32>
    %10 = rocdl.wmma.i32.16x16x16.iu4 %arg4, %arg4, %arg3 {signA = true} : (vector<2xi32>, vector<2xi32>, vector<8xi32>) -> vector<8xi32>
    %11 = rocdl.wmma.i32.16x16x16.iu4 %arg4, %arg4, %arg3 {clamp = true, signB = true} : (vector<2xi32>, vector<2xi32>, vector<8xi32>) -> vector<8xi32>
    %12 = rocdl.wmma.i32.16x16x32.iu4 %arg4, %arg4, %arg3 {signA = true, signB = true} : (vector<2xi32>, vector<2xi32>, vector<8xi32>) -> vector<8xi32>
    %13 = rocdl.wmma.f32.16x16x4.f32 %arg10, %arg10, %arg11, modC = none : (vector<16xf32>, vector<16xf32>, vector<4xf32>) -> vector<4xf32>
    %14 = rocdl.wmma.f32.16x16x32.f16 %arg1, %arg1, %arg12, modC = none : (vector<16xf16>, vector<16xf16>, vector<32xf32>) -> vector<32xf32>
    %15 = rocdl.wmma.f32.16x16x32.bf16 %arg16, %arg16, %arg12, modC = none : (vector<16xbf16>, vector<16xbf16>, vector<32xf32>) -> vector<32xf32>
    %16 = rocdl.wmma.f16.16x16x32.f16 %arg1, %arg1, %arg9, modC = none : (vector<16xf16>, vector<16xf16>, vector<32xf16>) -> vector<32xf16>
    %17 = rocdl.wmma.bf16.16x16x32.bf16 %arg16, %arg16, %arg17, modC = none : (vector<16xbf16>, vector<16xbf16>, vector<32xbf16>) -> vector<32xbf16>
    %18 = rocdl.wmma.bf16f32.16x16x32.bf16 %arg16, %arg16, %arg12, modC = none : (vector<16xbf16>, vector<16xbf16>, vector<32xf32>) -> vector<32xbf16>
    %19 = rocdl.wmma.f32.16x16x64.fp8_fp8 %arg5, %arg5, %arg13, modC = none : (vector<4xi32>, vector<4xi32>, vector<64xf32>) -> vector<64xf32>
    %20 = rocdl.wmma.f32.16x16x64.fp8_bf8 %arg5, %arg5, %arg13, modC = none : (vector<4xi32>, vector<4xi32>, vector<64xf32>) -> vector<64xf32>
    %21 = rocdl.wmma.f32.16x16x64.bf8_fp8 %arg5, %arg5, %arg13, modC = none : (vector<4xi32>, vector<4xi32>, vector<64xf32>) -> vector<64xf32>
    %22 = rocdl.wmma.f32.16x16x64.bf8_bf8 %arg5, %arg5, %arg13, modC = none : (vector<4xi32>, vector<4xi32>, vector<64xf32>) -> vector<64xf32>
    %23 = rocdl.wmma.f16.16x16x64.fp8_fp8 %arg5, %arg5, %arg15, modC = none : (vector<4xi32>, vector<4xi32>, vector<64xf16>) -> vector<64xf16>
    %24 = rocdl.wmma.f16.16x16x64.fp8_bf8 %arg5, %arg5, %arg15, modC = none : (vector<4xi32>, vector<4xi32>, vector<64xf16>) -> vector<64xf16>
    %25 = rocdl.wmma.f16.16x16x64.bf8_fp8 %arg5, %arg5, %arg15, modC = none : (vector<4xi32>, vector<4xi32>, vector<64xf16>) -> vector<64xf16>
    %26 = rocdl.wmma.f16.16x16x64.bf8_bf8 %arg5, %arg5, %arg15, modC = none : (vector<4xi32>, vector<4xi32>, vector<64xf16>) -> vector<64xf16>
    %27 = rocdl.wmma.f32.16x16x128.fp8_fp8 %arg5, %arg5, %arg13, modC = none : (vector<4xi32>, vector<4xi32>, vector<64xf32>) -> vector<64xf32>
    %28 = rocdl.wmma.f32.16x16x128.fp8_bf8 %arg5, %arg5, %arg13, modC = none : (vector<4xi32>, vector<4xi32>, vector<64xf32>) -> vector<64xf32>
    %29 = rocdl.wmma.f32.16x16x128.bf8_fp8 %arg5, %arg5, %arg13, modC = none : (vector<4xi32>, vector<4xi32>, vector<64xf32>) -> vector<64xf32>
    %30 = rocdl.wmma.f32.16x16x128.bf8_bf8 %arg5, %arg5, %arg13, modC = none : (vector<4xi32>, vector<4xi32>, vector<64xf32>) -> vector<64xf32>
    %31 = rocdl.wmma.f16.16x16x128.fp8_fp8 %arg5, %arg5, %arg15, modC = none : (vector<4xi32>, vector<4xi32>, vector<64xf16>) -> vector<64xf16>
    %32 = rocdl.wmma.f16.16x16x128.fp8_bf8 %arg5, %arg5, %arg15, modC = none : (vector<4xi32>, vector<4xi32>, vector<64xf16>) -> vector<64xf16>
    %33 = rocdl.wmma.f16.16x16x128.bf8_fp8 %arg5, %arg5, %arg15, modC = none : (vector<4xi32>, vector<4xi32>, vector<64xf16>) -> vector<64xf16>
    %34 = rocdl.wmma.f16.16x16x128.bf8_bf8 %arg5, %arg5, %arg15, modC = none : (vector<4xi32>, vector<4xi32>, vector<64xf16>) -> vector<64xf16>
    %35 = rocdl.wmma.i32.16x16x64.iu8 %arg5, %arg5, %arg14 : (vector<4xi32>, vector<4xi32>, vector<64xi32>) -> vector<64xi32>
    %36 = rocdl.wmma.i32.16x16x64.iu8 %arg5, %arg5, %arg14 {signA = true, signB = true} : (vector<4xi32>, vector<4xi32>, vector<64xi32>) -> vector<64xi32>
    %37 = rocdl.wmma.i32.16x16x64.iu8 %arg5, %arg5, %arg14 {reuseA = true, reuseB = true, signA = true} : (vector<4xi32>, vector<4xi32>, vector<64xi32>) -> vector<64xi32>
    %38 = rocdl.wmma.f32.16x16x4.f32 %arg10, %arg10, %arg11, modC = neg : (vector<16xf32>, vector<16xf32>, vector<4xf32>) -> vector<4xf32>
    %39 = rocdl.wmma.f32.16x16x32.f16 %arg1, %arg1, %arg12, modC = abs {reuseA = true} : (vector<16xf16>, vector<16xf16>, vector<32xf32>) -> vector<32xf32>
    %40 = rocdl.wmma.f32.16x16x32.bf16 %arg16, %arg16, %arg12, modC = neg_abs {reuseB = true} : (vector<16xbf16>, vector<16xbf16>, vector<32xf32>) -> vector<32xf32>
    %41 = rocdl.wmma.f32.16x16x16.f16 %arg1, %arg1, %arg6 : (vector<16xf16>, vector<16xf16>, vector<4xf32>) -> vector<4xf32>
    %42 = rocdl.wmma.f32.16x16x16.bf16 %arg2, %arg2, %arg6 : (vector<16xi16>, vector<16xi16>, vector<4xf32>) -> vector<4xf32>
    %43 = rocdl.wmma.f16.16x16x16.f16 %arg1, %arg1, %arg7 : (vector<16xf16>, vector<16xf16>, vector<8xf16>) -> vector<8xf16>
    %44 = rocdl.wmma.bf16.16x16x16.bf16 %arg2, %arg2, %arg8 : (vector<16xi16>, vector<16xi16>, vector<8xi16>) -> vector<8xi16>
    %45 = rocdl.wmma.i32.16x16x16.iu8 %arg5, %arg5, %arg5 {clamp = true} : (vector<4xi32>, vector<4xi32>, vector<4xi32>) -> vector<4xi32>
    %46 = rocdl.wmma.i32.16x16x16.iu4 %arg4, %arg4, %arg5 {clamp = true} : (vector<2xi32>, vector<2xi32>, vector<4xi32>) -> vector<4xi32>
    llvm.return %0 : vector<8xf32>
  }
  llvm.func @rocdl.swmmac(%arg0: vector<32xf16>, %arg1: vector<32xbf16>, %arg2: vector<16xf16>, %arg3: vector<16xbf16>, %arg4: vector<16xi32>, %arg5: vector<16xi16>, %arg6: vector<8xf32>, %arg7: vector<8xi32>, %arg8: vector<8xf16>, %arg9: vector<8xbf16>, %arg10: vector<8xi16>, %arg11: vector<4xf32>, %arg12: vector<4xf16>, %arg13: vector<4xi32>, %arg14: vector<4xi16>, %arg15: vector<2xi32>, %arg16: i32, %arg17: i32) -> vector<8xf32> {
    %0 = rocdl.swmmac.f32.16x16x32.f16 %arg8, %arg2, %arg6, %arg17 : (vector<8xf16>, vector<16xf16>, vector<8xf32>, i32) -> vector<8xf32>
    %1 = rocdl.swmmac.f32.16x16x32.bf16 %arg10, %arg5, %arg6, %arg17 : (vector<8xi16>, vector<16xi16>, vector<8xf32>, i32) -> vector<8xf32>
    %2 = rocdl.swmmac.f16.16x16x32.f16 %arg8, %arg2, %arg8, %arg17 : (vector<8xf16>, vector<16xf16>, vector<8xf16>, i32) -> vector<8xf16>
    %3 = rocdl.swmmac.bf16.16x16x32.bf16 %arg10, %arg5, %arg10, %arg17 : (vector<8xi16>, vector<16xi16>, vector<8xi16>, i32) -> vector<8xi16>
    %4 = rocdl.swmmac.i32.16x16x32.iu8 %arg15, %arg13, %arg7, %arg17 : (vector<2xi32>, vector<4xi32>, vector<8xi32>, i32) -> vector<8xi32>
    %5 = rocdl.swmmac.i32.16x16x32.iu4 %arg16, %arg15, %arg7, %arg17 : (i32, vector<2xi32>, vector<8xi32>, i32) -> vector<8xi32>
    %6 = rocdl.swmmac.i32.16x16x64.iu4 %arg15, %arg13, %arg7, %arg17 : (vector<2xi32>, vector<4xi32>, vector<8xi32>, i32) -> vector<8xi32>
    %7 = rocdl.swmmac.f32.16x16x32.fp8.fp8 %arg15, %arg13, %arg6, %arg17 : (vector<2xi32>, vector<4xi32>, vector<8xf32>, i32) -> vector<8xf32>
    %8 = rocdl.swmmac.f32.16x16x32.fp8.bf8 %arg15, %arg13, %arg6, %arg17 : (vector<2xi32>, vector<4xi32>, vector<8xf32>, i32) -> vector<8xf32>
    %9 = rocdl.swmmac.f32.16x16x32.bf8.fp8 %arg15, %arg13, %arg6, %arg17 : (vector<2xi32>, vector<4xi32>, vector<8xf32>, i32) -> vector<8xf32>
    %10 = rocdl.swmmac.f32.16x16x32.bf8.bf8 %arg15, %arg13, %arg6, %arg17 : (vector<2xi32>, vector<4xi32>, vector<8xf32>, i32) -> vector<8xf32>
    %11 = rocdl.swmmac.f32.16x16x64.f16 %arg2, %arg0, %arg6, %arg17 : (vector<16xf16>, vector<32xf16>, vector<8xf32>, i32) -> vector<8xf32>
    %12 = rocdl.swmmac.f32.16x16x64.bf16 %arg3, %arg1, %arg6, %arg17 : (vector<16xbf16>, vector<32xbf16>, vector<8xf32>, i32) -> vector<8xf32>
    %13 = rocdl.swmmac.f16.16x16x64.f16 %arg2, %arg0, %arg8, %arg17 : (vector<16xf16>, vector<32xf16>, vector<8xf16>, i32) -> vector<8xf16>
    %14 = rocdl.swmmac.bf16.16x16x64.bf16 %arg3, %arg1, %arg9, %arg17 : (vector<16xbf16>, vector<32xbf16>, vector<8xbf16>, i32) -> vector<8xbf16>
    %15 = rocdl.swmmac.bf16f32.16x16x64.bf16 %arg3, %arg1, %arg9, %arg17 : (vector<16xbf16>, vector<32xbf16>, vector<8xbf16>, i32) -> vector<8xbf16>
    %16 = rocdl.swmmac.f32.16x16x128.fp8.fp8 %arg7, %arg4, %arg6, %arg17 : (vector<8xi32>, vector<16xi32>, vector<8xf32>, i32) -> vector<8xf32>
    %17 = rocdl.swmmac.f32.16x16x128.fp8.bf8 %arg7, %arg4, %arg6, %arg17 : (vector<8xi32>, vector<16xi32>, vector<8xf32>, i32) -> vector<8xf32>
    %18 = rocdl.swmmac.f32.16x16x128.bf8.fp8 %arg7, %arg4, %arg6, %arg17 : (vector<8xi32>, vector<16xi32>, vector<8xf32>, i32) -> vector<8xf32>
    %19 = rocdl.swmmac.f32.16x16x128.bf8.bf8 %arg7, %arg4, %arg6, %arg17 : (vector<8xi32>, vector<16xi32>, vector<8xf32>, i32) -> vector<8xf32>
    %20 = rocdl.swmmac.f16.16x16x128.fp8.fp8 %arg7, %arg4, %arg8, %arg17 : (vector<8xi32>, vector<16xi32>, vector<8xf16>, i32) -> vector<8xf16>
    %21 = rocdl.swmmac.f16.16x16x128.fp8.bf8 %arg7, %arg4, %arg8, %arg17 : (vector<8xi32>, vector<16xi32>, vector<8xf16>, i32) -> vector<8xf16>
    %22 = rocdl.swmmac.f16.16x16x128.bf8.fp8 %arg7, %arg4, %arg8, %arg17 : (vector<8xi32>, vector<16xi32>, vector<8xf16>, i32) -> vector<8xf16>
    %23 = rocdl.swmmac.f16.16x16x128.bf8.bf8 %arg7, %arg4, %arg8, %arg17 : (vector<8xi32>, vector<16xi32>, vector<8xf16>, i32) -> vector<8xf16>
    %24 = rocdl.swmmac.i32.16x16x128.iu8 %arg7, %arg4, %arg7, %arg17 : (vector<8xi32>, vector<16xi32>, vector<8xi32>, i32) -> vector<8xi32>
    %25 = rocdl.swmmac.f32.16x16x32.f16 %arg12, %arg8, %arg11, %arg17 : (vector<4xf16>, vector<8xf16>, vector<4xf32>, i32) -> vector<4xf32>
    %26 = rocdl.swmmac.f32.16x16x32.bf16 %arg14, %arg10, %arg11, %arg17 : (vector<4xi16>, vector<8xi16>, vector<4xf32>, i32) -> vector<4xf32>
    %27 = rocdl.swmmac.f16.16x16x32.f16 %arg12, %arg8, %arg12, %arg17 : (vector<4xf16>, vector<8xf16>, vector<4xf16>, i32) -> vector<4xf16>
    %28 = rocdl.swmmac.bf16.16x16x32.bf16 %arg14, %arg10, %arg14, %arg17 : (vector<4xi16>, vector<8xi16>, vector<4xi16>, i32) -> vector<4xi16>
    %29 = rocdl.swmmac.i32.16x16x32.iu8 %arg16, %arg15, %arg13, %arg17 : (i32, vector<2xi32>, vector<4xi32>, i32) -> vector<4xi32>
    %30 = rocdl.swmmac.i32.16x16x32.iu4 %arg16, %arg16, %arg13, %arg17 : (i32, i32, vector<4xi32>, i32) -> vector<4xi32>
    %31 = rocdl.swmmac.i32.16x16x64.iu4 %arg16, %arg15, %arg13, %arg17 : (i32, vector<2xi32>, vector<4xi32>, i32) -> vector<4xi32>
    %32 = rocdl.swmmac.f32.16x16x32.fp8.fp8 %arg16, %arg15, %arg11, %arg17 : (i32, vector<2xi32>, vector<4xf32>, i32) -> vector<4xf32>
    %33 = rocdl.swmmac.f32.16x16x32.fp8.bf8 %arg16, %arg15, %arg11, %arg17 : (i32, vector<2xi32>, vector<4xf32>, i32) -> vector<4xf32>
    %34 = rocdl.swmmac.f32.16x16x32.bf8.fp8 %arg16, %arg15, %arg11, %arg17 : (i32, vector<2xi32>, vector<4xf32>, i32) -> vector<4xf32>
    %35 = rocdl.swmmac.f32.16x16x32.bf8.bf8 %arg16, %arg15, %arg11, %arg17 : (i32, vector<2xi32>, vector<4xf32>, i32) -> vector<4xf32>
    llvm.return %0 : vector<8xf32>
  }
  llvm.func @rocdl.ds.read.tr(%arg0: !llvm.ptr<3>) -> vector<4xf16> {
    %0 = rocdl.ds.read.tr4.b64 %arg0 : <3> -> vector<2xi32>
    %1 = rocdl.ds.read.tr6.b96 %arg0 : <3> -> vector<3xi32>
    %2 = rocdl.ds.read.tr8.b64 %arg0 : <3> -> vector<2xi32>
    %3 = rocdl.ds.read.tr16.b64 %arg0 : <3> -> vector<4xf16>
    %4 = rocdl.ds.read.tr16.b64 %arg0 : <3> -> vector<4xbf16>
    llvm.return %3 : vector<4xf16>
  }
  llvm.func @rocdl.load.tr.ops(%arg0: !llvm.ptr<1>, %arg1: !llvm.ptr<3>) {
    %0 = rocdl.global.load.tr4.b64 %arg0 : !llvm.ptr<1> -> vector<2xi32>
    %1 = rocdl.global.load.tr.b64 %arg0 : !llvm.ptr<1> -> vector<2xi32>
    %2 = rocdl.global.load.tr6.b96 %arg0 : !llvm.ptr<1> -> vector<3xi32>
    %3 = rocdl.global.load.tr.b128 %arg0 : !llvm.ptr<1> -> vector<8xi16>
    %4 = rocdl.global.load.tr.b128 %arg0 : !llvm.ptr<1> -> vector<8xf16>
    %5 = rocdl.global.load.tr.b128 %arg0 : !llvm.ptr<1> -> vector<8xbf16>
    %6 = rocdl.ds.load.tr4.b64 %arg1 : !llvm.ptr<3> -> vector<2xi32>
    %7 = rocdl.ds.load.tr8.b64 %arg1 : !llvm.ptr<3> -> vector<2xi32>
    %8 = rocdl.ds.load.tr6.b96 %arg1 : !llvm.ptr<3> -> vector<3xi32>
    %9 = rocdl.ds.load.tr16.b128 %arg1 : !llvm.ptr<3> -> vector<8xi16>
    %10 = rocdl.ds.load.tr16.b128 %arg1 : !llvm.ptr<3> -> vector<8xf16>
    %11 = rocdl.ds.load.tr16.b128 %arg1 : !llvm.ptr<3> -> vector<8xbf16>
    llvm.return
  }
  llvm.func @rocdl.load.to.lds(%arg0: !llvm.ptr<7>, %arg1: !llvm.ptr<3>) {
    rocdl.load.to.lds %arg0, %arg1, 4, 0, 0 : <7>
    llvm.return
  }
  llvm.func @rocdl.load.async.to.lds(%arg0: !llvm.ptr<7>, %arg1: !llvm.ptr<3>) {
    rocdl.load.async.to.lds %arg0, %arg1, 4, 0, 0 : !llvm.ptr<7>, !llvm.ptr<3>
    llvm.return
  }
  llvm.func @rocdl.global.load.lds(%arg0: !llvm.ptr<1>, %arg1: !llvm.ptr<3>) {
    rocdl.global.load.lds %arg0, %arg1, 4, 0, 0
    llvm.return
  }
  llvm.func @rocdl.global.load.async.lds(%arg0: !llvm.ptr<1>, %arg1: !llvm.ptr<3>) {
    rocdl.global.load.async.lds %arg0, %arg1, 4, 0, 0 : !llvm.ptr<1>, !llvm.ptr<3>
    llvm.return
  }
  llvm.func @rocdl.global.load.async.to.lds(%arg0: !llvm.ptr<1>, %arg1: !llvm.ptr<3>) {
    rocdl.global.load.async.to.lds.b8 %arg0, %arg1, 0, 0 : !llvm.ptr<1>, !llvm.ptr<3>
    rocdl.global.load.async.to.lds.b32 %arg0, %arg1, 0, 0 : !llvm.ptr<1>, !llvm.ptr<3>
    rocdl.global.load.async.to.lds.b64 %arg0, %arg1, 0, 0 : !llvm.ptr<1>, !llvm.ptr<3>
    rocdl.global.load.async.to.lds.b128 %arg0, %arg1, 0, 0 : !llvm.ptr<1>, !llvm.ptr<3>
    llvm.return
  }
  llvm.func @rocdl.global.store.async.from.lds(%arg0: !llvm.ptr<1>, %arg1: !llvm.ptr<3>) {
    rocdl.global.store.async.from.lds.b8 %arg0, %arg1, 0, 0 : !llvm.ptr<1>, !llvm.ptr<3>
    rocdl.global.store.async.from.lds.b32 %arg0, %arg1, 0, 0 : !llvm.ptr<1>, !llvm.ptr<3>
    rocdl.global.store.async.from.lds.b64 %arg0, %arg1, 0, 0 : !llvm.ptr<1>, !llvm.ptr<3>
    rocdl.global.store.async.from.lds.b128 %arg0, %arg1, 0, 0 : !llvm.ptr<1>, !llvm.ptr<3>
    llvm.return
  }
  llvm.func @rocdl.cluster.load.async.to.lds(%arg0: !llvm.ptr<1>, %arg1: !llvm.ptr<3>, %arg2: i32) {
    rocdl.cluster.load.async.to.lds.b8 %arg0, %arg1, 0, 0, %arg2 : !llvm.ptr<1>, !llvm.ptr<3>
    rocdl.cluster.load.async.to.lds.b32 %arg0, %arg1, 0, 0, %arg2 : !llvm.ptr<1>, !llvm.ptr<3>
    rocdl.cluster.load.async.to.lds.b64 %arg0, %arg1, 0, 0, %arg2 : !llvm.ptr<1>, !llvm.ptr<3>
    rocdl.cluster.load.async.to.lds.b128 %arg0, %arg1, 0, 0, %arg2 : !llvm.ptr<1>, !llvm.ptr<3>
    llvm.return
  }
  llvm.func @rocdl.tensor.load.to.lds(%arg0: vector<4xi32>, %arg1: vector<8xi32>, %arg2: vector<4xi32>, %arg3: vector<4xi32>, %arg4: vector<8xi32>) {
    rocdl.tensor.load.to.lds %arg0, %arg1, %arg2, %arg3, %arg4, 0 : vector<4xi32>, vector<8xi32>
    llvm.return
  }
  llvm.func @rocdl.tensor.store.from.lds(%arg0: vector<4xi32>, %arg1: vector<8xi32>, %arg2: vector<4xi32>, %arg3: vector<4xi32>, %arg4: vector<8xi32>) {
    rocdl.tensor.store.from.lds %arg0, %arg1, %arg2, %arg3, %arg4, 0 : vector<4xi32>, vector<8xi32>
    llvm.return
  }
  llvm.func @rocdl.make.buffer.rsrc(%arg0: !llvm.ptr, %arg1: i16, %arg2: i64, %arg3: i32) -> !llvm.ptr<8> {
    %0 = rocdl.make.buffer.rsrc %arg0, %arg1, %arg2, %arg3 : !llvm.ptr to <8>
    llvm.return %0 : !llvm.ptr<8>
  }
  llvm.func @rocdl.make.buffer.rsrc.p7.p1(%arg0: !llvm.ptr<1>, %arg1: i16, %arg2: i64, %arg3: i32) -> !llvm.ptr<7> {
    %0 = rocdl.make.buffer.rsrc %arg0, %arg1, %arg2, %arg3 : <1> to <7>
    llvm.return %0 : !llvm.ptr<7>
  }
  llvm.func @rocdl.permlanex16(%arg0: f32, %arg1: i32, %arg2: vector<2xf32>, %arg3: vector<2xi32>) -> f32 {
    %0 = llvm.mlir.constant(-1 : i32) : i32
    %1 = rocdl.permlanex16 %arg0, %arg0, %0, %0, false, true : f32, i32
    %2 = rocdl.permlanex16 %arg1, %arg1, %0, %0, false, true : i32, i32
    %3 = rocdl.permlanex16 %arg2, %arg2, %0, %0, false, true : vector<2xf32>, i32
    %4 = rocdl.permlanex16 %arg3, %arg3, %0, %0, false, true : vector<2xi32>, i32
    llvm.return %1 : f32
  }
  llvm.func @rocdl.permlane16.swap(%arg0: i32) -> !llvm.struct<(i32, i32)> {
    %0 = rocdl.permlane16.swap %arg0, %arg0, false, true : (i32, i32) -> <(i32, i32)>
    llvm.return %0 : !llvm.struct<(i32, i32)>
  }
  llvm.func @rocdl.permlane32.swap(%arg0: i32) -> !llvm.struct<(i32, i32)> {
    %0 = rocdl.permlane32.swap %arg0, %arg0, false, true : (i32, i32) -> <(i32, i32)>
    llvm.return %0 : !llvm.struct<(i32, i32)>
  }
  llvm.func @rocdl.permlane16.var(%arg0: i32) -> i32 {
    %0 = llvm.mlir.constant(-1 : i32) : i32
    %1 = rocdl.permlane16.var %arg0, %arg0, %0, false, true : (i32, i32, i32) -> i32
    llvm.return %1 : i32
  }
  llvm.func @rocdl.permlanex16.var(%arg0: i32) -> i32 {
    %0 = llvm.mlir.constant(-1 : i32) : i32
    %1 = rocdl.permlanex16.var %arg0, %arg0, %0, false, true : (i32, i32, i32) -> i32
    llvm.return %1 : i32
  }
  llvm.func @rocdl.wmma.fp8(%arg0: vector<2xi32>, %arg1: vector<8xf32>) -> vector<8xf32> {
    %0 = rocdl.wmma.f32.16x16x16.fp8_fp8 %arg0, %arg0, %arg1 : (vector<2xi32>, vector<2xi32>, vector<8xf32>) -> vector<8xf32>
    %1 = rocdl.wmma.f32.16x16x16.fp8_bf8 %arg0, %arg0, %arg1 : (vector<2xi32>, vector<2xi32>, vector<8xf32>) -> vector<8xf32>
    %2 = rocdl.wmma.f32.16x16x16.bf8_bf8 %arg0, %arg0, %arg1 : (vector<2xi32>, vector<2xi32>, vector<8xf32>) -> vector<8xf32>
    %3 = rocdl.wmma.f32.16x16x16.bf8_fp8 %arg0, %arg0, %arg1 : (vector<2xi32>, vector<2xi32>, vector<8xf32>) -> vector<8xf32>
    llvm.return %0 : vector<8xf32>
  }
  llvm.func @rocdl.raw.ptr.buffer(%arg0: !llvm.ptr<8>, %arg1: i32, %arg2: i32, %arg3: i32, %arg4: vector<2xi32>, %arg5: vector<4xi32>) {
    %0 = llvm.mlir.constant(0 : i32) : i32
    %1 = rocdl.raw.ptr.buffer.load %arg0, %arg1, %arg2, 0 : i32
    %2 = rocdl.raw.ptr.buffer.load %arg0, %arg1, %arg2, 0 : vector<2xi32>
    %3 = rocdl.raw.ptr.buffer.load %arg0, %arg1, %arg2, 0 : vector<4xi32>
    rocdl.raw.ptr.buffer.store %arg3, %arg0, %arg1, %arg2, 0 : i32
    rocdl.raw.ptr.buffer.store %arg4, %arg0, %arg1, %arg2, 0 : vector<2xi32>
    rocdl.raw.ptr.buffer.store %arg5, %arg0, %arg1, %arg2, 0 : vector<4xi32>
    llvm.return
  }
  llvm.func @rocdl.raw.ptr.buffer.load.lds(%arg0: !llvm.ptr<8>, %arg1: !llvm.ptr<3>, %arg2: i32, %arg3: i32) {
    %0 = llvm.mlir.constant(4 : i32) : i32
    %1 = llvm.mlir.constant(128 : i32) : i32
    rocdl.raw.ptr.buffer.load.lds %arg0, %arg1, %0, %arg2, %arg3, %1, pre_gfx12<glc>
    llvm.return
  }
  llvm.func @rocdl.raw.ptr.buffer.load.async.lds(%arg0: !llvm.ptr<8>, %arg1: !llvm.ptr<3>, %arg2: i32, %arg3: i32) {
    %0 = llvm.mlir.constant(4 : i32) : i32
    %1 = llvm.mlir.constant(128 : i32) : i32
    rocdl.raw.ptr.buffer.load.async.lds %arg0, %arg1, %0, %arg2, %arg3, %1, pre_gfx12<glc>
    llvm.return
  }
  llvm.func @rocdl.global.prefetch(%arg0: !llvm.ptr<1>) {
    rocdl.global.prefetch %arg0, 0 : !llvm.ptr<1>
    rocdl.global.prefetch %arg0, gfx12<nt_rt|scope_se> : !llvm.ptr<1>
    llvm.return
  }
  llvm.func @rocdl.flat.prefetch(%arg0: !llvm.ptr) {
    rocdl.flat.prefetch %arg0, 0 : !llvm.ptr
    llvm.return
  }
  llvm.func @rocdl.atomic.barriers.arrive(%arg0: !llvm.ptr<3>, %arg1: i64) {
    rocdl.ds.atomic.async.barrier.arrive.b64 %arg0 : !llvm.ptr<3>
    %0 = rocdl.ds.atomic.barrier.arrive.rtn.b64 %arg0, %arg1 : !llvm.ptr<3>, i64 -> i64
    llvm.return
  }
  llvm.func @rocdl.wmma.scale(%arg0: i32, %arg1: vector<4xf32>, %arg2: vector<8xi32>, %arg3: vector<12xi32>, %arg4: vector<16xi32>, %arg5: i64, %arg6: vector<8xf32>) -> vector<4xf32> {
    %0 = rocdl.wmma.scale.f32.16x16x128.f8f6f4 %arg4, %arg4, %arg1, %arg0, %arg0, fmtA = fp8_e4m3, fmtB = fp8_e4m3, modC = none, scaleAType = row0, fmtScaleA = e8, scaleBType = row0, fmtScaleB = e8 : (vector<16xi32>, vector<16xi32>, vector<4xf32>, i32, i32) -> vector<4xf32>
    %1 = rocdl.wmma.scale.f32.16x16x128.f8f6f4 %arg4, %arg4, %arg1, %arg0, %arg0, fmtA = fp8_e4m3, fmtB = fp8_e5m2, modC = none, scaleAType = row1, fmtScaleA = e5m3, scaleBType = row1, fmtScaleB = e5m3 : (vector<16xi32>, vector<16xi32>, vector<4xf32>, i32, i32) -> vector<4xf32>
    %2 = rocdl.wmma.scale.f32.16x16x128.f8f6f4 %arg4, %arg3, %arg1, %arg0, %arg0, fmtA = fp8_e4m3, fmtB = fp6_e2m3, modC = neg, scaleAType = row1, fmtScaleA = e4m3, scaleBType = row1, fmtScaleB = e4m3 : (vector<16xi32>, vector<12xi32>, vector<4xf32>, i32, i32) -> vector<4xf32>
    %3 = rocdl.wmma.scale.f32.16x16x128.f8f6f4 %arg4, %arg3, %arg1, %arg0, %arg0, fmtA = fp8_e5m2, fmtB = fp6_e3m2, modC = abs, scaleAType = row0, fmtScaleA = e8, scaleBType = row0, fmtScaleB = e8 : (vector<16xi32>, vector<12xi32>, vector<4xf32>, i32, i32) -> vector<4xf32>
    %4 = rocdl.wmma.scale.f32.16x16x128.f8f6f4 %arg4, %arg2, %arg1, %arg0, %arg0, fmtA = fp8_e4m3, fmtB = fp4_e2m1, modC = neg_abs, scaleAType = row1, fmtScaleA = e4m3, scaleBType = row1, fmtScaleB = e4m3 : (vector<16xi32>, vector<8xi32>, vector<4xf32>, i32, i32) -> vector<4xf32>
    %5 = rocdl.wmma.scale.f32.16x16x128.f8f6f4 %arg4, %arg4, %arg1, %arg0, %arg0, fmtA = fp6_e2m3, fmtB = fp6_e2m3, modC = none, scaleAType = row0, fmtScaleA = e8, scaleBType = row0, fmtScaleB = e8 {reuseA = true} : (vector<16xi32>, vector<16xi32>, vector<4xf32>, i32, i32) -> vector<4xf32>
    %6 = rocdl.wmma.scale.f32.16x16x128.f8f6f4 %arg4, %arg4, %arg1, %arg0, %arg0, fmtA = fp6_e3m2, fmtB = fp6_e3m2, modC = none, scaleAType = row0, fmtScaleA = e8, scaleBType = row0, fmtScaleB = e8 {reuseB = true} : (vector<16xi32>, vector<16xi32>, vector<4xf32>, i32, i32) -> vector<4xf32>
    %7 = rocdl.wmma.scale.f32.16x16x128.f8f6f4 %arg4, %arg4, %arg1, %arg0, %arg0, fmtA = fp4_e2m1, fmtB = fp4_e2m1, modC = neg, scaleAType = row1, fmtScaleA = e5m3, scaleBType = row1, fmtScaleB = e5m3 {reuseA = true, reuseB = true} : (vector<16xi32>, vector<16xi32>, vector<4xf32>, i32, i32) -> vector<4xf32>
    %8 = rocdl.wmma.scale16.f32.16x16x128.f8f6f4 %arg4, %arg4, %arg1, %arg5, %arg5, fmtA = fp8_e4m3, fmtB = fp8_e5m2, modC = abs, scaleAType = row1, fmtScaleA = e4m3, scaleBType = row1, fmtScaleB = e4m3 : (vector<16xi32>, vector<16xi32>, vector<4xf32>, i64, i64) -> vector<4xf32>
    %9 = rocdl.wmma.scale.f32.32x16x128.f4 %arg4, %arg2, %arg6, %arg0, %arg0, modC = none, scaleAType = row1, fmtScaleA = e5m3, scaleBType = row1, fmtScaleB = e5m3 : (vector<16xi32>, vector<8xi32>, vector<8xf32>, i32, i32) -> vector<8xf32>
    %10 = rocdl.wmma.scale16.f32.32x16x128.f4 %arg4, %arg2, %arg6, %arg5, %arg5, modC = neg_abs, scaleAType = row0, fmtScaleA = e4m3, scaleBType = row1, fmtScaleB = e4m3 {reuseA = true, reuseB = true} : (vector<16xi32>, vector<8xi32>, vector<8xf32>, i64, i64) -> vector<8xf32>
    llvm.return %0 : vector<4xf32>
  }
  llvm.func @rocdl.raw.ptr.buffer.atomic.f32(%arg0: !llvm.ptr<8>, %arg1: i32, %arg2: i32, %arg3: f32) -> f32 {
    %0 = llvm.mlir.constant(0 : i32) : i32
    %1 = rocdl.raw.ptr.buffer.atomic.fadd %arg3, %arg0, %arg1, %arg2, 0 : f32
    %2 = rocdl.raw.ptr.buffer.atomic.fmax %arg3, %arg0, %arg1, %arg2, 0 : f32
    llvm.return %2 : f32
  }
  llvm.func @rocdl.raw.ptr.buffer.atomic.i32(%arg0: !llvm.ptr<8>, %arg1: i32, %arg2: i32, %arg3: i32) -> i32 {
    %0 = llvm.mlir.constant(0 : i32) : i32
    %1 = rocdl.raw.ptr.buffer.atomic.smax %arg3, %arg0, %arg1, %arg2, 0 : i32
    %2 = rocdl.raw.ptr.buffer.atomic.umin %arg3, %arg0, %arg1, %arg2, 0 : i32
    llvm.return %2 : i32
  }
  llvm.func @rocdl.raw.ptr.buffer.atomic.cmpswap(%arg0: !llvm.ptr<8>, %arg1: i32, %arg2: i32, %arg3: i32, %arg4: i32) -> i32 {
    %0 = llvm.mlir.constant(0 : i32) : i32
    %1 = rocdl.raw.ptr.buffer.atomic.cmpswap %arg3, %arg4, %arg0, %arg1, %arg2, 0 : i32
    llvm.return %1 : i32
  }
  llvm.func @rocdl.raw.buffer(%arg0: vector<4xi32>, %arg1: i32, %arg2: i32, %arg3: i32, %arg4: vector<2xi32>, %arg5: vector<4xi32>) {
    %0 = llvm.mlir.constant(0 : i32) : i32
    %1 = rocdl.raw.buffer.load %arg0, %arg1, %arg2, 0 : i32
    %2 = rocdl.raw.buffer.load %arg0, %arg1, %arg2, 0 : vector<2xi32>
    %3 = rocdl.raw.buffer.load %arg0, %arg1, %arg2, 0 : vector<4xi32>
    %4 = rocdl.raw.buffer.load %arg0, %arg1, %arg2, gfx942<sc0|nt> : i32
    rocdl.raw.buffer.store %arg3, %arg0, %arg1, %arg2, 0 : i32
    rocdl.raw.buffer.store %arg4, %arg0, %arg1, %arg2, 0 : vector<2xi32>
    rocdl.raw.buffer.store %arg5, %arg0, %arg1, %arg2, 0 : vector<4xi32>
    llvm.return
  }
  llvm.func @rocdl.raw.buffer.atomic.f32(%arg0: vector<4xi32>, %arg1: i32, %arg2: i32, %arg3: f32) -> f32 {
    %0 = llvm.mlir.constant(0 : i32) : i32
    %1 = rocdl.raw.buffer.atomic.fadd %arg3, %arg0, %arg1, %arg2, 0 : f32
    %2 = rocdl.raw.buffer.atomic.fmax %arg3, %arg0, %arg1, %arg2, 0 : f32
    llvm.return %2 : f32
  }
  llvm.func @rocdl.raw.buffer.atomic.i32(%arg0: vector<4xi32>, %arg1: i32, %arg2: i32, %arg3: i32) -> i32 {
    %0 = llvm.mlir.constant(0 : i32) : i32
    %1 = rocdl.raw.buffer.atomic.smax %arg3, %arg0, %arg1, %arg2, 0 : i32
    %2 = rocdl.raw.buffer.atomic.umin %arg3, %arg0, %arg1, %arg2, 0 : i32
    llvm.return %2 : i32
  }
  llvm.func @rocdl.raw.buffer.atomic.cmpswap(%arg0: vector<4xi32>, %arg1: i32, %arg2: i32, %arg3: i32, %arg4: i32) -> i32 {
    %0 = llvm.mlir.constant(0 : i32) : i32
    %1 = rocdl.raw.buffer.atomic.cmpswap(%arg3, %arg4, %arg0, %arg1, %arg2, 0) : i32, vector<4xi32>
    llvm.return %1 : i32
  }
  llvm.func @rocdl_8bit_floats(%arg0: i32, %arg1: f16, %arg2: bf16, %arg3: vector<2xf16>, %arg4: i32) -> i32 {
    %0 = llvm.mlir.constant(1.000000e+00 : f32) : f32
    %1 = llvm.mlir.constant(false) : i1
    %2 = rocdl.cvt.f32.bf8 %arg0[0] : f32
    %3 = rocdl.cvt.scalef32.f32.bf8 %arg0[0], %0 : f32
    %4 = rocdl.cvt.f32.fp8 %arg0[0] : f32
    %5 = rocdl.cvt.scalef32.f32.fp8 %arg0[0], %0 : f32
    %6 = rocdl.cvt.scalef32.pk.f16.bf8 %arg0[false], %0 : vector<2xf16>
    %7 = rocdl.cvt.scalef32.pk.f16.fp8 %arg0[false], %0 : vector<2xf16>
    %8 = rocdl.cvt.scalef32.f16.fp8 %arg0[0], %0 -> %arg3[false] : vector<2xf16>
    %9 = rocdl.cvt.scalef32.f16.bf8 %arg0[0], %0 -> %arg3[false] : vector<2xf16>
    %10 = rocdl.cvt.scalef32.pk.bf16.bf8 %arg0[false], %0 : vector<2xbf16>
    %11 = rocdl.cvt.scalef32.pk.bf16.fp8 %arg0[false], %0 : vector<2xbf16>
    %12 = rocdl.cvt.pk.bf8.f32 %2, %4 -> %arg0[false] : i32
    %13 = rocdl.cvt.pk.fp8.f32 %2, %4 -> %12[false] : i32
    %14 = rocdl.cvt.sr.bf8.f32 %2, %arg4 -> %13[2] : i32
    %15 = rocdl.cvt.sr.fp8.f32 %4, %arg4 -> %14[3] : i32
    %16 = rocdl.cvt.scalef32.sr.fp8.f32 %4, %arg4, %0 -> %14[3] : i32
    %17 = rocdl.cvt.scalef32.sr.fp8.f16 %arg1, %arg4, %0 -> %14[3] : i32
    %18 = rocdl.cvt.scalef32.sr.fp8.bf16 %arg2, %arg4, %0 -> %14[3] : i32
    %19 = rocdl.cvt.sr.bf8.f32 %2, %arg4 -> %13[3] : i32
    %20 = rocdl.cvt.scalef32.sr.bf8.f32 %4, %arg4, %0 -> %13[3] : i32
    %21 = rocdl.cvt.scalef32.sr.bf8.f16 %arg1, %arg4, %0 -> %13[3] : i32
    %22 = rocdl.cvt.scalef32.sr.bf8.bf16 %arg2, %arg4, %0 -> %13[3] : i32
    %23 = rocdl.cvt.scalef32.pk.f32.fp8 %arg0[false], %0 : vector<2xf32>
    %24 = rocdl.cvt.scalef32.pk.f32.bf8 %arg0[false], %0 : vector<2xf32>
    llvm.return %15 : i32
  }
  llvm.func @rocdl_8bit_packed_v2i16(%arg0: f32, %arg1: f32, %arg2: vector<2xi16>) -> vector<2xi16> {
    %0 = llvm.mlir.constant(1.000000e+00 : f32) : f32
    %1 = rocdl.cvt.scalef32.pk.fp8.f32 %arg0, %arg1, %0 -> %arg2[false] : vector<2xi16>
    %2 = rocdl.cvt.scalef32.pk.bf8.f32 %arg0, %arg1, %0 -> %arg2[false] : vector<2xi16>
    llvm.return %1 : vector<2xi16>
  }
  llvm.func @rocdl_v2f16_v2i16(%arg0: vector<2xf16>, %arg1: vector<2xbf16>, %arg2: vector<2xi16>) -> vector<2xi16> {
    %0 = llvm.mlir.constant(1.000000e+00 : f32) : f32
    %1 = rocdl.cvt.scalef32.pk.fp8.f16 %arg0, %0 -> %arg2[false] : vector<2xi16>
    %2 = rocdl.cvt.scalef32.pk.fp8.bf16 %arg1, %0 -> %arg2[false] : vector<2xi16>
    %3 = rocdl.cvt.scalef32.pk.bf8.f16 %arg0, %0 -> %arg2[false] : vector<2xi16>
    %4 = rocdl.cvt.scalef32.pk.bf8.bf16 %arg1, %0 -> %arg2[false] : vector<2xi16>
    llvm.return %1 : vector<2xi16>
  }
  llvm.func @rocdl_16bit_packed_floats(%arg0: f32, %arg1: f32) -> vector<2xf16> {
    %0 = rocdl.cvt.pkrtz %arg0, %arg1 : vector<2xf16>
    llvm.return %0 : vector<2xf16>
  }
  llvm.func @rocdl_6_bit_floats(%arg0: vector<6xi32>, %arg1: vector<16xf32>, %arg2: vector<32xf32>, %arg3: vector<32xf16>, %arg4: vector<32xbf16>, %arg5: i32, %arg6: f32) {
    %0 = rocdl.cvt.scalef32.2xpk16.bf6.f32 %arg1, %arg1, %arg6 : vector<6xi32>
    %1 = rocdl.cvt.scalef32.2xpk16.fp6.f32 %arg1, %arg1, %arg6 : vector<6xi32>
    %2 = rocdl.cvt.scalef32.pk32.bf6.f16 %arg3, %arg6 : vector<6xi32>
    %3 = rocdl.cvt.scalef32.pk32.fp6.f16 %arg3, %arg6 : vector<6xi32>
    %4 = rocdl.cvt.scalef32.pk32.bf6.bf16 %arg4, %arg6 : vector<6xi32>
    %5 = rocdl.cvt.scalef32.pk32.fp6.bf16 %arg4, %arg6 : vector<6xi32>
    %6 = rocdl.cvt.scalef32.pk32.f32.bf6 %arg0, %arg6 : vector<32xf32>
    %7 = rocdl.cvt.scalef32.pk32.f32.fp6 %arg0, %arg6 : vector<32xf32>
    %8 = rocdl.cvt.scalef32.pk32.f16.bf6 %arg0, %arg6 : vector<32xf16>
    %9 = rocdl.cvt.scalef32.pk32.f16.fp6 %arg0, %arg6 : vector<32xf16>
    %10 = rocdl.cvt.scalef32.pk32.bf16.bf6 %arg0, %arg6 : vector<32xbf16>
    %11 = rocdl.cvt.scalef32.pk32.bf16.fp6 %arg0, %arg6 : vector<32xbf16>
    %12 = rocdl.cvt.scalef32.sr.pk32.bf6.f32 %arg2, %arg5, %arg6 : vector<6xi32>
    %13 = rocdl.cvt.scalef32.sr.pk32.fp6.f32 %arg2, %arg5, %arg6 : vector<6xi32>
    %14 = rocdl.cvt.scalef32.sr.pk32.bf6.f16 %arg3, %arg5, %arg6 : vector<6xi32>
    %15 = rocdl.cvt.scalef32.sr.pk32.fp6.f16 %arg3, %arg5, %arg6 : vector<6xi32>
    %16 = rocdl.cvt.scalef32.sr.pk32.bf6.bf16 %arg4, %arg5, %arg6 : vector<6xi32>
    %17 = rocdl.cvt.scalef32.sr.pk32.fp6.bf16 %arg4, %arg5, %arg6 : vector<6xi32>
    llvm.return
  }
  llvm.func @rocdl_4_bit_floats(%arg0: i32, %arg1: f32, %arg2: vector<2xf32>, %arg3: vector<2xf16>, %arg4: vector<2xbf16>, %arg5: i32, %arg6: f32) {
    %0 = rocdl.cvt.scalef32.pk.fp4.f32 %arg1, %arg1, %arg6 -> %arg0[0] : i32
    %1 = rocdl.cvt.scalef32.pk.fp4.f16 %arg3, %arg6 -> %arg0[1] : i32
    %2 = rocdl.cvt.scalef32.pk.fp4.bf16 %arg4, %arg6 -> %arg0[0] : i32
    %3 = rocdl.cvt.scalef32.pk.f32.fp4 %arg0[0], %arg6 : vector<2xf32>
    %4 = rocdl.cvt.scalef32.pk.f16.fp4 %arg0[1], %arg6 : vector<2xf16>
    %5 = rocdl.cvt.scalef32.pk.bf16.fp4 %arg0[0], %arg6 : vector<2xbf16>
    %6 = rocdl.cvt.scalef32.sr.pk.fp4.f32 %arg2, %arg5, %arg6 -> %arg0[0] : i32
    %7 = rocdl.cvt.scalef32.sr.pk.fp4.f16 %arg3, %arg5, %arg6 -> %arg0[1] : i32
    %8 = rocdl.cvt.scalef32.sr.pk.fp4.bf16 %arg4, %arg5, %arg6 -> %arg0[0] : i32
    llvm.return
  }
  llvm.func @rocdl_atomic_attrs(%arg0: !llvm.ptr<1>, %arg1: f32) {
    %0 = llvm.atomicrmw fadd %arg0, %arg1 monotonic {rocdl.ignore_denormal_mode, rocdl.no_fine_grained_memory, rocdl.no_remote_memory} : !llvm.ptr<1>, f32
    llvm.return
  }
  llvm.func @rocdl_last_use(%arg0: !llvm.ptr<1>) -> i32 {
    %0 = llvm.load %arg0 {rocdl.last_use} : !llvm.ptr<1> -> i32
    llvm.return %0 : i32
  }
  llvm.func @test_fmed3_f16(%arg0: f16, %arg1: f16, %arg2: f16) -> f16 {
    %0 = rocdl.fmed3 %arg0, %arg1, %arg2 : f16
    llvm.return %0 : f16
  }
  llvm.func @test_fmed3_f32(%arg0: f32, %arg1: f32, %arg2: f32) -> f32 {
    %0 = rocdl.fmed3 %arg0, %arg1, %arg2 : f32
    llvm.return %0 : f32
  }
  llvm.func @rocdl.cvt.scale.pk8(%arg0: i32, %arg1: vector<2xi32>, %arg2: i32) {
    %0 = rocdl.cvt.scale.pk8.f16.fp4 %arg0, %arg2[0] : vector<8xf16>
    %1 = rocdl.cvt.scale.pk8.bf16.fp4 %arg0, %arg2[0] : vector<8xbf16>
    %2 = rocdl.cvt.scale.pk8.f32.fp4 %arg0, %arg2[0] : vector<8xf32>
    %3 = rocdl.cvt.scale.pk8.f16.fp8 %arg1, %arg2[0] : vector<8xf16>
    %4 = rocdl.cvt.scale.pk8.bf16.fp8 %arg1, %arg2[0] : vector<8xbf16>
    %5 = rocdl.cvt.scale.pk8.f32.fp8 %arg1, %arg2[0] : vector<8xf32>
    %6 = rocdl.cvt.scale.pk8.f16.bf8 %arg1, %arg2[0] : vector<8xf16>
    %7 = rocdl.cvt.scale.pk8.bf16.bf8 %arg1, %arg2[0] : vector<8xbf16>
    %8 = rocdl.cvt.scale.pk8.f32.bf8 %arg1, %arg2[0] : vector<8xf32>
    llvm.return
  }
  llvm.func @rocdl.cvt.scalef32.pk8(%arg0: vector<8xf32>, %arg1: vector<8xf16>, %arg2: vector<8xbf16>, %arg3: f32) {
    %0 = rocdl.cvt.scalef32.pk8.fp8.f32 %arg0, %arg3 : vector<2xi32>
    %1 = rocdl.cvt.scalef32.pk8.bf8.f32 %arg0, %arg3 : vector<2xi32>
    %2 = rocdl.cvt.scalef32.pk8.fp4.f32 %arg0, %arg3 : i32
    %3 = rocdl.cvt.scalef32.pk8.fp8.f16 %arg1, %arg3 : vector<2xi32>
    %4 = rocdl.cvt.scalef32.pk8.bf8.f16 %arg1, %arg3 : vector<2xi32>
    %5 = rocdl.cvt.scalef32.pk8.fp4.f16 %arg1, %arg3 : i32
    %6 = rocdl.cvt.scalef32.pk8.fp8.bf16 %arg2, %arg3 : vector<2xi32>
    %7 = rocdl.cvt.scalef32.pk8.bf8.bf16 %arg2, %arg3 : vector<2xi32>
    %8 = rocdl.cvt.scalef32.pk8.fp4.bf16 %arg2, %arg3 : i32
    llvm.return
  }
  llvm.func @rocdl.cvt.scalef32.sr.pk8(%arg0: vector<8xf32>, %arg1: vector<8xf16>, %arg2: vector<8xbf16>, %arg3: i32, %arg4: f32) {
    %0 = rocdl.cvt.scalef32.sr.pk8.fp8.f32 %arg0, %arg3, %arg4 : vector<2xi32>
    %1 = rocdl.cvt.scalef32.sr.pk8.bf8.f32 %arg0, %arg3, %arg4 : vector<2xi32>
    %2 = rocdl.cvt.scalef32.sr.pk8.fp4.f32 %arg0, %arg3, %arg4 : i32
    %3 = rocdl.cvt.scalef32.sr.pk8.fp8.f16 %arg1, %arg3, %arg4 : vector<2xi32>
    %4 = rocdl.cvt.scalef32.sr.pk8.bf8.f16 %arg1, %arg3, %arg4 : vector<2xi32>
    %5 = rocdl.cvt.scalef32.sr.pk8.fp4.f16 %arg1, %arg3, %arg4 : i32
    %6 = rocdl.cvt.scalef32.sr.pk8.fp8.bf16 %arg2, %arg3, %arg4 : vector<2xi32>
    %7 = rocdl.cvt.scalef32.sr.pk8.bf8.bf16 %arg2, %arg3, %arg4 : vector<2xi32>
    %8 = rocdl.cvt.scalef32.sr.pk8.fp4.bf16 %arg2, %arg3, %arg4 : i32
    llvm.return
  }
  llvm.func @rocdl.cvt.scale.pk16(%arg0: vector<3xi32>, %arg1: i32) {
    %0 = rocdl.cvt.scale.pk16.f16.fp6 %arg0, %arg1[0] : vector<16xf16>
    %1 = rocdl.cvt.scale.pk16.bf16.fp6 %arg0, %arg1[0] : vector<16xbf16>
    %2 = rocdl.cvt.scale.pk16.f32.fp6 %arg0, %arg1[0] : vector<16xf32>
    %3 = rocdl.cvt.scale.pk16.f16.bf6 %arg0, %arg1[0] : vector<16xf16>
    %4 = rocdl.cvt.scale.pk16.bf16.bf6 %arg0, %arg1[0] : vector<16xbf16>
    %5 = rocdl.cvt.scale.pk16.f32.bf6 %arg0, %arg1[0] : vector<16xf32>
    llvm.return
  }
  llvm.func @rocdl.cvt.scalef32.pk16(%arg0: vector<16xf32>, %arg1: vector<16xf16>, %arg2: vector<16xbf16>, %arg3: f32) {
    %0 = rocdl.cvt.scalef32.pk16.fp6.f16 %arg1, %arg3 : vector<3xi32>
    %1 = rocdl.cvt.scalef32.pk16.fp6.bf16 %arg2, %arg3 : vector<3xi32>
    %2 = rocdl.cvt.scalef32.pk16.fp6.f32 %arg0, %arg3 : vector<3xi32>
    %3 = rocdl.cvt.scalef32.pk16.bf6.f16 %arg1, %arg3 : vector<3xi32>
    %4 = rocdl.cvt.scalef32.pk16.bf6.bf16 %arg2, %arg3 : vector<3xi32>
    %5 = rocdl.cvt.scalef32.pk16.bf6.f32 %arg0, %arg3 : vector<3xi32>
    llvm.return
  }
  llvm.func @rocdl.cvt.scalef32.sr.pk16(%arg0: vector<16xf32>, %arg1: vector<16xf16>, %arg2: vector<16xbf16>, %arg3: i32, %arg4: f32) {
    %0 = rocdl.cvt.scalef32.sr.pk16.fp6.f16 %arg1, %arg3, %arg4 : vector<3xi32>
    %1 = rocdl.cvt.scalef32.sr.pk16.fp6.bf16 %arg2, %arg3, %arg4 : vector<3xi32>
    %2 = rocdl.cvt.scalef32.sr.pk16.fp6.f32 %arg0, %arg3, %arg4 : vector<3xi32>
    %3 = rocdl.cvt.scalef32.sr.pk16.bf6.f16 %arg1, %arg3, %arg4 : vector<3xi32>
    %4 = rocdl.cvt.scalef32.sr.pk16.bf6.bf16 %arg2, %arg3, %arg4 : vector<3xi32>
    %5 = rocdl.cvt.scalef32.sr.pk16.bf6.f32 %arg0, %arg3, %arg4 : vector<3xi32>
    llvm.return
  }
  llvm.func @rocdl_dot_fdot2_family(%arg0: vector<2xf16>, %arg1: vector<2xbf16>, %arg2: f16, %arg3: bf16, %arg4: f32) -> f32 {
    %0 = rocdl.fdot2 %arg0, %arg0, %arg4 : (vector<2xf16>, vector<2xf16>, f32) -> f32
    %1 = rocdl.fdot2 %arg0, %arg0, %arg4 {clamp = true} : (vector<2xf16>, vector<2xf16>, f32) -> f32
    %2 = rocdl.fdot2.f32.bf16 %arg1, %arg1, %arg4 : (vector<2xbf16>, vector<2xbf16>, f32) -> f32
    %3 = rocdl.fdot2.f32.bf16 %arg1, %arg1, %arg4 {clamp = true} : (vector<2xbf16>, vector<2xbf16>, f32) -> f32
    %4 = rocdl.fdot2.f16.f16 %arg0, %arg0, %arg2 : (vector<2xf16>, vector<2xf16>, f16) -> f16
    %5 = rocdl.fdot2.bf16.bf16 %arg1, %arg1, %arg3 : (vector<2xbf16>, vector<2xbf16>, bf16) -> bf16
    llvm.return %0 : f32
  }
  llvm.func @rocdl_dot_sdot_udot_family(%arg0: vector<2xi16>, %arg1: i32) -> i32 {
    %0 = rocdl.sdot2 %arg0, %arg0, %arg1 : (vector<2xi16>, vector<2xi16>, i32) -> i32
    %1 = rocdl.sdot2 %arg0, %arg0, %arg1 {clamp = true} : (vector<2xi16>, vector<2xi16>, i32) -> i32
    %2 = rocdl.udot2 %arg0, %arg0, %arg1 : (vector<2xi16>, vector<2xi16>, i32) -> i32
    %3 = rocdl.udot2 %arg0, %arg0, %arg1 {clamp = true} : (vector<2xi16>, vector<2xi16>, i32) -> i32
    %4 = rocdl.sdot4 %arg1, %arg1, %arg1 : (i32, i32, i32) -> i32
    %5 = rocdl.sdot4 %arg1, %arg1, %arg1 {clamp = true} : (i32, i32, i32) -> i32
    %6 = rocdl.udot4 %arg1, %arg1, %arg1 : (i32, i32, i32) -> i32
    %7 = rocdl.udot4 %arg1, %arg1, %arg1 {clamp = true} : (i32, i32, i32) -> i32
    %8 = rocdl.sdot8 %arg1, %arg1, %arg1 : (i32, i32, i32) -> i32
    %9 = rocdl.sdot8 %arg1, %arg1, %arg1 {clamp = true} : (i32, i32, i32) -> i32
    %10 = rocdl.udot8 %arg1, %arg1, %arg1 : (i32, i32, i32) -> i32
    %11 = rocdl.udot8 %arg1, %arg1, %arg1 {clamp = true} : (i32, i32, i32) -> i32
    llvm.return %0 : i32
  }
  llvm.func @rocdl_dot_sudot_family(%arg0: i32, %arg1: i32, %arg2: i32) -> i32 {
    %0 = rocdl.sudot4 %arg0, %arg1, %arg2 : (i32, i32, i32) -> i32
    %1 = rocdl.sudot4 %arg0, %arg1, %arg2 {signA = true} : (i32, i32, i32) -> i32
    %2 = rocdl.sudot4 %arg0, %arg1, %arg2 {signB = true} : (i32, i32, i32) -> i32
    %3 = rocdl.sudot4 %arg0, %arg1, %arg2 {clamp = true, signA = true, signB = true} : (i32, i32, i32) -> i32
    %4 = rocdl.sudot8 %arg0, %arg1, %arg2 : (i32, i32, i32) -> i32
    %5 = rocdl.sudot8 %arg0, %arg1, %arg2 {signA = true} : (i32, i32, i32) -> i32
    %6 = rocdl.sudot8 %arg0, %arg1, %arg2 {signB = true} : (i32, i32, i32) -> i32
    %7 = rocdl.sudot8 %arg0, %arg1, %arg2 {clamp = true, signA = true, signB = true} : (i32, i32, i32) -> i32
    llvm.return %0 : i32
  }
  llvm.func @rocdl_dot_fp8_family(%arg0: i32, %arg1: f32) -> f32 {
    %0 = rocdl.dot4.f32.fp8.fp8 %arg0, %arg0, %arg1 : (i32, i32, f32) -> f32
    %1 = rocdl.dot4.f32.fp8.bf8 %arg0, %arg0, %arg1 : (i32, i32, f32) -> f32
    %2 = rocdl.dot4.f32.bf8.fp8 %arg0, %arg0, %arg1 : (i32, i32, f32) -> f32
    %3 = rocdl.dot4.f32.bf8.bf8 %arg0, %arg0, %arg1 : (i32, i32, f32) -> f32
    llvm.return %0 : f32
  }
}

