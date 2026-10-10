"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<i32 (ptr, i64)>, linkage = #llvm.linkage<external>, res_attrs = [{llvm.range = #llvm.constant_range<i32, 0, 12>}], sym_name = "foo1", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<i8 (ptr, i64)>, linkage = #llvm.linkage<external>, res_attrs = [{llvm.range = #llvm.constant_range<i8, 1, 10>}], sym_name = "foo2", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<i64 (ptr, i64)>, linkage = #llvm.linkage<external>, res_attrs = [{llvm.range = #llvm.constant_range<i64, 0, 2147483648>}], sym_name = "foo3", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<i32 (ptr, i64)>, linkage = #llvm.linkage<external>, res_attrs = [{llvm.range = #llvm.constant_range<i32, 1, -2147483648>}], sym_name = "foo4", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
}) : () -> ()

