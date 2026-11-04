#map = affine_map<(d0, d1) -> (d1, d0)>
module {
  func.func @transfer_read_2d_mask_transposed(%arg0: memref<?x?xf32>, %arg1: index, %arg2: index) -> vector<9x4xf32> {
    %cst = arith.constant -4.200000e+01 : f32
    %cst_0 = arith.constant dense<[[true, false, true, false, true, true, true, false, true], [false, false, true, true, true, true, true, false, true], [true, true, true, true, true, true, true, false, true], [false, false, true, false, true, true, true, false, true]]> : vector<4x9xi1>
    %0 = vector.transfer_read %arg0[%arg1, %arg2], %cst, %cst_0 {permutation_map = #map} : memref<?x?xf32>, vector<9x4xf32>
    return %0 : vector<9x4xf32>
  }
}

