module {
  func.func @test_vector_insert_2d_idx(%arg0: vector<2x8x4xf32>, %arg1: vector<4xf32>) -> vector<2x8x4xf32> {
    %0 = vector.insert %arg1, %arg0 [0, 3] : vector<4xf32> into vector<2x8x4xf32>
    return %0 : vector<2x8x4xf32>
  }
}

// -----
module {
  func.func @test_vector_transpose(%arg0: vector<2x8xf32>) -> vector<8x2xf32> {
    %0 = vector.transpose %arg0, [1, 0] : vector<2x8xf32> to vector<8x2xf32>
    return %0 : vector<8x2xf32>
  }
}

// -----
module {
  func.func @test_vector_transpose_16x16(%arg0: vector<16x16xf32>) -> vector<16x16xf32> {
    %0 = vector.transpose %arg0, [1, 0] : vector<16x16xf32> to vector<16x16xf32>
    return %0 : vector<16x16xf32>
  }
}

// -----
module {
  func.func @test_vector_store_load_4x4_f16(%arg0: memref<4x4xf16>) {
    %c0 = arith.constant 0 : index
    %0 = vector.load %arg0[%c0, %c0] : memref<4x4xf16>, vector<4x4xf16>
    vector.store %0, %arg0[%c0, %c0] : memref<4x4xf16>, vector<4x4xf16>
    return
  }
}

// -----
module {
  func.func @test_vector_store_load_4x4x4(%arg0: memref<4x4x4xf32>) {
    %c0 = arith.constant 0 : index
    %0 = vector.load %arg0[%c0, %c0, %c0] : memref<4x4x4xf32>, vector<4x4x4xf32>
    vector.store %0, %arg0[%c0, %c0, %c0] : memref<4x4x4xf32>, vector<4x4x4xf32>
    return
  }
}

// -----
module {
  func.func @test_linearize_index(%arg0: vector<2x2xindex>, %arg1: vector<2x2xi32>) -> vector<2x2xindex> {
    %cst = arith.constant dense<[[0, 1], [2, 3]]> : vector<2x2xindex>
    %0 = arith.addi %arg0, %cst : vector<2x2xindex>
    %1 = arith.index_cast %0 : vector<2x2xindex> to vector<2x2xi32>
    %2 = arith.muli %1, %arg1 : vector<2x2xi32>
    %3 = arith.index_cast %2 : vector<2x2xi32> to vector<2x2xindex>
    return %3 : vector<2x2xindex>
  }
}

// -----
module {
  func.func @broadcast_stretch_at_start(%arg0: vector<1x4xf32>) -> vector<3x4xf32> {
    %0 = vector.broadcast %arg0 : vector<1x4xf32> to vector<3x4xf32>
    return %0 : vector<3x4xf32>
  }
}

// -----
module {
  func.func @broadcast_stretch_at_end(%arg0: vector<4x1xf32>) -> vector<4x3xf32> {
    %0 = vector.broadcast %arg0 : vector<4x1xf32> to vector<4x3xf32>
    return %0 : vector<4x3xf32>
  }
}

// -----
module {
  func.func @broadcast_stretch_in_middle(%arg0: vector<4x1x2xf32>) -> vector<4x3x2xf32> {
    %0 = vector.broadcast %arg0 : vector<4x1x2xf32> to vector<4x3x2xf32>
    return %0 : vector<4x3x2xf32>
  }
  func.func @gather_memref_2d(%arg0: memref<?x?xf32>, %arg1: vector<2x3xindex>, %arg2: vector<2x3xi1>, %arg3: vector<2x3xf32>) -> vector<2x3xf32> {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %0 = vector.gather %arg0[%c0, %c1] [%arg1], %arg2, %arg3 : memref<?x?xf32>, vector<2x3xindex>, vector<2x3xi1>, vector<2x3xf32> into vector<2x3xf32>
    return %0 : vector<2x3xf32>
  }
}

// -----
module {
  gpu.module @test_kernel {
    gpu.func @test_kernel(%arg0: memref<8x16xf16>, %arg1: memref<16x16xf16>, %arg2: memref<8x16xf32>) kernel {
      %c0 = arith.constant 0 : index
      %cst = arith.constant dense<0.000000e+00> : vector<8x8xf16>
      %cst_0 = arith.constant dense<0.000000e+00> : vector<8x8xf16>
      %cst_1 = arith.constant dense<5.000000e+00> : vector<8x8xf32>
      %0 = xegpu.create_nd_tdesc %arg0 : memref<8x16xf16> -> !xegpu.tensor_desc<8x16xf16>
      %1 = xegpu.load_nd %0[0, 0]  : !xegpu.tensor_desc<8x16xf16> -> vector<8x16xf16>
      %2 = vector.insert_strided_slice %cst, %1 {offsets = [0, 0], sizes = [8, 8], strides = [1, 1]} : vector<8x8xf16> into vector<8x16xf16>
      %3 = xegpu.create_nd_tdesc %arg1 : memref<16x16xf16> -> !xegpu.tensor_desc<16x16xf16>
      %4 = xegpu.load_nd %3[0, 0]  : !xegpu.tensor_desc<16x16xf16> -> vector<16x16xf16>
      %5 = vector.insert_strided_slice %cst_0, %4 {offsets = [0, 0], sizes = [8, 8], strides = [1, 1]} : vector<8x8xf16> into vector<16x16xf16>
      %6 = xegpu.dpas %2, %5 : vector<8x16xf16>, vector<16x16xf16> -> vector<8x16xf32>
      %7 = vector.extract_strided_slice %6 {offsets = [0, 0], sizes = [8, 8], strides = [1, 1]} : vector<8x16xf32> to vector<8x8xf32>
      %8 = arith.addf %7, %cst_1 : vector<8x8xf32>
      %9 = vector.insert_strided_slice %8, %6 {offsets = [0, 0], sizes = [8, 8], strides = [1, 1]} : vector<8x8xf32> into vector<8x16xf32>
      %10 = xegpu.create_nd_tdesc %arg2 : memref<8x16xf32> -> !xegpu.tensor_desc<8x16xf32>
      xegpu.store_nd %9, %10[0, 0]  : vector<8x16xf32>, !xegpu.tensor_desc<8x16xf32>
      gpu.return
    }
  }
}

