"builtin.module"() ({
  "llvm.mlir.global"() <{addr_space = 0 : i32, global_type = i64, linkage = #llvm.linkage<external>, sym_name = "default_external", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> () loc("<stdin>":2:3)
  "llvm.mlir.global"() <{addr_space = 0 : i32, constant, global_type = i64, linkage = #llvm.linkage<external>, sym_name = "default_external_constant", unnamed_addr = 0 : i64, value = 42 : i64, visibility_ = 0 : i64}> ({
  }) : () -> () loc("<stdin>":4:3)
  "llvm.mlir.global"() <{addr_space = 0 : i32, global_type = i64, linkage = #llvm.linkage<internal>, sym_name = "global", unnamed_addr = 0 : i64, value = 42 : i64, visibility_ = 0 : i64}> ({
  }) : () -> () loc("<stdin>":6:3)
  "llvm.mlir.global"() <{addr_space = 0 : i32, global_type = i64, linkage = #llvm.linkage<private>, sym_name = "aligned_global", unnamed_addr = 0 : i64, value = 42 : i64, visibility_ = 0 : i64}> ({
  }) {aligned = 64 : i64} : () -> () loc("<stdin>":8:3)
  "llvm.mlir.global"() <{addr_space = 0 : i32, constant, global_type = i64, linkage = #llvm.linkage<private>, sym_name = "aligned_global_const", unnamed_addr = 0 : i64, value = 42 : i64, visibility_ = 0 : i64}> ({
  }) {aligned = 32 : i64} : () -> () loc("<stdin>":10:3)
  "llvm.mlir.global"() <{addr_space = 0 : i32, constant, global_type = f32, linkage = #llvm.linkage<internal>, sym_name = "constant", unnamed_addr = 0 : i64, value = 3.700000e+01 : f64, visibility_ = 0 : i64}> ({
  }) : () -> () loc("<stdin>":12:3)
  "llvm.mlir.global"() <{addr_space = 0 : i32, constant, global_type = !llvm.array<6 x i8>, linkage = #llvm.linkage<internal>, sym_name = ".string", unnamed_addr = 0 : i64, value = "foobar", visibility_ = 0 : i64}> ({
  }) : () -> () loc("<stdin>":14:3)
  "llvm.mlir.global"() <{addr_space = 0 : i32, global_type = !llvm.array<7 x i8>, linkage = #llvm.linkage<internal>, sym_name = "string_notype", unnamed_addr = 0 : i64, value = "1234567", visibility_ = 0 : i64}> ({
  }) : () -> () loc("<stdin>":16:3)
  "llvm.mlir.global"() <{addr_space = 0 : i32, global_type = i64, linkage = #llvm.linkage<internal>, sym_name = "global_undef", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> () loc("<stdin>":18:3)
  "llvm.mlir.global"() <{addr_space = 0 : i32, global_type = i64, linkage = #llvm.linkage<internal>, sym_name = "global_mega_initializer", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %3 = "llvm.mlir.constant"() <{value = 42 : i64}> : () -> i64 loc("<stdin>":21:10)
    "llvm.return"(%3) : (i64) -> () loc("<stdin>":22:5)
  }) : () -> () loc("<stdin>":20:3)
  "llvm.mlir.global"() <{addr_space = 0 : i32, global_type = i64, linkage = #llvm.linkage<private>, sym_name = "private", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> () loc("<stdin>":24:3)
  "llvm.mlir.global"() <{addr_space = 0 : i32, global_type = i64, linkage = #llvm.linkage<internal>, sym_name = "internal", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> () loc("<stdin>":26:3)
  "llvm.mlir.global"() <{addr_space = 0 : i32, global_type = i64, linkage = #llvm.linkage<available_externally>, sym_name = "available_externally", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> () loc("<stdin>":28:3)
  "llvm.mlir.global"() <{addr_space = 0 : i32, global_type = i64, linkage = #llvm.linkage<linkonce>, sym_name = "linkonce", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> () loc("<stdin>":30:3)
  "llvm.mlir.global"() <{addr_space = 0 : i32, global_type = i64, linkage = #llvm.linkage<weak>, sym_name = "weak", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> () loc("<stdin>":32:3)
  "llvm.mlir.global"() <{addr_space = 0 : i32, global_type = i64, linkage = #llvm.linkage<common>, sym_name = "common", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> () loc("<stdin>":34:3)
  "llvm.mlir.global"() <{addr_space = 0 : i32, global_type = !llvm.array<2 x i64>, linkage = #llvm.linkage<appending>, sym_name = "appending", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> () loc("<stdin>":36:3)
  "llvm.mlir.global"() <{addr_space = 0 : i32, global_type = i64, linkage = #llvm.linkage<extern_weak>, sym_name = "extern_weak", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> () loc("<stdin>":38:3)
  "llvm.mlir.global"() <{addr_space = 0 : i32, global_type = i64, linkage = #llvm.linkage<linkonce_odr>, sym_name = "linkonce_odr", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> () loc("<stdin>":40:3)
  "llvm.mlir.global"() <{addr_space = 0 : i32, global_type = i64, linkage = #llvm.linkage<weak_odr>, sym_name = "weak_odr", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> () loc("<stdin>":42:3)
  "llvm.mlir.global"() <{addr_space = 0 : i32, global_type = i64, linkage = #llvm.linkage<external>, sym_name = "has_thr_local", unnamed_addr = 0 : i64, value = 42 : i64, visibility_ = 0 : i64}> ({
  }) {thr_local} : () -> () loc("<stdin>":44:3)
  "llvm.mlir.global"() <{addr_space = 0 : i32, dso_local, global_type = i64, linkage = #llvm.linkage<external>, sym_name = "has_dso_local", unnamed_addr = 0 : i64, value = 42 : i64, visibility_ = 0 : i64}> ({
  }) : () -> () loc("<stdin>":46:3)
  "llvm.mlir.global"() <{addr_space = 3 : i32, global_type = i64, linkage = #llvm.linkage<external>, sym_name = "has_addr_space", unnamed_addr = 0 : i64, value = 32 : i64, visibility_ = 0 : i64}> ({
  }) : () -> () loc("<stdin>":48:3)
  "llvm.comdat"() <{sym_name = "__llvm_comdat"}> ({
    "llvm.comdat_selector"() <{comdat = 0 : i64, sym_name = "any"}> : () -> () loc("<stdin>":51:5)
  }) : () -> () loc("<stdin>":50:3)
  "llvm.mlir.global"() <{addr_space = 1 : i32, comdat = @__llvm_comdat::@any, global_type = i64, linkage = #llvm.linkage<external>, sym_name = "any", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> () loc("<stdin>":53:3)
  "func.func"() <{function_type = () -> (), sym_name = "references"}> ({
    %0 = "llvm.mlir.addressof"() <{global_name = @".string"}> : () -> !llvm.ptr loc("<stdin>":56:10)
    %1 = "llvm.mlir.addressof"() <{global_name = @global}> : () -> !llvm.ptr loc("<stdin>":57:10)
    %2 = "llvm.mlir.addressof"() <{global_name = @has_addr_space}> : () -> !llvm.ptr<3> loc("<stdin>":58:10)
    "llvm.return"() : () -> () loc("<stdin>":59:5)
  }) : () -> () loc("<stdin>":55:3)
  "llvm.mlir.global"() <{addr_space = 0 : i32, constant, global_type = i64, linkage = #llvm.linkage<private>, sym_name = "local", unnamed_addr = 1 : i64, value = 42 : i64, visibility_ = 0 : i64}> ({
  }) : () -> () loc("<stdin>":61:3)
  "llvm.mlir.global"() <{addr_space = 0 : i32, constant, global_type = i64, linkage = #llvm.linkage<private>, sym_name = "foo", unnamed_addr = 2 : i64, value = 42 : i64, visibility_ = 0 : i64}> ({
  }) : () -> () loc("<stdin>":63:3)
  "llvm.mlir.global"() <{addr_space = 0 : i32, constant, global_type = !llvm.array<10 x i8>, linkage = #llvm.linkage<internal>, section = ".mysection", sym_name = "sectionvar", unnamed_addr = 0 : i64, value = "teststring", visibility_ = 0 : i64}> ({
  }) : () -> () loc("<stdin>":65:3)
  "llvm.mlir.global"() <{addr_space = 0 : i32, constant, global_type = i32, linkage = #llvm.linkage<internal>, sym_name = "thread_local", thread_local_, unnamed_addr = 0 : i64, value = 42 : i32, visibility_ = 0 : i64}> ({
  }) : () -> () loc("<stdin>":67:3)
  "llvm.mlir.global"() <{addr_space = 0 : i32, constant, global_type = i32, linkage = #llvm.linkage<internal>, sym_name = "hidden", unnamed_addr = 0 : i64, value = 42 : i32, visibility_ = 1 : i64}> ({
  }) : () -> () loc("<stdin>":69:3)
  "llvm.mlir.global"() <{addr_space = 0 : i32, global_type = i32, linkage = #llvm.linkage<internal>, sym_name = "protected", unnamed_addr = 2 : i64, value = 42 : i32, visibility_ = 2 : i64}> ({
  }) : () -> () loc("<stdin>":71:3)
}) : () -> () loc("<stdin>":1:1)
