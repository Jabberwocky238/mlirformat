module {
  gpu.module @test {
    func.func @test_load_nd_with_extract_slice(%arg0: memref<4096x4096xf16>) -> vector<16x16xf16> {
      %c0 = arith.constant 0 : index
      %0 = xegpu.create_nd_tdesc %arg0 : memref<4096x4096xf16> -> !xegpu.tensor_desc<32x32xf16>
      %1 = xegpu.load_nd %0[%c0, %c0]  : !xegpu.tensor_desc<32x32xf16> -> vector<32x32xf16>
      %2 = vector.extract_strided_slice %1 {offsets = [0, 0], sizes = [16, 16], strides = [1, 1]} : vector<32x32xf16> to vector<16x16xf16>
      return %2 : vector<16x16xf16>
    }
  }
}

// -----
module {
  gpu.module @test {
    func.func @test_load_nd_with_second_extract(%arg0: memref<4096x4096xf16>) -> vector<16x16xf16> {
      %c0 = arith.constant 0 : index
      %0 = xegpu.create_nd_tdesc %arg0 : memref<4096x4096xf16> -> !xegpu.tensor_desc<32x32xf16>
      %1 = xegpu.load_nd %0[%c0, %c0]  : !xegpu.tensor_desc<32x32xf16> -> vector<32x32xf16>
      %2 = vector.extract_strided_slice %1 {offsets = [0, 16], sizes = [16, 16], strides = [1, 1]} : vector<32x32xf16> to vector<16x16xf16>
      return %2 : vector<16x16xf16>
    }
  }
}

// -----
module {
  gpu.module @test {
    func.func @test_prefetch_nd_32x32(%arg0: memref<4096x4096xf16>) {
      %c0 = arith.constant 0 : index
      %0 = xegpu.create_nd_tdesc %arg0 : memref<4096x4096xf16> -> !xegpu.tensor_desc<32x32xf16>
      xegpu.prefetch_nd %0[%c0, %c0]  : !xegpu.tensor_desc<32x32xf16>
      return
    }
  }
}

// -----
module {
  gpu.module @test {
    func.func @test_no_optimization_16x16(%arg0: memref<4096x4096xf16>) -> vector<16x16xf16> {
      %c0 = arith.constant 0 : index
      %0 = xegpu.create_nd_tdesc %arg0 : memref<4096x4096xf16> -> !xegpu.tensor_desc<16x16xf16>
      %1 = xegpu.load_nd %0[%c0, %c0]  : !xegpu.tensor_desc<16x16xf16> -> vector<16x16xf16>
      return %1 : vector<16x16xf16>
    }
  }
}

// -----
module {
  gpu.module @test {
    func.func @test_no_optimization_with_transpose(%arg0: memref<4096x4096xf32>) -> vector<32x32xf32> {
      %c0 = arith.constant 0 : index
      %0 = xegpu.create_nd_tdesc %arg0 : memref<4096x4096xf32> -> !xegpu.tensor_desc<32x32xf32>
      %1 = xegpu.load_nd %0[%c0, %c0] <{transpose = array<i64: 1, 0>}> : !xegpu.tensor_desc<32x32xf32> -> vector<32x32xf32>
      return %1 : vector<32x32xf32>
    }
  }
}

// -----
module {
  gpu.module @test {
    func.func @test_multiple_extracts(%arg0: memref<4096x4096xf16>) -> (vector<16x16xf16>, vector<16x16xf16>, vector<16x16xf16>, vector<16x16xf16>) {
      %c0 = arith.constant 0 : index
      %0 = xegpu.create_nd_tdesc %arg0 : memref<4096x4096xf16> -> !xegpu.tensor_desc<32x32xf16>
      %1 = xegpu.load_nd %0[%c0, %c0]  : !xegpu.tensor_desc<32x32xf16> -> vector<32x32xf16>
      %2 = vector.extract_strided_slice %1 {offsets = [0, 0], sizes = [16, 16], strides = [1, 1]} : vector<32x32xf16> to vector<16x16xf16>
      %3 = vector.extract_strided_slice %1 {offsets = [0, 16], sizes = [16, 16], strides = [1, 1]} : vector<32x32xf16> to vector<16x16xf16>
      %4 = vector.extract_strided_slice %1 {offsets = [16, 0], sizes = [16, 16], strides = [1, 1]} : vector<32x32xf16> to vector<16x16xf16>
      %5 = vector.extract_strided_slice %1 {offsets = [16, 16], sizes = [16, 16], strides = [1, 1]} : vector<32x32xf16> to vector<16x16xf16>
      return %2, %3, %4, %5 : vector<16x16xf16>, vector<16x16xf16>, vector<16x16xf16>, vector<16x16xf16>
    }
  }
}

// -----
module {
  gpu.module @test {
    func.func @test_pointer_source(%arg0: i64) -> vector<16x16xf16> {
      %c0 = arith.constant 0 : index
      %0 = xegpu.create_nd_tdesc %arg0, shape : [64, 64], strides : [64, 1] : i64 -> !xegpu.tensor_desc<32x32xf16, #xegpu.block_tdesc_attr<boundary_check = false>>
      %1 = xegpu.load_nd %0[%c0, %c0]  : !xegpu.tensor_desc<32x32xf16, #xegpu.block_tdesc_attr<boundary_check = false>> -> vector<32x32xf16>
      %2 = vector.extract_strided_slice %1 {offsets = [0, 16], sizes = [16, 16], strides = [1, 1]} : vector<32x32xf16> to vector<16x16xf16>
      return %2 : vector<16x16xf16>
    }
  }
}

// -----
module {
  gpu.module @test {
    func.func @test_dynamic_memref_source(%arg0: memref<?x?xf16>, %arg1: index, %arg2: index) -> vector<16x16xf16> {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %0 = xegpu.create_nd_tdesc %arg0, shape : [%arg1, %arg2], strides : [%arg2, %c1] : memref<?x?xf16> -> !xegpu.tensor_desc<32x32xf16>
      %1 = xegpu.load_nd %0[%c0, %c0]  : !xegpu.tensor_desc<32x32xf16> -> vector<32x32xf16>
      %2 = vector.extract_strided_slice %1 {offsets = [0, 0], sizes = [16, 16], strides = [1, 1]} : vector<32x32xf16> to vector<16x16xf16>
      return %2 : vector<16x16xf16>
    }
  }
}

