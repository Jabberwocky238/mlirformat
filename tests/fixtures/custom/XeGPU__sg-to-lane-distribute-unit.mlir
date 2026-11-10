module {
  gpu.module @xevm_module {
    gpu.func @create_nd_tdesc(%arg0: memref<256x256xf16>) {
      %c0 = arith.constant 0 : index
      %0 = xegpu.create_nd_tdesc %arg0 : memref<256x256xf16> -> !xegpu.tensor_desc<16x16xf16>
      gpu.return
    }
    gpu.func @cerate_nd_tedesc_nonmemref_source(%arg0: ui64) {
      %c0 = arith.constant 0 : index
      %0 = xegpu.create_nd_tdesc %arg0, shape : [256, 256], strides : [256, 1] : ui64 -> !xegpu.tensor_desc<16x16xf16>
      gpu.return
    }
    gpu.func @load_nd() {
      %c0 = arith.constant 0 : index
      %0 = "some_op"() : () -> !xegpu.tensor_desc<16x16xf16>
      %1 = xegpu.load_nd %0[%c0, %c0] <{layout = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>}> : !xegpu.tensor_desc<16x16xf16> -> vector<16x16xf16>
      gpu.return
    }
    gpu.func @load_nd_packed() {
      %c0 = arith.constant 0 : index
      %0 = "some_op"() : () -> !xegpu.tensor_desc<16x16xf16>
      %1 = xegpu.load_nd %0[%c0, %c0] <{layout = #xegpu.layout<lane_layout = [1, 16], lane_data = [2, 1]>}> : !xegpu.tensor_desc<16x16xf16> -> vector<16x16xf16>
      gpu.return
    }
    gpu.func @load_nd_transpose() {
      %c0 = arith.constant 0 : index
      %0 = "some_op"() : () -> !xegpu.tensor_desc<16x8xf32>
      %1 = xegpu.load_nd %0[%c0, %c0] <{layout = #xegpu.layout<lane_layout = [16, 1], lane_data = [1, 1]>}> : !xegpu.tensor_desc<16x8xf32> -> vector<16x8xf32>
      gpu.return
    }
    gpu.func @load_nd_array_length() {
      %c0 = arith.constant 0 : index
      %0 = "some_op"() : () -> !xegpu.tensor_desc<32x16xf16, #xegpu.block_tdesc_attr<array_length = 2 : i64>>
      %1 = xegpu.load_nd %0[%c0, %c0] <{layout = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>}> : !xegpu.tensor_desc<32x16xf16, #xegpu.block_tdesc_attr<array_length = 2 : i64>> -> vector<64x16xf16>
      gpu.return
    }
    gpu.func @store_nd() {
      %c0 = arith.constant 0 : index
      %0 = "some_op"() : () -> !xegpu.tensor_desc<16x16xf16>
      %1 = "some_op"() : () -> !xegpu.tensor_desc<16x16xf16>
      %2 = xegpu.load_nd %0[%c0, %c0] <{layout = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>}> : !xegpu.tensor_desc<16x16xf16> -> vector<16x16xf16>
      xegpu.store_nd %2, %1[%c0, %c0] <{layout = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>}> : vector<16x16xf16>, !xegpu.tensor_desc<16x16xf16>
      gpu.return
    }
    gpu.func @dpas() {
      %c0 = arith.constant 0 : index
      %0 = "some_op"() : () -> !xegpu.tensor_desc<8x16xf16>
      %1 = "some_op"() : () -> !xegpu.tensor_desc<16x16xf16>
      %cst = arith.constant dense<0.000000e+00> : vector<8x16xf32>
      %2 = xegpu.load_nd %0[%c0, %c0] <{layout = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>}> : !xegpu.tensor_desc<8x16xf16> -> vector<8x16xf16>
      %3 = xegpu.load_nd %1[%c0, %c0] <{layout = #xegpu.layout<lane_layout = [1, 16], lane_data = [2, 1]>}> : !xegpu.tensor_desc<16x16xf16> -> vector<16x16xf16>
      %4 = xegpu.dpas %2, %3, %cst {layout_a = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>, layout_b = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>, layout_cd = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>} : vector<8x16xf16>, vector<16x16xf16>, vector<8x16xf32> -> vector<8x16xf32>
      %5 = xegpu.convert_layout %4 <{input_layout = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>, target_layout = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>}> : vector<8x16xf32>
      gpu.return
    }
    gpu.func @elementwise() {
      %c0 = arith.constant 0 : index
      %cst = arith.constant dense<1.000000e+00> : vector<16x16xf32>
      %0 = "some_op"() : () -> !xegpu.tensor_desc<16x16xf32>
      %1 = xegpu.load_nd %0[%c0, %c0] <{layout = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>}> : !xegpu.tensor_desc<16x16xf32> -> vector<16x16xf32>
      %2 = arith.addf %cst, %1 : vector<16x16xf32>
      %3 = xegpu.convert_layout %2 <{input_layout = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>, target_layout = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>}> : vector<16x16xf32>
      gpu.return
    }
    gpu.func @arith_constant() {
      %cst = arith.constant dense<1.000000e+00> : vector<16x16xf32>
      %0 = xegpu.convert_layout %cst <{input_layout = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>, target_layout = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>}> : vector<16x16xf32>
      gpu.return
    }
    gpu.func @arith_constant_non_splat() {
      %cst = arith.constant {layout_result_0 = #xegpu.slice<#xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>, dims = [0]>} dense<[0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15]> : vector<16xindex>
      %0 = xegpu.convert_layout %cst <{input_layout = #xegpu.slice<#xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>, dims = [0]>, target_layout = #xegpu.slice<#xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>, dims = [0]>}> : vector<16xindex>
      gpu.return
    }
    gpu.func @arith_constant_non_splat_lane_data() {
      %cst = arith.constant {layout_result_0 = #xegpu.slice<#xegpu.layout<lane_layout = [1, 16], lane_data = [1, 2]>, dims = [0]>} dense<[0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31]> : vector<32xindex>
      %0 = xegpu.convert_layout %cst <{input_layout = #xegpu.slice<#xegpu.layout<lane_layout = [1, 16], lane_data = [1, 2]>, dims = [0]>, target_layout = #xegpu.slice<#xegpu.layout<lane_layout = [1, 16], lane_data = [1, 2]>, dims = [0]>}> : vector<32xindex>
      gpu.return
    }
    gpu.func @arith_constant_non_splat_2d_vertical_lanedata() {
      %cst = arith.constant {layout_result_0 = #xegpu.layout<lane_layout = [1, 16], lane_data = [2, 1]>} dense<"0x00000000000000000100000000000000020000000000000003000000000000000400000000000000050000000000000006000000000000000700000000000000080000000000000009000000000000000A000000000000000B000000000000000C000000000000000D000000000000000E000000000000000F0000000000000010000000000000001100000000000000120000000000000013000000000000001400000000000000150000000000000016000000000000001700000000000000180000000000000019000000000000001A000000000000001B000000000000001C000000000000001D000000000000001E000000000000001F0000000000000020000000000000002100000000000000220000000000000023000000000000002400000000000000250000000000000026000000000000002700000000000000280000000000000029000000000000002A000000000000002B000000000000002C000000000000002D000000000000002E000000000000002F0000000000000030000000000000003100000000000000320000000000000033000000000000003400000000000000350000000000000036000000000000003700000000000000380000000000000039000000000000003A000000000000003B000000000000003C000000000000003D000000000000003E000000000000003F0000000000000040000000000000004100000000000000420000000000000043000000000000004400000000000000450000000000000046000000000000004700000000000000480000000000000049000000000000004A000000000000004B000000000000004C000000000000004D000000000000004E000000000000004F0000000000000050000000000000005100000000000000520000000000000053000000000000005400000000000000550000000000000056000000000000005700000000000000580000000000000059000000000000005A000000000000005B000000000000005C000000000000005D000000000000005E000000000000005F0000000000000060000000000000006100000000000000620000000000000063000000000000006400000000000000650000000000000066000000000000006700000000000000680000000000000069000000000000006A000000000000006B000000000000006C000000000000006D000000000000006E000000000000006F0000000000000070000000000000007100000000000000720000000000000073000000000000007400000000000000750000000000000076000000000000007700000000000000780000000000000079000000000000007A000000000000007B000000000000007C000000000000007D000000000000007E000000000000007F00000000000000"> : vector<4x32xindex>
      %0 = xegpu.convert_layout %cst <{input_layout = #xegpu.layout<lane_layout = [1, 16], lane_data = [2, 1]>, target_layout = #xegpu.layout<lane_layout = [1, 16], lane_data = [2, 1]>}> : vector<4x32xindex>
      gpu.return
    }
    gpu.func @prefetch_nd() {
      %c0 = arith.constant 0 : index
      %0 = "some_op"() : () -> !xegpu.tensor_desc<16x16xf16>
      xegpu.prefetch_nd %0[%c0, %c0] <{layout = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>}> : !xegpu.tensor_desc<16x16xf16>
      gpu.return
    }
    gpu.func @scatter_load_chunksize(%arg0: memref<256xf16>) {
      %cst = arith.constant dense<12> : vector<16xindex>
      %cst_0 = arith.constant dense<true> : vector<16xi1>
      %0 = xegpu.load %arg0[%cst], %cst_0 <{chunk_size = 8 : i64, layout = #xegpu.layout<lane_layout = [16, 1], lane_data = [1, 1]>}> : memref<256xf16>, vector<16xindex>, vector<16xi1> -> vector<16x8xf16>
      gpu.return
    }
    gpu.func @scatter_store_chunksize(%arg0: memref<256xf16>) {
      %cst = arith.constant dense<12> : vector<16xindex>
      %cst_0 = arith.constant dense<true> : vector<16xi1>
      %0 = xegpu.load %arg0[%cst], %cst_0 <{chunk_size = 8 : i64, layout = #xegpu.layout<lane_layout = [16, 1], lane_data = [1, 1]>}> : memref<256xf16>, vector<16xindex>, vector<16xi1> -> vector<16x8xf16>
      xegpu.store %0, %arg0[%cst], %cst_0 <{chunk_size = 8 : i64, layout = #xegpu.layout<lane_layout = [16, 1], lane_data = [1, 1]>}> : vector<16x8xf16>, memref<256xf16>, vector<16xindex>, vector<16xi1>
      gpu.return
    }
    gpu.func @scatter_load(%arg0: memref<256xf16>) {
      %cst = arith.constant dense<12> : vector<16xindex>
      %cst_0 = arith.constant dense<true> : vector<16xi1>
      %0 = xegpu.load %arg0[%cst], %cst_0 <{layout = #xegpu.layout<lane_layout = [16], lane_data = [1]>}> : memref<256xf16>, vector<16xindex>, vector<16xi1> -> vector<16xf16>
      gpu.return
    }
    gpu.func @scatter_store(%arg0: memref<256xf16>) {
      %cst = arith.constant dense<12> : vector<16xindex>
      %cst_0 = arith.constant dense<true> : vector<16xi1>
      %0 = xegpu.load %arg0[%cst], %cst_0 <{layout = #xegpu.layout<lane_layout = [16], lane_data = [1]>}> : memref<256xf16>, vector<16xindex>, vector<16xi1> -> vector<16xf16>
      xegpu.store %0, %arg0[%cst], %cst_0 <{layout = #xegpu.layout<lane_layout = [16], lane_data = [1]>}> : vector<16xf16>, memref<256xf16>, vector<16xindex>, vector<16xi1>
      gpu.return
    }
    gpu.func @scatter_ops_with_leading_dims(%arg0: memref<256xf16>) {
      %cst = arith.constant dense<true> : vector<1x1x16xi1>
      %cst_0 = arith.constant dense<12> : vector<1x1x16xindex>
      %0 = xegpu.load %arg0[%cst_0], %cst <{layout = #xegpu.layout<lane_layout = [1, 1, 16], lane_data = [1, 1, 1]>}> : memref<256xf16>, vector<1x1x16xindex>, vector<1x1x16xi1> -> vector<1x1x16xf16>
      xegpu.store %0, %arg0[%cst_0], %cst <{layout = #xegpu.layout<lane_layout = [1, 1, 16], lane_data = [1, 1, 1]>}> : vector<1x1x16xf16>, memref<256xf16>, vector<1x1x16xindex>, vector<1x1x16xi1>
      gpu.return
    }
    gpu.func @vector_reduction() {
      %cst = arith.constant 1.000000e+00 : f32
      %0 = "some_op"() : () -> vector<32xf32>
      %1 = vector.reduction <add>, %0, %cst : vector<32xf32> into f32
      %2 = xegpu.convert_layout %1 <{input_layout = #xegpu.slice<#xegpu.layout<lane_layout = [16], lane_data = [1]>, dims = [0]>, target_layout = #xegpu.slice<#xegpu.layout<lane_layout = [16], lane_data = [1]>, dims = [0]>}> : f32
      gpu.return
    }
    gpu.func @vector_multi_reduction_dim1_distributed_dim1_reduction(%arg0: index) {
      %c0 = arith.constant 0 : index
      %cst = arith.constant dense<0.000000e+00> : vector<2x16xf32>
      %cst_0 = arith.constant dense<0.000000e+00> : vector<2xf32>
      %0 = vector.multi_reduction <add>, %cst, %cst_0 [1] : vector<2x16xf32> to vector<2xf32>
      %1 = xegpu.convert_layout %0 <{input_layout = #xegpu.slice<#xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>, dims = [1]>, target_layout = #xegpu.slice<#xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>, dims = [1]>}> : vector<2xf32>
      gpu.return
    }
    gpu.func @vector_multi_reduction_dim0_distributed_dim0_reduction(%arg0: index) {
      %c0 = arith.constant 0 : index
      %cst = arith.constant dense<0.000000e+00> : vector<16x2xf32>
      %cst_0 = arith.constant dense<0.000000e+00> : vector<2xf32>
      %0 = vector.multi_reduction <add>, %cst, %cst_0 [0] : vector<16x2xf32> to vector<2xf32>
      %1 = xegpu.convert_layout %0 <{input_layout = #xegpu.slice<#xegpu.layout<lane_layout = [16, 1], lane_data = [1, 1]>, dims = [0]>, target_layout = #xegpu.slice<#xegpu.layout<lane_layout = [16, 1], lane_data = [1, 1]>, dims = [0]>}> : vector<2xf32>
      gpu.return
    }
    gpu.func @vector_multi_reduction_dim1_distributed_dim0_reduction(%arg0: index) {
      %c0 = arith.constant 0 : index
      %cst = arith.constant dense<0.000000e+00> : vector<4x16xf32>
      %cst_0 = arith.constant dense<0.000000e+00> : vector<16xf32>
      %0 = vector.multi_reduction <add>, %cst, %cst_0 [0] : vector<4x16xf32> to vector<16xf32>
      %1 = xegpu.convert_layout %0 <{input_layout = #xegpu.slice<#xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>, dims = [0]>, target_layout = #xegpu.slice<#xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>, dims = [0]>}> : vector<16xf32>
      gpu.return
    }
    gpu.func @vector_multi_reduction_dim0_distributed_dim1_reduction(%arg0: index) {
      %c0 = arith.constant 0 : index
      %cst = arith.constant dense<0.000000e+00> : vector<16x12xf32>
      %cst_0 = arith.constant dense<0.000000e+00> : vector<16xf32>
      %0 = vector.multi_reduction <add>, %cst, %cst_0 [1] : vector<16x12xf32> to vector<16xf32>
      %1 = xegpu.convert_layout %0 <{input_layout = #xegpu.slice<#xegpu.layout<lane_layout = [16, 1], lane_data = [1, 1]>, dims = [1]>, target_layout = #xegpu.slice<#xegpu.layout<lane_layout = [16, 1], lane_data = [1, 1]>, dims = [1]>}> : vector<16xf32>
      gpu.return
    }
    gpu.func @vector_transpose() {
      %0 = "some_op"() : () -> vector<16x2xf32>
      %1 = vector.transpose %0, [1, 0] : vector<16x2xf32> to vector<2x16xf32>
      %2 = xegpu.convert_layout %1 <{input_layout = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>, target_layout = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>}> : vector<2x16xf32>
      gpu.return
    }
    gpu.func @vector_bitcast() {
      %0 = "some_op"() : () -> vector<4x32xi8>
      %1 = vector.bitcast %0 : vector<4x32xi8> to vector<4x16xi16>
      %2 = xegpu.convert_layout %1 <{input_layout = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>, target_layout = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>}> : vector<4x16xi16>
      gpu.return
    }
    gpu.func @create_mask_1d(%arg0: index) {
      %0 = vector.create_mask %arg0 : vector<16xi1>
      %1 = xegpu.convert_layout %0 <{input_layout = #xegpu.layout<lane_layout = [16], lane_data = [1]>, target_layout = #xegpu.layout<lane_layout = [16], lane_data = [1]>}> : vector<16xi1>
      gpu.return
    }
    gpu.func @constant_mask_1d() {
      %0 = vector.constant_mask [4] : vector<16xi1>
      %1 = xegpu.convert_layout %0 <{input_layout = #xegpu.layout<lane_layout = [16], lane_data = [1]>, target_layout = #xegpu.layout<lane_layout = [16], lane_data = [1]>}> : vector<16xi1>
      gpu.return
    }
    gpu.func @create_mask_2d(%arg0: index, %arg1: index) {
      %0 = vector.create_mask %arg0, %arg1 : vector<8x4xi1>
      %1 = xegpu.convert_layout %0 <{input_layout = #xegpu.layout<lane_layout = [8, 2], lane_data = [1, 1]>, target_layout = #xegpu.layout<lane_layout = [8, 2], lane_data = [1, 1]>}> : vector<8x4xi1>
      gpu.return
    }
    gpu.func @constant_mask_2d() {
      %0 = vector.constant_mask [2, 3] : vector<8x4xi1>
      %1 = xegpu.convert_layout %0 <{input_layout = #xegpu.layout<lane_layout = [8, 2], lane_data = [1, 1]>, target_layout = #xegpu.layout<lane_layout = [8, 2], lane_data = [1, 1]>}> : vector<8x4xi1>
      gpu.return
    }
    gpu.func @vector_multi_reduction_3d_leading_unit_dim_lane_local() {
      %cst = arith.constant dense<0.000000e+00> : vector<1x16x32xf32>
      %cst_0 = arith.constant dense<0.000000e+00> : vector<1x32xf32>
      %0 = vector.multi_reduction <add>, %cst, %cst_0 [1] : vector<1x16x32xf32> to vector<1x32xf32>
      %1 = xegpu.convert_layout %0 <{input_layout = #xegpu.slice<#xegpu.layout<lane_layout = [1, 1, 16], lane_data = [1, 1, 1]>, dims = [1]>, target_layout = #xegpu.slice<#xegpu.layout<lane_layout = [1, 1, 16], lane_data = [1, 1, 1]>, dims = [1]>}> : vector<1x32xf32>
      gpu.return
    }
    gpu.func @vector_multi_reduction_3d_leading_unit_dim_cross_lane() {
      %cst = arith.constant dense<0.000000e+00> : vector<1x16x2xf32>
      %cst_0 = arith.constant dense<0.000000e+00> : vector<1x2xf32>
      %0 = vector.multi_reduction <add>, %cst, %cst_0 [1] : vector<1x16x2xf32> to vector<1x2xf32>
      %1 = xegpu.convert_layout %0 <{input_layout = #xegpu.slice<#xegpu.layout<lane_layout = [1, 16, 1], lane_data = [1, 1, 1]>, dims = [1]>, target_layout = #xegpu.slice<#xegpu.layout<lane_layout = [1, 16, 1], lane_data = [1, 1, 1]>, dims = [1]>}> : vector<1x2xf32>
      gpu.return
    }
    gpu.func @vector_extract_from_2d() {
      %0 = "some_op"() : () -> vector<4x16xf32>
      %1 = vector.extract %0[0] : vector<16xf32> from vector<4x16xf32>
      %2 = xegpu.convert_layout %1 <{input_layout = #xegpu.layout<lane_layout = [16], lane_data = [1]>, target_layout = #xegpu.layout<lane_layout = [16], lane_data = [1]>}> : vector<16xf32>
      gpu.return
    }
    gpu.func @vector_extract_from_2d_offset2() {
      %0 = "some_op"() : () -> vector<8x16xf32>
      %1 = vector.extract %0[2] : vector<16xf32> from vector<8x16xf32>
      %2 = xegpu.convert_layout %1 <{input_layout = #xegpu.layout<lane_layout = [16], lane_data = [1]>, target_layout = #xegpu.layout<lane_layout = [16], lane_data = [1]>}> : vector<16xf32>
      gpu.return
    }
    gpu.func @vector_insert_into_2d() {
      %0 = "some_op"() : () -> vector<16xf32>
      %1 = "some_op"() : () -> vector<4x16xf32>
      %2 = vector.insert %0, %1 [0] : vector<16xf32> into vector<4x16xf32>
      %3 = xegpu.convert_layout %2 <{input_layout = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>, target_layout = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>}> : vector<4x16xf32>
      gpu.return
    }
    gpu.func @vector_insert_into_2d_offset2() {
      %0 = "some_op"() : () -> vector<16xf32>
      %1 = "some_op"() : () -> vector<8x16xf32>
      %2 = vector.insert %0, %1 [2] : vector<16xf32> into vector<8x16xf32>
      %3 = xegpu.convert_layout %2 <{input_layout = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>, target_layout = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>}> : vector<8x16xf32>
      gpu.return
    }
    gpu.func @vector_extract_strided_slice_distributed_dim_fully_extracted() {
      %0 = "some_op"() : () -> vector<24x16xf32>
      %1 = vector.extract_strided_slice %0 {offsets = [8, 0], sizes = [8, 16], strides = [1, 1]} : vector<24x16xf32> to vector<8x16xf32>
      %2 = xegpu.convert_layout %1 <{input_layout = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>, target_layout = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>}> : vector<8x16xf32>
      gpu.return
    }
    gpu.func @vector_extract_strided_slice_inner_distributed() {
      %0 = "some_op"() : () -> vector<24x64xf32>
      %1 = vector.extract_strided_slice %0 {offsets = [8, 48], sizes = [8, 16], strides = [1, 1]} : vector<24x64xf32> to vector<8x16xf32>
      %2 = xegpu.convert_layout %1 <{input_layout = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>, target_layout = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>}> : vector<8x16xf32>
      gpu.return
    }
    gpu.func @vector_extract_strided_slice_outer_distributed() {
      %0 = "some_op"() : () -> vector<32x16xf32>
      %1 = vector.extract_strided_slice %0 {offsets = [16], sizes = [16], strides = [1]} : vector<32x16xf32> to vector<16x16xf32>
      %2 = xegpu.convert_layout %1 <{input_layout = #xegpu.layout<lane_layout = [16, 1], lane_data = [1, 1]>, target_layout = #xegpu.layout<lane_layout = [16, 1], lane_data = [1, 1]>}> : vector<16x16xf32>
      gpu.return
    }
    gpu.func @vector_extract_strided_slice_1d() {
      %0 = "some_op"() : () -> vector<64xf32>
      %1 = vector.extract_strided_slice %0 {offsets = [16], sizes = [32], strides = [1]} : vector<64xf32> to vector<32xf32>
      %2 = xegpu.convert_layout %1 <{input_layout = #xegpu.layout<lane_layout = [16], lane_data = [1]>, target_layout = #xegpu.layout<lane_layout = [16], lane_data = [1]>}> : vector<32xf32>
      gpu.return
    }
    gpu.func @vector_extract_strided_slice_partial_offsets() {
      %0 = "some_op"() : () -> vector<24x16xf32>
      %1 = vector.extract_strided_slice %0 {offsets = [8], sizes = [8], strides = [1]} : vector<24x16xf32> to vector<8x16xf32>
      %2 = xegpu.convert_layout %1 <{input_layout = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>, target_layout = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>}> : vector<8x16xf32>
      gpu.return
    }
    gpu.func @convert_layout_repack_lane_data() {
      %0 = "some_op"() : () -> vector<32x16xi8>
      %1 = xegpu.convert_layout %0 <{input_layout = #xegpu.layout<lane_layout = [1, 16], lane_data = [4, 1]>, target_layout = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1], order = [1, 0]>}> : vector<32x16xi8>
      %2 = vector.extract_strided_slice %1 {offsets = [0, 0], sizes = [8, 16], strides = [1, 1]} : vector<32x16xi8> to vector<8x16xi8>
      %3 = vector.extract_strided_slice %1 {offsets = [8, 0], sizes = [8, 16], strides = [1, 1]} : vector<32x16xi8> to vector<8x16xi8>
      %4 = vector.extract_strided_slice %1 {offsets = [16, 0], sizes = [8, 16], strides = [1, 1]} : vector<32x16xi8> to vector<8x16xi8>
      %5 = vector.extract_strided_slice %1 {offsets = [24, 0], sizes = [8, 16], strides = [1, 1]} : vector<32x16xi8> to vector<8x16xi8>
      %6 = xegpu.convert_layout %2 <{input_layout = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1], order = [1, 0]>, target_layout = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1], order = [1, 0]>}> : vector<8x16xi8>
      %7 = xegpu.convert_layout %3 <{input_layout = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1], order = [1, 0]>, target_layout = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1], order = [1, 0]>}> : vector<8x16xi8>
      %8 = xegpu.convert_layout %4 <{input_layout = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1], order = [1, 0]>, target_layout = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1], order = [1, 0]>}> : vector<8x16xi8>
      %9 = xegpu.convert_layout %5 <{input_layout = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1], order = [1, 0]>, target_layout = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1], order = [1, 0]>}> : vector<8x16xi8>
      gpu.return
    }
    gpu.func @vector_insert_strided_slice_distributed_dim_fully_inserted() {
      %0 = "some_op"() : () -> vector<16x16xf32>
      %1 = "some_op"() : () -> vector<64x16xf32>
      %2 = vector.insert_strided_slice %0, %1 {offsets = [24, 0], strides = [1, 1]} : vector<16x16xf32> into vector<64x16xf32>
      %3 = xegpu.convert_layout %2 <{input_layout = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>, target_layout = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>}> : vector<64x16xf32>
      gpu.return
    }
    gpu.func @vector_insert_strided_slice_inner_distributed() {
      %0 = "some_op"() : () -> vector<16x16xf32>
      %1 = "some_op"() : () -> vector<64x32xf32>
      %2 = vector.insert_strided_slice %0, %1 {offsets = [24, 16], strides = [1, 1]} : vector<16x16xf32> into vector<64x32xf32>
      %3 = xegpu.convert_layout %2 <{input_layout = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>, target_layout = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>}> : vector<64x32xf32>
      gpu.return
    }
    gpu.func @vector_insert_strided_slice_outer_distributed() {
      %0 = "some_op"() : () -> vector<16x16xf32>
      %1 = "some_op"() : () -> vector<48x32xf32>
      %2 = vector.insert_strided_slice %0, %1 {offsets = [32, 4], strides = [1, 1]} : vector<16x16xf32> into vector<48x32xf32>
      %3 = xegpu.convert_layout %2 <{input_layout = #xegpu.layout<lane_layout = [16, 1], lane_data = [1, 1]>, target_layout = #xegpu.layout<lane_layout = [16, 1], lane_data = [1, 1]>}> : vector<48x32xf32>
      gpu.return
    }
    gpu.func @vector_insert_strided_slice_1d() {
      %0 = "some_op"() : () -> vector<16xf32>
      %1 = "some_op"() : () -> vector<48xf32>
      %2 = vector.insert_strided_slice %0, %1 {offsets = [16], strides = [1]} : vector<16xf32> into vector<48xf32>
      %3 = xegpu.convert_layout %2 <{input_layout = #xegpu.layout<lane_layout = [16], lane_data = [1]>, target_layout = #xegpu.layout<lane_layout = [16], lane_data = [1]>}> : vector<48xf32>
      gpu.return
    }
    gpu.func @vector_insert_strided_slice_different_ranks() {
      %0 = "some_op"() : () -> vector<16xf32>
      %1 = "some_op"() : () -> vector<64x16xf32>
      %2 = vector.insert_strided_slice %0, %1 {offsets = [13, 0], strides = [1]} : vector<16xf32> into vector<64x16xf32>
      %3 = xegpu.convert_layout %2 <{input_layout = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>, target_layout = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>}> : vector<64x16xf32>
      gpu.return
    }
    gpu.func @convert_layout_removed_when_compatible() {
      %0 = "some_op"() : () -> vector<16xf32>
      %1 = "some_op"() : () -> vector<1xf32>
      %2 = xegpu.convert_layout %0 <{input_layout = #xegpu.layout<lane_layout = [16], lane_data = [1]>, target_layout = #xegpu.slice<#xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>, dims = [0]>}> : vector<16xf32>
      %3 = xegpu.convert_layout %1 <{input_layout = #xegpu.slice<#xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>, dims = [0]>, target_layout = #xegpu.layout<lane_layout = [1], lane_data = [1]>}> : vector<1xf32>
      %4 = xegpu.convert_layout %3 <{input_layout = #xegpu.layout<lane_layout = [1], lane_data = [1]>, target_layout = #xegpu.slice<#xegpu.layout<lane_layout = [1, 1, 16], lane_data = [1, 1, 1]>, dims = [0, 1]>}> : vector<1xf32>
      gpu.return
    }
  }
}

// -----
module {
  gpu.module @xevm_module {
    gpu.func @convert_layout_scalar() {
      %0 = "some_op"() : () -> f32
      %1 = xegpu.convert_layout %0 <{input_layout = #xegpu.slice<#xegpu.layout<lane_layout = [16], lane_data = [1]>, dims = [0]>, target_layout = #xegpu.slice<#xegpu.layout<lane_layout = [16], lane_data = [1]>, dims = [0]>}> : f32
      "some_use"(%1) : (f32) -> ()
      gpu.return
    }
  }
}

// -----
module {
  gpu.module @xevm_module {
    gpu.func @load_store_matrix_1(%arg0: !xegpu.mem_desc<32x32xf32>) {
      %c0 = arith.constant 0 : index
      %0 = xegpu.load_matrix %arg0[%c0, %c0] <{layout = #xegpu.layout<lane_layout = [2, 8], lane_data = [1, 1]>}>: !xegpu.mem_desc<32x32xf32>, index, index -> vector<2x8xf32>
      xegpu.store_matrix %0, %arg0[%c0, %c0] <{layout = #xegpu.layout<lane_layout = [2, 8], lane_data = [1, 1]>}>: vector<2x8xf32>, !xegpu.mem_desc<32x32xf32>, index, index
      gpu.return
    }
  }
}

// -----
module {
  gpu.module @xevm_module {
    gpu.func @load_store_matrix_2(%arg0: !xegpu.mem_desc<32x32xf32>) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %0 = xegpu.load_matrix %arg0[%c0, %c1] <{layout = #xegpu.layout<lane_layout = [4, 4], lane_data = [2, 1]>}>: !xegpu.mem_desc<32x32xf32>, index, index -> vector<8x4xf32>
      xegpu.store_matrix %0, %arg0[%c0, %c1] <{layout = #xegpu.layout<lane_layout = [4, 4], lane_data = [2, 1]>}>: vector<8x4xf32>, !xegpu.mem_desc<32x32xf32>, index, index
      gpu.return
    }
  }
}

// -----
module {
  gpu.module @xevm_module {
    gpu.func @load_store_matrix_3(%arg0: !xegpu.mem_desc<32x32xf32, #xegpu.mem_layout<block = [16, 1], stride = [1, 32]>>) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %0 = xegpu.load_matrix %arg0[%c0, %c1] <{layout = #xegpu.layout<lane_layout = [16, 1], lane_data = [1, 1]>, subgroup_block_io}>: !xegpu.mem_desc<32x32xf32, #xegpu.mem_layout<block = [16, 1], stride = [1, 32]>>, index, index -> vector<16x2xf32>
      xegpu.store_matrix %0, %arg0[%c0, %c1] <{layout = #xegpu.layout<lane_layout = [16, 1], lane_data = [1, 1]>, subgroup_block_io}>: vector<16x2xf32>, !xegpu.mem_desc<32x32xf32, #xegpu.mem_layout<block = [16, 1], stride = [1, 32]>>, index, index
      gpu.return
    }
  }
}

// -----
module {
  gpu.module @xevm_module {
    gpu.func @elementwise_wrap_around_dim() {
      %0 = "some_op"() : () -> vector<16x1xf16>
      %1 = arith.negf %0 : vector<16x1xf16>
      %2 = xegpu.convert_layout %1 <{input_layout = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>, target_layout = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>}> : vector<16x1xf16>
      gpu.return
    }
  }
}

// -----
module {
  gpu.module @xevm_module {
    gpu.func @vector_step_slice() {
      %0 = vector.step : vector<16xindex>
      %1 = xegpu.convert_layout %0 <{input_layout = #xegpu.slice<#xegpu.layout<lane_layout = [1, 1, 1, 16], lane_data = [1, 1, 1, 1]>, dims = [0, 1, 2]>, target_layout = #xegpu.slice<#xegpu.layout<lane_layout = [1, 1, 1, 16], lane_data = [1, 1, 1, 1]>, dims = [0, 1, 2]>}> : vector<16xindex>
      gpu.return
    }
  }
}

// -----
module {
  gpu.module @xevm_module {
    gpu.func @vector_step_slice_unit() {
      %0 = vector.step : vector<1xindex>
      %1 = xegpu.convert_layout %0 <{input_layout = #xegpu.slice<#xegpu.layout<lane_layout = [1, 1, 1, 16], lane_data = [1, 1, 1, 1]>, dims = [0, 1, 3]>, target_layout = #xegpu.slice<#xegpu.layout<lane_layout = [1, 1, 1, 16], lane_data = [1, 1, 1, 1]>, dims = [0, 1, 3]>}> : vector<1xindex>
      gpu.return
    }
  }
}

// -----
module {
  gpu.module @xevm_module {
    gpu.func @vector_step_slice_multi_dist() {
      %0 = vector.step : vector<16xindex>
      %1 = xegpu.convert_layout %0 <{input_layout = #xegpu.slice<#xegpu.layout<lane_layout = [2, 4, 2], lane_data = [1, 2, 1]>, dims = [0, 2]>, target_layout = #xegpu.slice<#xegpu.layout<lane_layout = [2, 4, 2], lane_data = [1, 2, 1]>, dims = [0, 2]>}> : vector<16xindex>
      gpu.return
    }
  }
}

// -----
module {
  gpu.module @xevm_module {
    gpu.func @vector_shapecast_rank_increasing() {
      %0 = "some_op"() : () -> vector<16xf32>
      %1 = vector.shape_cast %0 : vector<16xf32> to vector<1x16xf32>
      %2 = xegpu.convert_layout %1 <{input_layout = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>, target_layout = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>}> : vector<1x16xf32>
      gpu.return
    }
  }
}

// -----
module {
  gpu.module @xevm_module {
    gpu.func @vector_shapecast_rank_reducing() {
      %0 = "some_op"() : () -> vector<1x16xf32>
      %1 = vector.shape_cast %0 : vector<1x16xf32> to vector<16xf32>
      %2 = xegpu.convert_layout %1 <{input_layout = #xegpu.slice<#xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>, dims = [0]>, target_layout = #xegpu.slice<#xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>, dims = [0]>}> : vector<16xf32>
      gpu.return
    }
  }
}

// -----
module {
  gpu.module @xevm_module {
    gpu.func @vector_shapecast_rank_increasing_without_slicing_layout() {
      %0 = "some_op"() : () -> vector<16xf32>
      %1 = vector.shape_cast %0 : vector<16xf32> to vector<1x16xf32>
      %2 = xegpu.convert_layout %1 <{input_layout = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>, target_layout = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>}> : vector<1x16xf32>
      gpu.return
    }
  }
}

// -----
module {
  gpu.module @xevm_module {
    gpu.func @vector_broadcast_1d_to_2d(%arg0: index) {
      %0 = "some_op"() : () -> vector<16xf16>
      %1 = vector.broadcast %0 : vector<16xf16> to vector<16x16xf16>
      %2 = xegpu.convert_layout %1 <{input_layout = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>, target_layout = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>}> : vector<16x16xf16>
      gpu.return
    }
  }
}

// -----
module {
  gpu.module @xevm_module {
    gpu.func @constant_wrap_around_dim() {
      %cst = arith.constant dense<1.000000e+00> : vector<16x1xf16>
      %0 = xegpu.convert_layout %cst <{input_layout = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>, target_layout = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>}> : vector<16x1xf16>
      gpu.return
    }
  }
}

// -----
module {
  gpu.module @xevm_module {
    gpu.func @vector_broadcast_2d_to_3d(%arg0: index) {
      %0 = "some_op"() : () -> vector<16x16xf16>
      %1 = vector.broadcast %0 : vector<16x16xf16> to vector<1x16x16xf16>
      %2 = xegpu.convert_layout %1 <{input_layout = #xegpu.layout<lane_layout = [1, 1, 16], lane_data = [1, 1, 1]>, target_layout = #xegpu.layout<lane_layout = [1, 1, 16], lane_data = [1, 1, 1]>}> : vector<1x16x16xf16>
      "some_use"(%2) : (vector<1x16x16xf16>) -> ()
      gpu.return
    }
  }
}

// -----
module {
  gpu.module @xevm_module {
    gpu.func @vector_broadcast_2d_to_2d_noop(%arg0: index) {
      %0 = "some_op"() : () -> vector<16x1xf16>
      %1 = vector.broadcast %0 : vector<16x1xf16> to vector<16x16xf16>
      %2 = xegpu.convert_layout %1 <{input_layout = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>, target_layout = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>}> : vector<16x16xf16>
      "some_use"(%2) : (vector<16x16xf16>) -> ()
      gpu.return
    }
  }
}

// -----
module {
  gpu.module @xevm_module {
    gpu.func @vector_broadcast_scalar_to_vector(%arg0: index) {
      %0 = "some_op"() : () -> f16
      %1 = vector.broadcast %0 : f16 to vector<16x16xf16>
      %2 = xegpu.convert_layout %1 <{input_layout = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>, target_layout = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>}> : vector<16x16xf16>
      "some_use"(%2) : (vector<16x16xf16>) -> ()
      gpu.return
    }
  }
}

// -----
module {
  gpu.module @xevm_module {
    gpu.func @vector_broadcast_scalar_to_vector_uniform(%arg0: index) {
      %0 = "some_op"() : () -> f16
      %1 = vector.broadcast %0 : f16 to vector<16x16xf16>
      "some_use"(%1) : (vector<16x16xf16>) -> ()
      gpu.return
    }
  }
}

// -----
module {
  gpu.module @xevm_module {
    gpu.func @vector_multi_reduction_1d_to_scalar() {
      %0 = "some_op"() : () -> vector<32xf32>
      %cst = arith.constant 0.000000e+00 : f32
      %1 = vector.multi_reduction <add>, %0, %cst [0] : vector<32xf32> to f32
      %2 = xegpu.convert_layout %1 <{input_layout = #xegpu.slice<#xegpu.layout<lane_layout = [16], lane_data = [1]>, dims = [0]>, target_layout = #xegpu.slice<#xegpu.layout<lane_layout = [16], lane_data = [1]>, dims = [0]>}> : f32
      gpu.return
    }
  }
}

// -----
module {
  gpu.module @xevm_module {
    gpu.func @vector_interleave() {
      %cst = arith.constant dense<2.000000e+00> : vector<8x2xf32>
      %cst_0 = arith.constant dense<3.000000e+00> : vector<8x2xf32>
      %0 = vector.interleave %cst, %cst_0 : vector<8x2xf32> -> vector<8x4xf32>
      %1 = xegpu.convert_layout %0 <{input_layout = #xegpu.layout<lane_layout = [8, 2], lane_data = [1, 2]>, target_layout = #xegpu.layout<lane_layout = [8, 2], lane_data = [1, 2]>}> : vector<8x4xf32>
      gpu.return
    }
  }
}

// -----
module {
  gpu.module @xevm_module {
    gpu.func @vector_deinterleave() {
      %cst = arith.constant dense<3.000000e+00> : vector<8x4xf32>
      %res1, %res2 = vector.deinterleave %cst : vector<8x4xf32> -> vector<8x2xf32>
      %0 = xegpu.convert_layout %res1 <{input_layout = #xegpu.layout<lane_layout = [8, 2], lane_data = [1, 1]>, target_layout = #xegpu.layout<lane_layout = [8, 2], lane_data = [1, 1]>}> : vector<8x2xf32>
      gpu.return
    }
  }
}

// -----
module {
  gpu.module @xevm_module {
    gpu.func @xegpu_dpas_mx(%arg0: !xegpu.mem_desc<8x8xf16>, %arg1: !xegpu.mem_desc<8x8xf16>) {
      %cst = arith.constant dense<3.000000e+00> : vector<8x16xf8E4M3FN>
      %cst_0 = arith.constant dense<3.000000e+00> : vector<16x16xf8E4M3FN>
      %cst_1 = arith.constant dense<1.000000e+00> : vector<8x2xf8E8M0FNU>
      %cst_2 = arith.constant dense<5.000000e-01> : vector<2x16xf8E8M0FNU>
      %0 = xegpu.dpas_mx %cst, %cst_0 scale_a = %cst_1 scale_b = %cst_2 {layout_a = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>, layout_a_scale = #xegpu.layout<lane_layout = [8, 1], lane_data = [1, 1]>, layout_b = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>, layout_b_scale = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>, layout_cd = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>} : (vector<8x16xf8E4M3FN>, vector<16x16xf8E4M3FN>, vector<8x2xf8E8M0FNU>, vector<2x16xf8E8M0FNU>) -> vector<8x16xf32>
      %1 = xegpu.convert_layout %0 <{input_layout = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>, target_layout = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>}> : vector<8x16xf32>
      gpu.return
    }
  }
}

// -----
module {
  gpu.module @xevm_module {
    gpu.func @convert_layout_partial_subgroup() {
      %cst = arith.constant dense<1.000000e+00> : vector<8x64xf4E2M1FN>
      %cst_0 = arith.constant dense<1.000000e+00> : vector<64x16xf4E2M1FN>
      %cst_1 = arith.constant dense<1.000000e+00> : vector<2x16xf8E8M0FNU>
      %cst_2 = arith.constant dense<1.000000e+00> : vector<16x4xf8E8M0FNU>
      %0 = xegpu.convert_layout %cst_2 <{input_layout = #xegpu.layout<lane_layout = [16, 1], lane_data = [1, 1]>, target_layout = #xegpu.layout<lane_layout = [8, 1], lane_data = [1, 1]>}> : vector<16x4xf8E8M0FNU>
      %1 = vector.extract_strided_slice %0 {offsets = [0, 0], sizes = [8, 2], strides = [1, 1]} : vector<16x4xf8E8M0FNU> to vector<8x2xf8E8M0FNU>
      %2 = vector.extract_strided_slice %0 {offsets = [8, 0], sizes = [8, 2], strides = [1, 1]} : vector<16x4xf8E8M0FNU> to vector<8x2xf8E8M0FNU>
      %3 = xegpu.dpas_mx %cst, %cst_0 scale_a = %1 scale_b = %cst_1 {layout_a = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>, layout_a_scale = #xegpu.layout<lane_layout = [8, 1], lane_data = [1, 1]>, layout_b = #xegpu.layout<lane_layout = [1, 16], lane_data = [8, 1]>, layout_b_scale = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>, layout_cd = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>} : (vector<8x64xf4E2M1FN>, vector<64x16xf4E2M1FN>, vector<8x2xf8E8M0FNU>, vector<2x16xf8E8M0FNU>) -> vector<8x16xf32>
      %4 = xegpu.dpas_mx %cst, %cst_0 scale_a = %2 scale_b = %cst_1 {layout_a = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>, layout_a_scale = #xegpu.layout<lane_layout = [8, 1], lane_data = [1, 1]>, layout_b = #xegpu.layout<lane_layout = [1, 16], lane_data = [8, 1]>, layout_b_scale = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>, layout_cd = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>} : (vector<8x64xf4E2M1FN>, vector<64x16xf4E2M1FN>, vector<8x2xf8E8M0FNU>, vector<2x16xf8E8M0FNU>) -> vector<8x16xf32>
      gpu.return
    }
  }
}

