#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 floordiv 3 : dense, d1 floordiv 4 : compressed, d0 mod 3 : dense, d1 mod 4 : dense) }>
#sparse1 = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 floordiv 3 : dense, d1 floordiv 4 : compressed, d1 mod 4 : dense, d0 mod 3 : dense) }>
#sparse2 = #sparse_tensor.encoding<{ map = (d0, d1) -> (d1 floordiv 4 : dense, d0 floordiv 3 : compressed, d0 mod 3 : dense, d1 mod 4 : dense) }>
#sparse3 = #sparse_tensor.encoding<{ map = (d0, d1) -> (d1 floordiv 4 : dense, d0 floordiv 3 : compressed, d1 mod 4 : dense, d0 mod 3 : dense) }>
module {
  func.func @foo1() {
    %c0 = arith.constant 0 : index
    %cst = arith.constant 0.000000e+00 : f64
    %cst_0 = arith.constant sparse<[[0, 0], [0, 1], [2, 3], [3, 8], [3, 9], [5, 10], [5, 11]], [1.000000e+00, 2.000000e+00, 3.000000e+00, 4.000000e+00, 5.000000e+00, 6.000000e+00, 7.000000e+00]> : tensor<6x16xf64>
    %0 = sparse_tensor.convert %cst_0 : tensor<6x16xf64> to tensor<?x?xf64, #sparse>
    sparse_tensor.print %0 : tensor<?x?xf64, #sparse>
    bufferization.dealloc_tensor %0 : tensor<?x?xf64, #sparse>
    return
  }
  func.func @foo2() {
    %c0 = arith.constant 0 : index
    %cst = arith.constant 0.000000e+00 : f64
    %cst_0 = arith.constant sparse<[[0, 0], [0, 1], [2, 3], [3, 8], [3, 9], [5, 10], [5, 11]], [1.000000e+00, 2.000000e+00, 3.000000e+00, 4.000000e+00, 5.000000e+00, 6.000000e+00, 7.000000e+00]> : tensor<6x16xf64>
    %0 = sparse_tensor.convert %cst_0 : tensor<6x16xf64> to tensor<?x?xf64, #sparse1>
    sparse_tensor.print %0 : tensor<?x?xf64, #sparse1>
    bufferization.dealloc_tensor %0 : tensor<?x?xf64, #sparse1>
    return
  }
  func.func @foo3() {
    %c0 = arith.constant 0 : index
    %cst = arith.constant 0.000000e+00 : f64
    %cst_0 = arith.constant sparse<[[0, 0], [0, 1], [2, 3], [3, 8], [3, 9], [5, 10], [5, 11]], [1.000000e+00, 2.000000e+00, 3.000000e+00, 4.000000e+00, 5.000000e+00, 6.000000e+00, 7.000000e+00]> : tensor<6x16xf64>
    %0 = sparse_tensor.convert %cst_0 : tensor<6x16xf64> to tensor<?x?xf64, #sparse2>
    sparse_tensor.print %0 : tensor<?x?xf64, #sparse2>
    bufferization.dealloc_tensor %0 : tensor<?x?xf64, #sparse2>
    return
  }
  func.func @foo4() {
    %c0 = arith.constant 0 : index
    %cst = arith.constant 0.000000e+00 : f64
    %cst_0 = arith.constant sparse<[[0, 0], [0, 1], [2, 3], [3, 8], [3, 9], [5, 10], [5, 11]], [1.000000e+00, 2.000000e+00, 3.000000e+00, 4.000000e+00, 5.000000e+00, 6.000000e+00, 7.000000e+00]> : tensor<6x16xf64>
    %0 = sparse_tensor.convert %cst_0 : tensor<6x16xf64> to tensor<?x?xf64, #sparse3>
    sparse_tensor.print %0 : tensor<?x?xf64, #sparse3>
    bufferization.dealloc_tensor %0 : tensor<?x?xf64, #sparse3>
    return
  }
  func.func @main() {
    call @foo1() : () -> ()
    call @foo2() : () -> ()
    call @foo3() : () -> ()
    call @foo4() : () -> ()
    return
  }
}

