module {
  func.func @main() {
    %alloc = memref.alloc() : memref<16x16xf32>
    %alloc_0 = memref.alloc() : memref<16x16xf32>
    %alloc_1 = memref.alloc() : memref<16x16xf32>
    %cst = arith.constant 1.000000e+00 : f32
    linalg.fill ins(%cst : f32) outs(%alloc : memref<16x16xf32>)
    linalg.fill ins(%cst : f32) outs(%alloc_0 : memref<16x16xf32>)
    %c5 = arith.constant 5 : index
    %0 = call @rtclock() : () -> f64
    affine.for %arg0 = 0 to %c5 {
      linalg.fill ins(%cst : f32) outs(%alloc_1 : memref<16x16xf32>)
      func.call @sgemm_naive(%alloc, %alloc_0, %alloc_1) : (memref<16x16xf32>, memref<16x16xf32>, memref<16x16xf32>) -> ()
    }
    %1 = call @rtclock() : () -> f64
    %2 = arith.subf %1, %0 : f64
    %3 = affine.load %alloc_1[0, 0] : memref<16x16xf32>
    vector.print %3 : f32
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c2 = arith.constant 2 : index
    %dim = memref.dim %alloc_1, %c0 : memref<16x16xf32>
    %dim_2 = memref.dim %alloc_1, %c1 : memref<16x16xf32>
    %dim_3 = memref.dim %alloc, %c1 : memref<16x16xf32>
    %4 = arith.muli %dim, %dim_2 : index
    %5 = arith.muli %4, %dim_3 : index
    %6 = arith.muli %c2, %5 : index
    %7 = arith.muli %6, %c5 : index
    %8 = arith.index_cast %7 : index to i16
    %9 = arith.uitofp %8 : i16 to f64
    %10 = arith.divf %9, %2 : f64
    call @printFlops(%10) : (f64) -> ()
    memref.dealloc %alloc : memref<16x16xf32>
    memref.dealloc %alloc_0 : memref<16x16xf32>
    memref.dealloc %alloc_1 : memref<16x16xf32>
    return
  }
  func.func @sgemm_naive(%arg0: memref<16x16xf32>, %arg1: memref<16x16xf32>, %arg2: memref<16x16xf32>) {
    %c0 = arith.constant 0 : index
    affine.for %arg3 = 0 to 16 {
      affine.for %arg4 = 0 to 16 {
        %alloc = memref.alloc() : memref<1xf32>
        %0 = affine.load %arg2[%arg3, %arg4] : memref<16x16xf32>
        affine.store %0, %alloc[%c0] : memref<1xf32>
        affine.for %arg5 = 0 to 16 {
          %2 = affine.load %arg0[%arg3, %arg5] : memref<16x16xf32>
          %3 = affine.load %arg1[%arg5, %arg4] : memref<16x16xf32>
          %4 = affine.load %alloc[0] : memref<1xf32>
          %5 = arith.mulf %2, %3 : f32
          %6 = arith.addf %5, %4 : f32
          affine.store %6, %alloc[0] : memref<1xf32>
        }
        %1 = affine.load %alloc[%c0] : memref<1xf32>
        affine.store %1, %arg2[%arg3, %arg4] : memref<16x16xf32>
        memref.dealloc %alloc : memref<1xf32>
      }
    }
    return
  }
  func.func private @printFlops(f64)
  func.func private @rtclock() -> f64
}

