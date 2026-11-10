module {
  gpu.module @test_distribution {
    gpu.func @create_nd_tdesc(%arg0: memref<256x128xf32>) {
      %0 = xegpu.create_nd_tdesc %arg0 : memref<256x128xf32> -> !xegpu.tensor_desc<256x128xf32, #xegpu.layout<sg_layout = [8, 4], sg_data = [16, 16], lane_layout = [1, 16], lane_data = [1, 1]>>
      gpu.return
    }
    gpu.func @load_nd(%arg0: memref<256x128xf32>) {
      %0 = xegpu.create_nd_tdesc %arg0 : memref<256x128xf32> -> !xegpu.tensor_desc<256x128xf32>
      %1 = xegpu.load_nd %0[0, 0] <{layout = #xegpu.layout<sg_layout = [8, 4], sg_data = [16, 16], lane_layout = [1, 16], lane_data = [1, 1]>}> : !xegpu.tensor_desc<256x128xf32> -> vector<256x128xf32>
      gpu.return
    }
    gpu.func @store_nd_with_offset(%arg0: memref<256x128xf32>) {
      %0 = xegpu.create_nd_tdesc %arg0 : memref<256x128xf32> -> !xegpu.tensor_desc<256x128xf32>
      %1 = xegpu.load_nd %0[0, 0] <{layout = #xegpu.layout<sg_layout = [8, 4], sg_data = [16, 16], lane_layout = [1, 16], lane_data = [1, 1]>}> : !xegpu.tensor_desc<256x128xf32> -> vector<256x128xf32>
      xegpu.store_nd %1, %0[0, 0] <{layout = #xegpu.layout<sg_layout = [8, 4], sg_data = [16, 16], lane_layout = [1, 16], lane_data = [1, 1]>}> : vector<256x128xf32>, !xegpu.tensor_desc<256x128xf32>
      gpu.return
    }
    gpu.func @prefetch_nd(%arg0: memref<256x128xf32>) {
      %0 = xegpu.create_nd_tdesc %arg0 : memref<256x128xf32> -> !xegpu.tensor_desc<256x128xf32>
      xegpu.prefetch_nd %0[0, 0] <{layout = #xegpu.layout<sg_layout = [8, 4], sg_data = [16, 16], lane_layout = [1, 16], lane_data = [1, 1]>}> : !xegpu.tensor_desc<256x128xf32>
      gpu.return
    }
    gpu.func @dpas(%arg0: memref<256x128xf16>, %arg1: memref<128x256xf16>) {
      %0 = xegpu.create_nd_tdesc %arg0 : memref<256x128xf16> -> !xegpu.tensor_desc<256x128xf16>
      %1 = xegpu.load_nd %0[0, 0] <{layout = #xegpu.layout<sg_layout = [8, 4], sg_data = [16, 16], lane_layout = [1, 16], lane_data = [1, 1]>}> : !xegpu.tensor_desc<256x128xf16> -> vector<256x128xf16>
      %2 = xegpu.create_nd_tdesc %arg1 : memref<128x256xf16> -> !xegpu.tensor_desc<128x256xf16>
      %3 = xegpu.load_nd %2[0, 0] <{layout = #xegpu.layout<sg_layout = [4, 8], sg_data = [16, 16], lane_layout = [1, 16], lane_data = [2, 1]>}> : !xegpu.tensor_desc<128x256xf16> -> vector<128x256xf16>
      %4 = xegpu.dpas %1, %3 {layout_a = #xegpu.layout<sg_layout = [8, 4], sg_data = [16, 16], lane_layout = [1, 16], lane_data = [1, 1]>, layout_b = #xegpu.layout<sg_layout = [4, 8], sg_data = [16, 16], lane_layout = [1, 16], lane_data = [2, 1]>, layout_cd = #xegpu.layout<sg_layout = [8, 8], sg_data = [16, 16], lane_layout = [1, 16], lane_data = [1, 1]>} : vector<256x128xf16>, vector<128x256xf16> -> vector<256x256xf32>
      gpu.return
    }
    gpu.func @vector_reduce_dim_1(%arg0: memref<256x64xf32>) {
      %cst = arith.constant dense<1.000000e+00> : vector<256xf32>
      %0 = xegpu.create_nd_tdesc %arg0 : memref<256x64xf32> -> !xegpu.tensor_desc<256x64xf32>
      %1 = xegpu.load_nd %0[0, 0] <{layout = #xegpu.layout<sg_layout = [8, 1], sg_data = [16, 64]>}> : !xegpu.tensor_desc<256x64xf32> -> vector<256x64xf32>
      %2 = vector.multi_reduction <add>, %1, %cst [1] : vector<256x64xf32> to vector<256xf32>
      %3 = xegpu.convert_layout %2 <{input_layout = #xegpu.slice<#xegpu.layout<sg_layout = [8, 1], sg_data = [16, 64]>, dims = [1]>, target_layout = #xegpu.slice<#xegpu.layout<sg_layout = [8, 1], sg_data = [16, 64]>, dims = [1]>}> : vector<256xf32>
      gpu.return
    }
    gpu.func @non_splat_constant() {
      %cst = arith.constant dense<[[0], [16], [32], [48], [64], [80], [96], [112], [128], [144], [160], [176], [192], [208], [224], [240], [256], [272], [288], [304], [320], [336], [352], [368], [384], [400], [416], [432], [448], [464], [480], [496]]> : vector<32x1xindex>
      %0 = xegpu.convert_layout %cst <{input_layout = #xegpu.layout<sg_layout = [8, 1], sg_data = [2, 1]>, target_layout = #xegpu.layout<sg_layout = [8, 1], sg_data = [2, 1]>}> : vector<32x1xindex>
      gpu.return
    }
    gpu.func @vector_transpose(%arg0: memref<256x128xf32>) {
      %0 = xegpu.create_nd_tdesc %arg0 : memref<256x128xf32> -> !xegpu.tensor_desc<256x128xf32>
      %1 = xegpu.load_nd %0[0, 0] <{layout = #xegpu.layout<sg_layout = [8, 4], sg_data = [32, 16], lane_layout = [16, 1], lane_data = [1, 1], order = [0, 1]>}> : !xegpu.tensor_desc<256x128xf32> -> vector<256x128xf32>
      %2 = vector.transpose %1, [1, 0] : vector<256x128xf32> to vector<128x256xf32>
      %3 = xegpu.convert_layout %2 <{input_layout = #xegpu.layout<sg_layout = [4, 8], sg_data = [16, 32], lane_layout = [1, 16], lane_data = [1, 1]>, target_layout = #xegpu.layout<sg_layout = [4, 8], sg_data = [16, 32], lane_layout = [1, 16], lane_data = [1, 1]>}> : vector<128x256xf32>
      gpu.return
    }
    gpu.func @vector_mask_2D() {
      %0 = vector.constant_mask [16, 16] : vector<256x128xi1>
      %1 = xegpu.convert_layout %0 <{input_layout = #xegpu.layout<sg_layout = [8, 4], sg_data = [16, 16]>, target_layout = #xegpu.layout<sg_layout = [8, 4], sg_data = [16, 16]>}> : vector<256x128xi1>
      gpu.return
    }
    gpu.func @vector_create_mask_2D() {
      %c16 = arith.constant 16 : index
      %0 = vector.create_mask %c16, %c16 : vector<256x128xi1>
      %1 = xegpu.convert_layout %0 <{input_layout = #xegpu.layout<sg_layout = [8, 4], sg_data = [16, 16]>, target_layout = #xegpu.layout<sg_layout = [8, 4], sg_data = [16, 16]>}> : vector<256x128xi1>
      gpu.return
    }
    gpu.func @distribute_shapecast_expandunitdims_broadcast(%arg0: memref<4096x128xf32>, %arg1: memref<4096x128xf32>) {
      %cst = arith.constant dense<0xFF800000> : vector<256xf32>
      %block_id_x = gpu.block_id x
      %0 = xegpu.create_nd_tdesc %arg0 : memref<4096x128xf32> -> !xegpu.tensor_desc<256x128xf32, #xegpu.block_tdesc_attr<boundary_check = false>>
      %1 = xegpu.load_nd %0[%block_id_x, 0] <{layout = #xegpu.layout<sg_layout = [32, 1], sg_data = [8, 128], inst_data = [8, 16]>}> : !xegpu.tensor_desc<256x128xf32, #xegpu.block_tdesc_attr<boundary_check = false>> -> vector<256x128xf32>
      %2 = vector.multi_reduction <maximumf>, %1, %cst [1] : vector<256x128xf32> to vector<256xf32>
      %3 = vector.shape_cast %2 : vector<256xf32> to vector<256x1xf32>
      %4 = vector.broadcast %3 : vector<256x1xf32> to vector<256x128xf32>
      %5 = xegpu.create_nd_tdesc %arg0 : memref<4096x128xf32> -> !xegpu.tensor_desc<256x128xf32, #xegpu.block_tdesc_attr<boundary_check = false>>
      xegpu.store_nd %4, %5[%block_id_x, 0] <{layout = #xegpu.layout<sg_layout = [32, 1], sg_data = [8, 128], inst_data = [8, 16]>}> : vector<256x128xf32>, !xegpu.tensor_desc<256x128xf32, #xegpu.block_tdesc_attr<boundary_check = false>>
      gpu.return
    }
    gpu.func @reduction_cross_sg_rr(%arg0: memref<2048xf32, 1>) kernel {
      %cst = arith.constant dense<0> : vector<8x256xindex>
      %cst_0 = arith.constant dense<0.000000e+00> : vector<8xf32>
      %cst_1 = arith.constant dense<true> : vector<8x256xi1>
      %0 = xegpu.load %arg0[%cst], %cst_1 <{layout = #xegpu.layout<sg_layout = [1, 16], sg_data = [4, 16]>}> : memref<2048xf32, 1>, vector<8x256xindex>, vector<8x256xi1> -> vector<8x256xf32>
      %1 = vector.multi_reduction <add>, %0, %cst_0 [1] : vector<8x256xf32> to vector<8xf32>
      %2 = xegpu.convert_layout %1 <{input_layout = #xegpu.slice<#xegpu.layout<sg_layout = [1, 16], sg_data = [4, 16]>, dims = [1]>, target_layout = #xegpu.slice<#xegpu.layout<sg_layout = [1, 16], sg_data = [4, 16]>, dims = [1]>}> : vector<8xf32>
      gpu.return
    }
    gpu.func @splat_constant() {
      %cst = arith.constant dense<0> : vector<8xindex>
      %0 = xegpu.convert_layout %cst <{input_layout = #xegpu.slice<#xegpu.layout<sg_layout = [16, 1], sg_data = [16, 4], order = [0, 1]>, dims = [0]>, target_layout = #xegpu.slice<#xegpu.layout<sg_layout = [16, 1], sg_data = [16, 4], order = [0, 1]>, dims = [0]>}> : vector<8xindex>
      gpu.return
    }
    gpu.func @step_broadcast() {
      %0 = vector.step : vector<8xindex>
      %1 = vector.broadcast %0 : vector<8xindex> to vector<256x8xindex>
      %2 = xegpu.convert_layout %1 <{input_layout = #xegpu.layout<sg_layout = [16, 1], sg_data = [16, 4]>, target_layout = #xegpu.layout<sg_layout = [16, 1], sg_data = [16, 4]>}> : vector<256x8xindex>
      gpu.return
    }
    gpu.func @create_nd_tdesc_with_shared_data(%arg0: memref<256x128xf32>) {
      %0 = xegpu.create_nd_tdesc %arg0 : memref<256x128xf32> -> !xegpu.tensor_desc<128x64xf32, #xegpu.layout<sg_layout = [8, 4], sg_data = [16, 64]>>
      gpu.return
    }
    gpu.func @broadcast(%arg0: memref<128x1xf32>) {
      %0 = xegpu.create_nd_tdesc %arg0 : memref<128x1xf32> -> !xegpu.tensor_desc<128x1xf32>
      %1 = xegpu.load_nd %0[0, 0] <{layout = #xegpu.layout<sg_layout = [4, 1], sg_data = [16, 1], lane_layout = [8, 1], lane_data = [1, 1]>}> : !xegpu.tensor_desc<128x1xf32> -> vector<128x1xf32>
      %2 = vector.broadcast %1 : vector<128x1xf32> to vector<128x64xf32>
      %3 = xegpu.convert_layout %2 <{input_layout = #xegpu.layout<sg_layout = [4, 1], sg_data = [16, 32], lane_layout = [8, 1], lane_data = [1, 1]>, target_layout = #xegpu.layout<sg_layout = [4, 1], sg_data = [16, 32], lane_layout = [8, 1], lane_data = [1, 1]>}> : vector<128x64xf32>
      gpu.return
    }
    gpu.func @scf_for(%arg0: memref<1024xf32>, %arg1: memref<1024xf32>) {
      %c1 = arith.constant 1 : index
      %c10 = arith.constant 10 : index
      %c0 = arith.constant 0 : index
      %c256 = arith.constant 256 : index
      %c1024 = arith.constant 1024 : index
      %0 = xegpu.create_nd_tdesc %arg0 : memref<1024xf32> -> !xegpu.tensor_desc<256xf32>
      %1 = xegpu.create_nd_tdesc %arg1 : memref<1024xf32> -> !xegpu.tensor_desc<256xf32>
      scf.for %arg2 = %c0 to %c1024 step %c256 {
        %2 = xegpu.load_nd %0[%arg2] <{layout = #xegpu.layout<sg_layout = [8], sg_data = [16]>}> : !xegpu.tensor_desc<256xf32> -> vector<256xf32>
        xegpu.store_nd %2, %1[%arg2] <{layout = #xegpu.layout<sg_layout = [8], sg_data = [16]>}> : vector<256xf32>, !xegpu.tensor_desc<256xf32>
      }
      gpu.return
    }
    gpu.func @scf_while_and_condition(%arg0: memref<1024xf32>, %arg1: memref<1024xf32>) {
      %c1_i32 = arith.constant 1 : i32
      %c10_i32 = arith.constant 10 : i32
      %c0_i32 = arith.constant 0 : i32
      %c256 = arith.constant 256 : index
      %0 = xegpu.create_nd_tdesc %arg0 : memref<1024xf32> -> !xegpu.tensor_desc<256xf32>
      %1 = xegpu.load_nd %0[0] <{layout = #xegpu.layout<sg_layout = [8], sg_data = [16]>}> : !xegpu.tensor_desc<256xf32> -> vector<256xf32>
      %2 = xegpu.create_nd_tdesc %arg1 : memref<1024xf32> -> !xegpu.tensor_desc<256xf32>
      %3:2 = scf.while (%arg2 = %1, %arg3 = %c0_i32) : (vector<256xf32>, i32) -> (vector<256xf32>, i32) {
        %4 = arith.cmpi slt, %arg3, %c10_i32 : i32
        scf.condition(%4) %arg2, %arg3 : vector<256xf32>, i32
      } do {
      ^bb0(%arg2: vector<256xf32>, %arg3: i32):
        xegpu.store_nd %arg2, %2[0] <{layout = #xegpu.layout<sg_layout = [8], sg_data = [16]>}> : vector<256xf32>, !xegpu.tensor_desc<256xf32>
        %4 = arith.addi %arg3, %c1_i32 : i32
        %5 = xegpu.load_nd %0[%c256] <{layout = #xegpu.layout<sg_layout = [8], sg_data = [16]>}> : !xegpu.tensor_desc<256xf32> -> vector<256xf32>
        scf.yield %5, %4 : vector<256xf32>, i32
      }
      xegpu.store_nd %3#0, %2[0] <{layout = #xegpu.layout<sg_layout = [8], sg_data = [16]>}> : vector<256xf32>, !xegpu.tensor_desc<256xf32>
      gpu.return
    }
    gpu.func @scf_if(%arg0: memref<1024xf32>, %arg1: memref<1024xf32>) {
      %c10 = arith.constant 10 : index
      %0 = gpu.subgroup_id : index
      %1 = xegpu.create_nd_tdesc %arg0 : memref<1024xf32> -> !xegpu.tensor_desc<256xf32>
      %2 = xegpu.create_nd_tdesc %arg1 : memref<1024xf32> -> !xegpu.tensor_desc<256xf32>
      %3 = arith.cmpi eq, %0, %c10 : index
      %4 = scf.if %3 -> (vector<256xf32>) {
        %5 = xegpu.load_nd %1[0] <{layout = #xegpu.layout<sg_layout = [8], sg_data = [16]>}> : !xegpu.tensor_desc<256xf32> -> vector<256xf32>
        scf.yield %5 : vector<256xf32>
      } else {
        %5 = xegpu.load_nd %2[0] <{layout = #xegpu.layout<sg_layout = [8], sg_data = [16]>}> : !xegpu.tensor_desc<256xf32> -> vector<256xf32>
        scf.yield %5 : vector<256xf32>
      }
      xegpu.store_nd %4, %1[0] <{layout = #xegpu.layout<sg_layout = [8], sg_data = [16]>}> : vector<256xf32>, !xegpu.tensor_desc<256xf32>
      gpu.return
    }
    gpu.func @scf_if_tensor_desc(%arg0: memref<1024xf32>, %arg1: memref<1024xf32>) {
      %c10 = arith.constant 10 : index
      %0 = gpu.subgroup_id : index
      %1 = xegpu.create_nd_tdesc %arg0 : memref<1024xf32> -> !xegpu.tensor_desc<256xf32, #xegpu.layout<sg_layout = [8], sg_data = [16]>>
      %2 = xegpu.load_nd %1[0] <{layout = #xegpu.layout<sg_layout = [8], sg_data = [16]>}> : !xegpu.tensor_desc<256xf32, #xegpu.layout<sg_layout = [8], sg_data = [16]>> -> vector<256xf32>
      %3 = arith.cmpi eq, %0, %c10 : index
      %4 = scf.if %3 -> (!xegpu.tensor_desc<256xf32, #xegpu.layout<sg_layout = [8], sg_data = [16]>>) {
        %5 = xegpu.create_nd_tdesc %arg0 : memref<1024xf32> -> !xegpu.tensor_desc<256xf32, #xegpu.layout<sg_layout = [8], sg_data = [16]>>
        scf.yield %5 : !xegpu.tensor_desc<256xf32, #xegpu.layout<sg_layout = [8], sg_data = [16]>>
      } else {
        %5 = xegpu.create_nd_tdesc %arg1 : memref<1024xf32> -> !xegpu.tensor_desc<256xf32, #xegpu.layout<sg_layout = [8], sg_data = [16]>>
        scf.yield %5 : !xegpu.tensor_desc<256xf32, #xegpu.layout<sg_layout = [8], sg_data = [16]>>
      }
      xegpu.store_nd %2, %4[0]  : vector<256xf32>, !xegpu.tensor_desc<256xf32, #xegpu.layout<sg_layout = [8], sg_data = [16]>>
      gpu.return
    }
    gpu.func @convert_layout_optimal(%arg0: memref<32x64xf32>) {
      %0 = xegpu.create_nd_tdesc %arg0 : memref<32x64xf32> -> !xegpu.tensor_desc<32x64xf32>
      %1 = xegpu.load_nd %0[0, 0] <{layout = #xegpu.layout<sg_layout = [2, 2], sg_data = [16, 16], inst_data = [16, 16]>}> : !xegpu.tensor_desc<32x64xf32> -> vector<32x64xf32>
      %2 = xegpu.convert_layout %1 <{input_layout = #xegpu.layout<sg_layout = [2, 2], sg_data = [16, 16], inst_data = [16, 16]>, target_layout = #xegpu.layout<sg_layout = [2, 2], sg_data = [16, 16], inst_data = [8, 16]>}> : vector<32x64xf32>
      gpu.return
    }
  }
}

