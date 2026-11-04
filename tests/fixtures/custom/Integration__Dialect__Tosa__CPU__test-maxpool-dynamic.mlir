module {
  func.func private @printMemrefF32(memref<*xf32>) attributes {llvm.emit_c_interface}
  func.func @max_pool_static(%arg0: tensor<1x4x4x1xf32>) -> tensor<1x4x4x1xf32> {
    %0 = tosa.max_pool2d %arg0 {kernel = array<i64: 3, 3>, pad = array<i64: 1, 1, 1, 1>, stride = array<i64: 1, 1>} : (tensor<1x4x4x1xf32>) -> tensor<1x4x4x1xf32>
    return %0 : tensor<1x4x4x1xf32>
  }
  func.func @max_pool_dynamic(%arg0: tensor<?x?x?x?xf32>) -> tensor<?x?x?x?xf32> {
    %0 = tosa.max_pool2d %arg0 {kernel = array<i64: 3, 3>, pad = array<i64: 1, 1, 1, 1>, stride = array<i64: 1, 1>} : (tensor<?x?x?x?xf32>) -> tensor<?x?x?x?xf32>
    return %0 : tensor<?x?x?x?xf32>
  }
  func.func @main() {
    %cst = arith.constant dense<[[[[0.000000e+00], [1.000000e-01], [2.000000e-01], [3.000000e-01]], [[1.000000e+00], [1.100000e+00], [1.200000e+00], [1.300000e+00]], [[2.000000e+00], [2.100000e+00], [2.200000e+00], [2.300000e+00]], [[3.000000e+00], [3.100000e+00], [3.200000e+00], [3.300000e+00]]]]> : tensor<1x4x4x1xf32>
    %cast = tensor.cast %cst : tensor<1x4x4x1xf32> to tensor<?x?x?x?xf32>
    %0 = call @max_pool_static(%cst) : (tensor<1x4x4x1xf32>) -> tensor<1x4x4x1xf32>
    %1 = call @max_pool_dynamic(%cast) : (tensor<?x?x?x?xf32>) -> tensor<?x?x?x?xf32>
    %2 = bufferization.to_buffer %0 : tensor<1x4x4x1xf32> to memref<1x4x4x1xf32>
    %cast_0 = memref.cast %2 : memref<1x4x4x1xf32> to memref<*xf32>
    call @printMemrefF32(%cast_0) : (memref<*xf32>) -> ()
    %3 = bufferization.to_buffer %1 : tensor<?x?x?x?xf32> to memref<?x?x?x?xf32>
    %cast_1 = memref.cast %3 : memref<?x?x?x?xf32> to memref<*xf32>
    call @printMemrefF32(%cast_1) : (memref<*xf32>) -> ()
    return
  }
}

