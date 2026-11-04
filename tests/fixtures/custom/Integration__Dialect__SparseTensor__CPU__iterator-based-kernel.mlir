#map = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2, d3)>
#map1 = affine_map<(d0, d1, d2, d3) -> ()>
#map2 = affine_map<(d0) -> (d0)>
#sparse = #sparse_tensor.encoding<{ map = (d0, d1, d2, d3) -> (d0 : compressed(nonunique), d1 : singleton(nonunique, soa), d2 : singleton(nonunique, soa), d3 : singleton(soa)), explicitVal = 1 : i32 }>
#sparse1 = #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>
module {
  func.func @sqsum(%arg0: tensor<2x3x4x5xi32, #sparse>) -> tensor<i32> {
    %cst = arith.constant dense<0> : tensor<i32>
    %0 = linalg.generic {indexing_maps = [#map, #map1], iterator_types = ["reduction", "reduction", "reduction", "reduction"]} ins(%arg0 : tensor<2x3x4x5xi32, #sparse>) outs(%cst : tensor<i32>) {
    ^bb0(%in: i32, %out: i32):
      %1 = arith.muli %in, %in : i32
      %2 = arith.addi %out, %1 : i32
      linalg.yield %2 : i32
    } -> tensor<i32>
    return %0 : tensor<i32>
  }
  func.func @vec_add(%arg0: tensor<4xi32, #sparse1>, %arg1: tensor<4xi32, #sparse1>) -> tensor<4xi32> {
    %cst = arith.constant dense<0> : tensor<4xi32>
    %0 = linalg.generic {indexing_maps = [#map2, #map2, #map2], iterator_types = ["parallel"]} ins(%arg0, %arg1 : tensor<4xi32, #sparse1>, tensor<4xi32, #sparse1>) outs(%cst : tensor<4xi32>) {
    ^bb0(%in: i32, %in_0: i32, %out: i32):
      %1 = arith.addi %in, %in_0 : i32
      linalg.yield %1 : i32
    } -> tensor<4xi32>
    return %0 : tensor<4xi32>
  }
  func.func @main() {
    %c0 = arith.constant 0 : index
    %c0_i32 = arith.constant 0 : i32
    %cst = arith.constant sparse<[[0, 1, 2, 3], [1, 1, 2, 3], [1, 2, 2, 3], [1, 2, 3, 4]], 1> : tensor<2x3x4x5xi32>
    %cst_0 = arith.constant dense<[0, 1, 2, 3]> : tensor<4xi32>
    %cst_1 = arith.constant dense<[1, 0, 3, 0]> : tensor<4xi32>
    %0 = sparse_tensor.convert %cst : tensor<2x3x4x5xi32> to tensor<2x3x4x5xi32, #sparse>
    %1 = call @sqsum(%0) : (tensor<2x3x4x5xi32, #sparse>) -> tensor<i32>
    %extracted = tensor.extract %1[] : tensor<i32>
    %2 = sparse_tensor.convert %cst_0 : tensor<4xi32> to tensor<4xi32, #sparse1>
    %3 = sparse_tensor.convert %cst_1 : tensor<4xi32> to tensor<4xi32, #sparse1>
    %4 = call @vec_add(%2, %3) : (tensor<4xi32, #sparse1>, tensor<4xi32, #sparse1>) -> tensor<4xi32>
    vector.print %extracted : i32
    %5 = vector.transfer_read %4[%c0], %c0_i32 : tensor<4xi32>, vector<4xi32>
    vector.print %5 : vector<4xi32>
    bufferization.dealloc_tensor %0 : tensor<2x3x4x5xi32, #sparse>
    bufferization.dealloc_tensor %1 : tensor<i32>
    bufferization.dealloc_tensor %2 : tensor<4xi32, #sparse1>
    bufferization.dealloc_tensor %3 : tensor<4xi32, #sparse1>
    bufferization.dealloc_tensor %4 : tensor<4xi32>
    return
  }
}

