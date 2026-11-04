#map = affine_map<(d0) -> (d0)>
#map1 = affine_map<(d0) -> ()>
#sparse = #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>
module {
  func.func @min1(%arg0: tensor<32xi32, #sparse>, %arg1: tensor<i32>) -> tensor<i32> {
    %extracted = tensor.extract %arg1[] : tensor<i32>
    %0 = linalg.generic {doc = "x += MIN_i a(i)", indexing_maps = [#map, #map1], iterator_types = ["reduction"]} ins(%arg0 : tensor<32xi32, #sparse>) outs(%arg1 : tensor<i32>) {
    ^bb0(%in: i32, %out: i32):
      %1 = sparse_tensor.reduce %in, %out, %extracted : i32 {
      ^bb0(%arg2: i32, %arg3: i32):
        %2 = arith.minsi %arg2, %arg3 : i32
        sparse_tensor.yield %2 : i32
      }
      linalg.yield %1 : i32
    } -> tensor<i32>
    return %0 : tensor<i32>
  }
  func.func @min2(%arg0: tensor<32xi32, #sparse>, %arg1: tensor<i32>) -> tensor<i32> {
    %extracted = tensor.extract %arg1[] : tensor<i32>
    %0 = linalg.generic {doc = "x += MIN_i a(i)", indexing_maps = [#map, #map1], iterator_types = ["reduction"]} ins(%arg0 : tensor<32xi32, #sparse>) outs(%arg1 : tensor<i32>) {
    ^bb0(%in: i32, %out: i32):
      %1 = arith.minsi %in, %out : i32
      linalg.yield %1 : i32
    } -> tensor<i32>
    return %0 : tensor<i32>
  }
  func.func @dump_i32(%arg0: tensor<i32>) {
    %extracted = tensor.extract %arg0[] : tensor<i32>
    vector.print %extracted : i32
    return
  }
  func.func @main() {
    %cst = arith.constant dense<999> : tensor<i32>
    %cst_0 = arith.constant dense<[2, 2, 7, 2, 2, 2, 2, 2, 0, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 3, 0, 9, 2, 2, 2, 2, 0, 5, 1, 7, 3]> : tensor<32xi32>
    %cst_1 = arith.constant dense<[2, 2, 7, 2, 2, 2, 2, 2, 2, 2, 2, 4, 2, 2, 2, 2, 2, 2, 2, 2, 3, 2, 7, 2, 2, 2, 2, 2, 2, 1, 7, 3]> : tensor<32xi32>
    %0 = sparse_tensor.convert %cst_0 : tensor<32xi32> to tensor<32xi32, #sparse>
    %1 = sparse_tensor.convert %cst_1 : tensor<32xi32> to tensor<32xi32, #sparse>
    %cst_2 = arith.constant sparse<[[1], [7]], [0, 22]> : tensor<32xi32>
    %2 = sparse_tensor.convert %cst_2 : tensor<32xi32> to tensor<32xi32, #sparse>
    %3 = call @min1(%0, %cst) : (tensor<32xi32, #sparse>, tensor<i32>) -> tensor<i32>
    %4 = call @min1(%1, %cst) : (tensor<32xi32, #sparse>, tensor<i32>) -> tensor<i32>
    %5 = call @min1(%2, %cst) : (tensor<32xi32, #sparse>, tensor<i32>) -> tensor<i32>
    %6 = call @min2(%0, %cst) : (tensor<32xi32, #sparse>, tensor<i32>) -> tensor<i32>
    %7 = call @min2(%1, %cst) : (tensor<32xi32, #sparse>, tensor<i32>) -> tensor<i32>
    %8 = call @min2(%2, %cst) : (tensor<32xi32, #sparse>, tensor<i32>) -> tensor<i32>
    call @dump_i32(%3) : (tensor<i32>) -> ()
    call @dump_i32(%4) : (tensor<i32>) -> ()
    call @dump_i32(%5) : (tensor<i32>) -> ()
    call @dump_i32(%6) : (tensor<i32>) -> ()
    call @dump_i32(%7) : (tensor<i32>) -> ()
    call @dump_i32(%8) : (tensor<i32>) -> ()
    bufferization.dealloc_tensor %0 : tensor<32xi32, #sparse>
    bufferization.dealloc_tensor %1 : tensor<32xi32, #sparse>
    bufferization.dealloc_tensor %2 : tensor<32xi32, #sparse>
    bufferization.dealloc_tensor %3 : tensor<i32>
    bufferization.dealloc_tensor %4 : tensor<i32>
    bufferization.dealloc_tensor %5 : tensor<i32>
    bufferization.dealloc_tensor %6 : tensor<i32>
    bufferization.dealloc_tensor %7 : tensor<i32>
    bufferization.dealloc_tensor %8 : tensor<i32>
    return
  }
}

