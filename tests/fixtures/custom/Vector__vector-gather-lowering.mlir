#map = affine_map<()[s0] -> (s0 * 4096)>
module {
  func.func @gather_memref_1d(%arg0: memref<?xf32>, %arg1: vector<2xindex>, %arg2: vector<2xi1>, %arg3: vector<2xf32>) -> vector<2xf32> {
    %c0 = arith.constant 0 : index
    %0 = vector.gather %arg0[%c0] [%arg1], %arg2, %arg3 : memref<?xf32>, vector<2xindex>, vector<2xi1>, vector<2xf32> into vector<2xf32>
    return %0 : vector<2xf32>
  }
  func.func @gather_memref_1d_i32_index(%arg0: memref<?xf32>, %arg1: vector<2xi32>, %arg2: vector<2xi1>, %arg3: vector<2xf32>) -> vector<2xf32> {
    %c42 = arith.constant 42 : index
    %0 = vector.gather %arg0[%c42] [%arg1], %arg2, %arg3 : memref<?xf32>, vector<2xi32>, vector<2xi1>, vector<2xf32> into vector<2xf32>
    return %0 : vector<2xf32>
  }
  func.func @gather_memref_2d(%arg0: memref<?x?xf32>, %arg1: vector<2x3xindex>, %arg2: vector<2x3xi1>, %arg3: vector<2x3xf32>) -> vector<2x3xf32> {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %0 = vector.gather %arg0[%c0, %c1] [%arg1], %arg2, %arg3 : memref<?x?xf32>, vector<2x3xindex>, vector<2x3xi1>, vector<2x3xf32> into vector<2x3xf32>
    return %0 : vector<2x3xf32>
  }
  func.func @scalable_gather_memref_2d(%arg0: memref<?x?xf32>, %arg1: vector<2x[3]xindex>, %arg2: vector<2x[3]xi1>, %arg3: vector<2x[3]xf32>) -> vector<2x[3]xf32> {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %0 = vector.gather %arg0[%c0, %c1] [%arg1], %arg2, %arg3 : memref<?x?xf32>, vector<2x[3]xindex>, vector<2x[3]xi1>, vector<2x[3]xf32> into vector<2x[3]xf32>
    return %0 : vector<2x[3]xf32>
  }
  func.func @scalable_gather_memref_2d_with_alignment(%arg0: memref<?x?xf32>, %arg1: vector<2x[3]xindex>, %arg2: vector<2x[3]xi1>, %arg3: vector<2x[3]xf32>) -> vector<2x[3]xf32> {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %0 = vector.gather %arg0[%c0, %c1] [%arg1], %arg2, %arg3 {alignment = 8 : i64} : memref<?x?xf32>, vector<2x[3]xindex>, vector<2x[3]xi1>, vector<2x[3]xf32> into vector<2x[3]xf32>
    return %0 : vector<2x[3]xf32>
  }
  func.func @scalable_gather_cant_unroll(%arg0: memref<?x?xf32>, %arg1: vector<[4]x8xindex>, %arg2: vector<[4]x8xi1>, %arg3: vector<[4]x8xf32>) -> vector<[4]x8xf32> {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %0 = vector.gather %arg0[%c0, %c1] [%arg1], %arg2, %arg3 : memref<?x?xf32>, vector<[4]x8xindex>, vector<[4]x8xi1>, vector<[4]x8xf32> into vector<[4]x8xf32>
    return %0 : vector<[4]x8xf32>
  }
  func.func @gather_tensor_1d(%arg0: tensor<?xf32>, %arg1: vector<2xindex>, %arg2: vector<2xi1>, %arg3: vector<2xf32>) -> vector<2xf32> {
    %c0 = arith.constant 0 : index
    %0 = vector.gather %arg0[%c0] [%arg1], %arg2, %arg3 : tensor<?xf32>, vector<2xindex>, vector<2xi1>, vector<2xf32> into vector<2xf32>
    return %0 : vector<2xf32>
  }
  func.func @gather_memref_non_unit_stride_read_1_element(%arg0: memref<4xf32, strided<[2]>>, %arg1: vector<1xindex>, %arg2: vector<1xi1>, %arg3: vector<1xf32>) -> vector<1xf32> {
    %c0 = arith.constant 0 : index
    %0 = vector.gather %arg0[%c0] [%arg1], %arg2, %arg3 : memref<4xf32, strided<[2]>>, vector<1xindex>, vector<1xi1>, vector<1xf32> into vector<1xf32>
    return %0 : vector<1xf32>
  }
  func.func @gather_memref_non_unit_stride_read_more_than_1_element(%arg0: memref<4xf32, strided<[2]>>, %arg1: vector<2xindex>, %arg2: vector<2xi1>, %arg3: vector<2xf32>) -> vector<2xf32> {
    %c0 = arith.constant 0 : index
    %0 = vector.gather %arg0[%c0] [%arg1], %arg2, %arg3 : memref<4xf32, strided<[2]>>, vector<2xindex>, vector<2xi1>, vector<2xf32> into vector<2xf32>
    return %0 : vector<2xf32>
  }
  func.func @gather_tensor_2d(%arg0: tensor<?x?xf32>, %arg1: vector<2x3xindex>, %arg2: vector<2x3xi1>, %arg3: vector<2x3xf32>) -> vector<2x3xf32> {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %0 = vector.gather %arg0[%c0, %c1] [%arg1], %arg2, %arg3 : tensor<?x?xf32>, vector<2x3xindex>, vector<2x3xi1>, vector<2x3xf32> into vector<2x3xf32>
    return %0 : vector<2x3xf32>
  }
  func.func @gather_tensor_1d_all_set(%arg0: tensor<?xf32>, %arg1: vector<2xindex>, %arg2: vector<2xf32>) -> vector<2xf32> {
    %cst = arith.constant dense<true> : vector<2xi1>
    %c0 = arith.constant 0 : index
    %0 = vector.gather %arg0[%c0] [%arg1], %cst, %arg2 : tensor<?xf32>, vector<2xindex>, vector<2xi1>, vector<2xf32> into vector<2xf32>
    return %0 : vector<2xf32>
  }
  func.func @gather_tensor_1d_none_set(%arg0: tensor<?xf32>, %arg1: vector<2xindex>, %arg2: vector<2xf32>) -> vector<2xf32> {
    %cst = arith.constant dense<false> : vector<2xi1>
    %c0 = arith.constant 0 : index
    %0 = vector.gather %arg0[%c0] [%arg1], %cst, %arg2 : tensor<?xf32>, vector<2xindex>, vector<2xi1>, vector<2xf32> into vector<2xf32>
    return %0 : vector<2xf32>
  }
  func.func @strided_gather(%arg0: memref<100x3xf32>, %arg1: vector<4xindex>, %arg2: index, %arg3: index) -> vector<4xf32> {
    %c0 = arith.constant 0 : index
    %0 = affine.apply #map()[%arg2]
    %subview = memref.subview %arg0[0, 0] [100, 1] [1, 1] : memref<100x3xf32> to memref<100xf32, strided<[3]>>
    %cst = arith.constant dense<true> : vector<4xi1>
    %cst_0 = arith.constant dense<0.000000e+00> : vector<4xf32>
    %1 = vector.gather %subview[%c0] [%arg1], %cst, %cst_0 {alignment = 8 : i64} : memref<100xf32, strided<[3]>>, vector<4xindex>, vector<4xi1>, vector<4xf32> into vector<4xf32>
    return %1 : vector<4xf32>
  }
  func.func @scalable_gather_1d(%arg0: tensor<?xf32>, %arg1: vector<[2]xindex>, %arg2: vector<[2]xi1>, %arg3: vector<[2]xf32>) -> vector<[2]xf32> {
    %c0 = arith.constant 0 : index
    %0 = vector.gather %arg0[%c0] [%arg1], %arg2, %arg3 : tensor<?xf32>, vector<[2]xindex>, vector<[2]xi1>, vector<[2]xf32> into vector<[2]xf32>
    return %0 : vector<[2]xf32>
  }
}

