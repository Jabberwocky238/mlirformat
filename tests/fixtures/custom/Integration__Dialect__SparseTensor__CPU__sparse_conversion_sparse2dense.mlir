#sparse = #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d0 : compressed, d1 : compressed, d2 : compressed) }>
#sparse1 = #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d1 : compressed, d2 : compressed, d0 : compressed) }>
#sparse2 = #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d2 : compressed, d0 : compressed, d1 : compressed) }>
#sparse3 = #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d0 : dense, d1 : compressed, d2 : compressed) }>
#sparse4 = #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d1 : dense, d2 : compressed, d0 : compressed) }>
#sparse5 = #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d2 : dense, d0 : compressed, d1 : compressed) }>
module {
  func.func @dump_234(%arg0: tensor<2x3x4xf64>) {
    %c0 = arith.constant 0 : index
    %cst = arith.constant -1.000000e+00 : f64
    %0 = vector.transfer_read %arg0[%c0, %c0, %c0], %cst : tensor<2x3x4xf64>, vector<2x3x4xf64>
    vector.print %0 : vector<2x3x4xf64>
    return
  }
  func.func @dump_p34(%arg0: tensor<?x3x4xf64>) {
    %cast = tensor.cast %arg0 : tensor<?x3x4xf64> to tensor<2x3x4xf64>
    call @dump_234(%cast) : (tensor<2x3x4xf64>) -> ()
    return
  }
  func.func @dump_2p4(%arg0: tensor<2x?x4xf64>) {
    %cast = tensor.cast %arg0 : tensor<2x?x4xf64> to tensor<2x3x4xf64>
    call @dump_234(%cast) : (tensor<2x3x4xf64>) -> ()
    return
  }
  func.func @dump_23p(%arg0: tensor<2x3x?xf64>) {
    %cast = tensor.cast %arg0 : tensor<2x3x?xf64> to tensor<2x3x4xf64>
    call @dump_234(%cast) : (tensor<2x3x4xf64>) -> ()
    return
  }
  func.func @dump_2pp(%arg0: tensor<2x?x?xf64>) {
    %cast = tensor.cast %arg0 : tensor<2x?x?xf64> to tensor<2x3x4xf64>
    call @dump_234(%cast) : (tensor<2x3x4xf64>) -> ()
    return
  }
  func.func @dump_p3p(%arg0: tensor<?x3x?xf64>) {
    %cast = tensor.cast %arg0 : tensor<?x3x?xf64> to tensor<2x3x4xf64>
    call @dump_234(%cast) : (tensor<2x3x4xf64>) -> ()
    return
  }
  func.func @dump_pp4(%arg0: tensor<?x?x4xf64>) {
    %cast = tensor.cast %arg0 : tensor<?x?x4xf64> to tensor<2x3x4xf64>
    call @dump_234(%cast) : (tensor<2x3x4xf64>) -> ()
    return
  }
  func.func @dump_ppp(%arg0: tensor<?x?x?xf64>) {
    %cast = tensor.cast %arg0 : tensor<?x?x?xf64> to tensor<2x3x4xf64>
    call @dump_234(%cast) : (tensor<2x3x4xf64>) -> ()
    return
  }
  func.func @main() {
    %cst = arith.constant dense<[[[1.000000e+00, 2.000000e+00, 3.000000e+00, 4.000000e+00], [5.000000e+00, 6.000000e+00, 7.000000e+00, 8.000000e+00], [9.000000e+00, 1.000000e+01, 1.100000e+01, 1.200000e+01]], [[1.300000e+01, 1.400000e+01, 1.500000e+01, 1.600000e+01], [1.700000e+01, 1.800000e+01, 1.900000e+01, 2.000000e+01], [2.100000e+01, 2.200000e+01, 2.300000e+01, 2.400000e+01]]]> : tensor<2x3x4xf64>
    %0 = sparse_tensor.convert %cst : tensor<2x3x4xf64> to tensor<2x3x4xf64, #sparse>
    %1 = sparse_tensor.convert %cst : tensor<2x3x4xf64> to tensor<2x3x4xf64, #sparse1>
    %2 = sparse_tensor.convert %cst : tensor<2x3x4xf64> to tensor<2x3x4xf64, #sparse2>
    %3 = sparse_tensor.convert %cst : tensor<2x3x4xf64> to tensor<2x3x4xf64, #sparse3>
    %4 = sparse_tensor.convert %cst : tensor<2x3x4xf64> to tensor<2x3x4xf64, #sparse4>
    %5 = sparse_tensor.convert %cst : tensor<2x3x4xf64> to tensor<2x3x4xf64, #sparse5>
    %6 = sparse_tensor.convert %cst : tensor<2x3x4xf64> to tensor<?x3x4xf64, #sparse3>
    %7 = sparse_tensor.convert %cst : tensor<2x3x4xf64> to tensor<2x?x4xf64, #sparse4>
    %8 = sparse_tensor.convert %cst : tensor<2x3x4xf64> to tensor<2x3x?xf64, #sparse5>
    %9 = sparse_tensor.convert %0 : tensor<2x3x4xf64, #sparse> to tensor<2x3x4xf64>
    %10 = sparse_tensor.convert %1 : tensor<2x3x4xf64, #sparse1> to tensor<2x3x4xf64>
    %11 = sparse_tensor.convert %2 : tensor<2x3x4xf64, #sparse2> to tensor<2x3x4xf64>
    %12 = sparse_tensor.convert %3 : tensor<2x3x4xf64, #sparse3> to tensor<2x3x4xf64>
    %13 = sparse_tensor.convert %4 : tensor<2x3x4xf64, #sparse4> to tensor<2x3x4xf64>
    %14 = sparse_tensor.convert %5 : tensor<2x3x4xf64, #sparse5> to tensor<2x3x4xf64>
    %15 = sparse_tensor.convert %6 : tensor<?x3x4xf64, #sparse3> to tensor<?x3x4xf64>
    %16 = sparse_tensor.convert %7 : tensor<2x?x4xf64, #sparse4> to tensor<2x?x4xf64>
    %17 = sparse_tensor.convert %8 : tensor<2x3x?xf64, #sparse5> to tensor<2x3x?xf64>
    %18 = sparse_tensor.convert %6 : tensor<?x3x4xf64, #sparse3> to tensor<?x3x?xf64>
    %19 = sparse_tensor.convert %7 : tensor<2x?x4xf64, #sparse4> to tensor<?x?x4xf64>
    call @dump_234(%cst) : (tensor<2x3x4xf64>) -> ()
    call @dump_234(%9) : (tensor<2x3x4xf64>) -> ()
    call @dump_234(%10) : (tensor<2x3x4xf64>) -> ()
    call @dump_234(%11) : (tensor<2x3x4xf64>) -> ()
    call @dump_234(%12) : (tensor<2x3x4xf64>) -> ()
    call @dump_234(%13) : (tensor<2x3x4xf64>) -> ()
    call @dump_234(%14) : (tensor<2x3x4xf64>) -> ()
    call @dump_p34(%15) : (tensor<?x3x4xf64>) -> ()
    call @dump_2p4(%16) : (tensor<2x?x4xf64>) -> ()
    call @dump_23p(%17) : (tensor<2x3x?xf64>) -> ()
    call @dump_p3p(%18) : (tensor<?x3x?xf64>) -> ()
    call @dump_pp4(%19) : (tensor<?x?x4xf64>) -> ()
    bufferization.dealloc_tensor %0 : tensor<2x3x4xf64, #sparse>
    bufferization.dealloc_tensor %1 : tensor<2x3x4xf64, #sparse1>
    bufferization.dealloc_tensor %2 : tensor<2x3x4xf64, #sparse2>
    bufferization.dealloc_tensor %3 : tensor<2x3x4xf64, #sparse3>
    bufferization.dealloc_tensor %4 : tensor<2x3x4xf64, #sparse4>
    bufferization.dealloc_tensor %5 : tensor<2x3x4xf64, #sparse5>
    bufferization.dealloc_tensor %6 : tensor<?x3x4xf64, #sparse3>
    bufferization.dealloc_tensor %7 : tensor<2x?x4xf64, #sparse4>
    bufferization.dealloc_tensor %8 : tensor<2x3x?xf64, #sparse5>
    bufferization.dealloc_tensor %9 : tensor<2x3x4xf64>
    bufferization.dealloc_tensor %10 : tensor<2x3x4xf64>
    bufferization.dealloc_tensor %11 : tensor<2x3x4xf64>
    bufferization.dealloc_tensor %12 : tensor<2x3x4xf64>
    bufferization.dealloc_tensor %13 : tensor<2x3x4xf64>
    bufferization.dealloc_tensor %14 : tensor<2x3x4xf64>
    bufferization.dealloc_tensor %15 : tensor<?x3x4xf64>
    bufferization.dealloc_tensor %16 : tensor<2x?x4xf64>
    bufferization.dealloc_tensor %17 : tensor<2x3x?xf64>
    bufferization.dealloc_tensor %18 : tensor<?x3x?xf64>
    bufferization.dealloc_tensor %19 : tensor<?x?x4xf64>
    return
  }
}

