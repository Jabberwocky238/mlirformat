#map = affine_map<()[s0, s1] -> (1024, s0 - s1)>
module {
  func.func @for(%arg0: index, %arg1: memref<?xf32>, %arg2: memref<?xf32>, %arg3: memref<?xf32>, %arg4: memref<?xf32>) {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %dim = memref.dim %arg1, %c0 : memref<?xf32>
    %0 = affine.min #map()[%dim, %arg0]
    scf.for %arg5 = %c0 to %0 step %c1 {
      %1 = memref.load %arg2[%arg5] : memref<?xf32>
      %2 = memref.load %arg3[%arg5] : memref<?xf32>
      %3 = arith.addf %1, %2 : f32
      memref.store %3, %arg4[%arg5] : memref<?xf32>
    }
    return
  }
}

