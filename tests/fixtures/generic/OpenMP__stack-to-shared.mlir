"builtin.module"() ({
  "omp.declare_reduction"() <{sym_name = "add_f32", type = f32}> ({
  }, {
  ^bb0(%arg14: f32):
    %23 = "llvm.mlir.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    "omp.yield"(%23) : (f32) -> ()
  }, {
  ^bb0(%arg12: f32, %arg13: f32):
    %22 = "llvm.fadd"(%arg12, %arg13) <{fastmathFlags = #llvm.fastmath<none>}> : (f32, f32) -> f32
    "omp.yield"(%22) : (f32) -> ()
  }, {
  ^bb0(%arg10: !llvm.ptr, %arg11: !llvm.ptr):
    %20 = "llvm.load"(%arg11) <{ordering = 0 : i64}> : (!llvm.ptr) -> f32
    %21 = "llvm.atomicrmw"(%arg10, %20) <{bin_op = 11 : i64, ordering = 2 : i64}> : (!llvm.ptr, f32) -> f32
    "omp.yield"() : () -> ()
  }, {
  }, {
  }) : () -> ()
  "omp.private"() <{data_sharing_type = #omp<data_sharing_type{type = private}>, sym_name = "privatizer_i32", type = i32}> ({
  }, {
  }, {
  }) : () -> ()
  "omp.private"() <{data_sharing_type = #omp<data_sharing_type{type = firstprivate}>, sym_name = "firstprivatizer_f32", type = !llvm.ptr}> ({
  }, {
  ^bb0(%arg8: !llvm.ptr, %arg9: !llvm.ptr):
    "omp.yield"(%arg8) : (!llvm.ptr) -> ()
  }, {
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr)>, linkage = #llvm.linkage<external>, sym_name = "foo", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) {omp.declare_target = #omp.declaretarget<device_type = (any), capture_clause = (to)>} : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (i64, i1)>, linkage = #llvm.linkage<external>, sym_name = "device_func", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg2: i64, %arg3: i1):
    %10 = "llvm.alloca"(%arg2) <{elem_type = i64}> : (i64) -> !llvm.ptr
    %11 = "llvm.alloca"(%arg2) <{alignment = 128 : i64, elem_type = f32}> : (i64) -> !llvm.ptr
    %12 = "llvm.alloca"(%arg2) <{elem_type = vector<16xf32>}> : (i64) -> !llvm.ptr
    %13 = "llvm.alloca"(%arg2) <{elem_type = i32}> : (i64) -> !llvm.ptr<5>
    %14 = "llvm.addrspacecast"(%13) : (!llvm.ptr<5>) -> !llvm.ptr
    %15 = "llvm.alloca"(%arg2) <{elem_type = i32}> : (i64) -> !llvm.ptr
    %16 = "llvm.alloca"(%arg2) <{elem_type = i32}> : (i64) -> !llvm.ptr
    "llvm.cond_br"(%arg3)[^bb1, ^bb2] <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (i1) -> ()
  ^bb1:  // pred: ^bb0
    "omp.parallel"(%10) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 1>, reduction_byref = array<i1: false>, reduction_syms = [@add_f32]}> ({
    ^bb0(%arg4: !llvm.ptr):
      %18 = "llvm.load"(%12) <{ordering = 0 : i64}> : (!llvm.ptr) -> vector<16xf32>
      %19 = "llvm.alloca"(%arg2) <{elem_type = i32}> : (i64) -> !llvm.ptr
      "omp.wsloop"(%15, %11) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 2, 0, 0>, private_syms = [@privatizer_i32, @firstprivatizer_f32]}> ({
      ^bb0(%arg5: !llvm.ptr, %arg6: !llvm.ptr):
        "omp.loop_nest"(%arg2, %arg2, %arg2) <{loop_inclusive}> ({
        ^bb0(%arg7: i64):
          "llvm.call"(%arg4) <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @foo, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 1, 0>}> : (!llvm.ptr) -> ()
          "llvm.call"(%19) <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @foo, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 1, 0>}> : (!llvm.ptr) -> ()
          "llvm.call"(%arg5) <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @foo, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 1, 0>}> : (!llvm.ptr) -> ()
          "llvm.call"(%arg6) <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @foo, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 1, 0>}> : (!llvm.ptr) -> ()
          "omp.yield"() : () -> ()
        }) : (i64, i64, i64) -> ()
      }) : (!llvm.ptr, !llvm.ptr) -> ()
      "omp.terminator"() : () -> ()
    }) : (!llvm.ptr) -> ()
    "llvm.br"()[^bb3] : () -> ()
  ^bb2:  // pred: ^bb0
    "llvm.call"(%14) <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @foo, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 1, 0>}> : (!llvm.ptr) -> ()
    %17 = "llvm.load"(%16) <{ordering = 0 : i64}> : (!llvm.ptr) -> i32
    "llvm.br"()[^bb3] : () -> ()
  ^bb3:  // 2 preds: ^bb1, ^bb2
    "llvm.return"() : () -> ()
  }) {omp.declare_target = #omp.declaretarget<device_type = (nohost), capture_clause = (to)>} : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (i64)>, linkage = #llvm.linkage<external>, sym_name = "host_func", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg1: i64):
    %7 = "llvm.alloca"(%arg1) <{elem_type = i32}> : (i64) -> !llvm.ptr
    "omp.parallel"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0>}> ({
      "llvm.call"(%7) <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @foo, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 1, 0>}> : (!llvm.ptr) -> ()
      "omp.target"() <{kernel_type = #omp<kernel_type(generic)>, operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0>}> ({
        %8 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64
        %9 = "llvm.alloca"(%8) <{elem_type = i32}> : (i64) -> !llvm.ptr
        "llvm.call"(%9) <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @foo, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 1, 0>}> : (!llvm.ptr) -> ()
        "omp.terminator"() : () -> ()
      }) : () -> ()
      "omp.terminator"() : () -> ()
    }) : () -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "target_spmd", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "omp.target"() <{kernel_type = #omp<kernel_type(spmd)>, operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0>}> ({
      %0 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64
      %1 = "llvm.alloca"(%0) <{elem_type = i32}> : (i64) -> !llvm.ptr
      "omp.teams"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0>}> ({
        %2 = "llvm.alloca"(%0) <{elem_type = i32}> : (i64) -> !llvm.ptr
        "omp.parallel"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0>}> ({
          %3 = "llvm.alloca"(%0) <{elem_type = i32}> : (i64) -> !llvm.ptr
          %4 = "llvm.load"(%1) <{ordering = 0 : i64}> : (!llvm.ptr) -> i32
          %5 = "llvm.load"(%2) <{ordering = 0 : i64}> : (!llvm.ptr) -> i32
          "omp.distribute"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0>}> ({
            "omp.wsloop"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0>}> ({
              "omp.loop_nest"(%0, %0, %0) <{loop_inclusive}> ({
              ^bb0(%arg0: i64):
                %6 = "llvm.load"(%3) <{ordering = 0 : i64}> : (!llvm.ptr) -> i32
                "omp.yield"() : () -> ()
              }) : (i64, i64, i64) -> ()
            }) {omp.composite} : () -> ()
          }) {omp.composite} : () -> ()
          "omp.terminator"() : () -> ()
        }) {omp.composite} : () -> ()
        "omp.terminator"() : () -> ()
      }) {omp.combined} : () -> ()
      "omp.terminator"() : () -> ()
    }) {omp.combined} : () -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) {omp.is_target_device = true} : () -> ()

