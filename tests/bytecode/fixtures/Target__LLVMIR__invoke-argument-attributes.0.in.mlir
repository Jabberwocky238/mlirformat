"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, arg_attrs = [{llvm.noundef, llvm.signext}], function_type = !llvm.func<i16 (i16)>, linkage = #llvm.linkage<external>, personality = @__gxx_personality_v0, res_attrs = [{llvm.signext}], sym_name = "test", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: i16 loc("<stdin>":3:8)):
    %0 = "llvm.mlir.zero"() : () -> !llvm.ptr loc("<stdin>":4:10)
    %1 = "llvm.mlir.constant"() <{value = 0 : i16}> : () -> i16 loc("<stdin>":5:10)
    %2 = "llvm.invoke"(%arg0)[^bb2, ^bb1] <{CConv = #llvm.cconv<ccc>, arg_attrs = [{llvm.noundef, llvm.signext}], callee = @somefunc, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, res_attrs = [{llvm.signext}]}> : (i16) -> i16 loc("<stdin>":6:10)
  ^bb1:  // pred: ^bb0
    %3 = "llvm.landingpad"(%0) : (!llvm.ptr) -> !llvm.struct<(ptr, i32)> loc("<stdin>":8:10)
    %4 = "llvm.extractvalue"(%3) <{position = array<i64: 0>}> : (!llvm.struct<(ptr, i32)>) -> !llvm.ptr loc("<stdin>":9:10)
    %5 = "llvm.call"(%4) <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<tail>, callee = @__cxa_begin_catch, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 1, 0>}> : (!llvm.ptr) -> !llvm.ptr loc("<stdin>":10:10)
    "llvm.call"() <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<tail>, callee = @__cxa_end_catch, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 0, 0>}> : () -> () loc("<stdin>":11:5)
    "llvm.br"(%1)[^bb3] : (i16) -> () loc("<stdin>":12:5)
  ^bb2:  // pred: ^bb0
    "llvm.br"(%2)[^bb3] : (i16) -> () loc("<stdin>":14:5)
  ^bb3(%6: i16 loc("<stdin>":15:8)):  // 2 preds: ^bb1, ^bb2
    "llvm.return"(%6) : (i16) -> () loc("<stdin>":16:5)
  }) : () -> () loc("<stdin>":2:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, arg_attrs = [{llvm.noundef, llvm.signext}], function_type = !llvm.func<i16 (i16)>, linkage = #llvm.linkage<external>, res_attrs = [{llvm.noundef, llvm.signext}], sym_name = "somefunc", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> () loc("<stdin>":18:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<i32 (...)>, linkage = #llvm.linkage<external>, sym_name = "__gxx_personality_v0", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> () loc("<stdin>":20:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<ptr (ptr)>, linkage = #llvm.linkage<external>, sym_name = "__cxa_begin_catch", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> () loc("<stdin>":22:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "__cxa_end_catch", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> () loc("<stdin>":24:3)
}) : () -> () loc("<stdin>":1:1)
