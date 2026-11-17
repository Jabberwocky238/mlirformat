"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (i32, ptr)>, linkage = #llvm.linkage<external>, sym_name = "somefunc", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> () loc("<stdin>":2:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (i32, ptr)>, linkage = #llvm.linkage<external>, sym_name = "test_call_arg_attrs_direct", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg2: i32 loc("<stdin>":5:8), %arg3: !llvm.ptr loc("<stdin>":5:20)):
    "llvm.call"(%arg2, %arg3) <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, arg_attrs = [{}, {llvm.byval = i64}], callee = @somefunc, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 2, 0>}> : (i32, !llvm.ptr) -> () loc("<stdin>":6:5)
    "llvm.return"() : () -> () loc("<stdin>":7:5)
  }) : () -> () loc("<stdin>":4:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<i16 (i16, ptr)>, linkage = #llvm.linkage<external>, sym_name = "test_call_arg_attrs_indirect", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: i16 loc("<stdin>":10:8), %arg1: !llvm.ptr loc("<stdin>":10:20)):
    %0 = "llvm.call"(%arg1, %arg0) <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<tail>, arg_attrs = [{llvm.noundef, llvm.signext}], fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 2, 0>, res_attrs = [{llvm.signext}]}> : (!llvm.ptr, i16) -> i16 loc("<stdin>":11:10)
    "llvm.return"(%0) : (i16) -> () loc("<stdin>":12:5)
  }) : () -> () loc("<stdin>":9:3)
}) : () -> () loc("<stdin>":1:1)
