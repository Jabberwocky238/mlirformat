"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr, i64)>, linkage = #llvm.linkage<external>, sym_name = "use_body_box", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> () loc("<stdin>":2:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr, i64)>, linkage = #llvm.linkage<external>, sym_name = "copy_box", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> () loc("<stdin>":4:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr, i64)>, linkage = #llvm.linkage<external>, sym_name = "dealloc_box", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> () loc("<stdin>":6:3)
  "omp.private"() <{data_sharing_type = #omp<data_sharing_type{type = firstprivate}>, sym_name = "box_firstprivate", type = !llvm.struct<(ptr, i64)>}> ({
  ^bb0(%arg7: !llvm.struct<(ptr, i64)> loc("<stdin>":9:8), %arg8: !llvm.struct<(ptr, i64)> loc("<stdin>":9:41)):
    %11 = "llvm.extractvalue"(%arg7) <{position = array<i64: 0>}> : (!llvm.struct<(ptr, i64)>) -> !llvm.ptr loc("<stdin>":10:11)
    %12 = "llvm.extractvalue"(%arg7) <{position = array<i64: 1>}> : (!llvm.struct<(ptr, i64)>) -> i64 loc("<stdin>":11:11)
    %13 = "llvm.mlir.undef"() : () -> !llvm.struct<(ptr, i64)> loc("<stdin>":12:11)
    %14 = "llvm.insertvalue"(%13, %11) <{position = array<i64: 0>}> : (!llvm.struct<(ptr, i64)>, !llvm.ptr) -> !llvm.struct<(ptr, i64)> loc("<stdin>":13:11)
    %15 = "llvm.insertvalue"(%14, %12) <{position = array<i64: 1>}> : (!llvm.struct<(ptr, i64)>, i64) -> !llvm.struct<(ptr, i64)> loc("<stdin>":14:11)
    "omp.yield"(%15) : (!llvm.struct<(ptr, i64)>) -> () loc("<stdin>":15:5)
  }, {
  ^bb0(%arg5: !llvm.struct<(ptr, i64)> loc("<stdin>":17:8), %arg6: !llvm.struct<(ptr, i64)> loc("<stdin>":17:41)):
    %9 = "llvm.extractvalue"(%arg5) <{position = array<i64: 0>}> : (!llvm.struct<(ptr, i64)>) -> !llvm.ptr loc("<stdin>":18:10)
    %10 = "llvm.extractvalue"(%arg5) <{position = array<i64: 1>}> : (!llvm.struct<(ptr, i64)>) -> i64 loc("<stdin>":19:11)
    "llvm.call"(%9, %10) <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @copy_box, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 2, 0>}> : (!llvm.ptr, i64) -> () loc("<stdin>":20:5)
    "omp.yield"(%arg5) : (!llvm.struct<(ptr, i64)>) -> () loc("<stdin>":21:5)
  }, {
  ^bb0(%arg4: !llvm.struct<(ptr, i64)> loc("<stdin>":23:8)):
    %7 = "llvm.extractvalue"(%arg4) <{position = array<i64: 0>}> : (!llvm.struct<(ptr, i64)>) -> !llvm.ptr loc("<stdin>":24:10)
    %8 = "llvm.extractvalue"(%arg4) <{position = array<i64: 1>}> : (!llvm.struct<(ptr, i64)>) -> i64 loc("<stdin>":25:10)
    "llvm.call"(%7, %8) <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @dealloc_box, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 2, 0>}> : (!llvm.ptr, i64) -> () loc("<stdin>":26:5)
    "omp.yield"() : () -> () loc("<stdin>":27:5)
  }) : () -> () loc("<stdin>":8:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr, i64)>, linkage = #llvm.linkage<external>, sym_name = "test", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: !llvm.ptr loc("<stdin>":30:8), %arg1: i64 loc("<stdin>":30:26)):
    %0 = "llvm.mlir.undef"() : () -> !llvm.struct<(ptr, i64)> loc("<stdin>":31:10)
    %1 = "llvm.insertvalue"(%0, %arg0) <{position = array<i64: 0>}> : (!llvm.struct<(ptr, i64)>, !llvm.ptr) -> !llvm.struct<(ptr, i64)> loc("<stdin>":32:10)
    %2 = "llvm.insertvalue"(%1, %arg1) <{position = array<i64: 1>}> : (!llvm.struct<(ptr, i64)>, i64) -> !llvm.struct<(ptr, i64)> loc("<stdin>":33:10)
    %3 = "llvm.mlir.constant"() <{value = 1 : i32}> : () -> i32 loc("<stdin>":34:10)
    %4 = "llvm.mlir.constant"() <{value = 2 : i32}> : () -> i32 loc("<stdin>":35:10)
    "omp.taskloop.context"(%2) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 1, 0>, private_syms = [@box_firstprivate]}> ({
    ^bb0(%arg2: !llvm.struct<(ptr, i64)> loc("<stdin>":37:10)):
      "omp.taskloop.wrapper"() ({
        "omp.loop_nest"(%3, %4, %3) <{loop_inclusive}> ({
        ^bb0(%arg3: i32 loc("<stdin>":40:14)):
          %5 = "llvm.extractvalue"(%arg2) <{position = array<i64: 0>}> : (!llvm.struct<(ptr, i64)>) -> !llvm.ptr loc("<stdin>":41:16)
          %6 = "llvm.extractvalue"(%arg2) <{position = array<i64: 1>}> : (!llvm.struct<(ptr, i64)>) -> i64 loc("<stdin>":42:16)
          "llvm.call"(%5, %6) <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @use_body_box, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 2, 0>}> : (!llvm.ptr, i64) -> () loc("<stdin>":43:11)
          "omp.yield"() : () -> () loc("<stdin>":44:11)
        }) : (i32, i32, i32) -> () loc("<stdin>":39:9)
      }) : () -> () loc("<stdin>":38:7)
      "omp.terminator"() : () -> () loc("<stdin>":47:7)
    }) {omp.combined} : (!llvm.struct<(ptr, i64)>) -> () loc("<stdin>":36:5)
    "llvm.return"() : () -> () loc("<stdin>":49:5)
  }) : () -> () loc("<stdin>":29:3)
}) : () -> () loc("<stdin>":1:1)
