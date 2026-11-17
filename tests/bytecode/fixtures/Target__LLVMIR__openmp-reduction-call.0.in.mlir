"builtin.module"() ({
  "omp.declare_reduction"() <{sym_name = "add_f32", type = f32}> ({
  }, {
  ^bb0(%arg6: f32 loc("<stdin>":4:8)):
    %6 = "llvm.mlir.constant"() <{value = 0.000000e+00 : f32}> : () -> f32 loc("<stdin>":5:10)
    "omp.yield"(%6) : (f32) -> () loc("<stdin>":6:5)
  }, {
  ^bb0(%arg4: f32 loc("<stdin>":8:8), %arg5: f32 loc("<stdin>":8:20)):
    "llvm.call"() <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @test_call, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 0, 0>}> : () -> () loc("<stdin>":9:5)
    %5 = "llvm.fadd"(%arg4, %arg5) <{fastmathFlags = #llvm.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":10:10)
    "omp.yield"(%5) : (f32) -> () loc("<stdin>":11:5)
  }, {
  }, {
  }, {
  }) : () -> () loc("<stdin>":2:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (i64, i64, i64)>, linkage = #llvm.linkage<external>, sym_name = "simple_reduction", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: i64 loc("<stdin>":17:8), %arg1: i64 loc("<stdin>":17:20), %arg2: i64 loc("<stdin>":17:32)):
    %0 = "llvm.mlir.constant"() <{value = 1 : i32}> : () -> i32 loc("<stdin>":18:10)
    %1 = "llvm.alloca"(%0) <{elem_type = i32}> : (i32) -> !llvm.ptr loc("<stdin>":19:10)
    "omp.parallel"(%1) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 1>, reduction_byref = array<i1: false>, reduction_syms = [@add_f32]}> ({
    ^bb0(%arg3: !llvm.ptr loc("<stdin>":21:10)):
      %2 = "llvm.mlir.constant"() <{value = 2.000000e+00 : f32}> : () -> f32 loc("<stdin>":22:12)
      %3 = "llvm.load"(%arg3) <{ordering = 0 : i64}> : (!llvm.ptr) -> f32 loc("<stdin>":23:12)
      %4 = "llvm.fadd"(%2, %3) <{fastmathFlags = #llvm.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":24:12)
      "llvm.store"(%4, %arg3) <{ordering = 0 : i64}> : (f32, !llvm.ptr) -> () loc("<stdin>":25:7)
      "omp.terminator"() : () -> () loc("<stdin>":26:7)
    }) : (!llvm.ptr) -> () loc("<stdin>":20:5)
    "llvm.return"() : () -> () loc("<stdin>":28:5)
  }) : () -> () loc("<stdin>":16:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "test_call", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> () loc("<stdin>":30:3)
}) : () -> () loc("<stdin>":1:1)
