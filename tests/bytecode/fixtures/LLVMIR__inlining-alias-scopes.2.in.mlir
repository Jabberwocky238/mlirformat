"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, arg_attrs = [{llvm.noalias}, {llvm.noalias}], function_type = !llvm.func<void (ptr, ptr)>, linkage = #llvm.linkage<external>, sym_name = "foo", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg3: !llvm.ptr loc("<stdin>":4:8), %arg4: !llvm.ptr loc("<stdin>":4:26)):
    %0 = "llvm.mlir.constant"() <{value = 5 : i64}> : () -> i64 loc("<stdin>":5:10)
    %1 = "llvm.load"(%arg4) <{alignment = 4 : i64, ordering = 0 : i64}> : (!llvm.ptr) -> f32 loc("<stdin>":6:10)
    %2 = "llvm.getelementptr"(%arg3, %0) <{elem_type = f32, noWrapFlags = 3 : i32, rawConstantIndices = array<i32: -2147483648>}> : (!llvm.ptr, i64) -> !llvm.ptr loc("<stdin>":7:10)
    "llvm.store"(%1, %2) <{alignment = 4 : i64, ordering = 0 : i64}> : (f32, !llvm.ptr) -> () loc("<stdin>":8:5)
    "llvm.return"() : () -> () loc("<stdin>":9:5)
  }) : () -> () loc("<stdin>":3:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr, ptr, ptr)>, linkage = #llvm.linkage<external>, sym_name = "bar", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: !llvm.ptr loc("<stdin>":12:8), %arg1: !llvm.ptr loc("<stdin>":12:26), %arg2: !llvm.ptr loc("<stdin>":12:44)):
    "llvm.call"(%arg0, %arg2) <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @foo, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 2, 0>}> : (!llvm.ptr, !llvm.ptr) -> () loc("<stdin>":13:5)
    "llvm.return"() : () -> () loc("<stdin>":14:5)
  }) : () -> () loc("<stdin>":11:3)
}) : () -> () loc("<stdin>":2:1)
