"builtin.module"() ({
  "omp.private"() <{data_sharing_type = #omp<data_sharing_type{type = private}>, sym_name = "_QFsimple_target_teams_only_reductionEindex__private_i32", type = i32}> ({
  }, {
  }, {
  }) : () -> ()
  "omp.declare_reduction"() <{sym_name = "add_reduction_i32", type = i32}> ({
  }, {
  ^bb0(%arg7: i32):
    %17 = "llvm.mlir.constant"() <{value = 0 : i32}> : () -> i32
    "omp.yield"(%17) : (i32) -> ()
  }, {
  ^bb0(%arg5: i32, %arg6: i32):
    %16 = "llvm.add"(%arg5, %arg6) <{overflowFlags = 0 : i32}> : (i32, i32) -> i32
    "omp.yield"(%16) : (i32) -> ()
  }, {
  }, {
  }, {
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, frame_pointer = #llvm.framePointerKind<all>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "simple_target_teams_only_reduction_", target_cpu = "gfx1030", target_features = #llvm.target_features<["+16-bit-insts", "+ci-insts", "+dl-insts", "+dot1-insts", "+dot10-insts", "+dot2-insts", "+dot5-insts", "+dot6-insts", "+dot7-insts", "+dpp", "+gfx10-3-insts", "+gfx10-insts", "+gfx8-insts", "+gfx9-insts", "+gws", "+image-insts", "+s-memrealtime", "+s-memtime-inst", "+wavefrontsize32"]>, unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %0 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64
    %1 = "llvm.alloca"(%0) <{elem_type = i32}> {bindc_name = "sum"} : (i64) -> !llvm.ptr<5>
    %2 = "llvm.addrspacecast"(%1) : (!llvm.ptr<5>) -> !llvm.ptr
    %3 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64
    %4 = "llvm.alloca"(%3) <{elem_type = i32}> {bindc_name = "index_"} : (i64) -> !llvm.ptr<5>
    %5 = "llvm.addrspacecast"(%4) : (!llvm.ptr<5>) -> !llvm.ptr
    %6 = "llvm.mlir.constant"() <{value = 0 : i32}> : () -> i32
    %7 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64
    %8 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64
    "llvm.store"(%6, %2) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> ()
    %9 = "omp.map.info"(%2) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags to|from>, name = "sum", operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_type = i32}> : (!llvm.ptr) -> !llvm.ptr
    %10 = "omp.map.info"(%5) <{map_capture_type = #omp<variable_capture_kind(ByCopy)>, map_type = #omp<clause_map_flags implicit>, name = "index_", operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_type = i32}> : (!llvm.ptr) -> !llvm.ptr
    "omp.target"(%9, %10) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0>}> ({
    ^bb0(%arg0: !llvm.ptr, %arg1: !llvm.ptr):
      %11 = "llvm.mlir.constant"() <{value = 10000 : i32}> : () -> i32
      %12 = "llvm.mlir.constant"() <{value = 1 : i32}> : () -> i32
      "omp.teams"(%arg0) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 1, 0>, reduction_byref = array<i1: false>, reduction_syms = [@add_reduction_i32]}> ({
      ^bb0(%arg2: !llvm.ptr):
        "omp.distribute"(%arg1) <{operandSegmentSizes = array<i32: 0, 0, 0, 1>, private_syms = [@_QFsimple_target_teams_only_reductionEindex__private_i32]}> ({
        ^bb0(%arg3: !llvm.ptr):
          "omp.loop_nest"(%12, %11, %12) <{loop_inclusive}> ({
          ^bb0(%arg4: i32):
            "llvm.store"(%arg4, %arg3) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> ()
            %13 = "llvm.load"(%arg2) <{ordering = 0 : i64}> : (!llvm.ptr) -> i32
            %14 = "llvm.load"(%arg3) <{ordering = 0 : i64}> : (!llvm.ptr) -> i32
            %15 = "llvm.add"(%13, %14) <{overflowFlags = 0 : i32}> : (i32, i32) -> i32
            "llvm.store"(%15, %arg2) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> ()
            "omp.yield"() : () -> ()
          }) : (i32, i32, i32) -> ()
        }) : (!llvm.ptr) -> ()
        "omp.terminator"() : () -> ()
      }) : (!llvm.ptr) -> ()
      "omp.terminator"() : () -> ()
    }) : (!llvm.ptr, !llvm.ptr) -> ()
    "llvm.return"() : () -> ()
  }) {fir.internal_name = "_QPsimple_target_teams_only_reduction", omp.declare_target = #omp.declaretarget<device_type = (host), capture_clause = (to)>} : () -> ()
}) {dlti.dl_spec = #dlti.dl_spec<"dlti.alloca_memory_space" = 5 : ui32>, llvm.data_layout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-p7:160:256:256:32-p8:128:128:128:48-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7:8", llvm.target_triple = "amdgcn-amd-amdhsa", omp.is_gpu = true, omp.is_target_device = true} : () -> ()

