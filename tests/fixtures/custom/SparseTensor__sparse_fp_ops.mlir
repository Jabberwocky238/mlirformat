#map = affine_map<(d0) -> (d0)>
#sparse = #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>
module {
  func.func @abs(%arg0: tensor<32xf64, #sparse>, %arg1: tensor<32xf64>) -> tensor<32xf64> {
    %0 = linalg.generic {doc = "x(i) = OP a(i)", indexing_maps = [#map, #map], iterator_types = ["parallel"]} ins(%arg0 : tensor<32xf64, #sparse>) outs(%arg1 : tensor<32xf64>) {
    ^bb0(%in: f64, %out: f64):
      %1 = math.absf %in : f64
      linalg.yield %1 : f64
    } -> tensor<32xf64>
    return %0 : tensor<32xf64>
  }
  func.func @ceil(%arg0: tensor<32xf64, #sparse>, %arg1: tensor<32xf64>) -> tensor<32xf64> {
    %0 = linalg.generic {doc = "x(i) = OP a(i)", indexing_maps = [#map, #map], iterator_types = ["parallel"]} ins(%arg0 : tensor<32xf64, #sparse>) outs(%arg1 : tensor<32xf64>) {
    ^bb0(%in: f64, %out: f64):
      %1 = math.ceil %in : f64
      linalg.yield %1 : f64
    } -> tensor<32xf64>
    return %0 : tensor<32xf64>
  }
  func.func @floor(%arg0: tensor<32xf64, #sparse>, %arg1: tensor<32xf64>) -> tensor<32xf64> {
    %0 = linalg.generic {doc = "x(i) = OP a(i)", indexing_maps = [#map, #map], iterator_types = ["parallel"]} ins(%arg0 : tensor<32xf64, #sparse>) outs(%arg1 : tensor<32xf64>) {
    ^bb0(%in: f64, %out: f64):
      %1 = math.floor %in : f64
      linalg.yield %1 : f64
    } -> tensor<32xf64>
    return %0 : tensor<32xf64>
  }
  func.func @neg(%arg0: tensor<32xf64, #sparse>, %arg1: tensor<32xf64>) -> tensor<32xf64> {
    %0 = linalg.generic {doc = "x(i) = OP a(i)", indexing_maps = [#map, #map], iterator_types = ["parallel"]} ins(%arg0 : tensor<32xf64, #sparse>) outs(%arg1 : tensor<32xf64>) {
    ^bb0(%in: f64, %out: f64):
      %1 = arith.negf %in : f64
      linalg.yield %1 : f64
    } -> tensor<32xf64>
    return %0 : tensor<32xf64>
  }
  func.func @add(%arg0: tensor<32xf64, #sparse>, %arg1: tensor<32xf64>, %arg2: tensor<32xf64>) -> tensor<32xf64> {
    %0 = linalg.generic {doc = "x(i) = a(i) OP b(i)", indexing_maps = [#map, #map, #map], iterator_types = ["parallel"]} ins(%arg0, %arg1 : tensor<32xf64, #sparse>, tensor<32xf64>) outs(%arg2 : tensor<32xf64>) {
    ^bb0(%in: f64, %in_0: f64, %out: f64):
      %1 = arith.addf %in, %in_0 : f64
      linalg.yield %1 : f64
    } -> tensor<32xf64>
    return %0 : tensor<32xf64>
  }
  func.func @sub(%arg0: tensor<32xf64, #sparse>, %arg1: tensor<32xf64>, %arg2: tensor<32xf64>) -> tensor<32xf64> {
    %0 = linalg.generic {doc = "x(i) = a(i) OP b(i)", indexing_maps = [#map, #map, #map], iterator_types = ["parallel"]} ins(%arg0, %arg1 : tensor<32xf64, #sparse>, tensor<32xf64>) outs(%arg2 : tensor<32xf64>) {
    ^bb0(%in: f64, %in_0: f64, %out: f64):
      %1 = arith.subf %in, %in_0 : f64
      linalg.yield %1 : f64
    } -> tensor<32xf64>
    return %0 : tensor<32xf64>
  }
  func.func @mul(%arg0: tensor<32xf64, #sparse>, %arg1: tensor<32xf64>, %arg2: tensor<32xf64>) -> tensor<32xf64> {
    %0 = linalg.generic {doc = "x(i) = a(i) OP b(i)", indexing_maps = [#map, #map, #map], iterator_types = ["parallel"]} ins(%arg0, %arg1 : tensor<32xf64, #sparse>, tensor<32xf64>) outs(%arg2 : tensor<32xf64>) {
    ^bb0(%in: f64, %in_0: f64, %out: f64):
      %1 = arith.mulf %in, %in_0 : f64
      linalg.yield %1 : f64
    } -> tensor<32xf64>
    return %0 : tensor<32xf64>
  }
  func.func @divbyc(%arg0: tensor<32xf64, #sparse>, %arg1: tensor<32xf64>) -> tensor<32xf64> {
    %cst = arith.constant 2.000000e+00 : f64
    %0 = linalg.generic {doc = "x(i) = a(i) OP c", indexing_maps = [#map, #map], iterator_types = ["parallel"]} ins(%arg0 : tensor<32xf64, #sparse>) outs(%arg1 : tensor<32xf64>) {
    ^bb0(%in: f64, %out: f64):
      %1 = arith.divf %in, %cst : f64
      linalg.yield %1 : f64
    } -> tensor<32xf64>
    return %0 : tensor<32xf64>
  }
  func.func @zero_preserving_math(%arg0: tensor<32xf64, #sparse>) -> tensor<32xf64, #sparse> {
    %c32 = arith.constant 32 : index
    %0 = tensor.empty() : tensor<32xf64, #sparse>
    %1 = linalg.generic {doc = "x(i) = OP a(i)", indexing_maps = [#map, #map], iterator_types = ["parallel"]} ins(%arg0 : tensor<32xf64, #sparse>) outs(%0 : tensor<32xf64, #sparse>) {
    ^bb0(%in: f64, %out: f64):
      %2 = math.absf %in : f64
      %3 = math.ceil %2 : f64
      %4 = math.floor %3 : f64
      %5 = math.sqrt %4 : f64
      %6 = math.expm1 %5 : f64
      %7 = math.log1p %6 : f64
      %8 = math.sin %7 : f64
      %9 = math.tanh %8 : f64
      linalg.yield %9 : f64
    } -> tensor<32xf64, #sparse>
    return %1 : tensor<32xf64, #sparse>
  }
  func.func @complex_divbyc(%arg0: tensor<32xcomplex<f64>, #sparse>) -> tensor<32xcomplex<f64>, #sparse> {
    %cst = complex.constant [0.000000e+00, 1.000000e+00] : complex<f64>
    %0 = tensor.empty() : tensor<32xcomplex<f64>, #sparse>
    %1 = linalg.generic {doc = "x(i) = a(i) OP c", indexing_maps = [#map, #map], iterator_types = ["parallel"]} ins(%arg0 : tensor<32xcomplex<f64>, #sparse>) outs(%0 : tensor<32xcomplex<f64>, #sparse>) {
    ^bb0(%in: complex<f64>, %out: complex<f64>):
      %2 = complex.div %in, %cst : complex<f64>
      linalg.yield %2 : complex<f64>
    } -> tensor<32xcomplex<f64>, #sparse>
    return %1 : tensor<32xcomplex<f64>, #sparse>
  }
}

