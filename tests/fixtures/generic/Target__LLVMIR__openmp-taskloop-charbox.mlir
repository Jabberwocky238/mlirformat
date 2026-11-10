"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr, i64)>, linkage = #llvm.linkage<external>, sym_name = "use_body_box", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr, i64)>, linkage = #llvm.linkage<external>, sym_name = "copy_box", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr, i64)>, linkage = #llvm.linkage<external>, sym_name = "dealloc_box", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "omp.private"() <{data_sharing_type = #omp<data_sharing_type{type = firstprivate}>, sym_name = "box_firstprivate", type = !llvm.struct<(ptr, i64)>}> ({
  ^bb0(%arg7: !llvm.struct<(ptr, i64)>, %arg8: !llvm.struct<(ptr, i64)>):
    %11 = "llvm.extractvalue"(%arg7) <{position = array<i64: 0>}> : (!llvm.struct<(ptr, i64)>) -> !llvm.ptr
    %12 = "llvm.extractvalue"(%arg7) <{position = array<i64: 1>}> : (!llvm.struct<(ptr, i64)>) -> i64
    %13 = "llvm.mlir.undef"() : () -> !llvm.struct<(ptr, i64)>
    %14 = "llvm.insertvalue"(%13, %11) <{position = array<i64: 0>}> : (!llvm.struct<(ptr, i64)>, !llvm.ptr) -> !llvm.struct<(ptr, i64)>
    %15 = "llvm.insertvalue"(%14, %12) <{position = array<i64: 1>}> : (!llvm.struct<(ptr, i64)>, i64) -> !llvm.struct<(ptr, i64)>
    "omp.yield"(%15) : (!llvm.struct<(ptr, i64)>) -> ()
  }, {
  ^bb0(%arg5: !llvm.struct<(ptr, i64)>, %arg6: !llvm.struct<(ptr, i64)>):
    %9 = "llvm.extractvalue"(%arg5) <{position = array<i64: 0>}> : (!llvm.struct<(ptr, i64)>) -> !llvm.ptr
    %10 = "llvm.extractvalue"(%arg5) <{position = array<i64: 1>}> : (!llvm.struct<(ptr, i64)>) -> i64
    "llvm.call"(%9, %10) <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @copy_box, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 2, 0>}> : (!llvm.ptr, i64) -> ()
    "omp.yield"(%arg5) : (!llvm.struct<(ptr, i64)>) -> ()
  }, {
  ^bb0(%arg4: !llvm.struct<(ptr, i64)>):
    %7 = "llvm.extractvalue"(%arg4) <{position = array<i64: 0>}> : (!llvm.struct<(ptr, i64)>) -> !llvm.ptr
    %8 = "llvm.extractvalue"(%arg4) <{position = array<i64: 1>}> : (!llvm.struct<(ptr, i64)>) -> i64
    "llvm.call"(%7, %8) <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @dealloc_box, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 2, 0>}> : (!llvm.ptr, i64) -> ()
    "omp.yield"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr, i64)>, linkage = #llvm.linkage<external>, sym_name = "test", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: !llvm.ptr, %arg1: i64):
    %0 = "llvm.mlir.undef"() : () -> !llvm.struct<(ptr, i64)>
    %1 = "llvm.insertvalue"(%0, %arg0) <{position = array<i64: 0>}> : (!llvm.struct<(ptr, i64)>, !llvm.ptr) -> !llvm.struct<(ptr, i64)>
    %2 = "llvm.insertvalue"(%1, %arg1) <{position = array<i64: 1>}> : (!llvm.struct<(ptr, i64)>, i64) -> !llvm.struct<(ptr, i64)>
    %3 = "llvm.mlir.constant"() <{value = 1 : i32}> : () -> i32
    %4 = "llvm.mlir.constant"() <{value = 2 : i32}> : () -> i32
    "omp.taskloop.context"(%2) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 1, 0>, private_syms = [@box_firstprivate]}> ({
    ^bb0(%arg2: !llvm.struct<(ptr, i64)>):
      "omp.taskloop.wrapper"() ({
        "omp.loop_nest"(%3, %4, %3) <{loop_inclusive}> ({
        ^bb0(%arg3: i32):
          %5 = "llvm.extractvalue"(%arg2) <{position = array<i64: 0>}> : (!llvm.struct<(ptr, i64)>) -> !llvm.ptr
          %6 = "llvm.extractvalue"(%arg2) <{position = array<i64: 1>}> : (!llvm.struct<(ptr, i64)>) -> i64
          "llvm.call"(%5, %6) <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @use_body_box, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 2, 0>}> : (!llvm.ptr, i64) -> ()
          "omp.yield"() : () -> ()
        }) : (i32, i32, i32) -> ()
      }) : () -> ()
      "omp.terminator"() : () -> ()
    }) {omp.combined} : (!llvm.struct<(ptr, i64)>) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

