#map = affine_map<(d0) -> (d0)>
#sparse = #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>
module {
  func.func @cre(%arg0: tensor<?xcomplex<f32>, #sparse>) -> tensor<?xf32, #sparse> {
    %c0 = arith.constant 0 : index
    %dim = tensor.dim %arg0, %c0 : tensor<?xcomplex<f32>, #sparse>
    %0 = tensor.empty(%dim) : tensor<?xf32, #sparse>
    %1 = linalg.generic {doc = "x(i) = OP a(i)", indexing_maps = [#map, #map], iterator_types = ["parallel"]} ins(%arg0 : tensor<?xcomplex<f32>, #sparse>) outs(%0 : tensor<?xf32, #sparse>) {
    ^bb0(%in: complex<f32>, %out: f32):
      %2 = complex.re %in : complex<f32>
      linalg.yield %2 : f32
    } -> tensor<?xf32, #sparse>
    return %1 : tensor<?xf32, #sparse>
  }
  func.func @cim(%arg0: tensor<?xcomplex<f32>, #sparse>) -> tensor<?xf32, #sparse> {
    %c0 = arith.constant 0 : index
    %dim = tensor.dim %arg0, %c0 : tensor<?xcomplex<f32>, #sparse>
    %0 = tensor.empty(%dim) : tensor<?xf32, #sparse>
    %1 = linalg.generic {doc = "x(i) = OP a(i)", indexing_maps = [#map, #map], iterator_types = ["parallel"]} ins(%arg0 : tensor<?xcomplex<f32>, #sparse>) outs(%0 : tensor<?xf32, #sparse>) {
    ^bb0(%in: complex<f32>, %out: f32):
      %2 = complex.im %in : complex<f32>
      linalg.yield %2 : f32
    } -> tensor<?xf32, #sparse>
    return %1 : tensor<?xf32, #sparse>
  }
  func.func @main() {
    %cst = arith.constant sparse<[[0], [20], [31]], [(5.130000e+00,2.000000e+00), (3.000000e+00,4.000000e+00), (5.000000e+00,6.000000e+00)]> : tensor<32xcomplex<f32>>
    %0 = sparse_tensor.convert %cst : tensor<32xcomplex<f32>> to tensor<?xcomplex<f32>, #sparse>
    %1 = call @cre(%0) : (tensor<?xcomplex<f32>, #sparse>) -> tensor<?xf32, #sparse>
    %2 = call @cim(%0) : (tensor<?xcomplex<f32>, #sparse>) -> tensor<?xf32, #sparse>
    sparse_tensor.print %1 : tensor<?xf32, #sparse>
    sparse_tensor.print %2 : tensor<?xf32, #sparse>
    bufferization.dealloc_tensor %0 : tensor<?xcomplex<f32>, #sparse>
    bufferization.dealloc_tensor %1 : tensor<?xf32, #sparse>
    bufferization.dealloc_tensor %2 : tensor<?xf32, #sparse>
    return
  }
}

