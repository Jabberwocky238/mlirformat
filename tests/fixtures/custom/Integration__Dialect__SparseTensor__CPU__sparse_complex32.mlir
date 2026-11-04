#map = affine_map<(d0) -> (d0)>
#sparse = #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>
module {
  func.func @cadd(%arg0: tensor<?xcomplex<f32>, #sparse>, %arg1: tensor<?xcomplex<f32>, #sparse>) -> tensor<?xcomplex<f32>, #sparse> {
    %c0 = arith.constant 0 : index
    %dim = tensor.dim %arg0, %c0 : tensor<?xcomplex<f32>, #sparse>
    %0 = tensor.empty(%dim) : tensor<?xcomplex<f32>, #sparse>
    %1 = linalg.generic {doc = "x(i) = a(i) OP b(i)", indexing_maps = [#map, #map, #map], iterator_types = ["parallel"]} ins(%arg0, %arg1 : tensor<?xcomplex<f32>, #sparse>, tensor<?xcomplex<f32>, #sparse>) outs(%0 : tensor<?xcomplex<f32>, #sparse>) {
    ^bb0(%in: complex<f32>, %in_0: complex<f32>, %out: complex<f32>):
      %2 = complex.add %in, %in_0 : complex<f32>
      linalg.yield %2 : complex<f32>
    } -> tensor<?xcomplex<f32>, #sparse>
    return %1 : tensor<?xcomplex<f32>, #sparse>
  }
  func.func @cmul(%arg0: tensor<?xcomplex<f32>, #sparse>, %arg1: tensor<?xcomplex<f32>, #sparse>) -> tensor<?xcomplex<f32>, #sparse> {
    %c0 = arith.constant 0 : index
    %dim = tensor.dim %arg0, %c0 : tensor<?xcomplex<f32>, #sparse>
    %0 = tensor.empty(%dim) : tensor<?xcomplex<f32>, #sparse>
    %1 = linalg.generic {doc = "x(i) = a(i) OP b(i)", indexing_maps = [#map, #map, #map], iterator_types = ["parallel"]} ins(%arg0, %arg1 : tensor<?xcomplex<f32>, #sparse>, tensor<?xcomplex<f32>, #sparse>) outs(%0 : tensor<?xcomplex<f32>, #sparse>) {
    ^bb0(%in: complex<f32>, %in_0: complex<f32>, %out: complex<f32>):
      %2 = complex.mul %in, %in_0 : complex<f32>
      linalg.yield %2 : complex<f32>
    } -> tensor<?xcomplex<f32>, #sparse>
    return %1 : tensor<?xcomplex<f32>, #sparse>
  }
  func.func @main() {
    %cst = arith.constant sparse<[[0], [28], [31]], [(5.111300e+02,2.000000e+00), (3.000000e+00,4.000000e+00), (5.000000e+00,6.000000e+00)]> : tensor<32xcomplex<f32>>
    %cst_0 = arith.constant sparse<[[1], [28], [31]], [(1.000000e+00,0.000000e+00), (2.000000e+00,0.000000e+00), (3.000000e+00,0.000000e+00)]> : tensor<32xcomplex<f32>>
    %0 = sparse_tensor.convert %cst : tensor<32xcomplex<f32>> to tensor<?xcomplex<f32>, #sparse>
    %1 = sparse_tensor.convert %cst_0 : tensor<32xcomplex<f32>> to tensor<?xcomplex<f32>, #sparse>
    %2 = call @cadd(%0, %1) : (tensor<?xcomplex<f32>, #sparse>, tensor<?xcomplex<f32>, #sparse>) -> tensor<?xcomplex<f32>, #sparse>
    %3 = call @cmul(%0, %1) : (tensor<?xcomplex<f32>, #sparse>, tensor<?xcomplex<f32>, #sparse>) -> tensor<?xcomplex<f32>, #sparse>
    sparse_tensor.print %2 : tensor<?xcomplex<f32>, #sparse>
    sparse_tensor.print %3 : tensor<?xcomplex<f32>, #sparse>
    bufferization.dealloc_tensor %0 : tensor<?xcomplex<f32>, #sparse>
    bufferization.dealloc_tensor %1 : tensor<?xcomplex<f32>, #sparse>
    bufferization.dealloc_tensor %2 : tensor<?xcomplex<f32>, #sparse>
    bufferization.dealloc_tensor %3 : tensor<?xcomplex<f32>, #sparse>
    return
  }
}

