"builtin.module"() ({
  "llvm.comdat"() <{sym_name = "llvm_comdat"}> ({
    "llvm.comdat_selector"() <{comdat = 0 : i64, sym_name = "any"}> : () -> () loc("<stdin>":3:5)
  }) : () -> () loc("<stdin>":2:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "func", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "llvm.return"() : () -> () loc("<stdin>":6:5)
  }) : () -> () loc("<stdin>":5:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<ptr ()>, linkage = #llvm.linkage<external>, sym_name = "ifunc_resolver", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %3 = "llvm.mlir.addressof"() <{global_name = @func}> : () -> !llvm.ptr loc("<stdin>":9:10)
    "llvm.return"(%3) : (!llvm.ptr) -> () loc("<stdin>":10:5)
  }) : () -> () loc("<stdin>":8:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "func1", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "llvm.return"() : () -> () loc("<stdin>":13:5)
  }) : () -> () loc("<stdin>":12:3)
  "llvm.mlir.global"() <{addr_space = 0 : i32, constant, global_type = i32, linkage = #llvm.linkage<internal>, sym_name = "global1", unnamed_addr = 0 : i64, value = 0 : i32, visibility_ = 0 : i64}> ({
  }) : () -> () loc("<stdin>":15:3)
  "llvm.mlir.alias"() <{alias_type = !llvm.ptr, linkage = #llvm.linkage<external>, sym_name = "func1_alias", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %2 = "llvm.mlir.addressof"() <{global_name = @func1}> : () -> !llvm.ptr loc("<stdin>":18:10)
    "llvm.return"(%2) : (!llvm.ptr) -> () loc("<stdin>":19:5)
  }) {addr_space = 0 : i32} : () -> () loc("<stdin>":17:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "decl1", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> () loc("<stdin>":21:3)
  "llvm.mlir.global"() <{addr_space = 0 : i32, comdat = @llvm_comdat::@any, constant, global_type = i64, linkage = #llvm.linkage<internal>, sym_name = "comdat1", unnamed_addr = 0 : i64, value = 1 : i64, visibility_ = 0 : i64}> ({
  }) : () -> () loc("<stdin>":23:3)
  "llvm.mlir.ifunc"() <{address_space = 0 : i32, i_func_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, resolver = @ifunc_resolver, resolver_type = !llvm.ptr, sym_name = "ifunc1", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> : () -> () loc("<stdin>":25:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "func2", unnamed_addr = 0 : i64, visibility_ = 1 : i64}> ({
    "llvm.return"() : () -> () loc("<stdin>":27:5)
  }) : () -> () loc("<stdin>":26:3)
  "llvm.mlir.global"() <{addr_space = 0 : i32, constant, global_type = i32, linkage = #llvm.linkage<internal>, sym_name = "global2", unnamed_addr = 0 : i64, value = 1 : i32, visibility_ = 1 : i64}> ({
  }) : () -> () loc("<stdin>":29:3)
  "llvm.mlir.alias"() <{alias_type = !llvm.ptr, linkage = #llvm.linkage<external>, sym_name = "func2_alias", unnamed_addr = 0 : i64, visibility_ = 1 : i64}> ({
    %1 = "llvm.mlir.addressof"() <{global_name = @func2}> : () -> !llvm.ptr loc("<stdin>":32:10)
    "llvm.return"(%1) : (!llvm.ptr) -> () loc("<stdin>":33:5)
  }) {addr_space = 0 : i32} : () -> () loc("<stdin>":31:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "decl2", unnamed_addr = 0 : i64, visibility_ = 1 : i64}> ({
  }) : () -> () loc("<stdin>":35:3)
  "llvm.mlir.global"() <{addr_space = 0 : i32, comdat = @llvm_comdat::@any, constant, global_type = i64, linkage = #llvm.linkage<internal>, sym_name = "comdat2", unnamed_addr = 0 : i64, value = 1 : i64, visibility_ = 1 : i64}> ({
  }) : () -> () loc("<stdin>":37:3)
  "llvm.mlir.ifunc"() <{address_space = 0 : i32, i_func_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, resolver = @ifunc_resolver, resolver_type = !llvm.ptr, sym_name = "ifunc2", unnamed_addr = 0 : i64, visibility_ = 1 : i64}> : () -> () loc("<stdin>":39:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "func3", unnamed_addr = 0 : i64, visibility_ = 2 : i64}> ({
    "llvm.return"() : () -> () loc("<stdin>":41:5)
  }) : () -> () loc("<stdin>":40:3)
  "llvm.mlir.global"() <{addr_space = 0 : i32, constant, global_type = i32, linkage = #llvm.linkage<internal>, sym_name = "global3", unnamed_addr = 0 : i64, value = 2 : i32, visibility_ = 2 : i64}> ({
  }) : () -> () loc("<stdin>":43:3)
  "llvm.mlir.alias"() <{alias_type = !llvm.ptr, linkage = #llvm.linkage<external>, sym_name = "func3_alias", unnamed_addr = 0 : i64, visibility_ = 2 : i64}> ({
    %0 = "llvm.mlir.addressof"() <{global_name = @func3}> : () -> !llvm.ptr loc("<stdin>":46:10)
    "llvm.return"(%0) : (!llvm.ptr) -> () loc("<stdin>":47:5)
  }) {addr_space = 0 : i32} : () -> () loc("<stdin>":45:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "decl3", unnamed_addr = 0 : i64, visibility_ = 2 : i64}> ({
  }) : () -> () loc("<stdin>":49:3)
  "llvm.mlir.global"() <{addr_space = 0 : i32, comdat = @llvm_comdat::@any, constant, global_type = i64, linkage = #llvm.linkage<internal>, sym_name = "comdat3", unnamed_addr = 0 : i64, value = 1 : i64, visibility_ = 2 : i64}> ({
  }) : () -> () loc("<stdin>":51:3)
  "llvm.mlir.ifunc"() <{address_space = 0 : i32, i_func_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, resolver = @ifunc_resolver, resolver_type = !llvm.ptr, sym_name = "ifunc3", unnamed_addr = 0 : i64, visibility_ = 2 : i64}> : () -> () loc("<stdin>":53:3)
}) : () -> () loc("<stdin>":1:1)
