#map = affine_map<(d0, d1) -> (d1, d0)>
#sparse = #sparse_tensor.encoding<{ map = (d0 : #sparse_tensor<slice(?, ?, ?)>, d1 : #sparse_tensor<slice(?, ?, ?)>) -> (d0 : compressed, d1 : compressed) }>
#sparse1 = #sparse_tensor.encoding<{ map = (d0 : #sparse_tensor<slice(0, 4, 1)>, d1 : #sparse_tensor<slice(2, 4, 1)>) -> (d0 : compressed, d1 : compressed) }>
#sparse2 = #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d0 : dense, d1 : loose_compressed(nonunique), d2 : singleton) }>
module {
  func.func @sparse_foreach_constant() {
    %cst = arith.constant sparse<[[2, 1], [1, 1], [1, 2]], [1.000000e+00, 5.000000e+00, 6.000000e+00]> : tensor<8x7xf32>
    sparse_tensor.foreach in %cst {order = #map} : tensor<8x7xf32> do {
    ^bb0(%arg0: index, %arg1: index, %arg2: f32):
      "test.use"(%arg0, %arg1, %arg2) : (index, index, f32) -> ()
    }
    sparse_tensor.foreach in %cst : tensor<8x7xf32> do {
    ^bb0(%arg0: index, %arg1: index, %arg2: f32):
      "test.use"(%arg0, %arg1, %arg2) : (index, index, f32) -> ()
    }
    return
  }
  func.func @foreach_print_slice_dyn(%arg0: tensor<?x?xf64, #sparse>) {
    sparse_tensor.foreach in %arg0 : tensor<?x?xf64, #sparse> do {
    ^bb0(%arg1: index, %arg2: index, %arg3: f64):
      "test.use"(%arg3) : (f64) -> ()
    }
    return
  }
  func.func @foreach_print_slice(%arg0: tensor<4x4xf64, #sparse1>) {
    sparse_tensor.foreach in %arg0 : tensor<4x4xf64, #sparse1> do {
    ^bb0(%arg1: index, %arg2: index, %arg3: f64):
      "test.use"(%arg3) : (f64) -> ()
    }
    return
  }
  func.func @foreach_bcoo(%arg0: tensor<4x4x4xf64, #sparse2>) {
    sparse_tensor.foreach in %arg0 : tensor<4x4x4xf64, #sparse2> do {
    ^bb0(%arg1: index, %arg2: index, %arg3: index, %arg4: f64):
      "test.use"(%arg4) : (f64) -> ()
    }
    return
  }
}

