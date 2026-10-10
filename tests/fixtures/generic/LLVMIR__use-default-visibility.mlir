"builtin.module"() ({
  "llvm.comdat"() <{sym_name = "llvm_comdat"}> ({
    "llvm.comdat_selector"() <{comdat = 0 : i64, sym_name = "any"}> : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "func", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<ptr ()>, linkage = #llvm.linkage<external>, sym_name = "ifunc_resolver", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %3 = "llvm.mlir.addressof"() <{global_name = @func}> : () -> !llvm.ptr
    "llvm.return"(%3) : (!llvm.ptr) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "func1", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.mlir.global"() <{addr_space = 0 : i32, constant, global_type = i32, linkage = #llvm.linkage<internal>, sym_name = "global1", unnamed_addr = 0 : i64, value = 0 : i32, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.mlir.alias"() <{alias_type = !llvm.ptr, linkage = #llvm.linkage<external>, sym_name = "func1_alias", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %2 = "llvm.mlir.addressof"() <{global_name = @func1}> : () -> !llvm.ptr
    "llvm.return"(%2) : (!llvm.ptr) -> ()
  }) {addr_space = 0 : i32} : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "decl1", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.mlir.global"() <{addr_space = 0 : i32, comdat = @llvm_comdat::@any, constant, global_type = i64, linkage = #llvm.linkage<internal>, sym_name = "comdat1", unnamed_addr = 0 : i64, value = 1 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.mlir.ifunc"() <{address_space = 0 : i32, i_func_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, resolver = @ifunc_resolver, resolver_type = !llvm.ptr, sym_name = "ifunc1", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "func2", unnamed_addr = 0 : i64, visibility_ = 1 : i64}> ({
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.mlir.global"() <{addr_space = 0 : i32, constant, global_type = i32, linkage = #llvm.linkage<internal>, sym_name = "global2", unnamed_addr = 0 : i64, value = 1 : i32, visibility_ = 1 : i64}> ({
  }) : () -> ()
  "llvm.mlir.alias"() <{alias_type = !llvm.ptr, linkage = #llvm.linkage<external>, sym_name = "func2_alias", unnamed_addr = 0 : i64, visibility_ = 1 : i64}> ({
    %1 = "llvm.mlir.addressof"() <{global_name = @func2}> : () -> !llvm.ptr
    "llvm.return"(%1) : (!llvm.ptr) -> ()
  }) {addr_space = 0 : i32} : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "decl2", unnamed_addr = 0 : i64, visibility_ = 1 : i64}> ({
  }) : () -> ()
  "llvm.mlir.global"() <{addr_space = 0 : i32, comdat = @llvm_comdat::@any, constant, global_type = i64, linkage = #llvm.linkage<internal>, sym_name = "comdat2", unnamed_addr = 0 : i64, value = 1 : i64, visibility_ = 1 : i64}> ({
  }) : () -> ()
  "llvm.mlir.ifunc"() <{address_space = 0 : i32, i_func_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, resolver = @ifunc_resolver, resolver_type = !llvm.ptr, sym_name = "ifunc2", unnamed_addr = 0 : i64, visibility_ = 1 : i64}> : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "func3", unnamed_addr = 0 : i64, visibility_ = 2 : i64}> ({
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.mlir.global"() <{addr_space = 0 : i32, constant, global_type = i32, linkage = #llvm.linkage<internal>, sym_name = "global3", unnamed_addr = 0 : i64, value = 2 : i32, visibility_ = 2 : i64}> ({
  }) : () -> ()
  "llvm.mlir.alias"() <{alias_type = !llvm.ptr, linkage = #llvm.linkage<external>, sym_name = "func3_alias", unnamed_addr = 0 : i64, visibility_ = 2 : i64}> ({
    %0 = "llvm.mlir.addressof"() <{global_name = @func3}> : () -> !llvm.ptr
    "llvm.return"(%0) : (!llvm.ptr) -> ()
  }) {addr_space = 0 : i32} : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "decl3", unnamed_addr = 0 : i64, visibility_ = 2 : i64}> ({
  }) : () -> ()
  "llvm.mlir.global"() <{addr_space = 0 : i32, comdat = @llvm_comdat::@any, constant, global_type = i64, linkage = #llvm.linkage<internal>, sym_name = "comdat3", unnamed_addr = 0 : i64, value = 1 : i64, visibility_ = 2 : i64}> ({
  }) : () -> ()
  "llvm.mlir.ifunc"() <{address_space = 0 : i32, i_func_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, resolver = @ifunc_resolver, resolver_type = !llvm.ptr, sym_name = "ifunc3", unnamed_addr = 0 : i64, visibility_ = 2 : i64}> : () -> ()
}) : () -> ()

