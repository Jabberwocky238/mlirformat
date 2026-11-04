module {
  func.func @invalid_operand(%arg0: vector<4xf32>, %arg1: vector<4xf32>) {
    affine.for %arg2 = 0 to 10 {
      %0 = vector.reduction <add>, %arg0 : vector<4xf32> into f32
    }
    return
  }
  func.func @invalid_result(%arg0: memref<10x20xf32>, %arg1: memref<10x20xf32>) {
    affine.for %arg2 = 0 to 10 {
      affine.for %arg3 = 0 to 5 {
        %0 = affine.vector_load %arg0[%arg2, %arg3] : memref<10x20xf32>, vector<4xf32>
        affine.vector_store %0, %arg1[%arg2, %arg3] : memref<10x20xf32>, vector<4xf32>
      }
    }
    return
  }
}

