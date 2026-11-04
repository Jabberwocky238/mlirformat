"builtin.module"() ({
  "omp.declare_reduction"() <{sym_name = "add_reduction", type = !llvm.ptr}> ({
    %4 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64
    %5 = "llvm.alloca"(%4) <{elem_type = !llvm.struct<(ptr)>}> : (i64) -> !llvm.ptr
    "omp.yield"(%5) : (!llvm.ptr) -> ()
  }, {
  ^bb0(%arg5: !llvm.ptr, %arg6: !llvm.ptr):
    %3 = "llvm.mlir.constant"() <{value = 1 : i32}> : () -> i32
    "llvm.intr.memcpy"(%arg6, %arg5, %3) <{isVolatile = false}> : (!llvm.ptr, !llvm.ptr, i32) -> ()
    "omp.yield"(%arg6) : (!llvm.ptr) -> ()
  }, {
  ^bb0(%arg3: !llvm.ptr, %arg4: !llvm.ptr):
    "omp.yield"(%arg3) : (!llvm.ptr) -> ()
  }, {
  }, {
  ^bb0(%arg2: !llvm.ptr):
    "omp.yield"() : () -> ()
  }, {
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "use_reduction", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %0 = "llvm.mlir.constant"() <{value = 1 : i32}> : () -> i32
    "omp.parallel"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0>}> ({
      %1 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64
      %2 = "llvm.alloca"(%1) <{elem_type = !llvm.struct<(ptr)>}> : (i64) -> !llvm.ptr
      "omp.wsloop"(%2) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 1, 0>, reduction_byref = array<i1: true>, reduction_syms = [@add_reduction]}> ({
      ^bb0(%arg0: !llvm.ptr):
        "omp.loop_nest"(%0, %0, %0) <{loop_inclusive}> ({
        ^bb0(%arg1: i32):
          "omp.yield"() : () -> ()
        }) : (i32, i32, i32) -> ()
      }) : (!llvm.ptr) -> ()
      "omp.terminator"() : () -> ()
    }) : () -> ()
    "llvm.return"() : () -> ()
  }) {fir.bindc_name = "test"} : () -> ()
}) : () -> ()

