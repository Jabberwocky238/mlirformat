module {
  func.func @dynamic_alloca(%arg0: index, %arg1: index) -> memref<?x?xf32> {
    %alloca = memref.alloca(%arg0, %arg1) : memref<?x?xf32>
    %alloca_0 = memref.alloca(%arg0, %arg1) {alignment = 32 : i64} : memref<?x?xf32>
    return %alloca : memref<?x?xf32>
  }
}

