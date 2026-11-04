"builtin.module"() ({
  "gpu.module"() <{sym_name = "xevm_module"}> ({
    "gpu.func"() <{function_type = (index) -> ()}> ({
    ^bb0(%arg44: index):
      %140 = "arith.constant"() <{value = 0 : index}> : () -> index
      "gpu.warp_execute_on_lane_0"(%arg44) <{warp_size = 16 : i64}> ({
        %141 = "some_op"() : () -> !xegpu.tensor_desc<16xf32, #xegpu.layout<lane_layout = [16], lane_data = [1]>>
        %142 = "some_op"() : () -> vector<16xf32>
        "xegpu.store_nd"(%142, %141, %140) <{const_offsets = array<i64: -9223372036854775808>}> {layout_operand_0 = #xegpu.layout<lane_layout = [16], lane_data = [1]>} : (vector<16xf32>, !xegpu.tensor_desc<16xf32, #xegpu.layout<lane_layout = [16], lane_data = [1]>>, index) -> ()
        "gpu.yield"() : () -> ()
      }) : (index) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "store_nd_1d", workgroup_attributions = 0 : i64} : () -> ()
    "gpu.func"() <{function_type = (index) -> ()}> ({
    ^bb0(%arg43: index):
      %137 = "arith.constant"() <{value = 0 : index}> : () -> index
      "gpu.warp_execute_on_lane_0"(%arg43) <{warp_size = 16 : i64}> ({
        %138 = "some_op"() : () -> !xegpu.tensor_desc<16x16xf16, #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>>
        %139 = "some_op"() : () -> vector<16x16xf16>
        "xegpu.store_nd"(%139, %138, %137, %137) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>}> {layout_operand_0 = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>} : (vector<16x16xf16>, !xegpu.tensor_desc<16x16xf16, #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>>, index, index) -> ()
        "gpu.yield"() : () -> ()
      }) : (index) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "store_nd_2d", workgroup_attributions = 0 : i64} : () -> ()
    "gpu.func"() <{function_type = (index) -> ()}> ({
    ^bb0(%arg42: index):
      %133 = "arith.constant"() <{value = 0 : index}> : () -> index
      %134 = "gpu.warp_execute_on_lane_0"(%arg42) <{warp_size = 16 : i64}> ({
        %135 = "some_op"() : () -> !xegpu.tensor_desc<16xf32, #xegpu.layout<lane_layout = [16], lane_data = [1]>>
        %136 = "xegpu.load_nd"(%135, %133) <{const_offsets = array<i64: -9223372036854775808>}> {layout_result_0 = #xegpu.layout<lane_layout = [16], lane_data = [1]>} : (!xegpu.tensor_desc<16xf32, #xegpu.layout<lane_layout = [16], lane_data = [1]>>, index) -> vector<16xf32>
        "gpu.yield"(%136) : (vector<16xf32>) -> ()
      }) : (index) -> vector<1xf32>
      "some_user_op"(%134) : (vector<1xf32>) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "load_nd_1d", workgroup_attributions = 0 : i64} : () -> ()
    "gpu.func"() <{function_type = (index) -> ()}> ({
    ^bb0(%arg41: index):
      %129 = "arith.constant"() <{value = 0 : index}> : () -> index
      %130 = "gpu.warp_execute_on_lane_0"(%arg41) <{warp_size = 16 : i64}> ({
        %131 = "some_op"() : () -> !xegpu.tensor_desc<16x16xf16, #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>>
        %132 = "xegpu.load_nd"(%131, %129, %129) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>}> {layout_result_0 = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>} : (!xegpu.tensor_desc<16x16xf16, #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>>, index, index) -> vector<16x16xf16>
        "gpu.yield"(%132) : (vector<16x16xf16>) -> ()
      }) : (index) -> vector<16x1xf16>
      "some_user_op"(%130) : (vector<16x1xf16>) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "load_nd_2d", workgroup_attributions = 0 : i64} : () -> ()
    "gpu.func"() <{function_type = (index) -> ()}> ({
    ^bb0(%arg40: index):
      %125 = "arith.constant"() <{value = 0 : index}> : () -> index
      %126 = "gpu.warp_execute_on_lane_0"(%arg40) <{warp_size = 16 : i64}> ({
        %127 = "some_op"() : () -> !xegpu.tensor_desc<16x16xf16, #xegpu.block_tdesc_attr<array_length = 2 : i64>, #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>>
        %128 = "xegpu.load_nd"(%127, %125, %125) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>}> {layout_result_0 = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>} : (!xegpu.tensor_desc<16x16xf16, #xegpu.block_tdesc_attr<array_length = 2 : i64>, #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>>, index, index) -> vector<2x16x16xf16>
        "gpu.yield"(%128) : (vector<2x16x16xf16>) -> ()
      }) : (index) -> vector<2x16x1xf16>
      "some_user_op"(%126) : (vector<2x16x1xf16>) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "load_nd_array_length", workgroup_attributions = 0 : i64} : () -> ()
    "gpu.func"() <{function_type = (index) -> ()}> ({
    ^bb0(%arg39: index):
      %120 = "gpu.warp_execute_on_lane_0"(%arg39) <{warp_size = 16 : i64}> ({
        %121 = "some_op"() : () -> vector<8x16xf16>
        %122 = "some_op"() : () -> vector<16x16xf16>
        %123 = "some_op"() : () -> vector<8x16xf32>
        %124 = "xegpu.dpas"(%121, %122, %123) <{layout_a = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>, layout_b = #xegpu.layout<lane_layout = [1, 16], lane_data = [2, 1]>, layout_cd = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>}> : (vector<8x16xf16>, vector<16x16xf16>, vector<8x16xf32>) -> vector<8x16xf32>
        "gpu.yield"(%124) : (vector<8x16xf32>) -> ()
      }) : (index) -> vector<8x1xf32>
      "some_user_op"(%120) : (vector<8x1xf32>) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "dpas", workgroup_attributions = 0 : i64} : () -> ()
    "gpu.func"() <{function_type = (ui64, index) -> ()}> ({
    ^bb0(%arg37: ui64, %arg38: index):
      %117 = "arith.constant"() <{value = 0 : index}> : () -> index
      %118 = "gpu.warp_execute_on_lane_0"(%arg38) <{warp_size = 16 : i64}> ({
        %119 = "xegpu.create_nd_tdesc"(%arg37) <{const_shape = array<i64: 64, 128>, const_strides = array<i64: 128, 1>, operandSegmentSizes = array<i32: 1, 0, 0, 0>}> : (ui64) -> !xegpu.tensor_desc<16x16xf16, #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>>
        "gpu.yield"(%119) : (!xegpu.tensor_desc<16x16xf16, #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>>) -> ()
      }) : (index) -> !xegpu.tensor_desc<16x16xf16, #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>>
      "some_user_op"(%118) : (!xegpu.tensor_desc<16x16xf16, #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>>) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "create_nd_tdesc_non_memref", workgroup_attributions = 0 : i64} : () -> ()
    "gpu.func"() <{function_type = (index) -> ()}> ({
    ^bb0(%arg36: index):
      %115 = "arith.constant"() <{value = 0 : index}> : () -> index
      "gpu.warp_execute_on_lane_0"(%arg36) <{warp_size = 16 : i64}> ({
        %116 = "some_op"() : () -> !xegpu.tensor_desc<16x16xf16, #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>>
        "xegpu.prefetch_nd"(%116, %115, %115) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>, l1_hint = #xegpu.cache_hint<cached>, l2_hint = #xegpu.cache_hint<uncached>}> : (!xegpu.tensor_desc<16x16xf16, #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>>, index, index) -> ()
        "gpu.yield"() : () -> ()
      }) : (index) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "prefetch_2d", workgroup_attributions = 0 : i64} : () -> ()
    "gpu.func"() <{function_type = (index) -> ()}> ({
    ^bb0(%arg35: index):
      %113 = "arith.constant"() <{value = 0 : index}> : () -> index
      "gpu.warp_execute_on_lane_0"(%arg35) <{warp_size = 16 : i64}> ({
        %114 = "some_op"() : () -> !xegpu.tensor_desc<16xf16, #xegpu.layout<lane_layout = [16], lane_data = [1]>>
        "xegpu.prefetch_nd"(%114, %113) <{const_offsets = array<i64: -9223372036854775808>, l1_hint = #xegpu.cache_hint<cached>, l2_hint = #xegpu.cache_hint<uncached>}> : (!xegpu.tensor_desc<16xf16, #xegpu.layout<lane_layout = [16], lane_data = [1]>>, index) -> ()
        "gpu.yield"() : () -> ()
      }) : (index) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "prefetch_1d", workgroup_attributions = 0 : i64} : () -> ()
    "gpu.func"() <{function_type = (index) -> ()}> ({
    ^bb0(%arg34: index):
      %109 = "arith.constant"() <{value = 0 : index}> : () -> index
      %110 = "gpu.warp_execute_on_lane_0"(%arg34) <{warp_size = 16 : i64}> ({
        %111 = "some_op"() : () -> !xegpu.tensor_desc<16xf16, #xegpu.layout<lane_layout = [16], lane_data = [1]>>
        %112 = "xegpu.load_nd"(%111, %109) <{const_offsets = array<i64: -9223372036854775808>}> {layout_result_0 = #xegpu.layout<lane_layout = [16], lane_data = [1]>} : (!xegpu.tensor_desc<16xf16, #xegpu.layout<lane_layout = [16], lane_data = [1]>>, index) -> vector<16xf16>
        "gpu.barrier"() : () -> ()
        "gpu.yield"(%112) : (vector<16xf16>) -> ()
      }) : (index) -> vector<1xf16>
      "some_user_op"(%110) : (vector<1xf16>) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "gpu_barrier", workgroup_attributions = 0 : i64} : () -> ()
    "gpu.func"() <{function_type = (index) -> ()}> ({
    ^bb0(%arg33: index):
      %104 = "arith.constant"() <{value = 0 : index}> : () -> index
      %105 = "gpu.warp_execute_on_lane_0"(%arg33) <{warp_size = 16 : i64}> ({
        %106 = "some_def"() {layout_result_0 = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>} : () -> vector<16x32xf32>
        %107 = "arith.constant"() <{value = dense<0.000000e+00> : vector<32xf32>}> {layout_result_0 = #xegpu.slice<#xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>, dims = [0]>} : () -> vector<32xf32>
        %108 = "vector.multi_reduction"(%106, %107) <{kind = #vector.kind<add>, reduction_dims = array<i64: 0>}> {layout_operand_0 = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>, layout_operand_1 = #xegpu.slice<#xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>, dims = [0]>, layout_result_0 = #xegpu.slice<#xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>, dims = [0]>} : (vector<16x32xf32>, vector<32xf32>) -> vector<32xf32>
        "gpu.yield"(%108) : (vector<32xf32>) -> ()
      }) : (index) -> vector<2xf32>
      "some_user_op"(%105) : (vector<2xf32>) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "vector_multi_reduction_dim1_distributed_dim0_reduction", workgroup_attributions = 0 : i64} : () -> ()
    "gpu.func"() <{function_type = (index) -> ()}> ({
    ^bb0(%arg32: index):
      %99 = "arith.constant"() <{value = 0 : index}> : () -> index
      %100 = "gpu.warp_execute_on_lane_0"(%arg32) <{warp_size = 16 : i64}> ({
        %101 = "some_def"() {layout_result_0 = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>} : () -> vector<2x16xf32>
        %102 = "arith.constant"() <{value = dense<0.000000e+00> : vector<2xf32>}> {layout_result_0 = #xegpu.slice<#xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>, dims = [1]>} : () -> vector<2xf32>
        %103 = "vector.multi_reduction"(%101, %102) <{kind = #vector.kind<add>, reduction_dims = array<i64: 1>}> {layout_operand_0 = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>, layout_operand_1 = #xegpu.slice<#xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>, dims = [1]>, layout_result_0 = #xegpu.slice<#xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>, dims = [1]>} : (vector<2x16xf32>, vector<2xf32>) -> vector<2xf32>
        "gpu.yield"(%103) : (vector<2xf32>) -> ()
      }) : (index) -> vector<2xf32>
      "some_user_op"(%100) : (vector<2xf32>) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "vector_multi_reduction_dim1_distributed_dim1_reduction", workgroup_attributions = 0 : i64} : () -> ()
    "gpu.func"() <{function_type = (index) -> ()}> ({
    ^bb0(%arg31: index):
      %94 = "arith.constant"() <{value = 0 : index}> : () -> index
      %95 = "gpu.warp_execute_on_lane_0"(%arg31) <{warp_size = 16 : i64}> ({
        %96 = "some_def"() {layout_result_0 = #xegpu.layout<lane_layout = [16, 1], lane_data = [1, 1]>} : () -> vector<32x16xf32>
        %97 = "arith.constant"() <{value = dense<0.000000e+00> : vector<32xf32>}> {layout_result_0 = #xegpu.slice<#xegpu.layout<lane_layout = [16, 1], lane_data = [1, 1]>, dims = [1]>} : () -> vector<32xf32>
        %98 = "vector.multi_reduction"(%96, %97) <{kind = #vector.kind<add>, reduction_dims = array<i64: 1>}> {layout_operand_0 = #xegpu.layout<lane_layout = [16, 1], lane_data = [1, 1]>, layout_operand_1 = #xegpu.slice<#xegpu.layout<lane_layout = [16, 1], lane_data = [1, 1]>, dims = [1]>, layout_result_0 = #xegpu.slice<#xegpu.layout<lane_layout = [16, 1], lane_data = [1, 1]>, dims = [1]>} : (vector<32x16xf32>, vector<32xf32>) -> vector<32xf32>
        "gpu.yield"(%98) : (vector<32xf32>) -> ()
      }) : (index) -> vector<2xf32>
      "some_user_op"(%95) : (vector<2xf32>) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "vector_multi_reduction_dim0_distributed_dim1_reduction", workgroup_attributions = 0 : i64} : () -> ()
    "gpu.func"() <{function_type = (index) -> ()}> ({
    ^bb0(%arg30: index):
      %89 = "arith.constant"() <{value = 0 : index}> : () -> index
      %90 = "gpu.warp_execute_on_lane_0"(%arg30) <{warp_size = 16 : i64}> ({
        %91 = "some_def"() {layout_result_0 = #xegpu.layout<lane_layout = [16, 1], lane_data = [1, 1]>} : () -> vector<16x2xf32>
        %92 = "arith.constant"() <{value = dense<0.000000e+00> : vector<2xf32>}> {layout_result_0 = #xegpu.slice<#xegpu.layout<lane_layout = [16, 1], lane_data = [1, 1]>, dims = [0]>} : () -> vector<2xf32>
        %93 = "vector.multi_reduction"(%91, %92) <{kind = #vector.kind<add>, reduction_dims = array<i64: 0>}> {layout_operand_0 = #xegpu.layout<lane_layout = [16, 1], lane_data = [1, 1]>, layout_operand_1 = #xegpu.slice<#xegpu.layout<lane_layout = [16, 1], lane_data = [1, 1]>, dims = [0]>, layout_result_0 = #xegpu.slice<#xegpu.layout<lane_layout = [16, 1], lane_data = [1, 1]>, dims = [0]>} : (vector<16x2xf32>, vector<2xf32>) -> vector<2xf32>
        "gpu.yield"(%93) : (vector<2xf32>) -> ()
      }) : (index) -> vector<2xf32>
      "some_user_op"(%90) : (vector<2xf32>) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "vector_multi_reduction_dim0_distributed_dim0_reduction", workgroup_attributions = 0 : i64} : () -> ()
    "gpu.func"() <{function_type = (index, memref<256xf16>) -> ()}> ({
    ^bb0(%arg28: index, %arg29: memref<256xf16>):
      "gpu.warp_execute_on_lane_0"(%arg28) <{warp_size = 16 : i64}> ({
        %86 = "arith.constant"() <{value = dense<true> : vector<16xi1>}> {layout_result_0 = #xegpu.layout<lane_layout = [16], lane_data = [1]>} : () -> vector<16xi1>
        %87 = "arith.constant"() <{value = dense<12> : vector<16xindex>}> {layout_result_0 = #xegpu.layout<lane_layout = [16], lane_data = [1]>} : () -> vector<16xindex>
        %88 = "xegpu.load"(%arg29, %87, %86) <{chunk_size = 8 : i64}> {layout_operand_1 = #xegpu.layout<lane_layout = [16], lane_data = [1]>, layout_operand_2 = #xegpu.layout<lane_layout = [16], lane_data = [1]>, layout_result_0 = #xegpu.layout<lane_layout = [16, 1], lane_data = [1, 2]>} : (memref<256xf16>, vector<16xindex>, vector<16xi1>) -> vector<16x8xf16>
        "xegpu.store"(%88, %arg29, %87, %86) <{chunk_size = 8 : i64}> {layout_operand_0 = #xegpu.layout<lane_layout = [16, 1], lane_data = [1, 2]>, layout_operand_2 = #xegpu.layout<lane_layout = [16], lane_data = [1]>, layout_operand_3 = #xegpu.layout<lane_layout = [16], lane_data = [1]>} : (vector<16x8xf16>, memref<256xf16>, vector<16xindex>, vector<16xi1>) -> ()
        "gpu.yield"() : () -> ()
      }) : (index) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "scatter_ops_chunksize", workgroup_attributions = 0 : i64} : () -> ()
    "gpu.func"() <{function_type = (memref<256xf16>, index) -> ()}> ({
    ^bb0(%arg26: memref<256xf16>, %arg27: index):
      "gpu.warp_execute_on_lane_0"(%arg27) <{warp_size = 16 : i64}> ({
        %83 = "arith.constant"() <{value = dense<true> : vector<16xi1>}> {layout_result_0 = #xegpu.layout<lane_layout = [16], lane_data = [1]>} : () -> vector<16xi1>
        %84 = "arith.constant"() <{value = dense<12> : vector<16xindex>}> {layout_result_0 = #xegpu.layout<lane_layout = [16], lane_data = [1]>} : () -> vector<16xindex>
        %85 = "xegpu.load"(%arg26, %84, %83) {layout_operand_1 = #xegpu.layout<lane_layout = [16], lane_data = [1]>, layout_operand_2 = #xegpu.layout<lane_layout = [16], lane_data = [1]>, layout_result_0 = #xegpu.layout<lane_layout = [16], lane_data = [1]>} : (memref<256xf16>, vector<16xindex>, vector<16xi1>) -> vector<16xf16>
        "xegpu.store"(%85, %arg26, %84, %83) {layout_operand_0 = #xegpu.layout<lane_layout = [16], lane_data = [1]>, layout_operand_2 = #xegpu.layout<lane_layout = [16], lane_data = [1]>, layout_operand_3 = #xegpu.layout<lane_layout = [16], lane_data = [1]>} : (vector<16xf16>, memref<256xf16>, vector<16xindex>, vector<16xi1>) -> ()
        "gpu.yield"() : () -> ()
      }) : (index) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "scatter_ops", workgroup_attributions = 0 : i64} : () -> ()
    "gpu.func"() <{function_type = (memref<256x256xf16>, index) -> ()}> ({
    ^bb0(%arg24: memref<256x256xf16>, %arg25: index):
      %80 = "gpu.warp_execute_on_lane_0"(%arg25) <{warp_size = 16 : i64}> ({
        %82 = "memref.extract_aligned_pointer_as_index"(%arg24) : (memref<256x256xf16>) -> index
        "gpu.yield"(%82) : (index) -> ()
      }) : (index) -> index
      %81 = "arith.index_cast"(%80) : (index) -> i64
      "some_user_op"(%81) : (i64) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "memref_extract_aligned_pointer_as_index", workgroup_attributions = 0 : i64} : () -> ()
    "gpu.func"() <{function_type = (index) -> ()}> ({
    ^bb0(%arg23: index):
      %77 = "gpu.warp_execute_on_lane_0"(%arg23) <{warp_size = 16 : i64}> ({
        %78 = "some_op"() {layout_result_0 = #xegpu.layout<lane_layout = [16, 1], lane_data = [1, 1]>} : () -> vector<16x2xf32>
        %79 = "vector.transpose"(%78) <{permutation = array<i64: 1, 0>}> {layout_operand_0 = #xegpu.layout<lane_layout = [16, 1], lane_data = [1, 1]>, layout_result_0 = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>} : (vector<16x2xf32>) -> vector<2x16xf32>
        "gpu.yield"(%79) : (vector<2x16xf32>) -> ()
      }) : (index) -> vector<2x1xf32>
      "some_user_op"(%77) : (vector<2x1xf32>) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "vector_transpose", workgroup_attributions = 0 : i64} : () -> ()
    "gpu.func"() <{function_type = (index) -> ()}> ({
    ^bb0(%arg22: index):
      %74 = "gpu.warp_execute_on_lane_0"(%arg22) <{warp_size = 16 : i64}> ({
        %75 = "some_op"() {layout_result_0 = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 2]>} : () -> vector<4x32xi8>
        %76 = "vector.bitcast"(%75) {layout_operand_0 = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 2]>, layout_result_0 = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>} : (vector<4x32xi8>) -> vector<4x16xi16>
        "gpu.yield"(%76) : (vector<4x16xi16>) -> ()
      }) : (index) -> vector<4x1xi16>
      "some_user_op"(%74) : (vector<4x1xi16>) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "vector_bitcast", workgroup_attributions = 0 : i64} : () -> ()
    "gpu.func"() <{function_type = (index) -> ()}> ({
    ^bb0(%arg21: index):
      %71 = "gpu.warp_execute_on_lane_0"(%arg21) <{warp_size = 16 : i64}> ({
        %72 = "some_op"() {layout_result_0 = #xegpu.slice<#xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>, dims = [0]>} : () -> vector<16xf32>
        %73 = "vector.shape_cast"(%72) {layout_operand_0 = #xegpu.slice<#xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>, dims = [0]>, layout_result_0 = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>} : (vector<16xf32>) -> vector<1x16xf32>
        "gpu.yield"(%73) : (vector<1x16xf32>) -> ()
      }) : (index) -> vector<1x1xf32>
      "some_user_op"(%71) : (vector<1x1xf32>) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "vector_shapecast_rank_increasing", workgroup_attributions = 0 : i64} : () -> ()
    "gpu.func"() <{function_type = (index) -> ()}> ({
    ^bb0(%arg20: index):
      %68 = "gpu.warp_execute_on_lane_0"(%arg20) <{warp_size = 16 : i64}> ({
        %69 = "some_op"() {layout_result_0 = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>} : () -> vector<1x16xf32>
        %70 = "vector.shape_cast"(%69) {layout_operand_0 = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>, layout_result_0 = #xegpu.slice<#xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>, dims = [0]>} : (vector<1x16xf32>) -> vector<16xf32>
        "gpu.yield"(%70) : (vector<16xf32>) -> ()
      }) : (index) -> vector<1xf32>
      "some_user_op"(%68) : (vector<1xf32>) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "vector_shapecast_rank_reducing", workgroup_attributions = 0 : i64} : () -> ()
    "gpu.func"() <{function_type = (index) -> ()}> ({
    ^bb0(%arg19: index):
      %65 = "gpu.warp_execute_on_lane_0"(%arg19) <{warp_size = 16 : i64}> ({
        %66 = "some_op"() {layout_result_0 = #xegpu.layout<lane_layout = [16], lane_data = [1]>} : () -> vector<16xf32>
        %67 = "vector.shape_cast"(%66) {layout_operand_0 = #xegpu.layout<lane_layout = [16], lane_data = [1]>, layout_result_0 = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>} : (vector<16xf32>) -> vector<1x16xf32>
        "gpu.yield"(%67) : (vector<1x16xf32>) -> ()
      }) : (index) -> vector<1x1xf32>
      "some_user_op"(%65) : (vector<1x1xf32>) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "vector_shapecast_unsupported", workgroup_attributions = 0 : i64} : () -> ()
    "gpu.func"() <{function_type = (index) -> ()}> ({
    ^bb0(%arg18: index):
      %62 = "gpu.warp_execute_on_lane_0"(%arg18) <{warp_size = 16 : i64}> ({
        %63 = "some_def"() : () -> vector<24x16xf32>
        %64 = "vector.extract_strided_slice"(%63) <{offsets = [8, 0], sizes = [8, 16], strides = [1, 1]}> {layout_operand_0 = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>, layout_result_0 = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>} : (vector<24x16xf32>) -> vector<8x16xf32>
        "gpu.yield"(%64) : (vector<8x16xf32>) -> ()
      }) : (index) -> vector<8x1xf32>
      "some_use"(%62) : (vector<8x1xf32>) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "vector_extract_strided_slice_distributed_dim_fully_extracted", workgroup_attributions = 0 : i64} : () -> ()
    "gpu.func"() <{function_type = (index) -> ()}> ({
    ^bb0(%arg17: index):
      %59 = "gpu.warp_execute_on_lane_0"(%arg17) <{warp_size = 16 : i64}> ({
        %60 = "some_def"() : () -> vector<24x1xf32>
        %61 = "vector.extract_strided_slice"(%60) <{offsets = [8, 0], sizes = [8, 1], strides = [1, 1]}> {layout_operand_0 = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>, layout_result_0 = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>} : (vector<24x1xf32>) -> vector<8x1xf32>
        "gpu.yield"(%61) : (vector<8x1xf32>) -> ()
      }) : (index) -> vector<8x1xf32>
      "some_use"(%59) : (vector<8x1xf32>) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "vector_extract_strided_slice_non_distributed", workgroup_attributions = 0 : i64} : () -> ()
    "gpu.func"() <{function_type = (index) -> ()}> ({
    ^bb0(%arg16: index):
      %56 = "gpu.warp_execute_on_lane_0"(%arg16) <{warp_size = 16 : i64}> ({
        %57 = "some_def"() : () -> vector<24x64xf32>
        %58 = "vector.extract_strided_slice"(%57) <{offsets = [8, 48], sizes = [8, 16], strides = [1, 1]}> {layout_operand_0 = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>, layout_result_0 = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>} : (vector<24x64xf32>) -> vector<8x16xf32>
        "gpu.yield"(%58) : (vector<8x16xf32>) -> ()
      }) : (index) -> vector<8x1xf32>
      "some_use"(%56) : (vector<8x1xf32>) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "vector_extract_strided_slice_inner_distributed", workgroup_attributions = 0 : i64} : () -> ()
    "gpu.func"() <{function_type = (index) -> ()}> ({
    ^bb0(%arg15: index):
      %53 = "gpu.warp_execute_on_lane_0"(%arg15) <{warp_size = 16 : i64}> ({
        %54 = "some_def"() : () -> vector<32x16xf32>
        %55 = "vector.extract_strided_slice"(%54) <{offsets = [16], sizes = [16], strides = [1]}> {layout_operand_0 = #xegpu.layout<lane_layout = [16, 1], lane_data = [1, 1]>, layout_result_0 = #xegpu.layout<lane_layout = [16, 1], lane_data = [1, 1]>} : (vector<32x16xf32>) -> vector<16x16xf32>
        "gpu.yield"(%55) : (vector<16x16xf32>) -> ()
      }) : (index) -> vector<1x16xf32>
      "some_use"(%53) : (vector<1x16xf32>) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "vector_extract_strided_slice_outer_distributed", workgroup_attributions = 0 : i64} : () -> ()
    "gpu.func"() <{function_type = (index) -> ()}> ({
    ^bb0(%arg14: index):
      %50 = "gpu.warp_execute_on_lane_0"(%arg14) <{warp_size = 16 : i64}> ({
        %51 = "some_def"() : () -> vector<64xf32>
        %52 = "vector.extract_strided_slice"(%51) <{offsets = [16], sizes = [32], strides = [1]}> {layout_operand_0 = #xegpu.layout<lane_layout = [16], lane_data = [1]>, layout_result_0 = #xegpu.layout<lane_layout = [16], lane_data = [1]>} : (vector<64xf32>) -> vector<32xf32>
        "gpu.yield"(%52) : (vector<32xf32>) -> ()
      }) : (index) -> vector<2xf32>
      "some_use"(%50) : (vector<2xf32>) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "vector_extract_strided_slice_1d", workgroup_attributions = 0 : i64} : () -> ()
    "gpu.func"() <{function_type = (index) -> ()}> ({
    ^bb0(%arg13: index):
      %47 = "gpu.warp_execute_on_lane_0"(%arg13) <{warp_size = 16 : i64}> ({
        %48 = "some_def"() : () -> vector<64xf32>
        %49 = "vector.extract_strided_slice"(%48) <{offsets = [3], sizes = [32], strides = [1]}> {layout_operand_0 = #xegpu.layout<lane_layout = [16], lane_data = [1]>, layout_result_0 = #xegpu.layout<lane_layout = [16], lane_data = [1]>} : (vector<64xf32>) -> vector<32xf32>
        "gpu.yield"(%49) : (vector<32xf32>) -> ()
      }) : (index) -> vector<2xf32>
      "some_use"(%47) : (vector<2xf32>) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "vector_extract_strided_slice_unsopported_offset", workgroup_attributions = 0 : i64} : () -> ()
    "gpu.func"() <{function_type = (index) -> ()}> ({
    ^bb0(%arg12: index):
      %44 = "gpu.warp_execute_on_lane_0"(%arg12) <{warp_size = 16 : i64}> ({
        %45 = "some_def"() : () -> vector<54xf32>
        %46 = "vector.extract_strided_slice"(%45) <{offsets = [0], sizes = [32], strides = [1]}> {layout_operand_0 = #xegpu.layout<lane_layout = [16], lane_data = [1]>, layout_result_0 = #xegpu.layout<lane_layout = [16], lane_data = [1]>} : (vector<54xf32>) -> vector<32xf32>
        "gpu.yield"(%46) : (vector<32xf32>) -> ()
      }) : (index) -> vector<2xf32>
      "some_use"(%44) : (vector<2xf32>) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "vector_extract_strided_slice_unsopported_source", workgroup_attributions = 0 : i64} : () -> ()
    "gpu.func"() <{function_type = (index) -> ()}> ({
    ^bb0(%arg11: index):
      %41 = "gpu.warp_execute_on_lane_0"(%arg11) <{warp_size = 16 : i64}> ({
        %42 = "some_def"() : () -> vector<24x16xf32>
        %43 = "vector.extract_strided_slice"(%42) <{offsets = [8], sizes = [8], strides = [1]}> {layout_operand_0 = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>, layout_result_0 = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>} : (vector<24x16xf32>) -> vector<8x16xf32>
        "gpu.yield"(%43) : (vector<8x16xf32>) -> ()
      }) : (index) -> vector<8x1xf32>
      "some_use"(%41) : (vector<8x1xf32>) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "vector_extract_strided_slice_partial_offsets", workgroup_attributions = 0 : i64} : () -> ()
    "gpu.func"() <{function_type = (index) -> ()}> ({
    ^bb0(%arg10: index):
      %37 = "gpu.warp_execute_on_lane_0"(%arg10) <{warp_size = 16 : i64}> ({
        %38 = "some_def"() : () -> vector<16x16xf32>
        %39 = "some_def"() : () -> vector<64x16xf32>
        %40 = "vector.insert_strided_slice"(%38, %39) <{offsets = [24, 0], strides = [1, 1]}> {layout_operand_0 = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>, layout_operand_1 = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>, layout_result_0 = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>} : (vector<16x16xf32>, vector<64x16xf32>) -> vector<64x16xf32>
        "gpu.yield"(%40) : (vector<64x16xf32>) -> ()
      }) : (index) -> vector<64x1xf32>
      "some_use"(%37) : (vector<64x1xf32>) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "vector_insert_strided_slice_distributed_dim_fully_inserted", workgroup_attributions = 0 : i64} : () -> ()
    "gpu.func"() <{function_type = (index) -> ()}> ({
    ^bb0(%arg9: index):
      %33 = "gpu.warp_execute_on_lane_0"(%arg9) <{warp_size = 16 : i64}> ({
        %34 = "some_def"() : () -> vector<16x1xf32>
        %35 = "some_def"() : () -> vector<64x1xf32>
        %36 = "vector.insert_strided_slice"(%34, %35) <{offsets = [24, 0], strides = [1, 1]}> {layout_operand_0 = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>, layout_operand_1 = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>, layout_result_0 = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>} : (vector<16x1xf32>, vector<64x1xf32>) -> vector<64x1xf32>
        "gpu.yield"(%36) : (vector<64x1xf32>) -> ()
      }) : (index) -> vector<64x1xf32>
      "some_use"(%33) : (vector<64x1xf32>) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "vector_insert_strided_slice_non_distributed", workgroup_attributions = 0 : i64} : () -> ()
    "gpu.func"() <{function_type = (index) -> ()}> ({
    ^bb0(%arg8: index):
      %29 = "gpu.warp_execute_on_lane_0"(%arg8) <{warp_size = 16 : i64}> ({
        %30 = "some_def"() : () -> vector<16x16xf32>
        %31 = "some_def"() : () -> vector<64x32xf32>
        %32 = "vector.insert_strided_slice"(%30, %31) <{offsets = [24, 16], strides = [1, 1]}> {layout_operand_0 = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>, layout_operand_1 = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>, layout_result_0 = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>} : (vector<16x16xf32>, vector<64x32xf32>) -> vector<64x32xf32>
        "gpu.yield"(%32) : (vector<64x32xf32>) -> ()
      }) : (index) -> vector<64x2xf32>
      "some_use"(%29) : (vector<64x2xf32>) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "vector_insert_strided_slice_inner_distributed", workgroup_attributions = 0 : i64} : () -> ()
    "gpu.func"() <{function_type = (index) -> ()}> ({
    ^bb0(%arg7: index):
      %25 = "gpu.warp_execute_on_lane_0"(%arg7) <{warp_size = 16 : i64}> ({
        %26 = "some_def"() : () -> vector<16x16xf32>
        %27 = "some_def"() : () -> vector<48x32xf32>
        %28 = "vector.insert_strided_slice"(%26, %27) <{offsets = [32, 4], strides = [1, 1]}> {layout_operand_0 = #xegpu.layout<lane_layout = [16, 1], lane_data = [1, 1]>, layout_operand_1 = #xegpu.layout<lane_layout = [16, 1], lane_data = [1, 1]>, layout_result_0 = #xegpu.layout<lane_layout = [16, 1], lane_data = [1, 1]>} : (vector<16x16xf32>, vector<48x32xf32>) -> vector<48x32xf32>
        "gpu.yield"(%28) : (vector<48x32xf32>) -> ()
      }) : (index) -> vector<3x32xf32>
      "some_use"(%25) : (vector<3x32xf32>) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "vector_insert_strided_slice_outer_distributed", workgroup_attributions = 0 : i64} : () -> ()
    "gpu.func"() <{function_type = (index) -> ()}> ({
    ^bb0(%arg6: index):
      %21 = "gpu.warp_execute_on_lane_0"(%arg6) <{warp_size = 16 : i64}> ({
        %22 = "some_def"() : () -> vector<16xf32>
        %23 = "some_def"() : () -> vector<48xf32>
        %24 = "vector.insert_strided_slice"(%22, %23) <{offsets = [16], strides = [1]}> {layout_operand_0 = #xegpu.layout<lane_layout = [16], lane_data = [1]>, layout_operand_1 = #xegpu.layout<lane_layout = [16], lane_data = [1]>, layout_result_0 = #xegpu.layout<lane_layout = [16], lane_data = [1]>} : (vector<16xf32>, vector<48xf32>) -> vector<48xf32>
        "gpu.yield"(%24) : (vector<48xf32>) -> ()
      }) : (index) -> vector<3xf32>
      "some_use"(%21) : (vector<3xf32>) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "vector_insert_strided_slice_1d", workgroup_attributions = 0 : i64} : () -> ()
    "gpu.func"() <{function_type = (index) -> ()}> ({
    ^bb0(%arg5: index):
      %17 = "gpu.warp_execute_on_lane_0"(%arg5) <{warp_size = 16 : i64}> ({
        %18 = "some_def"() : () -> vector<16xf32>
        %19 = "some_def"() : () -> vector<64x16xf32>
        %20 = "vector.insert_strided_slice"(%18, %19) <{offsets = [13, 0], strides = [1]}> {layout_operand_0 = #xegpu.layout<lane_layout = [16], lane_data = [1]>, layout_operand_1 = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>, layout_result_0 = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>} : (vector<16xf32>, vector<64x16xf32>) -> vector<64x16xf32>
        "gpu.yield"(%20) : (vector<64x16xf32>) -> ()
      }) : (index) -> vector<64x1xf32>
      "some_use"(%17) : (vector<64x1xf32>) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "vector_insert_strided_slice_different_ranks", workgroup_attributions = 0 : i64} : () -> ()
    "gpu.func"() <{function_type = (index) -> ()}> ({
    ^bb0(%arg4: index):
      %13 = "gpu.warp_execute_on_lane_0"(%arg4) <{warp_size = 16 : i64}> ({
        %14 = "some_def"() : () -> vector<8xf32>
        %15 = "some_def"() : () -> vector<48xf32>
        %16 = "vector.insert_strided_slice"(%14, %15) <{offsets = [16], strides = [1]}> {layout_operand_0 = #xegpu.layout<lane_layout = [16], lane_data = [1]>, layout_operand_1 = #xegpu.layout<lane_layout = [16], lane_data = [1]>, layout_result_0 = #xegpu.layout<lane_layout = [16], lane_data = [1]>} : (vector<8xf32>, vector<48xf32>) -> vector<48xf32>
        "gpu.yield"(%16) : (vector<48xf32>) -> ()
      }) : (index) -> vector<3xf32>
      "some_use"(%13) : (vector<3xf32>) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "vector_insert_strided_slice_unsupported_source", workgroup_attributions = 0 : i64} : () -> ()
    "gpu.func"() <{function_type = (index) -> ()}> ({
    ^bb0(%arg3: index):
      %9 = "gpu.warp_execute_on_lane_0"(%arg3) <{warp_size = 16 : i64}> ({
        %10 = "some_def"() : () -> vector<16xf32>
        %11 = "some_def"() : () -> vector<48xf32>
        %12 = "vector.insert_strided_slice"(%10, %11) <{offsets = [3], strides = [1]}> {layout_operand_0 = #xegpu.layout<lane_layout = [16], lane_data = [1]>, layout_operand_1 = #xegpu.layout<lane_layout = [16], lane_data = [1]>, layout_result_0 = #xegpu.layout<lane_layout = [16], lane_data = [1]>} : (vector<16xf32>, vector<48xf32>) -> vector<48xf32>
        "gpu.yield"(%12) : (vector<48xf32>) -> ()
      }) : (index) -> vector<3xf32>
      "some_use"(%9) : (vector<3xf32>) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "vector_insert_strided_slice_unsupported_offset", workgroup_attributions = 0 : i64} : () -> ()
    "gpu.func"() <{function_type = (index) -> ()}> ({
    ^bb0(%arg2: index):
      %6 = "gpu.warp_execute_on_lane_0"(%arg2) <{warp_size = 16 : i64}> ({
        %7 = "some_def"() : () -> vector<16xf16>
        %8 = "vector.broadcast"(%7) {layout_operand_0 = #xegpu.slice<#xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>, dims = [0]>, layout_result_0 = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>} : (vector<16xf16>) -> vector<16x16xf16>
        "gpu.yield"(%8) : (vector<16x16xf16>) -> ()
      }) : (index) -> vector<16x1xf16>
      "some_use"(%6) : (vector<16x1xf16>) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "vector_broadcast_1d_to_2d_broadcast_within_lane", workgroup_attributions = 0 : i64} : () -> ()
    "gpu.func"() <{function_type = (index) -> ()}> ({
    ^bb0(%arg1: index):
      %3 = "gpu.warp_execute_on_lane_0"(%arg1) <{warp_size = 16 : i64}> ({
        %4 = "some_def"() : () -> vector<16x1xf16>
        %5 = "vector.broadcast"(%4) {layout_operand_0 = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>, layout_result_0 = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>} : (vector<16x1xf16>) -> vector<16x16xf16>
        "gpu.yield"(%5) : (vector<16x16xf16>) -> ()
      }) : (index) -> vector<16x1xf16>
      "some_use"(%3) : (vector<16x1xf16>) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "vector_broadcast_2d_to_2d_across_lane_lower_to_noop_case", workgroup_attributions = 0 : i64} : () -> ()
    "gpu.func"() <{function_type = (index) -> ()}> ({
    ^bb0(%arg0: index):
      %0 = "gpu.warp_execute_on_lane_0"(%arg0) <{warp_size = 16 : i64}> ({
        %1 = "some_def"() : () -> f16
        %2 = "vector.broadcast"(%1) {layout_result_0 = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>} : (f16) -> vector<16x16xf16>
        "gpu.yield"(%2) : (vector<16x16xf16>) -> ()
      }) : (index) -> vector<16x1xf16>
      "some_use"(%0) : (vector<16x1xf16>) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "vector_shape_cast_scalar_to_vector", workgroup_attributions = 0 : i64} : () -> ()
  }) : () -> ()
}) : () -> ()

