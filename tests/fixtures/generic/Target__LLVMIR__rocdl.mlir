"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<i32 ()>, linkage = #llvm.linkage<external>, sym_name = "rocdl_special_regs", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %385 = "rocdl.workitem.id.x"() : () -> i32
    %386 = "rocdl.workitem.id.y"() : () -> i32
    %387 = "rocdl.workitem.id.z"() : () -> i32
    %388 = "rocdl.workgroup.id.x"() : () -> i32
    %389 = "rocdl.workgroup.id.y"() : () -> i32
    %390 = "rocdl.workgroup.id.z"() : () -> i32
    %391 = "rocdl.cluster.id.x"() : () -> i32
    %392 = "rocdl.cluster.id.y"() : () -> i32
    %393 = "rocdl.cluster.id.z"() : () -> i32
    %394 = "rocdl.workgroup.dim.x"() : () -> i64
    %395 = "rocdl.workgroup.dim.y"() : () -> i64
    %396 = "rocdl.workgroup.dim.z"() : () -> i64
    %397 = "rocdl.grid.dim.x"() : () -> i64
    %398 = "rocdl.grid.dim.y"() : () -> i64
    %399 = "rocdl.grid.dim.z"() : () -> i64
    %400 = "rocdl.workitem.id.x"() <{range = #llvm.constant_range<i32, 0, 64>}> : () -> i32
    %401 = "rocdl.workgroup.dim.x"() <{range = #llvm.constant_range<i32, 1, 65>}> : () -> i64
    %402 = "rocdl.wavefrontsize"() : () -> i32
    %403 = "rocdl.wavefrontsize"() <{range = #llvm.constant_range<i32, 32, 65>}> : () -> i32
    "llvm.return"(%385) : (i32) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "kernel_func", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "llvm.return"() : () -> ()
  }) {rocdl.kernel} : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "kernel_func_workgroups", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "llvm.return"() : () -> ()
  }) {rocdl.kernel, rocdl.max_flat_work_group_size = 1024 : index} : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (f32, f16, bf16)>, linkage = #llvm.linkage<external>, sym_name = "kernel_math_ops", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg226: f32, %arg227: f16, %arg228: bf16):
    %364 = "rocdl.tanh"(%arg226) : (f32) -> f32
    %365 = "rocdl.tanh"(%arg227) : (f16) -> f16
    %366 = "rocdl.tanh"(%arg228) : (bf16) -> bf16
    %367 = "rocdl.sin"(%arg226) : (f32) -> f32
    %368 = "rocdl.sin"(%arg227) : (f16) -> f16
    %369 = "rocdl.sin"(%arg228) : (bf16) -> bf16
    %370 = "rocdl.cos"(%arg226) : (f32) -> f32
    %371 = "rocdl.cos"(%arg227) : (f16) -> f16
    %372 = "rocdl.cos"(%arg228) : (bf16) -> bf16
    %373 = "rocdl.rcp"(%arg226) : (f32) -> f32
    %374 = "rocdl.rcp"(%arg227) : (f16) -> f16
    %375 = "rocdl.rcp"(%arg228) : (bf16) -> bf16
    %376 = "rocdl.exp2"(%arg226) : (f32) -> f32
    %377 = "rocdl.exp2"(%arg227) : (f16) -> f16
    %378 = "rocdl.exp2"(%arg228) : (bf16) -> bf16
    %379 = "rocdl.log"(%arg226) : (f32) -> f32
    %380 = "rocdl.log"(%arg227) : (f16) -> f16
    %381 = "rocdl.log"(%arg228) : (bf16) -> bf16
    %382 = "rocdl.sqrt"(%arg226) : (f32) -> f32
    %383 = "rocdl.sqrt"(%arg227) : (f16) -> f16
    %384 = "rocdl.sqrt"(%arg228) : (bf16) -> bf16
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "known_block_sizes", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "llvm.return"() : () -> ()
  }) {rocdl.flat_work_group_size = "128,128", rocdl.kernel, rocdl.reqd_work_group_size = array<i32: 16, 4, 2>} : () -> ()
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
    %360 = "llvm.mlir.constant"() <{value = -1 : i32}> : () -> i32
    %361 = "llvm.mlir.constant"() <{value = 0 : i32}> : () -> i32
    %362 = "rocdl.mbcnt.lo"(%360, %361) <{res_attrs = [{llvm.noundef, llvm.range = #llvm.constant_range<i32, 0, 32>}]}> : (i32, i32) -> i32
    %363 = "rocdl.mbcnt.hi"(%360, %362) <{res_attrs = [{llvm.noundef, llvm.range = #llvm.constant_range<i32, 0, 64>}]}> : (i32, i32) -> i32
    "llvm.return"(%363) : (i32) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<i32 (i32)>, linkage = #llvm.linkage<external>, sym_name = "rocdl.swizzle", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg225: i32):
    %358 = "llvm.mlir.constant"() <{value = 100 : i32}> : () -> i32
    %359 = "rocdl.ds_swizzle"(%arg225, %358) : (i32, i32) -> i32
    "llvm.return"(%359) : (i32) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<i32 (i32)>, linkage = #llvm.linkage<external>, sym_name = "rocdl.bpermute", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg224: i32):
    %356 = "llvm.mlir.constant"() <{value = 10 : i32}> : () -> i32
    %357 = "rocdl.ds_bpermute"(%356, %arg224) : (i32, i32) -> i32
    "llvm.return"(%357) : (i32) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<i32 (i1)>, linkage = #llvm.linkage<external>, sym_name = "rocdl.ballot32", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg223: i1):
    %355 = "rocdl.ballot"(%arg223) : (i1) -> i32
    "llvm.return"(%355) : (i32) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<i64 (i1)>, linkage = #llvm.linkage<external>, sym_name = "rocdl.ballot64", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg222: i1):
    %354 = "rocdl.ballot"(%arg222) : (i1) -> i64
    "llvm.return"(%354) : (i64) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<f32 (f32, f64, i32, vector<2xf32>)>, linkage = #llvm.linkage<external>, sym_name = "rocdl.readfirstlane", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg218: f32, %arg219: f64, %arg220: i32, %arg221: vector<2xf32>):
    %350 = "rocdl.readfirstlane"(%arg218) : (f32) -> f32
    %351 = "rocdl.readfirstlane"(%arg219) : (f64) -> f64
    %352 = "rocdl.readfirstlane"(%arg220) : (i32) -> i32
    %353 = "rocdl.readfirstlane"(%arg221) : (vector<2xf32>) -> vector<2xf32>
    "llvm.return"(%350) : (f32) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<f32 (f32, f64, i32, vector<2xf32>)>, linkage = #llvm.linkage<external>, sym_name = "rocdl.readlane", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg214: f32, %arg215: f64, %arg216: i32, %arg217: vector<2xf32>):
    %345 = "llvm.mlir.constant"() <{value = 0 : i32}> : () -> i32
    %346 = "rocdl.readlane"(%arg214, %345) : (f32, i32) -> f32
    %347 = "rocdl.readlane"(%arg215, %345) : (f64, i32) -> f64
    %348 = "rocdl.readlane"(%arg216, %345) : (i32, i32) -> i32
    %349 = "rocdl.readlane"(%arg217, %345) : (vector<2xf32>, i32) -> vector<2xf32>
    "llvm.return"(%346) : (f32) -> ()
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
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr<3>)>, linkage = #llvm.linkage<external>, sym_name = "rocdl.s.barrier.init", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg213: !llvm.ptr<3>):
    "rocdl.s.barrier.init"(%arg213) <{memberCnt = 1 : i32}> : (!llvm.ptr<3>) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "rocdl.s.barrier.signal", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "rocdl.s.barrier.signal"() <{id = -1 : i32}> : () -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr<3>)>, linkage = #llvm.linkage<external>, sym_name = "rocdl.s.barrier.signal.var", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg212: !llvm.ptr<3>):
    "rocdl.s.barrier.signal.var"(%arg212) <{memberCnt = 1 : i32}> : (!llvm.ptr<3>) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr<3>)>, linkage = #llvm.linkage<external>, sym_name = "rocdl.s.barrier.join", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg211: !llvm.ptr<3>):
    "rocdl.s.barrier.join"(%arg211) : (!llvm.ptr<3>) -> ()
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
    %344 = "rocdl.s.barrier.signal.isfirst"() <{id = 1 : i32}> : () -> i1
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "rocdl.s.get.barrier.state", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %343 = "rocdl.s.get.barrier.state"() <{id = 1 : i32}> : () -> i32
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr<3>)>, linkage = #llvm.linkage<external>, sym_name = "rocdl.s.get.named.barrier.state", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg210: !llvm.ptr<3>):
    %342 = "rocdl.s.get.named.barrier.state"(%arg210) : (!llvm.ptr<3>) -> i32
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr<3>)>, linkage = #llvm.linkage<external>, sym_name = "rocdl.s.wakeup.barrier", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg209: !llvm.ptr<3>):
    "rocdl.s.wakeup.barrier"(%arg209) : (!llvm.ptr<3>) -> ()
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
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "rocdl.setprio", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "rocdl.s.setprio"() <{priority = 0 : i16}> : () -> ()
    "rocdl.s.setprio"() <{priority = 1 : i16}> : () -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "rocdl.schedbarrier", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "rocdl.sched.barrier"() <{mask = 0 : i32}> : () -> ()
    "rocdl.sched.barrier"() <{mask = 1 : i32}> : () -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "rocdl.sched.group.barrier", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "rocdl.sched.group.barrier"() <{groupId = 0 : i32, mask = 8 : i32, size = 1 : i32}> : () -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "rocdl.iglp.opt", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "rocdl.iglp.opt"() <{variant = 0 : i32}> : () -> ()
    "rocdl.iglp.opt"() <{variant = 1 : i32}> : () -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<vector<32xf32> (f32, f32, vector<32xf32>, i32, vector<16xf32>, vector<4xf32>, vector<4xf16>, vector<32xi32>, vector<16xi32>, vector<4xi32>, vector<2xi16>, i64, vector<8xbf16>, vector<4xi32>, vector<8xf16>)>, linkage = #llvm.linkage<external>, sym_name = "rocdl.xdlops", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg194: f32, %arg195: f32, %arg196: vector<32xf32>, %arg197: i32, %arg198: vector<16xf32>, %arg199: vector<4xf32>, %arg200: vector<4xf16>, %arg201: vector<32xi32>, %arg202: vector<16xi32>, %arg203: vector<4xi32>, %arg204: vector<2xi16>, %arg205: i64, %arg206: vector<8xbf16>, %arg207: vector<4xi32>, %arg208: vector<8xf16>):
    %307 = "llvm.mlir.constant"() <{value = 42 : i32}> : () -> i32
    %308 = "rocdl.mfma.f32.32x32x1f32"(%arg194, %arg195, %arg196, %307, %307, %307) : (f32, f32, vector<32xf32>, i32, i32, i32) -> vector<32xf32>
    %309 = "rocdl.mfma.f32.16x16x1f32"(%arg194, %arg195, %arg198, %307, %307, %307) : (f32, f32, vector<16xf32>, i32, i32, i32) -> vector<16xf32>
    %310 = "rocdl.mfma.f32.16x16x4f32"(%arg194, %arg195, %arg199, %307, %307, %307) : (f32, f32, vector<4xf32>, i32, i32, i32) -> vector<4xf32>
    %311 = "rocdl.mfma.f32.4x4x1f32"(%arg194, %arg195, %arg199, %307, %307, %307) : (f32, f32, vector<4xf32>, i32, i32, i32) -> vector<4xf32>
    %312 = "rocdl.mfma.f32.32x32x2f32"(%arg194, %arg195, %arg198, %307, %307, %307) : (f32, f32, vector<16xf32>, i32, i32, i32) -> vector<16xf32>
    %313 = "rocdl.mfma.f32.32x32x4f16"(%arg200, %arg200, %arg196, %307, %307, %307) : (vector<4xf16>, vector<4xf16>, vector<32xf32>, i32, i32, i32) -> vector<32xf32>
    %314 = "rocdl.mfma.f32.16x16x4f16"(%arg200, %arg200, %arg198, %307, %307, %307) : (vector<4xf16>, vector<4xf16>, vector<16xf32>, i32, i32, i32) -> vector<16xf32>
    %315 = "rocdl.mfma.f32.4x4x4f16"(%arg200, %arg200, %arg199, %307, %307, %307) : (vector<4xf16>, vector<4xf16>, vector<4xf32>, i32, i32, i32) -> vector<4xf32>
    %316 = "rocdl.mfma.f32.32x32x8f16"(%arg200, %arg200, %arg198, %307, %307, %307) : (vector<4xf16>, vector<4xf16>, vector<16xf32>, i32, i32, i32) -> vector<16xf32>
    %317 = "rocdl.mfma.f32.16x16x16f16"(%arg200, %arg200, %arg199, %307, %307, %307) : (vector<4xf16>, vector<4xf16>, vector<4xf32>, i32, i32, i32) -> vector<4xf32>
    %318 = "rocdl.mfma.i32.32x32x4i8"(%arg197, %arg197, %arg201, %307, %307, %307) : (i32, i32, vector<32xi32>, i32, i32, i32) -> vector<32xi32>
    %319 = "rocdl.mfma.i32.16x16x4i8"(%arg197, %arg197, %arg202, %307, %307, %307) : (i32, i32, vector<16xi32>, i32, i32, i32) -> vector<16xi32>
    %320 = "rocdl.mfma.i32.4x4x4i8"(%arg197, %arg197, %arg203, %307, %307, %307) : (i32, i32, vector<4xi32>, i32, i32, i32) -> vector<4xi32>
    %321 = "rocdl.mfma.i32.32x32x8i8"(%arg197, %arg197, %arg202, %307, %307, %307) : (i32, i32, vector<16xi32>, i32, i32, i32) -> vector<16xi32>
    %322 = "rocdl.mfma.i32.16x16x16i8"(%arg197, %arg197, %arg203, %307, %307, %307) : (i32, i32, vector<4xi32>, i32, i32, i32) -> vector<4xi32>
    %323 = "rocdl.mfma.f32.32x32x2bf16"(%arg204, %arg204, %arg196, %307, %307, %307) : (vector<2xi16>, vector<2xi16>, vector<32xf32>, i32, i32, i32) -> vector<32xf32>
    %324 = "rocdl.mfma.f32.16x16x2bf16"(%arg204, %arg204, %arg198, %307, %307, %307) : (vector<2xi16>, vector<2xi16>, vector<16xf32>, i32, i32, i32) -> vector<16xf32>
    %325 = "rocdl.mfma.f32.4x4x2bf16"(%arg204, %arg204, %arg199, %307, %307, %307) : (vector<2xi16>, vector<2xi16>, vector<4xf32>, i32, i32, i32) -> vector<4xf32>
    %326 = "rocdl.mfma.f32.32x32x4bf16"(%arg204, %arg204, %arg198, %307, %307, %307) : (vector<2xi16>, vector<2xi16>, vector<16xf32>, i32, i32, i32) -> vector<16xf32>
    %327 = "rocdl.mfma.f32.16x16x8bf16"(%arg204, %arg204, %arg199, %307, %307, %307) : (vector<2xi16>, vector<2xi16>, vector<4xf32>, i32, i32, i32) -> vector<4xf32>
    %328 = "rocdl.mfma.f32.16x16x32.bf8.bf8"(%arg205, %arg205, %arg199, %307, %307, %307) : (i64, i64, vector<4xf32>, i32, i32, i32) -> vector<4xf32>
    %329 = "rocdl.mfma.f32.16x16x32.bf8.fp8"(%arg205, %arg205, %arg199, %307, %307, %307) : (i64, i64, vector<4xf32>, i32, i32, i32) -> vector<4xf32>
    %330 = "rocdl.mfma.f32.16x16x32.fp8.bf8"(%arg205, %arg205, %arg199, %307, %307, %307) : (i64, i64, vector<4xf32>, i32, i32, i32) -> vector<4xf32>
    %331 = "rocdl.mfma.f32.16x16x32.fp8.fp8"(%arg205, %arg205, %arg199, %307, %307, %307) : (i64, i64, vector<4xf32>, i32, i32, i32) -> vector<4xf32>
    %332 = "rocdl.mfma.f32.32x32x16.bf8.bf8"(%arg205, %arg205, %arg198, %307, %307, %307) : (i64, i64, vector<16xf32>, i32, i32, i32) -> vector<16xf32>
    %333 = "rocdl.mfma.f32.32x32x16.bf8.fp8"(%arg205, %arg205, %arg198, %307, %307, %307) : (i64, i64, vector<16xf32>, i32, i32, i32) -> vector<16xf32>
    %334 = "rocdl.mfma.f32.32x32x16.fp8.bf8"(%arg205, %arg205, %arg198, %307, %307, %307) : (i64, i64, vector<16xf32>, i32, i32, i32) -> vector<16xf32>
    %335 = "rocdl.mfma.f32.32x32x16.bf8.bf8"(%arg205, %arg205, %arg198, %307, %307, %307) : (i64, i64, vector<16xf32>, i32, i32, i32) -> vector<16xf32>
    %336 = "rocdl.mfma.f32.16x16x32.bf16"(%arg206, %arg206, %arg199, %307, %307, %307) : (vector<8xbf16>, vector<8xbf16>, vector<4xf32>, i32, i32, i32) -> vector<4xf32>
    %337 = "rocdl.mfma.i32.16x16x64.i8"(%arg203, %arg203, %arg203, %307, %307, %307) : (vector<4xi32>, vector<4xi32>, vector<4xi32>, i32, i32, i32) -> vector<4xi32>
    %338 = "rocdl.mfma.f32.16x16x32.f16"(%arg208, %arg208, %arg199, %307, %307, %307) : (vector<8xf16>, vector<8xf16>, vector<4xf32>, i32, i32, i32) -> vector<4xi32>
    %339 = "rocdl.mfma.f32.32x32x16.bf16"(%arg206, %arg206, %arg198, %307, %307, %307) : (vector<8xbf16>, vector<8xbf16>, vector<16xf32>, i32, i32, i32) -> vector<16xf32>
    %340 = "rocdl.mfma.i32.32x32x32.i8"(%arg203, %arg203, %arg202, %307, %307, %307) : (vector<4xi32>, vector<4xi32>, vector<16xi32>, i32, i32, i32) -> vector<16xi32>
    %341 = "rocdl.mfma.f32.32x32x16.f16"(%arg208, %arg208, %arg198, %307, %307, %307) : (vector<8xf16>, vector<8xf16>, vector<16xf32>, i32, i32, i32) -> vector<16xf32>
    "llvm.return"(%308) : (vector<32xf32>) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<vector<4xf32> (i32, vector<4xf16>, vector<8xf16>, vector<4xf32>, vector<16xf32>, vector<4xi16>, vector<8xi16>, vector<2xi32>, vector<4xi32>, vector<16xi32>, vector<16xf16>, vector<8xbf16>, vector<16xbf16>, vector<8xi32>)>, linkage = #llvm.linkage<external>, sym_name = "rocdl.smfmac", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg180: i32, %arg181: vector<4xf16>, %arg182: vector<8xf16>, %arg183: vector<4xf32>, %arg184: vector<16xf32>, %arg185: vector<4xi16>, %arg186: vector<8xi16>, %arg187: vector<2xi32>, %arg188: vector<4xi32>, %arg189: vector<16xi32>, %arg190: vector<16xf16>, %arg191: vector<8xbf16>, %arg192: vector<16xbf16>, %arg193: vector<8xi32>):
    %278 = "llvm.mlir.constant"() <{value = 42 : i32}> : () -> i32
    %279 = "rocdl.smfmac.f32.16x16x32.f16"(%arg181, %arg182, %arg183, %278, %278, %278) : (vector<4xf16>, vector<8xf16>, vector<4xf32>, i32, i32, i32) -> vector<4xf32>
    %280 = "rocdl.smfmac.f32.32x32x16.f16"(%arg181, %arg182, %arg184, %278, %278, %278) : (vector<4xf16>, vector<8xf16>, vector<16xf32>, i32, i32, i32) -> vector<16xf32>
    %281 = "rocdl.smfmac.f32.16x16x32.bf16"(%arg185, %arg186, %arg183, %278, %278, %278) : (vector<4xi16>, vector<8xi16>, vector<4xf32>, i32, i32, i32) -> vector<4xf32>
    %282 = "rocdl.smfmac.f32.32x32x16.bf16"(%arg185, %arg186, %arg184, %278, %278, %278) : (vector<4xi16>, vector<8xi16>, vector<16xf32>, i32, i32, i32) -> vector<16xf32>
    %283 = "rocdl.smfmac.i32.16x16x64.i8"(%arg187, %arg188, %arg188, %278, %278, %278) : (vector<2xi32>, vector<4xi32>, vector<4xi32>, i32, i32, i32) -> vector<4xi32>
    %284 = "rocdl.smfmac.i32.32x32x32.i8"(%arg187, %arg188, %arg189, %278, %278, %278) : (vector<2xi32>, vector<4xi32>, vector<16xi32>, i32, i32, i32) -> vector<16xi32>
    %285 = "rocdl.smfmac.f32.16x16x64.bf8.bf8"(%arg187, %arg188, %arg183, %278, %278, %278) : (vector<2xi32>, vector<4xi32>, vector<4xf32>, i32, i32, i32) -> vector<4xf32>
    %286 = "rocdl.smfmac.f32.16x16x64.bf8.fp8"(%arg187, %arg188, %arg183, %278, %278, %278) : (vector<2xi32>, vector<4xi32>, vector<4xf32>, i32, i32, i32) -> vector<4xf32>
    %287 = "rocdl.smfmac.f32.16x16x64.fp8.bf8"(%arg187, %arg188, %arg183, %278, %278, %278) : (vector<2xi32>, vector<4xi32>, vector<4xf32>, i32, i32, i32) -> vector<4xf32>
    %288 = "rocdl.smfmac.f32.16x16x64.fp8.fp8"(%arg187, %arg188, %arg183, %278, %278, %278) : (vector<2xi32>, vector<4xi32>, vector<4xf32>, i32, i32, i32) -> vector<4xf32>
    %289 = "rocdl.smfmac.f32.32x32x32.bf8.bf8"(%arg187, %arg188, %arg184, %278, %278, %278) : (vector<2xi32>, vector<4xi32>, vector<16xf32>, i32, i32, i32) -> vector<16xf32>
    %290 = "rocdl.smfmac.f32.32x32x32.bf8.fp8"(%arg187, %arg188, %arg184, %278, %278, %278) : (vector<2xi32>, vector<4xi32>, vector<16xf32>, i32, i32, i32) -> vector<16xf32>
    %291 = "rocdl.smfmac.f32.32x32x32.fp8.bf8"(%arg187, %arg188, %arg184, %278, %278, %278) : (vector<2xi32>, vector<4xi32>, vector<16xf32>, i32, i32, i32) -> vector<16xf32>
    %292 = "rocdl.smfmac.f32.32x32x32.fp8.fp8"(%arg187, %arg188, %arg184, %278, %278, %278) : (vector<2xi32>, vector<4xi32>, vector<16xf32>, i32, i32, i32) -> vector<16xf32>
    %293 = "rocdl.smfmac.f32.16x16x64.f16"(%arg182, %arg190, %arg183, %278, %278, %278) : (vector<8xf16>, vector<16xf16>, vector<4xf32>, i32, i32, i32) -> vector<4xf32>
    %294 = "rocdl.smfmac.f32.32x32x32.f16"(%arg182, %arg190, %arg184, %278, %278, %278) : (vector<8xf16>, vector<16xf16>, vector<16xf32>, i32, i32, i32) -> vector<16xf32>
    %295 = "rocdl.smfmac.f32.16x16x64.bf16"(%arg191, %arg192, %arg183, %278, %278, %278) : (vector<8xbf16>, vector<16xbf16>, vector<4xf32>, i32, i32, i32) -> vector<4xf32>
    %296 = "rocdl.smfmac.f32.32x32x32.bf16"(%arg191, %arg192, %arg184, %278, %278, %278) : (vector<8xbf16>, vector<16xbf16>, vector<16xf32>, i32, i32, i32) -> vector<16xf32>
    %297 = "rocdl.smfmac.i32.16x16x128.i8"(%arg188, %arg193, %arg188, %278, %278, %278) : (vector<4xi32>, vector<8xi32>, vector<4xi32>, i32, i32, i32) -> vector<4xi32>
    %298 = "rocdl.smfmac.f32.16x16x128.bf8.bf8"(%arg188, %arg193, %arg183, %278, %278, %278) : (vector<4xi32>, vector<8xi32>, vector<4xf32>, i32, i32, i32) -> vector<4xf32>
    %299 = "rocdl.smfmac.f32.16x16x128.bf8.fp8"(%arg188, %arg193, %arg183, %278, %278, %278) : (vector<4xi32>, vector<8xi32>, vector<4xf32>, i32, i32, i32) -> vector<4xf32>
    %300 = "rocdl.smfmac.f32.16x16x128.fp8.bf8"(%arg188, %arg193, %arg183, %278, %278, %278) : (vector<4xi32>, vector<8xi32>, vector<4xf32>, i32, i32, i32) -> vector<4xf32>
    %301 = "rocdl.smfmac.f32.16x16x128.fp8.fp8"(%arg188, %arg193, %arg183, %278, %278, %278) : (vector<4xi32>, vector<8xi32>, vector<4xf32>, i32, i32, i32) -> vector<4xf32>
    %302 = "rocdl.smfmac.i32.32x32x64.i8"(%arg188, %arg193, %arg189, %278, %278, %278) : (vector<4xi32>, vector<8xi32>, vector<16xi32>, i32, i32, i32) -> vector<16xi32>
    %303 = "rocdl.smfmac.f32.32x32x64.bf8.bf8"(%arg188, %arg193, %arg184, %278, %278, %278) : (vector<4xi32>, vector<8xi32>, vector<16xf32>, i32, i32, i32) -> vector<16xf32>
    %304 = "rocdl.smfmac.f32.32x32x64.bf8.fp8"(%arg188, %arg193, %arg184, %278, %278, %278) : (vector<4xi32>, vector<8xi32>, vector<16xf32>, i32, i32, i32) -> vector<16xf32>
    %305 = "rocdl.smfmac.f32.32x32x64.fp8.bf8"(%arg188, %arg193, %arg184, %278, %278, %278) : (vector<4xi32>, vector<8xi32>, vector<16xf32>, i32, i32, i32) -> vector<16xf32>
    %306 = "rocdl.smfmac.f32.32x32x64.fp8.fp8"(%arg188, %arg193, %arg184, %278, %278, %278) : (vector<4xi32>, vector<8xi32>, vector<16xf32>, i32, i32, i32) -> vector<16xf32>
    "llvm.return"(%279) : (vector<4xf32>) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<vector<16xf32> (i32, vector<16xf32>, vector<8xi32>, vector<6xi32>, vector<4xi32>)>, linkage = #llvm.linkage<external>, sym_name = "rocdl.mfma.scale.f32.32x32x64.f8f6f4", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg175: i32, %arg176: vector<16xf32>, %arg177: vector<8xi32>, %arg178: vector<6xi32>, %arg179: vector<4xi32>):
    %248 = "llvm.mlir.constant"() <{value = 0 : i32}> : () -> i32
    %249 = "llvm.mlir.constant"() <{value = 1 : i32}> : () -> i32
    %250 = "llvm.mlir.constant"() <{value = 2 : i32}> : () -> i32
    %251 = "llvm.mlir.constant"() <{value = 3 : i32}> : () -> i32
    %252 = "llvm.mlir.constant"() <{value = 4 : i32}> : () -> i32
    %253 = "rocdl.mfma.scale.f32.32x32x64.f8f6f4"(%arg177, %arg177, %arg176, %248, %248, %248, %arg175, %248, %arg175) : (vector<8xi32>, vector<8xi32>, vector<16xf32>, i32, i32, i32, i32, i32, i32) -> vector<16xf32>
    %254 = "rocdl.mfma.scale.f32.32x32x64.f8f6f4"(%arg177, %arg177, %arg176, %248, %249, %248, %arg175, %248, %arg175) : (vector<8xi32>, vector<8xi32>, vector<16xf32>, i32, i32, i32, i32, i32, i32) -> vector<16xf32>
    %255 = "rocdl.mfma.scale.f32.32x32x64.f8f6f4"(%arg177, %arg178, %arg176, %248, %250, %248, %arg175, %248, %arg175) : (vector<8xi32>, vector<6xi32>, vector<16xf32>, i32, i32, i32, i32, i32, i32) -> vector<16xf32>
    %256 = "rocdl.mfma.scale.f32.32x32x64.f8f6f4"(%arg177, %arg178, %arg176, %248, %251, %248, %arg175, %248, %arg175) : (vector<8xi32>, vector<6xi32>, vector<16xf32>, i32, i32, i32, i32, i32, i32) -> vector<16xf32>
    %257 = "rocdl.mfma.scale.f32.32x32x64.f8f6f4"(%arg177, %arg179, %arg176, %248, %252, %248, %arg175, %248, %arg175) : (vector<8xi32>, vector<4xi32>, vector<16xf32>, i32, i32, i32, i32, i32, i32) -> vector<16xf32>
    %258 = "rocdl.mfma.scale.f32.32x32x64.f8f6f4"(%arg177, %arg177, %arg176, %249, %248, %248, %arg175, %248, %arg175) : (vector<8xi32>, vector<8xi32>, vector<16xf32>, i32, i32, i32, i32, i32, i32) -> vector<16xf32>
    %259 = "rocdl.mfma.scale.f32.32x32x64.f8f6f4"(%arg177, %arg177, %arg176, %249, %249, %248, %arg175, %248, %arg175) : (vector<8xi32>, vector<8xi32>, vector<16xf32>, i32, i32, i32, i32, i32, i32) -> vector<16xf32>
    %260 = "rocdl.mfma.scale.f32.32x32x64.f8f6f4"(%arg177, %arg178, %arg176, %249, %250, %248, %arg175, %248, %arg175) : (vector<8xi32>, vector<6xi32>, vector<16xf32>, i32, i32, i32, i32, i32, i32) -> vector<16xf32>
    %261 = "rocdl.mfma.scale.f32.32x32x64.f8f6f4"(%arg177, %arg178, %arg176, %249, %251, %248, %arg175, %248, %arg175) : (vector<8xi32>, vector<6xi32>, vector<16xf32>, i32, i32, i32, i32, i32, i32) -> vector<16xf32>
    %262 = "rocdl.mfma.scale.f32.32x32x64.f8f6f4"(%arg177, %arg179, %arg176, %249, %252, %248, %arg175, %248, %arg175) : (vector<8xi32>, vector<4xi32>, vector<16xf32>, i32, i32, i32, i32, i32, i32) -> vector<16xf32>
    %263 = "rocdl.mfma.scale.f32.32x32x64.f8f6f4"(%arg178, %arg177, %arg176, %250, %248, %248, %arg175, %248, %arg175) : (vector<6xi32>, vector<8xi32>, vector<16xf32>, i32, i32, i32, i32, i32, i32) -> vector<16xf32>
    %264 = "rocdl.mfma.scale.f32.32x32x64.f8f6f4"(%arg178, %arg177, %arg176, %250, %249, %248, %arg175, %248, %arg175) : (vector<6xi32>, vector<8xi32>, vector<16xf32>, i32, i32, i32, i32, i32, i32) -> vector<16xf32>
    %265 = "rocdl.mfma.scale.f32.32x32x64.f8f6f4"(%arg178, %arg178, %arg176, %250, %250, %248, %arg175, %248, %arg175) : (vector<6xi32>, vector<6xi32>, vector<16xf32>, i32, i32, i32, i32, i32, i32) -> vector<16xf32>
    %266 = "rocdl.mfma.scale.f32.32x32x64.f8f6f4"(%arg178, %arg178, %arg176, %250, %251, %248, %arg175, %248, %arg175) : (vector<6xi32>, vector<6xi32>, vector<16xf32>, i32, i32, i32, i32, i32, i32) -> vector<16xf32>
    %267 = "rocdl.mfma.scale.f32.32x32x64.f8f6f4"(%arg178, %arg179, %arg176, %250, %252, %248, %arg175, %248, %arg175) : (vector<6xi32>, vector<4xi32>, vector<16xf32>, i32, i32, i32, i32, i32, i32) -> vector<16xf32>
    %268 = "rocdl.mfma.scale.f32.32x32x64.f8f6f4"(%arg178, %arg177, %arg176, %251, %248, %248, %arg175, %248, %arg175) : (vector<6xi32>, vector<8xi32>, vector<16xf32>, i32, i32, i32, i32, i32, i32) -> vector<16xf32>
    %269 = "rocdl.mfma.scale.f32.32x32x64.f8f6f4"(%arg178, %arg177, %arg176, %251, %249, %248, %arg175, %248, %arg175) : (vector<6xi32>, vector<8xi32>, vector<16xf32>, i32, i32, i32, i32, i32, i32) -> vector<16xf32>
    %270 = "rocdl.mfma.scale.f32.32x32x64.f8f6f4"(%arg178, %arg178, %arg176, %251, %250, %248, %arg175, %248, %arg175) : (vector<6xi32>, vector<6xi32>, vector<16xf32>, i32, i32, i32, i32, i32, i32) -> vector<16xf32>
    %271 = "rocdl.mfma.scale.f32.32x32x64.f8f6f4"(%arg178, %arg178, %arg176, %251, %251, %248, %arg175, %248, %arg175) : (vector<6xi32>, vector<6xi32>, vector<16xf32>, i32, i32, i32, i32, i32, i32) -> vector<16xf32>
    %272 = "rocdl.mfma.scale.f32.32x32x64.f8f6f4"(%arg178, %arg179, %arg176, %251, %252, %248, %arg175, %248, %arg175) : (vector<6xi32>, vector<4xi32>, vector<16xf32>, i32, i32, i32, i32, i32, i32) -> vector<16xf32>
    %273 = "rocdl.mfma.scale.f32.32x32x64.f8f6f4"(%arg179, %arg177, %arg176, %252, %248, %248, %arg175, %248, %arg175) : (vector<4xi32>, vector<8xi32>, vector<16xf32>, i32, i32, i32, i32, i32, i32) -> vector<16xf32>
    %274 = "rocdl.mfma.scale.f32.32x32x64.f8f6f4"(%arg179, %arg177, %arg176, %252, %249, %248, %arg175, %248, %arg175) : (vector<4xi32>, vector<8xi32>, vector<16xf32>, i32, i32, i32, i32, i32, i32) -> vector<16xf32>
    %275 = "rocdl.mfma.scale.f32.32x32x64.f8f6f4"(%arg179, %arg178, %arg176, %252, %250, %248, %arg175, %248, %arg175) : (vector<4xi32>, vector<6xi32>, vector<16xf32>, i32, i32, i32, i32, i32, i32) -> vector<16xf32>
    %276 = "rocdl.mfma.scale.f32.32x32x64.f8f6f4"(%arg179, %arg178, %arg176, %252, %251, %248, %arg175, %248, %arg175) : (vector<4xi32>, vector<6xi32>, vector<16xf32>, i32, i32, i32, i32, i32, i32) -> vector<16xf32>
    %277 = "rocdl.mfma.scale.f32.32x32x64.f8f6f4"(%arg179, %arg179, %arg176, %252, %252, %248, %arg175, %248, %arg175) : (vector<4xi32>, vector<4xi32>, vector<16xf32>, i32, i32, i32, i32, i32, i32) -> vector<16xf32>
    "llvm.return"(%253) : (vector<16xf32>) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<vector<4xf32> (i32, vector<4xf32>, vector<8xi32>, vector<6xi32>, vector<4xi32>)>, linkage = #llvm.linkage<external>, sym_name = "rocdl.mfma.scale.f32.16x16x128.f8f6f4", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg170: i32, %arg171: vector<4xf32>, %arg172: vector<8xi32>, %arg173: vector<6xi32>, %arg174: vector<4xi32>):
    %218 = "llvm.mlir.constant"() <{value = 0 : i32}> : () -> i32
    %219 = "llvm.mlir.constant"() <{value = 1 : i32}> : () -> i32
    %220 = "llvm.mlir.constant"() <{value = 2 : i32}> : () -> i32
    %221 = "llvm.mlir.constant"() <{value = 3 : i32}> : () -> i32
    %222 = "llvm.mlir.constant"() <{value = 4 : i32}> : () -> i32
    %223 = "rocdl.mfma.scale.f32.16x16x128.f8f6f4"(%arg172, %arg172, %arg171, %218, %218, %218, %arg170, %218, %arg170) : (vector<8xi32>, vector<8xi32>, vector<4xf32>, i32, i32, i32, i32, i32, i32) -> vector<4xf32>
    %224 = "rocdl.mfma.scale.f32.16x16x128.f8f6f4"(%arg172, %arg172, %arg171, %218, %219, %218, %arg170, %218, %arg170) : (vector<8xi32>, vector<8xi32>, vector<4xf32>, i32, i32, i32, i32, i32, i32) -> vector<4xf32>
    %225 = "rocdl.mfma.scale.f32.16x16x128.f8f6f4"(%arg172, %arg173, %arg171, %218, %220, %218, %arg170, %218, %arg170) : (vector<8xi32>, vector<6xi32>, vector<4xf32>, i32, i32, i32, i32, i32, i32) -> vector<4xf32>
    %226 = "rocdl.mfma.scale.f32.16x16x128.f8f6f4"(%arg172, %arg173, %arg171, %218, %221, %218, %arg170, %218, %arg170) : (vector<8xi32>, vector<6xi32>, vector<4xf32>, i32, i32, i32, i32, i32, i32) -> vector<4xf32>
    %227 = "rocdl.mfma.scale.f32.16x16x128.f8f6f4"(%arg172, %arg174, %arg171, %218, %222, %218, %arg170, %218, %arg170) : (vector<8xi32>, vector<4xi32>, vector<4xf32>, i32, i32, i32, i32, i32, i32) -> vector<4xf32>
    %228 = "rocdl.mfma.scale.f32.16x16x128.f8f6f4"(%arg172, %arg172, %arg171, %219, %218, %218, %arg170, %218, %arg170) : (vector<8xi32>, vector<8xi32>, vector<4xf32>, i32, i32, i32, i32, i32, i32) -> vector<4xf32>
    %229 = "rocdl.mfma.scale.f32.16x16x128.f8f6f4"(%arg172, %arg172, %arg171, %219, %219, %218, %arg170, %218, %arg170) : (vector<8xi32>, vector<8xi32>, vector<4xf32>, i32, i32, i32, i32, i32, i32) -> vector<4xf32>
    %230 = "rocdl.mfma.scale.f32.16x16x128.f8f6f4"(%arg172, %arg173, %arg171, %219, %220, %218, %arg170, %218, %arg170) : (vector<8xi32>, vector<6xi32>, vector<4xf32>, i32, i32, i32, i32, i32, i32) -> vector<4xf32>
    %231 = "rocdl.mfma.scale.f32.16x16x128.f8f6f4"(%arg172, %arg173, %arg171, %219, %221, %218, %arg170, %218, %arg170) : (vector<8xi32>, vector<6xi32>, vector<4xf32>, i32, i32, i32, i32, i32, i32) -> vector<4xf32>
    %232 = "rocdl.mfma.scale.f32.16x16x128.f8f6f4"(%arg172, %arg174, %arg171, %219, %222, %218, %arg170, %218, %arg170) : (vector<8xi32>, vector<4xi32>, vector<4xf32>, i32, i32, i32, i32, i32, i32) -> vector<4xf32>
    %233 = "rocdl.mfma.scale.f32.16x16x128.f8f6f4"(%arg173, %arg172, %arg171, %220, %218, %218, %arg170, %218, %arg170) : (vector<6xi32>, vector<8xi32>, vector<4xf32>, i32, i32, i32, i32, i32, i32) -> vector<4xf32>
    %234 = "rocdl.mfma.scale.f32.16x16x128.f8f6f4"(%arg173, %arg172, %arg171, %220, %219, %218, %arg170, %218, %arg170) : (vector<6xi32>, vector<8xi32>, vector<4xf32>, i32, i32, i32, i32, i32, i32) -> vector<4xf32>
    %235 = "rocdl.mfma.scale.f32.16x16x128.f8f6f4"(%arg173, %arg173, %arg171, %220, %220, %218, %arg170, %218, %arg170) : (vector<6xi32>, vector<6xi32>, vector<4xf32>, i32, i32, i32, i32, i32, i32) -> vector<4xf32>
    %236 = "rocdl.mfma.scale.f32.16x16x128.f8f6f4"(%arg173, %arg173, %arg171, %220, %221, %218, %arg170, %218, %arg170) : (vector<6xi32>, vector<6xi32>, vector<4xf32>, i32, i32, i32, i32, i32, i32) -> vector<4xf32>
    %237 = "rocdl.mfma.scale.f32.16x16x128.f8f6f4"(%arg173, %arg174, %arg171, %220, %222, %218, %arg170, %218, %arg170) : (vector<6xi32>, vector<4xi32>, vector<4xf32>, i32, i32, i32, i32, i32, i32) -> vector<4xf32>
    %238 = "rocdl.mfma.scale.f32.16x16x128.f8f6f4"(%arg173, %arg172, %arg171, %221, %218, %218, %arg170, %218, %arg170) : (vector<6xi32>, vector<8xi32>, vector<4xf32>, i32, i32, i32, i32, i32, i32) -> vector<4xf32>
    %239 = "rocdl.mfma.scale.f32.16x16x128.f8f6f4"(%arg173, %arg172, %arg171, %221, %219, %218, %arg170, %218, %arg170) : (vector<6xi32>, vector<8xi32>, vector<4xf32>, i32, i32, i32, i32, i32, i32) -> vector<4xf32>
    %240 = "rocdl.mfma.scale.f32.16x16x128.f8f6f4"(%arg173, %arg173, %arg171, %221, %220, %218, %arg170, %218, %arg170) : (vector<6xi32>, vector<6xi32>, vector<4xf32>, i32, i32, i32, i32, i32, i32) -> vector<4xf32>
    %241 = "rocdl.mfma.scale.f32.16x16x128.f8f6f4"(%arg173, %arg173, %arg171, %221, %221, %218, %arg170, %218, %arg170) : (vector<6xi32>, vector<6xi32>, vector<4xf32>, i32, i32, i32, i32, i32, i32) -> vector<4xf32>
    %242 = "rocdl.mfma.scale.f32.16x16x128.f8f6f4"(%arg173, %arg174, %arg171, %221, %222, %218, %arg170, %218, %arg170) : (vector<6xi32>, vector<4xi32>, vector<4xf32>, i32, i32, i32, i32, i32, i32) -> vector<4xf32>
    %243 = "rocdl.mfma.scale.f32.16x16x128.f8f6f4"(%arg174, %arg172, %arg171, %222, %218, %218, %arg170, %218, %arg170) : (vector<4xi32>, vector<8xi32>, vector<4xf32>, i32, i32, i32, i32, i32, i32) -> vector<4xf32>
    %244 = "rocdl.mfma.scale.f32.16x16x128.f8f6f4"(%arg174, %arg172, %arg171, %222, %219, %218, %arg170, %218, %arg170) : (vector<4xi32>, vector<8xi32>, vector<4xf32>, i32, i32, i32, i32, i32, i32) -> vector<4xf32>
    %245 = "rocdl.mfma.scale.f32.16x16x128.f8f6f4"(%arg174, %arg173, %arg171, %222, %220, %218, %arg170, %218, %arg170) : (vector<4xi32>, vector<6xi32>, vector<4xf32>, i32, i32, i32, i32, i32, i32) -> vector<4xf32>
    %246 = "rocdl.mfma.scale.f32.16x16x128.f8f6f4"(%arg174, %arg173, %arg171, %222, %221, %218, %arg170, %218, %arg170) : (vector<4xi32>, vector<6xi32>, vector<4xf32>, i32, i32, i32, i32, i32, i32) -> vector<4xf32>
    %247 = "rocdl.mfma.scale.f32.16x16x128.f8f6f4"(%arg174, %arg174, %arg171, %222, %222, %218, %arg170, %218, %arg170) : (vector<4xi32>, vector<4xi32>, vector<4xf32>, i32, i32, i32, i32, i32, i32) -> vector<4xf32>
    "llvm.return"(%223) : (vector<4xf32>) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<vector<8xf32> (vector<8xf32>, vector<16xf16>, vector<16xi16>, vector<8xi32>, vector<2xi32>, vector<4xi32>, vector<4xf32>, vector<8xf16>, vector<8xi16>, vector<32xf16>, vector<16xf32>, vector<4xf32>, vector<32xf32>, vector<64xf32>, vector<64xi32>, vector<64xf16>, vector<16xbf16>, vector<32xbf16>)>, linkage = #llvm.linkage<external>, sym_name = "rocdl.wmma", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg152: vector<8xf32>, %arg153: vector<16xf16>, %arg154: vector<16xi16>, %arg155: vector<8xi32>, %arg156: vector<2xi32>, %arg157: vector<4xi32>, %arg158: vector<4xf32>, %arg159: vector<8xf16>, %arg160: vector<8xi16>, %arg161: vector<32xf16>, %arg162: vector<16xf32>, %arg163: vector<4xf32>, %arg164: vector<32xf32>, %arg165: vector<64xf32>, %arg166: vector<64xi32>, %arg167: vector<64xf16>, %arg168: vector<16xbf16>, %arg169: vector<32xbf16>):
    %171 = "rocdl.wmma.f32.16x16x16.f16"(%arg153, %arg153, %arg152) : (vector<16xf16>, vector<16xf16>, vector<8xf32>) -> vector<8xf32>
    %172 = "rocdl.wmma.f32.16x16x16.bf16"(%arg154, %arg154, %arg152) : (vector<16xi16>, vector<16xi16>, vector<8xf32>) -> vector<8xf32>
    %173 = "rocdl.wmma.f16.16x16x16.f16"(%arg153, %arg153, %arg153) <{opsel = false}> : (vector<16xf16>, vector<16xf16>, vector<16xf16>) -> vector<16xf16>
    %174 = "rocdl.wmma.bf16.16x16x16.bf16"(%arg154, %arg154, %arg154) <{opsel = false}> : (vector<16xi16>, vector<16xi16>, vector<16xi16>) -> vector<16xi16>
    %175 = "rocdl.wmma.i32.16x16x16.iu8"(%arg157, %arg157, %arg155) <{clamp = false, signA = false, signB = false}> : (vector<4xi32>, vector<4xi32>, vector<8xi32>) -> vector<8xi32>
    %176 = "rocdl.wmma.i32.16x16x16.iu4"(%arg156, %arg156, %arg155) <{clamp = false, signA = false, signB = false}> : (vector<2xi32>, vector<2xi32>, vector<8xi32>) -> vector<8xi32>
    %177 = "rocdl.wmma.i32.16x16x32.iu4"(%arg156, %arg156, %arg155) <{clamp = false, signA = false, signB = false}> : (vector<2xi32>, vector<2xi32>, vector<8xi32>) -> vector<8xi32>
    %178 = "rocdl.wmma.i32.16x16x16.iu8"(%arg157, %arg157, %arg155) <{clamp = false, signA = true, signB = false}> : (vector<4xi32>, vector<4xi32>, vector<8xi32>) -> vector<8xi32>
    %179 = "rocdl.wmma.i32.16x16x16.iu8"(%arg157, %arg157, %arg155) <{clamp = false, signA = false, signB = true}> : (vector<4xi32>, vector<4xi32>, vector<8xi32>) -> vector<8xi32>
    %180 = "rocdl.wmma.i32.16x16x16.iu8"(%arg157, %arg157, %arg155) <{clamp = true, signA = true, signB = true}> : (vector<4xi32>, vector<4xi32>, vector<8xi32>) -> vector<8xi32>
    %181 = "rocdl.wmma.i32.16x16x16.iu4"(%arg156, %arg156, %arg155) <{clamp = false, signA = true, signB = false}> : (vector<2xi32>, vector<2xi32>, vector<8xi32>) -> vector<8xi32>
    %182 = "rocdl.wmma.i32.16x16x16.iu4"(%arg156, %arg156, %arg155) <{clamp = true, signA = false, signB = true}> : (vector<2xi32>, vector<2xi32>, vector<8xi32>) -> vector<8xi32>
    %183 = "rocdl.wmma.i32.16x16x32.iu4"(%arg156, %arg156, %arg155) <{clamp = false, signA = true, signB = true}> : (vector<2xi32>, vector<2xi32>, vector<8xi32>) -> vector<8xi32>
    %184 = "rocdl.wmma.f32.16x16x4.f32"(%arg162, %arg162, %arg163) <{modC = 0 : i16, reuseA = false, reuseB = false, signA = false, signB = false}> : (vector<16xf32>, vector<16xf32>, vector<4xf32>) -> vector<4xf32>
    %185 = "rocdl.wmma.f32.16x16x32.f16"(%arg153, %arg153, %arg164) <{modC = 0 : i16, reuseA = false, reuseB = false, signA = false, signB = false}> : (vector<16xf16>, vector<16xf16>, vector<32xf32>) -> vector<32xf32>
    %186 = "rocdl.wmma.f32.16x16x32.bf16"(%arg168, %arg168, %arg164) <{modC = 0 : i16, reuseA = false, reuseB = false, signA = false, signB = false}> : (vector<16xbf16>, vector<16xbf16>, vector<32xf32>) -> vector<32xf32>
    %187 = "rocdl.wmma.f16.16x16x32.f16"(%arg153, %arg153, %arg161) <{modC = 0 : i16, reuseA = false, reuseB = false, signA = false, signB = false}> : (vector<16xf16>, vector<16xf16>, vector<32xf16>) -> vector<32xf16>
    %188 = "rocdl.wmma.bf16.16x16x32.bf16"(%arg168, %arg168, %arg169) <{modC = 0 : i16, reuseA = false, reuseB = false, signA = false, signB = false}> : (vector<16xbf16>, vector<16xbf16>, vector<32xbf16>) -> vector<32xbf16>
    %189 = "rocdl.wmma.bf16f32.16x16x32.bf16"(%arg168, %arg168, %arg164) <{modC = 0 : i16, reuseA = false, reuseB = false, signA = false, signB = false}> : (vector<16xbf16>, vector<16xbf16>, vector<32xf32>) -> vector<32xbf16>
    %190 = "rocdl.wmma.f32.16x16x64.fp8_fp8"(%arg157, %arg157, %arg165) <{modC = 0 : i16, reuseA = false, reuseB = false}> {signA = false, signB = false} : (vector<4xi32>, vector<4xi32>, vector<64xf32>) -> vector<64xf32>
    %191 = "rocdl.wmma.f32.16x16x64.fp8_bf8"(%arg157, %arg157, %arg165) <{modC = 0 : i16, reuseA = false, reuseB = false}> {signA = false, signB = false} : (vector<4xi32>, vector<4xi32>, vector<64xf32>) -> vector<64xf32>
    %192 = "rocdl.wmma.f32.16x16x64.bf8_fp8"(%arg157, %arg157, %arg165) <{modC = 0 : i16, reuseA = false, reuseB = false}> {signA = false, signB = false} : (vector<4xi32>, vector<4xi32>, vector<64xf32>) -> vector<64xf32>
    %193 = "rocdl.wmma.f32.16x16x64.bf8_bf8"(%arg157, %arg157, %arg165) <{modC = 0 : i16, reuseA = false, reuseB = false}> {signA = false, signB = false} : (vector<4xi32>, vector<4xi32>, vector<64xf32>) -> vector<64xf32>
    %194 = "rocdl.wmma.f16.16x16x64.fp8_fp8"(%arg157, %arg157, %arg167) <{modC = 0 : i16, reuseA = false, reuseB = false}> {signA = false, signB = false} : (vector<4xi32>, vector<4xi32>, vector<64xf16>) -> vector<64xf16>
    %195 = "rocdl.wmma.f16.16x16x64.fp8_bf8"(%arg157, %arg157, %arg167) <{modC = 0 : i16, reuseA = false, reuseB = false}> {signA = false, signB = false} : (vector<4xi32>, vector<4xi32>, vector<64xf16>) -> vector<64xf16>
    %196 = "rocdl.wmma.f16.16x16x64.bf8_fp8"(%arg157, %arg157, %arg167) <{modC = 0 : i16, reuseA = false, reuseB = false}> {signA = false, signB = false} : (vector<4xi32>, vector<4xi32>, vector<64xf16>) -> vector<64xf16>
    %197 = "rocdl.wmma.f16.16x16x64.bf8_bf8"(%arg157, %arg157, %arg167) <{modC = 0 : i16, reuseA = false, reuseB = false}> {signA = false, signB = false} : (vector<4xi32>, vector<4xi32>, vector<64xf16>) -> vector<64xf16>
    %198 = "rocdl.wmma.f32.16x16x128.fp8_fp8"(%arg157, %arg157, %arg165) <{modC = 0 : i16, reuseA = false, reuseB = false}> {signA = false, signB = false} : (vector<4xi32>, vector<4xi32>, vector<64xf32>) -> vector<64xf32>
    %199 = "rocdl.wmma.f32.16x16x128.fp8_bf8"(%arg157, %arg157, %arg165) <{modC = 0 : i16, reuseA = false, reuseB = false}> {signA = false, signB = false} : (vector<4xi32>, vector<4xi32>, vector<64xf32>) -> vector<64xf32>
    %200 = "rocdl.wmma.f32.16x16x128.bf8_fp8"(%arg157, %arg157, %arg165) <{modC = 0 : i16, reuseA = false, reuseB = false}> {signA = false, signB = false} : (vector<4xi32>, vector<4xi32>, vector<64xf32>) -> vector<64xf32>
    %201 = "rocdl.wmma.f32.16x16x128.bf8_bf8"(%arg157, %arg157, %arg165) <{modC = 0 : i16, reuseA = false, reuseB = false}> {signA = false, signB = false} : (vector<4xi32>, vector<4xi32>, vector<64xf32>) -> vector<64xf32>
    %202 = "rocdl.wmma.f16.16x16x128.fp8_fp8"(%arg157, %arg157, %arg167) <{modC = 0 : i16, reuseA = false, reuseB = false}> {signA = false, signB = false} : (vector<4xi32>, vector<4xi32>, vector<64xf16>) -> vector<64xf16>
    %203 = "rocdl.wmma.f16.16x16x128.fp8_bf8"(%arg157, %arg157, %arg167) <{modC = 0 : i16, reuseA = false, reuseB = false}> {signA = false, signB = false} : (vector<4xi32>, vector<4xi32>, vector<64xf16>) -> vector<64xf16>
    %204 = "rocdl.wmma.f16.16x16x128.bf8_fp8"(%arg157, %arg157, %arg167) <{modC = 0 : i16, reuseA = false, reuseB = false}> {signA = false, signB = false} : (vector<4xi32>, vector<4xi32>, vector<64xf16>) -> vector<64xf16>
    %205 = "rocdl.wmma.f16.16x16x128.bf8_bf8"(%arg157, %arg157, %arg167) <{modC = 0 : i16, reuseA = false, reuseB = false}> {signA = false, signB = false} : (vector<4xi32>, vector<4xi32>, vector<64xf16>) -> vector<64xf16>
    %206 = "rocdl.wmma.i32.16x16x64.iu8"(%arg157, %arg157, %arg166) <{clamp = false, reuseA = false, reuseB = false, signA = false, signB = false}> : (vector<4xi32>, vector<4xi32>, vector<64xi32>) -> vector<64xi32>
    %207 = "rocdl.wmma.i32.16x16x64.iu8"(%arg157, %arg157, %arg166) <{clamp = false, reuseA = false, reuseB = false, signA = true, signB = true}> : (vector<4xi32>, vector<4xi32>, vector<64xi32>) -> vector<64xi32>
    %208 = "rocdl.wmma.i32.16x16x64.iu8"(%arg157, %arg157, %arg166) <{clamp = false, reuseA = true, reuseB = true, signA = true, signB = false}> : (vector<4xi32>, vector<4xi32>, vector<64xi32>) -> vector<64xi32>
    %209 = "rocdl.wmma.f32.16x16x4.f32"(%arg162, %arg162, %arg163) <{modC = 1 : i16, reuseA = false, reuseB = false, signA = true, signB = true}> : (vector<16xf32>, vector<16xf32>, vector<4xf32>) -> vector<4xf32>
    %210 = "rocdl.wmma.f32.16x16x32.f16"(%arg153, %arg153, %arg164) <{modC = 2 : i16, reuseA = true, reuseB = false, signA = false, signB = true}> : (vector<16xf16>, vector<16xf16>, vector<32xf32>) -> vector<32xf32>
    %211 = "rocdl.wmma.f32.16x16x32.bf16"(%arg168, %arg168, %arg164) <{modC = 3 : i16, reuseA = false, reuseB = true, signA = true, signB = true}> : (vector<16xbf16>, vector<16xbf16>, vector<32xf32>) -> vector<32xf32>
    %212 = "rocdl.wmma.f32.16x16x16.f16"(%arg153, %arg153, %arg158) : (vector<16xf16>, vector<16xf16>, vector<4xf32>) -> vector<4xf32>
    %213 = "rocdl.wmma.f32.16x16x16.bf16"(%arg154, %arg154, %arg158) : (vector<16xi16>, vector<16xi16>, vector<4xf32>) -> vector<4xf32>
    %214 = "rocdl.wmma.f16.16x16x16.f16"(%arg153, %arg153, %arg159) <{opsel = false}> : (vector<16xf16>, vector<16xf16>, vector<8xf16>) -> vector<8xf16>
    %215 = "rocdl.wmma.bf16.16x16x16.bf16"(%arg154, %arg154, %arg160) <{opsel = false}> : (vector<16xi16>, vector<16xi16>, vector<8xi16>) -> vector<8xi16>
    %216 = "rocdl.wmma.i32.16x16x16.iu8"(%arg157, %arg157, %arg157) <{clamp = true, signA = false, signB = false}> : (vector<4xi32>, vector<4xi32>, vector<4xi32>) -> vector<4xi32>
    %217 = "rocdl.wmma.i32.16x16x16.iu4"(%arg156, %arg156, %arg157) <{clamp = true, signA = false, signB = false}> : (vector<2xi32>, vector<2xi32>, vector<4xi32>) -> vector<4xi32>
    "llvm.return"(%171) : (vector<8xf32>) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<vector<4xf16> (ptr<3>)>, linkage = #llvm.linkage<external>, sym_name = "rocdl.ds.read.tr", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg151: !llvm.ptr<3>):
    %166 = "rocdl.ds.read.tr4.b64"(%arg151) : (!llvm.ptr<3>) -> vector<2xi32>
    %167 = "rocdl.ds.read.tr6.b96"(%arg151) : (!llvm.ptr<3>) -> vector<3xi32>
    %168 = "rocdl.ds.read.tr8.b64"(%arg151) : (!llvm.ptr<3>) -> vector<2xi32>
    %169 = "rocdl.ds.read.tr16.b64"(%arg151) : (!llvm.ptr<3>) -> vector<4xf16>
    %170 = "rocdl.ds.read.tr16.b64"(%arg151) : (!llvm.ptr<3>) -> vector<4xbf16>
    "llvm.return"(%169) : (vector<4xf16>) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr<1>, ptr<3>)>, linkage = #llvm.linkage<external>, sym_name = "rocdl.load.tr.ops", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg149: !llvm.ptr<1>, %arg150: !llvm.ptr<3>):
    %154 = "rocdl.global.load.tr4.b64"(%arg149) : (!llvm.ptr<1>) -> vector<2xi32>
    %155 = "rocdl.global.load.tr.b64"(%arg149) : (!llvm.ptr<1>) -> vector<2xi32>
    %156 = "rocdl.global.load.tr6.b96"(%arg149) : (!llvm.ptr<1>) -> vector<3xi32>
    %157 = "rocdl.global.load.tr.b128"(%arg149) : (!llvm.ptr<1>) -> vector<8xi16>
    %158 = "rocdl.global.load.tr.b128"(%arg149) : (!llvm.ptr<1>) -> vector<8xf16>
    %159 = "rocdl.global.load.tr.b128"(%arg149) : (!llvm.ptr<1>) -> vector<8xbf16>
    %160 = "rocdl.ds.load.tr4.b64"(%arg150) : (!llvm.ptr<3>) -> vector<2xi32>
    %161 = "rocdl.ds.load.tr8.b64"(%arg150) : (!llvm.ptr<3>) -> vector<2xi32>
    %162 = "rocdl.ds.load.tr6.b96"(%arg150) : (!llvm.ptr<3>) -> vector<3xi32>
    %163 = "rocdl.ds.load.tr16.b128"(%arg150) : (!llvm.ptr<3>) -> vector<8xi16>
    %164 = "rocdl.ds.load.tr16.b128"(%arg150) : (!llvm.ptr<3>) -> vector<8xf16>
    %165 = "rocdl.ds.load.tr16.b128"(%arg150) : (!llvm.ptr<3>) -> vector<8xbf16>
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr<7>, ptr<3>)>, linkage = #llvm.linkage<external>, sym_name = "rocdl.load.to.lds", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg147: !llvm.ptr<7>, %arg148: !llvm.ptr<3>):
    "rocdl.load.to.lds"(%arg147, %arg148) <{aux = 0 : i32, offset = 0 : i32, size = 4 : i32}> : (!llvm.ptr<7>, !llvm.ptr<3>) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr<1>, ptr<3>)>, linkage = #llvm.linkage<external>, sym_name = "rocdl.global.load.lds", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg145: !llvm.ptr<1>, %arg146: !llvm.ptr<3>):
    "rocdl.global.load.lds"(%arg145, %arg146) <{aux = 0 : i32, offset = 0 : i32, size = 4 : i32}> : (!llvm.ptr<1>, !llvm.ptr<3>) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr<1>, ptr<3>)>, linkage = #llvm.linkage<external>, sym_name = "rocdl.global.load.async.to.lds", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg143: !llvm.ptr<1>, %arg144: !llvm.ptr<3>):
    "rocdl.global.load.async.to.lds.b8"(%arg143, %arg144) <{aux = 0 : i32, offset = 0 : i32}> : (!llvm.ptr<1>, !llvm.ptr<3>) -> ()
    "rocdl.global.load.async.to.lds.b32"(%arg143, %arg144) <{aux = 0 : i32, offset = 0 : i32}> : (!llvm.ptr<1>, !llvm.ptr<3>) -> ()
    "rocdl.global.load.async.to.lds.b64"(%arg143, %arg144) <{aux = 0 : i32, offset = 0 : i32}> : (!llvm.ptr<1>, !llvm.ptr<3>) -> ()
    "rocdl.global.load.async.to.lds.b128"(%arg143, %arg144) <{aux = 0 : i32, offset = 0 : i32}> : (!llvm.ptr<1>, !llvm.ptr<3>) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr<1>, ptr<3>, i32)>, linkage = #llvm.linkage<external>, sym_name = "rocdl.cluster.load.async.to.lds", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg140: !llvm.ptr<1>, %arg141: !llvm.ptr<3>, %arg142: i32):
    "rocdl.cluster.load.async.to.lds.b8"(%arg140, %arg141, %arg142) <{cpol = 0 : i32, offset = 0 : i32}> : (!llvm.ptr<1>, !llvm.ptr<3>, i32) -> ()
    "rocdl.cluster.load.async.to.lds.b32"(%arg140, %arg141, %arg142) <{cpol = 0 : i32, offset = 0 : i32}> : (!llvm.ptr<1>, !llvm.ptr<3>, i32) -> ()
    "rocdl.cluster.load.async.to.lds.b64"(%arg140, %arg141, %arg142) <{cpol = 0 : i32, offset = 0 : i32}> : (!llvm.ptr<1>, !llvm.ptr<3>, i32) -> ()
    "rocdl.cluster.load.async.to.lds.b128"(%arg140, %arg141, %arg142) <{cpol = 0 : i32, offset = 0 : i32}> : (!llvm.ptr<1>, !llvm.ptr<3>, i32) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (vector<4xi32>, vector<8xi32>, vector<4xi32>, vector<4xi32>)>, linkage = #llvm.linkage<external>, sym_name = "rocdl.tensor.load.to.lds", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg136: vector<4xi32>, %arg137: vector<8xi32>, %arg138: vector<4xi32>, %arg139: vector<4xi32>):
    "rocdl.tensor.load.to.lds"(%arg136, %arg137, %arg138, %arg139) <{cachePolicy = 0 : i32}> : (vector<4xi32>, vector<8xi32>, vector<4xi32>, vector<4xi32>) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (vector<4xi32>, vector<8xi32>, vector<4xi32>, vector<4xi32>)>, linkage = #llvm.linkage<external>, sym_name = "rocdl.tensor.store.from.lds", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg132: vector<4xi32>, %arg133: vector<8xi32>, %arg134: vector<4xi32>, %arg135: vector<4xi32>):
    "rocdl.tensor.store.from.lds"(%arg132, %arg133, %arg134, %arg135) <{cachePolicy = 0 : i32}> : (vector<4xi32>, vector<8xi32>, vector<4xi32>, vector<4xi32>) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (vector<4xi32>, vector<8xi32>)>, linkage = #llvm.linkage<external>, sym_name = "rocdl.tensor.load.to.lds.d2", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg130: vector<4xi32>, %arg131: vector<8xi32>):
    "rocdl.tensor.load.to.lds.d2"(%arg130, %arg131) <{cachePolicy = 0 : i32}> : (vector<4xi32>, vector<8xi32>) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (vector<4xi32>, vector<8xi32>)>, linkage = #llvm.linkage<external>, sym_name = "rocdl.tensor.store.from.lds.d2", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg128: vector<4xi32>, %arg129: vector<8xi32>):
    "rocdl.tensor.store.from.lds.d2"(%arg128, %arg129) <{cachePolicy = 0 : i32}> : (vector<4xi32>, vector<8xi32>) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<ptr<8> (ptr, i16, i64, i32)>, linkage = #llvm.linkage<external>, sym_name = "rocdl.make.buffer.rsrc", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg124: !llvm.ptr, %arg125: i16, %arg126: i64, %arg127: i32):
    %153 = "rocdl.make.buffer.rsrc"(%arg124, %arg125, %arg126, %arg127) : (!llvm.ptr, i16, i64, i32) -> !llvm.ptr<8>
    "llvm.return"(%153) : (!llvm.ptr<8>) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<ptr<7> (ptr<1>, i16, i64, i32)>, linkage = #llvm.linkage<external>, sym_name = "rocdl.make.buffer.rsrc.p7.p1", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg120: !llvm.ptr<1>, %arg121: i16, %arg122: i64, %arg123: i32):
    %152 = "rocdl.make.buffer.rsrc"(%arg120, %arg121, %arg122, %arg123) : (!llvm.ptr<1>, i16, i64, i32) -> !llvm.ptr<7>
    "llvm.return"(%152) : (!llvm.ptr<7>) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<f32 (f32, i32, vector<2xf32>, vector<2xi32>)>, linkage = #llvm.linkage<external>, sym_name = "rocdl.permlanex16", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg116: f32, %arg117: i32, %arg118: vector<2xf32>, %arg119: vector<2xi32>):
    %147 = "llvm.mlir.constant"() <{value = -1 : i32}> : () -> i32
    %148 = "rocdl.permlanex16"(%arg116, %arg116, %147, %147) <{boundControl = true, fi = false}> : (f32, f32, i32, i32) -> f32
    %149 = "rocdl.permlanex16"(%arg117, %arg117, %147, %147) <{boundControl = true, fi = false}> : (i32, i32, i32, i32) -> i32
    %150 = "rocdl.permlanex16"(%arg118, %arg118, %147, %147) <{boundControl = true, fi = false}> : (vector<2xf32>, vector<2xf32>, i32, i32) -> vector<2xf32>
    %151 = "rocdl.permlanex16"(%arg119, %arg119, %147, %147) <{boundControl = true, fi = false}> : (vector<2xi32>, vector<2xi32>, i32, i32) -> vector<2xi32>
    "llvm.return"(%148) : (f32) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<struct<(i32, i32)> (i32)>, linkage = #llvm.linkage<external>, sym_name = "rocdl.permlane16.swap", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg115: i32):
    %146 = "rocdl.permlane16.swap"(%arg115, %arg115) <{boundControl = true, fi = false}> : (i32, i32) -> !llvm.struct<(i32, i32)>
    "llvm.return"(%146) : (!llvm.struct<(i32, i32)>) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<struct<(i32, i32)> (i32)>, linkage = #llvm.linkage<external>, sym_name = "rocdl.permlane32.swap", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg114: i32):
    %145 = "rocdl.permlane32.swap"(%arg114, %arg114) <{boundControl = true, fi = false}> : (i32, i32) -> !llvm.struct<(i32, i32)>
    "llvm.return"(%145) : (!llvm.struct<(i32, i32)>) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<vector<8xf32> (vector<2xi32>, vector<8xf32>)>, linkage = #llvm.linkage<external>, sym_name = "rocdl.wmma.fp8", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg112: vector<2xi32>, %arg113: vector<8xf32>):
    %141 = "rocdl.wmma.f32.16x16x16.fp8_fp8"(%arg112, %arg112, %arg113) : (vector<2xi32>, vector<2xi32>, vector<8xf32>) -> vector<8xf32>
    %142 = "rocdl.wmma.f32.16x16x16.fp8_bf8"(%arg112, %arg112, %arg113) : (vector<2xi32>, vector<2xi32>, vector<8xf32>) -> vector<8xf32>
    %143 = "rocdl.wmma.f32.16x16x16.bf8_bf8"(%arg112, %arg112, %arg113) : (vector<2xi32>, vector<2xi32>, vector<8xf32>) -> vector<8xf32>
    %144 = "rocdl.wmma.f32.16x16x16.bf8_fp8"(%arg112, %arg112, %arg113) : (vector<2xi32>, vector<2xi32>, vector<8xf32>) -> vector<8xf32>
    "llvm.return"(%141) : (vector<8xf32>) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr<8>, i32, i32, i32, vector<2xi32>, vector<4xi32>)>, linkage = #llvm.linkage<external>, sym_name = "rocdl.raw.ptr.buffer", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg106: !llvm.ptr<8>, %arg107: i32, %arg108: i32, %arg109: i32, %arg110: vector<2xi32>, %arg111: vector<4xi32>):
    %137 = "llvm.mlir.constant"() <{value = 0 : i32}> : () -> i32
    %138 = "rocdl.raw.ptr.buffer.load"(%arg106, %arg107, %arg108, %137) : (!llvm.ptr<8>, i32, i32, i32) -> i32
    %139 = "rocdl.raw.ptr.buffer.load"(%arg106, %arg107, %arg108, %137) : (!llvm.ptr<8>, i32, i32, i32) -> vector<2xi32>
    %140 = "rocdl.raw.ptr.buffer.load"(%arg106, %arg107, %arg108, %137) : (!llvm.ptr<8>, i32, i32, i32) -> vector<4xi32>
    "rocdl.raw.ptr.buffer.store"(%arg109, %arg106, %arg107, %arg108, %137) : (i32, !llvm.ptr<8>, i32, i32, i32) -> ()
    "rocdl.raw.ptr.buffer.store"(%arg110, %arg106, %arg107, %arg108, %137) : (vector<2xi32>, !llvm.ptr<8>, i32, i32, i32) -> ()
    "rocdl.raw.ptr.buffer.store"(%arg111, %arg106, %arg107, %arg108, %137) : (vector<4xi32>, !llvm.ptr<8>, i32, i32, i32) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr<8>, ptr<3>, i32, i32)>, linkage = #llvm.linkage<external>, sym_name = "rocdl.raw.ptr.buffer.load.lds", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg102: !llvm.ptr<8>, %arg103: !llvm.ptr<3>, %arg104: i32, %arg105: i32):
    %134 = "llvm.mlir.constant"() <{value = 4 : i32}> : () -> i32
    %135 = "llvm.mlir.constant"() <{value = 128 : i32}> : () -> i32
    %136 = "llvm.mlir.constant"() <{value = 1 : i32}> : () -> i32
    "rocdl.raw.ptr.buffer.load.lds"(%arg102, %arg103, %134, %arg104, %arg105, %135, %136) : (!llvm.ptr<8>, !llvm.ptr<3>, i32, i32, i32, i32, i32) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr<1>)>, linkage = #llvm.linkage<external>, sym_name = "rocdl.global.prefetch", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg101: !llvm.ptr<1>):
    "rocdl.global.prefetch"(%arg101) <{scope = 0 : i32}> : (!llvm.ptr<1>) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr)>, linkage = #llvm.linkage<external>, sym_name = "rocdl.flat.prefetch", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg100: !llvm.ptr):
    "rocdl.flat.prefetch"(%arg100) <{scope = 0 : i32}> : (!llvm.ptr) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr<3>, i64)>, linkage = #llvm.linkage<external>, sym_name = "rocdl.atomic.barriers.arrive", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg98: !llvm.ptr<3>, %arg99: i64):
    "rocdl.ds.atomic.async.barrier.arrive.b64"(%arg98) : (!llvm.ptr<3>) -> ()
    %133 = "rocdl.ds.atomic.barrier.arrive.rtn.b64"(%arg98, %arg99) : (!llvm.ptr<3>, i64) -> i64
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<vector<4xf32> (i32, vector<4xf32>, vector<8xi32>, vector<12xi32>, vector<16xi32>, i64, vector<8xf32>)>, linkage = #llvm.linkage<external>, sym_name = "rocdl.wmma.scale", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg91: i32, %arg92: vector<4xf32>, %arg93: vector<8xi32>, %arg94: vector<12xi32>, %arg95: vector<16xi32>, %arg96: i64, %arg97: vector<8xf32>):
    %122 = "rocdl.wmma.scale.f32.16x16x128.f8f6f4"(%arg95, %arg95, %arg92, %arg91, %arg91) <{fmtA = 0 : i32, fmtB = 0 : i32, fmtScaleA = 0 : i32, fmtScaleB = 0 : i32, modC = 0 : i16, reuseA = false, reuseB = false, scaleAType = 0 : i32, scaleBType = 0 : i32}> : (vector<16xi32>, vector<16xi32>, vector<4xf32>, i32, i32) -> vector<4xf32>
    %123 = "rocdl.wmma.scale.f32.16x16x128.f8f6f4"(%arg95, %arg95, %arg92, %arg91, %arg91) <{fmtA = 0 : i32, fmtB = 1 : i32, fmtScaleA = 1 : i32, fmtScaleB = 1 : i32, modC = 0 : i16, reuseA = false, reuseB = false, scaleAType = 1 : i32, scaleBType = 1 : i32}> : (vector<16xi32>, vector<16xi32>, vector<4xf32>, i32, i32) -> vector<4xf32>
    %124 = "rocdl.wmma.scale.f32.16x16x128.f8f6f4"(%arg95, %arg94, %arg92, %arg91, %arg91) <{fmtA = 0 : i32, fmtB = 2 : i32, fmtScaleA = 2 : i32, fmtScaleB = 2 : i32, modC = 1 : i16, reuseA = false, reuseB = false, scaleAType = 2 : i32, scaleBType = 2 : i32}> : (vector<16xi32>, vector<12xi32>, vector<4xf32>, i32, i32) -> vector<4xf32>
    %125 = "rocdl.wmma.scale.f32.16x16x128.f8f6f4"(%arg95, %arg94, %arg92, %arg91, %arg91) <{fmtA = 1 : i32, fmtB = 3 : i32, fmtScaleA = 0 : i32, fmtScaleB = 0 : i32, modC = 2 : i16, reuseA = false, reuseB = false, scaleAType = 0 : i32, scaleBType = 0 : i32}> : (vector<16xi32>, vector<12xi32>, vector<4xf32>, i32, i32) -> vector<4xf32>
    %126 = "rocdl.wmma.scale.f32.16x16x128.f8f6f4"(%arg95, %arg93, %arg92, %arg91, %arg91) <{fmtA = 0 : i32, fmtB = 4 : i32, fmtScaleA = 3 : i32, fmtScaleB = 3 : i32, modC = 3 : i16, reuseA = false, reuseB = false, scaleAType = 3 : i32, scaleBType = 3 : i32}> : (vector<16xi32>, vector<8xi32>, vector<4xf32>, i32, i32) -> vector<4xf32>
    %127 = "rocdl.wmma.scale.f32.16x16x128.f8f6f4"(%arg95, %arg95, %arg92, %arg91, %arg91) <{fmtA = 2 : i32, fmtB = 2 : i32, fmtScaleA = 0 : i32, fmtScaleB = 0 : i32, modC = 0 : i16, reuseA = true, reuseB = false, scaleAType = 0 : i32, scaleBType = 0 : i32}> : (vector<16xi32>, vector<16xi32>, vector<4xf32>, i32, i32) -> vector<4xf32>
    %128 = "rocdl.wmma.scale.f32.16x16x128.f8f6f4"(%arg95, %arg95, %arg92, %arg91, %arg91) <{fmtA = 3 : i32, fmtB = 3 : i32, fmtScaleA = 0 : i32, fmtScaleB = 0 : i32, modC = 0 : i16, reuseA = false, reuseB = true, scaleAType = 0 : i32, scaleBType = 0 : i32}> : (vector<16xi32>, vector<16xi32>, vector<4xf32>, i32, i32) -> vector<4xf32>
    %129 = "rocdl.wmma.scale.f32.16x16x128.f8f6f4"(%arg95, %arg95, %arg92, %arg91, %arg91) <{fmtA = 4 : i32, fmtB = 4 : i32, fmtScaleA = 1 : i32, fmtScaleB = 1 : i32, modC = 1 : i16, reuseA = true, reuseB = true, scaleAType = 1 : i32, scaleBType = 1 : i32}> : (vector<16xi32>, vector<16xi32>, vector<4xf32>, i32, i32) -> vector<4xf32>
    %130 = "rocdl.wmma.scale16.f32.16x16x128.f8f6f4"(%arg95, %arg95, %arg92, %arg96, %arg96) <{fmtA = 0 : i32, fmtB = 1 : i32, fmtScaleA = 2 : i32, fmtScaleB = 2 : i32, modC = 2 : i16, reuseA = false, reuseB = false, scaleAType = 2 : i32, scaleBType = 2 : i32}> : (vector<16xi32>, vector<16xi32>, vector<4xf32>, i64, i64) -> vector<4xf32>
    %131 = "rocdl.wmma.scale.f32.32x16x128.f4"(%arg95, %arg93, %arg97, %arg91, %arg91) <{fmtScaleA = 1 : i32, fmtScaleB = 1 : i32, modC = 0 : i16, reuseA = false, reuseB = false, scaleAType = 1 : i32, scaleBType = 1 : i32}> : (vector<16xi32>, vector<8xi32>, vector<8xf32>, i32, i32) -> vector<8xf32>
    %132 = "rocdl.wmma.scale16.f32.32x16x128.f4"(%arg95, %arg93, %arg97, %arg96, %arg96) <{fmtScaleA = 3 : i32, fmtScaleB = 2 : i32, modC = 3 : i16, reuseA = true, reuseB = true, scaleAType = 2 : i32, scaleBType = 3 : i32}> : (vector<16xi32>, vector<8xi32>, vector<8xf32>, i64, i64) -> vector<8xf32>
    "llvm.return"(%122) : (vector<4xf32>) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr<8>, i32, i32, f32)>, linkage = #llvm.linkage<external>, sym_name = "rocdl.raw.ptr.buffer.atomic.f32", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg87: !llvm.ptr<8>, %arg88: i32, %arg89: i32, %arg90: f32):
    %121 = "llvm.mlir.constant"() <{value = 0 : i32}> : () -> i32
    "rocdl.raw.ptr.buffer.atomic.fadd"(%arg90, %arg87, %arg88, %arg89, %121) : (f32, !llvm.ptr<8>, i32, i32, i32) -> ()
    "rocdl.raw.ptr.buffer.atomic.fmax"(%arg90, %arg87, %arg88, %arg89, %121) : (f32, !llvm.ptr<8>, i32, i32, i32) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr<8>, i32, i32, i32)>, linkage = #llvm.linkage<external>, sym_name = "rocdl.raw.ptr.buffer.atomic.i32", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg83: !llvm.ptr<8>, %arg84: i32, %arg85: i32, %arg86: i32):
    %120 = "llvm.mlir.constant"() <{value = 0 : i32}> : () -> i32
    "rocdl.raw.ptr.buffer.atomic.smax"(%arg86, %arg83, %arg84, %arg85, %120) : (i32, !llvm.ptr<8>, i32, i32, i32) -> ()
    "rocdl.raw.ptr.buffer.atomic.umin"(%arg86, %arg83, %arg84, %arg85, %120) : (i32, !llvm.ptr<8>, i32, i32, i32) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<i32 (ptr<8>, i32, i32, i32, i32)>, linkage = #llvm.linkage<external>, sym_name = "rocdl.raw.ptr.buffer.atomic.cmpswap", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg78: !llvm.ptr<8>, %arg79: i32, %arg80: i32, %arg81: i32, %arg82: i32):
    %118 = "llvm.mlir.constant"() <{value = 0 : i32}> : () -> i32
    %119 = "rocdl.raw.ptr.buffer.atomic.cmpswap"(%arg81, %arg82, %arg78, %arg79, %arg80, %118) : (i32, i32, !llvm.ptr<8>, i32, i32, i32) -> i32
    "llvm.return"(%119) : (i32) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (vector<4xi32>, i32, i32, i32, vector<2xi32>, vector<4xi32>)>, linkage = #llvm.linkage<external>, sym_name = "rocdl.raw.buffer", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg72: vector<4xi32>, %arg73: i32, %arg74: i32, %arg75: i32, %arg76: vector<2xi32>, %arg77: vector<4xi32>):
    %114 = "llvm.mlir.constant"() <{value = 0 : i32}> : () -> i32
    %115 = "rocdl.raw.buffer.load"(%arg72, %arg73, %arg74, %114) : (vector<4xi32>, i32, i32, i32) -> i32
    %116 = "rocdl.raw.buffer.load"(%arg72, %arg73, %arg74, %114) : (vector<4xi32>, i32, i32, i32) -> vector<2xi32>
    %117 = "rocdl.raw.buffer.load"(%arg72, %arg73, %arg74, %114) : (vector<4xi32>, i32, i32, i32) -> vector<4xi32>
    "rocdl.raw.buffer.store"(%arg75, %arg72, %arg73, %arg74, %114) : (i32, vector<4xi32>, i32, i32, i32) -> ()
    "rocdl.raw.buffer.store"(%arg76, %arg72, %arg73, %arg74, %114) : (vector<2xi32>, vector<4xi32>, i32, i32, i32) -> ()
    "rocdl.raw.buffer.store"(%arg77, %arg72, %arg73, %arg74, %114) : (vector<4xi32>, vector<4xi32>, i32, i32, i32) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (vector<4xi32>, i32, i32, f32)>, linkage = #llvm.linkage<external>, sym_name = "rocdl.raw.buffer.atomic.f32", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg68: vector<4xi32>, %arg69: i32, %arg70: i32, %arg71: f32):
    %113 = "llvm.mlir.constant"() <{value = 0 : i32}> : () -> i32
    "rocdl.raw.buffer.atomic.fadd"(%arg71, %arg68, %arg69, %arg70, %113) : (f32, vector<4xi32>, i32, i32, i32) -> ()
    "rocdl.raw.buffer.atomic.fmax"(%arg71, %arg68, %arg69, %arg70, %113) : (f32, vector<4xi32>, i32, i32, i32) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (vector<4xi32>, i32, i32, i32)>, linkage = #llvm.linkage<external>, sym_name = "rocdl.raw.buffer.atomic.i32", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg64: vector<4xi32>, %arg65: i32, %arg66: i32, %arg67: i32):
    %112 = "llvm.mlir.constant"() <{value = 0 : i32}> : () -> i32
    "rocdl.raw.buffer.atomic.smax"(%arg67, %arg64, %arg65, %arg66, %112) : (i32, vector<4xi32>, i32, i32, i32) -> ()
    "rocdl.raw.buffer.atomic.umin"(%arg67, %arg64, %arg65, %arg66, %112) : (i32, vector<4xi32>, i32, i32, i32) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<i32 (vector<4xi32>, i32, i32, i32, i32)>, linkage = #llvm.linkage<external>, sym_name = "rocdl.raw.buffer.atomic.cmpswap", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg59: vector<4xi32>, %arg60: i32, %arg61: i32, %arg62: i32, %arg63: i32):
    %110 = "llvm.mlir.constant"() <{value = 0 : i32}> : () -> i32
    %111 = "rocdl.raw.buffer.atomic.cmpswap"(%arg62, %arg63, %arg59, %arg60, %arg61, %110) : (i32, i32, vector<4xi32>, i32, i32, i32) -> i32
    "llvm.return"(%111) : (i32) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<i32 (i32, f16, bf16, vector<2xf16>, i32)>, linkage = #llvm.linkage<external>, sym_name = "rocdl_8bit_floats", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg54: i32, %arg55: f16, %arg56: bf16, %arg57: vector<2xf16>, %arg58: i32):
    %85 = "llvm.mlir.constant"() <{value = 1.000000e+00 : f32}> : () -> f32
    %86 = "llvm.mlir.constant"() <{value = false}> : () -> i1
    %87 = "rocdl.cvt.f32.bf8"(%arg54) <{byteSel = 0 : i32}> : (i32) -> f32
    %88 = "rocdl.cvt.scalef32.f32.bf8"(%arg54, %85) <{srcSelIndex = 0 : i32}> : (i32, f32) -> f32
    %89 = "rocdl.cvt.f32.fp8"(%arg54) <{byteSel = 0 : i32}> : (i32) -> f32
    %90 = "rocdl.cvt.scalef32.f32.fp8"(%arg54, %85) <{srcSelIndex = 0 : i32}> : (i32, f32) -> f32
    %91 = "rocdl.cvt.scalef32.pk.f16.bf8"(%arg54, %85) <{srcLoHiSel = false}> : (i32, f32) -> vector<2xf16>
    %92 = "rocdl.cvt.scalef32.pk.f16.fp8"(%arg54, %85) <{srcLoHiSel = false}> : (i32, f32) -> vector<2xf16>
    %93 = "rocdl.cvt.scalef32.f16.fp8"(%arg57, %arg54, %85) <{dstLoHiSel = false, srcSelIndex = 0 : i32}> : (vector<2xf16>, i32, f32) -> vector<2xf16>
    %94 = "rocdl.cvt.scalef32.f16.bf8"(%arg57, %arg54, %85) <{dstLoHiSel = false, srcSelIndex = 0 : i32}> : (vector<2xf16>, i32, f32) -> vector<2xf16>
    %95 = "rocdl.cvt.scalef32.pk.bf16.bf8"(%arg54, %85) <{srcLoHiSel = false}> : (i32, f32) -> vector<2xbf16>
    %96 = "rocdl.cvt.scalef32.pk.bf16.fp8"(%arg54, %85) <{srcLoHiSel = false}> : (i32, f32) -> vector<2xbf16>
    %97 = "rocdl.cvt.pk.bf8.f32"(%87, %89, %arg54) <{wordSel = false}> : (f32, f32, i32) -> i32
    %98 = "rocdl.cvt.pk.fp8.f32"(%87, %89, %97) <{wordSel = false}> : (f32, f32, i32) -> i32
    %99 = "rocdl.cvt.sr.bf8.f32"(%87, %arg58, %98) <{byteSel = 2 : i32}> : (f32, i32, i32) -> i32
    %100 = "rocdl.cvt.sr.fp8.f32"(%89, %arg58, %99) <{byteSel = 3 : i32}> : (f32, i32, i32) -> i32
    %101 = "rocdl.cvt.scalef32.sr.fp8.f32"(%99, %89, %arg58, %85) <{dstSelIndex = 3 : i32}> : (i32, f32, i32, f32) -> i32
    %102 = "rocdl.cvt.scalef32.sr.fp8.f16"(%99, %arg55, %arg58, %85) <{dstSelIndex = 3 : i32}> : (i32, f16, i32, f32) -> i32
    %103 = "rocdl.cvt.scalef32.sr.fp8.bf16"(%99, %arg56, %arg58, %85) <{dstSelIndex = 3 : i32}> : (i32, bf16, i32, f32) -> i32
    %104 = "rocdl.cvt.sr.bf8.f32"(%87, %arg58, %98) <{byteSel = 3 : i32}> : (f32, i32, i32) -> i32
    %105 = "rocdl.cvt.scalef32.sr.bf8.f32"(%98, %89, %arg58, %85) <{dstSelIndex = 3 : i32}> : (i32, f32, i32, f32) -> i32
    %106 = "rocdl.cvt.scalef32.sr.bf8.f16"(%98, %arg55, %arg58, %85) <{dstSelIndex = 3 : i32}> : (i32, f16, i32, f32) -> i32
    %107 = "rocdl.cvt.scalef32.sr.bf8.bf16"(%98, %arg56, %arg58, %85) <{dstSelIndex = 3 : i32}> : (i32, bf16, i32, f32) -> i32
    %108 = "rocdl.cvt.scalef32.pk.f32.fp8"(%arg54, %85) <{srcLoHiSel = false}> : (i32, f32) -> vector<2xf32>
    %109 = "rocdl.cvt.scalef32.pk.f32.bf8"(%arg54, %85) <{srcLoHiSel = false}> : (i32, f32) -> vector<2xf32>
    "llvm.return"(%100) : (i32) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<vector<2xi16> (f32, f32, vector<2xi16>)>, linkage = #llvm.linkage<external>, sym_name = "rocdl_8bit_packed_v2i16", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg51: f32, %arg52: f32, %arg53: vector<2xi16>):
    %82 = "llvm.mlir.constant"() <{value = 1.000000e+00 : f32}> : () -> f32
    %83 = "rocdl.cvt.scalef32.pk.fp8.f32"(%arg53, %arg51, %arg52, %82) <{dstLoHiSel = false}> : (vector<2xi16>, f32, f32, f32) -> vector<2xi16>
    %84 = "rocdl.cvt.scalef32.pk.bf8.f32"(%arg53, %arg51, %arg52, %82) <{dstLoHiSel = false}> : (vector<2xi16>, f32, f32, f32) -> vector<2xi16>
    "llvm.return"(%83) : (vector<2xi16>) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<vector<2xi16> (vector<2xf16>, vector<2xbf16>, vector<2xi16>)>, linkage = #llvm.linkage<external>, sym_name = "rocdl_v2f16_v2i16", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg48: vector<2xf16>, %arg49: vector<2xbf16>, %arg50: vector<2xi16>):
    %77 = "llvm.mlir.constant"() <{value = 1.000000e+00 : f32}> : () -> f32
    %78 = "rocdl.cvt.scalef32.pk.fp8.f16"(%arg50, %arg48, %77) <{dstLoHiSel = false}> : (vector<2xi16>, vector<2xf16>, f32) -> vector<2xi16>
    %79 = "rocdl.cvt.scalef32.pk.fp8.bf16"(%arg50, %arg49, %77) <{dstLoHiSel = false}> : (vector<2xi16>, vector<2xbf16>, f32) -> vector<2xi16>
    %80 = "rocdl.cvt.scalef32.pk.bf8.f16"(%arg50, %arg48, %77) <{dstLoHiSel = false}> : (vector<2xi16>, vector<2xf16>, f32) -> vector<2xi16>
    %81 = "rocdl.cvt.scalef32.pk.bf8.bf16"(%arg50, %arg49, %77) <{dstLoHiSel = false}> : (vector<2xi16>, vector<2xbf16>, f32) -> vector<2xi16>
    "llvm.return"(%78) : (vector<2xi16>) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<vector<2xf16> (f32, f32)>, linkage = #llvm.linkage<external>, sym_name = "rocdl_16bit_packed_floats", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg46: f32, %arg47: f32):
    %76 = "rocdl.cvt.pkrtz"(%arg46, %arg47) : (f32, f32) -> vector<2xf16>
    "llvm.return"(%76) : (vector<2xf16>) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (vector<6xi32>, vector<16xf32>, vector<32xf32>, vector<32xf16>, vector<32xbf16>, i32, f32)>, linkage = #llvm.linkage<external>, sym_name = "rocdl_6_bit_floats", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg39: vector<6xi32>, %arg40: vector<16xf32>, %arg41: vector<32xf32>, %arg42: vector<32xf16>, %arg43: vector<32xbf16>, %arg44: i32, %arg45: f32):
    %58 = "rocdl.cvt.scalef32.2xpk16.bf6.f32"(%arg40, %arg40, %arg45) : (vector<16xf32>, vector<16xf32>, f32) -> vector<6xi32>
    %59 = "rocdl.cvt.scalef32.2xpk16.fp6.f32"(%arg40, %arg40, %arg45) : (vector<16xf32>, vector<16xf32>, f32) -> vector<6xi32>
    %60 = "rocdl.cvt.scalef32.pk32.bf6.f16"(%arg42, %arg45) : (vector<32xf16>, f32) -> vector<6xi32>
    %61 = "rocdl.cvt.scalef32.pk32.fp6.f16"(%arg42, %arg45) : (vector<32xf16>, f32) -> vector<6xi32>
    %62 = "rocdl.cvt.scalef32.pk32.bf6.bf16"(%arg43, %arg45) : (vector<32xbf16>, f32) -> vector<6xi32>
    %63 = "rocdl.cvt.scalef32.pk32.fp6.bf16"(%arg43, %arg45) : (vector<32xbf16>, f32) -> vector<6xi32>
    %64 = "rocdl.cvt.scalef32.pk32.f32.bf6"(%arg39, %arg45) : (vector<6xi32>, f32) -> vector<32xf32>
    %65 = "rocdl.cvt.scalef32.pk32.f32.fp6"(%arg39, %arg45) : (vector<6xi32>, f32) -> vector<32xf32>
    %66 = "rocdl.cvt.scalef32.pk32.f16.bf6"(%arg39, %arg45) : (vector<6xi32>, f32) -> vector<32xf16>
    %67 = "rocdl.cvt.scalef32.pk32.f16.fp6"(%arg39, %arg45) : (vector<6xi32>, f32) -> vector<32xf16>
    %68 = "rocdl.cvt.scalef32.pk32.bf16.bf6"(%arg39, %arg45) : (vector<6xi32>, f32) -> vector<32xbf16>
    %69 = "rocdl.cvt.scalef32.pk32.bf16.fp6"(%arg39, %arg45) : (vector<6xi32>, f32) -> vector<32xbf16>
    %70 = "rocdl.cvt.scalef32.sr.pk32.bf6.f32"(%arg41, %arg44, %arg45) : (vector<32xf32>, i32, f32) -> vector<6xi32>
    %71 = "rocdl.cvt.scalef32.sr.pk32.fp6.f32"(%arg41, %arg44, %arg45) : (vector<32xf32>, i32, f32) -> vector<6xi32>
    %72 = "rocdl.cvt.scalef32.sr.pk32.bf6.f16"(%arg42, %arg44, %arg45) : (vector<32xf16>, i32, f32) -> vector<6xi32>
    %73 = "rocdl.cvt.scalef32.sr.pk32.fp6.f16"(%arg42, %arg44, %arg45) : (vector<32xf16>, i32, f32) -> vector<6xi32>
    %74 = "rocdl.cvt.scalef32.sr.pk32.bf6.bf16"(%arg43, %arg44, %arg45) : (vector<32xbf16>, i32, f32) -> vector<6xi32>
    %75 = "rocdl.cvt.scalef32.sr.pk32.fp6.bf16"(%arg43, %arg44, %arg45) : (vector<32xbf16>, i32, f32) -> vector<6xi32>
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (i32, f32, vector<2xf32>, vector<2xf16>, vector<2xbf16>, i32, f32)>, linkage = #llvm.linkage<external>, sym_name = "rocdl_4_bit_floats", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg32: i32, %arg33: f32, %arg34: vector<2xf32>, %arg35: vector<2xf16>, %arg36: vector<2xbf16>, %arg37: i32, %arg38: f32):
    %49 = "rocdl.cvt.scalef32.pk.fp4.f32"(%arg32, %arg33, %arg33, %arg38) <{dstSelIndex = 0 : i32}> : (i32, f32, f32, f32) -> i32
    %50 = "rocdl.cvt.scalef32.pk.fp4.f16"(%arg32, %arg35, %arg38) <{dstSelIndex = 1 : i32}> : (i32, vector<2xf16>, f32) -> i32
    %51 = "rocdl.cvt.scalef32.pk.fp4.bf16"(%arg32, %arg36, %arg38) <{dstSelIndex = 0 : i32}> : (i32, vector<2xbf16>, f32) -> i32
    %52 = "rocdl.cvt.scalef32.pk.f32.fp4"(%arg32, %arg38) <{srcSelIndex = 0 : i32}> : (i32, f32) -> vector<2xf32>
    %53 = "rocdl.cvt.scalef32.pk.f16.fp4"(%arg32, %arg38) <{srcSelIndex = 1 : i32}> : (i32, f32) -> vector<2xf16>
    %54 = "rocdl.cvt.scalef32.pk.bf16.fp4"(%arg32, %arg38) <{srcSelIndex = 0 : i32}> : (i32, f32) -> vector<2xbf16>
    %55 = "rocdl.cvt.scalef32.sr.pk.fp4.f32"(%arg32, %arg34, %arg37, %arg38) <{dstSelIndex = 0 : i32}> : (i32, vector<2xf32>, i32, f32) -> i32
    %56 = "rocdl.cvt.scalef32.sr.pk.fp4.f16"(%arg32, %arg35, %arg37, %arg38) <{dstSelIndex = 1 : i32}> : (i32, vector<2xf16>, i32, f32) -> i32
    %57 = "rocdl.cvt.scalef32.sr.pk.fp4.bf16"(%arg32, %arg36, %arg37, %arg38) <{dstSelIndex = 0 : i32}> : (i32, vector<2xbf16>, i32, f32) -> i32
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr<1>, f32)>, linkage = #llvm.linkage<external>, sym_name = "rocdl_atomic_attrs", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg30: !llvm.ptr<1>, %arg31: f32):
    %48 = "llvm.atomicrmw"(%arg30, %arg31) <{bin_op = 11 : i64, ordering = 2 : i64}> {rocdl.ignore_denormal_mode, rocdl.no_fine_grained_memory, rocdl.no_remote_memory} : (!llvm.ptr<1>, f32) -> f32
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<i32 (ptr<1>)>, linkage = #llvm.linkage<external>, sym_name = "rocdl_last_use", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg29: !llvm.ptr<1>):
    %47 = "llvm.load"(%arg29) <{ordering = 0 : i64}> {rocdl.last_use} : (!llvm.ptr<1>) -> i32
    "llvm.return"(%47) : (i32) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<f16 (f16, f16, f16)>, linkage = #llvm.linkage<external>, sym_name = "test_fmed3_f16", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg26: f16, %arg27: f16, %arg28: f16):
    %46 = "rocdl.fmed3"(%arg26, %arg27, %arg28) : (f16, f16, f16) -> f16
    "llvm.return"(%46) : (f16) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<f32 (f32, f32, f32)>, linkage = #llvm.linkage<external>, sym_name = "test_fmed3_f32", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg23: f32, %arg24: f32, %arg25: f32):
    %45 = "rocdl.fmed3"(%arg23, %arg24, %arg25) : (f32, f32, f32) -> f32
    "llvm.return"(%45) : (f32) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (i32, vector<2xi32>, i32)>, linkage = #llvm.linkage<external>, sym_name = "rocdl.cvt.scale.pk8", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg20: i32, %arg21: vector<2xi32>, %arg22: i32):
    %36 = "rocdl.cvt.scale.pk8.f16.fp4"(%arg20, %arg22) <{scaleSel = 0 : i32}> : (i32, i32) -> vector<8xf16>
    %37 = "rocdl.cvt.scale.pk8.bf16.fp4"(%arg20, %arg22) <{scaleSel = 0 : i32}> : (i32, i32) -> vector<8xbf16>
    %38 = "rocdl.cvt.scale.pk8.f32.fp4"(%arg20, %arg22) <{scaleSel = 0 : i32}> : (i32, i32) -> vector<8xf32>
    %39 = "rocdl.cvt.scale.pk8.f16.fp8"(%arg21, %arg22) <{scaleSel = 0 : i32}> : (vector<2xi32>, i32) -> vector<8xf16>
    %40 = "rocdl.cvt.scale.pk8.bf16.fp8"(%arg21, %arg22) <{scaleSel = 0 : i32}> : (vector<2xi32>, i32) -> vector<8xbf16>
    %41 = "rocdl.cvt.scale.pk8.f32.fp8"(%arg21, %arg22) <{scaleSel = 0 : i32}> : (vector<2xi32>, i32) -> vector<8xf32>
    %42 = "rocdl.cvt.scale.pk8.f16.bf8"(%arg21, %arg22) <{scaleSel = 0 : i32}> : (vector<2xi32>, i32) -> vector<8xf16>
    %43 = "rocdl.cvt.scale.pk8.bf16.bf8"(%arg21, %arg22) <{scaleSel = 0 : i32}> : (vector<2xi32>, i32) -> vector<8xbf16>
    %44 = "rocdl.cvt.scale.pk8.f32.bf8"(%arg21, %arg22) <{scaleSel = 0 : i32}> : (vector<2xi32>, i32) -> vector<8xf32>
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (vector<8xf32>, vector<8xf16>, vector<8xbf16>, f32)>, linkage = #llvm.linkage<external>, sym_name = "rocdl.cvt.scalef32.pk8", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg16: vector<8xf32>, %arg17: vector<8xf16>, %arg18: vector<8xbf16>, %arg19: f32):
    %27 = "rocdl.cvt.scalef32.pk8.fp8.f32"(%arg16, %arg19) : (vector<8xf32>, f32) -> vector<2xi32>
    %28 = "rocdl.cvt.scalef32.pk8.bf8.f32"(%arg16, %arg19) : (vector<8xf32>, f32) -> vector<2xi32>
    %29 = "rocdl.cvt.scalef32.pk8.fp4.f32"(%arg16, %arg19) : (vector<8xf32>, f32) -> i32
    %30 = "rocdl.cvt.scalef32.pk8.fp8.f16"(%arg17, %arg19) : (vector<8xf16>, f32) -> vector<2xi32>
    %31 = "rocdl.cvt.scalef32.pk8.bf8.f16"(%arg17, %arg19) : (vector<8xf16>, f32) -> vector<2xi32>
    %32 = "rocdl.cvt.scalef32.pk8.fp4.f16"(%arg17, %arg19) : (vector<8xf16>, f32) -> i32
    %33 = "rocdl.cvt.scalef32.pk8.fp8.bf16"(%arg18, %arg19) : (vector<8xbf16>, f32) -> vector<2xi32>
    %34 = "rocdl.cvt.scalef32.pk8.bf8.bf16"(%arg18, %arg19) : (vector<8xbf16>, f32) -> vector<2xi32>
    %35 = "rocdl.cvt.scalef32.pk8.fp4.bf16"(%arg18, %arg19) : (vector<8xbf16>, f32) -> i32
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (vector<8xf32>, vector<8xf16>, vector<8xbf16>, i32, f32)>, linkage = #llvm.linkage<external>, sym_name = "rocdl.cvt.scalef32.sr.pk8", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg11: vector<8xf32>, %arg12: vector<8xf16>, %arg13: vector<8xbf16>, %arg14: i32, %arg15: f32):
    %18 = "rocdl.cvt.scalef32.sr.pk8.fp8.f32"(%arg11, %arg14, %arg15) : (vector<8xf32>, i32, f32) -> vector<2xi32>
    %19 = "rocdl.cvt.scalef32.sr.pk8.bf8.f32"(%arg11, %arg14, %arg15) : (vector<8xf32>, i32, f32) -> vector<2xi32>
    %20 = "rocdl.cvt.scalef32.sr.pk8.fp4.f32"(%arg11, %arg14, %arg15) : (vector<8xf32>, i32, f32) -> i32
    %21 = "rocdl.cvt.scalef32.sr.pk8.fp8.f16"(%arg12, %arg14, %arg15) : (vector<8xf16>, i32, f32) -> vector<2xi32>
    %22 = "rocdl.cvt.scalef32.sr.pk8.bf8.f16"(%arg12, %arg14, %arg15) : (vector<8xf16>, i32, f32) -> vector<2xi32>
    %23 = "rocdl.cvt.scalef32.sr.pk8.fp4.f16"(%arg12, %arg14, %arg15) : (vector<8xf16>, i32, f32) -> i32
    %24 = "rocdl.cvt.scalef32.sr.pk8.fp8.bf16"(%arg13, %arg14, %arg15) : (vector<8xbf16>, i32, f32) -> vector<2xi32>
    %25 = "rocdl.cvt.scalef32.sr.pk8.bf8.bf16"(%arg13, %arg14, %arg15) : (vector<8xbf16>, i32, f32) -> vector<2xi32>
    %26 = "rocdl.cvt.scalef32.sr.pk8.fp4.bf16"(%arg13, %arg14, %arg15) : (vector<8xbf16>, i32, f32) -> i32
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (vector<3xi32>, i32)>, linkage = #llvm.linkage<external>, sym_name = "rocdl.cvt.scale.pk16", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg9: vector<3xi32>, %arg10: i32):
    %12 = "rocdl.cvt.scale.pk16.f16.fp6"(%arg9, %arg10) <{scaleSel = 0 : i32}> : (vector<3xi32>, i32) -> vector<16xf16>
    %13 = "rocdl.cvt.scale.pk16.bf16.fp6"(%arg9, %arg10) <{scaleSel = 0 : i32}> : (vector<3xi32>, i32) -> vector<16xbf16>
    %14 = "rocdl.cvt.scale.pk16.f32.fp6"(%arg9, %arg10) <{scaleSel = 0 : i32}> : (vector<3xi32>, i32) -> vector<16xf32>
    %15 = "rocdl.cvt.scale.pk16.f16.bf6"(%arg9, %arg10) <{scaleSel = 0 : i32}> : (vector<3xi32>, i32) -> vector<16xf16>
    %16 = "rocdl.cvt.scale.pk16.bf16.bf6"(%arg9, %arg10) <{scaleSel = 0 : i32}> : (vector<3xi32>, i32) -> vector<16xbf16>
    %17 = "rocdl.cvt.scale.pk16.f32.bf6"(%arg9, %arg10) <{scaleSel = 0 : i32}> : (vector<3xi32>, i32) -> vector<16xf32>
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (vector<16xf32>, vector<16xf16>, vector<16xbf16>, f32)>, linkage = #llvm.linkage<external>, sym_name = "rocdl.cvt.scalef32.pk16", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg5: vector<16xf32>, %arg6: vector<16xf16>, %arg7: vector<16xbf16>, %arg8: f32):
    %6 = "rocdl.cvt.scalef32.pk16.fp6.f16"(%arg6, %arg8) : (vector<16xf16>, f32) -> vector<3xi32>
    %7 = "rocdl.cvt.scalef32.pk16.fp6.bf16"(%arg7, %arg8) : (vector<16xbf16>, f32) -> vector<3xi32>
    %8 = "rocdl.cvt.scalef32.pk16.fp6.f32"(%arg5, %arg8) : (vector<16xf32>, f32) -> vector<3xi32>
    %9 = "rocdl.cvt.scalef32.pk16.bf6.f16"(%arg6, %arg8) : (vector<16xf16>, f32) -> vector<3xi32>
    %10 = "rocdl.cvt.scalef32.pk16.bf6.bf16"(%arg7, %arg8) : (vector<16xbf16>, f32) -> vector<3xi32>
    %11 = "rocdl.cvt.scalef32.pk16.bf6.f32"(%arg5, %arg8) : (vector<16xf32>, f32) -> vector<3xi32>
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (vector<16xf32>, vector<16xf16>, vector<16xbf16>, i32, f32)>, linkage = #llvm.linkage<external>, sym_name = "rocdl.cvt.scalef32.sr.pk16", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: vector<16xf32>, %arg1: vector<16xf16>, %arg2: vector<16xbf16>, %arg3: i32, %arg4: f32):
    %0 = "rocdl.cvt.scalef32.sr.pk16.fp6.f16"(%arg1, %arg3, %arg4) : (vector<16xf16>, i32, f32) -> vector<3xi32>
    %1 = "rocdl.cvt.scalef32.sr.pk16.fp6.bf16"(%arg2, %arg3, %arg4) : (vector<16xbf16>, i32, f32) -> vector<3xi32>
    %2 = "rocdl.cvt.scalef32.sr.pk16.fp6.f32"(%arg0, %arg3, %arg4) : (vector<16xf32>, i32, f32) -> vector<3xi32>
    %3 = "rocdl.cvt.scalef32.sr.pk16.bf6.f16"(%arg1, %arg3, %arg4) : (vector<16xf16>, i32, f32) -> vector<3xi32>
    %4 = "rocdl.cvt.scalef32.sr.pk16.bf6.bf16"(%arg2, %arg3, %arg4) : (vector<16xbf16>, i32, f32) -> vector<3xi32>
    %5 = "rocdl.cvt.scalef32.sr.pk16.bf6.f32"(%arg0, %arg3, %arg4) : (vector<16xf32>, i32, f32) -> vector<3xi32>
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

