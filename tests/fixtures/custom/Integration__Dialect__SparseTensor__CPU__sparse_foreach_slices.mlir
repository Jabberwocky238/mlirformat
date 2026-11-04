#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>
#sparse1 = #sparse_tensor.encoding<{ map = (d0 : #sparse_tensor<slice(1, 4, 1)>, d1 : #sparse_tensor<slice(1, 4, 2)>) -> (d0 : dense, d1 : compressed) }>
#sparse2 = #sparse_tensor.encoding<{ map = (d0 : #sparse_tensor<slice(?, ?, ?)>, d1 : #sparse_tensor<slice(?, ?, ?)>) -> (d0 : dense, d1 : compressed) }>
#sparse3 = #sparse_tensor.encoding<{ map = (d0 : #sparse_tensor<slice(1, 4, 1)>, d1 : #sparse_tensor<slice(1, 4, 2)>) -> (d0 : compressed(nonunique), d1 : singleton) }>
#sparse4 = #sparse_tensor.encoding<{ map = (d0 : #sparse_tensor<slice(?, ?, ?)>, d1 : #sparse_tensor<slice(?, ?, ?)>) -> (d0 : compressed(nonunique), d1 : singleton) }>
#sparse5 = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed(nonunique), d1 : singleton) }>
module {
  func.func @foreach_print_non_slice(%arg0: tensor<4x4xf64, #sparse>) {
    sparse_tensor.foreach in %arg0 : tensor<4x4xf64, #sparse> do {
    ^bb0(%arg1: index, %arg2: index, %arg3: f64):
      vector.print %arg1 : index
      vector.print %arg2 : index
      vector.print %arg3 : f64
    }
    return
  }
  func.func @foreach_print_slice(%arg0: tensor<4x4xf64, #sparse1>) {
    sparse_tensor.foreach in %arg0 : tensor<4x4xf64, #sparse1> do {
    ^bb0(%arg1: index, %arg2: index, %arg3: f64):
      vector.print %arg1 : index
      vector.print %arg2 : index
      vector.print %arg3 : f64
    }
    return
  }
  func.func @foreach_print_slice_dyn(%arg0: tensor<?x?xf64, #sparse2>) {
    sparse_tensor.foreach in %arg0 : tensor<?x?xf64, #sparse2> do {
    ^bb0(%arg1: index, %arg2: index, %arg3: f64):
      vector.print %arg1 : index
      vector.print %arg2 : index
      vector.print %arg3 : f64
    }
    return
  }
  func.func @foreach_print_slice_coo(%arg0: tensor<4x4xf64, #sparse3>) {
    sparse_tensor.foreach in %arg0 : tensor<4x4xf64, #sparse3> do {
    ^bb0(%arg1: index, %arg2: index, %arg3: f64):
      vector.print %arg1 : index
      vector.print %arg2 : index
      vector.print %arg3 : f64
    }
    return
  }
  func.func @foreach_print_slice_coo_dyn(%arg0: tensor<?x?xf64, #sparse4>) {
    sparse_tensor.foreach in %arg0 : tensor<?x?xf64, #sparse4> do {
    ^bb0(%arg1: index, %arg2: index, %arg3: f64):
      vector.print %arg1 : index
      vector.print %arg2 : index
      vector.print %arg3 : f64
    }
    return
  }
  func.func @main() {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c2 = arith.constant 2 : index
    %c4 = arith.constant 4 : index
    %cst = arith.constant dense<[[0.000000e+00, 2.100000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 6.100000e+00, 0.000000e+00, 0.000000e+00], [0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00], [0.000000e+00, 2.300000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00], [0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 1.000000e+00], [0.000000e+00, 0.000000e+00, 1.000000e-01, 0.000000e+00, 0.000000e+00, 2.100000e+00, 0.000000e+00, 0.000000e+00], [0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 3.100000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00], [0.000000e+00, 2.300000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 3.300000e+00, 0.000000e+00], [0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 1.000000e+00]]> : tensor<8x8xf64>
    %0 = sparse_tensor.convert %cst : tensor<8x8xf64> to tensor<8x8xf64, #sparse>
    %extracted_slice = tensor.extract_slice %0[1, 1] [4, 4] [1, 2] : tensor<8x8xf64, #sparse> to tensor<4x4xf64, #sparse1>
    %1 = sparse_tensor.convert %cst : tensor<8x8xf64> to tensor<8x8xf64, #sparse5>
    %extracted_slice_0 = tensor.extract_slice %1[1, 1] [4, 4] [1, 2] : tensor<8x8xf64, #sparse5> to tensor<4x4xf64, #sparse3>
    call @foreach_print_slice(%extracted_slice) : (tensor<4x4xf64, #sparse1>) -> ()
    call @foreach_print_slice_coo(%extracted_slice_0) : (tensor<4x4xf64, #sparse3>) -> ()
    %extracted_slice_1 = tensor.extract_slice %cst[1, 1] [4, 4] [1, 2] : tensor<8x8xf64> to tensor<4x4xf64>
    %2 = sparse_tensor.convert %extracted_slice_1 : tensor<4x4xf64> to tensor<4x4xf64, #sparse>
    call @foreach_print_non_slice(%2) : (tensor<4x4xf64, #sparse>) -> ()
    %3 = sparse_tensor.convert %cst : tensor<8x8xf64> to tensor<8x8xf64, #sparse>
    %extracted_slice_2 = tensor.extract_slice %3[%c1, %c1] [%c4, %c4] [%c1, %c2] : tensor<8x8xf64, #sparse> to tensor<?x?xf64, #sparse2>
    %4 = sparse_tensor.convert %cst : tensor<8x8xf64> to tensor<8x8xf64, #sparse5>
    %extracted_slice_3 = tensor.extract_slice %4[%c1, %c1] [%c4, %c4] [%c1, %c2] : tensor<8x8xf64, #sparse5> to tensor<?x?xf64, #sparse4>
    call @foreach_print_slice_dyn(%extracted_slice_2) : (tensor<?x?xf64, #sparse2>) -> ()
    call @foreach_print_slice_coo_dyn(%extracted_slice_3) : (tensor<?x?xf64, #sparse4>) -> ()
    bufferization.dealloc_tensor %0 : tensor<8x8xf64, #sparse>
    bufferization.dealloc_tensor %3 : tensor<8x8xf64, #sparse>
    bufferization.dealloc_tensor %1 : tensor<8x8xf64, #sparse5>
    bufferization.dealloc_tensor %4 : tensor<8x8xf64, #sparse5>
    bufferization.dealloc_tensor %2 : tensor<4x4xf64, #sparse>
    return
  }
}

