module {
  func.func private @printMemrefF32(memref<*xf32>)
  func.func @matmul(%arg0: memref<?x?xf32>, %arg1: memref<?x?xf32>) -> memref<?x?xf32> {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %cst = arith.constant 0.000000e+00 : f32
    %dim = memref.dim %arg0, %c0 : memref<?x?xf32>
    %dim_0 = memref.dim %arg1, %c1 : memref<?x?xf32>
    %alloc = memref.alloc(%dim, %dim_0) : memref<?x?xf32>
    linalg.fill ins(%cst : f32) outs(%alloc : memref<?x?xf32>)
    linalg.matmul ins(%arg0, %arg1 : memref<?x?xf32>, memref<?x?xf32>) outs(%alloc : memref<?x?xf32>)
    return %alloc : memref<?x?xf32>
  }
  func.func @matvec(%arg0: memref<?x?xf32>, %arg1: memref<?x?xf32>) -> memref<?x?xf32> {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %cst = arith.constant 0.000000e+00 : f32
    %dim = memref.dim %arg0, %c0 : memref<?x?xf32>
    %dim_0 = memref.dim %arg0, %c1 : memref<?x?xf32>
    %dim_1 = memref.dim %arg1, %c1 : memref<?x?xf32>
    %alloc = memref.alloc(%dim, %dim_1) : memref<?x?xf32>
    linalg.fill ins(%cst : f32) outs(%alloc : memref<?x?xf32>)
    scf.for %arg2 = %c0 to %dim_1 step %c1 {
      %subview = memref.subview %arg1[0, %arg2] [%dim_0, 1] [1, 1] : memref<?x?xf32> to memref<?xf32, strided<[?], offset: ?>>
      %subview_2 = memref.subview %alloc[0, %arg2] [%dim, 1] [1, 1] : memref<?x?xf32> to memref<?xf32, strided<[?], offset: ?>>
      linalg.matvec ins(%arg0, %subview : memref<?x?xf32>, memref<?xf32, strided<[?], offset: ?>>) outs(%subview_2 : memref<?xf32, strided<[?], offset: ?>>)
    }
    return %alloc : memref<?x?xf32>
  }
  func.func @main() {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c5 = arith.constant 5 : index
    %c3 = arith.constant 3 : index
    %c2 = arith.constant 2 : index
    %cst = arith.constant 1.300000e+01 : f32
    %cst_0 = arith.constant 1.700000e+01 : f32
    %alloc = memref.alloc(%c5, %c3) : memref<?x?xf32>
    %alloc_1 = memref.alloc(%c3, %c2) : memref<?x?xf32>
    linalg.fill ins(%cst : f32) outs(%alloc : memref<?x?xf32>)
    linalg.fill ins(%cst_0 : f32) outs(%alloc_1 : memref<?x?xf32>)
    memref.store %cst, %alloc_1[%c0, %c0] : memref<?x?xf32>
    %0 = call @matmul(%alloc, %alloc_1) : (memref<?x?xf32>, memref<?x?xf32>) -> memref<?x?xf32>
    %1 = call @matvec(%alloc, %alloc_1) : (memref<?x?xf32>, memref<?x?xf32>) -> memref<?x?xf32>
    scf.for %arg0 = %c0 to %c5 step %c1 {
      scf.for %arg1 = %c0 to %c2 step %c1 {
        %2 = memref.load %0[%arg0, %arg1] : memref<?x?xf32>
        %3 = memref.load %1[%arg0, %arg1] : memref<?x?xf32>
        %4 = arith.cmpf oeq, %2, %3 : f32
        cf.assert %4, "Matmul does not produce same output as matvec"
      }
    }
    %cast = memref.cast %1 : memref<?x?xf32> to memref<*xf32>
    call @printMemrefF32(%cast) : (memref<*xf32>) -> ()
    memref.dealloc %0 : memref<?x?xf32>
    memref.dealloc %1 : memref<?x?xf32>
    return
  }
}

