"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<struct<"empty", ()> ()>, linkage = #llvm.linkage<external>, sym_name = "return_s_empty", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> () loc("<stdin>":3:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<struct<"opaque", opaque> ()>, linkage = #llvm.linkage<external>, sym_name = "return_s_opaque", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> () loc("<stdin>":5:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<struct<"long", (i32, struct<(i32, i1)>, f32, ptr)> ()>, linkage = #llvm.linkage<external>, sym_name = "return_s_long", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> () loc("<stdin>":7:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<struct<"unpacked", (i32)> ()>, linkage = #llvm.linkage<external>, sym_name = "return_s_unpacked", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> () loc("<stdin>":9:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<struct<"packed", packed (i32)> ()>, linkage = #llvm.linkage<external>, sym_name = "return_s_packed", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> () loc("<stdin>":11:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<struct<"name with spaces and !^$@$#", packed (i32)> ()>, linkage = #llvm.linkage<external>, sym_name = "return_s_symbols", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> () loc("<stdin>":13:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<struct<"struct-of-arrays", (array<10 x i32>)> ()>, linkage = #llvm.linkage<external>, sym_name = "return_s_struct_of_arrays", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> () loc("<stdin>":15:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<array<10 x struct<"array-of-structs", (i32)>> ()>, linkage = #llvm.linkage<external>, sym_name = "return_s_array_of_structs", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> () loc("<stdin>":17:3)
}) : () -> () loc("<stdin>":2:1)
