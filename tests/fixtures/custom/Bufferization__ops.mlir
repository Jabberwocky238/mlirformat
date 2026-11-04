#map = affine_map<(d0) -> (d0 + 7)>
#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>
module {
  func.func @test_clone(%arg0: memref<*xf32>) -> memref<*xf32> {
    %0 = bufferization.clone %arg0 : memref<*xf32> to memref<*xf32>
    return %0 : memref<*xf32>
  }
  func.func @test_to_buffer(%arg0: tensor<?xi64>, %arg1: tensor<*xi64>) -> (memref<?xi64, #map>, memref<*xi64, 1>) {
    %0 = bufferization.to_buffer %arg0 : tensor<?xi64> to memref<?xi64, #map>
    %1 = bufferization.to_buffer %arg1 : tensor<*xi64> to memref<*xi64, 1>
    return %0, %1 : memref<?xi64, #map>, memref<*xi64, 1>
  }
  func.func @test_to_tensor(%arg0: memref<2xf32>) -> tensor<2xf32> {
    %0 = bufferization.to_tensor %arg0 restrict writable : memref<2xf32> to tensor<2xf32>
    return %0 : tensor<2xf32>
  }
  func.func @test_alloc_tensor_op(%arg0: tensor<?x5xf32>, %arg1: index) -> tensor<?x5xf32> {
    %0 = bufferization.alloc_tensor(%arg1) : tensor<?x5xf32>
    %1 = bufferization.alloc_tensor() copy(%arg0) : tensor<?x5xf32>
    %2 = bufferization.alloc_tensor() : tensor<5x6xf32>
    %3 = bufferization.alloc_tensor(%arg1, %arg1) : tensor<?x?xf32>
    %4 = bufferization.alloc_tensor() copy(%arg0) {escape = true} : tensor<?x5xf32>
    %5 = bufferization.alloc_tensor() copy(%arg0) {escape = false} : tensor<?x5xf32>
    %c100 = arith.constant 100 : index
    %6 = bufferization.alloc_tensor() size_hint=%c100 : tensor<100x100xf64, #sparse>
    %7 = bufferization.alloc_tensor(%arg1) {memory_space = "foo"} : tensor<?xf32>
    return %1 : tensor<?x5xf32>
  }
  func.func @test_dealloc_tensor_op(%arg0: tensor<4xi32>) {
    bufferization.dealloc_tensor %arg0 : tensor<4xi32>
    return
  }
  func.func @test_materialize_in_destination_op(%arg0: tensor<?xf32>, %arg1: tensor<?xf32>, %arg2: memref<?xf32, 3>, %arg3: tensor<5xf32>) -> tensor<?xf32> {
    %0 = bufferization.materialize_in_destination %arg0 in %arg1 : (tensor<?xf32>, tensor<?xf32>) -> tensor<?xf32>
    bufferization.materialize_in_destination %arg0 in restrict writable %arg2 : (tensor<?xf32>, memref<?xf32, 3>) -> ()
    %1 = bufferization.materialize_in_destination %arg0 in %arg3 : (tensor<?xf32>, tensor<5xf32>) -> tensor<5xf32>
    return %0 : tensor<?xf32>
  }
  func.func @test_dealloc_op(%arg0: memref<2xf32>, %arg1: memref<4xi32>, %arg2: i1, %arg3: i1, %arg4: memref<?xf32>, %arg5: memref<*xf64>) -> (i1, i1) {
    %0:2 = bufferization.dealloc (%arg0, %arg1 : memref<2xf32>, memref<4xi32>) if (%arg2, %arg3) retain (%arg4, %arg5 : memref<?xf32>, memref<*xf64>)
    bufferization.dealloc (%arg0 : memref<2xf32>) if (%arg2)
    bufferization.dealloc
    return %0#0, %0#1 : i1, i1
  }
  func.func @test_builtin_custom_builtin_type_conversion(%arg0: tensor<42xf32>) -> tensor<42xf32> {
    %0 = bufferization.to_buffer %arg0 : tensor<42xf32> to !test.test_memref<[42], f32>
    %1 = bufferization.to_tensor %0 : !test.test_memref<[42], f32> to tensor<42xf32>
    return %1 : tensor<42xf32>
  }
  func.func @test_custom_builtin_custom_type_conversion(%arg0: !test.test_tensor<[42], f32>) -> !test.test_tensor<[42], f32> {
    %0 = bufferization.to_buffer %arg0 : !test.test_tensor<[42], f32> to memref<42xf32>
    %1 = bufferization.to_tensor %0 : memref<42xf32> to !test.test_tensor<[42], f32>
    return %1 : !test.test_tensor<[42], f32>
  }
}

