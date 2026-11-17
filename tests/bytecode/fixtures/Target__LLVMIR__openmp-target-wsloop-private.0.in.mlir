"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr)>, linkage = #llvm.linkage<external>, sym_name = "foo", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> () loc("<stdin>":2:3)
  "omp.private"() <{data_sharing_type = #omp<data_sharing_type{type = private}>, sym_name = "impure_alloca_privatizer", type = !llvm.ptr}> ({
  ^bb0(%arg2: !llvm.ptr loc("<stdin>":5:8), %arg3: !llvm.ptr loc("<stdin>":5:26)):
    "llvm.call"(%arg2) <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @foo, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 1, 0>}> : (!llvm.ptr) -> () loc("<stdin>":6:5)
    "omp.yield"(%arg3) : (!llvm.ptr) -> () loc("<stdin>":7:5)
  }, {
  }, {
  }) : () -> () loc("<stdin>":4:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "test_alloca_ip_workaround", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "omp.target"() <{kernel_type = #omp<kernel_type(generic)>, operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0>}> ({
      %0 = "llvm.mlir.constant"() <{value = 1 : i32}> : () -> i32 loc("<stdin>":13:12)
      %1 = "llvm.alloca"(%0) <{alignment = 8 : i64, elem_type = !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8, array<1 x array<3 x i64>>)>}> : (i32) -> !llvm.ptr loc("<stdin>":14:12)
      %2 = "llvm.mlir.constant"() <{value = 0 : index}> : () -> i64 loc("<stdin>":15:12)
      %3 = "llvm.mlir.constant"() <{value = 10 : i32}> : () -> i32 loc("<stdin>":16:12)
      %4 = "llvm.mlir.constant"() <{value = 1 : i32}> : () -> i32 loc("<stdin>":17:12)
      "omp.wsloop"(%1) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 1, 0, 0>, private_syms = [@impure_alloca_privatizer]}> ({
      ^bb0(%arg0: !llvm.ptr loc("<stdin>":19:12)):
        "omp.loop_nest"(%4, %3, %4) <{loop_inclusive}> ({
        ^bb0(%arg1: i32 loc("<stdin>":21:14)):
          "omp.yield"() : () -> () loc("<stdin>":22:11)
        }) : (i32, i32, i32) -> () loc("<stdin>":20:9)
      }) : (!llvm.ptr) -> () loc("<stdin>":18:7)
      "omp.terminator"() : () -> () loc("<stdin>":25:7)
    }) : () -> () loc("<stdin>":12:5)
    "llvm.return"() : () -> () loc("<stdin>":27:5)
  }) : () -> () loc("<stdin>":11:3)
}) : () -> () loc("<stdin>":1:1)
