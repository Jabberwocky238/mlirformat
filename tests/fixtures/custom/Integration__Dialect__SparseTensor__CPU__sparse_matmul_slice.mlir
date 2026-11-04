#sparse = #sparse_tensor.encoding<{ map = (d0 : #sparse_tensor<slice(?, 4, ?)>, d1 : #sparse_tensor<slice(?, 4, ?)>) -> (d0 : dense, d1 : compressed) }>
#sparse1 = #sparse_tensor.encoding<{ map = (d0 : #sparse_tensor<slice(?, 4, ?)>, d1 : #sparse_tensor<slice(?, 4, ?)>) -> (d0 : compressed, d1 : compressed) }>
#sparse2 = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>
#sparse3 = #sparse_tensor.encoding<{ map = (d0 : #sparse_tensor<slice(0, 4, 2)>, d1 : #sparse_tensor<slice(0, 4, 1)>) -> (d0 : dense, d1 : compressed) }>
#sparse4 = #sparse_tensor.encoding<{ map = (d0 : #sparse_tensor<slice(0, 4, 2)>, d1 : #sparse_tensor<slice(1, 4, 1)>) -> (d0 : compressed, d1 : compressed) }>
#sparse5 = #sparse_tensor.encoding<{ map = (d0 : #sparse_tensor<slice(0, 4, 1)>, d1 : #sparse_tensor<slice(0, 8, 1)>) -> (d0 : dense, d1 : compressed) }>
#sparse6 = #sparse_tensor.encoding<{ map = (d0 : #sparse_tensor<slice(0, 4, 1)>, d1 : #sparse_tensor<slice(0, 8, 1)>) -> (d0 : compressed, d1 : compressed) }>
#sparse7 = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>
#sparse8 = #sparse_tensor.encoding<{ map = (d0 : #sparse_tensor<slice(0, 4, 2)>, d1 : #sparse_tensor<slice(0, 4, 1)>) -> (d0 : compressed(nonunique), d1 : singleton) }>
#sparse9 = #sparse_tensor.encoding<{ map = (d0 : #sparse_tensor<slice(0, 4, 2)>, d1 : #sparse_tensor<slice(1, 4, 1)>) -> (d0 : compressed(nonunique), d1 : singleton) }>
#sparse10 = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed(nonunique), d1 : singleton) }>
module {
  func.func private @printMemrefF64(tensor<*xf64>)
  func.func private @printMemref1dF64(memref<?xf64>) attributes {llvm.emit_c_interface}
  func.func @matmul_dyn(%arg0: tensor<4x4xf64, #sparse>, %arg1: tensor<4x4xf64, #sparse1>) -> tensor<4x4xf64, #sparse2> {
    %0 = tensor.empty() : tensor<4x4xf64, #sparse2>
    %1 = linalg.matmul ins(%arg0, %arg1 : tensor<4x4xf64, #sparse>, tensor<4x4xf64, #sparse1>) outs(%0 : tensor<4x4xf64, #sparse2>) -> tensor<4x4xf64, #sparse2>
    return %1 : tensor<4x4xf64, #sparse2>
  }
  func.func @matmul1(%arg0: tensor<4x4xf64, #sparse3>, %arg1: tensor<4x4xf64, #sparse4>) -> tensor<4x4xf64, #sparse2> {
    %0 = tensor.empty() : tensor<4x4xf64, #sparse2>
    %1 = linalg.matmul ins(%arg0, %arg1 : tensor<4x4xf64, #sparse3>, tensor<4x4xf64, #sparse4>) outs(%0 : tensor<4x4xf64, #sparse2>) -> tensor<4x4xf64, #sparse2>
    return %1 : tensor<4x4xf64, #sparse2>
  }
  func.func @matmul2(%arg0: tensor<4x8xf64, #sparse5>, %arg1: tensor<8x4xf64, #sparse2>) -> tensor<4x4xf64, #sparse2> {
    %0 = tensor.empty() : tensor<4x4xf64, #sparse2>
    %1 = linalg.matmul ins(%arg0, %arg1 : tensor<4x8xf64, #sparse5>, tensor<8x4xf64, #sparse2>) outs(%0 : tensor<4x4xf64, #sparse2>) -> tensor<4x4xf64, #sparse2>
    return %1 : tensor<4x4xf64, #sparse2>
  }
  func.func @matmul3(%arg0: tensor<4x8xf64, #sparse6>, %arg1: tensor<8x4xf64, #sparse7>) -> tensor<4x4xf64, #sparse7> {
    %0 = tensor.empty() : tensor<4x4xf64, #sparse7>
    %1 = linalg.matmul ins(%arg0, %arg1 : tensor<4x8xf64, #sparse6>, tensor<8x4xf64, #sparse7>) outs(%0 : tensor<4x4xf64, #sparse7>) -> tensor<4x4xf64, #sparse7>
    return %1 : tensor<4x4xf64, #sparse7>
  }
  func.func @matmul5(%arg0: tensor<4x4xf64, #sparse8>, %arg1: tensor<4x4xf64, #sparse9>) -> tensor<4x4xf64, #sparse10> {
    %0 = tensor.empty() : tensor<4x4xf64, #sparse10>
    %1 = linalg.matmul ins(%arg0, %arg1 : tensor<4x4xf64, #sparse8>, tensor<4x4xf64, #sparse9>) outs(%0 : tensor<4x4xf64, #sparse10>) -> tensor<4x4xf64, #sparse10>
    return %1 : tensor<4x4xf64, #sparse10>
  }
  func.func @main() {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c2 = arith.constant 2 : index
    %cst = arith.constant 0.000000e+00 : f64
    %cst_0 = arith.constant dense<[[0.000000e+00, 2.100000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 6.100000e+00, 0.000000e+00, 0.000000e+00], [0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00], [0.000000e+00, 2.300000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00], [0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 1.000000e+00], [0.000000e+00, 2.100000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 6.100000e+00, 0.000000e+00, 0.000000e+00], [0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00], [0.000000e+00, 2.300000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00], [0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 1.000000e+00]]> : tensor<8x8xf64>
    %cst_1 = arith.constant dense<[[0.000000e+00, 0.000000e+00, 0.000000e+00, 1.000000e+00], [0.000000e+00, 0.000000e+00, 2.000000e+00, 0.000000e+00], [0.000000e+00, 3.000000e+00, 0.000000e+00, 0.000000e+00], [4.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00], [0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00], [0.000000e+00, 5.000000e+00, 0.000000e+00, 0.000000e+00], [0.000000e+00, 0.000000e+00, 6.000000e+00, 0.000000e+00], [0.000000e+00, 0.000000e+00, 7.000000e+00, 8.000000e+00]]> : tensor<8x4xf64>
    %0 = sparse_tensor.convert %cst_0 : tensor<8x8xf64> to tensor<8x8xf64, #sparse7>
    %extracted_slice = tensor.extract_slice %0[0, 0] [4, 8] [1, 1] : tensor<8x8xf64, #sparse7> to tensor<4x8xf64, #sparse6>
    %1 = sparse_tensor.convert %cst_1 : tensor<8x4xf64> to tensor<8x4xf64, #sparse7>
    %2 = call @matmul3(%extracted_slice, %1) : (tensor<4x8xf64, #sparse6>, tensor<8x4xf64, #sparse7>) -> tensor<4x4xf64, #sparse7>
    sparse_tensor.print %2 : tensor<4x4xf64, #sparse7>
    %3 = sparse_tensor.convert %cst_0 : tensor<8x8xf64> to tensor<8x8xf64, #sparse2>
    %extracted_slice_2 = tensor.extract_slice %3[0, 0] [4, 8] [1, 1] : tensor<8x8xf64, #sparse2> to tensor<4x8xf64, #sparse5>
    %4 = sparse_tensor.convert %cst_1 : tensor<8x4xf64> to tensor<8x4xf64, #sparse2>
    %5 = call @matmul2(%extracted_slice_2, %4) : (tensor<4x8xf64, #sparse5>, tensor<8x4xf64, #sparse2>) -> tensor<4x4xf64, #sparse2>
    sparse_tensor.print %5 : tensor<4x4xf64, #sparse2>
    %extracted_slice_3 = tensor.extract_slice %0[0, 1] [4, 4] [2, 1] : tensor<8x8xf64, #sparse7> to tensor<4x4xf64, #sparse4>
    %extracted_slice_4 = tensor.extract_slice %4[0, 0] [4, 4] [2, 1] : tensor<8x4xf64, #sparse2> to tensor<4x4xf64, #sparse3>
    %6 = call @matmul1(%extracted_slice_4, %extracted_slice_3) : (tensor<4x4xf64, #sparse3>, tensor<4x4xf64, #sparse4>) -> tensor<4x4xf64, #sparse2>
    sparse_tensor.print %6 : tensor<4x4xf64, #sparse2>
    %7 = sparse_tensor.convert %cst_0 : tensor<8x8xf64> to tensor<8x8xf64, #sparse10>
    %8 = sparse_tensor.convert %cst_1 : tensor<8x4xf64> to tensor<8x4xf64, #sparse10>
    %extracted_slice_5 = tensor.extract_slice %8[0, 0] [4, 4] [2, 1] : tensor<8x4xf64, #sparse10> to tensor<4x4xf64, #sparse8>
    %extracted_slice_6 = tensor.extract_slice %7[0, 1] [4, 4] [2, 1] : tensor<8x8xf64, #sparse10> to tensor<4x4xf64, #sparse9>
    %9 = call @matmul5(%extracted_slice_5, %extracted_slice_6) : (tensor<4x4xf64, #sparse8>, tensor<4x4xf64, #sparse9>) -> tensor<4x4xf64, #sparse10>
    sparse_tensor.print %9 : tensor<4x4xf64, #sparse10>
    %extracted_slice_7 = tensor.extract_slice %0[%c0, %c1] [4, 4] [%c2, %c1] : tensor<8x8xf64, #sparse7> to tensor<4x4xf64, #sparse1>
    %extracted_slice_8 = tensor.extract_slice %4[%c0, %c0] [4, 4] [%c2, %c1] : tensor<8x4xf64, #sparse2> to tensor<4x4xf64, #sparse>
    %10 = call @matmul_dyn(%extracted_slice_8, %extracted_slice_7) : (tensor<4x4xf64, #sparse>, tensor<4x4xf64, #sparse1>) -> tensor<4x4xf64, #sparse2>
    sparse_tensor.print %10 : tensor<4x4xf64, #sparse2>
    %extracted_slice_9 = tensor.extract_slice %cst_0[0, 1] [4, 4] [2, 1] : tensor<8x8xf64> to tensor<4x4xf64>
    %extracted_slice_10 = tensor.extract_slice %cst_1[0, 0] [4, 4] [2, 1] : tensor<8x4xf64> to tensor<4x4xf64>
    %11 = tensor.empty() : tensor<4x4xf64>
    %12 = linalg.fill ins(%cst : f64) outs(%11 : tensor<4x4xf64>) -> tensor<4x4xf64>
    %13 = linalg.matmul ins(%extracted_slice_10, %extracted_slice_9 : tensor<4x4xf64>, tensor<4x4xf64>) outs(%12 : tensor<4x4xf64>) -> tensor<4x4xf64>
    %cast = tensor.cast %13 : tensor<4x4xf64> to tensor<*xf64>
    call @printMemrefF64(%cast) : (tensor<*xf64>) -> ()
    bufferization.dealloc_tensor %11 : tensor<4x4xf64>
    bufferization.dealloc_tensor %4 : tensor<8x4xf64, #sparse2>
    bufferization.dealloc_tensor %3 : tensor<8x8xf64, #sparse2>
    bufferization.dealloc_tensor %8 : tensor<8x4xf64, #sparse10>
    bufferization.dealloc_tensor %7 : tensor<8x8xf64, #sparse10>
    bufferization.dealloc_tensor %9 : tensor<4x4xf64, #sparse10>
    bufferization.dealloc_tensor %1 : tensor<8x4xf64, #sparse7>
    bufferization.dealloc_tensor %0 : tensor<8x8xf64, #sparse7>
    bufferization.dealloc_tensor %6 : tensor<4x4xf64, #sparse2>
    bufferization.dealloc_tensor %5 : tensor<4x4xf64, #sparse2>
    bufferization.dealloc_tensor %2 : tensor<4x4xf64, #sparse7>
    bufferization.dealloc_tensor %10 : tensor<4x4xf64, #sparse2>
    return
  }
}

