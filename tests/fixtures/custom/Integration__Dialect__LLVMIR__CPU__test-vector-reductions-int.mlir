module {
  llvm.func @printNewline()
  llvm.func @printI64(i64)
  llvm.func @entry() {
    %0 = llvm.mlir.constant(1 : i64) : i64
    %1 = llvm.mlir.constant(2 : i64) : i64
    %2 = llvm.mlir.constant(3 : i64) : i64
    %3 = llvm.mlir.constant(4 : i64) : i64
    %4 = llvm.mlir.undef : vector<4xi64>
    %5 = llvm.mlir.constant(0 : index) : i64
    %6 = llvm.insertelement %0, %4[%5 : i64] : vector<4xi64>
    %7 = llvm.shufflevector %6, %4 [0, 0, 0, 0] : vector<4xi64> 
    %8 = llvm.mlir.constant(1 : i64) : i64
    %9 = llvm.insertelement %1, %7[%8 : i64] : vector<4xi64>
    %10 = llvm.mlir.constant(2 : i64) : i64
    %11 = llvm.insertelement %2, %9[%10 : i64] : vector<4xi64>
    %12 = llvm.mlir.constant(3 : i64) : i64
    %13 = llvm.insertelement %3, %11[%12 : i64] : vector<4xi64>
    %14 = "llvm.intr.vector.reduce.add"(%13) : (vector<4xi64>) -> i64
    llvm.call @printI64(%14) : (i64) -> ()
    llvm.call @printNewline() : () -> ()
    %15 = "llvm.intr.vector.reduce.and"(%13) : (vector<4xi64>) -> i64
    llvm.call @printI64(%15) : (i64) -> ()
    llvm.call @printNewline() : () -> ()
    %16 = "llvm.intr.vector.reduce.mul"(%13) : (vector<4xi64>) -> i64
    llvm.call @printI64(%16) : (i64) -> ()
    llvm.call @printNewline() : () -> ()
    %17 = "llvm.intr.vector.reduce.or"(%13) : (vector<4xi64>) -> i64
    llvm.call @printI64(%17) : (i64) -> ()
    llvm.call @printNewline() : () -> ()
    %18 = "llvm.intr.vector.reduce.smax"(%13) : (vector<4xi64>) -> i64
    llvm.call @printI64(%18) : (i64) -> ()
    llvm.call @printNewline() : () -> ()
    %19 = "llvm.intr.vector.reduce.smin"(%13) : (vector<4xi64>) -> i64
    llvm.call @printI64(%19) : (i64) -> ()
    llvm.call @printNewline() : () -> ()
    %20 = "llvm.intr.vector.reduce.umax"(%13) : (vector<4xi64>) -> i64
    llvm.call @printI64(%20) : (i64) -> ()
    llvm.call @printNewline() : () -> ()
    %21 = "llvm.intr.vector.reduce.umin"(%13) : (vector<4xi64>) -> i64
    llvm.call @printI64(%21) : (i64) -> ()
    llvm.call @printNewline() : () -> ()
    %22 = "llvm.intr.vector.reduce.xor"(%13) : (vector<4xi64>) -> i64
    llvm.call @printI64(%22) : (i64) -> ()
    llvm.call @printNewline() : () -> ()
    llvm.return
  }
}

