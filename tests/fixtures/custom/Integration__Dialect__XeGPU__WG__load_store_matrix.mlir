module {
  gpu.module @test {
    gpu.func @test_load_store_matrix_1d(%arg0: memref<8192xi8, 3>) {
      %c0 = arith.constant 0 : index
      %0 = xegpu.create_mem_desc %arg0 : memref<8192xi8, 3> -> !xegpu.mem_desc<4096xbf16>
      %1 = xegpu.load_matrix %0[%c0] <{layout = #xegpu.layout<sg_layout = [16], sg_data = [256], inst_data = [16], lane_layout = [16], lane_data = [1]>}>: !xegpu.mem_desc<4096xbf16>, index -> vector<4096xbf16>
      xegpu.store_matrix %1, %0[%c0] <{layout = #xegpu.layout<sg_layout = [16], sg_data = [256], inst_data = [16], lane_layout = [16], lane_data = [1]>}>: vector<4096xbf16>, !xegpu.mem_desc<4096xbf16>, index
      gpu.return
    }
    gpu.func @test_load_store_matrix_2d(%arg0: memref<16384xi8, 3>) {
      %c0 = arith.constant 0 : index
      %0 = xegpu.create_mem_desc %arg0 : memref<16384xi8, 3> -> !xegpu.mem_desc<64x128xbf16>
      %1 = xegpu.load_matrix %0[%c0, %c0] <{layout = #xegpu.layout<sg_layout = [4, 4], sg_data = [16, 32], inst_data = [1, 16], lane_layout = [1, 16], lane_data = [1, 1]>}>: !xegpu.mem_desc<64x128xbf16>, index, index -> vector<64x128xbf16>
      xegpu.store_matrix %1, %0[%c0, %c0] <{layout = #xegpu.layout<sg_layout = [4, 4], sg_data = [16, 32], inst_data = [1, 16], lane_layout = [1, 16], lane_data = [1, 1]>}>: vector<64x128xbf16>, !xegpu.mem_desc<64x128xbf16>, index, index
      gpu.return
    }
  }
}

