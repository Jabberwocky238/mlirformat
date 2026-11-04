#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : dense) }>
#sparse1 = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>
#sparse2 = #sparse_tensor.encoding<{ map = (d0, d1) -> (d1 : compressed, d0 : compressed) }>
#sparse3 = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed(nonunique), d1 : singleton) }>
#sparse4 = #sparse_tensor.encoding<{ map = (d0, d1) -> (d1 : compressed(nonunique), d0 : singleton) }>
#sparse5 = #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d1 : compressed, d2 : compressed, d0 : compressed) }>
module {
  func.func @foreach_print_const() {
    %cst = arith.constant sparse<[[0, 0], [1, 6]], [1.000000e+00, 5.000000e+00]> : tensor<8x7xf32>
    sparse_tensor.foreach in %cst : tensor<8x7xf32> do {
    ^bb0(%arg0: index, %arg1: index, %arg2: f32):
      vector.print %arg0 : index
      vector.print %arg1 : index
      vector.print %arg2 : f32
    }
    return
  }
  func.func @foreach_print_1(%arg0: tensor<2x2xf64, #sparse>) {
    sparse_tensor.foreach in %arg0 : tensor<2x2xf64, #sparse> do {
    ^bb0(%arg1: index, %arg2: index, %arg3: f64):
      vector.print %arg1 : index
      vector.print %arg2 : index
      vector.print %arg3 : f64
    }
    return
  }
  func.func @foreach_print_2(%arg0: tensor<2x2xf64, #sparse1>) {
    sparse_tensor.foreach in %arg0 : tensor<2x2xf64, #sparse1> do {
    ^bb0(%arg1: index, %arg2: index, %arg3: f64):
      vector.print %arg1 : index
      vector.print %arg2 : index
      vector.print %arg3 : f64
    }
    return
  }
  func.func @foreach_print_3(%arg0: tensor<2x2xf64, #sparse2>) {
    sparse_tensor.foreach in %arg0 : tensor<2x2xf64, #sparse2> do {
    ^bb0(%arg1: index, %arg2: index, %arg3: f64):
      vector.print %arg1 : index
      vector.print %arg2 : index
      vector.print %arg3 : f64
    }
    return
  }
  func.func @foreach_print_4(%arg0: tensor<2x2xf64, #sparse3>) {
    sparse_tensor.foreach in %arg0 : tensor<2x2xf64, #sparse3> do {
    ^bb0(%arg1: index, %arg2: index, %arg3: f64):
      vector.print %arg1 : index
      vector.print %arg2 : index
      vector.print %arg3 : f64
    }
    return
  }
  func.func @foreach_print_5(%arg0: tensor<2x2xf64, #sparse4>) {
    sparse_tensor.foreach in %arg0 : tensor<2x2xf64, #sparse4> do {
    ^bb0(%arg1: index, %arg2: index, %arg3: f64):
      vector.print %arg1 : index
      vector.print %arg2 : index
      vector.print %arg3 : f64
    }
    return
  }
  func.func @foreach_print_3d(%arg0: tensor<7x8x9xf64, #sparse5>) {
    sparse_tensor.foreach in %arg0 : tensor<7x8x9xf64, #sparse5> do {
    ^bb0(%arg1: index, %arg2: index, %arg3: index, %arg4: f64):
      vector.print %arg1 : index
      vector.print %arg2 : index
      vector.print %arg3 : index
      vector.print %arg4 : f64
    }
    return
  }
  func.func @foreach_print_dense(%arg0: tensor<2x2xf64>) {
    sparse_tensor.foreach in %arg0 : tensor<2x2xf64> do {
    ^bb0(%arg1: index, %arg2: index, %arg3: f64):
      vector.print %arg1 : index
      vector.print %arg2 : index
      vector.print %arg3 : f64
    }
    return
  }
  func.func @main() {
    %cst = arith.constant dense<[[1.000000e+00, 2.000000e+00], [5.000000e+00, 6.000000e+00]]> : tensor<2x2xf64>
    %cst_0 = arith.constant sparse<[[1, 2, 3], [4, 5, 6]], [1.000000e+00, 2.000000e+00]> : tensor<7x8x9xf64>
    %0 = sparse_tensor.convert %cst : tensor<2x2xf64> to tensor<2x2xf64, #sparse>
    %1 = sparse_tensor.convert %cst : tensor<2x2xf64> to tensor<2x2xf64, #sparse1>
    %2 = sparse_tensor.convert %cst : tensor<2x2xf64> to tensor<2x2xf64, #sparse2>
    %3 = sparse_tensor.convert %cst : tensor<2x2xf64> to tensor<2x2xf64, #sparse3>
    %4 = sparse_tensor.convert %cst : tensor<2x2xf64> to tensor<2x2xf64, #sparse4>
    %5 = sparse_tensor.convert %cst_0 : tensor<7x8x9xf64> to tensor<7x8x9xf64, #sparse5>
    call @foreach_print_const() : () -> ()
    call @foreach_print_dense(%cst) : (tensor<2x2xf64>) -> ()
    call @foreach_print_1(%0) : (tensor<2x2xf64, #sparse>) -> ()
    call @foreach_print_2(%1) : (tensor<2x2xf64, #sparse1>) -> ()
    call @foreach_print_3(%2) : (tensor<2x2xf64, #sparse2>) -> ()
    call @foreach_print_4(%3) : (tensor<2x2xf64, #sparse3>) -> ()
    call @foreach_print_5(%4) : (tensor<2x2xf64, #sparse4>) -> ()
    call @foreach_print_3d(%5) : (tensor<7x8x9xf64, #sparse5>) -> ()
    bufferization.dealloc_tensor %0 : tensor<2x2xf64, #sparse>
    bufferization.dealloc_tensor %1 : tensor<2x2xf64, #sparse1>
    bufferization.dealloc_tensor %2 : tensor<2x2xf64, #sparse2>
    bufferization.dealloc_tensor %3 : tensor<2x2xf64, #sparse3>
    bufferization.dealloc_tensor %4 : tensor<2x2xf64, #sparse4>
    bufferization.dealloc_tensor %5 : tensor<7x8x9xf64, #sparse5>
    return
  }
}

