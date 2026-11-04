#map = affine_map<(d0, d1)[s0] -> (d1 * s0 + d0)>
module {
  func.func @load_store(%arg0: memref<?xf32, 1>, %arg1: index) {
    %memspacecast = memref.memory_space_cast %arg0 : memref<?xf32, 1> to memref<?xf32>
    %0 = memref.load %memspacecast[%arg1] : memref<?xf32>
    memref.store %0, %memspacecast[%arg1] : memref<?xf32>
    return
  }
  func.func @load_store_unfoldable(%arg0: memref<?xf32, 1>, %arg1: index) {
    %memspacecast = memref.memory_space_cast %arg0 : memref<?xf32, 1> to memref<?xf32, 2>
    %0 = memref.load %memspacecast[%arg1] : memref<?xf32, 2>
    memref.store %0, %memspacecast[%arg1] : memref<?xf32, 2>
    return
  }
  func.func @cast(%arg0: memref<2xf32, 1>, %arg1: memref<*xf32, 1>) -> (memref<*xf32>, memref<3x2xf32>) {
    %memspacecast = memref.memory_space_cast %arg0 : memref<2xf32, 1> to memref<2xf32>
    %cast = memref.cast %memspacecast : memref<2xf32> to memref<*xf32>
    %memspacecast_0 = memref.memory_space_cast %arg1 : memref<*xf32, 1> to memref<*xf32>
    %cast_1 = memref.cast %memspacecast_0 : memref<*xf32> to memref<3x2xf32>
    return %cast, %cast_1 : memref<*xf32>, memref<3x2xf32>
  }
  func.func @view(%arg0: memref<?xi8, 1>, %arg1: index, %arg2: index) -> memref<?x?xi8> {
    %memspacecast = memref.memory_space_cast %arg0 : memref<?xi8, 1> to memref<?xi8>
    %c100 = arith.constant 100 : index
    %view = memref.view %memspacecast[%arg1][%arg2, %c100] : memref<?xi8> to memref<?x?xi8>
    return %view : memref<?x?xi8>
  }
  func.func @subview(%arg0: memref<?x?xf32, 1>, %arg1: index) -> memref<8x2xf32, strided<[?, 2], offset: ?>> {
    %memspacecast = memref.memory_space_cast %arg0 : memref<?x?xf32, 1> to memref<?x?xf32>
    %subview = memref.subview %memspacecast[4, 2] [8, 2] [3, 2] : memref<?x?xf32> to memref<8x2xf32, strided<[?, 2], offset: ?>>
    return %subview : memref<8x2xf32, strided<[?, 2], offset: ?>>
  }
  func.func @reinterpret_cast(%arg0: memref<?xf32, 1>, %arg1: index) -> memref<10x?xf32, strided<[?, 1], offset: ?>> {
    %memspacecast = memref.memory_space_cast %arg0 : memref<?xf32, 1> to memref<?xf32>
    %c0 = arith.constant 0 : index
    %c10 = arith.constant 10 : index
    %reinterpret_cast = memref.reinterpret_cast %memspacecast to offset: [%c0], sizes: [10, %c10], strides: [%c10, 1] : memref<?xf32> to memref<10x?xf32, strided<[?, 1], offset: ?>>
    return %reinterpret_cast : memref<10x?xf32, strided<[?, 1], offset: ?>>
  }
  func.func @reshape(%arg0: memref<?x?xf32, 1>, %arg1: memref<1xindex>) -> memref<?xf32> {
    %memspacecast = memref.memory_space_cast %arg0 : memref<?x?xf32, 1> to memref<?x?xf32>
    %reshape = memref.reshape %memspacecast(%arg1) : (memref<?x?xf32>, memref<1xindex>) -> memref<?xf32>
    return %reshape : memref<?xf32>
  }
  func.func @expand_shape(%arg0: memref<12xf32, 1>) -> memref<3x4xf32> {
    %memspacecast = memref.memory_space_cast %arg0 : memref<12xf32, 1> to memref<12xf32>
    %expand_shape = memref.expand_shape %memspacecast [[0, 1]] output_shape [3, 4] : memref<12xf32> into memref<3x4xf32>
    return %expand_shape : memref<3x4xf32>
  }
  func.func @collapse_shape(%arg0: memref<3x4xf32, 1>) -> memref<12xf32> {
    %memspacecast = memref.memory_space_cast %arg0 : memref<3x4xf32, 1> to memref<3x4xf32>
    %collapse_shape = memref.collapse_shape %memspacecast [[0, 1]] : memref<3x4xf32> into memref<12xf32>
    return %collapse_shape : memref<12xf32>
  }
  func.func @transpose(%arg0: memref<?x?xf32, 1>) -> memref<?x?xf32, #map> {
    %memspacecast = memref.memory_space_cast %arg0 : memref<?x?xf32, 1> to memref<?x?xf32>
    %transpose = memref.transpose %memspacecast (d0, d1) -> (d1, d0) : memref<?x?xf32> to memref<?x?xf32, #map>
    return %transpose : memref<?x?xf32, #map>
  }
  func.func @atomic_rmw(%arg0: memref<?xf32, 1>, %arg1: index, %arg2: f32) -> f32 {
    %memspacecast = memref.memory_space_cast %arg0 : memref<?xf32, 1> to memref<?xf32>
    %0 = memref.atomic_rmw addf %arg2, %memspacecast[%arg1] : (f32, memref<?xf32>) -> f32
    return %0 : f32
  }
  func.func @assume_alignment(%arg0: memref<?xf32, 1>) -> memref<?xf32> {
    %memspacecast = memref.memory_space_cast %arg0 : memref<?xf32, 1> to memref<?xf32>
    %assume_align = memref.assume_alignment %memspacecast, 16 : memref<?xf32>
    return %assume_align : memref<?xf32>
  }
  func.func @op_with_cast_sequence(%arg0: memref<4x4xf32, 1>, %arg1: index, %arg2: f32) -> memref<16xf32> {
    %memspacecast = memref.memory_space_cast %arg0 : memref<4x4xf32, 1> to memref<4x4xf32>
    %c0 = arith.constant 0 : index
    %c4 = arith.constant 4 : index
    %expand_shape = memref.expand_shape %memspacecast [[0], [1, 2]] output_shape [4, 2, 2] : memref<4x4xf32> into memref<4x2x2xf32>
    %collapse_shape = memref.collapse_shape %expand_shape [[0, 1, 2]] : memref<4x2x2xf32> into memref<16xf32>
    %0 = memref.load %collapse_shape[%c0] : memref<16xf32>
    %1 = arith.addf %0, %arg2 : f32
    memref.store %1, %collapse_shape[%c0] : memref<16xf32>
    %2 = memref.atomic_rmw addf %arg2, %collapse_shape[%c4] : (f32, memref<16xf32>) -> f32
    return %collapse_shape : memref<16xf32>
  }
  func.func @transfer_read_write(%arg0: memref<?xf32, 1>, %arg1: index) {
    %memspacecast = memref.memory_space_cast %arg0 : memref<?xf32, 1> to memref<?xf32>
    %cst = arith.constant 0.000000e+00 : f32
    %0 = vector.transfer_read %memspacecast[%arg1], %cst : memref<?xf32>, vector<4xf32>
    vector.transfer_write %0, %memspacecast[%arg1] : vector<4xf32>, memref<?xf32>
    return
  }
  func.func @transfer_read_write_tensor(%arg0: tensor<?xf32>, %arg1: index) -> tensor<?xf32> {
    %cst = arith.constant 0.000000e+00 : f32
    %0 = vector.transfer_read %arg0[%arg1], %cst : tensor<?xf32>, vector<4xf32>
    %1 = vector.transfer_write %0, %arg0[%arg1] : vector<4xf32>, tensor<?xf32>
    return %1 : tensor<?xf32>
  }
  func.func @vector_load_store(%arg0: memref<?xf32, 1>, %arg1: index) {
    %memspacecast = memref.memory_space_cast %arg0 : memref<?xf32, 1> to memref<?xf32>
    %0 = vector.load %memspacecast[%arg1] : memref<?xf32>, vector<4xf32>
    vector.store %0, %memspacecast[%arg1] : memref<?xf32>, vector<4xf32>
    return
  }
  func.func @masked_load_store(%arg0: memref<?xf32, 1>, %arg1: index) {
    %memspacecast = memref.memory_space_cast %arg0 : memref<?xf32, 1> to memref<?xf32>
    %cst = arith.constant dense<[true, true, false, false]> : vector<4xi1>
    %cst_0 = arith.constant dense<0.000000e+00> : vector<4xf32>
    %0 = vector.maskedload %memspacecast[%arg1], %cst, %cst_0 : memref<?xf32>, vector<4xi1>, vector<4xf32> into vector<4xf32>
    vector.maskedstore %memspacecast[%arg1], %cst, %0 : memref<?xf32>, vector<4xi1>, vector<4xf32>
    return
  }
  func.func @gather_scatter(%arg0: memref<?xf32, 1>, %arg1: index) {
    %memspacecast = memref.memory_space_cast %arg0 : memref<?xf32, 1> to memref<?xf32>
    %c0 = arith.constant 0 : index
    %cst = arith.constant dense<[0, 1, 2, 3]> : vector<4xindex>
    %cst_0 = arith.constant dense<true> : vector<4xi1>
    %cst_1 = arith.constant dense<0.000000e+00> : vector<4xf32>
    %0 = vector.gather %memspacecast[%c0] [%cst], %cst_0, %cst_1 : memref<?xf32>, vector<4xindex>, vector<4xi1>, vector<4xf32> into vector<4xf32>
    vector.scatter %memspacecast[%c0] [%cst], %cst_0, %0 : memref<?xf32>, vector<4xindex>, vector<4xi1>, vector<4xf32>
    return
  }
  func.func @expandload_compressstore(%arg0: memref<?xf32, 1>, %arg1: index) {
    %memspacecast = memref.memory_space_cast %arg0 : memref<?xf32, 1> to memref<?xf32>
    %cst = arith.constant dense<[true, true, false, false]> : vector<4xi1>
    %cst_0 = arith.constant dense<0.000000e+00> : vector<4xf32>
    %0 = vector.expandload %memspacecast[%arg1], %cst, %cst_0 : memref<?xf32>, vector<4xi1>, vector<4xf32> into vector<4xf32>
    vector.compressstore %memspacecast[%arg1], %cst, %0 : memref<?xf32>, vector<4xi1>, vector<4xf32>
    return
  }
}

