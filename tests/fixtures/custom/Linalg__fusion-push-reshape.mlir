#map = affine_map<(d0, d1, d2) -> (d0, d1, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d2)>
module {
  func.func @reshape(%arg0: tensor<?x16xf32>, %arg1: tensor<16xf32>, %arg2: tensor<?x112x16xf32>, %arg3: index) -> tensor<?x112x16xf32> {
    %expanded = tensor.expand_shape %arg0 [[0, 1], [2]] output_shape [%arg3, 112, 16] : tensor<?x16xf32> into tensor<?x112x16xf32>
    %0 = linalg.generic {indexing_maps = [#map, #map1, #map], iterator_types = ["parallel", "parallel", "parallel"]} ins(%expanded, %arg1 : tensor<?x112x16xf32>, tensor<16xf32>) outs(%arg2 : tensor<?x112x16xf32>) {
    ^bb0(%in: f32, %in_0: f32, %out: f32):
      %1 = arith.subf %in, %in_0 : f32
      linalg.yield %1 : f32
    } -> tensor<?x112x16xf32>
    return %0 : tensor<?x112x16xf32>
  }
}

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d1, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d2)>
module {
  func.func @reshape_multiple(%arg0: tensor<12544x16xf32>, %arg1: tensor<12544x16xf32>, %arg2: tensor<16xf32>) -> tensor<112x112x16xf32> {
    %expanded = tensor.expand_shape %arg0 [[0, 1], [2]] output_shape [112, 112, 16] : tensor<12544x16xf32> into tensor<112x112x16xf32>
    %expanded_0 = tensor.expand_shape %arg1 [[0, 1], [2]] output_shape [112, 112, 16] : tensor<12544x16xf32> into tensor<112x112x16xf32>
    %0 = tensor.empty() : tensor<112x112x16xf32>
    %1 = linalg.generic {indexing_maps = [#map, #map, #map1, #map], iterator_types = ["parallel", "parallel", "parallel"]} ins(%expanded, %expanded_0, %arg2 : tensor<112x112x16xf32>, tensor<112x112x16xf32>, tensor<16xf32>) outs(%0 : tensor<112x112x16xf32>) {
    ^bb0(%in: f32, %in_1: f32, %in_2: f32, %out: f32):
      %2 = arith.subf %in, %in_1 : f32
      %3 = arith.mulf %2, %in_2 : f32
      linalg.yield %3 : f32
    } -> tensor<112x112x16xf32>
    return %1 : tensor<112x112x16xf32>
  }
}

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d1, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d1)>
module {
  func.func @reshape_negative(%arg0: tensor<12544x16xf32>, %arg1: tensor<112xf32>) -> tensor<112x112x16xf32> {
    %expanded = tensor.expand_shape %arg0 [[0, 1], [2]] output_shape [112, 112, 16] : tensor<12544x16xf32> into tensor<112x112x16xf32>
    %0 = tensor.empty() : tensor<112x112x16xf32>
    %1 = linalg.generic {indexing_maps = [#map, #map1, #map], iterator_types = ["parallel", "parallel", "parallel"]} ins(%expanded, %arg1 : tensor<112x112x16xf32>, tensor<112xf32>) outs(%0 : tensor<112x112x16xf32>) {
    ^bb0(%in: f32, %in_0: f32, %out: f32):
      %2 = arith.subf %in, %in_0 : f32
      linalg.yield %2 : f32
    } -> tensor<112x112x16xf32>
    return %1 : tensor<112x112x16xf32>
  }
}

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d1, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d2)>
module {
  func.func @type_correctness(%arg0: tensor<6x5xi32>, %arg1: tensor<5xf32>, %arg2: tensor<5xf32>) -> tensor<2x3x5xf32> {
    %cst = arith.constant 1.000000e+00 : f32
    %cst_0 = arith.constant 7.000000e+00 : f32
    %cst_1 = arith.constant 1.1920929E-7 : f32
    %expanded = tensor.expand_shape %arg0 [[0, 1], [2]] output_shape [2, 3, 5] : tensor<6x5xi32> into tensor<2x3x5xi32>
    %0 = tensor.empty() : tensor<2x3x5xf32>
    %1 = linalg.generic {indexing_maps = [#map, #map1, #map1, #map], iterator_types = ["parallel", "parallel", "parallel"]} ins(%expanded, %arg1, %arg2 : tensor<2x3x5xi32>, tensor<5xf32>, tensor<5xf32>) outs(%0 : tensor<2x3x5xf32>) {
    ^bb0(%in: i32, %in_2: f32, %in_3: f32, %out: f32):
      %2 = arith.sitofp %in : i32 to f32
      %3 = arith.addf %in_2, %cst_1 : f32
      %4 = arith.divf %cst_0, %3 : f32
      %5 = arith.divf %cst, %4 : f32
      %6 = arith.mulf %2, %5 : f32
      %7 = arith.addf %6, %in_3 : f32
      linalg.yield %7 : f32
    } -> tensor<2x3x5xf32>
    return %1 : tensor<2x3x5xf32>
  }
}

