"builtin.module"() ({
  "llvm.comdat"() <{sym_name = "__llvm_comdat"}> ({
    "llvm.comdat_selector"() <{comdat = 0 : i64, sym_name = "any"}> : () -> () loc("<stdin>":3:5)
    "llvm.comdat_selector"() <{comdat = 1 : i64, sym_name = "exactmatch"}> : () -> () loc("<stdin>":4:5)
    "llvm.comdat_selector"() <{comdat = 2 : i64, sym_name = "largest"}> : () -> () loc("<stdin>":5:5)
    "llvm.comdat_selector"() <{comdat = 3 : i64, sym_name = "nodeduplicate"}> : () -> () loc("<stdin>":6:5)
    "llvm.comdat_selector"() <{comdat = 4 : i64, sym_name = "samesize"}> : () -> () loc("<stdin>":7:5)
  }) : () -> () loc("<stdin>":2:3)
  "llvm.mlir.global"() <{addr_space = 0 : i32, comdat = @__llvm_comdat::@any, constant, global_type = i64, linkage = #llvm.linkage<internal>, sym_name = "any", unnamed_addr = 0 : i64, value = 1 : i64, visibility_ = 0 : i64}> ({
  }) : () -> () loc("<stdin>":9:3)
  "llvm.mlir.global"() <{addr_space = 0 : i32, comdat = @__llvm_comdat::@any, constant, global_type = i64, linkage = #llvm.linkage<internal>, sym_name = "any_global", unnamed_addr = 0 : i64, value = 1 : i64, visibility_ = 0 : i64}> ({
  }) : () -> () loc("<stdin>":11:3)
  "llvm.mlir.global"() <{addr_space = 0 : i32, comdat = @__llvm_comdat::@exactmatch, constant, global_type = i64, linkage = #llvm.linkage<internal>, sym_name = "exact_global", unnamed_addr = 0 : i64, value = 1 : i64, visibility_ = 0 : i64}> ({
  }) : () -> () loc("<stdin>":13:3)
  "llvm.mlir.global"() <{addr_space = 0 : i32, comdat = @__llvm_comdat::@largest, constant, global_type = i64, linkage = #llvm.linkage<internal>, sym_name = "largest_global", unnamed_addr = 0 : i64, value = 1 : i64, visibility_ = 0 : i64}> ({
  }) : () -> () loc("<stdin>":15:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, comdat = @__llvm_comdat::@nodeduplicate, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "nodeduplicate", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "llvm.return"() : () -> () loc("<stdin>":18:5)
  }) : () -> () loc("<stdin>":17:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, comdat = @__llvm_comdat::@nodeduplicate, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "nodeduplicate_func", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "llvm.return"() : () -> () loc("<stdin>":21:5)
  }) : () -> () loc("<stdin>":20:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, comdat = @__llvm_comdat::@samesize, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "samesize_func", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "llvm.return"() : () -> () loc("<stdin>":24:5)
  }) : () -> () loc("<stdin>":23:3)
}) : () -> () loc("<stdin>":1:1)
