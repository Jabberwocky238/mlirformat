#map = affine_map<(d0, d1) -> (d1, d0)>
module {
  func.func @fill2DMemrefRows(%arg0: memref<?x?xf32>) {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %dim = memref.dim %arg0, %c0 : memref<?x?xf32>
    %dim_0 = memref.dim %arg0, %c1 : memref<?x?xf32>
    scf.for %arg1 = %c0 to %dim step %c1 {
      scf.for %arg2 = %c0 to %dim_0 step %c1 {
        %0 = arith.addi %arg1, %c1 : index
        %1 = arith.index_cast %0 : index to i32
        %2 = arith.sitofp %1 : i32 to f32
        memref.store %2, %arg0[%arg1, %arg2] : memref<?x?xf32>
      }
    }
    return
  }
  func.func @testTransposedReadWithMask(%arg0: index, %arg1: index) {
    %alloca = memref.alloca() : memref<4x16xf32>
    %alloca_0 = memref.alloca() : memref<16x4xf32>
    %cast = memref.cast %alloca : memref<4x16xf32> to memref<?x?xf32>
    %cast_1 = memref.cast %alloca_0 : memref<16x4xf32> to memref<?x?xf32>
    call @fill2DMemrefRows(%cast) : (memref<?x?xf32>) -> ()
    %0 = vector.create_mask %arg0, %arg1 : vector<[4]x[16]xi1>
    %cst = arith.constant 0.000000e+00 : f32
    %c0 = arith.constant 0 : index
    %1 = vector.transfer_read %cast[%c0, %c0], %cst, %0 {in_bounds = [true, true], permutation_map = #map} : memref<?x?xf32>, vector<[16]x[4]xf32>
    vector.transfer_write %1, %cast_1[%c0, %c0] {in_bounds = [true, true]} : vector<[16]x[4]xf32>, memref<?x?xf32>
    vector.print str "Input memref:\0A"
    %cast_2 = memref.cast %cast : memref<?x?xf32> to memref<*xf32>
    call @printMemrefF32(%cast_2) : (memref<*xf32>) -> ()
    vector.print str "Masked transposed result:\0A"
    %cast_3 = memref.cast %cast_1 : memref<?x?xf32> to memref<*xf32>
    call @printMemrefF32(%cast_3) : (memref<*xf32>) -> ()
    return
  }
  func.func @testTransposedWriteWithMask(%arg0: index, %arg1: index) {
    %alloca = memref.alloca() : memref<16x4xf32>
    %alloca_0 = memref.alloca() : memref<4x16xf32>
    %cst = arith.constant 0.000000e+00 : f32
    linalg.fill ins(%cst : f32) outs(%alloca_0 : memref<4x16xf32>)
    %cast = memref.cast %alloca : memref<16x4xf32> to memref<?x?xf32>
    %cast_1 = memref.cast %alloca_0 : memref<4x16xf32> to memref<?x?xf32>
    call @fill2DMemrefRows(%cast) : (memref<?x?xf32>) -> ()
    %c0 = arith.constant 0 : index
    %0 = vector.transfer_read %cast[%c0, %c0], %cst {in_bounds = [true, true]} : memref<?x?xf32>, vector<[16]x[4]xf32>
    %1 = vector.create_mask %arg0, %arg1 : vector<[4]x[16]xi1>
    vector.transfer_write %0, %cast_1[%c0, %c0], %1 {in_bounds = [true, true], permutation_map = #map} : vector<[16]x[4]xf32>, memref<?x?xf32>
    vector.print str "Input memref:\0A"
    %cast_2 = memref.cast %cast : memref<?x?xf32> to memref<*xf32>
    call @printMemrefF32(%cast_2) : (memref<*xf32>) -> ()
    vector.print str "Masked transposed result:\0A"
    %cast_3 = memref.cast %cast_1 : memref<?x?xf32> to memref<*xf32>
    call @printMemrefF32(%cast_3) : (memref<*xf32>) -> ()
    return
  }
  func.func @main() {
    %c128_i32 = arith.constant 128 : i32
    call @setArmSVLBits(%c128_i32) : (i32) -> ()
    %c2 = arith.constant 2 : index
    %c15 = arith.constant 15 : index
    call @testTransposedReadWithMask(%c2, %c15) : (index, index) -> ()
    %c3 = arith.constant 3 : index
    %c8 = arith.constant 8 : index
    call @testTransposedWriteWithMask(%c3, %c8) : (index, index) -> ()
    return
  }
  func.func private @printMemrefF32(memref<*xf32>)
  func.func private @setArmSVLBits(i32)
}

