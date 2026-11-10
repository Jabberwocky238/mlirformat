"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "scope_basic", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "omp.parallel"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0>}> ({
      "omp.scope"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0>}> ({
        "omp.terminator"() : () -> ()
      }) : () -> ()
      "omp.terminator"() : () -> ()
    }) : () -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "scope_nowait", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "omp.parallel"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0>}> ({
      "omp.scope"() <{nowait, operandSegmentSizes = array<i32: 0, 0, 0, 0>}> ({
        "omp.terminator"() : () -> ()
      }) : () -> ()
      "omp.terminator"() : () -> ()
    }) : () -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "omp.declare_reduction"() <{sym_name = "add_f32", type = f32}> ({
  }, {
  ^bb0(%arg4: f32):
    %4 = "llvm.mlir.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    "omp.yield"(%4) : (f32) -> ()
  }, {
  ^bb0(%arg2: f32, %arg3: f32):
    %3 = "llvm.fadd"(%arg2, %arg3) <{fastmathFlags = #llvm.fastmath<none>}> : (f32, f32) -> f32
    "omp.yield"(%3) : (f32) -> ()
  }, {
  }, {
  }, {
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr)>, linkage = #llvm.linkage<external>, sym_name = "scope_reduction", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: !llvm.ptr):
    "omp.parallel"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0>}> ({
      "omp.scope"(%arg0) <{operandSegmentSizes = array<i32: 0, 0, 0, 1>, reduction_byref = array<i1: false>, reduction_syms = [@add_f32]}> ({
      ^bb0(%arg1: !llvm.ptr):
        %0 = "llvm.mlir.constant"() <{value = 1.000000e+00 : f32}> : () -> f32
        %1 = "llvm.load"(%arg1) <{ordering = 0 : i64}> : (!llvm.ptr) -> f32
        %2 = "llvm.fadd"(%1, %0) <{fastmathFlags = #llvm.fastmath<none>}> : (f32, f32) -> f32
        "llvm.store"(%2, %arg1) <{ordering = 0 : i64}> : (f32, !llvm.ptr) -> ()
        "omp.terminator"() : () -> ()
      }) : (!llvm.ptr) -> ()
      "omp.terminator"() : () -> ()
    }) : () -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "omp.declare_reduction"() <{sym_name = "add_f32_2", type = f32}> ({
  }, {
  ^bb0(%arg4: f32):
    %4 = "llvm.mlir.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    "omp.yield"(%4) : (f32) -> ()
  }, {
  ^bb0(%arg2: f32, %arg3: f32):
    %3 = "llvm.fadd"(%arg2, %arg3) <{fastmathFlags = #llvm.fastmath<none>}> : (f32, f32) -> f32
    "omp.yield"(%3) : (f32) -> ()
  }, {
  }, {
  }, {
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr)>, linkage = #llvm.linkage<external>, sym_name = "scope_reduction_nowait", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: !llvm.ptr):
    "omp.parallel"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0>}> ({
      "omp.scope"(%arg0) <{nowait, operandSegmentSizes = array<i32: 0, 0, 0, 1>, reduction_byref = array<i1: false>, reduction_syms = [@add_f32_2]}> ({
      ^bb0(%arg1: !llvm.ptr):
        %0 = "llvm.mlir.constant"() <{value = 1.000000e+00 : f32}> : () -> f32
        %1 = "llvm.load"(%arg1) <{ordering = 0 : i64}> : (!llvm.ptr) -> f32
        %2 = "llvm.fadd"(%1, %0) <{fastmathFlags = #llvm.fastmath<none>}> : (f32, f32) -> f32
        "llvm.store"(%2, %arg1) <{ordering = 0 : i64}> : (f32, !llvm.ptr) -> ()
        "omp.terminator"() : () -> ()
      }) : (!llvm.ptr) -> ()
      "omp.terminator"() : () -> ()
    }) : () -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "omp.private"() <{data_sharing_type = #omp<data_sharing_type{type = private}>, sym_name = "x_private_i32", type = i32}> ({
  }, {
  }, {
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr)>, linkage = #llvm.linkage<external>, sym_name = "scope_private", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: !llvm.ptr):
    %0 = "llvm.mlir.constant"() <{value = 1 : i32}> : () -> i32
    "omp.parallel"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0>}> ({
      "omp.scope"(%arg0) <{operandSegmentSizes = array<i32: 0, 0, 1, 0>, private_syms = [@x_private_i32]}> ({
      ^bb0(%arg1: !llvm.ptr):
        "llvm.store"(%0, %arg1) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> ()
        "omp.terminator"() : () -> ()
      }) : (!llvm.ptr) -> ()
      "omp.terminator"() : () -> ()
    }) : () -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "omp.private"() <{data_sharing_type = #omp<data_sharing_type{type = firstprivate}>, sym_name = "x_firstprivate_i32", type = i32}> ({
  }, {
  ^bb0(%arg2: !llvm.ptr, %arg3: !llvm.ptr):
    %3 = "llvm.load"(%arg2) <{ordering = 0 : i64}> : (!llvm.ptr) -> i32
    "llvm.store"(%3, %arg3) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> ()
    "omp.yield"(%arg3) : (!llvm.ptr) -> ()
  }, {
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr)>, linkage = #llvm.linkage<external>, sym_name = "scope_firstprivate", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: !llvm.ptr):
    %0 = "llvm.mlir.constant"() <{value = 1 : i32}> : () -> i32
    "omp.parallel"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0>}> ({
      "omp.scope"(%arg0) <{operandSegmentSizes = array<i32: 0, 0, 1, 0>, private_syms = [@x_firstprivate_i32]}> ({
      ^bb0(%arg1: !llvm.ptr):
        %1 = "llvm.load"(%arg1) <{ordering = 0 : i64}> : (!llvm.ptr) -> i32
        %2 = "llvm.add"(%1, %0) <{overflowFlags = 0 : i32}> : (i32, i32) -> i32
        "llvm.store"(%2, %arg1) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> ()
        "omp.terminator"() : () -> ()
      }) : (!llvm.ptr) -> ()
      "omp.terminator"() : () -> ()
    }) : () -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

