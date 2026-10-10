#mmra_tag = #llvm.mmra_tag<"foo":"bar">
#mmra_tag1 = #llvm.mmra_tag<"amdgpu-synchronize-as":"local">
module {
  llvm.func @native(%arg0: !llvm.ptr, %arg1: !llvm.ptr) {
    %0 = llvm.load %arg0 {llvm.mmra = #mmra_tag} : !llvm.ptr -> i32
    llvm.fence syncscope("workgroup-one-as") release {llvm.mmra = [#mmra_tag1, #mmra_tag]}
    llvm.store %0, %arg1 {llvm.mmra = #mmra_tag} : i32, !llvm.ptr
    llvm.return
  }
}

// -----
#mmra_tag = #llvm.mmra_tag<"fake":"example">
module {
  llvm.func @foreign_op(%arg0: !llvm.ptr<1>, %arg1: !llvm.ptr<3>) {
    rocdl.load.to.lds %arg0, %arg1, 4, 0, 0 {llvm.mmra = #mmra_tag} : <1>
    llvm.return
  }
}

