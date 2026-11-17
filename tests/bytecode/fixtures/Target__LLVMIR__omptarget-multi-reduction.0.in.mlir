"builtin.module"() ({
  "omp.private"() <{data_sharing_type = #omp<data_sharing_type{type = private}>, sym_name = "_QFEj_private_i32", type = i32}> ({
  }, {
  }, {
  }) : () -> () loc("<stdin>":2:3)
  "omp.declare_reduction"() <{sym_name = "add_reduction_f32", type = f32}> ({
  }, {
  ^bb0(%arg24: f32 loc("<stdin>":8:8)):
    %50 = "llvm.mlir.constant"() <{value = 0.000000e+00 : f32}> : () -> f32 loc("<stdin>":9:11)
    "omp.yield"(%50) : (f32) -> () loc("<stdin>":10:5)
  }, {
  ^bb0(%arg22: f32 loc("<stdin>":12:8), %arg23: f32 loc("<stdin>":12:21)):
    %49 = "llvm.fadd"(%arg22, %arg23) <{fastmathFlags = #llvm.fastmath<contract>}> : (f32, f32) -> f32 loc("<stdin>":13:11)
    "omp.yield"(%49) : (f32) -> () loc("<stdin>":14:5)
  }, {
  }, {
  }, {
  }) : () -> () loc("<stdin>":6:3)
  "omp.declare_reduction"() <{sym_name = "add_reduction_f64", type = f64}> ({
  }, {
  ^bb0(%arg21: f64 loc("<stdin>":21:8)):
    %48 = "llvm.mlir.constant"() <{value = 0.000000e+00 : f64}> : () -> f64 loc("<stdin>":22:11)
    "omp.yield"(%48) : (f64) -> () loc("<stdin>":23:5)
  }, {
  ^bb0(%arg19: f64 loc("<stdin>":25:8), %arg20: f64 loc("<stdin>":25:21)):
    %47 = "llvm.fadd"(%arg19, %arg20) <{fastmathFlags = #llvm.fastmath<contract>}> : (f64, f64) -> f64 loc("<stdin>":26:11)
    "omp.yield"(%47) : (f64) -> () loc("<stdin>":27:5)
  }, {
  }, {
  }, {
  }) : () -> () loc("<stdin>":19:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, frame_pointer = #llvm.framePointerKind<all>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "_QQmain", target_cpu = "gfx1030", target_features = #llvm.target_features<["+16-bit-insts", "+ci-insts", "+dl-insts", "+dot1-insts", "+dot10-insts", "+dot2-insts", "+dot5-insts", "+dot6-insts", "+dot7-insts", "+dpp", "+gfx10-3-insts", "+gfx10-insts", "+gfx8-insts", "+gfx9-insts", "+gws", "+image-insts", "+s-memrealtime", "+s-memtime-inst", "+vmem-to-lds-load-insts", "+wavefrontsize32"]>, unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %0 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64 loc("<stdin>":33:10)
    %1 = "llvm.alloca"(%0) <{elem_type = i32}> {bindc_name = "k"} : (i64) -> !llvm.ptr<5> loc("<stdin>":34:10)
    %2 = "llvm.addrspacecast"(%1) : (!llvm.ptr<5>) -> !llvm.ptr loc("<stdin>":35:10)
    %3 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64 loc("<stdin>":36:10)
    %4 = "llvm.alloca"(%3) <{elem_type = i32}> {bindc_name = "j"} : (i64) -> !llvm.ptr<5> loc("<stdin>":37:10)
    %5 = "llvm.addrspacecast"(%4) : (!llvm.ptr<5>) -> !llvm.ptr loc("<stdin>":38:10)
    %6 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64 loc("<stdin>":39:10)
    %7 = "llvm.alloca"(%6) <{elem_type = i32}> {bindc_name = "i"} : (i64) -> !llvm.ptr<5> loc("<stdin>":40:10)
    %8 = "llvm.addrspacecast"(%7) : (!llvm.ptr<5>) -> !llvm.ptr loc("<stdin>":41:10)
    %9 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64 loc("<stdin>":42:10)
    %10 = "llvm.alloca"(%9) <{elem_type = f32}> {bindc_name = "ce4"} : (i64) -> !llvm.ptr<5> loc("<stdin>":43:11)
    %11 = "llvm.addrspacecast"(%10) : (!llvm.ptr<5>) -> !llvm.ptr loc("<stdin>":44:11)
    %12 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64 loc("<stdin>":45:11)
    %13 = "llvm.alloca"(%12) <{elem_type = f32}> {bindc_name = "ce3"} : (i64) -> !llvm.ptr<5> loc("<stdin>":46:11)
    %14 = "llvm.addrspacecast"(%13) : (!llvm.ptr<5>) -> !llvm.ptr loc("<stdin>":47:11)
    %15 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64 loc("<stdin>":48:11)
    %16 = "llvm.alloca"(%15) <{elem_type = f64}> {bindc_name = "ce2"} : (i64) -> !llvm.ptr<5> loc("<stdin>":49:11)
    %17 = "llvm.addrspacecast"(%16) : (!llvm.ptr<5>) -> !llvm.ptr loc("<stdin>":50:11)
    %18 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64 loc("<stdin>":51:11)
    %19 = "llvm.alloca"(%18) <{elem_type = f64}> {bindc_name = "ce1"} : (i64) -> !llvm.ptr<5> loc("<stdin>":52:11)
    %20 = "llvm.addrspacecast"(%19) : (!llvm.ptr<5>) -> !llvm.ptr loc("<stdin>":53:11)
    %21 = "llvm.mlir.constant"() <{value = 0.000000e+00 : f32}> : () -> f32 loc("<stdin>":54:11)
    %22 = "llvm.mlir.constant"() <{value = 0.000000e+00 : f64}> : () -> f64 loc("<stdin>":55:11)
    %23 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64 loc("<stdin>":56:11)
    %24 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64 loc("<stdin>":57:11)
    %25 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64 loc("<stdin>":58:11)
    %26 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64 loc("<stdin>":59:11)
    %27 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64 loc("<stdin>":60:11)
    %28 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64 loc("<stdin>":61:11)
    %29 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64 loc("<stdin>":62:11)
    "llvm.store"(%22, %20) <{ordering = 0 : i64}> : (f64, !llvm.ptr) -> () loc("<stdin>":63:5)
    "llvm.store"(%22, %17) <{ordering = 0 : i64}> : (f64, !llvm.ptr) -> () loc("<stdin>":64:5)
    "llvm.store"(%21, %14) <{ordering = 0 : i64}> : (f32, !llvm.ptr) -> () loc("<stdin>":65:5)
    "llvm.store"(%21, %11) <{ordering = 0 : i64}> : (f32, !llvm.ptr) -> () loc("<stdin>":66:5)
    %30 = "omp.map.info"(%20) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags to|from>, name = "ce1", operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_ptr_type = f64}> : (!llvm.ptr) -> !llvm.ptr loc("<stdin>":67:11)
    %31 = "omp.map.info"(%17) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags to|from>, name = "ce2", operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_ptr_type = f64}> : (!llvm.ptr) -> !llvm.ptr loc("<stdin>":68:11)
    %32 = "omp.map.info"(%14) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags to|from>, name = "ce3", operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_ptr_type = f32}> : (!llvm.ptr) -> !llvm.ptr loc("<stdin>":69:11)
    %33 = "omp.map.info"(%11) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags to|from>, name = "ce4", operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_ptr_type = f32}> : (!llvm.ptr) -> !llvm.ptr loc("<stdin>":70:11)
    %34 = "omp.map.info"(%5) <{map_capture_type = #omp<variable_capture_kind(ByCopy)>, map_type = #omp<clause_map_flags implicit>, name = "j", operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_ptr_type = i32}> : (!llvm.ptr) -> !llvm.ptr loc("<stdin>":71:11)
    "omp.target"(%30, %31, %32, %33, %34) <{kernel_type = #omp<kernel_type(spmd)>, operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5, 0, 0, 0>}> ({
    ^bb0(%arg0: !llvm.ptr loc("<stdin>":73:10), %arg1: !llvm.ptr loc("<stdin>":73:28), %arg2: !llvm.ptr loc("<stdin>":73:46), %arg3: !llvm.ptr loc("<stdin>":73:64), %arg4: !llvm.ptr loc("<stdin>":73:82)):
      %35 = "llvm.mlir.constant"() <{value = 1.000000e+00 : f32}> : () -> f32 loc("<stdin>":74:13)
      %36 = "llvm.mlir.constant"() <{value = 1.000000e+00 : f64}> : () -> f64 loc("<stdin>":75:13)
      %37 = "llvm.mlir.constant"() <{value = 1000 : i32}> : () -> i32 loc("<stdin>":76:13)
      %38 = "llvm.mlir.constant"() <{value = 1 : i32}> : () -> i32 loc("<stdin>":77:13)
      "omp.teams"(%arg0, %arg1, %arg2, %arg3) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 4, 0>, reduction_byref = array<i1: false, false, false, false>, reduction_syms = [@add_reduction_f64, @add_reduction_f64, @add_reduction_f32, @add_reduction_f32]}> ({
      ^bb0(%arg5: !llvm.ptr loc("<stdin>":79:12), %arg6: !llvm.ptr loc("<stdin>":79:30), %arg7: !llvm.ptr loc("<stdin>":79:48), %arg8: !llvm.ptr loc("<stdin>":79:66)):
        "omp.parallel"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0>}> ({
          "omp.distribute"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0>}> ({
            "omp.wsloop"(%arg5, %arg6, %arg7, %arg8) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 4, 0>, reduction_byref = array<i1: false, false, false, false>, reduction_syms = [@add_reduction_f64, @add_reduction_f64, @add_reduction_f32, @add_reduction_f32]}> ({
            ^bb0(%arg9: !llvm.ptr loc("<stdin>":83:18), %arg10: !llvm.ptr loc("<stdin>":83:36), %arg11: !llvm.ptr loc("<stdin>":83:55), %arg12: !llvm.ptr loc("<stdin>":83:74)):
              "omp.simd"(%arg4, %arg9, %arg10, %arg11, %arg12) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 1, 4>, private_syms = [@_QFEj_private_i32], reduction_byref = array<i1: false, false, false, false>, reduction_syms = [@add_reduction_f64, @add_reduction_f64, @add_reduction_f32, @add_reduction_f32]}> ({
              ^bb0(%arg13: !llvm.ptr loc("<stdin>":85:20), %arg14: !llvm.ptr loc("<stdin>":85:39), %arg15: !llvm.ptr loc("<stdin>":85:58), %arg16: !llvm.ptr loc("<stdin>":85:77), %arg17: !llvm.ptr loc("<stdin>":85:96)):
                "omp.loop_nest"(%38, %37, %38) <{loop_inclusive}> ({
                ^bb0(%arg18: i32 loc("<stdin>":87:22)):
                  "llvm.store"(%arg18, %arg13) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> () loc("<stdin>":88:19)
                  %39 = "llvm.load"(%arg14) <{ordering = 0 : i64}> : (!llvm.ptr) -> f64 loc("<stdin>":89:25)
                  %40 = "llvm.fadd"(%39, %36) <{fastmathFlags = #llvm.fastmath<contract>}> : (f64, f64) -> f64 loc("<stdin>":90:25)
                  "llvm.store"(%40, %arg14) <{ordering = 0 : i64}> : (f64, !llvm.ptr) -> () loc("<stdin>":91:19)
                  %41 = "llvm.load"(%arg15) <{ordering = 0 : i64}> : (!llvm.ptr) -> f64 loc("<stdin>":92:25)
                  %42 = "llvm.fadd"(%41, %36) <{fastmathFlags = #llvm.fastmath<contract>}> : (f64, f64) -> f64 loc("<stdin>":93:25)
                  "llvm.store"(%42, %arg15) <{ordering = 0 : i64}> : (f64, !llvm.ptr) -> () loc("<stdin>":94:19)
                  %43 = "llvm.load"(%arg16) <{ordering = 0 : i64}> : (!llvm.ptr) -> f32 loc("<stdin>":95:25)
                  %44 = "llvm.fadd"(%43, %35) <{fastmathFlags = #llvm.fastmath<contract>}> : (f32, f32) -> f32 loc("<stdin>":96:25)
                  "llvm.store"(%44, %arg16) <{ordering = 0 : i64}> : (f32, !llvm.ptr) -> () loc("<stdin>":97:19)
                  %45 = "llvm.load"(%arg17) <{ordering = 0 : i64}> : (!llvm.ptr) -> f32 loc("<stdin>":98:25)
                  %46 = "llvm.fadd"(%45, %35) <{fastmathFlags = #llvm.fastmath<contract>}> : (f32, f32) -> f32 loc("<stdin>":99:25)
                  "llvm.store"(%46, %arg17) <{ordering = 0 : i64}> : (f32, !llvm.ptr) -> () loc("<stdin>":100:19)
                  "omp.yield"() : () -> () loc("<stdin>":101:19)
                }) : (i32, i32, i32) -> () loc("<stdin>":86:17)
              }) {omp.composite} : (!llvm.ptr, !llvm.ptr, !llvm.ptr, !llvm.ptr, !llvm.ptr) -> () loc("<stdin>":84:15)
            }) {omp.composite} : (!llvm.ptr, !llvm.ptr, !llvm.ptr, !llvm.ptr) -> () loc("<stdin>":82:13)
          }) {omp.composite} : () -> () loc("<stdin>":81:11)
          "omp.terminator"() : () -> () loc("<stdin>":106:11)
        }) {omp.composite} : () -> () loc("<stdin>":80:9)
        "omp.terminator"() : () -> () loc("<stdin>":108:9)
      }) {omp.combined} : (!llvm.ptr, !llvm.ptr, !llvm.ptr, !llvm.ptr) -> () loc("<stdin>":78:7)
      "omp.terminator"() : () -> () loc("<stdin>":110:7)
    }) {omp.combined} : (!llvm.ptr, !llvm.ptr, !llvm.ptr, !llvm.ptr, !llvm.ptr) -> () loc("<stdin>":72:5)
    "llvm.return"() : () -> () loc("<stdin>":112:5)
  }) {fir.bindc_name = "reduction", omp.declare_target = #omp.declaretarget<device_type = (host), capture_clause = (to)>} : () -> () loc("<stdin>":32:3)
}) {dlti.dl_spec = #dlti.dl_spec<"dlti.alloca_memory_space" = 5 : ui32>, llvm.data_layout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-p7:160:256:256:32-p8:128:128:128:48-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7:8", llvm.target_triple = "amdgcn-amd-amdhsa", omp.is_gpu = true, omp.is_target_device = true} : () -> () loc("<stdin>":1:1)
