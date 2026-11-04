#map = affine_map<(d0) -> (d0)>
#map1 = affine_map<(d0, d1) -> (0, d1)>
#map2 = affine_map<(d0, d1) -> (d0, d1)>
#map3 = affine_map<(d0, d1) -> (d0, 0)>
#map4 = affine_map<(d0, d1, d2) -> (d0, d2)>
#map5 = affine_map<(d0, d1, d2) -> (d2, d1)>
#map6 = affine_map<(d0, d1, d2) -> (d0, d1)>
#map7 = affine_map<(d0, d1, d2, d3) -> (d0 * 3 + d2, d1 * 4 + d3)>
#map8 = affine_map<(d0, d1, d2, d3) -> (d2, d3)>
#map9 = affine_map<(d0, d1, d2, d3) -> (d0, d1)>
#map10 = affine_map<(d0) -> (-d0 + 3)>
module {
  func.func @main() {
    %cst = arith.constant dense<0.000000e+00> : tensor<5xf32>
    %cst_0 = arith.constant dense<0.000000e+00> : tensor<4xf32>
    %cast = tensor.cast %cst : tensor<5xf32> to tensor<?xf32>
    %cast_1 = tensor.cast %cst_0 : tensor<4xf32> to tensor<?xf32>
    %0 = call @simple_add(%cast, %cast_1) : (tensor<?xf32>, tensor<?xf32>) -> tensor<?xf32>
    %1 = call @simple_add(%cast_1, %cast) : (tensor<?xf32>, tensor<?xf32>) -> tensor<?xf32>
    %cst_2 = arith.constant dense<0.000000e+00> : tensor<1x1xf32>
    %cst_3 = arith.constant dense<0.000000e+00> : tensor<1x4xf32>
    %cst_4 = arith.constant dense<0.000000e+00> : tensor<4x4xf32>
    %cst_5 = arith.constant dense<0.000000e+00> : tensor<4x5xf32>
    %cst_6 = arith.constant dense<0.000000e+00> : tensor<5x4xf32>
    %cast_7 = tensor.cast %cst_2 : tensor<1x1xf32> to tensor<?x?xf32>
    %cast_8 = tensor.cast %cst_3 : tensor<1x4xf32> to tensor<?x?xf32>
    %cast_9 = tensor.cast %cst_4 : tensor<4x4xf32> to tensor<?x?xf32>
    %cast_10 = tensor.cast %cst_5 : tensor<4x5xf32> to tensor<?x?xf32>
    %cast_11 = tensor.cast %cst_6 : tensor<5x4xf32> to tensor<?x?xf32>
    %2 = call @broadcast_add(%cast_8, %cast_10) : (tensor<?x?xf32>, tensor<?x?xf32>) -> tensor<?x?xf32>
    %3 = call @broadcast_add(%cast_11, %cast_10) : (tensor<?x?xf32>, tensor<?x?xf32>) -> tensor<?x?xf32>
    %4 = call @matmul_generic(%cast_10, %cast_10) : (tensor<?x?xf32>, tensor<?x?xf32>) -> tensor<?x?xf32>
    %5 = call @matmul_named(%cast_10, %cast_10) : (tensor<?x?xf32>, tensor<?x?xf32>) -> tensor<?x?xf32>
    %cst_12 = arith.constant dense<0.000000e+00> : tensor<16x29xf32>
    %cst_13 = arith.constant dense<0.000000e+00> : tensor<3x4xf32>
    %6 = call @reverse_from_3(%cast) : (tensor<?xf32>) -> tensor<?xf32>
    %cst_14 = arith.constant dense<1.000000e+00> : tensor<0xf32>
    %cast_15 = tensor.cast %cst_14 : tensor<0xf32> to tensor<?xf32>
    %cst_16 = arith.constant dense<0.000000e+00> : tensor<0x5xf32>
    %cast_17 = tensor.cast %cst_16 : tensor<0x5xf32> to tensor<?x?xf32>
    %7 = call @fill_empty_1d(%cast_15) : (tensor<?xf32>) -> tensor<?xf32>
    %8 = call @simple_add(%cast, %cast) : (tensor<?xf32>, tensor<?xf32>) -> tensor<?xf32>
    %9 = call @fill_empty_2d(%cast_17) : (tensor<?x?xf32>) -> tensor<?x?xf32>
    %10 = call @conv(%cst_12, %cst_13) : (tensor<16x29xf32>, tensor<3x4xf32>) -> tensor<5x7xf32>
    %11 = call @reverse_from_3(%cast_1) : (tensor<?xf32>) -> tensor<?xf32>
    %12 = call @matmul_named(%cast_11, %cast_10) : (tensor<?x?xf32>, tensor<?x?xf32>) -> tensor<?x?xf32>
    %13 = call @matmul_generic(%cast_11, %cast_10) : (tensor<?x?xf32>, tensor<?x?xf32>) -> tensor<?x?xf32>
    %14 = call @broadcast_add(%cast_7, %cast_7) : (tensor<?x?xf32>, tensor<?x?xf32>) -> tensor<?x?xf32>
    %15 = call @broadcast_add(%cast_7, %cast_10) : (tensor<?x?xf32>, tensor<?x?xf32>) -> tensor<?x?xf32>
    %16 = call @broadcast_add(%cast_9, %cast_8) : (tensor<?x?xf32>, tensor<?x?xf32>) -> tensor<?x?xf32>
    return
  }
  func.func @simple_add(%arg0: tensor<?xf32>, %arg1: tensor<?xf32>) -> tensor<?xf32> {
    %0 = linalg.generic {indexing_maps = [#map, #map], iterator_types = ["parallel"]} ins(%arg0 : tensor<?xf32>) outs(%arg1 : tensor<?xf32>) {
    ^bb0(%in: f32, %out: f32):
      %1 = arith.addf %in, %out : f32
      linalg.yield %1 : f32
    } -> tensor<?xf32>
    return %0 : tensor<?xf32>
  }
  func.func @broadcast_add(%arg0: tensor<?x?xf32>, %arg1: tensor<?x?xf32>) -> tensor<?x?xf32> {
    %c0 = arith.constant 0 : index
    %dim = tensor.dim %arg0, %c0 : tensor<?x?xf32>
    %dim_0 = tensor.dim %arg1, %c0 : tensor<?x?xf32>
    %0 = arith.maxui %dim, %dim_0 : index
    %c1 = arith.constant 1 : index
    %dim_1 = tensor.dim %arg0, %c1 : tensor<?x?xf32>
    %dim_2 = tensor.dim %arg1, %c1 : tensor<?x?xf32>
    %1 = arith.maxui %dim_1, %dim_2 : index
    %dim_3 = tensor.dim %arg0, %c0 : tensor<?x?xf32>
    %2 = arith.cmpi eq, %dim_3, %c1 : index
    %3 = scf.if %2 -> (tensor<?x?xf32>) {
      %dim_7 = tensor.dim %arg0, %c1 : tensor<?x?xf32>
      %12 = tensor.empty(%0, %dim_7) : tensor<?x?xf32>
      %13 = linalg.generic {indexing_maps = [#map1, #map2], iterator_types = ["parallel", "parallel"]} ins(%arg0 : tensor<?x?xf32>) outs(%12 : tensor<?x?xf32>) {
      ^bb0(%in: f32, %out: f32):
        linalg.yield %in : f32
      } -> tensor<?x?xf32>
      scf.yield %13 : tensor<?x?xf32>
    } else {
      scf.yield %arg0 : tensor<?x?xf32>
    }
    %dim_4 = tensor.dim %3, %c1 : tensor<?x?xf32>
    %4 = arith.cmpi eq, %dim_4, %c1 : index
    %5 = scf.if %4 -> (tensor<?x?xf32>) {
      %dim_7 = tensor.dim %3, %c0 : tensor<?x?xf32>
      %12 = tensor.empty(%dim_7, %1) : tensor<?x?xf32>
      %13 = linalg.generic {indexing_maps = [#map3, #map2], iterator_types = ["parallel", "parallel"]} ins(%3 : tensor<?x?xf32>) outs(%12 : tensor<?x?xf32>) {
      ^bb0(%in: f32, %out: f32):
        linalg.yield %in : f32
      } -> tensor<?x?xf32>
      scf.yield %13 : tensor<?x?xf32>
    } else {
      scf.yield %3 : tensor<?x?xf32>
    }
    %dim_5 = tensor.dim %arg1, %c0 : tensor<?x?xf32>
    %6 = arith.cmpi eq, %dim_5, %c1 : index
    %7 = scf.if %6 -> (tensor<?x?xf32>) {
      %dim_7 = tensor.dim %arg1, %c1 : tensor<?x?xf32>
      %12 = tensor.empty(%0, %dim_7) : tensor<?x?xf32>
      %13 = linalg.generic {indexing_maps = [#map1, #map2], iterator_types = ["parallel", "parallel"]} ins(%arg1 : tensor<?x?xf32>) outs(%12 : tensor<?x?xf32>) {
      ^bb0(%in: f32, %out: f32):
        linalg.yield %in : f32
      } -> tensor<?x?xf32>
      scf.yield %13 : tensor<?x?xf32>
    } else {
      scf.yield %arg1 : tensor<?x?xf32>
    }
    %dim_6 = tensor.dim %7, %c1 : tensor<?x?xf32>
    %8 = arith.cmpi eq, %dim_6, %c1 : index
    %9 = scf.if %8 -> (tensor<?x?xf32>) {
      %dim_7 = tensor.dim %7, %c0 : tensor<?x?xf32>
      %12 = tensor.empty(%dim_7, %1) : tensor<?x?xf32>
      %13 = linalg.generic {indexing_maps = [#map3, #map2], iterator_types = ["parallel", "parallel"]} ins(%7 : tensor<?x?xf32>) outs(%12 : tensor<?x?xf32>) {
      ^bb0(%in: f32, %out: f32):
        linalg.yield %in : f32
      } -> tensor<?x?xf32>
      scf.yield %13 : tensor<?x?xf32>
    } else {
      scf.yield %7 : tensor<?x?xf32>
    }
    %10 = tensor.empty(%0, %1) : tensor<?x?xf32>
    %11 = linalg.generic {indexing_maps = [#map2, #map2, #map2], iterator_types = ["parallel", "parallel"]} ins(%5, %9 : tensor<?x?xf32>, tensor<?x?xf32>) outs(%10 : tensor<?x?xf32>) {
    ^bb0(%in: f32, %in_7: f32, %out: f32):
      %12 = arith.addf %in, %in_7 : f32
      linalg.yield %12 : f32
    } -> tensor<?x?xf32>
    return %11 : tensor<?x?xf32>
  }
  func.func @matmul_generic(%arg0: tensor<?x?xf32>, %arg1: tensor<?x?xf32>) -> tensor<?x?xf32> {
    %cst = arith.constant 0.000000e+00 : f32
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %dim = tensor.dim %arg0, %c0 : tensor<?x?xf32>
    %dim_0 = tensor.dim %arg1, %c1 : tensor<?x?xf32>
    %splat = tensor.splat %cst[%dim, %dim_0] : tensor<?x?xf32>
    %0 = linalg.generic {indexing_maps = [#map4, #map5, #map6], iterator_types = ["parallel", "parallel", "reduction"]} ins(%arg0, %arg1 : tensor<?x?xf32>, tensor<?x?xf32>) outs(%splat : tensor<?x?xf32>) {
    ^bb0(%in: f32, %in_1: f32, %out: f32):
      %1 = arith.mulf %in, %in_1 : f32
      %2 = arith.addf %out, %1 : f32
      linalg.yield %2 : f32
    } -> tensor<?x?xf32>
    return %0 : tensor<?x?xf32>
  }
  func.func @matmul_named(%arg0: tensor<?x?xf32>, %arg1: tensor<?x?xf32>) -> tensor<?x?xf32> {
    %cst = arith.constant 0.000000e+00 : f32
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %dim = tensor.dim %arg0, %c0 : tensor<?x?xf32>
    %dim_0 = tensor.dim %arg1, %c1 : tensor<?x?xf32>
    %splat = tensor.splat %cst[%dim, %dim_0] : tensor<?x?xf32>
    %0 = linalg.matmul ins(%arg0, %arg1 : tensor<?x?xf32>, tensor<?x?xf32>) outs(%splat : tensor<?x?xf32>) -> tensor<?x?xf32>
    return %0 : tensor<?x?xf32>
  }
  func.func @conv(%arg0: tensor<16x29xf32>, %arg1: tensor<3x4xf32>) -> tensor<5x7xf32> {
    %cst = arith.constant 0.000000e+00 : f32
    %splat = tensor.splat %cst : tensor<5x7xf32>
    %0 = linalg.generic {indexing_maps = [#map7, #map8, #map9], iterator_types = ["parallel", "parallel", "reduction", "reduction"]} ins(%arg0, %arg1 : tensor<16x29xf32>, tensor<3x4xf32>) outs(%splat : tensor<5x7xf32>) {
    ^bb0(%in: f32, %in_0: f32, %out: f32):
      %1 = arith.mulf %in, %in_0 : f32
      %2 = arith.addf %out, %1 : f32
      linalg.yield %2 : f32
    } -> tensor<5x7xf32>
    return %0 : tensor<5x7xf32>
  }
  func.func @reverse_from_3(%arg0: tensor<?xf32>) -> tensor<?xf32> {
    %cst = arith.constant 0.000000e+00 : f32
    %c0 = arith.constant 0 : index
    %dim = tensor.dim %arg0, %c0 : tensor<?xf32>
    %splat = tensor.splat %cst[%dim] : tensor<?xf32>
    %0 = linalg.generic {indexing_maps = [#map10, #map], iterator_types = ["parallel"]} ins(%arg0 : tensor<?xf32>) outs(%splat : tensor<?xf32>) {
    ^bb0(%in: f32, %out: f32):
      linalg.yield %in : f32
    } -> tensor<?xf32>
    return %0 : tensor<?xf32>
  }
  func.func @fill_empty_1d(%arg0: tensor<?xf32>) -> tensor<?xf32> {
    %cst = arith.constant 0.000000e+00 : f32
    %0 = linalg.fill ins(%cst : f32) outs(%arg0 : tensor<?xf32>) -> tensor<?xf32>
    return %0 : tensor<?xf32>
  }
  func.func @fill_empty_2d(%arg0: tensor<?x?xf32>) -> tensor<?x?xf32> {
    %cst = arith.constant 0.000000e+00 : f32
    %0 = linalg.fill ins(%cst : f32) outs(%arg0 : tensor<?x?xf32>) -> tensor<?x?xf32>
    return %0 : tensor<?x?xf32>
  }
}

