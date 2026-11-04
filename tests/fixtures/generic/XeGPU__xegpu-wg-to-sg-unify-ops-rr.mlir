"builtin.module"() ({
  "gpu.module"() <{sym_name = "test_distribution"}> ({
    "gpu.func"() <{function_type = (memref<256x128xf32>) -> ()}> ({
    ^bb0(%arg9: memref<256x128xf32>):
      %29 = "xegpu.create_nd_tdesc"(%arg9) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>}> : (memref<256x128xf32>) -> !xegpu.tensor_desc<256x128xf32, #xegpu.layout<sg_layout = [8, 4], sg_data = [16, 16], lane_layout = [1, 16], lane_data = [1, 1]>>
      "gpu.return"() : () -> ()
    }) {sym_name = "create_nd_tdesc_no_offset", workgroup_attributions = 0 : i64} : () -> ()
    "gpu.func"() <{function_type = (memref<256x128xf32>) -> ()}> ({
    ^bb0(%arg8: memref<256x128xf32>):
      %27 = "xegpu.create_nd_tdesc"(%arg8) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>}> : (memref<256x128xf32>) -> !xegpu.tensor_desc<256x128xf32, #xegpu.layout<sg_layout = [8, 4], sg_data = [16, 16], lane_layout = [1, 16], lane_data = [1, 1]>>
      %28 = "xegpu.load_nd"(%27) <{const_offsets = array<i64: 0, 0>, layout = #xegpu.layout<sg_layout = [8, 4], sg_data = [16, 16], lane_layout = [1, 16], lane_data = [1, 1]>}> : (!xegpu.tensor_desc<256x128xf32, #xegpu.layout<sg_layout = [8, 4], sg_data = [16, 16], lane_layout = [1, 16], lane_data = [1, 1]>>) -> vector<256x128xf32>
      "gpu.return"() : () -> ()
    }) {sym_name = "load_nd_tdesc_with_offset", workgroup_attributions = 0 : i64} : () -> ()
    "gpu.func"() <{function_type = (memref<256x128xf32>) -> ()}> ({
    ^bb0(%arg7: memref<256x128xf32>):
      %25 = "xegpu.create_nd_tdesc"(%arg7) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>}> : (memref<256x128xf32>) -> !xegpu.tensor_desc<256x128xf32, #xegpu.layout<sg_layout = [8, 4], sg_data = [16, 16], lane_layout = [1, 16], lane_data = [1, 1]>>
      %26 = "xegpu.load_nd"(%25) <{const_offsets = array<i64: 0, 0>, layout = #xegpu.layout<sg_layout = [8, 4], sg_data = [16, 16], lane_layout = [1, 16], lane_data = [1, 1]>}> : (!xegpu.tensor_desc<256x128xf32, #xegpu.layout<sg_layout = [8, 4], sg_data = [16, 16], lane_layout = [1, 16], lane_data = [1, 1]>>) -> vector<256x128xf32>
      "xegpu.store_nd"(%26, %25) <{const_offsets = array<i64: 0, 0>}> : (vector<256x128xf32>, !xegpu.tensor_desc<256x128xf32, #xegpu.layout<sg_layout = [8, 4], sg_data = [16, 16], lane_layout = [1, 16], lane_data = [1, 1]>>) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "store_nd_with_offset", workgroup_attributions = 0 : i64} : () -> ()
    "gpu.func"() <{function_type = (memref<256x128xf32>) -> ()}> ({
    ^bb0(%arg6: memref<256x128xf32>):
      %24 = "xegpu.create_nd_tdesc"(%arg6) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>}> : (memref<256x128xf32>) -> !xegpu.tensor_desc<256x128xf32, #xegpu.layout<sg_layout = [8, 4], sg_data = [16, 16], lane_layout = [1, 16], lane_data = [1, 1]>>
      "xegpu.prefetch_nd"(%24) <{const_offsets = array<i64: 0, 0>}> : (!xegpu.tensor_desc<256x128xf32, #xegpu.layout<sg_layout = [8, 4], sg_data = [16, 16], lane_layout = [1, 16], lane_data = [1, 1]>>) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "prefetch_nd_tdesc_with_offset", workgroup_attributions = 0 : i64} : () -> ()
    "gpu.func"() <{function_type = (memref<256x128xf16>, memref<128x256xf16>) -> ()}> ({
    ^bb0(%arg4: memref<256x128xf16>, %arg5: memref<128x256xf16>):
      %19 = "xegpu.create_nd_tdesc"(%arg4) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>}> : (memref<256x128xf16>) -> !xegpu.tensor_desc<256x128xf16, #xegpu.layout<sg_layout = [8, 4], sg_data = [16, 16], lane_layout = [1, 16], lane_data = [1, 1]>>
      %20 = "xegpu.load_nd"(%19) <{const_offsets = array<i64: 0, 0>, layout = #xegpu.layout<sg_layout = [8, 4], sg_data = [16, 16], lane_layout = [1, 16], lane_data = [1, 1]>}> : (!xegpu.tensor_desc<256x128xf16, #xegpu.layout<sg_layout = [8, 4], sg_data = [16, 16], lane_layout = [1, 16], lane_data = [1, 1]>>) -> vector<256x128xf16>
      %21 = "xegpu.create_nd_tdesc"(%arg5) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>}> : (memref<128x256xf16>) -> !xegpu.tensor_desc<128x256xf16, #xegpu.layout<sg_layout = [4, 8], sg_data = [16, 16], lane_layout = [1, 16], lane_data = [2, 1]>>
      %22 = "xegpu.load_nd"(%21) <{const_offsets = array<i64: 0, 0>, layout = #xegpu.layout<sg_layout = [4, 8], sg_data = [16, 16], lane_layout = [1, 16], lane_data = [2, 1]>}> : (!xegpu.tensor_desc<128x256xf16, #xegpu.layout<sg_layout = [4, 8], sg_data = [16, 16], lane_layout = [1, 16], lane_data = [2, 1]>>) -> vector<128x256xf16>
      %23 = "xegpu.dpas"(%20, %22) <{layout_a = #xegpu.layout<sg_layout = [8, 4], sg_data = [16, 16], lane_layout = [1, 16], lane_data = [1, 1]>, layout_b = #xegpu.layout<sg_layout = [4, 8], sg_data = [16, 16], lane_layout = [1, 16], lane_data = [2, 1]>, layout_cd = #xegpu.layout<sg_layout = [8, 8], sg_data = [16, 16], lane_layout = [1, 16], lane_data = [1, 1]>}> : (vector<256x128xf16>, vector<128x256xf16>) -> vector<256x256xf32>
      "gpu.return"() : () -> ()
    }) {sym_name = "dpas", workgroup_attributions = 0 : i64} : () -> ()
    "gpu.func"() <{function_type = (memref<256x64xf32>) -> ()}> ({
    ^bb0(%arg3: memref<256x64xf32>):
      %15 = "arith.constant"() <{value = dense<1.000000e+00> : vector<256xf32>}> {layout_result_0 = #xegpu.slice<#xegpu.layout<sg_layout = [8, 1], sg_data = [16, 64]>, dims = [1]>} : () -> vector<256xf32>
      %16 = "xegpu.create_nd_tdesc"(%arg3) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>}> : (memref<256x64xf32>) -> !xegpu.tensor_desc<256x64xf32, #xegpu.layout<sg_layout = [8, 1], sg_data = [16, 64]>>
      %17 = "xegpu.load_nd"(%16) <{const_offsets = array<i64: 0, 0>, layout = #xegpu.layout<sg_layout = [8, 1], sg_data = [16, 64]>}> : (!xegpu.tensor_desc<256x64xf32, #xegpu.layout<sg_layout = [8, 1], sg_data = [16, 64]>>) -> vector<256x64xf32>
      %18 = "vector.multi_reduction"(%17, %15) <{kind = #vector.kind<add>, reduction_dims = array<i64: 1>}> {layout_result_0 = #xegpu.slice<#xegpu.layout<sg_layout = [8, 1], sg_data = [16, 64]>, dims = [1]>} : (vector<256x64xf32>, vector<256xf32>) -> vector<256xf32>
      "gpu.return"() : () -> ()
    }) {sym_name = "vector_reduce_dim_1", workgroup_attributions = 0 : i64} : () -> ()
    "gpu.func"() <{function_type = () -> ()}> ({
      %14 = "arith.constant"() <{value = dense<[[0], [16], [32], [48], [64], [80], [96], [112], [128], [144], [160], [176], [192], [208], [224], [240], [256], [272], [288], [304], [320], [336], [352], [368], [384], [400], [416], [432], [448], [464], [480], [496]]> : vector<32x1xindex>}> {layout_result_0 = #xegpu.layout<sg_layout = [8, 1], sg_data = [2, 1]>} : () -> vector<32x1xindex>
      "gpu.return"() : () -> ()
    }) {sym_name = "non_splat_constant", workgroup_attributions = 0 : i64} : () -> ()
    "gpu.func"() <{function_type = (memref<256x128xf32>) -> ()}> ({
    ^bb0(%arg2: memref<256x128xf32>):
      %11 = "xegpu.create_nd_tdesc"(%arg2) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>}> : (memref<256x128xf32>) -> !xegpu.tensor_desc<256x128xf32, #xegpu.layout<sg_layout = [8, 4], sg_data = [32, 16], lane_layout = [16, 1], lane_data = [1, 1], order = [0, 1]>>
      %12 = "xegpu.load_nd"(%11) <{const_offsets = array<i64: 0, 0>, layout = #xegpu.layout<sg_layout = [8, 4], sg_data = [32, 16], lane_layout = [16, 1], lane_data = [1, 1], order = [0, 1]>}> : (!xegpu.tensor_desc<256x128xf32, #xegpu.layout<sg_layout = [8, 4], sg_data = [32, 16], lane_layout = [16, 1], lane_data = [1, 1], order = [0, 1]>>) -> vector<256x128xf32>
      %13 = "vector.transpose"(%12) <{permutation = array<i64: 1, 0>}> {layout_result_0 = #xegpu.layout<sg_layout = [4, 8], sg_data = [16, 32], lane_layout = [1, 16], lane_data = [1, 1], order = [1, 0]>} : (vector<256x128xf32>) -> vector<128x256xf32>
      "gpu.return"() : () -> ()
    }) {sym_name = "vector_transpose", workgroup_attributions = 0 : i64} : () -> ()
    "gpu.func"() <{function_type = () -> ()}> ({
      %10 = "vector.constant_mask"() <{mask_dim_sizes = array<i64: 16, 16>}> {layout_result_0 = #xegpu.layout<sg_layout = [8, 4], sg_data = [16, 16]>} : () -> vector<256x128xi1>
      "gpu.return"() : () -> ()
    }) {sym_name = "vector_mask_2D", workgroup_attributions = 0 : i64} : () -> ()
    "gpu.func"() <{function_type = () -> ()}> ({
      %8 = "arith.constant"() <{value = 16 : index}> : () -> index
      %9 = "vector.create_mask"(%8, %8) {layout_result_0 = #xegpu.layout<sg_layout = [8, 4], sg_data = [16, 16]>} : (index, index) -> vector<256x128xi1>
      "gpu.return"() : () -> ()
    }) {sym_name = "vector_create_mask_2D", workgroup_attributions = 0 : i64} : () -> ()
    "gpu.func"() <{function_type = (memref<4096x128xf32>, memref<4096x128xf32>) -> ()}> ({
    ^bb0(%arg0: memref<4096x128xf32>, %arg1: memref<4096x128xf32>):
      %0 = "arith.constant"() <{value = dense<0xFF800000> : vector<256xf32>}> {layout_result_0 = #xegpu.slice<#xegpu.layout<sg_layout = [32, 1], sg_data = [8, 128], inst_data = [8, 16]>, dims = [1]>} : () -> vector<256xf32>
      %1 = "gpu.block_id"() <{dimension = #gpu<dim x>}> : () -> index
      %2 = "xegpu.create_nd_tdesc"(%arg0) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>}> : (memref<4096x128xf32>) -> !xegpu.tensor_desc<256x128xf32, #xegpu.block_tdesc_attr<boundary_check = false>, #xegpu.layout<sg_layout = [32, 1], sg_data = [8, 128], inst_data = [8, 16]>>
      %3 = "xegpu.load_nd"(%2, %1) <{const_offsets = array<i64: -9223372036854775808, 0>}> : (!xegpu.tensor_desc<256x128xf32, #xegpu.block_tdesc_attr<boundary_check = false>, #xegpu.layout<sg_layout = [32, 1], sg_data = [8, 128], inst_data = [8, 16]>>, index) -> vector<256x128xf32>
      %4 = "vector.multi_reduction"(%3, %0) <{kind = #vector.kind<maximumf>, reduction_dims = array<i64: 1>}> {layout_result_0 = #xegpu.slice<#xegpu.layout<sg_layout = [32, 1], sg_data = [8, 128], inst_data = [8, 16]>, dims = [1]>} : (vector<256x128xf32>, vector<256xf32>) -> vector<256xf32>
      %5 = "vector.shape_cast"(%4) {layout_result_0 = #xegpu.layout<sg_layout = [32, 1], sg_data = [8, 128], inst_data = [8, 16]>} : (vector<256xf32>) -> vector<256x1xf32>
      %6 = "vector.broadcast"(%5) {layout_result_0 = #xegpu.layout<sg_layout = [32, 1], sg_data = [8, 128], inst_data = [8, 16]>} : (vector<256x1xf32>) -> vector<256x128xf32>
      %7 = "xegpu.create_nd_tdesc"(%arg0) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>}> : (memref<4096x128xf32>) -> !xegpu.tensor_desc<256x128xf32, #xegpu.block_tdesc_attr<boundary_check = false>, #xegpu.layout<sg_layout = [32, 1], sg_data = [8, 128], inst_data = [8, 16]>>
      "xegpu.store_nd"(%6, %7, %1) <{const_offsets = array<i64: -9223372036854775808, 0>}> : (vector<256x128xf32>, !xegpu.tensor_desc<256x128xf32, #xegpu.block_tdesc_attr<boundary_check = false>, #xegpu.layout<sg_layout = [32, 1], sg_data = [8, 128], inst_data = [8, 16]>>, index) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "distribute_shapecast_expandunitdims_broadcast", workgroup_attributions = 0 : i64} : () -> ()
  }) : () -> ()
}) : () -> ()

