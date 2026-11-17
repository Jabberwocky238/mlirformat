"builtin.module"() ({
  "omp.private"() <{data_sharing_type = #omp<data_sharing_type{type = private}>, sym_name = "_QFtest_taskloopEi_private_i32", type = i32}> ({
  }, {
  }, {
  }) : () -> () loc("<stdin>":2:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr)>, linkage = #llvm.linkage<external>, sym_name = "_QPtest_taskloop", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: !llvm.ptr loc("<stdin>":7:8)):
    %0 = "llvm.mlir.constant"() <{value = 48 : i32}> : () -> i32 loc("<stdin>":8:10)
    %1 = "llvm.mlir.constant"() <{value = 1 : i32}> : () -> i32 loc("<stdin>":9:10)
    %2 = "llvm.mlir.constant"() <{value = 100 : i32}> : () -> i32 loc("<stdin>":10:10)
    %3 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64 loc("<stdin>":11:10)
    %4 = "llvm.alloca"(%3) <{elem_type = i32}> : (i64) -> !llvm.ptr loc("<stdin>":12:10)
    "omp.taskloop.context"(%4) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 1, 0>, private_syms = [@_QFtest_taskloopEi_private_i32]}> ({
    ^bb0(%arg1: !llvm.ptr loc("<stdin>":14:10)):
      %5 = "llvm.alloca"(%1) <{alignment = 8 : i64, elem_type = !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8, array<1 x array<3 x i64>>)>}> : (i32) -> !llvm.ptr loc("<stdin>":15:12)
      "omp.taskloop.wrapper"() ({
        "omp.loop_nest"(%1, %2, %1) <{loop_inclusive}> ({
        ^bb0(%arg2: i32 loc("<stdin>":18:14)):
          "llvm.store"(%arg2, %arg1) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> () loc("<stdin>":19:11)
          "llvm.intr.memcpy"(%5, %arg0, %0) <{arg_attrs = [{llvm.align = 8 : i64}, {llvm.align = 8 : i64}, {}], isVolatile = false}> : (!llvm.ptr, !llvm.ptr, i32) -> () loc("<stdin>":20:11)
          %6 = "llvm.getelementptr"(%5) <{elem_type = !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8, array<1 x array<3 x i64>>)>, noWrapFlags = 0 : i32, rawConstantIndices = array<i32: 0, 0>}> : (!llvm.ptr) -> !llvm.ptr loc("<stdin>":21:16)
          %7 = "llvm.load"(%6) <{ordering = 0 : i64}> : (!llvm.ptr) -> !llvm.ptr loc("<stdin>":22:16)
          "llvm.call"(%7) <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @_QPdo_something, fastmathFlags = #llvm.fastmath<contract>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 1, 0>}> : (!llvm.ptr) -> () loc("<stdin>":23:11)
          "omp.yield"() : () -> () loc("<stdin>":24:11)
        }) : (i32, i32, i32) -> () loc("<stdin>":17:9)
      }) : () -> () loc("<stdin>":16:7)
      "omp.terminator"() : () -> () loc("<stdin>":27:7)
    }) {omp.combined} : (!llvm.ptr) -> () loc("<stdin>":13:5)
    "llvm.return"() : () -> () loc("<stdin>":29:5)
  }) : () -> () loc("<stdin>":6:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr)>, linkage = #llvm.linkage<external>, sym_name = "_QPdo_something", sym_visibility = "private", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> () loc("<stdin>":31:3)
}) : () -> () loc("<stdin>":1:1)
