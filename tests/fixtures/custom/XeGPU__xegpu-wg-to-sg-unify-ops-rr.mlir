module {
  gpu.module @test_distribution {
    gpu.func @create_nd_tdesc_no_offset(%arg0: memref<256x128xf32>) {
      %0 = xegpu.create_nd_tdesc %arg0 : memref<256x128xf32> -> !xegpu.tensor_desc<256x128xf32, #xegpu.layout<sg_layout = [8, 4], sg_data = [16, 16], lane_layout = [1, 16], lane_data = [1, 1]>>
      gpu.return
    }
    gpu.func @load_nd_tdesc_with_offset(%arg0: memref<256x128xf32>) {
      %0 = xegpu.create_nd_tdesc %arg0 : memref<256x128xf32> -> !xegpu.tensor_desc<256x128xf32, #xegpu.layout<sg_layout = [8, 4], sg_data = [16, 16], lane_layout = [1, 16], lane_data = [1, 1]>>
      %1 = xegpu.load_nd %0[0, 0] <{layout = #xegpu.layout<sg_layout = [8, 4], sg_data = [16, 16], lane_layout = [1, 16], lane_data = [1, 1]>}> : !xegpu.tensor_desc<256x128xf32, #xegpu.layout<sg_layout = [8, 4], sg_data = [16, 16], lane_layout = [1, 16], lane_data = [1, 1]>> -> vector<256x128xf32>
      gpu.return
    }
    gpu.func @store_nd_with_offset(%arg0: memref<256x128xf32>) {
      %0 = xegpu.create_nd_tdesc %arg0 : memref<256x128xf32> -> !xegpu.tensor_desc<256x128xf32, #xegpu.layout<sg_layout = [8, 4], sg_data = [16, 16], lane_layout = [1, 16], lane_data = [1, 1]>>
      %1 = xegpu.load_nd %0[0, 0] <{layout = #xegpu.layout<sg_layout = [8, 4], sg_data = [16, 16], lane_layout = [1, 16], lane_data = [1, 1]>}> : !xegpu.tensor_desc<256x128xf32, #xegpu.layout<sg_layout = [8, 4], sg_data = [16, 16], lane_layout = [1, 16], lane_data = [1, 1]>> -> vector<256x128xf32>
      xegpu.store_nd %1, %0[0, 0]  : vector<256x128xf32>, !xegpu.tensor_desc<256x128xf32, #xegpu.layout<sg_layout = [8, 4], sg_data = [16, 16], lane_layout = [1, 16], lane_data = [1, 1]>>
      gpu.return
    }
    gpu.func @prefetch_nd_tdesc_with_offset(%arg0: memref<256x128xf32>) {
      %0 = xegpu.create_nd_tdesc %arg0 : memref<256x128xf32> -> !xegpu.tensor_desc<256x128xf32, #xegpu.layout<sg_layout = [8, 4], sg_data = [16, 16], lane_layout = [1, 16], lane_data = [1, 1]>>
      xegpu.prefetch_nd %0[0, 0]  : !xegpu.tensor_desc<256x128xf32, #xegpu.layout<sg_layout = [8, 4], sg_data = [16, 16], lane_layout = [1, 16], lane_data = [1, 1]>>
      gpu.return
    }
    gpu.func @dpas(%arg0: memref<256x128xf16>, %arg1: memref<128x256xf16>) {
      %0 = xegpu.create_nd_tdesc %arg0 : memref<256x128xf16> -> !xegpu.tensor_desc<256x128xf16, #xegpu.layout<sg_layout = [8, 4], sg_data = [16, 16], lane_layout = [1, 16], lane_data = [1, 1]>>
      %1 = xegpu.load_nd %0[0, 0] <{layout = #xegpu.layout<sg_layout = [8, 4], sg_data = [16, 16], lane_layout = [1, 16], lane_data = [1, 1]>}> : !xegpu.tensor_desc<256x128xf16, #xegpu.layout<sg_layout = [8, 4], sg_data = [16, 16], lane_layout = [1, 16], lane_data = [1, 1]>> -> vector<256x128xf16>
      %2 = xegpu.create_nd_tdesc %arg1 : memref<128x256xf16> -> !xegpu.tensor_desc<128x256xf16, #xegpu.layout<sg_layout = [4, 8], sg_data = [16, 16], lane_layout = [1, 16], lane_data = [2, 1]>>
      %3 = xegpu.load_nd %2[0, 0] <{layout = #xegpu.layout<sg_layout = [4, 8], sg_data = [16, 16], lane_layout = [1, 16], lane_data = [2, 1]>}> : !xegpu.tensor_desc<128x256xf16, #xegpu.layout<sg_layout = [4, 8], sg_data = [16, 16], lane_layout = [1, 16], lane_data = [2, 1]>> -> vector<128x256xf16>
      %4 = xegpu.dpas %1, %3 {layout_a = #xegpu.layout<sg_layout = [8, 4], sg_data = [16, 16], lane_layout = [1, 16], lane_data = [1, 1]>, layout_b = #xegpu.layout<sg_layout = [4, 8], sg_data = [16, 16], lane_layout = [1, 16], lane_data = [2, 1]>, layout_cd = #xegpu.layout<sg_layout = [8, 8], sg_data = [16, 16], lane_layout = [1, 16], lane_data = [1, 1]>} : vector<256x128xf16>, vector<128x256xf16> -> vector<256x256xf32>
      gpu.return
    }
    gpu.func @vector_reduce_dim_1(%arg0: memref<256x64xf32>) {
      %cst = arith.constant {layout_result_0 = #xegpu.slice<#xegpu.layout<sg_layout = [8, 1], sg_data = [16, 64]>, dims = [1]>} dense<1.000000e+00> : vector<256xf32>
      %0 = xegpu.create_nd_tdesc %arg0 : memref<256x64xf32> -> !xegpu.tensor_desc<256x64xf32, #xegpu.layout<sg_layout = [8, 1], sg_data = [16, 64]>>
      %1 = xegpu.load_nd %0[0, 0] <{layout = #xegpu.layout<sg_layout = [8, 1], sg_data = [16, 64]>}> : !xegpu.tensor_desc<256x64xf32, #xegpu.layout<sg_layout = [8, 1], sg_data = [16, 64]>> -> vector<256x64xf32>
      %2 = vector.multi_reduction <add>, %1, %cst {layout_result_0 = #xegpu.slice<#xegpu.layout<sg_layout = [8, 1], sg_data = [16, 64]>, dims = [1]>} [1] : vector<256x64xf32> to vector<256xf32>
      gpu.return
    }
    gpu.func @non_splat_constant() {
      %cst = arith.constant {layout_result_0 = #xegpu.layout<sg_layout = [8, 1], sg_data = [2, 1]>} dense<[[0], [16], [32], [48], [64], [80], [96], [112], [128], [144], [160], [176], [192], [208], [224], [240], [256], [272], [288], [304], [320], [336], [352], [368], [384], [400], [416], [432], [448], [464], [480], [496]]> : vector<32x1xindex>
      gpu.return
    }
    gpu.func @vector_transpose(%arg0: memref<256x128xf32>) {
      %0 = xegpu.create_nd_tdesc %arg0 : memref<256x128xf32> -> !xegpu.tensor_desc<256x128xf32, #xegpu.layout<sg_layout = [8, 4], sg_data = [32, 16], lane_layout = [16, 1], lane_data = [1, 1], order = [0, 1]>>
      %1 = xegpu.load_nd %0[0, 0] <{layout = #xegpu.layout<sg_layout = [8, 4], sg_data = [32, 16], lane_layout = [16, 1], lane_data = [1, 1], order = [0, 1]>}> : !xegpu.tensor_desc<256x128xf32, #xegpu.layout<sg_layout = [8, 4], sg_data = [32, 16], lane_layout = [16, 1], lane_data = [1, 1], order = [0, 1]>> -> vector<256x128xf32>
      %2 = vector.transpose %1, [1, 0] {layout_result_0 = #xegpu.layout<sg_layout = [4, 8], sg_data = [16, 32], lane_layout = [1, 16], lane_data = [1, 1], order = [1, 0]>} : vector<256x128xf32> to vector<128x256xf32>
      gpu.return
    }
    gpu.func @vector_mask_2D() {
      %0 = vector.constant_mask [16, 16] {layout_result_0 = #xegpu.layout<sg_layout = [8, 4], sg_data = [16, 16]>} : vector<256x128xi1>
      gpu.return
    }
    gpu.func @vector_create_mask_2D() {
      %c16 = arith.constant 16 : index
      %0 = vector.create_mask %c16, %c16 {layout_result_0 = #xegpu.layout<sg_layout = [8, 4], sg_data = [16, 16]>} : vector<256x128xi1>
      gpu.return
    }
    gpu.func @distribute_shapecast_expandunitdims_broadcast(%arg0: memref<4096x128xf32>, %arg1: memref<4096x128xf32>) {
      %cst = arith.constant {layout_result_0 = #xegpu.slice<#xegpu.layout<sg_layout = [32, 1], sg_data = [8, 128], inst_data = [8, 16]>, dims = [1]>} dense<0xFF800000> : vector<256xf32>
      %block_id_x = gpu.block_id  x
      %0 = xegpu.create_nd_tdesc %arg0 : memref<4096x128xf32> -> !xegpu.tensor_desc<256x128xf32, #xegpu.block_tdesc_attr<boundary_check = false>, #xegpu.layout<sg_layout = [32, 1], sg_data = [8, 128], inst_data = [8, 16]>>
      %1 = xegpu.load_nd %0[%block_id_x, 0]  : !xegpu.tensor_desc<256x128xf32, #xegpu.block_tdesc_attr<boundary_check = false>, #xegpu.layout<sg_layout = [32, 1], sg_data = [8, 128], inst_data = [8, 16]>> -> vector<256x128xf32>
      %2 = vector.multi_reduction <maximumf>, %1, %cst {layout_result_0 = #xegpu.slice<#xegpu.layout<sg_layout = [32, 1], sg_data = [8, 128], inst_data = [8, 16]>, dims = [1]>} [1] : vector<256x128xf32> to vector<256xf32>
      %3 = vector.shape_cast %2 {layout_result_0 = #xegpu.layout<sg_layout = [32, 1], sg_data = [8, 128], inst_data = [8, 16]>} : vector<256xf32> to vector<256x1xf32>
      %4 = vector.broadcast %3 {layout_result_0 = #xegpu.layout<sg_layout = [32, 1], sg_data = [8, 128], inst_data = [8, 16]>} : vector<256x1xf32> to vector<256x128xf32>
      %5 = xegpu.create_nd_tdesc %arg0 : memref<4096x128xf32> -> !xegpu.tensor_desc<256x128xf32, #xegpu.block_tdesc_attr<boundary_check = false>, #xegpu.layout<sg_layout = [32, 1], sg_data = [8, 128], inst_data = [8, 16]>>
      xegpu.store_nd %4, %5[%block_id_x, 0]  : vector<256x128xf32>, !xegpu.tensor_desc<256x128xf32, #xegpu.block_tdesc_attr<boundary_check = false>, #xegpu.layout<sg_layout = [32, 1], sg_data = [8, 128], inst_data = [8, 16]>>
      gpu.return
    }
  }
}

