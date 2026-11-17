"builtin.module"() ({
  "omp.private"() <{data_sharing_type = #omp<data_sharing_type{type = private}>, sym_name = "_QFsimple_target_teams_only_reductionEindex__private_i32", type = i32}> ({
  }, {
  }, {
  }) : () -> () loc("<stdin>":2:3)
  "omp.declare_reduction"() <{sym_name = "add_reduction_i32", type = i32}> ({
  }, {
  ^bb0(%arg7: i32 loc("<stdin>":8:8)):
    %17 = "llvm.mlir.constant"() <{value = 0 : i32}> : () -> i32 loc("<stdin>":9:11)
    "omp.yield"(%17) : (i32) -> () loc("<stdin>":10:5)
  }, {
  ^bb0(%arg5: i32 loc("<stdin>":12:8), %arg6: i32 loc("<stdin>":12:20)):
    %16 = "llvm.add"(%arg5, %arg6) <{overflowFlags = 0 : i32}> : (i32, i32) -> i32 loc("<stdin>":13:11)
    "omp.yield"(%16) : (i32) -> () loc("<stdin>":14:5)
  }, {
  }, {
  }, {
  }) : () -> () loc("<stdin>":6:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, frame_pointer = #llvm.framePointerKind<all>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "simple_target_teams_only_reduction_", target_cpu = "gfx1030", target_features = #llvm.target_features<["+16-bit-insts", "+ci-insts", "+dl-insts", "+dot1-insts", "+dot10-insts", "+dot2-insts", "+dot5-insts", "+dot6-insts", "+dot7-insts", "+dpp", "+gfx10-3-insts", "+gfx10-insts", "+gfx8-insts", "+gfx9-insts", "+gws", "+image-insts", "+s-memrealtime", "+s-memtime-inst", "+wavefrontsize32"]>, unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %0 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64 loc("<stdin>":20:10)
    %1 = "llvm.alloca"(%0) <{elem_type = i32}> {bindc_name = "sum"} : (i64) -> !llvm.ptr<5> loc("<stdin>":21:10)
    %2 = "llvm.addrspacecast"(%1) : (!llvm.ptr<5>) -> !llvm.ptr loc("<stdin>":22:10)
    %3 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64 loc("<stdin>":23:10)
    %4 = "llvm.alloca"(%3) <{elem_type = i32}> {bindc_name = "index_"} : (i64) -> !llvm.ptr<5> loc("<stdin>":24:10)
    %5 = "llvm.addrspacecast"(%4) : (!llvm.ptr<5>) -> !llvm.ptr loc("<stdin>":25:10)
    %6 = "llvm.mlir.constant"() <{value = 0 : i32}> : () -> i32 loc("<stdin>":26:10)
    %7 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64 loc("<stdin>":27:10)
    %8 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64 loc("<stdin>":28:10)
    "llvm.store"(%6, %2) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> () loc("<stdin>":29:5)
    %9 = "omp.map.info"(%2) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags to|from>, name = "sum", operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_ptr_type = i32}> : (!llvm.ptr) -> !llvm.ptr loc("<stdin>":30:10)
    %10 = "omp.map.info"(%5) <{map_capture_type = #omp<variable_capture_kind(ByCopy)>, map_type = #omp<clause_map_flags implicit>, name = "index_", operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_ptr_type = i32}> : (!llvm.ptr) -> !llvm.ptr loc("<stdin>":31:11)
    "omp.target"(%9, %10) <{kernel_type = #omp<kernel_type(generic)>, operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0>}> ({
    ^bb0(%arg0: !llvm.ptr loc("<stdin>":33:10), %arg1: !llvm.ptr loc("<stdin>":33:28)):
      %11 = "llvm.mlir.constant"() <{value = 10000 : i32}> : () -> i32 loc("<stdin>":34:13)
      %12 = "llvm.mlir.constant"() <{value = 1 : i32}> : () -> i32 loc("<stdin>":35:13)
      "omp.teams"(%arg0) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 1, 0>, reduction_byref = array<i1: false>, reduction_syms = [@add_reduction_i32]}> ({
      ^bb0(%arg2: !llvm.ptr loc("<stdin>":37:12)):
        "omp.distribute"(%arg1) <{operandSegmentSizes = array<i32: 0, 0, 0, 1>, private_syms = [@_QFsimple_target_teams_only_reductionEindex__private_i32]}> ({
        ^bb0(%arg3: !llvm.ptr loc("<stdin>":39:14)):
          "omp.loop_nest"(%12, %11, %12) <{loop_inclusive}> ({
          ^bb0(%arg4: i32 loc("<stdin>":41:16)):
            "llvm.store"(%arg4, %arg3) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> () loc("<stdin>":42:13)
            %13 = "llvm.load"(%arg2) <{ordering = 0 : i64}> : (!llvm.ptr) -> i32 loc("<stdin>":43:19)
            %14 = "llvm.load"(%arg3) <{ordering = 0 : i64}> : (!llvm.ptr) -> i32 loc("<stdin>":44:19)
            %15 = "llvm.add"(%13, %14) <{overflowFlags = 0 : i32}> : (i32, i32) -> i32 loc("<stdin>":45:19)
            "llvm.store"(%15, %arg2) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> () loc("<stdin>":46:13)
            "omp.yield"() : () -> () loc("<stdin>":47:13)
          }) : (i32, i32, i32) -> () loc("<stdin>":40:11)
        }) : (!llvm.ptr) -> () loc("<stdin>":38:9)
        "omp.terminator"() : () -> () loc("<stdin>":50:9)
      }) : (!llvm.ptr) -> () loc("<stdin>":36:7)
      "omp.terminator"() : () -> () loc("<stdin>":52:7)
    }) : (!llvm.ptr, !llvm.ptr) -> () loc("<stdin>":32:5)
    "llvm.return"() : () -> () loc("<stdin>":54:5)
  }) {fir.internal_name = "_QPsimple_target_teams_only_reduction", omp.declare_target = #omp.declaretarget<device_type = (host), capture_clause = (to)>} : () -> () loc("<stdin>":19:3)
}) {dlti.dl_spec = #dlti.dl_spec<"dlti.alloca_memory_space" = 5 : ui32>, llvm.data_layout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-p7:160:256:256:32-p8:128:128:128:48-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7:8", llvm.target_triple = "amdgcn-amd-amdhsa", omp.is_gpu = true, omp.is_target_device = true} : () -> () loc("<stdin>":1:1)
