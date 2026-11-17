"builtin.module"() ({
  "omp.declare_reduction"() <{sym_name = "add_reduction", type = !llvm.ptr}> ({
    %4 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64 loc("<stdin>":3:10)
    %5 = "llvm.alloca"(%4) <{elem_type = !llvm.struct<(ptr)>}> : (i64) -> !llvm.ptr loc("<stdin>":4:10)
    "omp.yield"(%5) : (!llvm.ptr) -> () loc("<stdin>":5:5)
  }, {
  ^bb0(%arg5: !llvm.ptr loc("<stdin>":7:8), %arg6: !llvm.ptr loc("<stdin>":7:26)):
    %3 = "llvm.mlir.constant"() <{value = 1 : i32}> : () -> i32 loc("<stdin>":8:10)
    "llvm.intr.memcpy"(%arg6, %arg5, %3) <{isVolatile = false}> : (!llvm.ptr, !llvm.ptr, i32) -> () loc("<stdin>":9:5)
    "omp.yield"(%arg6) : (!llvm.ptr) -> () loc("<stdin>":10:5)
  }, {
  ^bb0(%arg3: !llvm.ptr loc("<stdin>":12:8), %arg4: !llvm.ptr loc("<stdin>":12:26)):
    "omp.yield"(%arg3) : (!llvm.ptr) -> () loc("<stdin>":13:5)
  }, {
  }, {
  ^bb0(%arg2: !llvm.ptr loc("<stdin>":16:8)):
    "omp.yield"() : () -> () loc("<stdin>":17:5)
  }, {
  }) : () -> () loc("<stdin>":2:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "use_reduction", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %0 = "llvm.mlir.constant"() <{value = 1 : i32}> : () -> i32 loc("<stdin>":21:10)
    "omp.parallel"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0>}> ({
      %1 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64 loc("<stdin>":23:12)
      %2 = "llvm.alloca"(%1) <{elem_type = !llvm.struct<(ptr)>}> : (i64) -> !llvm.ptr loc("<stdin>":24:12)
      "omp.wsloop"(%2) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 1, 0>, reduction_byref = array<i1: true>, reduction_syms = [@add_reduction]}> ({
      ^bb0(%arg0: !llvm.ptr loc("<stdin>":26:12)):
        "omp.loop_nest"(%0, %0, %0) <{loop_inclusive}> ({
        ^bb0(%arg1: i32 loc("<stdin>":28:14)):
          "omp.yield"() : () -> () loc("<stdin>":29:11)
        }) : (i32, i32, i32) -> () loc("<stdin>":27:9)
      }) : (!llvm.ptr) -> () loc("<stdin>":25:7)
      "omp.terminator"() : () -> () loc("<stdin>":32:7)
    }) : () -> () loc("<stdin>":22:5)
    "llvm.return"() : () -> () loc("<stdin>":34:5)
  }) {fir.bindc_name = "test"} : () -> () loc("<stdin>":20:3)
}) : () -> () loc("<stdin>":1:1)
