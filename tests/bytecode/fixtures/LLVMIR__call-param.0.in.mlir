"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, arg_attrs = [{llvm.alignstack = 8 : i64}], function_type = !llvm.func<void (array<2 x f32>)>, linkage = #llvm.linkage<external>, sym_name = "testfn", unnamed_addr = 1 : i64, visibility_ = 0 : i64}> ({
  }) : () -> () loc("<stdin>":2:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, dso_local, function_type = !llvm.func<void (array<2 x f32>)>, linkage = #llvm.linkage<internal>, sym_name = "g", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg2: !llvm.array<2 x f32> loc("<stdin>":5:8)):
    "llvm.call"(%arg2) <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, arg_attrs = [{llvm.alignstack = 8 : i64}], callee = @testfn, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 1, 0>}> : (!llvm.array<2 x f32>) -> () loc("<stdin>":6:5)
    "llvm.return"() : () -> () loc("<stdin>":7:5)
  }) : () -> () loc("<stdin>":4:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, arg_attrs = [{llvm.alignstack = 8 : i64}], function_type = !llvm.func<void (struct<(i8, i8)>)>, linkage = #llvm.linkage<external>, sym_name = "testfn2", unnamed_addr = 1 : i64, visibility_ = 0 : i64}> ({
  }) : () -> () loc("<stdin>":9:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, dso_local, function_type = !llvm.func<void (struct<(i8, i8)>)>, linkage = #llvm.linkage<internal>, sym_name = "h", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg1: !llvm.struct<(i8, i8)> loc("<stdin>":12:8)):
    "llvm.call"(%arg1) <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, arg_attrs = [{llvm.alignstack = 8 : i64}], callee = @testfn2, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 1, 0>}> : (!llvm.struct<(i8, i8)>) -> () loc("<stdin>":13:5)
    "llvm.return"() : () -> () loc("<stdin>":14:5)
  }) : () -> () loc("<stdin>":11:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, arg_attrs = [{llvm.alignstack = 8 : i64}], function_type = !llvm.func<void (i32)>, linkage = #llvm.linkage<external>, sym_name = "testfn3", unnamed_addr = 1 : i64, visibility_ = 0 : i64}> ({
  }) : () -> () loc("<stdin>":16:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, dso_local, function_type = !llvm.func<void (i32)>, linkage = #llvm.linkage<internal>, sym_name = "i", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: i32 loc("<stdin>":19:8)):
    "llvm.call"(%arg0) <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, arg_attrs = [{llvm.alignstack = 8 : i64}], callee = @testfn3, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 1, 0>}> : (i32) -> () loc("<stdin>":20:5)
    "llvm.return"() : () -> () loc("<stdin>":21:5)
  }) : () -> () loc("<stdin>":18:3)
}) : () -> () loc("<stdin>":1:1)
