"builtin.module"() ({
  "llvm.comdat"() <{sym_name = "__llvm_comdat"}> ({
    "llvm.comdat_selector"() <{comdat = 0 : i64, sym_name = "any"}> : () -> ()
    "llvm.comdat_selector"() <{comdat = 1 : i64, sym_name = "exactmatch"}> : () -> ()
    "llvm.comdat_selector"() <{comdat = 2 : i64, sym_name = "largest"}> : () -> ()
    "llvm.comdat_selector"() <{comdat = 3 : i64, sym_name = "nodeduplicate"}> : () -> ()
    "llvm.comdat_selector"() <{comdat = 4 : i64, sym_name = "samesize"}> : () -> ()
  }) : () -> ()
  "llvm.mlir.global"() <{addr_space = 0 : i32, comdat = @__llvm_comdat::@any, constant, global_type = i64, linkage = #llvm.linkage<internal>, sym_name = "any", unnamed_addr = 0 : i64, value = 1 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.mlir.global"() <{addr_space = 0 : i32, comdat = @__llvm_comdat::@any, constant, global_type = i64, linkage = #llvm.linkage<internal>, sym_name = "any_global", unnamed_addr = 0 : i64, value = 1 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.mlir.global"() <{addr_space = 0 : i32, comdat = @__llvm_comdat::@exactmatch, constant, global_type = i64, linkage = #llvm.linkage<internal>, sym_name = "exact_global", unnamed_addr = 0 : i64, value = 1 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.mlir.global"() <{addr_space = 0 : i32, comdat = @__llvm_comdat::@largest, constant, global_type = i64, linkage = #llvm.linkage<internal>, sym_name = "largest_global", unnamed_addr = 0 : i64, value = 1 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, comdat = @__llvm_comdat::@nodeduplicate, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "nodeduplicate", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, comdat = @__llvm_comdat::@nodeduplicate, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "nodeduplicate_func", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, comdat = @__llvm_comdat::@samesize, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "samesize_func", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

