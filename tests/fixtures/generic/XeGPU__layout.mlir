"builtin.module"() ({
  "gpu.module"() <{sym_name = "test"}> ({
    "gpu.func"() <{function_type = (memref<128x128xf32>) -> ()}> ({
    ^bb0(%arg6: memref<128x128xf32>):
      %12 = "xegpu.create_nd_tdesc"(%arg6) <{const_offsets = array<i64: 0, 0>, operandSegmentSizes = array<i32: 1, 0, 0, 0>}> : (memref<128x128xf32>) -> !xegpu.tensor_desc<128x128xf32, #xegpu.layout<sg_layout = [4, 2], sg_data = [32, 64]>>
      "gpu.return"() : () -> ()
    }) {sym_name = "create_nd_tdesc_subgroup_1", workgroup_attributions = 0 : i64} : () -> ()
    "gpu.func"() <{function_type = (memref<128x128xf32>) -> ()}> ({
    ^bb0(%arg5: memref<128x128xf32>):
      %11 = "xegpu.create_nd_tdesc"(%arg5) <{const_offsets = array<i64: 0, 0>, operandSegmentSizes = array<i32: 1, 0, 0, 0>}> : (memref<128x128xf32>) -> !xegpu.tensor_desc<128x128xf32, #xegpu.layout<sg_layout = [4, 2], sg_data = [32, 64], inst_data = [8, 16]>>
      "gpu.return"() : () -> ()
    }) {sym_name = "create_nd_tdesc_subgroup_2", workgroup_attributions = 0 : i64} : () -> ()
    "gpu.func"() <{function_type = (memref<128x128xf32>) -> ()}> ({
    ^bb0(%arg4: memref<128x128xf32>):
      %10 = "xegpu.create_nd_tdesc"(%arg4) <{const_offsets = array<i64: 0, 0>, operandSegmentSizes = array<i32: 1, 0, 0, 0>}> : (memref<128x128xf32>) -> !xegpu.tensor_desc<128x128xf32, #xegpu.layout<sg_layout = [4, 2], sg_data = [32, 64], inst_data = [8, 16], lane_layout = [1, 16], lane_data = [1, 1]>>
      "gpu.return"() : () -> ()
    }) {sym_name = "create_nd_tdesc_subgroup_3", workgroup_attributions = 0 : i64} : () -> ()
    "gpu.func"() <{function_type = (memref<24x32xf32>) -> ()}> ({
    ^bb0(%arg3: memref<24x32xf32>):
      %9 = "xegpu.create_nd_tdesc"(%arg3) <{const_offsets = array<i64: 0, 0>, operandSegmentSizes = array<i32: 1, 0, 0, 0>}> : (memref<24x32xf32>) -> !xegpu.tensor_desc<24x32xf32, #xegpu.layout<sg_layout = [3, 2], sg_data = [8, 16], lane_layout = [1, 16], lane_data = [8, 1]>>
      "gpu.return"() : () -> ()
    }) {sym_name = "create_nd_tdesc_wg_1", workgroup_attributions = 0 : i64} : () -> ()
    "gpu.func"() <{function_type = (vector<32x64xf16>) -> ()}> ({
    ^bb0(%arg2: vector<32x64xf16>):
      %8 = "xegpu.convert_layout"(%arg2) <{input_layout = #xegpu.layout<lane_layout = [1, 16], lane_data = [2, 1]>, target_layout = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>}> : (vector<32x64xf16>) -> vector<32x64xf16>
      "gpu.return"() : () -> ()
    }) {sym_name = "convert_layout", workgroup_attributions = 0 : i64} : () -> ()
    "gpu.func"() <{function_type = (vector<32x64xf16>) -> ()}> ({
    ^bb0(%arg1: vector<32x64xf16>):
      %7 = "xegpu.convert_layout"(%arg1) <{input_layout = #xegpu.layout<sg_layout = [2, 4], sg_data = [16, 16], lane_layout = [1, 16], lane_data = [1, 1]>, target_layout = #xegpu.layout<sg_layout = [4, 2], sg_data = [8, 32], lane_layout = [1, 16], lane_data = [1, 1]>}> : (vector<32x64xf16>) -> vector<32x64xf16>
      "gpu.return"() : () -> ()
    }) {sym_name = "convert_layout_wg", workgroup_attributions = 0 : i64} : () -> ()
    "gpu.func"() <{function_type = () -> ()}> ({
      %6 = "arith.constant"() <{value = dense<8> : vector<16x8xindex>}> {layout_result_0 = #xegpu.slice<#xegpu.layout<sg_layout = [16, 1, 1], sg_data = [1, 8, 2]>, dims = [2]>} : () -> vector<16x8xindex>
      "gpu.return"() : () -> ()
    }) {sym_name = "slice_attr", workgroup_attributions = 0 : i64} : () -> ()
    "gpu.func"() <{function_type = () -> ()}> ({
      %5 = "arith.constant"() <{value = dense<8> : vector<16xindex>}> {layout_result_0 = #xegpu.slice<#xegpu.slice<#xegpu.layout<sg_layout = [16, 1, 1], sg_data = [1, 8, 2]>, dims = [2]>, dims = [1]>} : () -> vector<16xindex>
      "gpu.return"() : () -> ()
    }) {sym_name = "nested_slice_attr", workgroup_attributions = 0 : i64} : () -> ()
    "gpu.func"() <{function_type = (vector<256x128xf32>) -> vector<256x128xf32>}> ({
    ^bb0(%arg0: vector<256x128xf32>):
      %0 = "arith.constant"() <{value = dense<0.000000e+00> : vector<128xf32>}> : () -> vector<128xf32>
      %1 = "math.exp"(%arg0) <{fastmath = #arith.fastmath<none>}> {layout_result_0 = #xegpu.layout<sg_layout = [8, 4], sg_data = [32, 32]>} : (vector<256x128xf32>) -> vector<256x128xf32>
      %2 = "vector.multi_reduction"(%1, %0) <{kind = #vector.kind<add>, reduction_dims = array<i64: 0>}> {layout_result_0 = #xegpu.slice<#xegpu.layout<sg_layout = [8, 4], sg_data = [32, 32]>, dims = [0]>} : (vector<256x128xf32>, vector<128xf32>) -> vector<128xf32>
      %3 = "vector.broadcast"(%2) {layout_result_0 = #xegpu.layout<sg_layout = [8, 4], sg_data = [32, 32]>} : (vector<128xf32>) -> vector<256x128xf32>
      %4 = "arith.divf"(%1, %3) <{fastmath = #arith.fastmath<none>}> {layout_result_0 = #xegpu.layout<sg_layout = [8, 4], sg_data = [32, 32]>} : (vector<256x128xf32>, vector<256x128xf32>) -> vector<256x128xf32>
      "gpu.return"(%4) : (vector<256x128xf32>) -> ()
    }) {sym_name = "softmax_dim_0", workgroup_attributions = 0 : i64} : () -> ()
  }) : () -> ()
}) : () -> ()

