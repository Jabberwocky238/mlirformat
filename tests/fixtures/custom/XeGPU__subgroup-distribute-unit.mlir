module {
  gpu.module @xevm_module {
    gpu.func @store_nd_1d(%arg0: index) {
      %c0 = arith.constant 0 : index
      gpu.warp_execute_on_lane_0(%arg0)[16] {
        %0 = "some_op"() : () -> !xegpu.tensor_desc<16xf32, #xegpu.layout<lane_layout = [16], lane_data = [1]>>
        %1 = "some_op"() : () -> vector<16xf32>
        xegpu.store_nd %1, %0[%c0]  {layout_operand_0 = #xegpu.layout<lane_layout = [16], lane_data = [1]>} : vector<16xf32>, !xegpu.tensor_desc<16xf32, #xegpu.layout<lane_layout = [16], lane_data = [1]>>
      }
      gpu.return
    }
    gpu.func @store_nd_2d(%arg0: index) {
      %c0 = arith.constant 0 : index
      gpu.warp_execute_on_lane_0(%arg0)[16] {
        %0 = "some_op"() : () -> !xegpu.tensor_desc<16x16xf16, #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>>
        %1 = "some_op"() : () -> vector<16x16xf16>
        xegpu.store_nd %1, %0[%c0, %c0]  {layout_operand_0 = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>} : vector<16x16xf16>, !xegpu.tensor_desc<16x16xf16, #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>>
      }
      gpu.return
    }
    gpu.func @load_nd_1d(%arg0: index) {
      %c0 = arith.constant 0 : index
      %0 = gpu.warp_execute_on_lane_0(%arg0)[16] -> (vector<1xf32>) {
        %1 = "some_op"() : () -> !xegpu.tensor_desc<16xf32, #xegpu.layout<lane_layout = [16], lane_data = [1]>>
        %2 = xegpu.load_nd %1[%c0]  {layout_result_0 = #xegpu.layout<lane_layout = [16], lane_data = [1]>} : !xegpu.tensor_desc<16xf32, #xegpu.layout<lane_layout = [16], lane_data = [1]>> -> vector<16xf32>
        gpu.yield %2 : vector<16xf32>
      }
      "some_user_op"(%0) : (vector<1xf32>) -> ()
      gpu.return
    }
    gpu.func @load_nd_2d(%arg0: index) {
      %c0 = arith.constant 0 : index
      %0 = gpu.warp_execute_on_lane_0(%arg0)[16] -> (vector<16x1xf16>) {
        %1 = "some_op"() : () -> !xegpu.tensor_desc<16x16xf16, #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>>
        %2 = xegpu.load_nd %1[%c0, %c0]  {layout_result_0 = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>} : !xegpu.tensor_desc<16x16xf16, #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>> -> vector<16x16xf16>
        gpu.yield %2 : vector<16x16xf16>
      }
      "some_user_op"(%0) : (vector<16x1xf16>) -> ()
      gpu.return
    }
    gpu.func @load_nd_array_length(%arg0: index) {
      %c0 = arith.constant 0 : index
      %0 = gpu.warp_execute_on_lane_0(%arg0)[16] -> (vector<2x16x1xf16>) {
        %1 = "some_op"() : () -> !xegpu.tensor_desc<16x16xf16, #xegpu.block_tdesc_attr<array_length = 2 : i64>, #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>>
        %2 = xegpu.load_nd %1[%c0, %c0]  {layout_result_0 = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>} : !xegpu.tensor_desc<16x16xf16, #xegpu.block_tdesc_attr<array_length = 2 : i64>, #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>> -> vector<2x16x16xf16>
        gpu.yield %2 : vector<2x16x16xf16>
      }
      "some_user_op"(%0) : (vector<2x16x1xf16>) -> ()
      gpu.return
    }
    gpu.func @dpas(%arg0: index) {
      %0 = gpu.warp_execute_on_lane_0(%arg0)[16] -> (vector<8x1xf32>) {
        %1 = "some_op"() : () -> vector<8x16xf16>
        %2 = "some_op"() : () -> vector<16x16xf16>
        %3 = "some_op"() : () -> vector<8x16xf32>
        %4 = xegpu.dpas %1, %2, %3 {layout_a = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>, layout_b = #xegpu.layout<lane_layout = [1, 16], lane_data = [2, 1]>, layout_cd = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>} : vector<8x16xf16>, vector<16x16xf16>, vector<8x16xf32> -> vector<8x16xf32>
        gpu.yield %4 : vector<8x16xf32>
      }
      "some_user_op"(%0) : (vector<8x1xf32>) -> ()
      gpu.return
    }
    gpu.func @create_nd_tdesc_non_memref(%arg0: ui64, %arg1: index) {
      %c0 = arith.constant 0 : index
      %0 = gpu.warp_execute_on_lane_0(%arg1)[16] -> (!xegpu.tensor_desc<16x16xf16, #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>>) {
        %1 = xegpu.create_nd_tdesc %arg0, shape : [64, 128], strides : [128, 1] : ui64 -> !xegpu.tensor_desc<16x16xf16, #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>>
        gpu.yield %1 : !xegpu.tensor_desc<16x16xf16, #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>>
      }
      "some_user_op"(%0) : (!xegpu.tensor_desc<16x16xf16, #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>>) -> ()
      gpu.return
    }
    gpu.func @prefetch_2d(%arg0: index) {
      %c0 = arith.constant 0 : index
      gpu.warp_execute_on_lane_0(%arg0)[16] {
        %0 = "some_op"() : () -> !xegpu.tensor_desc<16x16xf16, #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>>
        xegpu.prefetch_nd %0[%c0, %c0] <{l1_hint = #xegpu.cache_hint<cached>, l2_hint = #xegpu.cache_hint<uncached>}> : !xegpu.tensor_desc<16x16xf16, #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>>
      }
      gpu.return
    }
    gpu.func @prefetch_1d(%arg0: index) {
      %c0 = arith.constant 0 : index
      gpu.warp_execute_on_lane_0(%arg0)[16] {
        %0 = "some_op"() : () -> !xegpu.tensor_desc<16xf16, #xegpu.layout<lane_layout = [16], lane_data = [1]>>
        xegpu.prefetch_nd %0[%c0] <{l1_hint = #xegpu.cache_hint<cached>, l2_hint = #xegpu.cache_hint<uncached>}> : !xegpu.tensor_desc<16xf16, #xegpu.layout<lane_layout = [16], lane_data = [1]>>
      }
      gpu.return
    }
    gpu.func @gpu_barrier(%arg0: index) {
      %c0 = arith.constant 0 : index
      %0 = gpu.warp_execute_on_lane_0(%arg0)[16] -> (vector<1xf16>) {
        %1 = "some_op"() : () -> !xegpu.tensor_desc<16xf16, #xegpu.layout<lane_layout = [16], lane_data = [1]>>
        %2 = xegpu.load_nd %1[%c0]  {layout_result_0 = #xegpu.layout<lane_layout = [16], lane_data = [1]>} : !xegpu.tensor_desc<16xf16, #xegpu.layout<lane_layout = [16], lane_data = [1]>> -> vector<16xf16>
        gpu.barrier
        gpu.yield %2 : vector<16xf16>
      }
      "some_user_op"(%0) : (vector<1xf16>) -> ()
      gpu.return
    }
    gpu.func @vector_multi_reduction_dim1_distributed_dim0_reduction(%arg0: index) {
      %c0 = arith.constant 0 : index
      %0 = gpu.warp_execute_on_lane_0(%arg0)[16] -> (vector<2xf32>) {
        %1 = "some_def"() {layout_result_0 = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>} : () -> vector<16x32xf32>
        %cst = arith.constant {layout_result_0 = #xegpu.slice<#xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>, dims = [0]>} dense<0.000000e+00> : vector<32xf32>
        %2 = vector.multi_reduction <add>, %1, %cst {layout_operand_0 = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>, layout_operand_1 = #xegpu.slice<#xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>, dims = [0]>, layout_result_0 = #xegpu.slice<#xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>, dims = [0]>} [0] : vector<16x32xf32> to vector<32xf32>
        gpu.yield %2 : vector<32xf32>
      }
      "some_user_op"(%0) : (vector<2xf32>) -> ()
      gpu.return
    }
    gpu.func @vector_multi_reduction_dim1_distributed_dim1_reduction(%arg0: index) {
      %c0 = arith.constant 0 : index
      %0 = gpu.warp_execute_on_lane_0(%arg0)[16] -> (vector<2xf32>) {
        %1 = "some_def"() {layout_result_0 = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>} : () -> vector<2x16xf32>
        %cst = arith.constant {layout_result_0 = #xegpu.slice<#xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>, dims = [1]>} dense<0.000000e+00> : vector<2xf32>
        %2 = vector.multi_reduction <add>, %1, %cst {layout_operand_0 = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>, layout_operand_1 = #xegpu.slice<#xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>, dims = [1]>, layout_result_0 = #xegpu.slice<#xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>, dims = [1]>} [1] : vector<2x16xf32> to vector<2xf32>
        gpu.yield %2 : vector<2xf32>
      }
      "some_user_op"(%0) : (vector<2xf32>) -> ()
      gpu.return
    }
    gpu.func @vector_multi_reduction_dim0_distributed_dim1_reduction(%arg0: index) {
      %c0 = arith.constant 0 : index
      %0 = gpu.warp_execute_on_lane_0(%arg0)[16] -> (vector<2xf32>) {
        %1 = "some_def"() {layout_result_0 = #xegpu.layout<lane_layout = [16, 1], lane_data = [1, 1]>} : () -> vector<32x16xf32>
        %cst = arith.constant {layout_result_0 = #xegpu.slice<#xegpu.layout<lane_layout = [16, 1], lane_data = [1, 1]>, dims = [1]>} dense<0.000000e+00> : vector<32xf32>
        %2 = vector.multi_reduction <add>, %1, %cst {layout_operand_0 = #xegpu.layout<lane_layout = [16, 1], lane_data = [1, 1]>, layout_operand_1 = #xegpu.slice<#xegpu.layout<lane_layout = [16, 1], lane_data = [1, 1]>, dims = [1]>, layout_result_0 = #xegpu.slice<#xegpu.layout<lane_layout = [16, 1], lane_data = [1, 1]>, dims = [1]>} [1] : vector<32x16xf32> to vector<32xf32>
        gpu.yield %2 : vector<32xf32>
      }
      "some_user_op"(%0) : (vector<2xf32>) -> ()
      gpu.return
    }
    gpu.func @vector_multi_reduction_dim0_distributed_dim0_reduction(%arg0: index) {
      %c0 = arith.constant 0 : index
      %0 = gpu.warp_execute_on_lane_0(%arg0)[16] -> (vector<2xf32>) {
        %1 = "some_def"() {layout_result_0 = #xegpu.layout<lane_layout = [16, 1], lane_data = [1, 1]>} : () -> vector<16x2xf32>
        %cst = arith.constant {layout_result_0 = #xegpu.slice<#xegpu.layout<lane_layout = [16, 1], lane_data = [1, 1]>, dims = [0]>} dense<0.000000e+00> : vector<2xf32>
        %2 = vector.multi_reduction <add>, %1, %cst {layout_operand_0 = #xegpu.layout<lane_layout = [16, 1], lane_data = [1, 1]>, layout_operand_1 = #xegpu.slice<#xegpu.layout<lane_layout = [16, 1], lane_data = [1, 1]>, dims = [0]>, layout_result_0 = #xegpu.slice<#xegpu.layout<lane_layout = [16, 1], lane_data = [1, 1]>, dims = [0]>} [0] : vector<16x2xf32> to vector<2xf32>
        gpu.yield %2 : vector<2xf32>
      }
      "some_user_op"(%0) : (vector<2xf32>) -> ()
      gpu.return
    }
    gpu.func @scatter_ops_chunksize(%arg0: index, %arg1: memref<256xf16>) {
      gpu.warp_execute_on_lane_0(%arg0)[16] {
        %cst = arith.constant {layout_result_0 = #xegpu.layout<lane_layout = [16], lane_data = [1]>} dense<true> : vector<16xi1>
        %cst_0 = arith.constant {layout_result_0 = #xegpu.layout<lane_layout = [16], lane_data = [1]>} dense<12> : vector<16xindex>
        %0 = xegpu.load %arg1[%cst_0], %cst <{chunk_size = 8 : i64}> {layout_operand_1 = #xegpu.layout<lane_layout = [16], lane_data = [1]>, layout_operand_2 = #xegpu.layout<lane_layout = [16], lane_data = [1]>, layout_result_0 = #xegpu.layout<lane_layout = [16, 1], lane_data = [1, 2]>} : memref<256xf16>, vector<16xindex>, vector<16xi1> -> vector<16x8xf16>
        xegpu.store %0, %arg1[%cst_0], %cst <{chunk_size = 8 : i64}> {layout_operand_0 = #xegpu.layout<lane_layout = [16, 1], lane_data = [1, 2]>, layout_operand_2 = #xegpu.layout<lane_layout = [16], lane_data = [1]>, layout_operand_3 = #xegpu.layout<lane_layout = [16], lane_data = [1]>} : vector<16x8xf16>, memref<256xf16>, vector<16xindex>, vector<16xi1>
      }
      gpu.return
    }
    gpu.func @scatter_ops(%arg0: memref<256xf16>, %arg1: index) {
      gpu.warp_execute_on_lane_0(%arg1)[16] {
        %cst = arith.constant {layout_result_0 = #xegpu.layout<lane_layout = [16], lane_data = [1]>} dense<true> : vector<16xi1>
        %cst_0 = arith.constant {layout_result_0 = #xegpu.layout<lane_layout = [16], lane_data = [1]>} dense<12> : vector<16xindex>
        %0 = xegpu.load %arg0[%cst_0], %cst  {layout_operand_1 = #xegpu.layout<lane_layout = [16], lane_data = [1]>, layout_operand_2 = #xegpu.layout<lane_layout = [16], lane_data = [1]>, layout_result_0 = #xegpu.layout<lane_layout = [16], lane_data = [1]>} : memref<256xf16>, vector<16xindex>, vector<16xi1> -> vector<16xf16>
        xegpu.store %0, %arg0[%cst_0], %cst  {layout_operand_0 = #xegpu.layout<lane_layout = [16], lane_data = [1]>, layout_operand_2 = #xegpu.layout<lane_layout = [16], lane_data = [1]>, layout_operand_3 = #xegpu.layout<lane_layout = [16], lane_data = [1]>} : vector<16xf16>, memref<256xf16>, vector<16xindex>, vector<16xi1>
      }
      gpu.return
    }
    gpu.func @memref_extract_aligned_pointer_as_index(%arg0: memref<256x256xf16>, %arg1: index) {
      %0 = gpu.warp_execute_on_lane_0(%arg1)[16] -> (index) {
        %intptr = memref.extract_aligned_pointer_as_index %arg0 : memref<256x256xf16> -> index
        gpu.yield %intptr : index
      }
      %1 = arith.index_cast %0 : index to i64
      "some_user_op"(%1) : (i64) -> ()
      gpu.return
    }
    gpu.func @vector_transpose(%arg0: index) {
      %0 = gpu.warp_execute_on_lane_0(%arg0)[16] -> (vector<2x1xf32>) {
        %1 = "some_op"() {layout_result_0 = #xegpu.layout<lane_layout = [16, 1], lane_data = [1, 1]>} : () -> vector<16x2xf32>
        %2 = vector.transpose %1, [1, 0] {layout_operand_0 = #xegpu.layout<lane_layout = [16, 1], lane_data = [1, 1]>, layout_result_0 = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>} : vector<16x2xf32> to vector<2x16xf32>
        gpu.yield %2 : vector<2x16xf32>
      }
      "some_user_op"(%0) : (vector<2x1xf32>) -> ()
      gpu.return
    }
    gpu.func @vector_bitcast(%arg0: index) {
      %0 = gpu.warp_execute_on_lane_0(%arg0)[16] -> (vector<4x1xi16>) {
        %1 = "some_op"() {layout_result_0 = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 2]>} : () -> vector<4x32xi8>
        %2 = vector.bitcast %1 {layout_operand_0 = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 2]>, layout_result_0 = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>} : vector<4x32xi8> to vector<4x16xi16>
        gpu.yield %2 : vector<4x16xi16>
      }
      "some_user_op"(%0) : (vector<4x1xi16>) -> ()
      gpu.return
    }
    gpu.func @vector_shapecast_rank_increasing(%arg0: index) {
      %0 = gpu.warp_execute_on_lane_0(%arg0)[16] -> (vector<1x1xf32>) {
        %1 = "some_op"() {layout_result_0 = #xegpu.slice<#xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>, dims = [0]>} : () -> vector<16xf32>
        %2 = vector.shape_cast %1 {layout_operand_0 = #xegpu.slice<#xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>, dims = [0]>, layout_result_0 = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>} : vector<16xf32> to vector<1x16xf32>
        gpu.yield %2 : vector<1x16xf32>
      }
      "some_user_op"(%0) : (vector<1x1xf32>) -> ()
      gpu.return
    }
    gpu.func @vector_shapecast_rank_reducing(%arg0: index) {
      %0 = gpu.warp_execute_on_lane_0(%arg0)[16] -> (vector<1xf32>) {
        %1 = "some_op"() {layout_result_0 = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>} : () -> vector<1x16xf32>
        %2 = vector.shape_cast %1 {layout_operand_0 = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>, layout_result_0 = #xegpu.slice<#xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>, dims = [0]>} : vector<1x16xf32> to vector<16xf32>
        gpu.yield %2 : vector<16xf32>
      }
      "some_user_op"(%0) : (vector<1xf32>) -> ()
      gpu.return
    }
    gpu.func @vector_shapecast_unsupported(%arg0: index) {
      %0 = gpu.warp_execute_on_lane_0(%arg0)[16] -> (vector<1x1xf32>) {
        %1 = "some_op"() {layout_result_0 = #xegpu.layout<lane_layout = [16], lane_data = [1]>} : () -> vector<16xf32>
        %2 = vector.shape_cast %1 {layout_operand_0 = #xegpu.layout<lane_layout = [16], lane_data = [1]>, layout_result_0 = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>} : vector<16xf32> to vector<1x16xf32>
        gpu.yield %2 : vector<1x16xf32>
      }
      "some_user_op"(%0) : (vector<1x1xf32>) -> ()
      gpu.return
    }
    gpu.func @vector_extract_strided_slice_distributed_dim_fully_extracted(%arg0: index) {
      %0 = gpu.warp_execute_on_lane_0(%arg0)[16] -> (vector<8x1xf32>) {
        %1 = "some_def"() : () -> vector<24x16xf32>
        %2 = vector.extract_strided_slice %1 {layout_operand_0 = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>, layout_result_0 = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>, offsets = [8, 0], sizes = [8, 16], strides = [1, 1]} : vector<24x16xf32> to vector<8x16xf32>
        gpu.yield %2 : vector<8x16xf32>
      }
      "some_use"(%0) : (vector<8x1xf32>) -> ()
      gpu.return
    }
    gpu.func @vector_extract_strided_slice_non_distributed(%arg0: index) {
      %0 = gpu.warp_execute_on_lane_0(%arg0)[16] -> (vector<8x1xf32>) {
        %1 = "some_def"() : () -> vector<24x1xf32>
        %2 = vector.extract_strided_slice %1 {layout_operand_0 = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>, layout_result_0 = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>, offsets = [8, 0], sizes = [8, 1], strides = [1, 1]} : vector<24x1xf32> to vector<8x1xf32>
        gpu.yield %2 : vector<8x1xf32>
      }
      "some_use"(%0) : (vector<8x1xf32>) -> ()
      gpu.return
    }
    gpu.func @vector_extract_strided_slice_inner_distributed(%arg0: index) {
      %0 = gpu.warp_execute_on_lane_0(%arg0)[16] -> (vector<8x1xf32>) {
        %1 = "some_def"() : () -> vector<24x64xf32>
        %2 = vector.extract_strided_slice %1 {layout_operand_0 = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>, layout_result_0 = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>, offsets = [8, 48], sizes = [8, 16], strides = [1, 1]} : vector<24x64xf32> to vector<8x16xf32>
        gpu.yield %2 : vector<8x16xf32>
      }
      "some_use"(%0) : (vector<8x1xf32>) -> ()
      gpu.return
    }
    gpu.func @vector_extract_strided_slice_outer_distributed(%arg0: index) {
      %0 = gpu.warp_execute_on_lane_0(%arg0)[16] -> (vector<1x16xf32>) {
        %1 = "some_def"() : () -> vector<32x16xf32>
        %2 = vector.extract_strided_slice %1 {layout_operand_0 = #xegpu.layout<lane_layout = [16, 1], lane_data = [1, 1]>, layout_result_0 = #xegpu.layout<lane_layout = [16, 1], lane_data = [1, 1]>, offsets = [16], sizes = [16], strides = [1]} : vector<32x16xf32> to vector<16x16xf32>
        gpu.yield %2 : vector<16x16xf32>
      }
      "some_use"(%0) : (vector<1x16xf32>) -> ()
      gpu.return
    }
    gpu.func @vector_extract_strided_slice_1d(%arg0: index) {
      %0 = gpu.warp_execute_on_lane_0(%arg0)[16] -> (vector<2xf32>) {
        %1 = "some_def"() : () -> vector<64xf32>
        %2 = vector.extract_strided_slice %1 {layout_operand_0 = #xegpu.layout<lane_layout = [16], lane_data = [1]>, layout_result_0 = #xegpu.layout<lane_layout = [16], lane_data = [1]>, offsets = [16], sizes = [32], strides = [1]} : vector<64xf32> to vector<32xf32>
        gpu.yield %2 : vector<32xf32>
      }
      "some_use"(%0) : (vector<2xf32>) -> ()
      gpu.return
    }
    gpu.func @vector_extract_strided_slice_unsopported_offset(%arg0: index) {
      %0 = gpu.warp_execute_on_lane_0(%arg0)[16] -> (vector<2xf32>) {
        %1 = "some_def"() : () -> vector<64xf32>
        %2 = vector.extract_strided_slice %1 {layout_operand_0 = #xegpu.layout<lane_layout = [16], lane_data = [1]>, layout_result_0 = #xegpu.layout<lane_layout = [16], lane_data = [1]>, offsets = [3], sizes = [32], strides = [1]} : vector<64xf32> to vector<32xf32>
        gpu.yield %2 : vector<32xf32>
      }
      "some_use"(%0) : (vector<2xf32>) -> ()
      gpu.return
    }
    gpu.func @vector_extract_strided_slice_unsopported_source(%arg0: index) {
      %0 = gpu.warp_execute_on_lane_0(%arg0)[16] -> (vector<2xf32>) {
        %1 = "some_def"() : () -> vector<54xf32>
        %2 = vector.extract_strided_slice %1 {layout_operand_0 = #xegpu.layout<lane_layout = [16], lane_data = [1]>, layout_result_0 = #xegpu.layout<lane_layout = [16], lane_data = [1]>, offsets = [0], sizes = [32], strides = [1]} : vector<54xf32> to vector<32xf32>
        gpu.yield %2 : vector<32xf32>
      }
      "some_use"(%0) : (vector<2xf32>) -> ()
      gpu.return
    }
    gpu.func @vector_extract_strided_slice_partial_offsets(%arg0: index) {
      %0 = gpu.warp_execute_on_lane_0(%arg0)[16] -> (vector<8x1xf32>) {
        %1 = "some_def"() : () -> vector<24x16xf32>
        %2 = vector.extract_strided_slice %1 {layout_operand_0 = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>, layout_result_0 = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>, offsets = [8], sizes = [8], strides = [1]} : vector<24x16xf32> to vector<8x16xf32>
        gpu.yield %2 : vector<8x16xf32>
      }
      "some_use"(%0) : (vector<8x1xf32>) -> ()
      gpu.return
    }
    gpu.func @vector_insert_strided_slice_distributed_dim_fully_inserted(%arg0: index) {
      %0 = gpu.warp_execute_on_lane_0(%arg0)[16] -> (vector<64x1xf32>) {
        %1 = "some_def"() : () -> vector<16x16xf32>
        %2 = "some_def"() : () -> vector<64x16xf32>
        %3 = vector.insert_strided_slice %1, %2 {layout_operand_0 = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>, layout_operand_1 = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>, layout_result_0 = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>, offsets = [24, 0], strides = [1, 1]} : vector<16x16xf32> into vector<64x16xf32>
        gpu.yield %3 : vector<64x16xf32>
      }
      "some_use"(%0) : (vector<64x1xf32>) -> ()
      gpu.return
    }
    gpu.func @vector_insert_strided_slice_non_distributed(%arg0: index) {
      %0 = gpu.warp_execute_on_lane_0(%arg0)[16] -> (vector<64x1xf32>) {
        %1 = "some_def"() : () -> vector<16x1xf32>
        %2 = "some_def"() : () -> vector<64x1xf32>
        %3 = vector.insert_strided_slice %1, %2 {layout_operand_0 = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>, layout_operand_1 = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>, layout_result_0 = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>, offsets = [24, 0], strides = [1, 1]} : vector<16x1xf32> into vector<64x1xf32>
        gpu.yield %3 : vector<64x1xf32>
      }
      "some_use"(%0) : (vector<64x1xf32>) -> ()
      gpu.return
    }
    gpu.func @vector_insert_strided_slice_inner_distributed(%arg0: index) {
      %0 = gpu.warp_execute_on_lane_0(%arg0)[16] -> (vector<64x2xf32>) {
        %1 = "some_def"() : () -> vector<16x16xf32>
        %2 = "some_def"() : () -> vector<64x32xf32>
        %3 = vector.insert_strided_slice %1, %2 {layout_operand_0 = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>, layout_operand_1 = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>, layout_result_0 = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>, offsets = [24, 16], strides = [1, 1]} : vector<16x16xf32> into vector<64x32xf32>
        gpu.yield %3 : vector<64x32xf32>
      }
      "some_use"(%0) : (vector<64x2xf32>) -> ()
      gpu.return
    }
    gpu.func @vector_insert_strided_slice_outer_distributed(%arg0: index) {
      %0 = gpu.warp_execute_on_lane_0(%arg0)[16] -> (vector<3x32xf32>) {
        %1 = "some_def"() : () -> vector<16x16xf32>
        %2 = "some_def"() : () -> vector<48x32xf32>
        %3 = vector.insert_strided_slice %1, %2 {layout_operand_0 = #xegpu.layout<lane_layout = [16, 1], lane_data = [1, 1]>, layout_operand_1 = #xegpu.layout<lane_layout = [16, 1], lane_data = [1, 1]>, layout_result_0 = #xegpu.layout<lane_layout = [16, 1], lane_data = [1, 1]>, offsets = [32, 4], strides = [1, 1]} : vector<16x16xf32> into vector<48x32xf32>
        gpu.yield %3 : vector<48x32xf32>
      }
      "some_use"(%0) : (vector<3x32xf32>) -> ()
      gpu.return
    }
    gpu.func @vector_insert_strided_slice_1d(%arg0: index) {
      %0 = gpu.warp_execute_on_lane_0(%arg0)[16] -> (vector<3xf32>) {
        %1 = "some_def"() : () -> vector<16xf32>
        %2 = "some_def"() : () -> vector<48xf32>
        %3 = vector.insert_strided_slice %1, %2 {layout_operand_0 = #xegpu.layout<lane_layout = [16], lane_data = [1]>, layout_operand_1 = #xegpu.layout<lane_layout = [16], lane_data = [1]>, layout_result_0 = #xegpu.layout<lane_layout = [16], lane_data = [1]>, offsets = [16], strides = [1]} : vector<16xf32> into vector<48xf32>
        gpu.yield %3 : vector<48xf32>
      }
      "some_use"(%0) : (vector<3xf32>) -> ()
      gpu.return
    }
    gpu.func @vector_insert_strided_slice_different_ranks(%arg0: index) {
      %0 = gpu.warp_execute_on_lane_0(%arg0)[16] -> (vector<64x1xf32>) {
        %1 = "some_def"() : () -> vector<16xf32>
        %2 = "some_def"() : () -> vector<64x16xf32>
        %3 = vector.insert_strided_slice %1, %2 {layout_operand_0 = #xegpu.layout<lane_layout = [16], lane_data = [1]>, layout_operand_1 = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>, layout_result_0 = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>, offsets = [13, 0], strides = [1]} : vector<16xf32> into vector<64x16xf32>
        gpu.yield %3 : vector<64x16xf32>
      }
      "some_use"(%0) : (vector<64x1xf32>) -> ()
      gpu.return
    }
    gpu.func @vector_insert_strided_slice_unsupported_source(%arg0: index) {
      %0 = gpu.warp_execute_on_lane_0(%arg0)[16] -> (vector<3xf32>) {
        %1 = "some_def"() : () -> vector<8xf32>
        %2 = "some_def"() : () -> vector<48xf32>
        %3 = vector.insert_strided_slice %1, %2 {layout_operand_0 = #xegpu.layout<lane_layout = [16], lane_data = [1]>, layout_operand_1 = #xegpu.layout<lane_layout = [16], lane_data = [1]>, layout_result_0 = #xegpu.layout<lane_layout = [16], lane_data = [1]>, offsets = [16], strides = [1]} : vector<8xf32> into vector<48xf32>
        gpu.yield %3 : vector<48xf32>
      }
      "some_use"(%0) : (vector<3xf32>) -> ()
      gpu.return
    }
    gpu.func @vector_insert_strided_slice_unsupported_offset(%arg0: index) {
      %0 = gpu.warp_execute_on_lane_0(%arg0)[16] -> (vector<3xf32>) {
        %1 = "some_def"() : () -> vector<16xf32>
        %2 = "some_def"() : () -> vector<48xf32>
        %3 = vector.insert_strided_slice %1, %2 {layout_operand_0 = #xegpu.layout<lane_layout = [16], lane_data = [1]>, layout_operand_1 = #xegpu.layout<lane_layout = [16], lane_data = [1]>, layout_result_0 = #xegpu.layout<lane_layout = [16], lane_data = [1]>, offsets = [3], strides = [1]} : vector<16xf32> into vector<48xf32>
        gpu.yield %3 : vector<48xf32>
      }
      "some_use"(%0) : (vector<3xf32>) -> ()
      gpu.return
    }
    gpu.func @vector_broadcast_1d_to_2d_broadcast_within_lane(%arg0: index) {
      %0 = gpu.warp_execute_on_lane_0(%arg0)[16] -> (vector<16x1xf16>) {
        %1 = "some_def"() : () -> vector<16xf16>
        %2 = vector.broadcast %1 {layout_operand_0 = #xegpu.slice<#xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>, dims = [0]>, layout_result_0 = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>} : vector<16xf16> to vector<16x16xf16>
        gpu.yield %2 : vector<16x16xf16>
      }
      "some_use"(%0) : (vector<16x1xf16>) -> ()
      gpu.return
    }
    gpu.func @vector_broadcast_2d_to_2d_across_lane_lower_to_noop_case(%arg0: index) {
      %0 = gpu.warp_execute_on_lane_0(%arg0)[16] -> (vector<16x1xf16>) {
        %1 = "some_def"() : () -> vector<16x1xf16>
        %2 = vector.broadcast %1 {layout_operand_0 = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>, layout_result_0 = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>} : vector<16x1xf16> to vector<16x16xf16>
        gpu.yield %2 : vector<16x16xf16>
      }
      "some_use"(%0) : (vector<16x1xf16>) -> ()
      gpu.return
    }
    gpu.func @vector_shape_cast_scalar_to_vector(%arg0: index) {
      %0 = gpu.warp_execute_on_lane_0(%arg0)[16] -> (vector<16x1xf16>) {
        %1 = "some_def"() : () -> f16
        %2 = vector.broadcast %1 {layout_result_0 = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>} : f16 to vector<16x16xf16>
        gpu.yield %2 : vector<16x16xf16>
      }
      "some_use"(%0) : (vector<16x1xf16>) -> ()
      gpu.return
    }
  }
}

