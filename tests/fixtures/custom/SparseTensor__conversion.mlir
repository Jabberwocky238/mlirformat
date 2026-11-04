#sparse = #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>
#sparse1 = #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d2 : dense, d0 : compressed, d1 : compressed) }>
#sparse2 = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>
#sparse3 = #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed), posWidth = 64, crdWidth = 64 }>
#sparse4 = #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed), posWidth = 32, crdWidth = 32 }>
#sparse5 = #sparse_tensor.encoding<{ map = (d0, d1) -> (d1 : dense, d0 : compressed) }>
module {
  func.func @sparse_nop(%arg0: tensor<?xf64, #sparse>) -> tensor<?xf64, #sparse> {
    return %arg0 : tensor<?xf64, #sparse>
  }
  func.func @sparse_dim1d(%arg0: tensor<?xf64, #sparse>) -> index {
    %c0 = arith.constant 0 : index
    %dim = tensor.dim %arg0, %c0 : tensor<?xf64, #sparse>
    return %dim : index
  }
  func.func @sparse_dim3d(%arg0: tensor<?x?x?xf64, #sparse1>) -> index {
    %c1 = arith.constant 1 : index
    %dim = tensor.dim %arg0, %c1 : tensor<?x?x?xf64, #sparse1>
    return %dim : index
  }
  func.func @sparse_dim3d_const(%arg0: tensor<10x20x30xf64, #sparse1>) -> index {
    %c1 = arith.constant 1 : index
    %dim = tensor.dim %arg0, %c1 : tensor<10x20x30xf64, #sparse1>
    return %dim : index
  }
  func.func @sparse_new1d(%arg0: !llvm.ptr) -> tensor<128xf64, #sparse> {
    %0 = sparse_tensor.new %arg0 : !llvm.ptr to tensor<128xf64, #sparse>
    return %0 : tensor<128xf64, #sparse>
  }
  func.func @sparse_new2d(%arg0: !llvm.ptr) -> tensor<?x?xf32, #sparse2> {
    %0 = sparse_tensor.new %arg0 : !llvm.ptr to tensor<?x?xf32, #sparse2>
    return %0 : tensor<?x?xf32, #sparse2>
  }
  func.func @sparse_new3d(%arg0: !llvm.ptr) -> tensor<?x?x?xf32, #sparse1> {
    %0 = sparse_tensor.new %arg0 : !llvm.ptr to tensor<?x?x?xf32, #sparse1>
    return %0 : tensor<?x?x?xf32, #sparse1>
  }
  func.func @sparse_init(%arg0: index, %arg1: index) -> tensor<?x?xf64, #sparse2> {
    %0 = tensor.empty(%arg0, %arg1) : tensor<?x?xf64, #sparse2>
    %1 = sparse_tensor.load %0 : tensor<?x?xf64, #sparse2>
    return %1 : tensor<?x?xf64, #sparse2>
  }
  func.func @sparse_release(%arg0: tensor<128xf64, #sparse>) {
    bufferization.dealloc_tensor %arg0 : tensor<128xf64, #sparse>
    return
  }
  func.func @sparse_nop_cast(%arg0: tensor<64xf32, #sparse>) -> tensor<?xf32, #sparse> {
    %cast = tensor.cast %arg0 : tensor<64xf32, #sparse> to tensor<?xf32, #sparse>
    return %cast : tensor<?xf32, #sparse>
  }
  func.func @sparse_positions(%arg0: tensor<128xf64, #sparse>) -> memref<?xindex> {
    %0 = sparse_tensor.positions %arg0 {level = 0 : index} : tensor<128xf64, #sparse> to memref<?xindex>
    return %0 : memref<?xindex>
  }
  func.func @sparse_positions64(%arg0: tensor<128xf64, #sparse3>) -> memref<?xi64> {
    %0 = sparse_tensor.positions %arg0 {level = 0 : index} : tensor<128xf64, #sparse3> to memref<?xi64>
    return %0 : memref<?xi64>
  }
  func.func @sparse_positions32(%arg0: tensor<128xf64, #sparse4>) -> memref<?xi32> {
    %0 = sparse_tensor.positions %arg0 {level = 0 : index} : tensor<128xf64, #sparse4> to memref<?xi32>
    return %0 : memref<?xi32>
  }
  func.func @sparse_indices(%arg0: tensor<128xf64, #sparse>) -> memref<?xindex> {
    %0 = sparse_tensor.coordinates %arg0 {level = 0 : index} : tensor<128xf64, #sparse> to memref<?xindex>
    return %0 : memref<?xindex>
  }
  func.func @sparse_indices64(%arg0: tensor<128xf64, #sparse3>) -> memref<?xi64> {
    %0 = sparse_tensor.coordinates %arg0 {level = 0 : index} : tensor<128xf64, #sparse3> to memref<?xi64>
    return %0 : memref<?xi64>
  }
  func.func @sparse_indices32(%arg0: tensor<128xf64, #sparse4>) -> memref<?xi32> {
    %0 = sparse_tensor.coordinates %arg0 {level = 0 : index} : tensor<128xf64, #sparse4> to memref<?xi32>
    return %0 : memref<?xi32>
  }
  func.func @sparse_valuesf64(%arg0: tensor<128xf64, #sparse>) -> memref<?xf64> {
    %0 = sparse_tensor.values %arg0 : tensor<128xf64, #sparse> to memref<?xf64>
    return %0 : memref<?xf64>
  }
  func.func @sparse_valuesf32(%arg0: tensor<128xf32, #sparse>) -> memref<?xf32> {
    %0 = sparse_tensor.values %arg0 : tensor<128xf32, #sparse> to memref<?xf32>
    return %0 : memref<?xf32>
  }
  func.func @sparse_valuesi32(%arg0: tensor<128xi32, #sparse>) -> memref<?xi32> {
    %0 = sparse_tensor.values %arg0 : tensor<128xi32, #sparse> to memref<?xi32>
    return %0 : memref<?xi32>
  }
  func.func @sparse_valuesi16(%arg0: tensor<128xi16, #sparse>) -> memref<?xi16> {
    %0 = sparse_tensor.values %arg0 : tensor<128xi16, #sparse> to memref<?xi16>
    return %0 : memref<?xi16>
  }
  func.func @sparse_valuesi8(%arg0: tensor<128xi8, #sparse>) -> memref<?xi8> {
    %0 = sparse_tensor.values %arg0 : tensor<128xi8, #sparse> to memref<?xi8>
    return %0 : memref<?xi8>
  }
  func.func @sparse_noe(%arg0: tensor<128xf64, #sparse>) -> index {
    %0 = sparse_tensor.number_of_entries %arg0 : tensor<128xf64, #sparse>
    return %0 : index
  }
  func.func @sparse_reconstruct(%arg0: tensor<128xf32, #sparse>) -> tensor<128xf32, #sparse> {
    %0 = sparse_tensor.load %arg0 : tensor<128xf32, #sparse>
    return %0 : tensor<128xf32, #sparse>
  }
  func.func @sparse_reconstruct_ins(%arg0: tensor<128xf32, #sparse>) -> tensor<128xf32, #sparse> {
    %0 = sparse_tensor.load %arg0 hasInserts : tensor<128xf32, #sparse>
    return %0 : tensor<128xf32, #sparse>
  }
  func.func @sparse_insert(%arg0: tensor<128xf32, #sparse>, %arg1: index, %arg2: f32) -> tensor<128xf32, #sparse> {
    %inserted = tensor.insert %arg2 into %arg0[%arg1] : tensor<128xf32, #sparse>
    return %inserted : tensor<128xf32, #sparse>
  }
  func.func @sparse_expansion1() -> memref<?xindex> {
    %0 = tensor.empty() : tensor<4x8xf64, #sparse2>
    %values, %filled, %added, %count = sparse_tensor.expand %0 : tensor<4x8xf64, #sparse2> to memref<?xf64>, memref<?xi1>, memref<?xindex>
    return %added : memref<?xindex>
  }
  func.func @sparse_expansion2() -> memref<?xindex> {
    %0 = tensor.empty() : tensor<4x8xf64, #sparse5>
    %values, %filled, %added, %count = sparse_tensor.expand %0 : tensor<4x8xf64, #sparse5> to memref<?xf64>, memref<?xi1>, memref<?xindex>
    return %added : memref<?xindex>
  }
  func.func @sparse_expansion3(%arg0: index, %arg1: index) -> memref<?xindex> {
    %0 = tensor.empty(%arg0, %arg1) : tensor<?x?xf64, #sparse5>
    %values, %filled, %added, %count = sparse_tensor.expand %0 : tensor<?x?xf64, #sparse5> to memref<?xf64>, memref<?xi1>, memref<?xindex>
    return %added : memref<?xindex>
  }
  func.func @sparse_compression(%arg0: tensor<8x8xf64, #sparse2>, %arg1: memref<?xf64>, %arg2: memref<?xi1>, %arg3: memref<?xindex>, %arg4: index, %arg5: index) -> tensor<8x8xf64, #sparse2> {
    %0 = sparse_tensor.compress %arg1, %arg2, %arg3, %arg4 into %arg0[%arg5] : memref<?xf64>, memref<?xi1>, memref<?xindex>, tensor<8x8xf64, #sparse2>
    return %0 : tensor<8x8xf64, #sparse2>
  }
  func.func @sparse_and_dense_init(%arg0: index, %arg1: index) -> (tensor<?x?xf64, #sparse2>, tensor<?x?xf64>) {
    %0 = tensor.empty(%arg0, %arg1) : tensor<?x?xf64, #sparse2>
    %1 = sparse_tensor.load %0 : tensor<?x?xf64, #sparse2>
    %2 = tensor.empty(%arg0, %arg1) : tensor<?x?xf64>
    return %1, %2 : tensor<?x?xf64, #sparse2>, tensor<?x?xf64>
  }
}

