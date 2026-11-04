#sparse = #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d1 : compressed, d2 : compressed, d0 : dense) }>
#sparse1 = #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d0 floordiv 2 : compressed, d1 floordiv 2 : compressed, d2 floordiv 2 : compressed, d0 mod 2 : dense, d1 mod 2 : dense, d2 mod 2 : dense) }>
module {
  func.func @main() {
    %c0 = arith.constant 0 : index
    %c0_i32 = arith.constant 0 : i32
    %cst = arith.constant dense<[[[1, 0, 0, 0], [0, 0, 0, 0], [0, 0, 0, 0], [0, 0, 5, 0]], [[2, 0, 0, 0], [0, 0, 0, 0], [0, 0, 0, 0], [0, 0, 6, 0]], [[3, 0, 0, 0], [0, 0, 0, 0], [0, 0, 0, 0], [0, 0, 7, 0]], [[4, 0, 0, 0], [0, 0, 0, 0], [0, 0, 0, 0], [0, 0, 8, 0]]]> : tensor<4x4x4xi32>
    %0 = sparse_tensor.convert %cst : tensor<4x4x4xi32> to tensor<4x4x4xi32, #sparse>
    %1 = sparse_tensor.convert %cst : tensor<4x4x4xi32> to tensor<4x4x4xi32, #sparse1>
    sparse_tensor.print %0 : tensor<4x4x4xi32, #sparse>
    sparse_tensor.print %1 : tensor<4x4x4xi32, #sparse1>
    bufferization.dealloc_tensor %0 : tensor<4x4x4xi32, #sparse>
    bufferization.dealloc_tensor %1 : tensor<4x4x4xi32, #sparse1>
    return
  }
}

