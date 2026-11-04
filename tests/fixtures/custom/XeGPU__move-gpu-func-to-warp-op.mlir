module {
  gpu.module @test {
    gpu.func @empty() {
      gpu.return
    }
  }
}

// -----
module {
  gpu.module @test {
    gpu.func @gemm(%arg0: memref<8x16xf16>, %arg1: memref<16x16xf16>, %arg2: memref<8x16xf32>) {
      %c0 = arith.constant 0 : index
      %0 = xegpu.create_nd_tdesc %arg0 : memref<8x16xf16> -> !xegpu.tensor_desc<8x16xf16>
      %1 = xegpu.create_nd_tdesc %arg1 : memref<16x16xf16> -> !xegpu.tensor_desc<16x16xf16>
      %2 = xegpu.load_nd %0[%c0, %c0]  : !xegpu.tensor_desc<8x16xf16> -> vector<8x16xf16>
      %3 = xegpu.load_nd %1[%c0, %c0]  : !xegpu.tensor_desc<16x16xf16> -> vector<16x16xf16>
      %4 = xegpu.dpas %2, %3 : vector<8x16xf16>, vector<16x16xf16> -> vector<8x16xf32>
      %5 = xegpu.create_nd_tdesc %arg2 : memref<8x16xf32> -> !xegpu.tensor_desc<8x16xf32>
      xegpu.store_nd %4, %5[%c0, %c0]  : vector<8x16xf32>, !xegpu.tensor_desc<8x16xf32>
      gpu.return
    }
  }
}

// -----
module {
  gpu.module @test {
    gpu.func @already_in_warp_op() {
      %0 = gpu.lane_id
      gpu.warp_execute_on_lane_0(%0)[16] {
        "some_op"() : () -> ()
      }
      gpu.return
    }
  }
}

