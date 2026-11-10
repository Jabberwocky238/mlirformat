module {
  func.func @unary_ops(%arg0: memref<7x14x21xf32>, %arg1: memref<7x14x21xf32>) {
    linalg.elementwise kind=#linalg.elementwise_kind<exp> ins(%arg0 : memref<7x14x21xf32>) outs(%arg1 : memref<7x14x21xf32>)
    linalg.elementwise kind=#linalg.elementwise_kind<log> ins(%arg0 : memref<7x14x21xf32>) outs(%arg1 : memref<7x14x21xf32>)
    linalg.elementwise kind=#linalg.elementwise_kind<abs> ins(%arg0 : memref<7x14x21xf32>) outs(%arg1 : memref<7x14x21xf32>)
    linalg.elementwise kind=#linalg.elementwise_kind<ceil> ins(%arg0 : memref<7x14x21xf32>) outs(%arg1 : memref<7x14x21xf32>)
    linalg.elementwise kind=#linalg.elementwise_kind<floor> ins(%arg0 : memref<7x14x21xf32>) outs(%arg1 : memref<7x14x21xf32>)
    linalg.elementwise kind=#linalg.elementwise_kind<negf> ins(%arg0 : memref<7x14x21xf32>) outs(%arg1 : memref<7x14x21xf32>)
    linalg.elementwise kind=#linalg.elementwise_kind<reciprocal> ins(%arg0 : memref<7x14x21xf32>) outs(%arg1 : memref<7x14x21xf32>)
    linalg.elementwise kind=#linalg.elementwise_kind<round> ins(%arg0 : memref<7x14x21xf32>) outs(%arg1 : memref<7x14x21xf32>)
    linalg.elementwise kind=#linalg.elementwise_kind<sqrt> ins(%arg0 : memref<7x14x21xf32>) outs(%arg1 : memref<7x14x21xf32>)
    linalg.elementwise kind=#linalg.elementwise_kind<rsqrt> ins(%arg0 : memref<7x14x21xf32>) outs(%arg1 : memref<7x14x21xf32>)
    linalg.elementwise kind=#linalg.elementwise_kind<square> ins(%arg0 : memref<7x14x21xf32>) outs(%arg1 : memref<7x14x21xf32>)
    linalg.elementwise kind=#linalg.elementwise_kind<tanh> ins(%arg0 : memref<7x14x21xf32>) outs(%arg1 : memref<7x14x21xf32>)
    linalg.elementwise kind=#linalg.elementwise_kind<erf> ins(%arg0 : memref<7x14x21xf32>) outs(%arg1 : memref<7x14x21xf32>)
    linalg.elementwise kind=#linalg.elementwise_kind<sin> ins(%arg0 : memref<7x14x21xf32>) outs(%arg1 : memref<7x14x21xf32>)
    linalg.elementwise kind=#linalg.elementwise_kind<cos> ins(%arg0 : memref<7x14x21xf32>) outs(%arg1 : memref<7x14x21xf32>)
    linalg.elementwise kind=#linalg.elementwise_kind<tan> ins(%arg0 : memref<7x14x21xf32>) outs(%arg1 : memref<7x14x21xf32>)
    linalg.elementwise kind=#linalg.elementwise_kind<acos> ins(%arg0 : memref<7x14x21xf32>) outs(%arg1 : memref<7x14x21xf32>)
    linalg.elementwise kind=#linalg.elementwise_kind<acosh> ins(%arg0 : memref<7x14x21xf32>) outs(%arg1 : memref<7x14x21xf32>)
    linalg.elementwise kind=#linalg.elementwise_kind<asin> ins(%arg0 : memref<7x14x21xf32>) outs(%arg1 : memref<7x14x21xf32>)
    linalg.elementwise kind=#linalg.elementwise_kind<asinh> ins(%arg0 : memref<7x14x21xf32>) outs(%arg1 : memref<7x14x21xf32>)
    linalg.elementwise kind=#linalg.elementwise_kind<atan> ins(%arg0 : memref<7x14x21xf32>) outs(%arg1 : memref<7x14x21xf32>)
    linalg.elementwise kind=#linalg.elementwise_kind<atanh> ins(%arg0 : memref<7x14x21xf32>) outs(%arg1 : memref<7x14x21xf32>)
    linalg.elementwise kind=#linalg.elementwise_kind<log10> ins(%arg0 : memref<7x14x21xf32>) outs(%arg1 : memref<7x14x21xf32>)
    linalg.elementwise kind=#linalg.elementwise_kind<log1p> ins(%arg0 : memref<7x14x21xf32>) outs(%arg1 : memref<7x14x21xf32>)
    linalg.elementwise kind=#linalg.elementwise_kind<log2> ins(%arg0 : memref<7x14x21xf32>) outs(%arg1 : memref<7x14x21xf32>)
    return
  }
}

