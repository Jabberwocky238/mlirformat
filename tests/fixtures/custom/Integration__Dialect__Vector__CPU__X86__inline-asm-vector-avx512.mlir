module {
  llvm.mlir.global private @const16(dense<[0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15]> : tensor<16xi32>) {addr_space = 0 : i32} : !llvm.array<16 x i32>
  llvm.func @entry() -> i32 {
    %0 = llvm.mlir.constant(0 : index) : i64
    %1 = llvm.mlir.addressof @const16 : !llvm.ptr
    %2 = llvm.getelementptr %1[%0, %0] : (!llvm.ptr, i64, i64) -> !llvm.ptr, !llvm.array<16 x i32>
    %3 = llvm.inline_asm asm_dialect = intel operand_attrs = [{elementtype = vector<16xi32>}] "vmovdqu32 $0, $1", "=x,*m" %2 : (!llvm.ptr) -> vector<16xi32>
    %4 = vector.extract %3[0] : i32 from vector<16xi32>
    vector.print %4 : i32
    %5 = vector.extract %3[9] : i32 from vector<16xi32>
    vector.print %5 : i32
    %c0_i32 = arith.constant 0 : i32
    llvm.return %c0_i32 : i32
  }
}

