#map = affine_map<(d0, d1) -> (d0, d1)>
#map1 = affine_map<(d0, d1) -> ()>
#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>
module {
  func.func @kernel_sum_reduce(%arg0: tensor<?x?xcomplex<f64>, #sparse>, %arg1: tensor<complex<f64>>) -> tensor<complex<f64>> {
    %0 = linalg.generic {doc = "x += A(i,j)", indexing_maps = [#map, #map1], iterator_types = ["reduction", "reduction"]} ins(%arg0 : tensor<?x?xcomplex<f64>, #sparse>) outs(%arg1 : tensor<complex<f64>>) {
    ^bb0(%in: complex<f64>, %out: complex<f64>):
      %1 = complex.add %out, %in : complex<f64>
      linalg.yield %1 : complex<f64>
    } -> tensor<complex<f64>>
    return %0 : tensor<complex<f64>>
  }
  func.func private @getTensorFilename(index) -> !llvm.ptr
  func.func @main() {
    %cst = complex.constant [0.000000e+00, 0.000000e+00] : complex<f64>
    %c0 = arith.constant 0 : index
    %0 = tensor.empty() : tensor<complex<f64>>
    %inserted = tensor.insert %cst into %0[] : tensor<complex<f64>>
    %1 = call @getTensorFilename(%c0) : (index) -> !llvm.ptr
    %2 = sparse_tensor.new %1 : !llvm.ptr to tensor<?x?xcomplex<f64>, #sparse>
    %3 = call @kernel_sum_reduce(%2, %inserted) : (tensor<?x?xcomplex<f64>, #sparse>, tensor<complex<f64>>) -> tensor<complex<f64>>
    %extracted = tensor.extract %3[] : tensor<complex<f64>>
    %4 = complex.re %extracted : complex<f64>
    %5 = complex.im %extracted : complex<f64>
    vector.print %4 : f64
    vector.print %5 : f64
    bufferization.dealloc_tensor %3 : tensor<complex<f64>>
    bufferization.dealloc_tensor %2 : tensor<?x?xcomplex<f64>, #sparse>
    return
  }
}

