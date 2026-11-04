#sparse = #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed), posWidth = 32, crdWidth = 64 }>
#sparse1 = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed(nonunique), d1 : singleton) }>
#sparse2 = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed(nonunique), d1 : singleton(soa)) }>
#sparse3 = #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d2 : dense, d0 : dense, d1 : dense) }>
#sparse4 = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : dense), posWidth = 32, crdWidth = 64 }>
#sparse5 = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : dense), posWidth = 32, crdWidth = 64 }>
#sparse6 = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed), posWidth = 32, crdWidth = 64 }>
#sparse7 = #sparse_tensor.encoding<{ map = (d0, d1, d2, d3) -> (d0 : batch, d1 : batch, d2 : dense, d3 : compressed) }>
#sparse8 = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed), posWidth = 32, crdWidth = 64 }>
#sparse9 = #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d0 : compressed, d1 : compressed(nonunique), d2 : singleton) }>
#sparse10 = #sparse_tensor.encoding<{ map = (d0, d1) -> (d1 : dense, d0 : compressed) }>
#sparse11 = #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>
#sparse12 = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed(nonordered)) }>
#sparse13 = #sparse_tensor.encoding<{ map = (d0, d1) -> (d1 : compressed(nonunique), d0 : singleton(nonordered)) }>
module {
  func.func @sparse_nop(%arg0: tensor<?xf64, #sparse>) -> tensor<?xf64, #sparse> {
    return %arg0 : tensor<?xf64, #sparse>
  }
  func.func @sparse_nop_aos_coo(%arg0: tensor<?x?xf64, #sparse1>) -> tensor<?x?xf64, #sparse1> {
    return %arg0 : tensor<?x?xf64, #sparse1>
  }
  func.func @sparse_nop_soa_coo(%arg0: tensor<?x?xf64, #sparse2>) -> tensor<?x?xf64, #sparse2> {
    return %arg0 : tensor<?x?xf64, #sparse2>
  }
  func.func @sparse_nop_multi_ret(%arg0: tensor<?xf64, #sparse>, %arg1: tensor<?xf64, #sparse>) -> (tensor<?xf64, #sparse>, tensor<?xf64, #sparse>) {
    return %arg0, %arg1 : tensor<?xf64, #sparse>, tensor<?xf64, #sparse>
  }
  func.func @sparse_nop_call(%arg0: tensor<?xf64, #sparse>, %arg1: tensor<?xf64, #sparse>) -> (tensor<?xf64, #sparse>, tensor<?xf64, #sparse>) {
    %0:2 = call @sparse_nop_multi_ret(%arg0, %arg1) : (tensor<?xf64, #sparse>, tensor<?xf64, #sparse>) -> (tensor<?xf64, #sparse>, tensor<?xf64, #sparse>)
    return %0#0, %0#1 : tensor<?xf64, #sparse>, tensor<?xf64, #sparse>
  }
  func.func @sparse_nop_cast(%arg0: tensor<64xf32, #sparse>) -> tensor<?xf32, #sparse> {
    %cast = tensor.cast %arg0 : tensor<64xf32, #sparse> to tensor<?xf32, #sparse>
    return %cast : tensor<?xf32, #sparse>
  }
  func.func @sparse_nop_cast_3d(%arg0: tensor<10x20x30xf32, #sparse3>) -> tensor<?x?x?xf32, #sparse3> {
    %cast = tensor.cast %arg0 : tensor<10x20x30xf32, #sparse3> to tensor<?x?x?xf32, #sparse3>
    return %cast : tensor<?x?x?xf32, #sparse3>
  }
  func.func @sparse_dense_2d(%arg0: tensor<?x?xf64, #sparse4>) {
    return
  }
  func.func @sparse_row(%arg0: tensor<?x?xf64, #sparse5>) {
    return
  }
  func.func @sparse_csr(%arg0: tensor<?x?xf64, #sparse6>) {
    return
  }
  func.func @sparse_bcsr_0(%arg0: tensor<?x2x?x?xf64, #sparse7>) {
    return
  }
  func.func @sparse_bcsr_1(%arg0: tensor<?x?x?x?xf64, #sparse7>) {
    return
  }
  func.func @sparse_bcsr_2(%arg0: tensor<18x6x4x2xf64, #sparse7>) {
    return
  }
  func.func @sparse_dcsr(%arg0: tensor<?x?xf64, #sparse8>) {
    return
  }
  func.func @sparse_dense_3d(%arg0: tensor<10x20x30xf64, #sparse3>) -> index {
    %c1 = arith.constant 1 : index
    %dim = tensor.dim %arg0, %c1 : tensor<10x20x30xf64, #sparse3>
    return %dim : index
  }
  func.func @sparse_dense_3d_dyn(%arg0: tensor<?x?x?xf64, #sparse3>) -> index {
    %c1 = arith.constant 1 : index
    %dim = tensor.dim %arg0, %c1 : tensor<?x?x?xf64, #sparse3>
    return %dim : index
  }
  func.func @sparse_positions_dcsr(%arg0: tensor<?x?xf64, #sparse8>) -> memref<?xi32> {
    %0 = sparse_tensor.positions %arg0 {level = 1 : index} : tensor<?x?xf64, #sparse8> to memref<?xi32>
    return %0 : memref<?xi32>
  }
  func.func @sparse_indices_dcsr(%arg0: tensor<?x?xf64, #sparse8>) -> memref<?xi64> {
    %0 = sparse_tensor.coordinates %arg0 {level = 1 : index} : tensor<?x?xf64, #sparse8> to memref<?xi64>
    return %0 : memref<?xi64>
  }
  func.func @sparse_values_dcsr(%arg0: tensor<?x?xf64, #sparse8>) -> memref<?xf64> {
    %0 = sparse_tensor.values %arg0 : tensor<?x?xf64, #sparse8> to memref<?xf64>
    return %0 : memref<?xf64>
  }
  func.func @sparse_values_coo(%arg0: tensor<?x?x?xf64, #sparse9>) -> memref<?xf64> {
    %0 = sparse_tensor.values %arg0 : tensor<?x?x?xf64, #sparse9> to memref<?xf64>
    return %0 : memref<?xf64>
  }
  func.func @sparse_indices_coo(%arg0: tensor<?x?x?xf64, #sparse9>) -> memref<?xindex, strided<[?], offset: ?>> {
    %0 = sparse_tensor.coordinates %arg0 {level = 1 : index} : tensor<?x?x?xf64, #sparse9> to memref<?xindex, strided<[?], offset: ?>>
    return %0 : memref<?xindex, strided<[?], offset: ?>>
  }
  func.func @sparse_indices_buffer_coo(%arg0: tensor<?x?x?xf64, #sparse9>) -> memref<?xindex> {
    %0 = sparse_tensor.coordinates_buffer %arg0 : tensor<?x?x?xf64, #sparse9> to memref<?xindex>
    return %0 : memref<?xindex>
  }
  func.func @sparse_noe(%arg0: tensor<128xf64, #sparse>) -> index {
    %0 = sparse_tensor.number_of_entries %arg0 : tensor<128xf64, #sparse>
    return %0 : index
  }
  func.func @sparse_dealloc_csr(%arg0: tensor<?x?xf64, #sparse6>) {
    bufferization.dealloc_tensor %arg0 : tensor<?x?xf64, #sparse6>
    return
  }
  func.func @sparse_alloc_csc(%arg0: index) -> tensor<10x?xf64, #sparse10> {
    %0 = tensor.empty(%arg0) : tensor<10x?xf64, #sparse10>
    %1 = sparse_tensor.load %0 : tensor<10x?xf64, #sparse10>
    return %1 : tensor<10x?xf64, #sparse10>
  }
  func.func @sparse_alloc_3d() -> tensor<10x20x30xf64, #sparse3> {
    %0 = tensor.empty() : tensor<10x20x30xf64, #sparse3>
    %1 = sparse_tensor.load %0 : tensor<10x20x30xf64, #sparse3>
    return %1 : tensor<10x20x30xf64, #sparse3>
  }
  func.func @sparse_expansion1() -> memref<?xindex> {
    %0 = tensor.empty() : tensor<4x8xf64, #sparse6>
    %values, %filled, %added, %count = sparse_tensor.expand %0 : tensor<4x8xf64, #sparse6> to memref<?xf64>, memref<?xi1>, memref<?xindex>
    return %added : memref<?xindex>
  }
  func.func @sparse_expansion2() -> memref<?xindex> {
    %0 = tensor.empty() : tensor<4x8xf64, #sparse10>
    %values, %filled, %added, %count = sparse_tensor.expand %0 : tensor<4x8xf64, #sparse10> to memref<?xf64>, memref<?xi1>, memref<?xindex>
    return %added : memref<?xindex>
  }
  func.func @sparse_expansion3(%arg0: index, %arg1: index) -> memref<?xindex> {
    %0 = tensor.empty(%arg0, %arg1) : tensor<?x?xf64, #sparse10>
    %values, %filled, %added, %count = sparse_tensor.expand %0 : tensor<?x?xf64, #sparse10> to memref<?xf64>, memref<?xi1>, memref<?xindex>
    return %added : memref<?xindex>
  }
  func.func @sparse_compression_1d(%arg0: tensor<100xf64, #sparse11>, %arg1: memref<?xf64>, %arg2: memref<?xi1>, %arg3: memref<?xindex>, %arg4: index) -> tensor<100xf64, #sparse11> {
    %0 = sparse_tensor.compress %arg1, %arg2, %arg3, %arg4 into %arg0[] : memref<?xf64>, memref<?xi1>, memref<?xindex>, tensor<100xf64, #sparse11>
    %1 = sparse_tensor.load %0 hasInserts : tensor<100xf64, #sparse11>
    return %1 : tensor<100xf64, #sparse11>
  }
  func.func @sparse_compression(%arg0: tensor<8x8xf64, #sparse6>, %arg1: memref<?xf64>, %arg2: memref<?xi1>, %arg3: memref<?xindex>, %arg4: index, %arg5: index) -> tensor<8x8xf64, #sparse6> {
    %0 = sparse_tensor.compress %arg1, %arg2, %arg3, %arg4 into %arg0[%arg5] : memref<?xf64>, memref<?xi1>, memref<?xindex>, tensor<8x8xf64, #sparse6>
    %1 = sparse_tensor.load %0 hasInserts : tensor<8x8xf64, #sparse6>
    return %1 : tensor<8x8xf64, #sparse6>
  }
  func.func @sparse_compression_unordered(%arg0: tensor<8x8xf64, #sparse12>, %arg1: memref<?xf64>, %arg2: memref<?xi1>, %arg3: memref<?xindex>, %arg4: index, %arg5: index) -> tensor<8x8xf64, #sparse12> {
    %0 = sparse_tensor.compress %arg1, %arg2, %arg3, %arg4 into %arg0[%arg5] : memref<?xf64>, memref<?xi1>, memref<?xindex>, tensor<8x8xf64, #sparse12>
    %1 = sparse_tensor.load %0 hasInserts : tensor<8x8xf64, #sparse12>
    return %1 : tensor<8x8xf64, #sparse12>
  }
  func.func @sparse_insert(%arg0: tensor<128xf64, #sparse11>, %arg1: index, %arg2: f64) -> tensor<128xf64, #sparse11> {
    %inserted = tensor.insert %arg2 into %arg0[%arg1] : tensor<128xf64, #sparse11>
    %0 = sparse_tensor.load %inserted hasInserts : tensor<128xf64, #sparse11>
    return %0 : tensor<128xf64, #sparse11>
  }
  func.func @sparse_insert_typed(%arg0: tensor<128xf64, #sparse>, %arg1: index, %arg2: f64) -> tensor<128xf64, #sparse> {
    %inserted = tensor.insert %arg2 into %arg0[%arg1] : tensor<128xf64, #sparse>
    %0 = sparse_tensor.load %inserted hasInserts : tensor<128xf64, #sparse>
    return %0 : tensor<128xf64, #sparse>
  }
  func.func @sparse_insert_coo(%arg0: tensor<5x6xf64, #sparse1>, %arg1: index, %arg2: f64) -> tensor<5x6xf64, #sparse1> {
    %inserted = tensor.insert %arg2 into %arg0[%arg1, %arg1] : tensor<5x6xf64, #sparse1>
    %0 = sparse_tensor.load %inserted hasInserts : tensor<5x6xf64, #sparse1>
    return %0 : tensor<5x6xf64, #sparse1>
  }
  func.func @sparse_nop_convert(%arg0: tensor<32xf32, #sparse>) -> tensor<?xf32, #sparse> {
    %0 = sparse_tensor.convert %arg0 : tensor<32xf32, #sparse> to tensor<?xf32, #sparse>
    return %0 : tensor<?xf32, #sparse>
  }
  func.func @sparse_convert_element_type(%arg0: tensor<32xf32, #sparse>) -> tensor<?xi32, #sparse> {
    %0 = sparse_tensor.convert %arg0 : tensor<32xf32, #sparse> to tensor<?xi32, #sparse>
    return %0 : tensor<?xi32, #sparse>
  }
  func.func @sparse_new_coo(%arg0: !llvm.ptr) -> tensor<?x?xf32, #sparse1> {
    %0 = sparse_tensor.new %arg0 : !llvm.ptr to tensor<?x?xf32, #sparse1>
    return %0 : tensor<?x?xf32, #sparse1>
  }
  func.func @sparse_new_coo_permute_no(%arg0: !llvm.ptr) -> tensor<?x?xf32, #sparse13> {
    %0 = sparse_tensor.new %arg0 : !llvm.ptr to tensor<?x?xf32, #sparse13>
    return %0 : tensor<?x?xf32, #sparse13>
  }
}

