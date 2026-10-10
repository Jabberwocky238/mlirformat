#map = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2, d3)>
#map1 = affine_map<(d0, d1, d2, d3) -> (d0, d1)>
module {
  func.func @collapse_reduction(%arg0: tensor<2x32x10x4096xf32>, %arg1: tensor<2x32xf32>) -> tensor<2x32xf32> {
    %0 = linalg.generic {indexing_maps = [#map, #map1], iterator_types = ["parallel", "parallel", "reduction", "reduction"]} ins(%arg0 : tensor<2x32x10x4096xf32>) outs(%arg1 : tensor<2x32xf32>) {
    ^bb0(%in: f32, %out: f32):
      %1 = arith.addf %in, %out : f32
      linalg.yield %1 : f32
    } -> tensor<2x32xf32>
    return %0 : tensor<2x32xf32>
  }
}

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d1, d0, d2, d3)>
#map1 = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2, d3)>
module {
  func.func @collapse_parallel(%arg0: tensor<32x2x10x4096xf32>, %arg1: tensor<2x32x10x4096xf32>) -> tensor<2x32x10x4096xf32> {
    %0 = linalg.generic {indexing_maps = [#map, #map1], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} ins(%arg0 : tensor<32x2x10x4096xf32>) outs(%arg1 : tensor<2x32x10x4096xf32>) {
    ^bb0(%in: f32, %out: f32):
      %1 = arith.addf %in, %out : f32
      linalg.yield %1 : f32
    } -> tensor<2x32x10x4096xf32>
    return %0 : tensor<2x32x10x4096xf32>
  }
}

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d3, d0, d1, d2)>
#map1 = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2, d3)>
module {
  func.func @uncollapsable(%arg0: tensor<41x3x1x57xf32>, %arg1: tensor<3x1x57x41xf32>) -> tensor<3x1x57x41xf32> {
    %0 = linalg.generic {indexing_maps = [#map, #map1], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} ins(%arg0 : tensor<41x3x1x57xf32>) outs(%arg1 : tensor<3x1x57x41xf32>) {
    ^bb0(%in: f32, %out: f32):
      linalg.yield %in : f32
    } -> tensor<3x1x57x41xf32>
    return %0 : tensor<3x1x57x41xf32>
  }
}

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2, d3)>
module {
  func.func private @collapsable_memref(%arg0: memref<1x24x32x8xf32>, %arg1: memref<1x24x32x8xf32>) -> memref<1x24x32x8xf32> {
    %alloc = memref.alloc() {alignment = 64 : i64} : memref<1x24x32x8xf32>
    linalg.generic {indexing_maps = [#map, #map, #map], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} ins(%arg0, %arg1 : memref<1x24x32x8xf32>, memref<1x24x32x8xf32>) outs(%alloc : memref<1x24x32x8xf32>) {
    ^bb0(%in: f32, %in_0: f32, %out: f32):
      %0 = arith.addf %in, %in_0 : f32
      linalg.yield %0 : f32
    }
    return %alloc : memref<1x24x32x8xf32>
  }
}

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d0 * 7680 + d1 * 320 + d2 * 10 + d3)>
#map1 = affine_map<(d0, d1, d2, d3) -> (d0, d2, d3, d1)>
module {
  func.func @collapsable_memref_projected_ops(%arg0: memref<1x24x32x8xf32>, %arg1: memref<1x24x32x8xf32>, %arg2: memref<1x24x32x8xf32, #map>) {
    linalg.generic {indexing_maps = [#map1, #map1, #map1], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} ins(%arg0, %arg1 : memref<1x24x32x8xf32>, memref<1x24x32x8xf32>) outs(%arg2 : memref<1x24x32x8xf32, #map>) {
    ^bb0(%in: f32, %in_0: f32, %out: f32):
      %0 = arith.addf %in, %in_0 : f32
      linalg.yield %0 : f32
    }
    return
  }
}

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2, d3)>
module {
  func.func @uncollapsable_strided_memref(%arg0: memref<2x6x24x48xi32>, %arg1: memref<2x6x24x48xi32>) -> memref<2x6x24x48xi32> {
    %alloc = memref.alloc() {alignment = 64 : i64} : memref<2x6x24x48xi32>
    %subview = memref.subview %arg0[0, 0, 0, 0] [1, 3, 12, 24] [1, 1, 1, 1] : memref<2x6x24x48xi32> to memref<1x3x12x24xi32, strided<[6912, 1152, 48, 1]>>
    %subview_0 = memref.subview %arg1[0, 0, 0, 0] [1, 3, 12, 24] [1, 1, 1, 1] : memref<2x6x24x48xi32> to memref<1x3x12x24xi32, strided<[6912, 1152, 48, 1]>>
    %subview_1 = memref.subview %alloc[0, 0, 0, 0] [1, 3, 12, 24] [1, 1, 1, 1] : memref<2x6x24x48xi32> to memref<1x3x12x24xi32, strided<[6912, 1152, 48, 1]>>
    linalg.generic {indexing_maps = [#map, #map, #map], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} ins(%subview, %subview_0 : memref<1x3x12x24xi32, strided<[6912, 1152, 48, 1]>>, memref<1x3x12x24xi32, strided<[6912, 1152, 48, 1]>>) outs(%subview_1 : memref<1x3x12x24xi32, strided<[6912, 1152, 48, 1]>>) {
    ^bb0(%in: i32, %in_2: i32, %out: i32):
      %0 = arith.addi %in, %in_2 : i32
      linalg.yield %0 : i32
    }
    return %alloc : memref<2x6x24x48xi32>
  }
}

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d0 * 7680 + d1 * 320 + d2 * 8 + d3)>
#map1 = affine_map<(d0, d1, d2, d3) -> (d0, d2, d3, d1)>
module {
  func.func @uncollapsable_memref_projected_ops(%arg0: memref<1x24x32x8xf32>, %arg1: memref<1x24x32x8xf32>, %arg2: memref<1x24x32x8xf32, #map>) {
    linalg.generic {indexing_maps = [#map1, #map1, #map1], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} ins(%arg0, %arg1 : memref<1x24x32x8xf32>, memref<1x24x32x8xf32>) outs(%arg2 : memref<1x24x32x8xf32, #map>) {
    ^bb0(%in: f32, %in_0: f32, %out: f32):
      %0 = arith.addf %in, %in_0 : f32
      linalg.yield %0 : f32
    }
    return
  }
}

// -----
module {
  func.func @linalg_copy(%arg0: tensor<1x2x3x4x5xf32, 1 : i64>, %arg1: tensor<1x2x3x4x5xf32, 3 : i64>) -> tensor<1x2x3x4x5xf32, 3 : i64> {
    %0 = linalg.copy ins(%arg0 : tensor<1x2x3x4x5xf32, 1 : i64>) outs(%arg1 : tensor<1x2x3x4x5xf32, 3 : i64>) -> tensor<1x2x3x4x5xf32, 3 : i64>
    return %0 : tensor<1x2x3x4x5xf32, 3 : i64>
  }
}

// -----
module {
  func.func private @memref_linalg_copy(%arg0: memref<1x24x32x8xf32, 1>, %arg1: memref<1x24x32x8xf32, 1>) {
    linalg.copy ins(%arg0 : memref<1x24x32x8xf32, 1>) outs(%arg1 : memref<1x24x32x8xf32, 1>)
    return
  }
}

