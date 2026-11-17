"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<i8 ()>, linkage = #llvm.linkage<external>, sym_name = "foo", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> () loc("<stdin>":3:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<i32 (...)>, linkage = #llvm.linkage<external>, sym_name = "__gxx_personality_v0", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> () loc("<stdin>":5:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr)>, linkage = #llvm.linkage<external>, personality = @__gxx_personality_v0, sym_name = "invoke_result", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: !llvm.ptr loc("<stdin>":8:8)):
    %0 = "llvm.invoke"()[^bb1, ^bb2] <{CConv = #llvm.cconv<ccc>, callee = @foo, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 0, 0, 0, 0>}> : () -> i8 loc("<stdin>":9:10)
  ^bb1:  // pred: ^bb0
    "llvm.store"(%0, %arg0) <{ordering = 0 : i64}> : (i8, !llvm.ptr) -> () loc("<stdin>":11:5)
    "llvm.return"() : () -> () loc("<stdin>":12:5)
  ^bb2:  // pred: ^bb0
    %1 = "llvm.landingpad"() <{cleanup}> : () -> !llvm.struct<(ptr, i32)> loc("<stdin>":14:10)
    "llvm.return"() : () -> () loc("<stdin>":15:5)
  }) : () -> () loc("<stdin>":7:3)
}) : () -> () loc("<stdin>":2:1)
