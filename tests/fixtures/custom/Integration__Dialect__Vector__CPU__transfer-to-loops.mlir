#map = affine_map<(d0, d1) -> (d1, d0)>
module {
  func.func private @printMemrefF32(memref<*xf32>)
  func.func @alloc_2d_filled_f32(%arg0: index, %arg1: index) -> memref<?x?xf32> {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c10 = arith.constant 10 : index
    %c100 = arith.constant 100 : index
    %alloc = memref.alloc(%arg0, %arg1) : memref<?x?xf32>
    scf.for %arg2 = %c0 to %arg0 step %c1 {
      scf.for %arg3 = %c0 to %arg1 step %c1 {
        %0 = arith.muli %arg3, %c100 : index
        %1 = arith.addi %arg2, %0 : index
        %2 = arith.index_cast %1 : index to i32
        %3 = arith.sitofp %2 : i32 to f32
        memref.store %3, %alloc[%arg2, %arg3] : memref<?x?xf32>
      }
    }
    return %alloc : memref<?x?xf32>
  }
  func.func @main() {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c2 = arith.constant 2 : index
    %c3 = arith.constant 3 : index
    %c6 = arith.constant 6 : index
    %cst = arith.constant -4.200000e+01 : f32
    %0 = call @alloc_2d_filled_f32(%c6, %c6) : (index, index) -> memref<?x?xf32>
    %cast = memref.cast %0 : memref<?x?xf32> to memref<*xf32>
    call @printMemrefF32(%cast) : (memref<*xf32>) -> ()
    %1 = vector.transfer_read %0[%c1, %c1], %cst : memref<?x?xf32>, vector<5x5xf32>
    vector.print %1 : vector<5x5xf32>
    %2 = vector.transfer_read %0[%c1, %c1], %cst {permutation_map = #map} : memref<?x?xf32>, vector<5x5xf32>
    vector.print %2 : vector<5x5xf32>
    vector.transfer_write %2, %0[%c0, %c0] {permutation_map = #map} : vector<5x5xf32>, memref<?x?xf32>
    %3 = vector.transfer_read %0[%c1, %c1], %cst : memref<?x?xf32>, vector<5x5xf32>
    vector.print %3 : vector<5x5xf32>
    %4 = vector.transfer_read %0[%c2, %c3], %cst : memref<?x?xf32>, vector<5x5xf32>
    vector.print %4 : vector<5x5xf32>
    %5 = vector.transfer_read %0[%c2, %c3], %cst {permutation_map = #map} : memref<?x?xf32>, vector<5x5xf32>
    vector.print %5 : vector<5x5xf32>
    %6 = vector.transfer_read %0[%c2, %c3], %cst : memref<?x?xf32>, vector<5xf32>
    vector.print %6 : vector<5xf32>
    memref.dealloc %0 : memref<?x?xf32>
    return
  }
}

