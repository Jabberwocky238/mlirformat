"builtin.module"() ({
  "llvm.mlir.ifunc"() <{address_space = 0 : i32, dso_local, i_func_type = !llvm.func<void (ptr, i32)>, linkage = #llvm.linkage<external>, resolver = @resolve_foo, resolver_type = !llvm.ptr, sym_name = "foo", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> : () -> () loc("<stdin>":2:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, arg_attrs = [{llvm.noundef}, {llvm.noundef}], dso_local, function_type = !llvm.func<void (ptr, i32)>, linkage = #llvm.linkage<external>, sym_name = "call_foo", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: !llvm.ptr loc("<stdin>":4:8), %arg1: i32 loc("<stdin>":4:26)):
    "llvm.call"(%arg0, %arg1) <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, arg_attrs = [{llvm.noundef}, {llvm.noundef}], callee = @foo, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 2, 0>}> : (!llvm.ptr, i32) -> () loc("<stdin>":5:5)
    "llvm.return"() : () -> () loc("<stdin>":6:5)
  }) : () -> () loc("<stdin>":3:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, dso_local, function_type = !llvm.func<ptr ()>, linkage = #llvm.linkage<external>, sym_name = "foo_fptr", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %1 = "llvm.mlir.addressof"() <{global_name = @foo}> : () -> !llvm.ptr loc("<stdin>":9:10)
    "llvm.return"(%1) : (!llvm.ptr) -> () loc("<stdin>":10:5)
  }) : () -> () loc("<stdin>":8:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, dso_local, function_type = !llvm.func<ptr ()>, linkage = #llvm.linkage<internal>, sym_name = "resolve_foo", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %0 = "llvm.mlir.addressof"() <{global_name = @foo_1}> : () -> !llvm.ptr loc("<stdin>":13:10)
    "llvm.return"(%0) : (!llvm.ptr) -> () loc("<stdin>":14:5)
  }) : () -> () loc("<stdin>":12:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, arg_attrs = [{llvm.noundef}, {llvm.noundef}], function_type = !llvm.func<void (ptr, i32)>, linkage = #llvm.linkage<external>, sym_name = "foo_1", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> () loc("<stdin>":16:3)
}) : () -> () loc("<stdin>":1:1)
