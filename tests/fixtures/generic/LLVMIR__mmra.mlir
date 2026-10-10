#mmra_tag = #llvm.mmra_tag<"foo":"bar">
#mmra_tag1 = #llvm.mmra_tag<"amdgpu-synchronize-as":"local">
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr, ptr)>, linkage = #llvm.linkage<external>, sym_name = "native", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: !llvm.ptr, %arg1: !llvm.ptr):
    %0 = "llvm.load"(%arg0) <{ordering = 0 : i64}> {llvm.mmra = #mmra_tag} : (!llvm.ptr) -> i32
    "llvm.fence"() <{ordering = 5 : i64, syncscope = "workgroup-one-as"}> {llvm.mmra = [#mmra_tag1, #mmra_tag]} : () -> ()
    "llvm.store"(%0, %arg1) <{ordering = 0 : i64}> {llvm.mmra = #mmra_tag} : (i32, !llvm.ptr) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#mmra_tag = #llvm.mmra_tag<"fake":"example">
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr<1>, ptr<3>)>, linkage = #llvm.linkage<external>, sym_name = "foreign_op", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: !llvm.ptr<1>, %arg1: !llvm.ptr<3>):
    "rocdl.load.to.lds"(%arg0, %arg1) <{aux = 0 : i32, offset = 0 : i32, size = 4 : i32}> {llvm.mmra = #mmra_tag} : (!llvm.ptr<1>, !llvm.ptr<3>) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

