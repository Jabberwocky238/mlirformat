module {
  memref.global "private" @gv_i32 : memref<20xi32> = dense<[0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19]>
  func.func @entry() -> i32 {
    %c0 = arith.constant 0 : index
    %c10 = arith.constant 10 : index
    %0 = memref.get_global @gv_i32 : memref<20xi32>
    %1 = vector.load %0[%c0] : memref<20xi32>, vector<8xi32>
    %2 = vector.load %0[%c10] : memref<20xi32>, vector<8xi32>
    %cst = arith.constant dense<[true, false, true, false, true, false, true, false]> : vector<8xi1>
    %c4_i32 = arith.constant 4 : i32
    %3 = "llvm.intr.vp.add"(%1, %2, %cst, %c4_i32) : (vector<8xi32>, vector<8xi32>, vector<8xi1>, i32) -> vector<8xi32>
    vector.print %3 : vector<8xi32>
    %c0_i32 = arith.constant 0 : i32
    return %c0_i32 : i32
  }
}

