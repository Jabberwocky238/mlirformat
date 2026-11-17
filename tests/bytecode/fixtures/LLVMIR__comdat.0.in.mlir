"builtin.module"() ({
  "llvm.comdat"() <{sym_name = "__llvm_comdat"}> ({
    "llvm.comdat_selector"() <{comdat = 0 : i64, sym_name = "any_comdat"}> : () -> () loc("<stdin>":3:5)
    "llvm.comdat_selector"() <{comdat = 1 : i64, sym_name = "exactmatch_comdat"}> : () -> () loc("<stdin>":4:5)
    "llvm.comdat_selector"() <{comdat = 2 : i64, sym_name = "largest_comdat"}> : () -> () loc("<stdin>":5:5)
    "llvm.comdat_selector"() <{comdat = 3 : i64, sym_name = "nodeduplicate_comdat"}> : () -> () loc("<stdin>":6:5)
    "llvm.comdat_selector"() <{comdat = 4 : i64, sym_name = "samesize_comdat"}> : () -> () loc("<stdin>":7:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
