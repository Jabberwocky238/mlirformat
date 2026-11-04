"builtin.module"() ({
  "omp.private"() <{data_sharing_type = #omp<data_sharing_type{type = private}>, sym_name = "_QFEj_private_i32", type = i32}> ({
  }, {
  }, {
  }) : () -> ()
  "omp.declare_reduction"() <{sym_name = "add_reduction_f32", type = f32}> ({
  }, {
  ^bb0(%arg24: f32):
    %50 = "llvm.mlir.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    "omp.yield"(%50) : (f32) -> ()
  }, {
  ^bb0(%arg22: f32, %arg23: f32):
    %49 = "llvm.fadd"(%arg22, %arg23) <{fastmathFlags = #llvm.fastmath<contract>}> : (f32, f32) -> f32
    "omp.yield"(%49) : (f32) -> ()
  }, {
  }, {
  }, {
  }) : () -> ()
  "omp.declare_reduction"() <{sym_name = "add_reduction_f64", type = f64}> ({
  }, {
  ^bb0(%arg21: f64):
    %48 = "llvm.mlir.constant"() <{value = 0.000000e+00 : f64}> : () -> f64
    "omp.yield"(%48) : (f64) -> ()
  }, {
  ^bb0(%arg19: f64, %arg20: f64):
    %47 = "llvm.fadd"(%arg19, %arg20) <{fastmathFlags = #llvm.fastmath<contract>}> : (f64, f64) -> f64
    "omp.yield"(%47) : (f64) -> ()
  }, {
  }, {
  }, {
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, frame_pointer = #llvm.framePointerKind<all>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "_QQmain", target_cpu = "gfx1030", target_features = #llvm.target_features<["+16-bit-insts", "+ci-insts", "+dl-insts", "+dot1-insts", "+dot10-insts", "+dot2-insts", "+dot5-insts", "+dot6-insts", "+dot7-insts", "+dpp", "+gfx10-3-insts", "+gfx10-insts", "+gfx8-insts", "+gfx9-insts", "+gws", "+image-insts", "+s-memrealtime", "+s-memtime-inst", "+vmem-to-lds-load-insts", "+wavefrontsize32"]>, unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %0 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64
    %1 = "llvm.alloca"(%0) <{elem_type = i32}> {bindc_name = "k"} : (i64) -> !llvm.ptr<5>
    %2 = "llvm.addrspacecast"(%1) : (!llvm.ptr<5>) -> !llvm.ptr
    %3 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64
    %4 = "llvm.alloca"(%3) <{elem_type = i32}> {bindc_name = "j"} : (i64) -> !llvm.ptr<5>
    %5 = "llvm.addrspacecast"(%4) : (!llvm.ptr<5>) -> !llvm.ptr
    %6 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64
    %7 = "llvm.alloca"(%6) <{elem_type = i32}> {bindc_name = "i"} : (i64) -> !llvm.ptr<5>
    %8 = "llvm.addrspacecast"(%7) : (!llvm.ptr<5>) -> !llvm.ptr
    %9 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64
    %10 = "llvm.alloca"(%9) <{elem_type = f32}> {bindc_name = "ce4"} : (i64) -> !llvm.ptr<5>
    %11 = "llvm.addrspacecast"(%10) : (!llvm.ptr<5>) -> !llvm.ptr
    %12 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64
    %13 = "llvm.alloca"(%12) <{elem_type = f32}> {bindc_name = "ce3"} : (i64) -> !llvm.ptr<5>
    %14 = "llvm.addrspacecast"(%13) : (!llvm.ptr<5>) -> !llvm.ptr
    %15 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64
    %16 = "llvm.alloca"(%15) <{elem_type = f64}> {bindc_name = "ce2"} : (i64) -> !llvm.ptr<5>
    %17 = "llvm.addrspacecast"(%16) : (!llvm.ptr<5>) -> !llvm.ptr
    %18 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64
    %19 = "llvm.alloca"(%18) <{elem_type = f64}> {bindc_name = "ce1"} : (i64) -> !llvm.ptr<5>
    %20 = "llvm.addrspacecast"(%19) : (!llvm.ptr<5>) -> !llvm.ptr
    %21 = "llvm.mlir.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %22 = "llvm.mlir.constant"() <{value = 0.000000e+00 : f64}> : () -> f64
    %23 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64
    %24 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64
    %25 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64
    %26 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64
    %27 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64
    %28 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64
    %29 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64
    "llvm.store"(%22, %20) <{ordering = 0 : i64}> : (f64, !llvm.ptr) -> ()
    "llvm.store"(%22, %17) <{ordering = 0 : i64}> : (f64, !llvm.ptr) -> ()
    "llvm.store"(%21, %14) <{ordering = 0 : i64}> : (f32, !llvm.ptr) -> ()
    "llvm.store"(%21, %11) <{ordering = 0 : i64}> : (f32, !llvm.ptr) -> ()
    %30 = "omp.map.info"(%20) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags to|from>, name = "ce1", operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_type = f64}> : (!llvm.ptr) -> !llvm.ptr
    %31 = "omp.map.info"(%17) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags to|from>, name = "ce2", operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_type = f64}> : (!llvm.ptr) -> !llvm.ptr
    %32 = "omp.map.info"(%14) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags to|from>, name = "ce3", operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_type = f32}> : (!llvm.ptr) -> !llvm.ptr
    %33 = "omp.map.info"(%11) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags to|from>, name = "ce4", operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_type = f32}> : (!llvm.ptr) -> !llvm.ptr
    %34 = "omp.map.info"(%5) <{map_capture_type = #omp<variable_capture_kind(ByCopy)>, map_type = #omp<clause_map_flags implicit>, name = "j", operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_type = i32}> : (!llvm.ptr) -> !llvm.ptr
    "omp.target"(%30, %31, %32, %33, %34) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0, 5, 0, 0>}> ({
    ^bb0(%arg0: !llvm.ptr, %arg1: !llvm.ptr, %arg2: !llvm.ptr, %arg3: !llvm.ptr, %arg4: !llvm.ptr):
      %35 = "llvm.mlir.constant"() <{value = 1.000000e+00 : f32}> : () -> f32
      %36 = "llvm.mlir.constant"() <{value = 1.000000e+00 : f64}> : () -> f64
      %37 = "llvm.mlir.constant"() <{value = 1000 : i32}> : () -> i32
      %38 = "llvm.mlir.constant"() <{value = 1 : i32}> : () -> i32
      "omp.teams"(%arg0, %arg1, %arg2, %arg3) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 4, 0>, reduction_byref = array<i1: false, false, false, false>, reduction_syms = [@add_reduction_f64, @add_reduction_f64, @add_reduction_f32, @add_reduction_f32]}> ({
      ^bb0(%arg5: !llvm.ptr, %arg6: !llvm.ptr, %arg7: !llvm.ptr, %arg8: !llvm.ptr):
        "omp.parallel"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0>}> ({
          "omp.distribute"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0>}> ({
            "omp.wsloop"(%arg5, %arg6, %arg7, %arg8) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 4, 0>, reduction_byref = array<i1: false, false, false, false>, reduction_syms = [@add_reduction_f64, @add_reduction_f64, @add_reduction_f32, @add_reduction_f32]}> ({
            ^bb0(%arg9: !llvm.ptr, %arg10: !llvm.ptr, %arg11: !llvm.ptr, %arg12: !llvm.ptr):
              "omp.simd"(%arg4, %arg9, %arg10, %arg11, %arg12) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 1, 4>, private_syms = [@_QFEj_private_i32], reduction_byref = array<i1: false, false, false, false>, reduction_syms = [@add_reduction_f64, @add_reduction_f64, @add_reduction_f32, @add_reduction_f32]}> ({
              ^bb0(%arg13: !llvm.ptr, %arg14: !llvm.ptr, %arg15: !llvm.ptr, %arg16: !llvm.ptr, %arg17: !llvm.ptr):
                "omp.loop_nest"(%38, %37, %38) <{loop_inclusive}> ({
                ^bb0(%arg18: i32):
                  "llvm.store"(%arg18, %arg13) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> ()
                  %39 = "llvm.load"(%arg14) <{ordering = 0 : i64}> : (!llvm.ptr) -> f64
                  %40 = "llvm.fadd"(%39, %36) <{fastmathFlags = #llvm.fastmath<contract>}> : (f64, f64) -> f64
                  "llvm.store"(%40, %arg14) <{ordering = 0 : i64}> : (f64, !llvm.ptr) -> ()
                  %41 = "llvm.load"(%arg15) <{ordering = 0 : i64}> : (!llvm.ptr) -> f64
                  %42 = "llvm.fadd"(%41, %36) <{fastmathFlags = #llvm.fastmath<contract>}> : (f64, f64) -> f64
                  "llvm.store"(%42, %arg15) <{ordering = 0 : i64}> : (f64, !llvm.ptr) -> ()
                  %43 = "llvm.load"(%arg16) <{ordering = 0 : i64}> : (!llvm.ptr) -> f32
                  %44 = "llvm.fadd"(%43, %35) <{fastmathFlags = #llvm.fastmath<contract>}> : (f32, f32) -> f32
                  "llvm.store"(%44, %arg16) <{ordering = 0 : i64}> : (f32, !llvm.ptr) -> ()
                  %45 = "llvm.load"(%arg17) <{ordering = 0 : i64}> : (!llvm.ptr) -> f32
                  %46 = "llvm.fadd"(%45, %35) <{fastmathFlags = #llvm.fastmath<contract>}> : (f32, f32) -> f32
                  "llvm.store"(%46, %arg17) <{ordering = 0 : i64}> : (f32, !llvm.ptr) -> ()
                  "omp.yield"() : () -> ()
                }) : (i32, i32, i32) -> ()
              }) {omp.composite} : (!llvm.ptr, !llvm.ptr, !llvm.ptr, !llvm.ptr, !llvm.ptr) -> ()
            }) {omp.composite} : (!llvm.ptr, !llvm.ptr, !llvm.ptr, !llvm.ptr) -> ()
          }) {omp.composite} : () -> ()
          "omp.terminator"() : () -> ()
        }) {omp.composite} : () -> ()
        "omp.terminator"() : () -> ()
      }) : (!llvm.ptr, !llvm.ptr, !llvm.ptr, !llvm.ptr) -> ()
      "omp.terminator"() : () -> ()
    }) : (!llvm.ptr, !llvm.ptr, !llvm.ptr, !llvm.ptr, !llvm.ptr) -> ()
    "llvm.return"() : () -> ()
  }) {fir.bindc_name = "reduction", omp.declare_target = #omp.declaretarget<device_type = (host), capture_clause = (to)>} : () -> ()
}) {dlti.dl_spec = #dlti.dl_spec<"dlti.alloca_memory_space" = 5 : ui32>, llvm.data_layout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-p7:160:256:256:32-p8:128:128:128:48-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7:8", llvm.target_triple = "amdgcn-amd-amdhsa", omp.is_gpu = true, omp.is_target_device = true} : () -> ()

