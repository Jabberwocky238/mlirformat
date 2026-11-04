"builtin.module"() ({
  "omp.declare_reduction"() <{sym_name = "add_f32", type = f32}> ({
  }, {
  ^bb0(%arg6: f32):
    %6 = "llvm.mlir.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    "omp.yield"(%6) : (f32) -> ()
  }, {
  ^bb0(%arg4: f32, %arg5: f32):
    "llvm.call"() <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @test_call, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 0, 0>}> : () -> ()
    %5 = "llvm.fadd"(%arg4, %arg5) <{fastmathFlags = #llvm.fastmath<none>}> : (f32, f32) -> f32
    "omp.yield"(%5) : (f32) -> ()
  }, {
  }, {
  }, {
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (i64, i64, i64)>, linkage = #llvm.linkage<external>, sym_name = "simple_reduction", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: i64, %arg1: i64, %arg2: i64):
    %0 = "llvm.mlir.constant"() <{value = 1 : i32}> : () -> i32
    %1 = "llvm.alloca"(%0) <{elem_type = i32}> : (i32) -> !llvm.ptr
    "omp.parallel"(%1) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 1>, reduction_byref = array<i1: false>, reduction_syms = [@add_f32]}> ({
    ^bb0(%arg3: !llvm.ptr):
      %2 = "llvm.mlir.constant"() <{value = 2.000000e+00 : f32}> : () -> f32
      %3 = "llvm.load"(%arg3) <{ordering = 0 : i64}> : (!llvm.ptr) -> f32
      %4 = "llvm.fadd"(%2, %3) <{fastmathFlags = #llvm.fastmath<none>}> : (f32, f32) -> f32
      "llvm.store"(%4, %arg3) <{ordering = 0 : i64}> : (f32, !llvm.ptr) -> ()
      "omp.terminator"() : () -> ()
    }) : (!llvm.ptr) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "test_call", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
}) : () -> ()

