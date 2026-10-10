#map = affine_map<()[s0, s1] -> (1024, s0 - s1)>
#map1 = affine_map<()[s0, s1] -> (64, s0 - s1)>
module {
  func.func @parallel_loop(%arg0: index, %arg1: index, %arg2: memref<?x?xf32>, %arg3: memref<?x?xf32>, %arg4: memref<?x?xf32>, %arg5: memref<?x?xf32>) {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %dim = memref.dim %arg2, %c0 : memref<?x?xf32>
    %dim_0 = memref.dim %arg2, %c1 : memref<?x?xf32>
    %0 = affine.min #map()[%dim, %arg0]
    %1 = affine.min #map1()[%dim_0, %arg1]
    scf.parallel (%arg6, %arg7) = (%c0, %c0) to (%0, %1) step (%c1, %c1) {
      %2 = memref.load %arg3[%arg6, %arg7] : memref<?x?xf32>
      %3 = memref.load %arg4[%arg6, %arg7] : memref<?x?xf32>
      %4 = arith.addf %2, %3 : f32
      memref.store %4, %arg5[%arg6, %arg7] : memref<?x?xf32>
      scf.reduce 
    }
    return
  }
}

