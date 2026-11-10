module {
  llvm.mlir.global private constant @s0("a\00") {addr_space = 0 : i32}
  llvm.mlir.global private constant @s1("b\00") {addr_space = 0 : i32}
  llvm.mlir.global private constant @s2("c\00") {addr_space = 0 : i32}
  llvm.mlir.global external constant @ptrs() {addr_space = 0 : i32} : !llvm.array<3 x ptr> {
    %0 = llvm.mlir.constant([@s0, @s1, @s2]) : !llvm.array<3 x ptr>
    llvm.return %0 : !llvm.array<3 x ptr>
  }
}

