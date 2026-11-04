module {
  func.func @main() {
    %c4 = arith.constant 4 : index
    %alloca = memref.alloca() : memref<1xf32>
    %dim = memref.dim %alloca, %c4 : memref<1xf32>
    return
  }
}

