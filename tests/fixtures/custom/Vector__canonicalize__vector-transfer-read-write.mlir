#map = affine_map<(d0, d1) -> (d0)>
module {
  func.func @canonicalize_transfer_read_size1_map(%arg0: memref<4x3xf32>, %arg1: index, %arg2: index, %arg3: f32) -> vector<1xf32> {
    %0 = vector.transfer_read %arg0[%arg1, %arg2], %arg3 {in_bounds = [true], permutation_map = #map} : memref<4x3xf32>, vector<1xf32>
    return %0 : vector<1xf32>
  }
}

// -----
#map = affine_map<(d0, d1) -> (d0)>
module {
  func.func @canonicalize_transfer_write_size1_map(%arg0: vector<1xf32>, %arg1: memref<4x3xf32>, %arg2: index, %arg3: index) {
    vector.transfer_write %arg0, %arg1[%arg2, %arg3] {in_bounds = [true], permutation_map = #map} : vector<1xf32>, memref<4x3xf32>
    return
  }
}

// -----
#map = affine_map<(d0, d1, d2) -> (d0)>
module {
  func.func @canonicalize_transfer_read_size1_rank3(%arg0: memref<4x3x2xf32>, %arg1: index, %arg2: index, %arg3: index, %arg4: f32) -> vector<1xf32> {
    %0 = vector.transfer_read %arg0[%arg1, %arg2, %arg3], %arg4 {in_bounds = [true], permutation_map = #map} : memref<4x3x2xf32>, vector<1xf32>
    return %0 : vector<1xf32>
  }
}

// -----
#map = affine_map<(d0, d1, d2) -> (d1)>
module {
  func.func @canonicalize_transfer_read_size1_middle_dim(%arg0: memref<4x3x2xf32>, %arg1: index, %arg2: index, %arg3: index, %arg4: f32) -> vector<1xf32> {
    %0 = vector.transfer_read %arg0[%arg1, %arg2, %arg3], %arg4 {in_bounds = [true], permutation_map = #map} : memref<4x3x2xf32>, vector<1xf32>
    return %0 : vector<1xf32>
  }
}

// -----
module {
  func.func @negative_size1_already_minor_identity(%arg0: memref<4x3xf32>, %arg1: index, %arg2: index, %arg3: f32) -> vector<1xf32> {
    %0 = vector.transfer_read %arg0[%arg1, %arg2], %arg3 {in_bounds = [true]} : memref<4x3xf32>, vector<1xf32>
    return %0 : vector<1xf32>
  }
}

// -----
#map = affine_map<(d0, d1) -> (d0)>
module {
  func.func @negative_size1_size_not_one(%arg0: memref<4x3xf32>, %arg1: index, %arg2: index, %arg3: f32) -> vector<4xf32> {
    %0 = vector.transfer_read %arg0[%arg1, %arg2], %arg3 {in_bounds = [true], permutation_map = #map} : memref<4x3xf32>, vector<4xf32>
    return %0 : vector<4xf32>
  }
}

// -----
module {
  func.func @negative_size1_rank0(%arg0: memref<4xf32>, %arg1: index, %arg2: f32) -> vector<f32> {
    %0 = vector.transfer_read %arg0[%arg1], %arg2 : memref<4xf32>, vector<f32>
    return %0 : vector<f32>
  }
}

// -----
module {
  func.func @negative_size1_rank2(%arg0: memref<4x3xf32>, %arg1: index, %arg2: index, %arg3: f32) -> vector<2x4xf32> {
    %0 = vector.transfer_read %arg0[%arg1, %arg2], %arg3 {in_bounds = [true, true]} : memref<4x3xf32>, vector<2x4xf32>
    return %0 : vector<2x4xf32>
  }
}

// -----
#map = affine_map<(d0, d1) -> (d0)>
module {
  func.func @negative_size1_scalable(%arg0: memref<4x3xf32>, %arg1: index, %arg2: index, %arg3: f32) -> vector<[1]xf32> {
    %0 = vector.transfer_read %arg0[%arg1, %arg2], %arg3 {in_bounds = [true], permutation_map = #map} : memref<4x3xf32>, vector<[1]xf32>
    return %0 : vector<[1]xf32>
  }
}

