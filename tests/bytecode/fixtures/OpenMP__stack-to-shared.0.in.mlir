"builtin.module"() ({
  "omp.declare_reduction"() <{sym_name = "add_f32", type = f32}> ({
  }, {
  ^bb0(%arg14: f32 loc("<stdin>":4:8)):
    %23 = "llvm.mlir.constant"() <{value = 0.000000e+00 : f32}> : () -> f32 loc("<stdin>":5:11)
    "omp.yield"(%23) : (f32) -> () loc("<stdin>":6:5)
  }, {
  ^bb0(%arg12: f32 loc("<stdin>":8:8), %arg13: f32 loc("<stdin>":8:21)):
    %22 = "llvm.fadd"(%arg12, %arg13) <{fastmathFlags = #llvm.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":9:11)
    "omp.yield"(%22) : (f32) -> () loc("<stdin>":10:5)
  }, {
  ^bb0(%arg10: !llvm.ptr loc("<stdin>":12:8), %arg11: !llvm.ptr loc("<stdin>":12:27)):
    %20 = "llvm.load"(%arg11) <{ordering = 0 : i64}> : (!llvm.ptr) -> f32 loc("<stdin>":13:11)
    %21 = "llvm.atomicrmw"(%arg10, %20) <{bin_op = 11 : i64, ordering = 2 : i64}> : (!llvm.ptr, f32) -> f32 loc("<stdin>":14:11)
    "omp.yield"() : () -> () loc("<stdin>":15:5)
  }, {
  }, {
  }) : () -> () loc("<stdin>":2:3)
  "omp.private"() <{data_sharing_type = #omp<data_sharing_type{type = private}>, sym_name = "privatizer_i32", type = i32}> ({
  }, {
  }, {
  }) : () -> () loc("<stdin>":19:3)
  "omp.private"() <{data_sharing_type = #omp<data_sharing_type{type = firstprivate}>, sym_name = "firstprivatizer_f32", type = !llvm.ptr}> ({
  }, {
  ^bb0(%arg8: !llvm.ptr loc("<stdin>":25:8), %arg9: !llvm.ptr loc("<stdin>":25:26)):
    "omp.yield"(%arg8) : (!llvm.ptr) -> () loc("<stdin>":26:5)
  }, {
  }) : () -> () loc("<stdin>":23:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr)>, linkage = #llvm.linkage<external>, sym_name = "foo", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) {omp.declare_target = #omp.declaretarget<device_type = (any), capture_clause = (to)>} : () -> () loc("<stdin>":29:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (i64, i1)>, linkage = #llvm.linkage<external>, sym_name = "device_func", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg2: i64 loc("<stdin>":32:8), %arg3: i1 loc("<stdin>":32:20)):
    %10 = "llvm.alloca"(%arg2) <{elem_type = i64}> : (i64) -> !llvm.ptr loc("<stdin>":33:11)
    %11 = "llvm.alloca"(%arg2) <{alignment = 128 : i64, elem_type = f32}> : (i64) -> !llvm.ptr loc("<stdin>":34:11)
    %12 = "llvm.alloca"(%arg2) <{elem_type = vector<16xf32>}> : (i64) -> !llvm.ptr loc("<stdin>":35:11)
    %13 = "llvm.alloca"(%arg2) <{elem_type = i32}> : (i64) -> !llvm.ptr<5> loc("<stdin>":36:11)
    %14 = "llvm.addrspacecast"(%13) : (!llvm.ptr<5>) -> !llvm.ptr loc("<stdin>":37:11)
    %15 = "llvm.alloca"(%arg2) <{elem_type = i32}> : (i64) -> !llvm.ptr loc("<stdin>":38:11)
    %16 = "llvm.alloca"(%arg2) <{elem_type = i32}> : (i64) -> !llvm.ptr loc("<stdin>":39:11)
    "llvm.cond_br"(%arg3)[^bb1, ^bb2] <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (i1) -> () loc("<stdin>":40:5)
  ^bb1:  // pred: ^bb0
    "omp.parallel"(%10) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 1>, reduction_byref = array<i1: false>, reduction_syms = [@add_f32]}> ({
    ^bb0(%arg4: !llvm.ptr loc("<stdin>":43:10)):
      %18 = "llvm.load"(%12) <{ordering = 0 : i64}> : (!llvm.ptr) -> vector<16xf32> loc("<stdin>":44:13)
      %19 = "llvm.alloca"(%arg2) <{elem_type = i32}> : (i64) -> !llvm.ptr loc("<stdin>":45:13)
      "omp.wsloop"(%15, %11) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 2, 0, 0>, private_syms = [@privatizer_i32, @firstprivatizer_f32]}> ({
      ^bb0(%arg5: !llvm.ptr loc("<stdin>":47:12), %arg6: !llvm.ptr loc("<stdin>":47:30)):
        "omp.loop_nest"(%arg2, %arg2, %arg2) <{loop_inclusive}> ({
        ^bb0(%arg7: i64 loc("<stdin>":49:14)):
          "llvm.call"(%arg4) <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @foo, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 1, 0>}> : (!llvm.ptr) -> () loc("<stdin>":50:11)
          "llvm.call"(%19) <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @foo, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 1, 0>}> : (!llvm.ptr) -> () loc("<stdin>":51:11)
          "llvm.call"(%arg5) <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @foo, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 1, 0>}> : (!llvm.ptr) -> () loc("<stdin>":52:11)
          "llvm.call"(%arg6) <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @foo, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 1, 0>}> : (!llvm.ptr) -> () loc("<stdin>":53:11)
          "omp.yield"() : () -> () loc("<stdin>":54:11)
        }) : (i64, i64, i64) -> () loc("<stdin>":48:9)
      }) : (!llvm.ptr, !llvm.ptr) -> () loc("<stdin>":46:7)
      "omp.terminator"() : () -> () loc("<stdin>":57:7)
    }) : (!llvm.ptr) -> () loc("<stdin>":42:5)
    "llvm.br"()[^bb3] : () -> () loc("<stdin>":59:5)
  ^bb2:  // pred: ^bb0
    "llvm.call"(%14) <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @foo, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 1, 0>}> : (!llvm.ptr) -> () loc("<stdin>":61:5)
    %17 = "llvm.load"(%16) <{ordering = 0 : i64}> : (!llvm.ptr) -> i32 loc("<stdin>":62:11)
    "llvm.br"()[^bb3] : () -> () loc("<stdin>":63:5)
  ^bb3:  // 2 preds: ^bb1, ^bb2
    "llvm.return"() : () -> () loc("<stdin>":65:5)
  }) {omp.declare_target = #omp.declaretarget<device_type = (nohost), capture_clause = (to)>} : () -> () loc("<stdin>":31:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (i64)>, linkage = #llvm.linkage<external>, sym_name = "host_func", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg1: i64 loc("<stdin>":68:8)):
    %7 = "llvm.alloca"(%arg1) <{elem_type = i32}> : (i64) -> !llvm.ptr loc("<stdin>":69:10)
    "omp.parallel"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0>}> ({
      "llvm.call"(%7) <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @foo, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 1, 0>}> : (!llvm.ptr) -> () loc("<stdin>":71:7)
      "omp.target"() <{kernel_type = #omp<kernel_type(generic)>, operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0>}> ({
        %8 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64 loc("<stdin>":73:14)
        %9 = "llvm.alloca"(%8) <{elem_type = i32}> : (i64) -> !llvm.ptr loc("<stdin>":74:14)
        "llvm.call"(%9) <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @foo, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 1, 0>}> : (!llvm.ptr) -> () loc("<stdin>":75:9)
        "omp.terminator"() : () -> () loc("<stdin>":76:9)
      }) : () -> () loc("<stdin>":72:7)
      "omp.terminator"() : () -> () loc("<stdin>":78:7)
    }) : () -> () loc("<stdin>":70:5)
    "llvm.return"() : () -> () loc("<stdin>":80:5)
  }) : () -> () loc("<stdin>":67:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "target_spmd", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "omp.target"() <{kernel_type = #omp<kernel_type(spmd)>, operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0>}> ({
      %0 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64 loc("<stdin>":84:12)
      %1 = "llvm.alloca"(%0) <{elem_type = i32}> : (i64) -> !llvm.ptr loc("<stdin>":85:12)
      "omp.teams"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0>}> ({
        %2 = "llvm.alloca"(%0) <{elem_type = i32}> : (i64) -> !llvm.ptr loc("<stdin>":87:14)
        "omp.parallel"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0>}> ({
          %3 = "llvm.alloca"(%0) <{elem_type = i32}> : (i64) -> !llvm.ptr loc("<stdin>":89:16)
          %4 = "llvm.load"(%1) <{ordering = 0 : i64}> : (!llvm.ptr) -> i32 loc("<stdin>":90:16)
          %5 = "llvm.load"(%2) <{ordering = 0 : i64}> : (!llvm.ptr) -> i32 loc("<stdin>":91:16)
          "omp.distribute"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0>}> ({
            "omp.wsloop"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0>}> ({
              "omp.loop_nest"(%0, %0, %0) <{loop_inclusive}> ({
              ^bb0(%arg0: i64 loc("<stdin>":95:20)):
                %6 = "llvm.load"(%3) <{ordering = 0 : i64}> : (!llvm.ptr) -> i32 loc("<stdin>":96:22)
                "omp.yield"() : () -> () loc("<stdin>":97:17)
              }) : (i64, i64, i64) -> () loc("<stdin>":94:15)
            }) {omp.composite} : () -> () loc("<stdin>":93:13)
          }) {omp.composite} : () -> () loc("<stdin>":92:11)
          "omp.terminator"() : () -> () loc("<stdin>":101:11)
        }) {omp.composite} : () -> () loc("<stdin>":88:9)
        "omp.terminator"() : () -> () loc("<stdin>":103:9)
      }) {omp.combined} : () -> () loc("<stdin>":86:7)
      "omp.terminator"() : () -> () loc("<stdin>":105:7)
    }) {omp.combined} : () -> () loc("<stdin>":83:5)
    "llvm.return"() : () -> () loc("<stdin>":107:5)
  }) : () -> () loc("<stdin>":82:3)
}) {omp.is_target_device = true} : () -> () loc("<stdin>":1:1)