// -----
#map = affine_map<(d0, d1) -> (d1)>
#map1 = affine_map<(d0, d1) -> (d1, d0)>
module {
  func.func @unary_ops_non_identity(%arg0: tensor<?xf32>, %arg1: tensor<?x?xf32>) -> tensor<?x?xf32> {
    %0 = linalg.elementwise kind=#linalg.elementwise_kind<log> indexing_maps = [#map, #map1] ins(%arg0 : tensor<?xf32>) outs(%arg1 : tensor<?x?xf32>) -> tensor<?x?xf32>
    return %0 : tensor<?x?xf32>
  }
}

// -----
module {
  func.func @binary_ops_int(%arg0: memref<10xi32>, %arg1: memref<10xi32>, %arg2: memref<10xi32>) {
    linalg.elementwise kind=#linalg.elementwise_kind<add> ins(%arg0, %arg1 : memref<10xi32>, memref<10xi32>) outs(%arg2 : memref<10xi32>)
    linalg.elementwise kind=#linalg.elementwise_kind<sub> ins(%arg0, %arg1 : memref<10xi32>, memref<10xi32>) outs(%arg2 : memref<10xi32>)
    linalg.elementwise kind=#linalg.elementwise_kind<mul> ins(%arg0, %arg1 : memref<10xi32>, memref<10xi32>) outs(%arg2 : memref<10xi32>)
    linalg.elementwise kind=#linalg.elementwise_kind<div> ins(%arg0, %arg1 : memref<10xi32>, memref<10xi32>) outs(%arg2 : memref<10xi32>)
    linalg.elementwise kind=#linalg.elementwise_kind<div_unsigned> ins(%arg0, %arg1 : memref<10xi32>, memref<10xi32>) outs(%arg2 : memref<10xi32>)
    linalg.elementwise kind=#linalg.elementwise_kind<max_signed> ins(%arg0, %arg1 : memref<10xi32>, memref<10xi32>) outs(%arg2 : memref<10xi32>)
    linalg.elementwise kind=#linalg.elementwise_kind<min_signed> ins(%arg0, %arg1 : memref<10xi32>, memref<10xi32>) outs(%arg2 : memref<10xi32>)
    return
  }
}

// -----
module {
  func.func @binary_ops_float(%arg0: memref<10xf32>, %arg1: memref<10xf32>, %arg2: memref<10xf32>) {
    linalg.elementwise kind=#linalg.elementwise_kind<add> ins(%arg0, %arg1 : memref<10xf32>, memref<10xf32>) outs(%arg2 : memref<10xf32>)
    linalg.elementwise kind=#linalg.elementwise_kind<sub> ins(%arg0, %arg1 : memref<10xf32>, memref<10xf32>) outs(%arg2 : memref<10xf32>)
    linalg.elementwise kind=#linalg.elementwise_kind<mul> ins(%arg0, %arg1 : memref<10xf32>, memref<10xf32>) outs(%arg2 : memref<10xf32>)
    linalg.elementwise kind=#linalg.elementwise_kind<div> ins(%arg0, %arg1 : memref<10xf32>, memref<10xf32>) outs(%arg2 : memref<10xf32>)
    linalg.elementwise kind=#linalg.elementwise_kind<max_signed> ins(%arg0, %arg1 : memref<10xf32>, memref<10xf32>) outs(%arg2 : memref<10xf32>)
    linalg.elementwise kind=#linalg.elementwise_kind<min_signed> ins(%arg0, %arg1 : memref<10xf32>, memref<10xf32>) outs(%arg2 : memref<10xf32>)
    linalg.elementwise kind=#linalg.elementwise_kind<powf> ins(%arg0, %arg1 : memref<10xf32>, memref<10xf32>) outs(%arg2 : memref<10xf32>)
    return
  }
}

// -----
module {
  func.func @binary_ops_complex(%arg0: memref<10xcomplex<f32>>, %arg1: memref<10xcomplex<f32>>, %arg2: memref<10xcomplex<f32>>) {
    linalg.elementwise kind=#linalg.elementwise_kind<add> ins(%arg0, %arg1 : memref<10xcomplex<f32>>, memref<10xcomplex<f32>>) outs(%arg2 : memref<10xcomplex<f32>>)
    linalg.elementwise kind=#linalg.elementwise_kind<sub> ins(%arg0, %arg1 : memref<10xcomplex<f32>>, memref<10xcomplex<f32>>) outs(%arg2 : memref<10xcomplex<f32>>)
    linalg.elementwise kind=#linalg.elementwise_kind<mul> ins(%arg0, %arg1 : memref<10xcomplex<f32>>, memref<10xcomplex<f32>>) outs(%arg2 : memref<10xcomplex<f32>>)
    linalg.elementwise kind=#linalg.elementwise_kind<div> ins(%arg0, %arg1 : memref<10xcomplex<f32>>, memref<10xcomplex<f32>>) outs(%arg2 : memref<10xcomplex<f32>>)
    return
  }
}

