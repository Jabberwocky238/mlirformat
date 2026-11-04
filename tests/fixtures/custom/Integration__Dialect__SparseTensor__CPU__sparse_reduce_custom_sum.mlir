#map = affine_map<(d0) -> (d0)>
#map1 = affine_map<(d0) -> ()>
#sparse = #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>
module {
  func.func @red0(%arg0: tensor<8xi32, #sparse>, %arg1: tensor<i32>) -> tensor<i32> {
    %c1_i32 = arith.constant 1 : i32
    %0 = linalg.generic {doc = "x += SUM_CUSTOM_i UNARY a(i)", indexing_maps = [#map, #map1], iterator_types = ["reduction"]} ins(%arg0 : tensor<8xi32, #sparse>) outs(%arg1 : tensor<i32>) {
    ^bb0(%in: i32, %out: i32):
      %1 = sparse_tensor.unary %in : i32 to i32
       present = {
      }
       absent = {
      }
      %2 = sparse_tensor.reduce %1, %out, %c1_i32 : i32 {
      ^bb0(%arg2: i32, %arg3: i32):
        %3 = arith.addi %arg2, %arg3 : i32
        sparse_tensor.yield %3 : i32
      }
      linalg.yield %2 : i32
    } -> tensor<i32>
    return %0 : tensor<i32>
  }
  func.func @red1(%arg0: tensor<8xi32, #sparse>, %arg1: tensor<i32>) -> tensor<i32> {
    %c1_i32 = arith.constant 1 : i32
    %c2_i32 = arith.constant 2 : i32
    %0 = linalg.generic {doc = "x += SUM_CUSTOM_i UNARY a(i)", indexing_maps = [#map, #map1], iterator_types = ["reduction"]} ins(%arg0 : tensor<8xi32, #sparse>) outs(%arg1 : tensor<i32>) {
    ^bb0(%in: i32, %out: i32):
      %1 = sparse_tensor.unary %in : i32 to i32
       present = {
      ^bb0(%arg2: i32):
        sparse_tensor.yield %c2_i32 : i32
      }
       absent = {
      }
      %2 = sparse_tensor.reduce %1, %out, %c1_i32 : i32 {
      ^bb0(%arg2: i32, %arg3: i32):
        %3 = arith.addi %arg2, %arg3 : i32
        sparse_tensor.yield %3 : i32
      }
      linalg.yield %2 : i32
    } -> tensor<i32>
    return %0 : tensor<i32>
  }
  func.func @red2(%arg0: tensor<8xi32, #sparse>, %arg1: tensor<i32>) -> tensor<i32> {
    %c1_i32 = arith.constant 1 : i32
    %c3_i32 = arith.constant 3 : i32
    %0 = linalg.generic {doc = "x += SUM_CUSTOM_i UNARY a(i)", indexing_maps = [#map, #map1], iterator_types = ["reduction"]} ins(%arg0 : tensor<8xi32, #sparse>) outs(%arg1 : tensor<i32>) {
    ^bb0(%in: i32, %out: i32):
      %1 = sparse_tensor.unary %in : i32 to i32
       present = {
      }
       absent = {
        sparse_tensor.yield %c3_i32 : i32
      }
      %2 = sparse_tensor.reduce %1, %out, %c1_i32 : i32 {
      ^bb0(%arg2: i32, %arg3: i32):
        %3 = arith.addi %arg2, %arg3 : i32
        sparse_tensor.yield %3 : i32
      }
      linalg.yield %2 : i32
    } -> tensor<i32>
    return %0 : tensor<i32>
  }
  func.func @red3(%arg0: tensor<8xi32, #sparse>, %arg1: tensor<i32>) -> tensor<i32> {
    %c1_i32 = arith.constant 1 : i32
    %c2_i32 = arith.constant 2 : i32
    %c3_i32 = arith.constant 3 : i32
    %0 = linalg.generic {doc = "x += SUM_CUSTOM_i UNARY a(i)", indexing_maps = [#map, #map1], iterator_types = ["reduction"]} ins(%arg0 : tensor<8xi32, #sparse>) outs(%arg1 : tensor<i32>) {
    ^bb0(%in: i32, %out: i32):
      %1 = sparse_tensor.unary %in : i32 to i32
       present = {
      ^bb0(%arg2: i32):
        sparse_tensor.yield %c2_i32 : i32
      }
       absent = {
        sparse_tensor.yield %c3_i32 : i32
      }
      %2 = sparse_tensor.reduce %1, %out, %c1_i32 : i32 {
      ^bb0(%arg2: i32, %arg3: i32):
        %3 = arith.addi %arg2, %arg3 : i32
        sparse_tensor.yield %3 : i32
      }
      linalg.yield %2 : i32
    } -> tensor<i32>
    return %0 : tensor<i32>
  }
  func.func @dump_i32(%arg0: tensor<i32>) {
    %extracted = tensor.extract %arg0[] : tensor<i32>
    vector.print %extracted : i32
    return
  }
  func.func @main() {
    %cst = arith.constant dense<0> : tensor<i32>
    %cst_0 = arith.constant sparse<[[4], [6]], [99, 999]> : tensor<8xi32>
    %0 = sparse_tensor.convert %cst_0 : tensor<8xi32> to tensor<8xi32, #sparse>
    %1 = call @red0(%0, %cst) : (tensor<8xi32, #sparse>, tensor<i32>) -> tensor<i32>
    %2 = call @red1(%0, %cst) : (tensor<8xi32, #sparse>, tensor<i32>) -> tensor<i32>
    %3 = call @red2(%0, %cst) : (tensor<8xi32, #sparse>, tensor<i32>) -> tensor<i32>
    %4 = call @red3(%0, %cst) : (tensor<8xi32, #sparse>, tensor<i32>) -> tensor<i32>
    call @dump_i32(%1) : (tensor<i32>) -> ()
    call @dump_i32(%2) : (tensor<i32>) -> ()
    call @dump_i32(%3) : (tensor<i32>) -> ()
    call @dump_i32(%4) : (tensor<i32>) -> ()
    bufferization.dealloc_tensor %0 : tensor<8xi32, #sparse>
    bufferization.dealloc_tensor %1 : tensor<i32>
    bufferization.dealloc_tensor %2 : tensor<i32>
    bufferization.dealloc_tensor %3 : tensor<i32>
    bufferization.dealloc_tensor %4 : tensor<i32>
    return
  }
}

