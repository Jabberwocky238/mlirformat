module {
  func.func @unary_ops(%arg0: memref<7x14x21xf32>, %arg1: memref<7x14x21xf32>) {
    linalg.exp ins(%arg0 : memref<7x14x21xf32>) outs(%arg1 : memref<7x14x21xf32>)
    linalg.log ins(%arg0 : memref<7x14x21xf32>) outs(%arg1 : memref<7x14x21xf32>)
    linalg.abs ins(%arg0 : memref<7x14x21xf32>) outs(%arg1 : memref<7x14x21xf32>)
    linalg.ceil ins(%arg0 : memref<7x14x21xf32>) outs(%arg1 : memref<7x14x21xf32>)
    linalg.floor ins(%arg0 : memref<7x14x21xf32>) outs(%arg1 : memref<7x14x21xf32>)
    linalg.negf ins(%arg0 : memref<7x14x21xf32>) outs(%arg1 : memref<7x14x21xf32>)
    linalg.reciprocal ins(%arg0 : memref<7x14x21xf32>) outs(%arg1 : memref<7x14x21xf32>)
    linalg.round ins(%arg0 : memref<7x14x21xf32>) outs(%arg1 : memref<7x14x21xf32>)
    linalg.sqrt ins(%arg0 : memref<7x14x21xf32>) outs(%arg1 : memref<7x14x21xf32>)
    linalg.rsqrt ins(%arg0 : memref<7x14x21xf32>) outs(%arg1 : memref<7x14x21xf32>)
    linalg.square ins(%arg0 : memref<7x14x21xf32>) outs(%arg1 : memref<7x14x21xf32>)
    linalg.tanh ins(%arg0 : memref<7x14x21xf32>) outs(%arg1 : memref<7x14x21xf32>)
    linalg.erf ins(%arg0 : memref<7x14x21xf32>) outs(%arg1 : memref<7x14x21xf32>)
    return
  }
}

// -----
module {
  func.func @binary_ops_int(%arg0: memref<10xi32>, %arg1: memref<10xi32>, %arg2: memref<10xi32>) {
    linalg.add ins(%arg0, %arg1 : memref<10xi32>, memref<10xi32>) outs(%arg2 : memref<10xi32>)
    linalg.sub ins(%arg0, %arg1 : memref<10xi32>, memref<10xi32>) outs(%arg2 : memref<10xi32>)
    linalg.mul ins(%arg0, %arg1 : memref<10xi32>, memref<10xi32>) outs(%arg2 : memref<10xi32>)
    linalg.div ins(%arg0, %arg1 : memref<10xi32>, memref<10xi32>) outs(%arg2 : memref<10xi32>)
    linalg.div_unsigned ins(%arg0, %arg1 : memref<10xi32>, memref<10xi32>) outs(%arg2 : memref<10xi32>)
    linalg.max ins(%arg0, %arg1 : memref<10xi32>, memref<10xi32>) outs(%arg2 : memref<10xi32>)
    linalg.min ins(%arg0, %arg1 : memref<10xi32>, memref<10xi32>) outs(%arg2 : memref<10xi32>)
    return
  }
}

// -----
module {
  func.func @binary_ops_float(%arg0: memref<10xf32>, %arg1: memref<10xf32>, %arg2: memref<10xf32>) {
    linalg.add ins(%arg0, %arg1 : memref<10xf32>, memref<10xf32>) outs(%arg2 : memref<10xf32>)
    linalg.sub ins(%arg0, %arg1 : memref<10xf32>, memref<10xf32>) outs(%arg2 : memref<10xf32>)
    linalg.mul ins(%arg0, %arg1 : memref<10xf32>, memref<10xf32>) outs(%arg2 : memref<10xf32>)
    linalg.div ins(%arg0, %arg1 : memref<10xf32>, memref<10xf32>) outs(%arg2 : memref<10xf32>)
    linalg.max ins(%arg0, %arg1 : memref<10xf32>, memref<10xf32>) outs(%arg2 : memref<10xf32>)
    linalg.min ins(%arg0, %arg1 : memref<10xf32>, memref<10xf32>) outs(%arg2 : memref<10xf32>)
    linalg.powf ins(%arg0, %arg1 : memref<10xf32>, memref<10xf32>) outs(%arg2 : memref<10xf32>)
    return
  }
}