// -----
module {
  func.func @binary_ops_bool(%arg0: memref<10xi1>, %arg1: memref<10xi1>, %arg2: memref<10xi1>) {
    linalg.elementwise kind=#linalg.elementwise_kind<add> ins(%arg0, %arg1 : memref<10xi1>, memref<10xi1>) outs(%arg2 : memref<10xi1>)
    linalg.elementwise kind=#linalg.elementwise_kind<mul> ins(%arg0, %arg1 : memref<10xi1>, memref<10xi1>) outs(%arg2 : memref<10xi1>)
    return
  }
}

// -----
module {
  func.func @binary_ops_uint(%arg0: memref<10xi32>, %arg1: memref<10xi32>, %arg2: memref<10xi32>) {
    linalg.elementwise kind=#linalg.elementwise_kind<max_unsigned> ins(%arg0, %arg1 : memref<10xi32>, memref<10xi32>) outs(%arg2 : memref<10xi32>)
    linalg.elementwise kind=#linalg.elementwise_kind<min_unsigned> ins(%arg0, %arg1 : memref<10xi32>, memref<10xi32>) outs(%arg2 : memref<10xi32>)
    return
  }
}

// -----
#map = affine_map<(d0, d1) -> (d1)>
#map1 = affine_map<(d0, d1) -> (d1, d0)>
#map2 = affine_map<(d0, d1) -> (d0, d1)>
module {
  func.func @binary_ops_non_identity(%arg0: tensor<?xf32>, %arg1: tensor<?x?xf32>, %arg2: tensor<?x?xf32>) -> tensor<?x?xf32> {
    %0 = linalg.elementwise kind=#linalg.elementwise_kind<add> indexing_maps = [#map, #map1, #map2] ins(%arg0, %arg1 : tensor<?xf32>, tensor<?x?xf32>) outs(%arg2 : tensor<?x?xf32>) -> tensor<?x?xf32>
    return %0 : tensor<?x?xf32>
  }
}

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d2, d1)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1)>
module {
  func.func @contract_matmul(%arg0: tensor<?x?xf32>, %arg1: tensor<?x?xf32>, %arg2: tensor<?x?xf32>) -> tensor<?x?xf32> {
    %0 = linalg.contract indexing_maps = [#map, #map1, #map2] ins(%arg0, %arg1 : tensor<?x?xf32>, tensor<?x?xf32>) outs(%arg2 : tensor<?x?xf32>) -> tensor<?x?xf32>
    return %0 : tensor<?x?xf32>
  }
  func.func @contract_matmul_bool(%arg0: tensor<?x?xi1>, %arg1: tensor<?x?xi1>, %arg2: tensor<?x?xi1>) -> tensor<?x?xi1> {
    %0 = linalg.contract indexing_maps = [#map, #map1, #map2] ins(%arg0, %arg1 : tensor<?x?xi1>, tensor<?x?xi1>) outs(%arg2 : tensor<?x?xi1>) -> tensor<?x?xi1>
    return %0 : tensor<?x?xi1>
  }
  func.func @contract_matmul_memref(%arg0: memref<?x?xf32>, %arg1: memref<?x?xf32>, %arg2: memref<?x?xf32>) {
    linalg.contract indexing_maps = [#map, #map1, #map2] ins(%arg0, %arg1 : memref<?x?xf32>, memref<?x?xf32>) outs(%arg2 : memref<?x?xf32>)
    return
  }
  func.func @contract_matmul_bitcast_int_to_float(%arg0: tensor<16x8xi32>, %arg1: tensor<8x32xi32>, %arg2: tensor<16x32xf32>) -> tensor<16x32xf32> {
    %0 = linalg.contract indexing_maps = [#map, #map1, #map2] ins(%arg0, %arg1 : tensor<16x8xi32>, tensor<8x32xi32>) outs(%arg2 : tensor<16x32xf32>) -> tensor<16x32xf32>
    return %0 : tensor<16x32xf32>
  }
  func.func @contract_matmul_unsigned_cast_float(%arg0: tensor<16x8xi16>, %arg1: tensor<8x32xi16>, %arg2: tensor<16x32xf32>) -> tensor<16x32xf32> {
    %0 = linalg.contract indexing_maps = [#map, #map1, #map2] {cast = #linalg.type_fn<cast_unsigned>} ins(%arg0, %arg1 : tensor<16x8xi16>, tensor<8x32xi16>) outs(%arg2 : tensor<16x32xf32>) -> tensor<16x32xf32>
    return %0 : tensor<16x32xf32>
  }
}

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d0, d2, d3)>
#map1 = affine_map<(d0, d1, d2, d3) -> (d3, d2, d1)>
#map2 = affine_map<(d0, d1, d2, d3) -> (d0, d1)>
module {
  func.func @contract_multi_reduction(%arg0: tensor<10x20x30xf32>, %arg1: tensor<30x20x40xf32>, %arg2: tensor<10x40xf32>) -> tensor<10x40xf32> {
    %0 = linalg.contract indexing_maps = [#map, #map1, #map2] ins(%arg0, %arg1 : tensor<10x20x30xf32>, tensor<30x20x40xf32>) outs(%arg2 : tensor<10x40xf32>) -> tensor<10x40xf32>
    return %0 : tensor<10x40xf32>
  }
}

