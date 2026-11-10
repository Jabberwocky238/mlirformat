"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<i32 ()>, linkage = #llvm.linkage<external>, sym_name = "rocdl_special_regs", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %458 = "rocdl.workitem.id.x"() : () -> i32
    %459 = "rocdl.workitem.id.y"() : () -> i32
    %460 = "rocdl.workitem.id.z"() : () -> i32
    %461 = "rocdl.workgroup.id.x"() : () -> i32
    %462 = "rocdl.workgroup.id.y"() : () -> i32
    %463 = "rocdl.workgroup.id.z"() : () -> i32
    %464 = "rocdl.cluster.id.x"() : () -> i32
    %465 = "rocdl.cluster.id.y"() : () -> i32
    %466 = "rocdl.cluster.id.z"() : () -> i32
    %467 = "rocdl.cluster.workgroup.id.x"() <{range = #llvm.constant_range<i32, 0, 16>}> : () -> i32
    %468 = "rocdl.cluster.workgroup.id.y"() <{range = #llvm.constant_range<i32, 0, 16>}> : () -> i32
    %469 = "rocdl.cluster.workgroup.id.z"() <{range = #llvm.constant_range<i32, 0, 16>}> : () -> i32
    %470 = "rocdl.workitem.id.x"() <{range = #llvm.constant_range<i32, 0, 64>}> : () -> i32
    %471 = "rocdl.wave.id"() : () -> i32
    %472 = "rocdl.wave.id"() <{range = #llvm.constant_range<i32, 32, 65>}> : () -> i32
    %473 = "rocdl.wavefrontsize"() : () -> i32
    %474 = "rocdl.wavefrontsize"() <{range = #llvm.constant_range<i32, 32, 65>}> : () -> i32
    "llvm.return"(%458) : (i32) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "kernel_func", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "llvm.return"() : () -> ()
  }) {rocdl.kernel} : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "kernel_func_workgroups", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "llvm.return"() : () -> ()
  }) {rocdl.kernel, rocdl.max_flat_work_group_size = 1024 : index} : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (f32, f16, bf16)>, linkage = #llvm.linkage<external>, sym_name = "kernel_math_ops", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg268: f32, %arg269: f16, %arg270: bf16):
    %434 = "rocdl.tanh"(%arg268) : (f32) -> f32
    %435 = "rocdl.tanh"(%arg269) : (f16) -> f16
    %436 = "rocdl.tanh"(%arg270) : (bf16) -> bf16
    %437 = "rocdl.sin"(%arg268) : (f32) -> f32
    %438 = "rocdl.sin"(%arg269) : (f16) -> f16
    %439 = "rocdl.sin"(%arg270) : (bf16) -> bf16
    %440 = "rocdl.cos"(%arg268) : (f32) -> f32
    %441 = "rocdl.cos"(%arg269) : (f16) -> f16
    %442 = "rocdl.cos"(%arg270) : (bf16) -> bf16
    %443 = "rocdl.rcp"(%arg268) : (f32) -> f32
    %444 = "rocdl.rcp"(%arg269) : (f16) -> f16
    %445 = "rocdl.rcp"(%arg270) : (bf16) -> bf16
    %446 = "rocdl.exp2"(%arg268) : (f32) -> f32
    %447 = "rocdl.exp2"(%arg269) : (f16) -> f16
    %448 = "rocdl.exp2"(%arg270) : (bf16) -> bf16
    %449 = "rocdl.log"(%arg268) : (f32) -> f32
    %450 = "rocdl.log"(%arg269) : (f16) -> f16
    %451 = "rocdl.log"(%arg270) : (bf16) -> bf16
    %452 = "rocdl.sqrt"(%arg268) : (f32) -> f32
    %453 = "rocdl.sqrt"(%arg269) : (f16) -> f16
    %454 = "rocdl.sqrt"(%arg270) : (bf16) -> bf16
    %455 = "rocdl.rsq"(%arg268) : (f32) -> f32
    %456 = "rocdl.rsq"(%arg269) : (f16) -> f16
    %457 = "rocdl.rsq"(%arg270) : (bf16) -> bf16
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "known_block_sizes", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "llvm.return"() : () -> ()
  }) {rocdl.flat_work_group_size = "128,128", rocdl.kernel, rocdl.reqd_work_group_size = array<i32: 16, 4, 2>} : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "known_block_sizes_from_reqd", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "llvm.return"() : () -> ()
  }) {rocdl.kernel, rocdl.reqd_work_group_size = array<i32: 8, 4, 2>} : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "kernel_func_no_uniform_work_groups", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "llvm.return"() : () -> ()
  }) {rocdl.kernel, rocdl.uniform_work_group_size = false} : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "kernel_func_waves_per_eu", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "llvm.return"() : () -> ()
  }) {rocdl.kernel, rocdl.waves_per_eu = 2 : i32} : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "kernel_func_unsafe_fp_atomics", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "llvm.return"() : () -> ()
  }) {rocdl.kernel, rocdl.unsafe_fp_atomics = true} : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<i32 ()>, linkage = #llvm.linkage<external>, sym_name = "rocdl.lane_id", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %430 = "llvm.mlir.constant"() <{value = -1 : i32}> : () -> i32
    %431 = "llvm.mlir.constant"() <{value = 0 : i32}> : () -> i32
    %432 = "rocdl.mbcnt.lo"(%430, %431) <{res_attrs = [{llvm.noundef, llvm.range = #llvm.constant_range<i32, 0, 32>}]}> : (i32, i32) -> i32
    %433 = "rocdl.mbcnt.hi"(%430, %432) <{res_attrs = [{llvm.noundef, llvm.range = #llvm.constant_range<i32, 0, 64>}]}> : (i32, i32) -> i32
    "llvm.return"(%433) : (i32) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<i32 (i32)>, linkage = #llvm.linkage<external>, sym_name = "rocdl.swizzle", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg267: i32):
    %428 = "llvm.mlir.constant"() <{value = 100 : i32}> : () -> i32
    %429 = "rocdl.ds_swizzle"(%arg267, %428) : (i32, i32) -> i32
    "llvm.return"(%429) : (i32) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<i32 (i32)>, linkage = #llvm.linkage<external>, sym_name = "rocdl.bpermute", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg266: i32):
    %426 = "llvm.mlir.constant"() <{value = 10 : i32}> : () -> i32
    %427 = "rocdl.ds_bpermute"(%426, %arg266) : (i32, i32) -> i32
    "llvm.return"(%427) : (i32) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<i32 (i1)>, linkage = #llvm.linkage<external>, sym_name = "rocdl.ballot32", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg265: i1):
    %425 = "rocdl.ballot"(%arg265) : (i1) -> i32
    "llvm.return"(%425) : (i32) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<i64 (i1)>, linkage = #llvm.linkage<external>, sym_name = "rocdl.ballot64", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg264: i1):
    %424 = "rocdl.ballot"(%arg264) : (i1) -> i64
    "llvm.return"(%424) : (i64) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<f32 (f32, f64, i32, vector<2xf32>)>, linkage = #llvm.linkage<external>, sym_name = "rocdl.readfirstlane", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg260: f32, %arg261: f64, %arg262: i32, %arg263: vector<2xf32>):
    %420 = "rocdl.readfirstlane"(%arg260) : (f32) -> f32
    %421 = "rocdl.readfirstlane"(%arg261) : (f64) -> f64
    %422 = "rocdl.readfirstlane"(%arg262) : (i32) -> i32
    %423 = "rocdl.readfirstlane"(%arg263) : (vector<2xf32>) -> vector<2xf32>
    "llvm.return"(%420) : (f32) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<f32 (f32, f64, i32, vector<2xf32>)>, linkage = #llvm.linkage<external>, sym_name = "rocdl.readlane", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg256: f32, %arg257: f64, %arg258: i32, %arg259: vector<2xf32>):
    %415 = "llvm.mlir.constant"() <{value = 0 : i32}> : () -> i32
    %416 = "rocdl.readlane"(%arg256, %415) : (f32, i32) -> f32
    %417 = "rocdl.readlane"(%arg257, %415) : (f64, i32) -> f64
    %418 = "rocdl.readlane"(%arg258, %415) : (i32, i32) -> i32
    %419 = "rocdl.readlane"(%arg259, %415) : (vector<2xf32>, i32) -> vector<2xf32>
    "llvm.return"(%416) : (f32) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "rocdl.s.waitcnt", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "rocdl.s.waitcnt"() <{bitfield = 0 : i32}> : () -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "rocdl.s.sleep", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "rocdl.s.sleep"() <{count = 0 : i32}> : () -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "rocdl.s.nop", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "rocdl.s.nop"() <{count = 0 : i16}> : () -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "rocdl.s.barrier", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "rocdl.s.barrier"() : () -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "rocdl.barrier", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "rocdl.barrier"() : () -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "rocdl.wave_barrier", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "rocdl.wave.barrier"() : () -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr<3>)>, linkage = #llvm.linkage<external>, sym_name = "rocdl.s.barrier.init", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg255: !llvm.ptr<3>):
    "rocdl.s.barrier.init"(%arg255) <{memberCnt = 1 : i32}> : (!llvm.ptr<3>) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "rocdl.s.barrier.signal", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "rocdl.s.barrier.signal"() <{id = -1 : i32}> : () -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr<3>)>, linkage = #llvm.linkage<external>, sym_name = "rocdl.s.barrier.signal.var", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg254: !llvm.ptr<3>):
    "rocdl.s.barrier.signal.var"(%arg254) <{memberCnt = 1 : i32}> : (!llvm.ptr<3>) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr<3>)>, linkage = #llvm.linkage<external>, sym_name = "rocdl.s.barrier.join", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg253: !llvm.ptr<3>):
    "rocdl.s.barrier.join"(%arg253) : (!llvm.ptr<3>) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "rocdl.s.barrier.leave", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "rocdl.s.barrier.leave"() <{id = 1 : i16}> : () -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "rocdl.s.barrier.wait", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "rocdl.s.barrier.wait"() <{id = -1 : i16}> : () -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "rocdl.s.barrier.signal.isfirst", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %414 = "rocdl.s.barrier.signal.isfirst"() <{id = 1 : i32}> : () -> i1
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "rocdl.s.get.barrier.state", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %413 = "rocdl.s.get.barrier.state"() <{id = 1 : i32}> : () -> i32
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr<3>)>, linkage = #llvm.linkage<external>, sym_name = "rocdl.s.get.named.barrier.state", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg252: !llvm.ptr<3>):
    %412 = "rocdl.s.get.named.barrier.state"(%arg252) : (!llvm.ptr<3>) -> i32
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr<3>)>, linkage = #llvm.linkage<external>, sym_name = "rocdl.s.wakeup.barrier", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg251: !llvm.ptr<3>):
    "rocdl.s.wakeup.barrier"(%arg251) : (!llvm.ptr<3>) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "rocdl.s.wait.dscnt", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "rocdl.s.wait.dscnt"() <{count = 0 : i16}> : () -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "rocdl.s.wait.loadcnt", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "rocdl.s.wait.loadcnt"() <{count = 0 : i16}> : () -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "rocdl.s.wait.storecnt", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "rocdl.s.wait.storecnt"() <{count = 0 : i16}> : () -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "rocdl.s.wait.expcnt", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "rocdl.s.wait.expcnt"() <{count = 0 : i16}> : () -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "rocdl.s.wait.asynccnt", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "rocdl.s.wait.asynccnt"() <{count = 0 : i16}> : () -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "rocdl.s.wait.tensorcnt", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "rocdl.s.wait.tensorcnt"() <{count = 0 : i16}> : () -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "rocdl.asyncmark", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "rocdl.asyncmark"() : () -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "rocdl.wait.asyncmark", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "rocdl.wait.asyncmark"() <{count = 0 : i16}> : () -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "rocdl.setprio", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "rocdl.s.setprio"() <{priority = 0 : i16}> : () -> ()
    "rocdl.s.setprio"() <{priority = 1 : i16}> : () -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "rocdl.schedbarrier", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "rocdl.sched.barrier"() <{mask = #rocdl<sched_group_mask none>}> : () -> ()
    "rocdl.sched.barrier"() <{mask = #rocdl<sched_group_mask non_mem_non_sideeffect>}> : () -> ()
    "rocdl.sched.barrier"() <{mask = #rocdl<sched_group_mask valu|all_vmem>}> : () -> ()
    "rocdl.sched.barrier"() <{mask = #rocdl<sched_group_mask ldsdma>}> : () -> ()
    "rocdl.sched.barrier"() <{mask = #rocdl<sched_group_mask all>}> : () -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "rocdl.sched.group.barrier", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "rocdl.sched.group.barrier"() <{groupId = 0 : i32, mask = #rocdl<sched_group_mask mfma_wmma>, size = 1 : i32}> : () -> ()
    "rocdl.sched.group.barrier"() <{groupId = 3 : i32, mask = #rocdl<sched_group_mask ldsdma>, size = 2 : i32}> : () -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "rocdl.iglp.opt", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "rocdl.iglp.opt"() <{variant = 0 : i32}> : () -> ()
    "rocdl.iglp.opt"() <{variant = 1 : i32}> : () -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<vector<32xf32> (f32, f32, vector<32xf32>, i32, vector<16xf32>, vector<4xf32>, vector<4xf16>, vector<32xi32>, vector<16xi32>, vector<4xi32>, vector<2xi16>, i64, vector<8xbf16>, vector<4xi32>, vector<8xf16>, f64, vector<4xf64>)>, linkage = #llvm.linkage<external>, sym_name = "rocdl.xdlops", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg234: f32, %arg235: f32, %arg236: vector<32xf32>, %arg237: i32, %arg238: vector<16xf32>, %arg239: vector<4xf32>, %arg240: vector<4xf16>, %arg241: vector<32xi32>, %arg242: vector<16xi32>, %arg243: vector<4xi32>, %arg244: vector<2xi16>, %arg245: i64, %arg246: vector<8xbf16>, %arg247: vector<4xi32>, %arg248: vector<8xf16>, %arg249: f64, %arg250: vector<4xf64>):
    %377 = "rocdl.mfma.f32.32x32x1f32"(%arg234, %arg235, %arg236) <{abid = 0 : i32, blgp = #rocdl<mfma_perm_b bcast_first_32>, cbsz = 0 : i32}> : (f32, f32, vector<32xf32>) -> vector<32xf32>
    %378 = "rocdl.mfma.f32.16x16x1f32"(%arg234, %arg235, %arg238) <{abid = 0 : i32, blgp = #rocdl<mfma_perm_b none>, cbsz = 0 : i32}> : (f32, f32, vector<16xf32>) -> vector<16xf32>
    %379 = "rocdl.mfma.f32.16x16x4f32"(%arg234, %arg235, %arg239) <{abid = 0 : i32, blgp = #rocdl<mfma_perm_b none>, cbsz = 0 : i32}> : (f32, f32, vector<4xf32>) -> vector<4xf32>
    %380 = "rocdl.mfma.f32.4x4x1f32"(%arg234, %arg235, %arg239) <{abid = 0 : i32, blgp = #rocdl<mfma_perm_b none>, cbsz = 0 : i32}> : (f32, f32, vector<4xf32>) -> vector<4xf32>
    %381 = "rocdl.mfma.f32.32x32x2f32"(%arg234, %arg235, %arg238) <{abid = 0 : i32, blgp = #rocdl<mfma_perm_b none>, cbsz = 0 : i32}> : (f32, f32, vector<16xf32>) -> vector<16xf32>
    %382 = "rocdl.mfma.f32.32x32x4f16"(%arg240, %arg240, %arg236) <{abid = 0 : i32, blgp = #rocdl<mfma_perm_b none>, cbsz = 0 : i32}> : (vector<4xf16>, vector<4xf16>, vector<32xf32>) -> vector<32xf32>
    %383 = "rocdl.mfma.f32.16x16x4f16"(%arg240, %arg240, %arg238) <{abid = 0 : i32, blgp = #rocdl<mfma_perm_b none>, cbsz = 0 : i32}> : (vector<4xf16>, vector<4xf16>, vector<16xf32>) -> vector<16xf32>
    %384 = "rocdl.mfma.f32.4x4x4f16"(%arg240, %arg240, %arg239) <{abid = 0 : i32, blgp = #rocdl<mfma_perm_b none>, cbsz = 0 : i32}> : (vector<4xf16>, vector<4xf16>, vector<4xf32>) -> vector<4xf32>
    %385 = "rocdl.mfma.f32.32x32x8f16"(%arg240, %arg240, %arg238) <{abid = 0 : i32, blgp = #rocdl<mfma_perm_b none>, cbsz = 0 : i32}> : (vector<4xf16>, vector<4xf16>, vector<16xf32>) -> vector<16xf32>
    %386 = "rocdl.mfma.f32.16x16x16f16"(%arg240, %arg240, %arg239) <{abid = 0 : i32, blgp = #rocdl<mfma_perm_b none>, cbsz = 0 : i32}> : (vector<4xf16>, vector<4xf16>, vector<4xf32>) -> vector<4xf32>
    %387 = "rocdl.mfma.i32.32x32x4i8"(%arg237, %arg237, %arg241) <{abid = 0 : i32, blgp = #rocdl<mfma_perm_b none>, cbsz = 0 : i32}> : (i32, i32, vector<32xi32>) -> vector<32xi32>
    %388 = "rocdl.mfma.i32.16x16x4i8"(%arg237, %arg237, %arg242) <{abid = 0 : i32, blgp = #rocdl<mfma_perm_b none>, cbsz = 0 : i32}> : (i32, i32, vector<16xi32>) -> vector<16xi32>
    %389 = "rocdl.mfma.i32.4x4x4i8"(%arg237, %arg237, %arg243) <{abid = 0 : i32, blgp = #rocdl<mfma_perm_b none>, cbsz = 0 : i32}> : (i32, i32, vector<4xi32>) -> vector<4xi32>
    %390 = "rocdl.mfma.i32.32x32x8i8"(%arg237, %arg237, %arg242) <{abid = 0 : i32, blgp = #rocdl<mfma_perm_b none>, cbsz = 0 : i32}> : (i32, i32, vector<16xi32>) -> vector<16xi32>
    %391 = "rocdl.mfma.i32.16x16x16i8"(%arg237, %arg237, %arg243) <{abid = 0 : i32, blgp = #rocdl<mfma_perm_b none>, cbsz = 0 : i32}> : (i32, i32, vector<4xi32>) -> vector<4xi32>
    %392 = "rocdl.mfma.f32.32x32x2bf16"(%arg244, %arg244, %arg236) <{abid = 0 : i32, blgp = #rocdl<mfma_perm_b none>, cbsz = 0 : i32}> : (vector<2xi16>, vector<2xi16>, vector<32xf32>) -> vector<32xf32>
    %393 = "rocdl.mfma.f32.16x16x2bf16"(%arg244, %arg244, %arg238) <{abid = 0 : i32, blgp = #rocdl<mfma_perm_b none>, cbsz = 0 : i32}> : (vector<2xi16>, vector<2xi16>, vector<16xf32>) -> vector<16xf32>
    %394 = "rocdl.mfma.f32.4x4x2bf16"(%arg244, %arg244, %arg239) <{abid = 0 : i32, blgp = #rocdl<mfma_perm_b none>, cbsz = 0 : i32}> : (vector<2xi16>, vector<2xi16>, vector<4xf32>) -> vector<4xf32>
    %395 = "rocdl.mfma.f32.32x32x4bf16"(%arg244, %arg244, %arg238) <{abid = 0 : i32, blgp = #rocdl<mfma_perm_b none>, cbsz = 0 : i32}> : (vector<2xi16>, vector<2xi16>, vector<16xf32>) -> vector<16xf32>
    %396 = "rocdl.mfma.f32.16x16x8bf16"(%arg244, %arg244, %arg239) <{abid = 0 : i32, blgp = #rocdl<mfma_perm_b none>, cbsz = 0 : i32}> : (vector<2xi16>, vector<2xi16>, vector<4xf32>) -> vector<4xf32>
    %397 = "rocdl.mfma.f32.16x16x32.bf8.bf8"(%arg245, %arg245, %arg239) <{abid = 0 : i32, blgp = #rocdl<mfma_perm_b none>, cbsz = 0 : i32}> : (i64, i64, vector<4xf32>) -> vector<4xf32>
    %398 = "rocdl.mfma.f32.16x16x32.bf8.fp8"(%arg245, %arg245, %arg239) <{abid = 0 : i32, blgp = #rocdl<mfma_perm_b none>, cbsz = 0 : i32}> : (i64, i64, vector<4xf32>) -> vector<4xf32>
    %399 = "rocdl.mfma.f32.16x16x32.fp8.bf8"(%arg245, %arg245, %arg239) <{abid = 0 : i32, blgp = #rocdl<mfma_perm_b none>, cbsz = 0 : i32}> : (i64, i64, vector<4xf32>) -> vector<4xf32>
    %400 = "rocdl.mfma.f32.16x16x32.fp8.fp8"(%arg245, %arg245, %arg239) <{abid = 0 : i32, blgp = #rocdl<mfma_perm_b none>, cbsz = 0 : i32}> : (i64, i64, vector<4xf32>) -> vector<4xf32>
    %401 = "rocdl.mfma.f32.32x32x16.bf8.bf8"(%arg245, %arg245, %arg238) <{abid = 0 : i32, blgp = #rocdl<mfma_perm_b none>, cbsz = 0 : i32}> : (i64, i64, vector<16xf32>) -> vector<16xf32>
    %402 = "rocdl.mfma.f32.32x32x16.bf8.fp8"(%arg245, %arg245, %arg238) <{abid = 0 : i32, blgp = #rocdl<mfma_perm_b none>, cbsz = 0 : i32}> : (i64, i64, vector<16xf32>) -> vector<16xf32>
    %403 = "rocdl.mfma.f32.32x32x16.fp8.bf8"(%arg245, %arg245, %arg238) <{abid = 0 : i32, blgp = #rocdl<mfma_perm_b none>, cbsz = 0 : i32}> : (i64, i64, vector<16xf32>) -> vector<16xf32>
    %404 = "rocdl.mfma.f32.32x32x16.bf8.bf8"(%arg245, %arg245, %arg238) <{abid = 0 : i32, blgp = #rocdl<mfma_perm_b none>, cbsz = 0 : i32}> : (i64, i64, vector<16xf32>) -> vector<16xf32>
    %405 = "rocdl.mfma.f32.16x16x32.bf16"(%arg246, %arg246, %arg239) <{abid = 0 : i32, blgp = #rocdl<mfma_perm_b none>, cbsz = 0 : i32}> : (vector<8xbf16>, vector<8xbf16>, vector<4xf32>) -> vector<4xf32>
    %406 = "rocdl.mfma.i32.16x16x64.i8"(%arg243, %arg243, %arg243) <{abid = 0 : i32, blgp = #rocdl<mfma_perm_b none>, cbsz = 0 : i32}> : (vector<4xi32>, vector<4xi32>, vector<4xi32>) -> vector<4xi32>
    %407 = "rocdl.mfma.f32.16x16x32.f16"(%arg248, %arg248, %arg239) <{abid = 0 : i32, blgp = #rocdl<mfma_perm_b none>, cbsz = 0 : i32}> : (vector<8xf16>, vector<8xf16>, vector<4xf32>) -> vector<4xf32>
    %408 = "rocdl.mfma.f32.32x32x16.bf16"(%arg246, %arg246, %arg238) <{abid = 0 : i32, blgp = #rocdl<mfma_perm_b none>, cbsz = 0 : i32}> : (vector<8xbf16>, vector<8xbf16>, vector<16xf32>) -> vector<16xf32>
    %409 = "rocdl.mfma.i32.32x32x32.i8"(%arg243, %arg243, %arg242) <{abid = 0 : i32, blgp = #rocdl<mfma_perm_b none>, cbsz = 0 : i32}> : (vector<4xi32>, vector<4xi32>, vector<16xi32>) -> vector<16xi32>
    %410 = "rocdl.mfma.f32.32x32x16.f16"(%arg248, %arg248, %arg238) <{abid = 0 : i32, blgp = #rocdl<mfma_perm_b none>, cbsz = 0 : i32}> : (vector<8xf16>, vector<8xf16>, vector<16xf32>) -> vector<16xf32>
    %411 = "rocdl.mfma.f64.16x16x4f64"(%arg249, %arg249, %arg250) <{abid = 0 : i32, blgp = #rocdl<mfma_neg_modifier neg_a|neg_b>, cbsz = 0 : i32}> : (f64, f64, vector<4xf64>) -> vector<4xf64>
    "llvm.return"(%377) : (vector<32xf32>) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<vector<4xf32> (i32, vector<4xf16>, vector<8xf16>, vector<4xf32>, vector<16xf32>, vector<4xi16>, vector<8xi16>, vector<2xi32>, vector<4xi32>, vector<16xi32>, vector<16xf16>, vector<8xbf16>, vector<16xbf16>, vector<8xi32>)>, linkage = #llvm.linkage<external>, sym_name = "rocdl.smfmac", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg220: i32, %arg221: vector<4xf16>, %arg222: vector<8xf16>, %arg223: vector<4xf32>, %arg224: vector<16xf32>, %arg225: vector<4xi16>, %arg226: vector<8xi16>, %arg227: vector<2xi32>, %arg228: vector<4xi32>, %arg229: vector<16xi32>, %arg230: vector<16xf16>, %arg231: vector<8xbf16>, %arg232: vector<16xbf16>, %arg233: vector<8xi32>):
    %348 = "llvm.mlir.constant"() <{value = 42 : i32}> : () -> i32
    %349 = "rocdl.smfmac.f32.16x16x32.f16"(%arg221, %arg222, %arg223, %348) <{abid = 0 : i32, cbsz = 0 : i32}> : (vector<4xf16>, vector<8xf16>, vector<4xf32>, i32) -> vector<4xf32>
    %350 = "rocdl.smfmac.f32.32x32x16.f16"(%arg221, %arg222, %arg224, %348) <{abid = 0 : i32, cbsz = 0 : i32}> : (vector<4xf16>, vector<8xf16>, vector<16xf32>, i32) -> vector<16xf32>
    %351 = "rocdl.smfmac.f32.16x16x32.bf16"(%arg225, %arg226, %arg223, %348) <{abid = 0 : i32, cbsz = 0 : i32}> : (vector<4xi16>, vector<8xi16>, vector<4xf32>, i32) -> vector<4xf32>
    %352 = "rocdl.smfmac.f32.32x32x16.bf16"(%arg225, %arg226, %arg224, %348) <{abid = 0 : i32, cbsz = 0 : i32}> : (vector<4xi16>, vector<8xi16>, vector<16xf32>, i32) -> vector<16xf32>
    %353 = "rocdl.smfmac.i32.16x16x64.i8"(%arg227, %arg228, %arg228, %348) <{abid = 0 : i32, cbsz = 0 : i32}> : (vector<2xi32>, vector<4xi32>, vector<4xi32>, i32) -> vector<4xi32>
    %354 = "rocdl.smfmac.i32.32x32x32.i8"(%arg227, %arg228, %arg229, %348) <{abid = 0 : i32, cbsz = 0 : i32}> : (vector<2xi32>, vector<4xi32>, vector<16xi32>, i32) -> vector<16xi32>
    %355 = "rocdl.smfmac.f32.16x16x64.bf8.bf8"(%arg227, %arg228, %arg223, %348) <{abid = 0 : i32, cbsz = 0 : i32}> : (vector<2xi32>, vector<4xi32>, vector<4xf32>, i32) -> vector<4xf32>
    %356 = "rocdl.smfmac.f32.16x16x64.bf8.fp8"(%arg227, %arg228, %arg223, %348) <{abid = 0 : i32, cbsz = 0 : i32}> : (vector<2xi32>, vector<4xi32>, vector<4xf32>, i32) -> vector<4xf32>
    %357 = "rocdl.smfmac.f32.16x16x64.fp8.bf8"(%arg227, %arg228, %arg223, %348) <{abid = 0 : i32, cbsz = 0 : i32}> : (vector<2xi32>, vector<4xi32>, vector<4xf32>, i32) -> vector<4xf32>
    %358 = "rocdl.smfmac.f32.16x16x64.fp8.fp8"(%arg227, %arg228, %arg223, %348) <{abid = 0 : i32, cbsz = 0 : i32}> : (vector<2xi32>, vector<4xi32>, vector<4xf32>, i32) -> vector<4xf32>
    %359 = "rocdl.smfmac.f32.32x32x32.bf8.bf8"(%arg227, %arg228, %arg224, %348) <{abid = 0 : i32, cbsz = 0 : i32}> : (vector<2xi32>, vector<4xi32>, vector<16xf32>, i32) -> vector<16xf32>
    %360 = "rocdl.smfmac.f32.32x32x32.bf8.fp8"(%arg227, %arg228, %arg224, %348) <{abid = 0 : i32, cbsz = 0 : i32}> : (vector<2xi32>, vector<4xi32>, vector<16xf32>, i32) -> vector<16xf32>
    %361 = "rocdl.smfmac.f32.32x32x32.fp8.bf8"(%arg227, %arg228, %arg224, %348) <{abid = 0 : i32, cbsz = 0 : i32}> : (vector<2xi32>, vector<4xi32>, vector<16xf32>, i32) -> vector<16xf32>
    %362 = "rocdl.smfmac.f32.32x32x32.fp8.fp8"(%arg227, %arg228, %arg224, %348) <{abid = 0 : i32, cbsz = 0 : i32}> : (vector<2xi32>, vector<4xi32>, vector<16xf32>, i32) -> vector<16xf32>
    %363 = "rocdl.smfmac.f32.16x16x64.f16"(%arg222, %arg230, %arg223, %348) <{abid = 0 : i32, cbsz = 0 : i32}> : (vector<8xf16>, vector<16xf16>, vector<4xf32>, i32) -> vector<4xf32>
    %364 = "rocdl.smfmac.f32.32x32x32.f16"(%arg222, %arg230, %arg224, %348) <{abid = 0 : i32, cbsz = 0 : i32}> : (vector<8xf16>, vector<16xf16>, vector<16xf32>, i32) -> vector<16xf32>
    %365 = "rocdl.smfmac.f32.16x16x64.bf16"(%arg231, %arg232, %arg223, %348) <{abid = 0 : i32, cbsz = 0 : i32}> : (vector<8xbf16>, vector<16xbf16>, vector<4xf32>, i32) -> vector<4xf32>
    %366 = "rocdl.smfmac.f32.32x32x32.bf16"(%arg231, %arg232, %arg224, %348) <{abid = 0 : i32, cbsz = 0 : i32}> : (vector<8xbf16>, vector<16xbf16>, vector<16xf32>, i32) -> vector<16xf32>
    %367 = "rocdl.smfmac.i32.16x16x128.i8"(%arg228, %arg233, %arg228, %348) <{abid = 0 : i32, cbsz = 0 : i32}> : (vector<4xi32>, vector<8xi32>, vector<4xi32>, i32) -> vector<4xi32>
    %368 = "rocdl.smfmac.f32.16x16x128.bf8.bf8"(%arg228, %arg233, %arg223, %348) <{abid = 0 : i32, cbsz = 0 : i32}> : (vector<4xi32>, vector<8xi32>, vector<4xf32>, i32) -> vector<4xf32>
    %369 = "rocdl.smfmac.f32.16x16x128.bf8.fp8"(%arg228, %arg233, %arg223, %348) <{abid = 0 : i32, cbsz = 0 : i32}> : (vector<4xi32>, vector<8xi32>, vector<4xf32>, i32) -> vector<4xf32>
    %370 = "rocdl.smfmac.f32.16x16x128.fp8.bf8"(%arg228, %arg233, %arg223, %348) <{abid = 0 : i32, cbsz = 0 : i32}> : (vector<4xi32>, vector<8xi32>, vector<4xf32>, i32) -> vector<4xf32>
    %371 = "rocdl.smfmac.f32.16x16x128.fp8.fp8"(%arg228, %arg233, %arg223, %348) <{abid = 0 : i32, cbsz = 0 : i32}> : (vector<4xi32>, vector<8xi32>, vector<4xf32>, i32) -> vector<4xf32>
    %372 = "rocdl.smfmac.i32.32x32x64.i8"(%arg228, %arg233, %arg229, %348) <{abid = 0 : i32, cbsz = 0 : i32}> : (vector<4xi32>, vector<8xi32>, vector<16xi32>, i32) -> vector<16xi32>
    %373 = "rocdl.smfmac.f32.32x32x64.bf8.bf8"(%arg228, %arg233, %arg224, %348) <{abid = 0 : i32, cbsz = 0 : i32}> : (vector<4xi32>, vector<8xi32>, vector<16xf32>, i32) -> vector<16xf32>
    %374 = "rocdl.smfmac.f32.32x32x64.bf8.fp8"(%arg228, %arg233, %arg224, %348) <{abid = 0 : i32, cbsz = 0 : i32}> : (vector<4xi32>, vector<8xi32>, vector<16xf32>, i32) -> vector<16xf32>
    %375 = "rocdl.smfmac.f32.32x32x64.fp8.bf8"(%arg228, %arg233, %arg224, %348) <{abid = 0 : i32, cbsz = 0 : i32}> : (vector<4xi32>, vector<8xi32>, vector<16xf32>, i32) -> vector<16xf32>
    %376 = "rocdl.smfmac.f32.32x32x64.fp8.fp8"(%arg228, %arg233, %arg224, %348) <{abid = 0 : i32, cbsz = 0 : i32}> : (vector<4xi32>, vector<8xi32>, vector<16xf32>, i32) -> vector<16xf32>
    "llvm.return"(%349) : (vector<4xf32>) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<vector<16xf32> (i32, vector<16xf32>, vector<8xi32>, vector<6xi32>, vector<4xi32>)>, linkage = #llvm.linkage<external>, sym_name = "rocdl.mfma.scale.f32.32x32x64.f8f6f4", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg215: i32, %arg216: vector<16xf32>, %arg217: vector<8xi32>, %arg218: vector<6xi32>, %arg219: vector<4xi32>):
    %323 = "rocdl.mfma.scale.f32.32x32x64.f8f6f4"(%arg217, %arg217, %arg216, %arg215, %arg215) <{blgp = #rocdl<matrix_format fp8_e4m3>, cbsz = #rocdl<matrix_format fp8_e4m3>, opselA = 0 : i32, opselB = 0 : i32}> : (vector<8xi32>, vector<8xi32>, vector<16xf32>, i32, i32) -> vector<16xf32>
    %324 = "rocdl.mfma.scale.f32.32x32x64.f8f6f4"(%arg217, %arg217, %arg216, %arg215, %arg215) <{blgp = #rocdl<matrix_format fp8_e5m2>, cbsz = #rocdl<matrix_format fp8_e4m3>, opselA = 0 : i32, opselB = 0 : i32}> : (vector<8xi32>, vector<8xi32>, vector<16xf32>, i32, i32) -> vector<16xf32>
    %325 = "rocdl.mfma.scale.f32.32x32x64.f8f6f4"(%arg217, %arg218, %arg216, %arg215, %arg215) <{blgp = #rocdl<matrix_format fp6_e2m3>, cbsz = #rocdl<matrix_format fp8_e4m3>, opselA = 0 : i32, opselB = 0 : i32}> : (vector<8xi32>, vector<6xi32>, vector<16xf32>, i32, i32) -> vector<16xf32>
    %326 = "rocdl.mfma.scale.f32.32x32x64.f8f6f4"(%arg217, %arg218, %arg216, %arg215, %arg215) <{blgp = #rocdl<matrix_format fp6_e3m2>, cbsz = #rocdl<matrix_format fp8_e4m3>, opselA = 0 : i32, opselB = 0 : i32}> : (vector<8xi32>, vector<6xi32>, vector<16xf32>, i32, i32) -> vector<16xf32>
    %327 = "rocdl.mfma.scale.f32.32x32x64.f8f6f4"(%arg217, %arg219, %arg216, %arg215, %arg215) <{blgp = #rocdl<matrix_format fp4_e2m1>, cbsz = #rocdl<matrix_format fp8_e4m3>, opselA = 0 : i32, opselB = 0 : i32}> : (vector<8xi32>, vector<4xi32>, vector<16xf32>, i32, i32) -> vector<16xf32>
    %328 = "rocdl.mfma.scale.f32.32x32x64.f8f6f4"(%arg217, %arg217, %arg216, %arg215, %arg215) <{blgp = #rocdl<matrix_format fp8_e4m3>, cbsz = #rocdl<matrix_format fp8_e5m2>, opselA = 0 : i32, opselB = 0 : i32}> : (vector<8xi32>, vector<8xi32>, vector<16xf32>, i32, i32) -> vector<16xf32>
    %329 = "rocdl.mfma.scale.f32.32x32x64.f8f6f4"(%arg217, %arg217, %arg216, %arg215, %arg215) <{blgp = #rocdl<matrix_format fp8_e5m2>, cbsz = #rocdl<matrix_format fp8_e5m2>, opselA = 0 : i32, opselB = 0 : i32}> : (vector<8xi32>, vector<8xi32>, vector<16xf32>, i32, i32) -> vector<16xf32>
    %330 = "rocdl.mfma.scale.f32.32x32x64.f8f6f4"(%arg217, %arg218, %arg216, %arg215, %arg215) <{blgp = #rocdl<matrix_format fp6_e2m3>, cbsz = #rocdl<matrix_format fp8_e5m2>, opselA = 0 : i32, opselB = 0 : i32}> : (vector<8xi32>, vector<6xi32>, vector<16xf32>, i32, i32) -> vector<16xf32>
    %331 = "rocdl.mfma.scale.f32.32x32x64.f8f6f4"(%arg217, %arg218, %arg216, %arg215, %arg215) <{blgp = #rocdl<matrix_format fp6_e3m2>, cbsz = #rocdl<matrix_format fp8_e5m2>, opselA = 0 : i32, opselB = 0 : i32}> : (vector<8xi32>, vector<6xi32>, vector<16xf32>, i32, i32) -> vector<16xf32>
    %332 = "rocdl.mfma.scale.f32.32x32x64.f8f6f4"(%arg217, %arg219, %arg216, %arg215, %arg215) <{blgp = #rocdl<matrix_format fp4_e2m1>, cbsz = #rocdl<matrix_format fp8_e5m2>, opselA = 0 : i32, opselB = 0 : i32}> : (vector<8xi32>, vector<4xi32>, vector<16xf32>, i32, i32) -> vector<16xf32>
    %333 = "rocdl.mfma.scale.f32.32x32x64.f8f6f4"(%arg218, %arg217, %arg216, %arg215, %arg215) <{blgp = #rocdl<matrix_format fp8_e4m3>, cbsz = #rocdl<matrix_format fp6_e2m3>, opselA = 0 : i32, opselB = 0 : i32}> : (vector<6xi32>, vector<8xi32>, vector<16xf32>, i32, i32) -> vector<16xf32>
    %334 = "rocdl.mfma.scale.f32.32x32x64.f8f6f4"(%arg218, %arg217, %arg216, %arg215, %arg215) <{blgp = #rocdl<matrix_format fp8_e5m2>, cbsz = #rocdl<matrix_format fp6_e2m3>, opselA = 0 : i32, opselB = 0 : i32}> : (vector<6xi32>, vector<8xi32>, vector<16xf32>, i32, i32) -> vector<16xf32>
    %335 = "rocdl.mfma.scale.f32.32x32x64.f8f6f4"(%arg218, %arg218, %arg216, %arg215, %arg215) <{blgp = #rocdl<matrix_format fp6_e2m3>, cbsz = #rocdl<matrix_format fp6_e2m3>, opselA = 0 : i32, opselB = 0 : i32}> : (vector<6xi32>, vector<6xi32>, vector<16xf32>, i32, i32) -> vector<16xf32>
    %336 = "rocdl.mfma.scale.f32.32x32x64.f8f6f4"(%arg218, %arg218, %arg216, %arg215, %arg215) <{blgp = #rocdl<matrix_format fp6_e3m2>, cbsz = #rocdl<matrix_format fp6_e2m3>, opselA = 0 : i32, opselB = 0 : i32}> : (vector<6xi32>, vector<6xi32>, vector<16xf32>, i32, i32) -> vector<16xf32>
    %337 = "rocdl.mfma.scale.f32.32x32x64.f8f6f4"(%arg218, %arg219, %arg216, %arg215, %arg215) <{blgp = #rocdl<matrix_format fp4_e2m1>, cbsz = #rocdl<matrix_format fp6_e2m3>, opselA = 0 : i32, opselB = 0 : i32}> : (vector<6xi32>, vector<4xi32>, vector<16xf32>, i32, i32) -> vector<16xf32>
    %338 = "rocdl.mfma.scale.f32.32x32x64.f8f6f4"(%arg218, %arg217, %arg216, %arg215, %arg215) <{blgp = #rocdl<matrix_format fp8_e4m3>, cbsz = #rocdl<matrix_format fp6_e3m2>, opselA = 0 : i32, opselB = 0 : i32}> : (vector<6xi32>, vector<8xi32>, vector<16xf32>, i32, i32) -> vector<16xf32>
    %339 = "rocdl.mfma.scale.f32.32x32x64.f8f6f4"(%arg218, %arg217, %arg216, %arg215, %arg215) <{blgp = #rocdl<matrix_format fp8_e5m2>, cbsz = #rocdl<matrix_format fp6_e3m2>, opselA = 0 : i32, opselB = 0 : i32}> : (vector<6xi32>, vector<8xi32>, vector<16xf32>, i32, i32) -> vector<16xf32>
    %340 = "rocdl.mfma.scale.f32.32x32x64.f8f6f4"(%arg218, %arg218, %arg216, %arg215, %arg215) <{blgp = #rocdl<matrix_format fp6_e2m3>, cbsz = #rocdl<matrix_format fp6_e3m2>, opselA = 0 : i32, opselB = 0 : i32}> : (vector<6xi32>, vector<6xi32>, vector<16xf32>, i32, i32) -> vector<16xf32>
    %341 = "rocdl.mfma.scale.f32.32x32x64.f8f6f4"(%arg218, %arg218, %arg216, %arg215, %arg215) <{blgp = #rocdl<matrix_format fp6_e3m2>, cbsz = #rocdl<matrix_format fp6_e3m2>, opselA = 0 : i32, opselB = 0 : i32}> : (vector<6xi32>, vector<6xi32>, vector<16xf32>, i32, i32) -> vector<16xf32>
    %342 = "rocdl.mfma.scale.f32.32x32x64.f8f6f4"(%arg218, %arg219, %arg216, %arg215, %arg215) <{blgp = #rocdl<matrix_format fp4_e2m1>, cbsz = #rocdl<matrix_format fp6_e3m2>, opselA = 0 : i32, opselB = 0 : i32}> : (vector<6xi32>, vector<4xi32>, vector<16xf32>, i32, i32) -> vector<16xf32>
    %343 = "rocdl.mfma.scale.f32.32x32x64.f8f6f4"(%arg219, %arg217, %arg216, %arg215, %arg215) <{blgp = #rocdl<matrix_format fp8_e4m3>, cbsz = #rocdl<matrix_format fp4_e2m1>, opselA = 0 : i32, opselB = 0 : i32}> : (vector<4xi32>, vector<8xi32>, vector<16xf32>, i32, i32) -> vector<16xf32>
    %344 = "rocdl.mfma.scale.f32.32x32x64.f8f6f4"(%arg219, %arg217, %arg216, %arg215, %arg215) <{blgp = #rocdl<matrix_format fp8_e5m2>, cbsz = #rocdl<matrix_format fp4_e2m1>, opselA = 0 : i32, opselB = 0 : i32}> : (vector<4xi32>, vector<8xi32>, vector<16xf32>, i32, i32) -> vector<16xf32>
    %345 = "rocdl.mfma.scale.f32.32x32x64.f8f6f4"(%arg219, %arg218, %arg216, %arg215, %arg215) <{blgp = #rocdl<matrix_format fp6_e2m3>, cbsz = #rocdl<matrix_format fp4_e2m1>, opselA = 0 : i32, opselB = 0 : i32}> : (vector<4xi32>, vector<6xi32>, vector<16xf32>, i32, i32) -> vector<16xf32>
    %346 = "rocdl.mfma.scale.f32.32x32x64.f8f6f4"(%arg219, %arg218, %arg216, %arg215, %arg215) <{blgp = #rocdl<matrix_format fp6_e3m2>, cbsz = #rocdl<matrix_format fp4_e2m1>, opselA = 0 : i32, opselB = 0 : i32}> : (vector<4xi32>, vector<6xi32>, vector<16xf32>, i32, i32) -> vector<16xf32>
    %347 = "rocdl.mfma.scale.f32.32x32x64.f8f6f4"(%arg219, %arg219, %arg216, %arg215, %arg215) <{blgp = #rocdl<matrix_format fp4_e2m1>, cbsz = #rocdl<matrix_format fp4_e2m1>, opselA = 0 : i32, opselB = 0 : i32}> : (vector<4xi32>, vector<4xi32>, vector<16xf32>, i32, i32) -> vector<16xf32>
    "llvm.return"(%323) : (vector<16xf32>) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<vector<4xf32> (i32, vector<4xf32>, vector<8xi32>, vector<6xi32>, vector<4xi32>)>, linkage = #llvm.linkage<external>, sym_name = "rocdl.mfma.scale.f32.16x16x128.f8f6f4", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg210: i32, %arg211: vector<4xf32>, %arg212: vector<8xi32>, %arg213: vector<6xi32>, %arg214: vector<4xi32>):
    %298 = "rocdl.mfma.scale.f32.16x16x128.f8f6f4"(%arg212, %arg212, %arg211, %arg210, %arg210) <{blgp = #rocdl<matrix_format fp8_e4m3>, cbsz = #rocdl<matrix_format fp8_e4m3>, opselA = 0 : i32, opselB = 0 : i32}> : (vector<8xi32>, vector<8xi32>, vector<4xf32>, i32, i32) -> vector<4xf32>
    %299 = "rocdl.mfma.scale.f32.16x16x128.f8f6f4"(%arg212, %arg212, %arg211, %arg210, %arg210) <{blgp = #rocdl<matrix_format fp8_e5m2>, cbsz = #rocdl<matrix_format fp8_e4m3>, opselA = 0 : i32, opselB = 0 : i32}> : (vector<8xi32>, vector<8xi32>, vector<4xf32>, i32, i32) -> vector<4xf32>
    %300 = "rocdl.mfma.scale.f32.16x16x128.f8f6f4"(%arg212, %arg213, %arg211, %arg210, %arg210) <{blgp = #rocdl<matrix_format fp6_e2m3>, cbsz = #rocdl<matrix_format fp8_e4m3>, opselA = 0 : i32, opselB = 0 : i32}> : (vector<8xi32>, vector<6xi32>, vector<4xf32>, i32, i32) -> vector<4xf32>
    %301 = "rocdl.mfma.scale.f32.16x16x128.f8f6f4"(%arg212, %arg213, %arg211, %arg210, %arg210) <{blgp = #rocdl<matrix_format fp6_e3m2>, cbsz = #rocdl<matrix_format fp8_e4m3>, opselA = 0 : i32, opselB = 0 : i32}> : (vector<8xi32>, vector<6xi32>, vector<4xf32>, i32, i32) -> vector<4xf32>
    %302 = "rocdl.mfma.scale.f32.16x16x128.f8f6f4"(%arg212, %arg214, %arg211, %arg210, %arg210) <{blgp = #rocdl<matrix_format fp4_e2m1>, cbsz = #rocdl<matrix_format fp8_e4m3>, opselA = 0 : i32, opselB = 0 : i32}> : (vector<8xi32>, vector<4xi32>, vector<4xf32>, i32, i32) -> vector<4xf32>
    %303 = "rocdl.mfma.scale.f32.16x16x128.f8f6f4"(%arg212, %arg212, %arg211, %arg210, %arg210) <{blgp = #rocdl<matrix_format fp8_e4m3>, cbsz = #rocdl<matrix_format fp8_e5m2>, opselA = 0 : i32, opselB = 0 : i32}> : (vector<8xi32>, vector<8xi32>, vector<4xf32>, i32, i32) -> vector<4xf32>
    %304 = "rocdl.mfma.scale.f32.16x16x128.f8f6f4"(%arg212, %arg212, %arg211, %arg210, %arg210) <{blgp = #rocdl<matrix_format fp8_e5m2>, cbsz = #rocdl<matrix_format fp8_e5m2>, opselA = 0 : i32, opselB = 0 : i32}> : (vector<8xi32>, vector<8xi32>, vector<4xf32>, i32, i32) -> vector<4xf32>
    %305 = "rocdl.mfma.scale.f32.16x16x128.f8f6f4"(%arg212, %arg213, %arg211, %arg210, %arg210) <{blgp = #rocdl<matrix_format fp6_e2m3>, cbsz = #rocdl<matrix_format fp8_e5m2>, opselA = 0 : i32, opselB = 0 : i32}> : (vector<8xi32>, vector<6xi32>, vector<4xf32>, i32, i32) -> vector<4xf32>
    %306 = "rocdl.mfma.scale.f32.16x16x128.f8f6f4"(%arg212, %arg213, %arg211, %arg210, %arg210) <{blgp = #rocdl<matrix_format fp6_e3m2>, cbsz = #rocdl<matrix_format fp8_e5m2>, opselA = 0 : i32, opselB = 0 : i32}> : (vector<8xi32>, vector<6xi32>, vector<4xf32>, i32, i32) -> vector<4xf32>
    %307 = "rocdl.mfma.scale.f32.16x16x128.f8f6f4"(%arg212, %arg214, %arg211, %arg210, %arg210) <{blgp = #rocdl<matrix_format fp4_e2m1>, cbsz = #rocdl<matrix_format fp8_e5m2>, opselA = 0 : i32, opselB = 0 : i32}> : (vector<8xi32>, vector<4xi32>, vector<4xf32>, i32, i32) -> vector<4xf32>
    %308 = "rocdl.mfma.scale.f32.16x16x128.f8f6f4"(%arg213, %arg212, %arg211, %arg210, %arg210) <{blgp = #rocdl<matrix_format fp8_e4m3>, cbsz = #rocdl<matrix_format fp6_e2m3>, opselA = 0 : i32, opselB = 0 : i32}> : (vector<6xi32>, vector<8xi32>, vector<4xf32>, i32, i32) -> vector<4xf32>
    %309 = "rocdl.mfma.scale.f32.16x16x128.f8f6f4"(%arg213, %arg212, %arg211, %arg210, %arg210) <{blgp = #rocdl<matrix_format fp8_e5m2>, cbsz = #rocdl<matrix_format fp6_e2m3>, opselA = 0 : i32, opselB = 0 : i32}> : (vector<6xi32>, vector<8xi32>, vector<4xf32>, i32, i32) -> vector<4xf32>
    %310 = "rocdl.mfma.scale.f32.16x16x128.f8f6f4"(%arg213, %arg213, %arg211, %arg210, %arg210) <{blgp = #rocdl<matrix_format fp6_e2m3>, cbsz = #rocdl<matrix_format fp6_e2m3>, opselA = 0 : i32, opselB = 0 : i32}> : (vector<6xi32>, vector<6xi32>, vector<4xf32>, i32, i32) -> vector<4xf32>
    %311 = "rocdl.mfma.scale.f32.16x16x128.f8f6f4"(%arg213, %arg213, %arg211, %arg210, %arg210) <{blgp = #rocdl<matrix_format fp6_e3m2>, cbsz = #rocdl<matrix_format fp6_e2m3>, opselA = 0 : i32, opselB = 0 : i32}> : (vector<6xi32>, vector<6xi32>, vector<4xf32>, i32, i32) -> vector<4xf32>
    %312 = "rocdl.mfma.scale.f32.16x16x128.f8f6f4"(%arg213, %arg214, %arg211, %arg210, %arg210) <{blgp = #rocdl<matrix_format fp4_e2m1>, cbsz = #rocdl<matrix_format fp6_e2m3>, opselA = 0 : i32, opselB = 0 : i32}> : (vector<6xi32>, vector<4xi32>, vector<4xf32>, i32, i32) -> vector<4xf32>
    %313 = "rocdl.mfma.scale.f32.16x16x128.f8f6f4"(%arg213, %arg212, %arg211, %arg210, %arg210) <{blgp = #rocdl<matrix_format fp8_e4m3>, cbsz = #rocdl<matrix_format fp6_e3m2>, opselA = 0 : i32, opselB = 0 : i32}> : (vector<6xi32>, vector<8xi32>, vector<4xf32>, i32, i32) -> vector<4xf32>
    %314 = "rocdl.mfma.scale.f32.16x16x128.f8f6f4"(%arg213, %arg212, %arg211, %arg210, %arg210) <{blgp = #rocdl<matrix_format fp8_e5m2>, cbsz = #rocdl<matrix_format fp6_e3m2>, opselA = 0 : i32, opselB = 0 : i32}> : (vector<6xi32>, vector<8xi32>, vector<4xf32>, i32, i32) -> vector<4xf32>
    %315 = "rocdl.mfma.scale.f32.16x16x128.f8f6f4"(%arg213, %arg213, %arg211, %arg210, %arg210) <{blgp = #rocdl<matrix_format fp6_e2m3>, cbsz = #rocdl<matrix_format fp6_e3m2>, opselA = 0 : i32, opselB = 0 : i32}> : (vector<6xi32>, vector<6xi32>, vector<4xf32>, i32, i32) -> vector<4xf32>
    %316 = "rocdl.mfma.scale.f32.16x16x128.f8f6f4"(%arg213, %arg213, %arg211, %arg210, %arg210) <{blgp = #rocdl<matrix_format fp6_e3m2>, cbsz = #rocdl<matrix_format fp6_e3m2>, opselA = 0 : i32, opselB = 0 : i32}> : (vector<6xi32>, vector<6xi32>, vector<4xf32>, i32, i32) -> vector<4xf32>
    %317 = "rocdl.mfma.scale.f32.16x16x128.f8f6f4"(%arg213, %arg214, %arg211, %arg210, %arg210) <{blgp = #rocdl<matrix_format fp4_e2m1>, cbsz = #rocdl<matrix_format fp6_e3m2>, opselA = 0 : i32, opselB = 0 : i32}> : (vector<6xi32>, vector<4xi32>, vector<4xf32>, i32, i32) -> vector<4xf32>
    %318 = "rocdl.mfma.scale.f32.16x16x128.f8f6f4"(%arg214, %arg212, %arg211, %arg210, %arg210) <{blgp = #rocdl<matrix_format fp8_e4m3>, cbsz = #rocdl<matrix_format fp4_e2m1>, opselA = 0 : i32, opselB = 0 : i32}> : (vector<4xi32>, vector<8xi32>, vector<4xf32>, i32, i32) -> vector<4xf32>
    %319 = "rocdl.mfma.scale.f32.16x16x128.f8f6f4"(%arg214, %arg212, %arg211, %arg210, %arg210) <{blgp = #rocdl<matrix_format fp8_e5m2>, cbsz = #rocdl<matrix_format fp4_e2m1>, opselA = 0 : i32, opselB = 0 : i32}> : (vector<4xi32>, vector<8xi32>, vector<4xf32>, i32, i32) -> vector<4xf32>
    %320 = "rocdl.mfma.scale.f32.16x16x128.f8f6f4"(%arg214, %arg213, %arg211, %arg210, %arg210) <{blgp = #rocdl<matrix_format fp6_e2m3>, cbsz = #rocdl<matrix_format fp4_e2m1>, opselA = 0 : i32, opselB = 0 : i32}> : (vector<4xi32>, vector<6xi32>, vector<4xf32>, i32, i32) -> vector<4xf32>
    %321 = "rocdl.mfma.scale.f32.16x16x128.f8f6f4"(%arg214, %arg213, %arg211, %arg210, %arg210) <{blgp = #rocdl<matrix_format fp6_e3m2>, cbsz = #rocdl<matrix_format fp4_e2m1>, opselA = 0 : i32, opselB = 0 : i32}> : (vector<4xi32>, vector<6xi32>, vector<4xf32>, i32, i32) -> vector<4xf32>
    %322 = "rocdl.mfma.scale.f32.16x16x128.f8f6f4"(%arg214, %arg214, %arg211, %arg210, %arg210) <{blgp = #rocdl<matrix_format fp4_e2m1>, cbsz = #rocdl<matrix_format fp4_e2m1>, opselA = 0 : i32, opselB = 0 : i32}> : (vector<4xi32>, vector<4xi32>, vector<4xf32>, i32, i32) -> vector<4xf32>
    "llvm.return"(%298) : (vector<4xf32>) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<vector<8xf32> (vector<8xf32>, vector<16xf16>, vector<16xi16>, vector<8xi32>, vector<2xi32>, vector<4xi32>, vector<4xf32>, vector<8xf16>, vector<8xi16>, vector<32xf16>, vector<16xf32>, vector<4xf32>, vector<32xf32>, vector<64xf32>, vector<64xi32>, vector<64xf16>, vector<16xbf16>, vector<32xbf16>)>, linkage = #llvm.linkage<external>, sym_name = "rocdl.wmma", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg192: vector<8xf32>, %arg193: vector<16xf16>, %arg194: vector<16xi16>, %arg195: vector<8xi32>, %arg196: vector<2xi32>, %arg197: vector<4xi32>, %arg198: vector<4xf32>, %arg199: vector<8xf16>, %arg200: vector<8xi16>, %arg201: vector<32xf16>, %arg202: vector<16xf32>, %arg203: vector<4xf32>, %arg204: vector<32xf32>, %arg205: vector<64xf32>, %arg206: vector<64xi32>, %arg207: vector<64xf16>, %arg208: vector<16xbf16>, %arg209: vector<32xbf16>):
    %251 = "rocdl.wmma.f32.16x16x16.f16"(%arg193, %arg193, %arg192) : (vector<16xf16>, vector<16xf16>, vector<8xf32>) -> vector<8xf32>
    %252 = "rocdl.wmma.f32.16x16x16.bf16"(%arg194, %arg194, %arg192) : (vector<16xi16>, vector<16xi16>, vector<8xf32>) -> vector<8xf32>
    %253 = "rocdl.wmma.f16.16x16x16.f16"(%arg193, %arg193, %arg193) <{opsel = false}> : (vector<16xf16>, vector<16xf16>, vector<16xf16>) -> vector<16xf16>
    %254 = "rocdl.wmma.bf16.16x16x16.bf16"(%arg194, %arg194, %arg194) <{opsel = false}> : (vector<16xi16>, vector<16xi16>, vector<16xi16>) -> vector<16xi16>
    %255 = "rocdl.wmma.i32.16x16x16.iu8"(%arg197, %arg197, %arg195) <{clamp = false, signA = false, signB = false}> : (vector<4xi32>, vector<4xi32>, vector<8xi32>) -> vector<8xi32>
    %256 = "rocdl.wmma.i32.16x16x16.iu4"(%arg196, %arg196, %arg195) <{clamp = false, signA = false, signB = false}> : (vector<2xi32>, vector<2xi32>, vector<8xi32>) -> vector<8xi32>
    %257 = "rocdl.wmma.i32.16x16x32.iu4"(%arg196, %arg196, %arg195) <{clamp = false, signA = false, signB = false}> : (vector<2xi32>, vector<2xi32>, vector<8xi32>) -> vector<8xi32>
    %258 = "rocdl.wmma.i32.16x16x16.iu8"(%arg197, %arg197, %arg195) <{clamp = false, signA = true, signB = false}> : (vector<4xi32>, vector<4xi32>, vector<8xi32>) -> vector<8xi32>
    %259 = "rocdl.wmma.i32.16x16x16.iu8"(%arg197, %arg197, %arg195) <{clamp = false, signA = false, signB = true}> : (vector<4xi32>, vector<4xi32>, vector<8xi32>) -> vector<8xi32>
    %260 = "rocdl.wmma.i32.16x16x16.iu8"(%arg197, %arg197, %arg195) <{clamp = true, signA = true, signB = true}> : (vector<4xi32>, vector<4xi32>, vector<8xi32>) -> vector<8xi32>
    %261 = "rocdl.wmma.i32.16x16x16.iu4"(%arg196, %arg196, %arg195) <{clamp = false, signA = true, signB = false}> : (vector<2xi32>, vector<2xi32>, vector<8xi32>) -> vector<8xi32>
    %262 = "rocdl.wmma.i32.16x16x16.iu4"(%arg196, %arg196, %arg195) <{clamp = true, signA = false, signB = true}> : (vector<2xi32>, vector<2xi32>, vector<8xi32>) -> vector<8xi32>
    %263 = "rocdl.wmma.i32.16x16x32.iu4"(%arg196, %arg196, %arg195) <{clamp = false, signA = true, signB = true}> : (vector<2xi32>, vector<2xi32>, vector<8xi32>) -> vector<8xi32>
    %264 = "rocdl.wmma.f32.16x16x4.f32"(%arg202, %arg202, %arg203) <{modC = #rocdl<wmma_c_modifier none>, reuseA = false, reuseB = false}> : (vector<16xf32>, vector<16xf32>, vector<4xf32>) -> vector<4xf32>
    %265 = "rocdl.wmma.f32.16x16x32.f16"(%arg193, %arg193, %arg204) <{modC = #rocdl<wmma_c_modifier none>, reuseA = false, reuseB = false}> : (vector<16xf16>, vector<16xf16>, vector<32xf32>) -> vector<32xf32>
    %266 = "rocdl.wmma.f32.16x16x32.bf16"(%arg208, %arg208, %arg204) <{modC = #rocdl<wmma_c_modifier none>, reuseA = false, reuseB = false}> : (vector<16xbf16>, vector<16xbf16>, vector<32xf32>) -> vector<32xf32>
    %267 = "rocdl.wmma.f16.16x16x32.f16"(%arg193, %arg193, %arg201) <{modC = #rocdl<wmma_c_modifier none>, reuseA = false, reuseB = false}> : (vector<16xf16>, vector<16xf16>, vector<32xf16>) -> vector<32xf16>
    %268 = "rocdl.wmma.bf16.16x16x32.bf16"(%arg208, %arg208, %arg209) <{modC = #rocdl<wmma_c_modifier none>, reuseA = false, reuseB = false}> : (vector<16xbf16>, vector<16xbf16>, vector<32xbf16>) -> vector<32xbf16>
    %269 = "rocdl.wmma.bf16f32.16x16x32.bf16"(%arg208, %arg208, %arg204) <{modC = #rocdl<wmma_c_modifier none>, reuseA = false, reuseB = false}> : (vector<16xbf16>, vector<16xbf16>, vector<32xf32>) -> vector<32xbf16>
    %270 = "rocdl.wmma.f32.16x16x64.fp8_fp8"(%arg197, %arg197, %arg205) <{modC = #rocdl<wmma_c_modifier none>, reuseA = false, reuseB = false}> : (vector<4xi32>, vector<4xi32>, vector<64xf32>) -> vector<64xf32>
    %271 = "rocdl.wmma.f32.16x16x64.fp8_bf8"(%arg197, %arg197, %arg205) <{modC = #rocdl<wmma_c_modifier none>, reuseA = false, reuseB = false}> : (vector<4xi32>, vector<4xi32>, vector<64xf32>) -> vector<64xf32>
    %272 = "rocdl.wmma.f32.16x16x64.bf8_fp8"(%arg197, %arg197, %arg205) <{modC = #rocdl<wmma_c_modifier none>, reuseA = false, reuseB = false}> : (vector<4xi32>, vector<4xi32>, vector<64xf32>) -> vector<64xf32>
    %273 = "rocdl.wmma.f32.16x16x64.bf8_bf8"(%arg197, %arg197, %arg205) <{modC = #rocdl<wmma_c_modifier none>, reuseA = false, reuseB = false}> : (vector<4xi32>, vector<4xi32>, vector<64xf32>) -> vector<64xf32>
    %274 = "rocdl.wmma.f16.16x16x64.fp8_fp8"(%arg197, %arg197, %arg207) <{modC = #rocdl<wmma_c_modifier none>, reuseA = false, reuseB = false}> : (vector<4xi32>, vector<4xi32>, vector<64xf16>) -> vector<64xf16>
    %275 = "rocdl.wmma.f16.16x16x64.fp8_bf8"(%arg197, %arg197, %arg207) <{modC = #rocdl<wmma_c_modifier none>, reuseA = false, reuseB = false}> : (vector<4xi32>, vector<4xi32>, vector<64xf16>) -> vector<64xf16>
    %276 = "rocdl.wmma.f16.16x16x64.bf8_fp8"(%arg197, %arg197, %arg207) <{modC = #rocdl<wmma_c_modifier none>, reuseA = false, reuseB = false}> : (vector<4xi32>, vector<4xi32>, vector<64xf16>) -> vector<64xf16>
    %277 = "rocdl.wmma.f16.16x16x64.bf8_bf8"(%arg197, %arg197, %arg207) <{modC = #rocdl<wmma_c_modifier none>, reuseA = false, reuseB = false}> : (vector<4xi32>, vector<4xi32>, vector<64xf16>) -> vector<64xf16>
    %278 = "rocdl.wmma.f32.16x16x128.fp8_fp8"(%arg197, %arg197, %arg205) <{modC = #rocdl<wmma_c_modifier none>, reuseA = false, reuseB = false}> : (vector<4xi32>, vector<4xi32>, vector<64xf32>) -> vector<64xf32>
    %279 = "rocdl.wmma.f32.16x16x128.fp8_bf8"(%arg197, %arg197, %arg205) <{modC = #rocdl<wmma_c_modifier none>, reuseA = false, reuseB = false}> : (vector<4xi32>, vector<4xi32>, vector<64xf32>) -> vector<64xf32>
    %280 = "rocdl.wmma.f32.16x16x128.bf8_fp8"(%arg197, %arg197, %arg205) <{modC = #rocdl<wmma_c_modifier none>, reuseA = false, reuseB = false}> : (vector<4xi32>, vector<4xi32>, vector<64xf32>) -> vector<64xf32>
    %281 = "rocdl.wmma.f32.16x16x128.bf8_bf8"(%arg197, %arg197, %arg205) <{modC = #rocdl<wmma_c_modifier none>, reuseA = false, reuseB = false}> : (vector<4xi32>, vector<4xi32>, vector<64xf32>) -> vector<64xf32>
    %282 = "rocdl.wmma.f16.16x16x128.fp8_fp8"(%arg197, %arg197, %arg207) <{modC = #rocdl<wmma_c_modifier none>, reuseA = false, reuseB = false}> : (vector<4xi32>, vector<4xi32>, vector<64xf16>) -> vector<64xf16>
    %283 = "rocdl.wmma.f16.16x16x128.fp8_bf8"(%arg197, %arg197, %arg207) <{modC = #rocdl<wmma_c_modifier none>, reuseA = false, reuseB = false}> : (vector<4xi32>, vector<4xi32>, vector<64xf16>) -> vector<64xf16>
    %284 = "rocdl.wmma.f16.16x16x128.bf8_fp8"(%arg197, %arg197, %arg207) <{modC = #rocdl<wmma_c_modifier none>, reuseA = false, reuseB = false}> : (vector<4xi32>, vector<4xi32>, vector<64xf16>) -> vector<64xf16>
    %285 = "rocdl.wmma.f16.16x16x128.bf8_bf8"(%arg197, %arg197, %arg207) <{modC = #rocdl<wmma_c_modifier none>, reuseA = false, reuseB = false}> : (vector<4xi32>, vector<4xi32>, vector<64xf16>) -> vector<64xf16>
    %286 = "rocdl.wmma.i32.16x16x64.iu8"(%arg197, %arg197, %arg206) <{clamp = false, reuseA = false, reuseB = false, signA = false, signB = false}> : (vector<4xi32>, vector<4xi32>, vector<64xi32>) -> vector<64xi32>
    %287 = "rocdl.wmma.i32.16x16x64.iu8"(%arg197, %arg197, %arg206) <{clamp = false, reuseA = false, reuseB = false, signA = true, signB = true}> : (vector<4xi32>, vector<4xi32>, vector<64xi32>) -> vector<64xi32>
    %288 = "rocdl.wmma.i32.16x16x64.iu8"(%arg197, %arg197, %arg206) <{clamp = false, reuseA = true, reuseB = true, signA = true, signB = false}> : (vector<4xi32>, vector<4xi32>, vector<64xi32>) -> vector<64xi32>
    %289 = "rocdl.wmma.f32.16x16x4.f32"(%arg202, %arg202, %arg203) <{modC = #rocdl<wmma_c_modifier neg>, reuseA = false, reuseB = false}> : (vector<16xf32>, vector<16xf32>, vector<4xf32>) -> vector<4xf32>
    %290 = "rocdl.wmma.f32.16x16x32.f16"(%arg193, %arg193, %arg204) <{modC = #rocdl<wmma_c_modifier abs>, reuseA = true, reuseB = false}> : (vector<16xf16>, vector<16xf16>, vector<32xf32>) -> vector<32xf32>
    %291 = "rocdl.wmma.f32.16x16x32.bf16"(%arg208, %arg208, %arg204) <{modC = #rocdl<wmma_c_modifier neg_abs>, reuseA = false, reuseB = true}> : (vector<16xbf16>, vector<16xbf16>, vector<32xf32>) -> vector<32xf32>
    %292 = "rocdl.wmma.f32.16x16x16.f16"(%arg193, %arg193, %arg198) : (vector<16xf16>, vector<16xf16>, vector<4xf32>) -> vector<4xf32>
    %293 = "rocdl.wmma.f32.16x16x16.bf16"(%arg194, %arg194, %arg198) : (vector<16xi16>, vector<16xi16>, vector<4xf32>) -> vector<4xf32>
    %294 = "rocdl.wmma.f16.16x16x16.f16"(%arg193, %arg193, %arg199) <{opsel = false}> : (vector<16xf16>, vector<16xf16>, vector<8xf16>) -> vector<8xf16>
    %295 = "rocdl.wmma.bf16.16x16x16.bf16"(%arg194, %arg194, %arg200) <{opsel = false}> : (vector<16xi16>, vector<16xi16>, vector<8xi16>) -> vector<8xi16>
    %296 = "rocdl.wmma.i32.16x16x16.iu8"(%arg197, %arg197, %arg197) <{clamp = true, signA = false, signB = false}> : (vector<4xi32>, vector<4xi32>, vector<4xi32>) -> vector<4xi32>
    %297 = "rocdl.wmma.i32.16x16x16.iu4"(%arg196, %arg196, %arg197) <{clamp = true, signA = false, signB = false}> : (vector<2xi32>, vector<2xi32>, vector<4xi32>) -> vector<4xi32>
    "llvm.return"(%251) : (vector<8xf32>) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<vector<8xf32> (vector<32xf16>, vector<32xbf16>, vector<16xf16>, vector<16xbf16>, vector<16xi32>, vector<16xi16>, vector<8xf32>, vector<8xi32>, vector<8xf16>, vector<8xbf16>, vector<8xi16>, vector<4xf32>, vector<4xf16>, vector<4xi32>, vector<4xi16>, vector<2xi32>, i32, i32)>, linkage = #llvm.linkage<external>, sym_name = "rocdl.swmmac", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg174: vector<32xf16>, %arg175: vector<32xbf16>, %arg176: vector<16xf16>, %arg177: vector<16xbf16>, %arg178: vector<16xi32>, %arg179: vector<16xi16>, %arg180: vector<8xf32>, %arg181: vector<8xi32>, %arg182: vector<8xf16>, %arg183: vector<8xbf16>, %arg184: vector<8xi16>, %arg185: vector<4xf32>, %arg186: vector<4xf16>, %arg187: vector<4xi32>, %arg188: vector<4xi16>, %arg189: vector<2xi32>, %arg190: i32, %arg191: i32):
    %215 = "rocdl.swmmac.f32.16x16x32.f16"(%arg182, %arg176, %arg180, %arg191) : (vector<8xf16>, vector<16xf16>, vector<8xf32>, i32) -> vector<8xf32>
    %216 = "rocdl.swmmac.f32.16x16x32.bf16"(%arg184, %arg179, %arg180, %arg191) : (vector<8xi16>, vector<16xi16>, vector<8xf32>, i32) -> vector<8xf32>
    %217 = "rocdl.swmmac.f16.16x16x32.f16"(%arg182, %arg176, %arg182, %arg191) : (vector<8xf16>, vector<16xf16>, vector<8xf16>, i32) -> vector<8xf16>
    %218 = "rocdl.swmmac.bf16.16x16x32.bf16"(%arg184, %arg179, %arg184, %arg191) : (vector<8xi16>, vector<16xi16>, vector<8xi16>, i32) -> vector<8xi16>
    %219 = "rocdl.swmmac.i32.16x16x32.iu8"(%arg189, %arg187, %arg181, %arg191) <{clamp = false, signA = false, signB = false}> : (vector<2xi32>, vector<4xi32>, vector<8xi32>, i32) -> vector<8xi32>
    %220 = "rocdl.swmmac.i32.16x16x32.iu4"(%arg190, %arg189, %arg181, %arg191) <{clamp = false, signA = false, signB = false}> : (i32, vector<2xi32>, vector<8xi32>, i32) -> vector<8xi32>
    %221 = "rocdl.swmmac.i32.16x16x64.iu4"(%arg189, %arg187, %arg181, %arg191) <{clamp = false, signA = false, signB = false}> : (vector<2xi32>, vector<4xi32>, vector<8xi32>, i32) -> vector<8xi32>
    %222 = "rocdl.swmmac.f32.16x16x32.fp8.fp8"(%arg189, %arg187, %arg180, %arg191) : (vector<2xi32>, vector<4xi32>, vector<8xf32>, i32) -> vector<8xf32>
    %223 = "rocdl.swmmac.f32.16x16x32.fp8.bf8"(%arg189, %arg187, %arg180, %arg191) : (vector<2xi32>, vector<4xi32>, vector<8xf32>, i32) -> vector<8xf32>
    %224 = "rocdl.swmmac.f32.16x16x32.bf8.fp8"(%arg189, %arg187, %arg180, %arg191) : (vector<2xi32>, vector<4xi32>, vector<8xf32>, i32) -> vector<8xf32>
    %225 = "rocdl.swmmac.f32.16x16x32.bf8.bf8"(%arg189, %arg187, %arg180, %arg191) : (vector<2xi32>, vector<4xi32>, vector<8xf32>, i32) -> vector<8xf32>
    %226 = "rocdl.swmmac.f32.16x16x64.f16"(%arg176, %arg174, %arg180, %arg191) <{reuseA = false, reuseB = false, signA = false, signB = false}> : (vector<16xf16>, vector<32xf16>, vector<8xf32>, i32) -> vector<8xf32>
    %227 = "rocdl.swmmac.f32.16x16x64.bf16"(%arg177, %arg175, %arg180, %arg191) <{reuseA = false, reuseB = false, signA = false, signB = false}> : (vector<16xbf16>, vector<32xbf16>, vector<8xf32>, i32) -> vector<8xf32>
    %228 = "rocdl.swmmac.f16.16x16x64.f16"(%arg176, %arg174, %arg182, %arg191) <{reuseA = false, reuseB = false, signA = false, signB = false}> : (vector<16xf16>, vector<32xf16>, vector<8xf16>, i32) -> vector<8xf16>
    %229 = "rocdl.swmmac.bf16.16x16x64.bf16"(%arg177, %arg175, %arg183, %arg191) <{reuseA = false, reuseB = false, signA = false, signB = false}> : (vector<16xbf16>, vector<32xbf16>, vector<8xbf16>, i32) -> vector<8xbf16>
    %230 = "rocdl.swmmac.bf16f32.16x16x64.bf16"(%arg177, %arg175, %arg183, %arg191) <{reuseA = false, reuseB = false, signA = false, signB = false}> : (vector<16xbf16>, vector<32xbf16>, vector<8xbf16>, i32) -> vector<8xbf16>
    %231 = "rocdl.swmmac.f32.16x16x128.fp8.fp8"(%arg181, %arg178, %arg180, %arg191) <{reuseA = false, reuseB = false}> : (vector<8xi32>, vector<16xi32>, vector<8xf32>, i32) -> vector<8xf32>
    %232 = "rocdl.swmmac.f32.16x16x128.fp8.bf8"(%arg181, %arg178, %arg180, %arg191) <{reuseA = false, reuseB = false}> : (vector<8xi32>, vector<16xi32>, vector<8xf32>, i32) -> vector<8xf32>
    %233 = "rocdl.swmmac.f32.16x16x128.bf8.fp8"(%arg181, %arg178, %arg180, %arg191) <{reuseA = false, reuseB = false}> : (vector<8xi32>, vector<16xi32>, vector<8xf32>, i32) -> vector<8xf32>
    %234 = "rocdl.swmmac.f32.16x16x128.bf8.bf8"(%arg181, %arg178, %arg180, %arg191) <{reuseA = false, reuseB = false}> : (vector<8xi32>, vector<16xi32>, vector<8xf32>, i32) -> vector<8xf32>
    %235 = "rocdl.swmmac.f16.16x16x128.fp8.fp8"(%arg181, %arg178, %arg182, %arg191) <{reuseA = false, reuseB = false}> : (vector<8xi32>, vector<16xi32>, vector<8xf16>, i32) -> vector<8xf16>
    %236 = "rocdl.swmmac.f16.16x16x128.fp8.bf8"(%arg181, %arg178, %arg182, %arg191) <{reuseA = false, reuseB = false}> : (vector<8xi32>, vector<16xi32>, vector<8xf16>, i32) -> vector<8xf16>
    %237 = "rocdl.swmmac.f16.16x16x128.bf8.fp8"(%arg181, %arg178, %arg182, %arg191) <{reuseA = false, reuseB = false}> : (vector<8xi32>, vector<16xi32>, vector<8xf16>, i32) -> vector<8xf16>
    %238 = "rocdl.swmmac.f16.16x16x128.bf8.bf8"(%arg181, %arg178, %arg182, %arg191) <{reuseA = false, reuseB = false}> : (vector<8xi32>, vector<16xi32>, vector<8xf16>, i32) -> vector<8xf16>
    %239 = "rocdl.swmmac.i32.16x16x128.iu8"(%arg181, %arg178, %arg181, %arg191) <{clamp = false, reuseA = false, reuseB = false, signA = false, signB = false}> : (vector<8xi32>, vector<16xi32>, vector<8xi32>, i32) -> vector<8xi32>
    %240 = "rocdl.swmmac.f32.16x16x32.f16"(%arg186, %arg182, %arg185, %arg191) : (vector<4xf16>, vector<8xf16>, vector<4xf32>, i32) -> vector<4xf32>
    %241 = "rocdl.swmmac.f32.16x16x32.bf16"(%arg188, %arg184, %arg185, %arg191) : (vector<4xi16>, vector<8xi16>, vector<4xf32>, i32) -> vector<4xf32>
    %242 = "rocdl.swmmac.f16.16x16x32.f16"(%arg186, %arg182, %arg186, %arg191) : (vector<4xf16>, vector<8xf16>, vector<4xf16>, i32) -> vector<4xf16>
    %243 = "rocdl.swmmac.bf16.16x16x32.bf16"(%arg188, %arg184, %arg188, %arg191) : (vector<4xi16>, vector<8xi16>, vector<4xi16>, i32) -> vector<4xi16>
    %244 = "rocdl.swmmac.i32.16x16x32.iu8"(%arg190, %arg189, %arg187, %arg191) <{clamp = false, signA = false, signB = false}> : (i32, vector<2xi32>, vector<4xi32>, i32) -> vector<4xi32>
    %245 = "rocdl.swmmac.i32.16x16x32.iu4"(%arg190, %arg190, %arg187, %arg191) <{clamp = false, signA = false, signB = false}> : (i32, i32, vector<4xi32>, i32) -> vector<4xi32>
    %246 = "rocdl.swmmac.i32.16x16x64.iu4"(%arg190, %arg189, %arg187, %arg191) <{clamp = false, signA = false, signB = false}> : (i32, vector<2xi32>, vector<4xi32>, i32) -> vector<4xi32>
    %247 = "rocdl.swmmac.f32.16x16x32.fp8.fp8"(%arg190, %arg189, %arg185, %arg191) : (i32, vector<2xi32>, vector<4xf32>, i32) -> vector<4xf32>
    %248 = "rocdl.swmmac.f32.16x16x32.fp8.bf8"(%arg190, %arg189, %arg185, %arg191) : (i32, vector<2xi32>, vector<4xf32>, i32) -> vector<4xf32>
    %249 = "rocdl.swmmac.f32.16x16x32.bf8.fp8"(%arg190, %arg189, %arg185, %arg191) : (i32, vector<2xi32>, vector<4xf32>, i32) -> vector<4xf32>
    %250 = "rocdl.swmmac.f32.16x16x32.bf8.bf8"(%arg190, %arg189, %arg185, %arg191) : (i32, vector<2xi32>, vector<4xf32>, i32) -> vector<4xf32>
    "llvm.return"(%215) : (vector<8xf32>) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<vector<4xf16> (ptr<3>)>, linkage = #llvm.linkage<external>, sym_name = "rocdl.ds.read.tr", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg173: !llvm.ptr<3>):
    %210 = "rocdl.ds.read.tr4.b64"(%arg173) : (!llvm.ptr<3>) -> vector<2xi32>
    %211 = "rocdl.ds.read.tr6.b96"(%arg173) : (!llvm.ptr<3>) -> vector<3xi32>
    %212 = "rocdl.ds.read.tr8.b64"(%arg173) : (!llvm.ptr<3>) -> vector<2xi32>
    %213 = "rocdl.ds.read.tr16.b64"(%arg173) : (!llvm.ptr<3>) -> vector<4xf16>
    %214 = "rocdl.ds.read.tr16.b64"(%arg173) : (!llvm.ptr<3>) -> vector<4xbf16>
    "llvm.return"(%213) : (vector<4xf16>) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr<1>, ptr<3>)>, linkage = #llvm.linkage<external>, sym_name = "rocdl.load.tr.ops", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg171: !llvm.ptr<1>, %arg172: !llvm.ptr<3>):
    %198 = "rocdl.global.load.tr4.b64"(%arg171) : (!llvm.ptr<1>) -> vector<2xi32>
    %199 = "rocdl.global.load.tr.b64"(%arg171) : (!llvm.ptr<1>) -> vector<2xi32>
    %200 = "rocdl.global.load.tr6.b96"(%arg171) : (!llvm.ptr<1>) -> vector<3xi32>
    %201 = "rocdl.global.load.tr.b128"(%arg171) : (!llvm.ptr<1>) -> vector<8xi16>
    %202 = "rocdl.global.load.tr.b128"(%arg171) : (!llvm.ptr<1>) -> vector<8xf16>
    %203 = "rocdl.global.load.tr.b128"(%arg171) : (!llvm.ptr<1>) -> vector<8xbf16>
    %204 = "rocdl.ds.load.tr4.b64"(%arg172) : (!llvm.ptr<3>) -> vector<2xi32>
    %205 = "rocdl.ds.load.tr8.b64"(%arg172) : (!llvm.ptr<3>) -> vector<2xi32>
    %206 = "rocdl.ds.load.tr6.b96"(%arg172) : (!llvm.ptr<3>) -> vector<3xi32>
    %207 = "rocdl.ds.load.tr16.b128"(%arg172) : (!llvm.ptr<3>) -> vector<8xi16>
    %208 = "rocdl.ds.load.tr16.b128"(%arg172) : (!llvm.ptr<3>) -> vector<8xf16>
    %209 = "rocdl.ds.load.tr16.b128"(%arg172) : (!llvm.ptr<3>) -> vector<8xbf16>
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr<7>, ptr<3>)>, linkage = #llvm.linkage<external>, sym_name = "rocdl.load.to.lds", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg169: !llvm.ptr<7>, %arg170: !llvm.ptr<3>):
    "rocdl.load.to.lds"(%arg169, %arg170) <{aux = 0 : i32, offset = 0 : i32, size = 4 : i32}> : (!llvm.ptr<7>, !llvm.ptr<3>) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr<7>, ptr<3>)>, linkage = #llvm.linkage<external>, sym_name = "rocdl.load.async.to.lds", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg167: !llvm.ptr<7>, %arg168: !llvm.ptr<3>):
    "rocdl.load.async.to.lds"(%arg167, %arg168) <{aux = 0 : i32, offset = 0 : i32, size = 4 : i32}> : (!llvm.ptr<7>, !llvm.ptr<3>) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr<1>, ptr<3>)>, linkage = #llvm.linkage<external>, sym_name = "rocdl.global.load.lds", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg165: !llvm.ptr<1>, %arg166: !llvm.ptr<3>):
    "rocdl.global.load.lds"(%arg165, %arg166) <{aux = 0 : i32, offset = 0 : i32, size = 4 : i32}> : (!llvm.ptr<1>, !llvm.ptr<3>) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr<1>, ptr<3>)>, linkage = #llvm.linkage<external>, sym_name = "rocdl.global.load.async.lds", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg163: !llvm.ptr<1>, %arg164: !llvm.ptr<3>):
    "rocdl.global.load.async.lds"(%arg163, %arg164) <{aux = 0 : i32, offset = 0 : i32, size = 4 : i32}> : (!llvm.ptr<1>, !llvm.ptr<3>) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr<1>, ptr<3>)>, linkage = #llvm.linkage<external>, sym_name = "rocdl.global.load.async.to.lds", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg161: !llvm.ptr<1>, %arg162: !llvm.ptr<3>):
    "rocdl.global.load.async.to.lds.b8"(%arg161, %arg162) <{aux = 0 : i32, offset = 0 : i32}> : (!llvm.ptr<1>, !llvm.ptr<3>) -> ()
    "rocdl.global.load.async.to.lds.b32"(%arg161, %arg162) <{aux = 0 : i32, offset = 0 : i32}> : (!llvm.ptr<1>, !llvm.ptr<3>) -> ()
    "rocdl.global.load.async.to.lds.b64"(%arg161, %arg162) <{aux = 0 : i32, offset = 0 : i32}> : (!llvm.ptr<1>, !llvm.ptr<3>) -> ()
    "rocdl.global.load.async.to.lds.b128"(%arg161, %arg162) <{aux = 0 : i32, offset = 0 : i32}> : (!llvm.ptr<1>, !llvm.ptr<3>) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr<1>, ptr<3>)>, linkage = #llvm.linkage<external>, sym_name = "rocdl.global.store.async.from.lds", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg159: !llvm.ptr<1>, %arg160: !llvm.ptr<3>):
    "rocdl.global.store.async.from.lds.b8"(%arg159, %arg160) <{aux = 0 : i32, offset = 0 : i32}> : (!llvm.ptr<1>, !llvm.ptr<3>) -> ()
    "rocdl.global.store.async.from.lds.b32"(%arg159, %arg160) <{aux = 0 : i32, offset = 0 : i32}> : (!llvm.ptr<1>, !llvm.ptr<3>) -> ()
    "rocdl.global.store.async.from.lds.b64"(%arg159, %arg160) <{aux = 0 : i32, offset = 0 : i32}> : (!llvm.ptr<1>, !llvm.ptr<3>) -> ()
    "rocdl.global.store.async.from.lds.b128"(%arg159, %arg160) <{aux = 0 : i32, offset = 0 : i32}> : (!llvm.ptr<1>, !llvm.ptr<3>) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr<1>, ptr<3>, i32)>, linkage = #llvm.linkage<external>, sym_name = "rocdl.cluster.load.async.to.lds", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg156: !llvm.ptr<1>, %arg157: !llvm.ptr<3>, %arg158: i32):
    "rocdl.cluster.load.async.to.lds.b8"(%arg156, %arg157, %arg158) <{cpol = 0 : i32, offset = 0 : i32}> : (!llvm.ptr<1>, !llvm.ptr<3>, i32) -> ()
    "rocdl.cluster.load.async.to.lds.b32"(%arg156, %arg157, %arg158) <{cpol = 0 : i32, offset = 0 : i32}> : (!llvm.ptr<1>, !llvm.ptr<3>, i32) -> ()
    "rocdl.cluster.load.async.to.lds.b64"(%arg156, %arg157, %arg158) <{cpol = 0 : i32, offset = 0 : i32}> : (!llvm.ptr<1>, !llvm.ptr<3>, i32) -> ()
    "rocdl.cluster.load.async.to.lds.b128"(%arg156, %arg157, %arg158) <{cpol = 0 : i32, offset = 0 : i32}> : (!llvm.ptr<1>, !llvm.ptr<3>, i32) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (vector<4xi32>, vector<8xi32>, vector<4xi32>, vector<4xi32>, vector<8xi32>)>, linkage = #llvm.linkage<external>, sym_name = "rocdl.tensor.load.to.lds", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg151: vector<4xi32>, %arg152: vector<8xi32>, %arg153: vector<4xi32>, %arg154: vector<4xi32>, %arg155: vector<8xi32>):
    "rocdl.tensor.load.to.lds"(%arg151, %arg152, %arg153, %arg154, %arg155) <{cachePolicy = 0 : i32}> : (vector<4xi32>, vector<8xi32>, vector<4xi32>, vector<4xi32>, vector<8xi32>) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (vector<4xi32>, vector<8xi32>, vector<4xi32>, vector<4xi32>, vector<8xi32>)>, linkage = #llvm.linkage<external>, sym_name = "rocdl.tensor.store.from.lds", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg146: vector<4xi32>, %arg147: vector<8xi32>, %arg148: vector<4xi32>, %arg149: vector<4xi32>, %arg150: vector<8xi32>):
    "rocdl.tensor.store.from.lds"(%arg146, %arg147, %arg148, %arg149, %arg150) <{cachePolicy = 0 : i32}> : (vector<4xi32>, vector<8xi32>, vector<4xi32>, vector<4xi32>, vector<8xi32>) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<ptr<8> (ptr, i16, i64, i32)>, linkage = #llvm.linkage<external>, sym_name = "rocdl.make.buffer.rsrc", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg142: !llvm.ptr, %arg143: i16, %arg144: i64, %arg145: i32):
    %197 = "rocdl.make.buffer.rsrc"(%arg142, %arg143, %arg144, %arg145) : (!llvm.ptr, i16, i64, i32) -> !llvm.ptr<8>
    "llvm.return"(%197) : (!llvm.ptr<8>) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<ptr<7> (ptr<1>, i16, i64, i32)>, linkage = #llvm.linkage<external>, sym_name = "rocdl.make.buffer.rsrc.p7.p1", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg138: !llvm.ptr<1>, %arg139: i16, %arg140: i64, %arg141: i32):
    %196 = "rocdl.make.buffer.rsrc"(%arg138, %arg139, %arg140, %arg141) : (!llvm.ptr<1>, i16, i64, i32) -> !llvm.ptr<7>
    "llvm.return"(%196) : (!llvm.ptr<7>) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<f32 (f32, i32, vector<2xf32>, vector<2xi32>)>, linkage = #llvm.linkage<external>, sym_name = "rocdl.permlanex16", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg134: f32, %arg135: i32, %arg136: vector<2xf32>, %arg137: vector<2xi32>):
    %191 = "llvm.mlir.constant"() <{value = -1 : i32}> : () -> i32
    %192 = "rocdl.permlanex16"(%arg134, %arg134, %191, %191) <{boundControl = true, fi = false}> : (f32, f32, i32, i32) -> f32
    %193 = "rocdl.permlanex16"(%arg135, %arg135, %191, %191) <{boundControl = true, fi = false}> : (i32, i32, i32, i32) -> i32
    %194 = "rocdl.permlanex16"(%arg136, %arg136, %191, %191) <{boundControl = true, fi = false}> : (vector<2xf32>, vector<2xf32>, i32, i32) -> vector<2xf32>
    %195 = "rocdl.permlanex16"(%arg137, %arg137, %191, %191) <{boundControl = true, fi = false}> : (vector<2xi32>, vector<2xi32>, i32, i32) -> vector<2xi32>
    "llvm.return"(%192) : (f32) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<struct<(i32, i32)> (i32)>, linkage = #llvm.linkage<external>, sym_name = "rocdl.permlane16.swap", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg133: i32):
    %190 = "rocdl.permlane16.swap"(%arg133, %arg133) <{boundControl = true, fi = false}> : (i32, i32) -> !llvm.struct<(i32, i32)>
    "llvm.return"(%190) : (!llvm.struct<(i32, i32)>) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<struct<(i32, i32)> (i32)>, linkage = #llvm.linkage<external>, sym_name = "rocdl.permlane32.swap", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg132: i32):
    %189 = "rocdl.permlane32.swap"(%arg132, %arg132) <{boundControl = true, fi = false}> : (i32, i32) -> !llvm.struct<(i32, i32)>
    "llvm.return"(%189) : (!llvm.struct<(i32, i32)>) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<i32 (i32)>, linkage = #llvm.linkage<external>, sym_name = "rocdl.permlane16.var", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg131: i32):
    %187 = "llvm.mlir.constant"() <{value = -1 : i32}> : () -> i32
    %188 = "rocdl.permlane16.var"(%arg131, %arg131, %187) <{boundControl = true, fi = false}> : (i32, i32, i32) -> i32
    "llvm.return"(%188) : (i32) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<i32 (i32)>, linkage = #llvm.linkage<external>, sym_name = "rocdl.permlanex16.var", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg130: i32):
    %185 = "llvm.mlir.constant"() <{value = -1 : i32}> : () -> i32
    %186 = "rocdl.permlanex16.var"(%arg130, %arg130, %185) <{boundControl = true, fi = false}> : (i32, i32, i32) -> i32
    "llvm.return"(%186) : (i32) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<vector<8xf32> (vector<2xi32>, vector<8xf32>)>, linkage = #llvm.linkage<external>, sym_name = "rocdl.wmma.fp8", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg128: vector<2xi32>, %arg129: vector<8xf32>):
    %181 = "rocdl.wmma.f32.16x16x16.fp8_fp8"(%arg128, %arg128, %arg129) : (vector<2xi32>, vector<2xi32>, vector<8xf32>) -> vector<8xf32>
    %182 = "rocdl.wmma.f32.16x16x16.fp8_bf8"(%arg128, %arg128, %arg129) : (vector<2xi32>, vector<2xi32>, vector<8xf32>) -> vector<8xf32>
    %183 = "rocdl.wmma.f32.16x16x16.bf8_bf8"(%arg128, %arg128, %arg129) : (vector<2xi32>, vector<2xi32>, vector<8xf32>) -> vector<8xf32>
    %184 = "rocdl.wmma.f32.16x16x16.bf8_fp8"(%arg128, %arg128, %arg129) : (vector<2xi32>, vector<2xi32>, vector<8xf32>) -> vector<8xf32>
    "llvm.return"(%181) : (vector<8xf32>) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr<8>, i32, i32, i32, vector<2xi32>, vector<4xi32>)>, linkage = #llvm.linkage<external>, sym_name = "rocdl.raw.ptr.buffer", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg122: !llvm.ptr<8>, %arg123: i32, %arg124: i32, %arg125: i32, %arg126: vector<2xi32>, %arg127: vector<4xi32>):
    %177 = "llvm.mlir.constant"() <{value = 0 : i32}> : () -> i32
    %178 = "rocdl.raw.ptr.buffer.load"(%arg122, %arg123, %arg124) <{aux = 0 : i32}> : (!llvm.ptr<8>, i32, i32) -> i32
    %179 = "rocdl.raw.ptr.buffer.load"(%arg122, %arg123, %arg124) <{aux = 0 : i32}> : (!llvm.ptr<8>, i32, i32) -> vector<2xi32>
    %180 = "rocdl.raw.ptr.buffer.load"(%arg122, %arg123, %arg124) <{aux = 0 : i32}> : (!llvm.ptr<8>, i32, i32) -> vector<4xi32>
    "rocdl.raw.ptr.buffer.store"(%arg125, %arg122, %arg123, %arg124) <{aux = 0 : i32}> : (i32, !llvm.ptr<8>, i32, i32) -> ()
    "rocdl.raw.ptr.buffer.store"(%arg126, %arg122, %arg123, %arg124) <{aux = 0 : i32}> : (vector<2xi32>, !llvm.ptr<8>, i32, i32) -> ()
    "rocdl.raw.ptr.buffer.store"(%arg127, %arg122, %arg123, %arg124) <{aux = 0 : i32}> : (vector<4xi32>, !llvm.ptr<8>, i32, i32) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr<8>, ptr<3>, i32, i32)>, linkage = #llvm.linkage<external>, sym_name = "rocdl.raw.ptr.buffer.load.lds", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg118: !llvm.ptr<8>, %arg119: !llvm.ptr<3>, %arg120: i32, %arg121: i32):
    %175 = "llvm.mlir.constant"() <{value = 4 : i32}> : () -> i32
    %176 = "llvm.mlir.constant"() <{value = 128 : i32}> : () -> i32
    "rocdl.raw.ptr.buffer.load.lds"(%arg118, %arg119, %175, %arg120, %arg121, %176) <{aux = #rocdl<pre_gfx12_cache_policy glc>}> : (!llvm.ptr<8>, !llvm.ptr<3>, i32, i32, i32, i32) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr<8>, ptr<3>, i32, i32)>, linkage = #llvm.linkage<external>, sym_name = "rocdl.raw.ptr.buffer.load.async.lds", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg114: !llvm.ptr<8>, %arg115: !llvm.ptr<3>, %arg116: i32, %arg117: i32):
    %173 = "llvm.mlir.constant"() <{value = 4 : i32}> : () -> i32
    %174 = "llvm.mlir.constant"() <{value = 128 : i32}> : () -> i32
    "rocdl.raw.ptr.buffer.load.async.lds"(%arg114, %arg115, %173, %arg116, %arg117, %174) <{aux = #rocdl<pre_gfx12_cache_policy glc>}> : (!llvm.ptr<8>, !llvm.ptr<3>, i32, i32, i32, i32) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr<1>)>, linkage = #llvm.linkage<external>, sym_name = "rocdl.global.prefetch", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg113: !llvm.ptr<1>):
    "rocdl.global.prefetch"(%arg113) <{cachePolicy = 0 : i32}> : (!llvm.ptr<1>) -> ()
    "rocdl.global.prefetch"(%arg113) <{cachePolicy = #rocdl<gfx12_cache_policy nt_rt|scope_se>}> : (!llvm.ptr<1>) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr)>, linkage = #llvm.linkage<external>, sym_name = "rocdl.flat.prefetch", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg112: !llvm.ptr):
    "rocdl.flat.prefetch"(%arg112) <{cachePolicy = 0 : i32}> : (!llvm.ptr) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr<3>, i64)>, linkage = #llvm.linkage<external>, sym_name = "rocdl.atomic.barriers.arrive", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg110: !llvm.ptr<3>, %arg111: i64):
    "rocdl.ds.atomic.async.barrier.arrive.b64"(%arg110) : (!llvm.ptr<3>) -> ()
    %172 = "rocdl.ds.atomic.barrier.arrive.rtn.b64"(%arg110, %arg111) : (!llvm.ptr<3>, i64) -> i64
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<vector<4xf32> (i32, vector<4xf32>, vector<8xi32>, vector<12xi32>, vector<16xi32>, i64, vector<8xf32>)>, linkage = #llvm.linkage<external>, sym_name = "rocdl.wmma.scale", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg103: i32, %arg104: vector<4xf32>, %arg105: vector<8xi32>, %arg106: vector<12xi32>, %arg107: vector<16xi32>, %arg108: i64, %arg109: vector<8xf32>):
    %161 = "rocdl.wmma.scale.f32.16x16x128.f8f6f4"(%arg107, %arg107, %arg104, %arg103, %arg103) <{fmtA = #rocdl<matrix_format fp8_e4m3>, fmtB = #rocdl<matrix_format fp8_e4m3>, fmtScaleA = #rocdl<wmma_matrix_scale_format e8>, fmtScaleB = #rocdl<wmma_matrix_scale_format e8>, modC = #rocdl<wmma_c_modifier none>, reuseA = false, reuseB = false, scaleAType = #rocdl<wmma_matrix_scale row0>, scaleBType = #rocdl<wmma_matrix_scale row0>}> : (vector<16xi32>, vector<16xi32>, vector<4xf32>, i32, i32) -> vector<4xf32>
    %162 = "rocdl.wmma.scale.f32.16x16x128.f8f6f4"(%arg107, %arg107, %arg104, %arg103, %arg103) <{fmtA = #rocdl<matrix_format fp8_e4m3>, fmtB = #rocdl<matrix_format fp8_e5m2>, fmtScaleA = #rocdl<wmma_matrix_scale_format e5m3>, fmtScaleB = #rocdl<wmma_matrix_scale_format e5m3>, modC = #rocdl<wmma_c_modifier none>, reuseA = false, reuseB = false, scaleAType = #rocdl<wmma_matrix_scale row1>, scaleBType = #rocdl<wmma_matrix_scale row1>}> : (vector<16xi32>, vector<16xi32>, vector<4xf32>, i32, i32) -> vector<4xf32>
    %163 = "rocdl.wmma.scale.f32.16x16x128.f8f6f4"(%arg107, %arg106, %arg104, %arg103, %arg103) <{fmtA = #rocdl<matrix_format fp8_e4m3>, fmtB = #rocdl<matrix_format fp6_e2m3>, fmtScaleA = #rocdl<wmma_matrix_scale_format e4m3>, fmtScaleB = #rocdl<wmma_matrix_scale_format e4m3>, modC = #rocdl<wmma_c_modifier neg>, reuseA = false, reuseB = false, scaleAType = #rocdl<wmma_matrix_scale row1>, scaleBType = #rocdl<wmma_matrix_scale row1>}> : (vector<16xi32>, vector<12xi32>, vector<4xf32>, i32, i32) -> vector<4xf32>
    %164 = "rocdl.wmma.scale.f32.16x16x128.f8f6f4"(%arg107, %arg106, %arg104, %arg103, %arg103) <{fmtA = #rocdl<matrix_format fp8_e5m2>, fmtB = #rocdl<matrix_format fp6_e3m2>, fmtScaleA = #rocdl<wmma_matrix_scale_format e8>, fmtScaleB = #rocdl<wmma_matrix_scale_format e8>, modC = #rocdl<wmma_c_modifier abs>, reuseA = false, reuseB = false, scaleAType = #rocdl<wmma_matrix_scale row0>, scaleBType = #rocdl<wmma_matrix_scale row0>}> : (vector<16xi32>, vector<12xi32>, vector<4xf32>, i32, i32) -> vector<4xf32>
    %165 = "rocdl.wmma.scale.f32.16x16x128.f8f6f4"(%arg107, %arg105, %arg104, %arg103, %arg103) <{fmtA = #rocdl<matrix_format fp8_e4m3>, fmtB = #rocdl<matrix_format fp4_e2m1>, fmtScaleA = #rocdl<wmma_matrix_scale_format e4m3>, fmtScaleB = #rocdl<wmma_matrix_scale_format e4m3>, modC = #rocdl<wmma_c_modifier neg_abs>, reuseA = false, reuseB = false, scaleAType = #rocdl<wmma_matrix_scale row1>, scaleBType = #rocdl<wmma_matrix_scale row1>}> : (vector<16xi32>, vector<8xi32>, vector<4xf32>, i32, i32) -> vector<4xf32>
    %166 = "rocdl.wmma.scale.f32.16x16x128.f8f6f4"(%arg107, %arg107, %arg104, %arg103, %arg103) <{fmtA = #rocdl<matrix_format fp6_e2m3>, fmtB = #rocdl<matrix_format fp6_e2m3>, fmtScaleA = #rocdl<wmma_matrix_scale_format e8>, fmtScaleB = #rocdl<wmma_matrix_scale_format e8>, modC = #rocdl<wmma_c_modifier none>, reuseA = true, reuseB = false, scaleAType = #rocdl<wmma_matrix_scale row0>, scaleBType = #rocdl<wmma_matrix_scale row0>}> : (vector<16xi32>, vector<16xi32>, vector<4xf32>, i32, i32) -> vector<4xf32>
    %167 = "rocdl.wmma.scale.f32.16x16x128.f8f6f4"(%arg107, %arg107, %arg104, %arg103, %arg103) <{fmtA = #rocdl<matrix_format fp6_e3m2>, fmtB = #rocdl<matrix_format fp6_e3m2>, fmtScaleA = #rocdl<wmma_matrix_scale_format e8>, fmtScaleB = #rocdl<wmma_matrix_scale_format e8>, modC = #rocdl<wmma_c_modifier none>, reuseA = false, reuseB = true, scaleAType = #rocdl<wmma_matrix_scale row0>, scaleBType = #rocdl<wmma_matrix_scale row0>}> : (vector<16xi32>, vector<16xi32>, vector<4xf32>, i32, i32) -> vector<4xf32>
    %168 = "rocdl.wmma.scale.f32.16x16x128.f8f6f4"(%arg107, %arg107, %arg104, %arg103, %arg103) <{fmtA = #rocdl<matrix_format fp4_e2m1>, fmtB = #rocdl<matrix_format fp4_e2m1>, fmtScaleA = #rocdl<wmma_matrix_scale_format e5m3>, fmtScaleB = #rocdl<wmma_matrix_scale_format e5m3>, modC = #rocdl<wmma_c_modifier neg>, reuseA = true, reuseB = true, scaleAType = #rocdl<wmma_matrix_scale row1>, scaleBType = #rocdl<wmma_matrix_scale row1>}> : (vector<16xi32>, vector<16xi32>, vector<4xf32>, i32, i32) -> vector<4xf32>
    %169 = "rocdl.wmma.scale16.f32.16x16x128.f8f6f4"(%arg107, %arg107, %arg104, %arg108, %arg108) <{fmtA = #rocdl<matrix_format fp8_e4m3>, fmtB = #rocdl<matrix_format fp8_e5m2>, fmtScaleA = #rocdl<wmma_matrix_scale_format e4m3>, fmtScaleB = #rocdl<wmma_matrix_scale_format e4m3>, modC = #rocdl<wmma_c_modifier abs>, reuseA = false, reuseB = false, scaleAType = #rocdl<wmma_matrix_scale row1>, scaleBType = #rocdl<wmma_matrix_scale row1>}> : (vector<16xi32>, vector<16xi32>, vector<4xf32>, i64, i64) -> vector<4xf32>
    %170 = "rocdl.wmma.scale.f32.32x16x128.f4"(%arg107, %arg105, %arg109, %arg103, %arg103) <{fmtScaleA = #rocdl<wmma_matrix_scale_format e5m3>, fmtScaleB = #rocdl<wmma_matrix_scale_format e5m3>, modC = #rocdl<wmma_c_modifier none>, reuseA = false, reuseB = false, scaleAType = #rocdl<wmma_matrix_scale row1>, scaleBType = #rocdl<wmma_matrix_scale row1>}> : (vector<16xi32>, vector<8xi32>, vector<8xf32>, i32, i32) -> vector<8xf32>
    %171 = "rocdl.wmma.scale16.f32.32x16x128.f4"(%arg107, %arg105, %arg109, %arg108, %arg108) <{fmtScaleA = #rocdl<wmma_matrix_scale_format e4m3>, fmtScaleB = #rocdl<wmma_matrix_scale_format e4m3>, modC = #rocdl<wmma_c_modifier neg_abs>, reuseA = true, reuseB = true, scaleAType = #rocdl<wmma_matrix_scale row0>, scaleBType = #rocdl<wmma_matrix_scale row1>}> : (vector<16xi32>, vector<8xi32>, vector<8xf32>, i64, i64) -> vector<8xf32>
    "llvm.return"(%161) : (vector<4xf32>) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<f32 (ptr<8>, i32, i32, f32)>, linkage = #llvm.linkage<external>, sym_name = "rocdl.raw.ptr.buffer.atomic.f32", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg99: !llvm.ptr<8>, %arg100: i32, %arg101: i32, %arg102: f32):
    %158 = "llvm.mlir.constant"() <{value = 0 : i32}> : () -> i32
    %159 = "rocdl.raw.ptr.buffer.atomic.fadd"(%arg102, %arg99, %arg100, %arg101) <{aux = 0 : i32}> : (f32, !llvm.ptr<8>, i32, i32) -> f32
    %160 = "rocdl.raw.ptr.buffer.atomic.fmax"(%arg102, %arg99, %arg100, %arg101) <{aux = 0 : i32}> : (f32, !llvm.ptr<8>, i32, i32) -> f32
    "llvm.return"(%160) : (f32) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<i32 (ptr<8>, i32, i32, i32)>, linkage = #llvm.linkage<external>, sym_name = "rocdl.raw.ptr.buffer.atomic.i32", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg95: !llvm.ptr<8>, %arg96: i32, %arg97: i32, %arg98: i32):
    %155 = "llvm.mlir.constant"() <{value = 0 : i32}> : () -> i32
    %156 = "rocdl.raw.ptr.buffer.atomic.smax"(%arg98, %arg95, %arg96, %arg97) <{aux = 0 : i32}> : (i32, !llvm.ptr<8>, i32, i32) -> i32
    %157 = "rocdl.raw.ptr.buffer.atomic.umin"(%arg98, %arg95, %arg96, %arg97) <{aux = 0 : i32}> : (i32, !llvm.ptr<8>, i32, i32) -> i32
    "llvm.return"(%157) : (i32) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<i32 (ptr<8>, i32, i32, i32, i32)>, linkage = #llvm.linkage<external>, sym_name = "rocdl.raw.ptr.buffer.atomic.cmpswap", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg90: !llvm.ptr<8>, %arg91: i32, %arg92: i32, %arg93: i32, %arg94: i32):
    %153 = "llvm.mlir.constant"() <{value = 0 : i32}> : () -> i32
    %154 = "rocdl.raw.ptr.buffer.atomic.cmpswap"(%arg93, %arg94, %arg90, %arg91, %arg92) <{aux = 0 : i32}> : (i32, i32, !llvm.ptr<8>, i32, i32) -> i32
    "llvm.return"(%154) : (i32) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (vector<4xi32>, i32, i32, i32, vector<2xi32>, vector<4xi32>)>, linkage = #llvm.linkage<external>, sym_name = "rocdl.raw.buffer", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg84: vector<4xi32>, %arg85: i32, %arg86: i32, %arg87: i32, %arg88: vector<2xi32>, %arg89: vector<4xi32>):
    %148 = "llvm.mlir.constant"() <{value = 0 : i32}> : () -> i32
    %149 = "rocdl.raw.buffer.load"(%arg84, %arg85, %arg86) <{aux = 0 : i32}> : (vector<4xi32>, i32, i32) -> i32
    %150 = "rocdl.raw.buffer.load"(%arg84, %arg85, %arg86) <{aux = 0 : i32}> : (vector<4xi32>, i32, i32) -> vector<2xi32>
    %151 = "rocdl.raw.buffer.load"(%arg84, %arg85, %arg86) <{aux = 0 : i32}> : (vector<4xi32>, i32, i32) -> vector<4xi32>
    %152 = "rocdl.raw.buffer.load"(%arg84, %arg85, %arg86) <{aux = #rocdl<gfx942_cache_policy sc0|nt>}> : (vector<4xi32>, i32, i32) -> i32
    "rocdl.raw.buffer.store"(%arg87, %arg84, %arg85, %arg86) <{aux = 0 : i32}> : (i32, vector<4xi32>, i32, i32) -> ()
    "rocdl.raw.buffer.store"(%arg88, %arg84, %arg85, %arg86) <{aux = 0 : i32}> : (vector<2xi32>, vector<4xi32>, i32, i32) -> ()
    "rocdl.raw.buffer.store"(%arg89, %arg84, %arg85, %arg86) <{aux = 0 : i32}> : (vector<4xi32>, vector<4xi32>, i32, i32) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<f32 (vector<4xi32>, i32, i32, f32)>, linkage = #llvm.linkage<external>, sym_name = "rocdl.raw.buffer.atomic.f32", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg80: vector<4xi32>, %arg81: i32, %arg82: i32, %arg83: f32):
    %145 = "llvm.mlir.constant"() <{value = 0 : i32}> : () -> i32
    %146 = "rocdl.raw.buffer.atomic.fadd"(%arg83, %arg80, %arg81, %arg82) <{aux = 0 : i32}> : (f32, vector<4xi32>, i32, i32) -> f32
    %147 = "rocdl.raw.buffer.atomic.fmax"(%arg83, %arg80, %arg81, %arg82) <{aux = 0 : i32}> : (f32, vector<4xi32>, i32, i32) -> f32
    "llvm.return"(%147) : (f32) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<i32 (vector<4xi32>, i32, i32, i32)>, linkage = #llvm.linkage<external>, sym_name = "rocdl.raw.buffer.atomic.i32", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg76: vector<4xi32>, %arg77: i32, %arg78: i32, %arg79: i32):
    %142 = "llvm.mlir.constant"() <{value = 0 : i32}> : () -> i32
    %143 = "rocdl.raw.buffer.atomic.smax"(%arg79, %arg76, %arg77, %arg78) <{aux = 0 : i32}> : (i32, vector<4xi32>, i32, i32) -> i32
    %144 = "rocdl.raw.buffer.atomic.umin"(%arg79, %arg76, %arg77, %arg78) <{aux = 0 : i32}> : (i32, vector<4xi32>, i32, i32) -> i32
    "llvm.return"(%144) : (i32) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<i32 (vector<4xi32>, i32, i32, i32, i32)>, linkage = #llvm.linkage<external>, sym_name = "rocdl.raw.buffer.atomic.cmpswap", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg71: vector<4xi32>, %arg72: i32, %arg73: i32, %arg74: i32, %arg75: i32):
    %140 = "llvm.mlir.constant"() <{value = 0 : i32}> : () -> i32
    %141 = "rocdl.raw.buffer.atomic.cmpswap"(%arg74, %arg75, %arg71, %arg72, %arg73) <{aux = 0 : i32}> : (i32, i32, vector<4xi32>, i32, i32) -> i32
    "llvm.return"(%141) : (i32) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<i32 (i32, f16, bf16, vector<2xf16>, i32)>, linkage = #llvm.linkage<external>, sym_name = "rocdl_8bit_floats", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg66: i32, %arg67: f16, %arg68: bf16, %arg69: vector<2xf16>, %arg70: i32):
    %115 = "llvm.mlir.constant"() <{value = 1.000000e+00 : f32}> : () -> f32
    %116 = "llvm.mlir.constant"() <{value = false}> : () -> i1
    %117 = "rocdl.cvt.f32.bf8"(%arg66) <{byteSel = 0 : i32}> : (i32) -> f32
    %118 = "rocdl.cvt.scalef32.f32.bf8"(%arg66, %115) <{srcSelIndex = 0 : i32}> : (i32, f32) -> f32
    %119 = "rocdl.cvt.f32.fp8"(%arg66) <{byteSel = 0 : i32}> : (i32) -> f32
    %120 = "rocdl.cvt.scalef32.f32.fp8"(%arg66, %115) <{srcSelIndex = 0 : i32}> : (i32, f32) -> f32
    %121 = "rocdl.cvt.scalef32.pk.f16.bf8"(%arg66, %115) <{srcLoHiSel = false}> : (i32, f32) -> vector<2xf16>
    %122 = "rocdl.cvt.scalef32.pk.f16.fp8"(%arg66, %115) <{srcLoHiSel = false}> : (i32, f32) -> vector<2xf16>
    %123 = "rocdl.cvt.scalef32.f16.fp8"(%arg69, %arg66, %115) <{dstLoHiSel = false, srcSelIndex = 0 : i32}> : (vector<2xf16>, i32, f32) -> vector<2xf16>
    %124 = "rocdl.cvt.scalef32.f16.bf8"(%arg69, %arg66, %115) <{dstLoHiSel = false, srcSelIndex = 0 : i32}> : (vector<2xf16>, i32, f32) -> vector<2xf16>
    %125 = "rocdl.cvt.scalef32.pk.bf16.bf8"(%arg66, %115) <{srcLoHiSel = false}> : (i32, f32) -> vector<2xbf16>
    %126 = "rocdl.cvt.scalef32.pk.bf16.fp8"(%arg66, %115) <{srcLoHiSel = false}> : (i32, f32) -> vector<2xbf16>
    %127 = "rocdl.cvt.pk.bf8.f32"(%117, %119, %arg66) <{wordSel = false}> : (f32, f32, i32) -> i32
    %128 = "rocdl.cvt.pk.fp8.f32"(%117, %119, %127) <{wordSel = false}> : (f32, f32, i32) -> i32
    %129 = "rocdl.cvt.sr.bf8.f32"(%117, %arg70, %128) <{byteSel = 2 : i32}> : (f32, i32, i32) -> i32
    %130 = "rocdl.cvt.sr.fp8.f32"(%119, %arg70, %129) <{byteSel = 3 : i32}> : (f32, i32, i32) -> i32
    %131 = "rocdl.cvt.scalef32.sr.fp8.f32"(%129, %119, %arg70, %115) <{dstSelIndex = 3 : i32}> : (i32, f32, i32, f32) -> i32
    %132 = "rocdl.cvt.scalef32.sr.fp8.f16"(%129, %arg67, %arg70, %115) <{dstSelIndex = 3 : i32}> : (i32, f16, i32, f32) -> i32
    %133 = "rocdl.cvt.scalef32.sr.fp8.bf16"(%129, %arg68, %arg70, %115) <{dstSelIndex = 3 : i32}> : (i32, bf16, i32, f32) -> i32
    %134 = "rocdl.cvt.sr.bf8.f32"(%117, %arg70, %128) <{byteSel = 3 : i32}> : (f32, i32, i32) -> i32
    %135 = "rocdl.cvt.scalef32.sr.bf8.f32"(%128, %119, %arg70, %115) <{dstSelIndex = 3 : i32}> : (i32, f32, i32, f32) -> i32
    %136 = "rocdl.cvt.scalef32.sr.bf8.f16"(%128, %arg67, %arg70, %115) <{dstSelIndex = 3 : i32}> : (i32, f16, i32, f32) -> i32
    %137 = "rocdl.cvt.scalef32.sr.bf8.bf16"(%128, %arg68, %arg70, %115) <{dstSelIndex = 3 : i32}> : (i32, bf16, i32, f32) -> i32
    %138 = "rocdl.cvt.scalef32.pk.f32.fp8"(%arg66, %115) <{srcLoHiSel = false}> : (i32, f32) -> vector<2xf32>
    %139 = "rocdl.cvt.scalef32.pk.f32.bf8"(%arg66, %115) <{srcLoHiSel = false}> : (i32, f32) -> vector<2xf32>
    "llvm.return"(%130) : (i32) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<vector<2xi16> (f32, f32, vector<2xi16>)>, linkage = #llvm.linkage<external>, sym_name = "rocdl_8bit_packed_v2i16", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg63: f32, %arg64: f32, %arg65: vector<2xi16>):
    %112 = "llvm.mlir.constant"() <{value = 1.000000e+00 : f32}> : () -> f32
    %113 = "rocdl.cvt.scalef32.pk.fp8.f32"(%arg65, %arg63, %arg64, %112) <{dstLoHiSel = false}> : (vector<2xi16>, f32, f32, f32) -> vector<2xi16>
    %114 = "rocdl.cvt.scalef32.pk.bf8.f32"(%arg65, %arg63, %arg64, %112) <{dstLoHiSel = false}> : (vector<2xi16>, f32, f32, f32) -> vector<2xi16>
    "llvm.return"(%113) : (vector<2xi16>) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<vector<2xi16> (vector<2xf16>, vector<2xbf16>, vector<2xi16>)>, linkage = #llvm.linkage<external>, sym_name = "rocdl_v2f16_v2i16", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg60: vector<2xf16>, %arg61: vector<2xbf16>, %arg62: vector<2xi16>):
    %107 = "llvm.mlir.constant"() <{value = 1.000000e+00 : f32}> : () -> f32
    %108 = "rocdl.cvt.scalef32.pk.fp8.f16"(%arg62, %arg60, %107) <{dstLoHiSel = false}> : (vector<2xi16>, vector<2xf16>, f32) -> vector<2xi16>
    %109 = "rocdl.cvt.scalef32.pk.fp8.bf16"(%arg62, %arg61, %107) <{dstLoHiSel = false}> : (vector<2xi16>, vector<2xbf16>, f32) -> vector<2xi16>
    %110 = "rocdl.cvt.scalef32.pk.bf8.f16"(%arg62, %arg60, %107) <{dstLoHiSel = false}> : (vector<2xi16>, vector<2xf16>, f32) -> vector<2xi16>
    %111 = "rocdl.cvt.scalef32.pk.bf8.bf16"(%arg62, %arg61, %107) <{dstLoHiSel = false}> : (vector<2xi16>, vector<2xbf16>, f32) -> vector<2xi16>
    "llvm.return"(%108) : (vector<2xi16>) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<vector<2xf16> (f32, f32)>, linkage = #llvm.linkage<external>, sym_name = "rocdl_16bit_packed_floats", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg58: f32, %arg59: f32):
    %106 = "rocdl.cvt.pkrtz"(%arg58, %arg59) : (f32, f32) -> vector<2xf16>
    "llvm.return"(%106) : (vector<2xf16>) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (vector<6xi32>, vector<16xf32>, vector<32xf32>, vector<32xf16>, vector<32xbf16>, i32, f32)>, linkage = #llvm.linkage<external>, sym_name = "rocdl_6_bit_floats", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg51: vector<6xi32>, %arg52: vector<16xf32>, %arg53: vector<32xf32>, %arg54: vector<32xf16>, %arg55: vector<32xbf16>, %arg56: i32, %arg57: f32):
    %88 = "rocdl.cvt.scalef32.2xpk16.bf6.f32"(%arg52, %arg52, %arg57) : (vector<16xf32>, vector<16xf32>, f32) -> vector<6xi32>
    %89 = "rocdl.cvt.scalef32.2xpk16.fp6.f32"(%arg52, %arg52, %arg57) : (vector<16xf32>, vector<16xf32>, f32) -> vector<6xi32>
    %90 = "rocdl.cvt.scalef32.pk32.bf6.f16"(%arg54, %arg57) : (vector<32xf16>, f32) -> vector<6xi32>
    %91 = "rocdl.cvt.scalef32.pk32.fp6.f16"(%arg54, %arg57) : (vector<32xf16>, f32) -> vector<6xi32>
    %92 = "rocdl.cvt.scalef32.pk32.bf6.bf16"(%arg55, %arg57) : (vector<32xbf16>, f32) -> vector<6xi32>
    %93 = "rocdl.cvt.scalef32.pk32.fp6.bf16"(%arg55, %arg57) : (vector<32xbf16>, f32) -> vector<6xi32>
    %94 = "rocdl.cvt.scalef32.pk32.f32.bf6"(%arg51, %arg57) : (vector<6xi32>, f32) -> vector<32xf32>
    %95 = "rocdl.cvt.scalef32.pk32.f32.fp6"(%arg51, %arg57) : (vector<6xi32>, f32) -> vector<32xf32>
    %96 = "rocdl.cvt.scalef32.pk32.f16.bf6"(%arg51, %arg57) : (vector<6xi32>, f32) -> vector<32xf16>
    %97 = "rocdl.cvt.scalef32.pk32.f16.fp6"(%arg51, %arg57) : (vector<6xi32>, f32) -> vector<32xf16>
    %98 = "rocdl.cvt.scalef32.pk32.bf16.bf6"(%arg51, %arg57) : (vector<6xi32>, f32) -> vector<32xbf16>
    %99 = "rocdl.cvt.scalef32.pk32.bf16.fp6"(%arg51, %arg57) : (vector<6xi32>, f32) -> vector<32xbf16>
    %100 = "rocdl.cvt.scalef32.sr.pk32.bf6.f32"(%arg53, %arg56, %arg57) : (vector<32xf32>, i32, f32) -> vector<6xi32>
    %101 = "rocdl.cvt.scalef32.sr.pk32.fp6.f32"(%arg53, %arg56, %arg57) : (vector<32xf32>, i32, f32) -> vector<6xi32>
    %102 = "rocdl.cvt.scalef32.sr.pk32.bf6.f16"(%arg54, %arg56, %arg57) : (vector<32xf16>, i32, f32) -> vector<6xi32>
    %103 = "rocdl.cvt.scalef32.sr.pk32.fp6.f16"(%arg54, %arg56, %arg57) : (vector<32xf16>, i32, f32) -> vector<6xi32>
    %104 = "rocdl.cvt.scalef32.sr.pk32.bf6.bf16"(%arg55, %arg56, %arg57) : (vector<32xbf16>, i32, f32) -> vector<6xi32>
    %105 = "rocdl.cvt.scalef32.sr.pk32.fp6.bf16"(%arg55, %arg56, %arg57) : (vector<32xbf16>, i32, f32) -> vector<6xi32>
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (i32, f32, vector<2xf32>, vector<2xf16>, vector<2xbf16>, i32, f32)>, linkage = #llvm.linkage<external>, sym_name = "rocdl_4_bit_floats", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg44: i32, %arg45: f32, %arg46: vector<2xf32>, %arg47: vector<2xf16>, %arg48: vector<2xbf16>, %arg49: i32, %arg50: f32):
    %79 = "rocdl.cvt.scalef32.pk.fp4.f32"(%arg44, %arg45, %arg45, %arg50) <{dstSelIndex = 0 : i32}> : (i32, f32, f32, f32) -> i32
    %80 = "rocdl.cvt.scalef32.pk.fp4.f16"(%arg44, %arg47, %arg50) <{dstSelIndex = 1 : i32}> : (i32, vector<2xf16>, f32) -> i32
    %81 = "rocdl.cvt.scalef32.pk.fp4.bf16"(%arg44, %arg48, %arg50) <{dstSelIndex = 0 : i32}> : (i32, vector<2xbf16>, f32) -> i32
    %82 = "rocdl.cvt.scalef32.pk.f32.fp4"(%arg44, %arg50) <{srcSelIndex = 0 : i32}> : (i32, f32) -> vector<2xf32>
    %83 = "rocdl.cvt.scalef32.pk.f16.fp4"(%arg44, %arg50) <{srcSelIndex = 1 : i32}> : (i32, f32) -> vector<2xf16>
    %84 = "rocdl.cvt.scalef32.pk.bf16.fp4"(%arg44, %arg50) <{srcSelIndex = 0 : i32}> : (i32, f32) -> vector<2xbf16>
    %85 = "rocdl.cvt.scalef32.sr.pk.fp4.f32"(%arg44, %arg46, %arg49, %arg50) <{dstSelIndex = 0 : i32}> : (i32, vector<2xf32>, i32, f32) -> i32
    %86 = "rocdl.cvt.scalef32.sr.pk.fp4.f16"(%arg44, %arg47, %arg49, %arg50) <{dstSelIndex = 1 : i32}> : (i32, vector<2xf16>, i32, f32) -> i32
    %87 = "rocdl.cvt.scalef32.sr.pk.fp4.bf16"(%arg44, %arg48, %arg49, %arg50) <{dstSelIndex = 0 : i32}> : (i32, vector<2xbf16>, i32, f32) -> i32
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr<1>, f32)>, linkage = #llvm.linkage<external>, sym_name = "rocdl_atomic_attrs", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg42: !llvm.ptr<1>, %arg43: f32):
    %78 = "llvm.atomicrmw"(%arg42, %arg43) <{bin_op = 11 : i64, ordering = 2 : i64}> {rocdl.ignore_denormal_mode, rocdl.no_fine_grained_memory, rocdl.no_remote_memory} : (!llvm.ptr<1>, f32) -> f32
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<i32 (ptr<1>)>, linkage = #llvm.linkage<external>, sym_name = "rocdl_last_use", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg41: !llvm.ptr<1>):
    %77 = "llvm.load"(%arg41) <{ordering = 0 : i64}> {rocdl.last_use} : (!llvm.ptr<1>) -> i32
    "llvm.return"(%77) : (i32) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<f16 (f16, f16, f16)>, linkage = #llvm.linkage<external>, sym_name = "test_fmed3_f16", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg38: f16, %arg39: f16, %arg40: f16):
    %76 = "rocdl.fmed3"(%arg38, %arg39, %arg40) : (f16, f16, f16) -> f16
    "llvm.return"(%76) : (f16) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<f32 (f32, f32, f32)>, linkage = #llvm.linkage<external>, sym_name = "test_fmed3_f32", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg35: f32, %arg36: f32, %arg37: f32):
    %75 = "rocdl.fmed3"(%arg35, %arg36, %arg37) : (f32, f32, f32) -> f32
    "llvm.return"(%75) : (f32) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (i32, vector<2xi32>, i32)>, linkage = #llvm.linkage<external>, sym_name = "rocdl.cvt.scale.pk8", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg32: i32, %arg33: vector<2xi32>, %arg34: i32):
    %66 = "rocdl.cvt.scale.pk8.f16.fp4"(%arg32, %arg34) <{scaleSel = 0 : i32}> : (i32, i32) -> vector<8xf16>
    %67 = "rocdl.cvt.scale.pk8.bf16.fp4"(%arg32, %arg34) <{scaleSel = 0 : i32}> : (i32, i32) -> vector<8xbf16>
    %68 = "rocdl.cvt.scale.pk8.f32.fp4"(%arg32, %arg34) <{scaleSel = 0 : i32}> : (i32, i32) -> vector<8xf32>
    %69 = "rocdl.cvt.scale.pk8.f16.fp8"(%arg33, %arg34) <{scaleSel = 0 : i32}> : (vector<2xi32>, i32) -> vector<8xf16>
    %70 = "rocdl.cvt.scale.pk8.bf16.fp8"(%arg33, %arg34) <{scaleSel = 0 : i32}> : (vector<2xi32>, i32) -> vector<8xbf16>
    %71 = "rocdl.cvt.scale.pk8.f32.fp8"(%arg33, %arg34) <{scaleSel = 0 : i32}> : (vector<2xi32>, i32) -> vector<8xf32>
    %72 = "rocdl.cvt.scale.pk8.f16.bf8"(%arg33, %arg34) <{scaleSel = 0 : i32}> : (vector<2xi32>, i32) -> vector<8xf16>
    %73 = "rocdl.cvt.scale.pk8.bf16.bf8"(%arg33, %arg34) <{scaleSel = 0 : i32}> : (vector<2xi32>, i32) -> vector<8xbf16>
    %74 = "rocdl.cvt.scale.pk8.f32.bf8"(%arg33, %arg34) <{scaleSel = 0 : i32}> : (vector<2xi32>, i32) -> vector<8xf32>
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (vector<8xf32>, vector<8xf16>, vector<8xbf16>, f32)>, linkage = #llvm.linkage<external>, sym_name = "rocdl.cvt.scalef32.pk8", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg28: vector<8xf32>, %arg29: vector<8xf16>, %arg30: vector<8xbf16>, %arg31: f32):
    %57 = "rocdl.cvt.scalef32.pk8.fp8.f32"(%arg28, %arg31) : (vector<8xf32>, f32) -> vector<2xi32>
    %58 = "rocdl.cvt.scalef32.pk8.bf8.f32"(%arg28, %arg31) : (vector<8xf32>, f32) -> vector<2xi32>
    %59 = "rocdl.cvt.scalef32.pk8.fp4.f32"(%arg28, %arg31) : (vector<8xf32>, f32) -> i32
    %60 = "rocdl.cvt.scalef32.pk8.fp8.f16"(%arg29, %arg31) : (vector<8xf16>, f32) -> vector<2xi32>
    %61 = "rocdl.cvt.scalef32.pk8.bf8.f16"(%arg29, %arg31) : (vector<8xf16>, f32) -> vector<2xi32>
    %62 = "rocdl.cvt.scalef32.pk8.fp4.f16"(%arg29, %arg31) : (vector<8xf16>, f32) -> i32
    %63 = "rocdl.cvt.scalef32.pk8.fp8.bf16"(%arg30, %arg31) : (vector<8xbf16>, f32) -> vector<2xi32>
    %64 = "rocdl.cvt.scalef32.pk8.bf8.bf16"(%arg30, %arg31) : (vector<8xbf16>, f32) -> vector<2xi32>
    %65 = "rocdl.cvt.scalef32.pk8.fp4.bf16"(%arg30, %arg31) : (vector<8xbf16>, f32) -> i32
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (vector<8xf32>, vector<8xf16>, vector<8xbf16>, i32, f32)>, linkage = #llvm.linkage<external>, sym_name = "rocdl.cvt.scalef32.sr.pk8", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg23: vector<8xf32>, %arg24: vector<8xf16>, %arg25: vector<8xbf16>, %arg26: i32, %arg27: f32):
    %48 = "rocdl.cvt.scalef32.sr.pk8.fp8.f32"(%arg23, %arg26, %arg27) : (vector<8xf32>, i32, f32) -> vector<2xi32>
    %49 = "rocdl.cvt.scalef32.sr.pk8.bf8.f32"(%arg23, %arg26, %arg27) : (vector<8xf32>, i32, f32) -> vector<2xi32>
    %50 = "rocdl.cvt.scalef32.sr.pk8.fp4.f32"(%arg23, %arg26, %arg27) : (vector<8xf32>, i32, f32) -> i32
    %51 = "rocdl.cvt.scalef32.sr.pk8.fp8.f16"(%arg24, %arg26, %arg27) : (vector<8xf16>, i32, f32) -> vector<2xi32>
    %52 = "rocdl.cvt.scalef32.sr.pk8.bf8.f16"(%arg24, %arg26, %arg27) : (vector<8xf16>, i32, f32) -> vector<2xi32>
    %53 = "rocdl.cvt.scalef32.sr.pk8.fp4.f16"(%arg24, %arg26, %arg27) : (vector<8xf16>, i32, f32) -> i32
    %54 = "rocdl.cvt.scalef32.sr.pk8.fp8.bf16"(%arg25, %arg26, %arg27) : (vector<8xbf16>, i32, f32) -> vector<2xi32>
    %55 = "rocdl.cvt.scalef32.sr.pk8.bf8.bf16"(%arg25, %arg26, %arg27) : (vector<8xbf16>, i32, f32) -> vector<2xi32>
    %56 = "rocdl.cvt.scalef32.sr.pk8.fp4.bf16"(%arg25, %arg26, %arg27) : (vector<8xbf16>, i32, f32) -> i32
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (vector<3xi32>, i32)>, linkage = #llvm.linkage<external>, sym_name = "rocdl.cvt.scale.pk16", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg21: vector<3xi32>, %arg22: i32):
    %42 = "rocdl.cvt.scale.pk16.f16.fp6"(%arg21, %arg22) <{scaleSel = 0 : i32}> : (vector<3xi32>, i32) -> vector<16xf16>
    %43 = "rocdl.cvt.scale.pk16.bf16.fp6"(%arg21, %arg22) <{scaleSel = 0 : i32}> : (vector<3xi32>, i32) -> vector<16xbf16>
    %44 = "rocdl.cvt.scale.pk16.f32.fp6"(%arg21, %arg22) <{scaleSel = 0 : i32}> : (vector<3xi32>, i32) -> vector<16xf32>
    %45 = "rocdl.cvt.scale.pk16.f16.bf6"(%arg21, %arg22) <{scaleSel = 0 : i32}> : (vector<3xi32>, i32) -> vector<16xf16>
    %46 = "rocdl.cvt.scale.pk16.bf16.bf6"(%arg21, %arg22) <{scaleSel = 0 : i32}> : (vector<3xi32>, i32) -> vector<16xbf16>
    %47 = "rocdl.cvt.scale.pk16.f32.bf6"(%arg21, %arg22) <{scaleSel = 0 : i32}> : (vector<3xi32>, i32) -> vector<16xf32>
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (vector<16xf32>, vector<16xf16>, vector<16xbf16>, f32)>, linkage = #llvm.linkage<external>, sym_name = "rocdl.cvt.scalef32.pk16", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg17: vector<16xf32>, %arg18: vector<16xf16>, %arg19: vector<16xbf16>, %arg20: f32):
    %36 = "rocdl.cvt.scalef32.pk16.fp6.f16"(%arg18, %arg20) : (vector<16xf16>, f32) -> vector<3xi32>
    %37 = "rocdl.cvt.scalef32.pk16.fp6.bf16"(%arg19, %arg20) : (vector<16xbf16>, f32) -> vector<3xi32>
    %38 = "rocdl.cvt.scalef32.pk16.fp6.f32"(%arg17, %arg20) : (vector<16xf32>, f32) -> vector<3xi32>
    %39 = "rocdl.cvt.scalef32.pk16.bf6.f16"(%arg18, %arg20) : (vector<16xf16>, f32) -> vector<3xi32>
    %40 = "rocdl.cvt.scalef32.pk16.bf6.bf16"(%arg19, %arg20) : (vector<16xbf16>, f32) -> vector<3xi32>
    %41 = "rocdl.cvt.scalef32.pk16.bf6.f32"(%arg17, %arg20) : (vector<16xf32>, f32) -> vector<3xi32>
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (vector<16xf32>, vector<16xf16>, vector<16xbf16>, i32, f32)>, linkage = #llvm.linkage<external>, sym_name = "rocdl.cvt.scalef32.sr.pk16", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg12: vector<16xf32>, %arg13: vector<16xf16>, %arg14: vector<16xbf16>, %arg15: i32, %arg16: f32):
    %30 = "rocdl.cvt.scalef32.sr.pk16.fp6.f16"(%arg13, %arg15, %arg16) : (vector<16xf16>, i32, f32) -> vector<3xi32>
    %31 = "rocdl.cvt.scalef32.sr.pk16.fp6.bf16"(%arg14, %arg15, %arg16) : (vector<16xbf16>, i32, f32) -> vector<3xi32>
    %32 = "rocdl.cvt.scalef32.sr.pk16.fp6.f32"(%arg12, %arg15, %arg16) : (vector<16xf32>, i32, f32) -> vector<3xi32>
    %33 = "rocdl.cvt.scalef32.sr.pk16.bf6.f16"(%arg13, %arg15, %arg16) : (vector<16xf16>, i32, f32) -> vector<3xi32>
    %34 = "rocdl.cvt.scalef32.sr.pk16.bf6.bf16"(%arg14, %arg15, %arg16) : (vector<16xbf16>, i32, f32) -> vector<3xi32>
    %35 = "rocdl.cvt.scalef32.sr.pk16.bf6.f32"(%arg12, %arg15, %arg16) : (vector<16xf32>, i32, f32) -> vector<3xi32>
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<f32 (vector<2xf16>, vector<2xbf16>, f16, bf16, f32)>, linkage = #llvm.linkage<external>, sym_name = "rocdl_dot_fdot2_family", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg7: vector<2xf16>, %arg8: vector<2xbf16>, %arg9: f16, %arg10: bf16, %arg11: f32):
    %24 = "rocdl.fdot2"(%arg7, %arg7, %arg11) <{clamp = false}> : (vector<2xf16>, vector<2xf16>, f32) -> f32
    %25 = "rocdl.fdot2"(%arg7, %arg7, %arg11) <{clamp = true}> : (vector<2xf16>, vector<2xf16>, f32) -> f32
    %26 = "rocdl.fdot2.f32.bf16"(%arg8, %arg8, %arg11) <{clamp = false}> : (vector<2xbf16>, vector<2xbf16>, f32) -> f32
    %27 = "rocdl.fdot2.f32.bf16"(%arg8, %arg8, %arg11) <{clamp = true}> : (vector<2xbf16>, vector<2xbf16>, f32) -> f32
    %28 = "rocdl.fdot2.f16.f16"(%arg7, %arg7, %arg9) : (vector<2xf16>, vector<2xf16>, f16) -> f16
    %29 = "rocdl.fdot2.bf16.bf16"(%arg8, %arg8, %arg10) : (vector<2xbf16>, vector<2xbf16>, bf16) -> bf16
    "llvm.return"(%24) : (f32) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<i32 (vector<2xi16>, i32)>, linkage = #llvm.linkage<external>, sym_name = "rocdl_dot_sdot_udot_family", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg5: vector<2xi16>, %arg6: i32):
    %12 = "rocdl.sdot2"(%arg5, %arg5, %arg6) <{clamp = false}> : (vector<2xi16>, vector<2xi16>, i32) -> i32
    %13 = "rocdl.sdot2"(%arg5, %arg5, %arg6) <{clamp = true}> : (vector<2xi16>, vector<2xi16>, i32) -> i32
    %14 = "rocdl.udot2"(%arg5, %arg5, %arg6) <{clamp = false}> : (vector<2xi16>, vector<2xi16>, i32) -> i32
    %15 = "rocdl.udot2"(%arg5, %arg5, %arg6) <{clamp = true}> : (vector<2xi16>, vector<2xi16>, i32) -> i32
    %16 = "rocdl.sdot4"(%arg6, %arg6, %arg6) <{clamp = false}> : (i32, i32, i32) -> i32
    %17 = "rocdl.sdot4"(%arg6, %arg6, %arg6) <{clamp = true}> : (i32, i32, i32) -> i32
    %18 = "rocdl.udot4"(%arg6, %arg6, %arg6) <{clamp = false}> : (i32, i32, i32) -> i32
    %19 = "rocdl.udot4"(%arg6, %arg6, %arg6) <{clamp = true}> : (i32, i32, i32) -> i32
    %20 = "rocdl.sdot8"(%arg6, %arg6, %arg6) <{clamp = false}> : (i32, i32, i32) -> i32
    %21 = "rocdl.sdot8"(%arg6, %arg6, %arg6) <{clamp = true}> : (i32, i32, i32) -> i32
    %22 = "rocdl.udot8"(%arg6, %arg6, %arg6) <{clamp = false}> : (i32, i32, i32) -> i32
    %23 = "rocdl.udot8"(%arg6, %arg6, %arg6) <{clamp = true}> : (i32, i32, i32) -> i32
    "llvm.return"(%12) : (i32) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<i32 (i32, i32, i32)>, linkage = #llvm.linkage<external>, sym_name = "rocdl_dot_sudot_family", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg2: i32, %arg3: i32, %arg4: i32):
    %4 = "rocdl.sudot4"(%arg2, %arg3, %arg4) <{clamp = false, signA = false, signB = false}> : (i32, i32, i32) -> i32
    %5 = "rocdl.sudot4"(%arg2, %arg3, %arg4) <{clamp = false, signA = true, signB = false}> : (i32, i32, i32) -> i32
    %6 = "rocdl.sudot4"(%arg2, %arg3, %arg4) <{clamp = false, signA = false, signB = true}> : (i32, i32, i32) -> i32
    %7 = "rocdl.sudot4"(%arg2, %arg3, %arg4) <{clamp = true, signA = true, signB = true}> : (i32, i32, i32) -> i32
    %8 = "rocdl.sudot8"(%arg2, %arg3, %arg4) <{clamp = false, signA = false, signB = false}> : (i32, i32, i32) -> i32
    %9 = "rocdl.sudot8"(%arg2, %arg3, %arg4) <{clamp = false, signA = true, signB = false}> : (i32, i32, i32) -> i32
    %10 = "rocdl.sudot8"(%arg2, %arg3, %arg4) <{clamp = false, signA = false, signB = true}> : (i32, i32, i32) -> i32
    %11 = "rocdl.sudot8"(%arg2, %arg3, %arg4) <{clamp = true, signA = true, signB = true}> : (i32, i32, i32) -> i32
    "llvm.return"(%4) : (i32) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<f32 (i32, f32)>, linkage = #llvm.linkage<external>, sym_name = "rocdl_dot_fp8_family", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: i32, %arg1: f32):
    %0 = "rocdl.dot4.f32.fp8.fp8"(%arg0, %arg0, %arg1) : (i32, i32, f32) -> f32
    %1 = "rocdl.dot4.f32.fp8.bf8"(%arg0, %arg0, %arg1) : (i32, i32, f32) -> f32
    %2 = "rocdl.dot4.f32.bf8.fp8"(%arg0, %arg0, %arg1) : (i32, i32, f32) -> f32
    %3 = "rocdl.dot4.f32.bf8.bf8"(%arg0, %arg0, %arg1) : (i32, i32, f32) -> f32
    "llvm.return"(%0) : (f32) -> ()
  }) : () -> ()
}) : () -> ()

