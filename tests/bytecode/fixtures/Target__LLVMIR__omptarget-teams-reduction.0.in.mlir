"builtin.module"() ({
  "omp.declare_reduction"() <{sym_name = "add_reduction_i32", type = i32}> ({
  }, {
  ^bb0(%arg5: i32 loc("<stdin>":4:8)):
    %25 = "llvm.mlir.constant"() <{value = 0 : i32}> : () -> i32 loc("<stdin>":5:11)
    "omp.yield"(%25) : (i32) -> () loc("<stdin>":6:5)
  }, {
  ^bb0(%arg3: i32 loc("<stdin>":8:8), %arg4: i32 loc("<stdin>":8:20)):
    %24 = "llvm.add"(%arg3, %arg4) <{overflowFlags = 0 : i32}> : (i32, i32) -> i32 loc("<stdin>":9:11)
    "omp.yield"(%24) : (i32) -> () loc("<stdin>":10:5)
  }, {
  }, {
  }, {
  }) : () -> () loc("<stdin>":2:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, frame_pointer = #llvm.framePointerKind<all>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "simple_target_teams_only_reduction_", target_cpu = "gfx1030", target_features = #llvm.target_features<["+16-bit-insts", "+ci-insts", "+dl-insts", "+dot1-insts", "+dot10-insts", "+dot2-insts", "+dot5-insts", "+dot6-insts", "+dot7-insts", "+dpp", "+gfx10-3-insts", "+gfx10-insts", "+gfx8-insts", "+gfx9-insts", "+gws", "+image-insts", "+s-memrealtime", "+s-memtime-inst", "+wavefrontsize32"]>, unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %0 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64 loc("<stdin>":16:10)
    %1 = "llvm.alloca"(%0) <{elem_type = i32}> {bindc_name = "sum"} : (i64) -> !llvm.ptr<5> loc("<stdin>":17:10)
    %2 = "llvm.addrspacecast"(%1) : (!llvm.ptr<5>) -> !llvm.ptr loc("<stdin>":18:10)
    %3 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64 loc("<stdin>":19:10)
    %4 = "llvm.alloca"(%3) <{elem_type = i32}> {bindc_name = "index_"} : (i64) -> !llvm.ptr<5> loc("<stdin>":20:10)
    %5 = "llvm.addrspacecast"(%4) : (!llvm.ptr<5>) -> !llvm.ptr loc("<stdin>":21:10)
    %6 = "llvm.mlir.constant"() <{value = 0 : i32}> : () -> i32 loc("<stdin>":22:10)
    %7 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64 loc("<stdin>":23:10)
    %8 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64 loc("<stdin>":24:10)
    "llvm.store"(%6, %2) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> () loc("<stdin>":25:5)
    %9 = "omp.map.info"(%2) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags to|from>, name = "sum", operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_ptr_type = i32}> : (!llvm.ptr) -> !llvm.ptr loc("<stdin>":26:10)
    %10 = "omp.map.info"(%5) <{map_capture_type = #omp<variable_capture_kind(ByCopy)>, map_type = #omp<clause_map_flags implicit>, name = "index_", operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_ptr_type = i32}> : (!llvm.ptr) -> !llvm.ptr loc("<stdin>":27:11)
    "omp.target"(%9, %10) <{kernel_type = #omp<kernel_type(generic)>, operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0>}> ({
    ^bb0(%arg0: !llvm.ptr loc("<stdin>":29:10), %arg1: !llvm.ptr loc("<stdin>":29:28)):
      %11 = "llvm.mlir.constant"() <{value = 0 : index}> : () -> i64 loc("<stdin>":30:13)
      %12 = "llvm.mlir.constant"() <{value = 10000 : index}> : () -> i64 loc("<stdin>":31:13)
      %13 = "llvm.mlir.constant"() <{value = 1 : index}> : () -> i64 loc("<stdin>":32:13)
      "omp.teams"(%arg0) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 1, 0>, reduction_byref = array<i1: false>, reduction_syms = [@add_reduction_i32]}> ({
      ^bb0(%arg2: !llvm.ptr loc("<stdin>":34:12)):
        %14 = "llvm.trunc"(%13) <{overflowFlags = 0 : i32}> : (i64) -> i32 loc("<stdin>":35:15)
        "llvm.br"(%14, %12)[^bb1] : (i32, i64) -> () loc("<stdin>":36:9)
      ^bb1(%15: i32 loc("<stdin>":37:12), %16: i64 loc("<stdin>":37:22)):  // 2 preds: ^bb0, ^bb2
        %17 = "llvm.icmp"(%16, %11) <{predicate = 4 : i64}> : (i64, i64) -> i1 loc("<stdin>":38:15)
        "llvm.cond_br"(%17)[^bb2, ^bb3] <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (i1) -> () loc("<stdin>":39:9)
      ^bb2:  // pred: ^bb1
        "llvm.store"(%15, %arg1) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> () loc("<stdin>":41:9)
        %18 = "llvm.load"(%arg2) <{ordering = 0 : i64}> : (!llvm.ptr) -> i32 loc("<stdin>":42:15)
        %19 = "llvm.load"(%arg1) <{ordering = 0 : i64}> : (!llvm.ptr) -> i32 loc("<stdin>":43:15)
        %20 = "llvm.add"(%18, %19) <{overflowFlags = 0 : i32}> : (i32, i32) -> i32 loc("<stdin>":44:15)
        "llvm.store"(%20, %arg2) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> () loc("<stdin>":45:9)
        %21 = "llvm.load"(%arg1) <{ordering = 0 : i64}> : (!llvm.ptr) -> i32 loc("<stdin>":46:15)
        %22 = "llvm.add"(%21, %14) <{overflowFlags = 1 : i32}> : (i32, i32) -> i32 loc("<stdin>":47:15)
        %23 = "llvm.sub"(%16, %13) <{overflowFlags = 0 : i32}> : (i64, i64) -> i64 loc("<stdin>":48:15)
        "llvm.br"(%22, %23)[^bb1] : (i32, i64) -> () loc("<stdin>":49:9)
      ^bb3:  // pred: ^bb1
        "llvm.store"(%15, %arg1) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> () loc("<stdin>":51:9)
        "omp.terminator"() : () -> () loc("<stdin>":52:9)
      }) : (!llvm.ptr) -> () loc("<stdin>":33:7)
      "omp.terminator"() : () -> () loc("<stdin>":54:7)
    }) : (!llvm.ptr, !llvm.ptr) -> () loc("<stdin>":28:5)
    "llvm.return"() : () -> () loc("<stdin>":56:5)
  }) {fir.internal_name = "_QPsimple_target_teams_only_reduction", omp.declare_target = #omp.declaretarget<device_type = (host), capture_clause = (to)>} : () -> () loc("<stdin>":15:3)
}) {dlti.dl_spec = #dlti.dl_spec<"dlti.alloca_memory_space" = 5 : ui32>, llvm.data_layout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-p7:160:256:256:32-p8:128:128:128:48-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7:8", llvm.target_triple = "amdgcn-amd-amdhsa", omp.is_gpu = true, omp.is_target_device = true} : () -> () loc("<stdin>":1:1)
