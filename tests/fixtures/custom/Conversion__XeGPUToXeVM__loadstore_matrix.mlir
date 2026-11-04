module {
  gpu.module @test_kernel [#xevm.target<chip = "pvc">] {
    gpu.func @load_store_matrix_plain(%arg0: memref<4096xi8, 3>) -> f32 {
      %0 = xegpu.create_mem_desc %arg0 : memref<4096xi8, 3> -> !xegpu.mem_desc<32x32xf32>
      %thread_id_x = gpu.thread_id  x
      %c0 = arith.constant 0 : index
      %1 = xegpu.load_matrix %0[%c0, %thread_id_x] : !xegpu.mem_desc<32x32xf32>, index, index -> f32
      xegpu.store_matrix %1, %0[%c0, %thread_id_x] : f32, !xegpu.mem_desc<32x32xf32>, index, index
      gpu.return %1 : f32
    }
    gpu.func @load_store_matrix_plain_2d_input(%arg0: memref<1024xi8, 3>) -> f32 {
      %c0 = arith.constant 0 : index
      %view = memref.view %arg0[%c0][] : memref<1024xi8, 3> to memref<64x32xf32, 3>
      %subview = memref.subview %view[32, 0] [32, 32] [1, 1] : memref<64x32xf32, 3> to memref<32x32xf32, strided<[32, 1], offset: 1024>, 3>
      %0 = xegpu.create_mem_desc %subview : memref<32x32xf32, strided<[32, 1], offset: 1024>, 3> -> !xegpu.mem_desc<32x32xf32>
      %thread_id_x = gpu.thread_id  x
      %1 = xegpu.load_matrix %0[%c0, %thread_id_x] : !xegpu.mem_desc<32x32xf32>, index, index -> f32
      xegpu.store_matrix %1, %0[%c0, %thread_id_x] : f32, !xegpu.mem_desc<32x32xf32>, index, index
      gpu.return %1 : f32
    }
    gpu.func @load_store_matrix_blocked_strided(%arg0: memref<4096xi8, 3>) -> f16 {
      %0 = xegpu.create_mem_desc %arg0 : memref<4096xi8, 3> -> !xegpu.mem_desc<32x64xf16, #xegpu.mem_layout<block = [16, 16], stride = [1, 32]>>
      %thread_id_x = gpu.thread_id  x
      %c13 = arith.constant 13 : index
      %1 = xegpu.load_matrix %0[%c13, %thread_id_x] : !xegpu.mem_desc<32x64xf16, #xegpu.mem_layout<block = [16, 16], stride = [1, 32]>>, index, index -> f16
      xegpu.store_matrix %1, %0[%c13, %thread_id_x] : f16, !xegpu.mem_desc<32x64xf16, #xegpu.mem_layout<block = [16, 16], stride = [1, 32]>>, index, index
      gpu.return %1 : f16
    }
    gpu.func @load_store_matrix_blocked_nostride(%arg0: memref<4096xi8, 3>) -> f16 {
      %0 = xegpu.create_mem_desc %arg0 : memref<4096xi8, 3> -> !xegpu.mem_desc<32x64xf16, #xegpu.mem_layout<block = [16, 16]>>
      %thread_id_x = gpu.thread_id  x
      %c19 = arith.constant 19 : index
      %1 = xegpu.load_matrix %0[%c19, %thread_id_x] : !xegpu.mem_desc<32x64xf16, #xegpu.mem_layout<block = [16, 16]>>, index, index -> f16
      xegpu.store_matrix %1, %0[%c19, %thread_id_x] : f16, !xegpu.mem_desc<32x64xf16, #xegpu.mem_layout<block = [16, 16]>>, index, index
      gpu.return %1 : f16
    }
    gpu.func @load_store_matrix_blocked_strided_return_vector(%arg0: memref<4096xi8, 3>) -> vector<8xf16> {
      %0 = xegpu.create_mem_desc %arg0 : memref<4096xi8, 3> -> !xegpu.mem_desc<32x64xf16, #xegpu.mem_layout<block = [16, 16], stride = [1, 32]>>
      %thread_id_x = gpu.thread_id  x
      %c16 = arith.constant 16 : index
      %1 = xegpu.load_matrix %0[%c16, %thread_id_x] : !xegpu.mem_desc<32x64xf16, #xegpu.mem_layout<block = [16, 16], stride = [1, 32]>>, index, index -> vector<8xf16>
      xegpu.store_matrix %1, %0[%c16, %thread_id_x] : vector<8xf16>, !xegpu.mem_desc<32x64xf16, #xegpu.mem_layout<block = [16, 16], stride = [1, 32]>>, index, index
      gpu.return %1 : vector<8xf16>
    }
    gpu.func @load_store_matrix_blocked_subgroupblockio(%arg0: memref<4096xi8, 3>) -> vector<8xf16> {
      %0 = xegpu.create_mem_desc %arg0 : memref<4096xi8, 3> -> !xegpu.mem_desc<32x64xf16, #xegpu.mem_layout<block = [16, 16]>>
      %c16 = arith.constant 16 : index
      %c48 = arith.constant 48 : index
      %1 = xegpu.load_matrix %0[%c16, %c48] <{subgroup_block_io}>: !xegpu.mem_desc<32x64xf16, #xegpu.mem_layout<block = [16, 16]>>, index, index -> vector<8xf16>
      xegpu.store_matrix %1, %0[%c16, %c48] <{subgroup_block_io}>: vector<8xf16>, !xegpu.mem_desc<32x64xf16, #xegpu.mem_layout<block = [16, 16]>>, index, index
      gpu.return %1 : vector<8xf16>
    }
    gpu.func @matrix_vector_materialization(%arg0: !xegpu.mem_desc<32x64xf16, #xegpu.mem_layout<block = [16, 16]>>) {
      %0 = xegpu.load_matrix %arg0[16, 0] : !xegpu.mem_desc<32x64xf16, #xegpu.mem_layout<block = [16, 16]>> -> vector<1x16xf16>
      %1 = arith.addf %0, %0 : vector<1x16xf16>
      xegpu.store_matrix %1, %arg0[16, 0] : vector<1x16xf16>, !xegpu.mem_desc<32x64xf16, #xegpu.mem_layout<block = [16, 16]>>
      gpu.return
    }
    gpu.func @create_memdesc_from_subview(%arg0: memref<256x16xbf16, 3>) -> vector<1x16xbf16> {
      %c0 = arith.constant 0 : index
      %subview = memref.subview %arg0[64, 0] [1, 16] [1, 1] : memref<256x16xbf16, 3> to memref<1x16xbf16, strided<[16, 1], offset: 1024>, 3>
      %0 = xegpu.create_mem_desc %subview : memref<1x16xbf16, strided<[16, 1], offset: 1024>, 3> -> !xegpu.mem_desc<1x16xbf16>
      %1 = xegpu.load_matrix %0[%c0, %c0] : !xegpu.mem_desc<1x16xbf16>, index, index -> vector<1x16xbf16>
      gpu.return %1 : vector<1x16xbf16>
    }
  }
}

