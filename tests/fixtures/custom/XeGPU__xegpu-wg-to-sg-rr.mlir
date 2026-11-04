module {
  gpu.module @test_round_robin_assignment {
    gpu.func @create_nd_tdesc(%arg0: memref<256x128xf32>) {
      %0 = xegpu.create_nd_tdesc %arg0[0, 0] : memref<256x128xf32> -> !xegpu.tensor_desc<256x128xf32, #xegpu.layout<sg_layout = [8, 4], sg_data = [16, 16], lane_layout = [1, 16], lane_data = [1, 1]>>
      gpu.return
    }
    gpu.func @create_nd_tdesc_with_shared_data(%arg0: memref<256x128xf32>) {
      %0 = xegpu.create_nd_tdesc %arg0[0, 0] : memref<256x128xf32> -> !xegpu.tensor_desc<128x64xf32, #xegpu.layout<sg_layout = [8, 4], sg_data = [16, 64]>>
      gpu.return
    }
    gpu.func @load_nd_tdesc(%arg0: memref<256x128xf32>) {
      %0 = xegpu.create_nd_tdesc %arg0[0, 0] : memref<256x128xf32> -> !xegpu.tensor_desc<256x128xf32, #xegpu.layout<sg_layout = [8, 4], sg_data = [16, 16], lane_layout = [1, 16], lane_data = [1, 1]>>
      %1 = xegpu.load_nd %0 <{layout = #xegpu.layout<sg_layout = [8, 4], sg_data = [16, 16], lane_layout = [1, 16], lane_data = [1, 1]>}> : !xegpu.tensor_desc<256x128xf32, #xegpu.layout<sg_layout = [8, 4], sg_data = [16, 16], lane_layout = [1, 16], lane_data = [1, 1]>> -> vector<256x128xf32>
      gpu.return
    }
    gpu.func @store_nd(%arg0: memref<256x128xf32>) {
      %0 = xegpu.create_nd_tdesc %arg0[0, 0] : memref<256x128xf32> -> !xegpu.tensor_desc<256x128xf32, #xegpu.layout<sg_layout = [8, 4], sg_data = [16, 16], lane_layout = [1, 16], lane_data = [1, 1]>>
      %1 = xegpu.load_nd %0 <{layout = #xegpu.layout<sg_layout = [8, 4], sg_data = [16, 16], lane_layout = [1, 16], lane_data = [1, 1]>}> : !xegpu.tensor_desc<256x128xf32, #xegpu.layout<sg_layout = [8, 4], sg_data = [16, 16], lane_layout = [1, 16], lane_data = [1, 1]>> -> vector<256x128xf32>
      xegpu.store_nd %1, %0  : vector<256x128xf32>, !xegpu.tensor_desc<256x128xf32, #xegpu.layout<sg_layout = [8, 4], sg_data = [16, 16], lane_layout = [1, 16], lane_data = [1, 1]>>
      gpu.return
    }
    gpu.func @update_nd(%arg0: memref<256x128xf32>) {
      %0 = xegpu.create_nd_tdesc %arg0[0, 0] : memref<256x128xf32> -> !xegpu.tensor_desc<256x128xf32, #xegpu.layout<sg_layout = [8, 4], sg_data = [16, 16], lane_layout = [1, 16], lane_data = [1, 1]>>
      %1 = xegpu.update_nd_offset %0, [0, 16] : !xegpu.tensor_desc<256x128xf32, #xegpu.layout<sg_layout = [8, 4], sg_data = [16, 16], lane_layout = [1, 16], lane_data = [1, 1]>>
      gpu.return
    }
    gpu.func @dpas(%arg0: memref<256x128xf16>, %arg1: memref<128x256xf16>) {
      %0 = xegpu.create_nd_tdesc %arg0[0, 0] : memref<256x128xf16> -> !xegpu.tensor_desc<256x128xf16, #xegpu.layout<sg_layout = [8, 4], sg_data = [16, 16], lane_layout = [1, 16], lane_data = [1, 1]>>
      %1 = xegpu.load_nd %0 <{layout = #xegpu.layout<sg_layout = [8, 4], sg_data = [16, 16], lane_layout = [1, 16], lane_data = [1, 1]>}> : !xegpu.tensor_desc<256x128xf16, #xegpu.layout<sg_layout = [8, 4], sg_data = [16, 16], lane_layout = [1, 16], lane_data = [1, 1]>> -> vector<256x128xf16>
      %2 = xegpu.create_nd_tdesc %arg1[0, 0] : memref<128x256xf16> -> !xegpu.tensor_desc<128x256xf16, #xegpu.layout<sg_layout = [4, 8], sg_data = [16, 16], lane_layout = [1, 16], lane_data = [2, 1]>>
      %3 = xegpu.load_nd %2 <{layout = #xegpu.layout<sg_layout = [4, 8], sg_data = [16, 16], lane_layout = [1, 16], lane_data = [2, 1]>}> : !xegpu.tensor_desc<128x256xf16, #xegpu.layout<sg_layout = [4, 8], sg_data = [16, 16], lane_layout = [1, 16], lane_data = [2, 1]>> -> vector<128x256xf16>
      %4 = xegpu.dpas %1, %3 {layout_a = #xegpu.layout<sg_layout = [8, 4], sg_data = [16, 16], lane_layout = [1, 16], lane_data = [1, 1]>, layout_b = #xegpu.layout<sg_layout = [4, 8], sg_data = [16, 16], lane_layout = [1, 16], lane_data = [2, 1]>, layout_cd = #xegpu.layout<sg_layout = [8, 8], sg_data = [16, 16], lane_layout = [1, 16], lane_data = [1, 1]>} : vector<256x128xf16>, vector<128x256xf16> -> vector<256x256xf32>
      gpu.return
    }
    gpu.func @prefetch_nd_tdesc(%arg0: memref<256x128xf32>) {
      %0 = xegpu.create_nd_tdesc %arg0[0, 0] : memref<256x128xf32> -> !xegpu.tensor_desc<256x128xf32, #xegpu.layout<sg_layout = [8, 4], sg_data = [16, 16], lane_layout = [1, 16], lane_data = [1, 1]>>
      xegpu.prefetch_nd %0  : !xegpu.tensor_desc<256x128xf32, #xegpu.layout<sg_layout = [8, 4], sg_data = [16, 16], lane_layout = [1, 16], lane_data = [1, 1]>>
      gpu.return
    }
    gpu.func @broadcast(%arg0: memref<128x1xf32>) {
      %0 = xegpu.create_nd_tdesc %arg0[0, 0] : memref<128x1xf32> -> !xegpu.tensor_desc<128x1xf32, #xegpu.layout<sg_layout = [4, 1], sg_data = [16, 1], lane_layout = [8, 1], lane_data = [1, 1]>>
      %1 = xegpu.load_nd %0 <{layout = #xegpu.layout<sg_layout = [4, 1], sg_data = [16, 1], lane_layout = [8, 1], lane_data = [1, 1]>}> : !xegpu.tensor_desc<128x1xf32, #xegpu.layout<sg_layout = [4, 1], sg_data = [16, 1], lane_layout = [8, 1], lane_data = [1, 1]>> -> vector<128x1xf32>
      %2 = vector.broadcast %1 {layout_result_0 = #xegpu.layout<sg_layout = [4, 1], sg_data = [16, 32], lane_layout = [8, 1], lane_data = [1, 1]>} : vector<128x1xf32> to vector<128x64xf32>
      gpu.return
    }
    gpu.func @scf_for(%arg0: memref<1024xf32>, %arg1: memref<1024xf32>) {
      %c1 = arith.constant 1 : index
      %c10 = arith.constant 10 : index
      %c0 = arith.constant 0 : index
      %c256 = arith.constant 256 : index
      %c1024 = arith.constant 1024 : index
      %0 = xegpu.create_nd_tdesc %arg0[0] : memref<1024xf32> -> !xegpu.tensor_desc<256xf32, #xegpu.layout<sg_layout = [8], sg_data = [16]>>
      %1 = xegpu.create_nd_tdesc %arg1[0] : memref<1024xf32> -> !xegpu.tensor_desc<256xf32, #xegpu.layout<sg_layout = [8], sg_data = [16]>>
      %2:2 = scf.for %arg2 = %c0 to %c1024 step %c256 iter_args(%arg3 = %0, %arg4 = %1) -> (!xegpu.tensor_desc<256xf32, #xegpu.layout<sg_layout = [8], sg_data = [16]>>, !xegpu.tensor_desc<256xf32, #xegpu.layout<sg_layout = [8], sg_data = [16]>>) {
        %3 = xegpu.load_nd %0 <{layout = #xegpu.layout<sg_layout = [8], sg_data = [16]>}> : !xegpu.tensor_desc<256xf32, #xegpu.layout<sg_layout = [8], sg_data = [16]>> -> vector<256xf32>
        xegpu.store_nd %3, %arg3  : vector<256xf32>, !xegpu.tensor_desc<256xf32, #xegpu.layout<sg_layout = [8], sg_data = [16]>>
        %4 = xegpu.update_nd_offset %arg3, [256] : !xegpu.tensor_desc<256xf32, #xegpu.layout<sg_layout = [8], sg_data = [16]>>
        %5 = xegpu.update_nd_offset %arg4, [256] : !xegpu.tensor_desc<256xf32, #xegpu.layout<sg_layout = [8], sg_data = [16]>>
        scf.yield %4, %5 : !xegpu.tensor_desc<256xf32, #xegpu.layout<sg_layout = [8], sg_data = [16]>>, !xegpu.tensor_desc<256xf32, #xegpu.layout<sg_layout = [8], sg_data = [16]>>
      }
      gpu.return
    }
    gpu.func @scf_while_and_condition(%arg0: memref<1024xf32>, %arg1: memref<1024xf32>) {
      %c1_i32 = arith.constant 1 : i32
      %c10_i32 = arith.constant 10 : i32
      %c0_i32 = arith.constant 0 : i32
      %0 = xegpu.create_nd_tdesc %arg0[0] : memref<1024xf32> -> !xegpu.tensor_desc<256xf32, #xegpu.layout<sg_layout = [8], sg_data = [16]>>
      %1 = xegpu.load_nd %0 <{layout = #xegpu.layout<sg_layout = [8], sg_data = [16]>}> : !xegpu.tensor_desc<256xf32, #xegpu.layout<sg_layout = [8], sg_data = [16]>> -> vector<256xf32>
      %2 = xegpu.create_nd_tdesc %arg1[0] : memref<1024xf32> -> !xegpu.tensor_desc<256xf32, #xegpu.layout<sg_layout = [8], sg_data = [16]>>
      %3:2 = scf.while (%arg2 = %1, %arg3 = %c0_i32) : (vector<256xf32>, i32) -> (vector<256xf32>, i32) {
        %4 = arith.cmpi slt, %arg3, %c10_i32 : i32
        scf.condition(%4) %arg2, %arg3 : vector<256xf32>, i32
      } do {
      ^bb0(%arg2: vector<256xf32>, %arg3: i32):
        xegpu.store_nd %arg2, %2  : vector<256xf32>, !xegpu.tensor_desc<256xf32, #xegpu.layout<sg_layout = [8], sg_data = [16]>>
        %4 = arith.addi %arg3, %c1_i32 : i32
        %5 = xegpu.update_nd_offset %0, [256] : !xegpu.tensor_desc<256xf32, #xegpu.layout<sg_layout = [8], sg_data = [16]>>
        %6 = xegpu.load_nd %5 <{layout = #xegpu.layout<sg_layout = [8], sg_data = [16]>}> : !xegpu.tensor_desc<256xf32, #xegpu.layout<sg_layout = [8], sg_data = [16]>> -> vector<256xf32>
        scf.yield %6, %4 : vector<256xf32>, i32
      }
      gpu.return
    }
    gpu.func @scf_if(%arg0: memref<1024xf32>, %arg1: memref<1024xf32>) {
      %c10 = arith.constant 10 : index
      %0 = gpu.subgroup_id : index
      %1 = xegpu.create_nd_tdesc %arg0[0] : memref<1024xf32> -> !xegpu.tensor_desc<256xf32, #xegpu.layout<sg_layout = [8], sg_data = [16]>>
      %2 = xegpu.create_nd_tdesc %arg1[0] : memref<1024xf32> -> !xegpu.tensor_desc<256xf32, #xegpu.layout<sg_layout = [8], sg_data = [16]>>
      %3 = arith.cmpi eq, %0, %c10 : index
      %4 = scf.if %3 -> (vector<256xf32>) {
        %5 = xegpu.load_nd %1 <{layout = #xegpu.layout<sg_layout = [8], sg_data = [16]>}> : !xegpu.tensor_desc<256xf32, #xegpu.layout<sg_layout = [8], sg_data = [16]>> -> vector<256xf32>
        scf.yield %5 : vector<256xf32>
      } else {
        %5 = xegpu.load_nd %2 <{layout = #xegpu.layout<sg_layout = [8], sg_data = [16]>}> : !xegpu.tensor_desc<256xf32, #xegpu.layout<sg_layout = [8], sg_data = [16]>> -> vector<256xf32>
        scf.yield %5 : vector<256xf32>
      } {layout_result_0 = #xegpu.layout<sg_layout = [8], sg_data = [16]>}
      xegpu.store_nd %4, %1  : vector<256xf32>, !xegpu.tensor_desc<256xf32, #xegpu.layout<sg_layout = [8], sg_data = [16]>>
      gpu.return
    }
    gpu.func @scf_if_tensor_desc(%arg0: memref<1024xf32>, %arg1: memref<1024xf32>) {
      %c10 = arith.constant 10 : index
      %0 = gpu.subgroup_id : index
      %1 = xegpu.create_nd_tdesc %arg0[0] : memref<1024xf32> -> !xegpu.tensor_desc<256xf32, #xegpu.layout<sg_layout = [8], sg_data = [16]>>
      %2 = xegpu.load_nd %1 <{layout = #xegpu.layout<sg_layout = [8], sg_data = [16]>}> : !xegpu.tensor_desc<256xf32, #xegpu.layout<sg_layout = [8], sg_data = [16]>> -> vector<256xf32>
      %3 = arith.cmpi eq, %0, %c10 : index
      %4 = scf.if %3 -> (!xegpu.tensor_desc<256xf32, #xegpu.layout<sg_layout = [8], sg_data = [16]>>) {
        %5 = xegpu.create_nd_tdesc %arg0[0] : memref<1024xf32> -> !xegpu.tensor_desc<256xf32, #xegpu.layout<sg_layout = [8], sg_data = [16]>>
        scf.yield %5 : !xegpu.tensor_desc<256xf32, #xegpu.layout<sg_layout = [8], sg_data = [16]>>
      } else {
        %5 = xegpu.create_nd_tdesc %arg1[0] : memref<1024xf32> -> !xegpu.tensor_desc<256xf32, #xegpu.layout<sg_layout = [8], sg_data = [16]>>
        scf.yield %5 : !xegpu.tensor_desc<256xf32, #xegpu.layout<sg_layout = [8], sg_data = [16]>>
      }
      xegpu.store_nd %2, %4  : vector<256xf32>, !xegpu.tensor_desc<256xf32, #xegpu.layout<sg_layout = [8], sg_data = [16]>>
      gpu.return
    }
    gpu.func @convert_layout_optimal(%arg0: memref<32x64xf32>) {
      %0 = xegpu.create_nd_tdesc %arg0[0, 0] : memref<32x64xf32> -> !xegpu.tensor_desc<32x64xf32, #xegpu.layout<sg_layout = [2, 2], sg_data = [16, 16], inst_data = [16, 16]>>
      %1 = xegpu.load_nd %0 <{layout = #xegpu.layout<sg_layout = [2, 2], sg_data = [16, 16], inst_data = [16, 16]>}> : !xegpu.tensor_desc<32x64xf32, #xegpu.layout<sg_layout = [2, 2], sg_data = [16, 16], inst_data = [16, 16]>> -> vector<32x64xf32>
      %2 = xegpu.convert_layout %1 <{input_layout = #xegpu.layout<sg_layout = [2, 2], sg_data = [16, 16], inst_data = [16, 16]>, target_layout = #xegpu.layout<sg_layout = [2, 2], sg_data = [16, 16], inst_data = [8, 16]>}> : vector<32x64xf32>
      gpu.return
    }
  }
}

