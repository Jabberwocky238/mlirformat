module {
  func.func @test_side_effects(%arg0: memref<8xf32>) {
    %c0 = arith.constant 0 : index
    %c4 = arith.constant 4 : index
    %cst = arith.constant 0.000000e+00 : f32
    %0 = vector.transfer_read %arg0[%c0], %cst : memref<8xf32>, vector<4xf32>
    vector.transfer_write %0, %arg0[%c4] : vector<4xf32>, memref<8xf32>
    return
  }
}

