module {
  func.func @transfer_read_rank_reducing(%arg0: memref<1x1x3x2xi8, strided<[6, 6, 2, 1], offset: ?>>) -> vector<3x2xi8> {
    %c0 = arith.constant 0 : index
    %c0_i8 = arith.constant 0 : i8
    %0 = vector.transfer_read %arg0[%c0, %c0, %c0, %c0], %c0_i8 : memref<1x1x3x2xi8, strided<[6, 6, 2, 1], offset: ?>>, vector<3x2xi8>
    return %0 : vector<3x2xi8>
  }
  func.func @transfer_read_rank_reducing_masked(%arg0: memref<1x1x3x2xi8, strided<[6, 6, 2, 1], offset: ?>>, %arg1: vector<3x2xi1>) -> vector<3x2xi8> {
    %c0 = arith.constant 0 : index
    %c0_i8 = arith.constant 0 : i8
    %0 = vector.mask %arg1 { vector.transfer_read %arg0[%c0, %c0, %c0, %c0], %c0_i8 : memref<1x1x3x2xi8, strided<[6, 6, 2, 1], offset: ?>>, vector<3x2xi8> } : vector<3x2xi1> -> vector<3x2xi8>
    return %0 : vector<3x2xi8>
  }
  func.func @transfer_write_rank_reducing(%arg0: memref<1x1x3x2xi8, strided<[6, 6, 2, 1], offset: ?>>, %arg1: vector<3x2xi8>) {
    %c0 = arith.constant 0 : index
    vector.transfer_write %arg1, %arg0[%c0, %c0, %c0, %c0] : vector<3x2xi8>, memref<1x1x3x2xi8, strided<[6, 6, 2, 1], offset: ?>>
    return
  }
  func.func @transfer_write_rank_reducing_masked(%arg0: memref<1x1x3x2xi8, strided<[6, 6, 2, 1], offset: ?>>, %arg1: vector<3x2xi8>, %arg2: vector<3x2xi1>) {
    %c0 = arith.constant 0 : index
    vector.mask %arg2 { vector.transfer_write %arg1, %arg0[%c0, %c0, %c0, %c0] : vector<3x2xi8>, memref<1x1x3x2xi8, strided<[6, 6, 2, 1], offset: ?>> } : vector<3x2xi1>
    return
  }
  func.func @transfer_read_and_vector_rank_reducing(%arg0: memref<1x1x3x2x1xf32>) -> vector<3x2x1xf32> {
    %c0 = arith.constant 0 : index
    %cst = arith.constant 0.000000e+00 : f32
    %0 = vector.transfer_read %arg0[%c0, %c0, %c0, %c0, %c0], %cst : memref<1x1x3x2x1xf32>, vector<3x2x1xf32>
    return %0 : vector<3x2x1xf32>
  }
  func.func @transfer_write_and_vector_rank_reducing(%arg0: memref<1x1x3x2x1xf32>, %arg1: vector<3x2x1xf32>) {
    %c0 = arith.constant 0 : index
    vector.transfer_write %arg1, %arg0[%c0, %c0, %c0, %c0, %c0] : vector<3x2x1xf32>, memref<1x1x3x2x1xf32>
    return
  }
  func.func @transfer_read_and_vector_rank_reducing_to_0d(%arg0: memref<1x1x1x1x1xf32>) -> vector<1x1x1xf32> {
    %c0 = arith.constant 0 : index
    %cst = arith.constant 0.000000e+00 : f32
    %0 = vector.transfer_read %arg0[%c0, %c0, %c0, %c0, %c0], %cst : memref<1x1x1x1x1xf32>, vector<1x1x1xf32>
    return %0 : vector<1x1x1xf32>
  }
  func.func @transfer_read_and_vector_rank_reducing_to_0d_masked(%arg0: memref<1x1x1x1x1xf32>, %arg1: vector<1x1x1xi1>) -> vector<1x1x1xf32> {
    %c0 = arith.constant 0 : index
    %cst = arith.constant 0.000000e+00 : f32
    %0 = vector.mask %arg1 { vector.transfer_read %arg0[%c0, %c0, %c0, %c0, %c0], %cst : memref<1x1x1x1x1xf32>, vector<1x1x1xf32> } : vector<1x1x1xi1> -> vector<1x1x1xf32>
    return %0 : vector<1x1x1xf32>
  }
  func.func @transfer_write_and_vector_rank_reducing_to_0d(%arg0: memref<1x1x1x1x1xf32>, %arg1: vector<1x1x1xf32>) {
    %c0 = arith.constant 0 : index
    vector.transfer_write %arg1, %arg0[%c0, %c0, %c0, %c0, %c0] : vector<1x1x1xf32>, memref<1x1x1x1x1xf32>
    return
  }
  func.func @transfer_write_and_vector_rank_reducing_to_0d_masked(%arg0: memref<1x1x1x1x1xf32>, %arg1: vector<1x1x1xf32>, %arg2: vector<1x1x1xi1>) {
    %c0 = arith.constant 0 : index
    %cst = arith.constant 0.000000e+00 : f32
    vector.mask %arg2 { vector.transfer_write %arg1, %arg0[%c0, %c0, %c0, %c0, %c0] : vector<1x1x1xf32>, memref<1x1x1x1x1xf32> } : vector<1x1x1xi1>
    return
  }
  func.func @transfer_read_dynamic_rank_reducing(%arg0: memref<?x1xi8, strided<[?, ?], offset: ?>>) -> vector<[16]x1xi8> {
    %c0 = arith.constant 0 : index
    %c0_i8 = arith.constant 0 : i8
    %0 = vector.transfer_read %arg0[%c0, %c0], %c0_i8 {in_bounds = [true, true]} : memref<?x1xi8, strided<[?, ?], offset: ?>>, vector<[16]x1xi8>
    return %0 : vector<[16]x1xi8>
  }
  func.func @masked_transfer_read_dynamic_rank_reducing_1(%arg0: memref<?x1xi8, strided<[?, ?], offset: ?>>, %arg1: index) -> vector<[16]x1xi8> {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c0_i8 = arith.constant 0 : i8
    %0 = vector.create_mask %arg1, %c1 : vector<[16]x1xi1>
    %1 = vector.transfer_read %arg0[%c0, %c0], %c0_i8, %0 {in_bounds = [true, true]} : memref<?x1xi8, strided<[?, ?], offset: ?>>, vector<[16]x1xi8>
    return %1 : vector<[16]x1xi8>
  }
  func.func @masked_transfer_read_dynamic_rank_reducing_2(%arg0: memref<1x?x3x1x?x1xi8, strided<[?, ?, ?, ?, ?, ?], offset: ?>>, %arg1: index, %arg2: index) -> vector<1x[1]x3x1x[16]x1xi8> {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c2 = arith.constant 2 : index
    %c0_i8 = arith.constant 0 : i8
    %0 = vector.create_mask %c1, %arg1, %c2, %c1, %arg2, %c1 : vector<1x[1]x3x1x[16]x1xi1>
    %1 = vector.transfer_read %arg0[%c0, %c0, %c0, %c0, %c0, %c0], %c0_i8, %0 {in_bounds = [true, true, true, true, true, true]} : memref<1x?x3x1x?x1xi8, strided<[?, ?, ?, ?, ?, ?], offset: ?>>, vector<1x[1]x3x1x[16]x1xi8>
    return %1 : vector<1x[1]x3x1x[16]x1xi8>
  }
  func.func @masked_transfer_write_and_vector_rank_reducing(%arg0: memref<1x1x3x1x16x1xf32>, %arg1: vector<1x3x1x16x1xf32>, %arg2: index, %arg3: index) {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %0 = vector.create_mask %c1, %arg2, %c1, %arg3, %c1 : vector<1x3x1x16x1xi1>
    vector.transfer_write %arg1, %arg0[%c0, %c0, %c0, %c0, %c0, %c0], %0 : vector<1x3x1x16x1xf32>, memref<1x1x3x1x16x1xf32>
    return
  }
  func.func @masked_transfer_write_dynamic_rank_reducing(%arg0: memref<?x1xi8, strided<[?, ?], offset: ?>>, %arg1: vector<[16]x1xi8>, %arg2: index) {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c0_i8 = arith.constant 0 : i8
    %0 = vector.create_mask %arg2, %c1 : vector<[16]x1xi1>
    vector.transfer_write %arg1, %arg0[%c0, %c0], %0 {in_bounds = [true, true]} : vector<[16]x1xi8>, memref<?x1xi8, strided<[?, ?], offset: ?>>
    return
  }
  func.func @unsupported_masked_transfer_read_dynamic_rank_reducing_1(%arg0: memref<?x1xi8, strided<[?, ?], offset: ?>>, %arg1: vector<[16]x1xi1>) -> vector<[16]x1xi8> {
    %c0 = arith.constant 0 : index
    %c0_i8 = arith.constant 0 : i8
    %0 = vector.transfer_read %arg0[%c0, %c0], %c0_i8, %arg1 {in_bounds = [true, true]} : memref<?x1xi8, strided<[?, ?], offset: ?>>, vector<[16]x1xi8>
    return %0 : vector<[16]x1xi8>
  }
  func.func @unsupported_masked_transfer_read_dynamic_rank_reducing_2(%arg0: memref<?x1xi8, strided<[?, ?], offset: ?>>, %arg1: index, %arg2: index) -> vector<[16]x1xi8> {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c0_i8 = arith.constant 0 : i8
    %0 = vector.create_mask %arg1, %arg2 : vector<[16]x1xi1>
    %1 = vector.transfer_read %arg0[%c0, %c0], %c0_i8, %0 {in_bounds = [true, true]} : memref<?x1xi8, strided<[?, ?], offset: ?>>, vector<[16]x1xi8>
    return %1 : vector<[16]x1xi8>
  }
  func.func @masked_transfer_read_dynamic_rank_reducing_scalable_unit_dim(%arg0: memref<?x1xi8, strided<[?, ?], offset: ?>>, %arg1: index) -> vector<[16]x[1]xi8> {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c0_i8 = arith.constant 0 : i8
    %0 = vector.create_mask %arg1, %c1 : vector<[16]x[1]xi1>
    %1 = vector.transfer_read %arg0[%c0, %c0], %c0_i8, %0 {in_bounds = [true, true]} : memref<?x1xi8, strided<[?, ?], offset: ?>>, vector<[16]x[1]xi8>
    return %1 : vector<[16]x[1]xi8>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.op<"func.func">
      transform.apply_patterns to %0 {
        transform.apply_patterns.vector.rank_reducing_subview_patterns
      } : !transform.op<"func.func">
      transform.yield 
    }
  }
}

