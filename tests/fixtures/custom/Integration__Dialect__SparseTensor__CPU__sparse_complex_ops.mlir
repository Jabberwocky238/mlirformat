#map = affine_map<(d0) -> (d0)>
#sparse = #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>
module {
  func.func @cops(%arg0: tensor<?xcomplex<f64>, #sparse>, %arg1: tensor<?xcomplex<f64>, #sparse>) -> tensor<?xcomplex<f64>, #sparse> {
    %c0 = arith.constant 0 : index
    %dim = tensor.dim %arg0, %c0 : tensor<?xcomplex<f64>, #sparse>
    %0 = tensor.empty(%dim) : tensor<?xcomplex<f64>, #sparse>
    %1 = linalg.generic {doc = "x(i) = a(i) OP b(i)", indexing_maps = [#map, #map, #map], iterator_types = ["parallel"]} ins(%arg0, %arg1 : tensor<?xcomplex<f64>, #sparse>, tensor<?xcomplex<f64>, #sparse>) outs(%0 : tensor<?xcomplex<f64>, #sparse>) {
    ^bb0(%in: complex<f64>, %in_0: complex<f64>, %out: complex<f64>):
      %2 = complex.neg %in_0 : complex<f64>
      %3 = complex.sub %in, %2 : complex<f64>
      linalg.yield %3 : complex<f64>
    } -> tensor<?xcomplex<f64>, #sparse>
    return %1 : tensor<?xcomplex<f64>, #sparse>
  }
  func.func @csin(%arg0: tensor<?xcomplex<f64>, #sparse>) -> tensor<?xcomplex<f64>, #sparse> {
    %c0 = arith.constant 0 : index
    %dim = tensor.dim %arg0, %c0 : tensor<?xcomplex<f64>, #sparse>
    %0 = tensor.empty(%dim) : tensor<?xcomplex<f64>, #sparse>
    %1 = linalg.generic {doc = "x(i) = OP a(i)", indexing_maps = [#map, #map], iterator_types = ["parallel"]} ins(%arg0 : tensor<?xcomplex<f64>, #sparse>) outs(%0 : tensor<?xcomplex<f64>, #sparse>) {
    ^bb0(%in: complex<f64>, %out: complex<f64>):
      %2 = complex.sin %in : complex<f64>
      linalg.yield %2 : complex<f64>
    } -> tensor<?xcomplex<f64>, #sparse>
    return %1 : tensor<?xcomplex<f64>, #sparse>
  }
  func.func @complex_sqrt(%arg0: tensor<?xcomplex<f64>, #sparse>) -> tensor<?xcomplex<f64>, #sparse> {
    %c0 = arith.constant 0 : index
    %dim = tensor.dim %arg0, %c0 : tensor<?xcomplex<f64>, #sparse>
    %0 = tensor.empty(%dim) : tensor<?xcomplex<f64>, #sparse>
    %1 = linalg.generic {doc = "x(i) = OP a(i)", indexing_maps = [#map, #map], iterator_types = ["parallel"]} ins(%arg0 : tensor<?xcomplex<f64>, #sparse>) outs(%0 : tensor<?xcomplex<f64>, #sparse>) {
    ^bb0(%in: complex<f64>, %out: complex<f64>):
      %2 = complex.sqrt %in : complex<f64>
      linalg.yield %2 : complex<f64>
    } -> tensor<?xcomplex<f64>, #sparse>
    return %1 : tensor<?xcomplex<f64>, #sparse>
  }
  func.func @complex_tanh(%arg0: tensor<?xcomplex<f64>, #sparse>) -> tensor<?xcomplex<f64>, #sparse> {
    %c0 = arith.constant 0 : index
    %dim = tensor.dim %arg0, %c0 : tensor<?xcomplex<f64>, #sparse>
    %0 = tensor.empty(%dim) : tensor<?xcomplex<f64>, #sparse>
    %1 = linalg.generic {doc = "x(i) = OP a(i)", indexing_maps = [#map, #map], iterator_types = ["parallel"]} ins(%arg0 : tensor<?xcomplex<f64>, #sparse>) outs(%0 : tensor<?xcomplex<f64>, #sparse>) {
    ^bb0(%in: complex<f64>, %out: complex<f64>):
      %2 = complex.tanh %in : complex<f64>
      linalg.yield %2 : complex<f64>
    } -> tensor<?xcomplex<f64>, #sparse>
    return %1 : tensor<?xcomplex<f64>, #sparse>
  }
  func.func @clog1p_expm1(%arg0: tensor<?xcomplex<f64>, #sparse>) -> tensor<?xcomplex<f64>, #sparse> {
    %c0 = arith.constant 0 : index
    %dim = tensor.dim %arg0, %c0 : tensor<?xcomplex<f64>, #sparse>
    %0 = tensor.empty(%dim) : tensor<?xcomplex<f64>, #sparse>
    %1 = linalg.generic {doc = "x(i) = OP a(i)", indexing_maps = [#map, #map], iterator_types = ["parallel"]} ins(%arg0 : tensor<?xcomplex<f64>, #sparse>) outs(%0 : tensor<?xcomplex<f64>, #sparse>) {
    ^bb0(%in: complex<f64>, %out: complex<f64>):
      %2 = complex.log1p %in : complex<f64>
      %3 = complex.expm1 %2 : complex<f64>
      linalg.yield %3 : complex<f64>
    } -> tensor<?xcomplex<f64>, #sparse>
    return %1 : tensor<?xcomplex<f64>, #sparse>
  }
  func.func @cdiv(%arg0: tensor<?xcomplex<f64>, #sparse>) -> tensor<?xcomplex<f64>, #sparse> {
    %c0 = arith.constant 0 : index
    %dim = tensor.dim %arg0, %c0 : tensor<?xcomplex<f64>, #sparse>
    %0 = tensor.empty(%dim) : tensor<?xcomplex<f64>, #sparse>
    %cst = complex.constant [2.000000e+00, 0.000000e+00] : complex<f64>
    %1 = linalg.generic {doc = "x(i) = OP a(i)", indexing_maps = [#map, #map], iterator_types = ["parallel"]} ins(%arg0 : tensor<?xcomplex<f64>, #sparse>) outs(%0 : tensor<?xcomplex<f64>, #sparse>) {
    ^bb0(%in: complex<f64>, %out: complex<f64>):
      %2 = complex.div %in, %cst : complex<f64>
      linalg.yield %2 : complex<f64>
    } -> tensor<?xcomplex<f64>, #sparse>
    return %1 : tensor<?xcomplex<f64>, #sparse>
  }
  func.func @cabs(%arg0: tensor<?xcomplex<f64>, #sparse>) -> tensor<?xf64, #sparse> {
    %c0 = arith.constant 0 : index
    %dim = tensor.dim %arg0, %c0 : tensor<?xcomplex<f64>, #sparse>
    %0 = tensor.empty(%dim) : tensor<?xf64, #sparse>
    %1 = linalg.generic {doc = "x(i) = OP a(i)", indexing_maps = [#map, #map], iterator_types = ["parallel"]} ins(%arg0 : tensor<?xcomplex<f64>, #sparse>) outs(%0 : tensor<?xf64, #sparse>) {
    ^bb0(%in: complex<f64>, %out: f64):
      %2 = complex.abs %in : complex<f64>
      linalg.yield %2 : f64
    } -> tensor<?xf64, #sparse>
    return %1 : tensor<?xf64, #sparse>
  }
  func.func @main() {
    %cst = arith.constant sparse<[[0], [28], [31]], [(-5.130000e+00,2.000000e+00), (3.000000e+00,4.000000e+00), (5.000000e+00,6.000000e+00)]> : tensor<32xcomplex<f64>>
    %cst_0 = arith.constant sparse<[[1], [28], [31]], [(1.000000e+00,0.000000e+00), (-2.000000e+00,0.000000e+00), (3.000000e+00,0.000000e+00)]> : tensor<32xcomplex<f64>>
    %0 = sparse_tensor.convert %cst : tensor<32xcomplex<f64>> to tensor<?xcomplex<f64>, #sparse>
    %1 = sparse_tensor.convert %cst_0 : tensor<32xcomplex<f64>> to tensor<?xcomplex<f64>, #sparse>
    %2 = call @cops(%0, %1) : (tensor<?xcomplex<f64>, #sparse>, tensor<?xcomplex<f64>, #sparse>) -> tensor<?xcomplex<f64>, #sparse>
    %3 = call @csin(%0) : (tensor<?xcomplex<f64>, #sparse>) -> tensor<?xcomplex<f64>, #sparse>
    %4 = call @complex_sqrt(%0) : (tensor<?xcomplex<f64>, #sparse>) -> tensor<?xcomplex<f64>, #sparse>
    %5 = call @complex_tanh(%1) : (tensor<?xcomplex<f64>, #sparse>) -> tensor<?xcomplex<f64>, #sparse>
    %6 = call @clog1p_expm1(%0) : (tensor<?xcomplex<f64>, #sparse>) -> tensor<?xcomplex<f64>, #sparse>
    %7 = call @cdiv(%0) : (tensor<?xcomplex<f64>, #sparse>) -> tensor<?xcomplex<f64>, #sparse>
    %8 = call @cabs(%0) : (tensor<?xcomplex<f64>, #sparse>) -> tensor<?xf64, #sparse>
    sparse_tensor.print %2 : tensor<?xcomplex<f64>, #sparse>
    sparse_tensor.print %3 : tensor<?xcomplex<f64>, #sparse>
    sparse_tensor.print %4 : tensor<?xcomplex<f64>, #sparse>
    sparse_tensor.print %5 : tensor<?xcomplex<f64>, #sparse>
    sparse_tensor.print %6 : tensor<?xcomplex<f64>, #sparse>
    sparse_tensor.print %7 : tensor<?xcomplex<f64>, #sparse>
    sparse_tensor.print %8 : tensor<?xf64, #sparse>
    bufferization.dealloc_tensor %0 : tensor<?xcomplex<f64>, #sparse>
    bufferization.dealloc_tensor %1 : tensor<?xcomplex<f64>, #sparse>
    bufferization.dealloc_tensor %2 : tensor<?xcomplex<f64>, #sparse>
    bufferization.dealloc_tensor %3 : tensor<?xcomplex<f64>, #sparse>
    bufferization.dealloc_tensor %4 : tensor<?xcomplex<f64>, #sparse>
    bufferization.dealloc_tensor %5 : tensor<?xcomplex<f64>, #sparse>
    bufferization.dealloc_tensor %6 : tensor<?xcomplex<f64>, #sparse>
    bufferization.dealloc_tensor %7 : tensor<?xcomplex<f64>, #sparse>
    bufferization.dealloc_tensor %8 : tensor<?xf64, #sparse>
    return
  }
}

