#map = affine_map<(d0) -> (d0)>
#map1 = affine_map<(d0, d1) -> (d0, d1)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d2)>
#map3 = affine_map<(d0, d1, d2) -> (d2, d1)>
#map4 = affine_map<(d0, d1, d2) -> (d0, d1)>
#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>
#sparse1 = #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>
#sparse2 = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed), posWidth = 64, crdWidth = 64 }>
module {
  func.func @bufferization_alloc_tensor() -> tensor<20x40xf32, #sparse> {
    %0 = bufferization.alloc_tensor() : tensor<20x40xf32, #sparse>
    %1 = sparse_tensor.load %0 : tensor<20x40xf32, #sparse>
    return %1 : tensor<20x40xf32, #sparse>
  }
  func.func @sparse_tensor_new(%arg0: !llvm.ptr) -> tensor<20x40xf32, #sparse> {
    %0 = sparse_tensor.new %arg0 : !llvm.ptr to tensor<20x40xf32, #sparse>
    return %0 : tensor<20x40xf32, #sparse>
  }
  func.func @sparse_tensor_new_from_tensor(%arg0: tensor<20x40xf32>) -> tensor<20x40xf32, #sparse> {
    %0 = sparse_tensor.new %arg0 : tensor<20x40xf32> to tensor<20x40xf32, #sparse>
    return %0 : tensor<20x40xf32, #sparse>
  }
  func.func @sparse_tensor_convert() -> tensor<20x40xf32> {
    %0 = bufferization.alloc_tensor() : tensor<20x40xf32, #sparse>
    %1 = sparse_tensor.load %0 : tensor<20x40xf32, #sparse>
    %2 = sparse_tensor.convert %1 : tensor<20x40xf32, #sparse> to tensor<20x40xf32>
    return %2 : tensor<20x40xf32>
  }
  func.func @update_notinplace(%arg0: tensor<10xf32>, %arg1: tensor<10xf32, #sparse1>) -> (tensor<10xf32>, tensor<10xf32>) {
    %0 = linalg.generic {indexing_maps = [#map, #map], iterator_types = ["parallel"]} ins(%arg1 : tensor<10xf32, #sparse1>) outs(%arg0 : tensor<10xf32>) {
    ^bb0(%in: f32, %out: f32):
      %1 = arith.addf %in, %out : f32
      linalg.yield %1 : f32
    } -> tensor<10xf32>
    return %0, %arg0 : tensor<10xf32>, tensor<10xf32>
  }
  func.func @sparse_non_elementwise(%arg0: tensor<64x64xf32, #sparse2>, %arg1: tensor<64x64xf32>, %arg2: tensor<64x64xf32>) -> tensor<64x64xf32> {
    %cst = arith.constant 0.000000e+00 : f32
    %0 = bufferization.alloc_tensor() : tensor<64x64xf32>
    %1 = linalg.generic {indexing_maps = [#map1], iterator_types = ["parallel", "parallel"]} outs(%0 : tensor<64x64xf32>) {
    ^bb0(%out: f32):
      linalg.yield %cst : f32
    } -> tensor<64x64xf32>
    %2 = linalg.generic {indexing_maps = [#map2, #map3, #map4], iterator_types = ["parallel", "parallel", "reduction"]} ins(%arg2, %arg2 : tensor<64x64xf32>, tensor<64x64xf32>) outs(%1 : tensor<64x64xf32>) {
    ^bb0(%in: f32, %in_0: f32, %out: f32):
      %4 = arith.mulf %in, %in_0 : f32
      %5 = arith.addf %out, %4 : f32
      linalg.yield %5 : f32
    } -> tensor<64x64xf32>
    %3 = linalg.generic {indexing_maps = [#map1, #map1, #map1], iterator_types = ["parallel", "parallel"]} ins(%arg0, %2 : tensor<64x64xf32, #sparse2>, tensor<64x64xf32>) outs(%0 : tensor<64x64xf32>) attrs =  {sorted = true} {
    ^bb0(%in: f32, %in_0: f32, %out: f32):
      %4 = arith.mulf %in, %in_0 : f32
      linalg.yield %4 : f32
    } -> tensor<64x64xf32>
    return %3 : tensor<64x64xf32>
  }
}