// -----
module {
  func.func @binary_ops_complex(%arg0: memref<10xcomplex<f32>>, %arg1: memref<10xcomplex<f32>>, %arg2: memref<10xcomplex<f32>>) {
    linalg.add ins(%arg0, %arg1 : memref<10xcomplex<f32>>, memref<10xcomplex<f32>>) outs(%arg2 : memref<10xcomplex<f32>>)
    linalg.sub ins(%arg0, %arg1 : memref<10xcomplex<f32>>, memref<10xcomplex<f32>>) outs(%arg2 : memref<10xcomplex<f32>>)
    linalg.mul ins(%arg0, %arg1 : memref<10xcomplex<f32>>, memref<10xcomplex<f32>>) outs(%arg2 : memref<10xcomplex<f32>>)
    linalg.div ins(%arg0, %arg1 : memref<10xcomplex<f32>>, memref<10xcomplex<f32>>) outs(%arg2 : memref<10xcomplex<f32>>)
    return
  }
}

// -----
module {
  func.func @binary_ops_bool(%arg0: memref<10xi1>, %arg1: memref<10xi1>, %arg2: memref<10xi1>) {
    linalg.add ins(%arg0, %arg1 : memref<10xi1>, memref<10xi1>) outs(%arg2 : memref<10xi1>)
    linalg.mul ins(%arg0, %arg1 : memref<10xi1>, memref<10xi1>) outs(%arg2 : memref<10xi1>)
    return
  }
}

// -----
module {
  func.func @matmul(%arg0: tensor<?x?xf32>, %arg1: tensor<?x?xf32>, %arg2: tensor<?x?xf32>) -> tensor<?x?xf32> {
    %0 = linalg.matmul ins(%arg0, %arg1 : tensor<?x?xf32>, tensor<?x?xf32>) outs(%arg2 : tensor<?x?xf32>) -> tensor<?x?xf32>
    return %0 : tensor<?x?xf32>
  }
}

// -----
module {
  func.func @matmul_bool(%arg0: tensor<?x?xi1>, %arg1: tensor<?x?xi1>, %arg2: tensor<?x?xi1>) -> tensor<?x?xi1> {
    %0 = linalg.matmul ins(%arg0, %arg1 : tensor<?x?xi1>, tensor<?x?xi1>) outs(%arg2 : tensor<?x?xi1>) -> tensor<?x?xi1>
    return %0 : tensor<?x?xi1>
  }
}

// -----
module {
  func.func @matmul_unsigned_cast(%arg0: tensor<16x8xi16>, %arg1: tensor<8x32xi64>, %arg2: tensor<16x32xi32>) -> tensor<16x32xi32> {
    %0 = linalg.matmul {cast = #linalg.type_fn<cast_unsigned>} ins(%arg0, %arg1 : tensor<16x8xi16>, tensor<8x32xi64>) outs(%arg2 : tensor<16x32xi32>) -> tensor<16x32xi32>
    return %0 : tensor<16x32xi32>
  }
}

// -----
module {
  func.func @mixed_named_ops(%arg0: tensor<?x?xf32>, %arg1: tensor<?x?xf32>, %arg2: tensor<?x?xf32>, %arg3: tensor<?x?xf32>) -> tensor<?x?xf32> {
    %0 = linalg.matmul ins(%arg0, %arg1 : tensor<?x?xf32>, tensor<?x?xf32>) outs(%arg3 : tensor<?x?xf32>) -> tensor<?x?xf32>
    %1 = linalg.add ins(%0, %arg2 : tensor<?x?xf32>, tensor<?x?xf32>) outs(%arg3 : tensor<?x?xf32>) -> tensor<?x?xf32>
    return %1 : tensor<?x?xf32>
  }
}

