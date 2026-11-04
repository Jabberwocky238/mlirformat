"builtin.module"() ({
  "gpu.module"() <{sym_name = "test"}> ({
    "gpu.func"() <{function_type = (memref<24x32xf32>) -> ()}> ({
    ^bb0(%arg145: memref<24x32xf32>):
      %178 = "xegpu.create_nd_tdesc"(%arg145) <{const_offsets = array<i64: 0, 0>, operandSegmentSizes = array<i32: 1, 0, 0, 0>}> : (memref<24x32xf32>) -> !xegpu.tensor_desc<8x16xf32>
      "gpu.return"() : () -> ()
    }) {sym_name = "create_nd_tdesc_1", workgroup_attributions = 0 : i64} : () -> ()
    "gpu.func"() <{function_type = (ui64, index, index, index, index) -> ()}> ({
    ^bb0(%arg140: ui64, %arg141: index, %arg142: index, %arg143: index, %arg144: index):
      %176 = "arith.constant"() <{value = 1 : index}> : () -> index
      %177 = "xegpu.create_nd_tdesc"(%arg140, %arg143, %arg144, %arg142, %arg141, %arg141, %176) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>, const_shape = array<i64: -9223372036854775808, -9223372036854775808>, const_strides = array<i64: -9223372036854775808, -9223372036854775808>, operandSegmentSizes = array<i32: 1, 2, 2, 2>}> : (ui64, index, index, index, index, index, index) -> !xegpu.tensor_desc<8x16xf32>
      "gpu.return"() : () -> ()
    }) {sym_name = "create_nd_tdesc_2", workgroup_attributions = 0 : i64} : () -> ()
    "gpu.func"() <{function_type = (memref<24x32xf32>) -> ()}> ({
    ^bb0(%arg139: memref<24x32xf32>):
      %175 = "xegpu.create_nd_tdesc"(%arg139) <{const_offsets = array<i64: 0, 0>, operandSegmentSizes = array<i32: 1, 0, 0, 0>}> : (memref<24x32xf32>) -> !xegpu.tensor_desc<24x16xf32, #xegpu.block_tdesc_attr<array_length = 2 : i64>>
      "gpu.return"() : () -> ()
    }) {sym_name = "create_nd_tdesc_3", workgroup_attributions = 0 : i64} : () -> ()
    "gpu.func"() <{function_type = (memref<2x24x32xf32>) -> ()}> ({
    ^bb0(%arg138: memref<2x24x32xf32>):
      %174 = "xegpu.create_nd_tdesc"(%arg138) <{const_offsets = array<i64: 0, 0, 0>, operandSegmentSizes = array<i32: 1, 0, 0, 0>}> : (memref<2x24x32xf32>) -> !xegpu.tensor_desc<8x16xf32>
      "gpu.return"() : () -> ()
    }) {sym_name = "create_nd_tdesc_4", workgroup_attributions = 0 : i64} : () -> ()
    "gpu.func"() <{function_type = (memref<2x24x32xf32, 3>) -> ()}> ({
    ^bb0(%arg137: memref<2x24x32xf32, 3>):
      %173 = "xegpu.create_nd_tdesc"(%arg137) <{const_offsets = array<i64: 0, 0, 0>, operandSegmentSizes = array<i32: 1, 0, 0, 0>}> : (memref<2x24x32xf32, 3>) -> !xegpu.tensor_desc<16xf32, #xegpu.block_tdesc_attr<memory_space =  slm>>
      "gpu.return"() : () -> ()
    }) {sym_name = "create_nd_tdesc_5", workgroup_attributions = 0 : i64} : () -> ()
    "gpu.func"() <{function_type = (memref<24x32xf32>) -> ()}> ({
    ^bb0(%arg136: memref<24x32xf32>):
      %172 = "xegpu.create_nd_tdesc"(%arg136) <{const_offsets = array<i64: 0, 0>, operandSegmentSizes = array<i32: 1, 0, 0, 0>}> : (memref<24x32xf32>) -> !xegpu.tensor_desc<24x16xf32, #xegpu.block_tdesc_attr<array_length = 2 : i64>>
      "gpu.return"() : () -> ()
    }) {sym_name = "create_nd_tdesc_6", workgroup_attributions = 0 : i64} : () -> ()
    "gpu.func"() <{function_type = (memref<8x24x32x48x64xf32>) -> ()}> ({
    ^bb0(%arg135: memref<8x24x32x48x64xf32>):
      %171 = "xegpu.create_nd_tdesc"(%arg135) <{const_offsets = array<i64: 0, 0, 0, 0, 0>, operandSegmentSizes = array<i32: 1, 0, 0, 0>}> : (memref<8x24x32x48x64xf32>) -> !xegpu.tensor_desc<8x8x8x24x32xf32>
      "gpu.return"() : () -> ()
    }) {sym_name = "create_nd_tdesc_7", workgroup_attributions = 0 : i64} : () -> ()
    "gpu.func"() <{function_type = (ui64, index, index, index, index, memref<24x32xf32>) -> ()}> ({
    ^bb0(%arg129: ui64, %arg130: index, %arg131: index, %arg132: index, %arg133: index, %arg134: memref<24x32xf32>):
      %169 = "arith.constant"() <{value = 1 : index}> : () -> index
      %170 = "xegpu.create_nd_tdesc"(%arg134) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>}> : (memref<24x32xf32>) -> !xegpu.tensor_desc<8x16xf32>
      "gpu.return"() : () -> ()
    }) {sym_name = "test_create_nd_tdesc_7", workgroup_attributions = 0 : i64} : () -> ()
    "gpu.func"() <{function_type = (ui64, index, index, index, index) -> ()}> ({
    ^bb0(%arg124: ui64, %arg125: index, %arg126: index, %arg127: index, %arg128: index):
      %167 = "arith.constant"() <{value = 1 : index}> : () -> index
      %168 = "xegpu.create_nd_tdesc"(%arg124, %arg126, %arg125, %arg125, %167) <{const_shape = array<i64: -9223372036854775808, -9223372036854775808>, const_strides = array<i64: -9223372036854775808, -9223372036854775808>, operandSegmentSizes = array<i32: 1, 0, 2, 2>}> : (ui64, index, index, index, index) -> !xegpu.tensor_desc<8x16xf32>
      "gpu.return"() : () -> ()
    }) {sym_name = "test_create_nd_tdesc_8", workgroup_attributions = 0 : i64} : () -> ()
    "gpu.func"() <{function_type = (memref<?x?xf16>, index, index, index, index) -> ()}> ({
    ^bb0(%arg119: memref<?x?xf16>, %arg120: index, %arg121: index, %arg122: index, %arg123: index):
      %165 = "arith.constant"() <{value = 1 : index}> : () -> index
      %166 = "xegpu.create_nd_tdesc"(%arg119, %arg122, %arg123, %arg121, %arg120, %arg120, %165) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>, const_shape = array<i64: -9223372036854775808, -9223372036854775808>, const_strides = array<i64: -9223372036854775808, -9223372036854775808>, operandSegmentSizes = array<i32: 1, 2, 2, 2>}> : (memref<?x?xf16>, index, index, index, index, index, index) -> !xegpu.tensor_desc<8x16xf16>
      "gpu.return"() : () -> ()
    }) {sym_name = "test_create_nd_tdesc_9", workgroup_attributions = 0 : i64} : () -> ()
    "gpu.func"() <{function_type = (memref<?x?xf16>, index, index, index, index) -> ()}> ({
    ^bb0(%arg114: memref<?x?xf16>, %arg115: index, %arg116: index, %arg117: index, %arg118: index):
      %163 = "arith.constant"() <{value = 1 : index}> : () -> index
      %164 = "xegpu.create_nd_tdesc"(%arg114, %arg116, %arg115, %arg115, %163) <{const_shape = array<i64: -9223372036854775808, -9223372036854775808>, const_strides = array<i64: -9223372036854775808, -9223372036854775808>, operandSegmentSizes = array<i32: 1, 0, 2, 2>}> : (memref<?x?xf16>, index, index, index, index) -> !xegpu.tensor_desc<8x16xf16>
      "gpu.return"() : () -> ()
    }) {sym_name = "test_create_nd_tdesc_10", workgroup_attributions = 0 : i64} : () -> ()
    "gpu.func"() <{function_type = (memref<24x32xf16>) -> ()}> ({
    ^bb0(%arg113: memref<24x32xf16>):
      %162 = "xegpu.create_nd_tdesc"(%arg113) <{const_offsets = array<i64: 0, 0>, operandSegmentSizes = array<i32: 1, 0, 0, 0>}> : (memref<24x32xf16>) -> !xegpu.tensor_desc<8x16xf16>
      "xegpu.prefetch_nd"(%162) <{l1_hint = #xegpu.cache_hint<cached>, l2_hint = #xegpu.cache_hint<uncached>}> : (!xegpu.tensor_desc<8x16xf16>) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "prefetch_nd", workgroup_attributions = 0 : i64} : () -> ()
    "gpu.func"() <{function_type = (memref<48x64xf16>) -> ()}> ({
    ^bb0(%arg112: memref<48x64xf16>):
      %161 = "xegpu.create_nd_tdesc"(%arg112) <{const_offsets = array<i64: 0, 0>, operandSegmentSizes = array<i32: 1, 0, 0, 0>}> : (memref<48x64xf16>) -> !xegpu.tensor_desc<8x16xf16>
      "xegpu.prefetch_nd"(%161) <{l1_hint = #xegpu.cache_hint<cached>, l2_hint = #xegpu.cache_hint<uncached>}> : (!xegpu.tensor_desc<8x16xf16>) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "prefetch_nd_2", workgroup_attributions = 0 : i64} : () -> ()
    "gpu.func"() <{function_type = (memref<48x64xf16>, index, index) -> ()}> ({
    ^bb0(%arg109: memref<48x64xf16>, %arg110: index, %arg111: index):
      %160 = "xegpu.create_nd_tdesc"(%arg109) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>}> : (memref<48x64xf16>) -> !xegpu.tensor_desc<8x16xf16>
      "xegpu.prefetch_nd"(%160, %arg110, %arg111) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>, l1_hint = #xegpu.cache_hint<cached>, l2_hint = #xegpu.cache_hint<uncached>}> : (!xegpu.tensor_desc<8x16xf16>, index, index) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "prefetch_nd_offset_1", workgroup_attributions = 0 : i64} : () -> ()
    "gpu.func"() <{function_type = (memref<8x16xf16>) -> ()}> ({
    ^bb0(%arg108: memref<8x16xf16>):
      %158 = "xegpu.create_nd_tdesc"(%arg108) <{const_offsets = array<i64: 0, 0>, operandSegmentSizes = array<i32: 1, 0, 0, 0>}> : (memref<8x16xf16>) -> !xegpu.tensor_desc<8x16xf16>
      %159 = "xegpu.load_nd"(%158) <{l1_hint = #xegpu.cache_hint<cached>, l2_hint = #xegpu.cache_hint<uncached>, packed}> : (!xegpu.tensor_desc<8x16xf16>) -> vector<4x16x2xf16>
      "gpu.return"() : () -> ()
    }) {sym_name = "subgroup_load_nd", workgroup_attributions = 0 : i64} : () -> ()
    "gpu.func"() <{function_type = (memref<8x16xf16>) -> ()}> ({
    ^bb0(%arg107: memref<8x16xf16>):
      %156 = "xegpu.create_nd_tdesc"(%arg107) <{const_offsets = array<i64: 0, 0>, operandSegmentSizes = array<i32: 1, 0, 0, 0>}> : (memref<8x16xf16>) -> !xegpu.tensor_desc<8x16xf16>
      %157 = "xegpu.load_nd"(%156) <{l1_hint = #xegpu.cache_hint<cached>, l2_hint = #xegpu.cache_hint<uncached>}> : (!xegpu.tensor_desc<8x16xf16>) -> vector<8xf16>
      "gpu.return"() : () -> ()
    }) {sym_name = "simt_load_nd", workgroup_attributions = 0 : i64} : () -> ()
    "gpu.func"() <{function_type = (memref<8x16xf16>) -> ()}> ({
    ^bb0(%arg106: memref<8x16xf16>):
      %154 = "xegpu.create_nd_tdesc"(%arg106) <{const_offsets = array<i64: 0, 0>, operandSegmentSizes = array<i32: 1, 0, 0, 0>}> : (memref<8x16xf16>) -> !xegpu.tensor_desc<16xf16>
      %155 = "xegpu.load_nd"(%154) <{l1_hint = #xegpu.cache_hint<cached>, l2_hint = #xegpu.cache_hint<uncached>}> : (!xegpu.tensor_desc<16xf16>) -> vector<16xf16>
      "gpu.return"() : () -> ()
    }) {sym_name = "subgroup_load_nd_2", workgroup_attributions = 0 : i64} : () -> ()
    "gpu.func"() <{function_type = (memref<8x16xf16>) -> ()}> ({
    ^bb0(%arg105: memref<8x16xf16>):
      %152 = "xegpu.create_nd_tdesc"(%arg105) <{const_offsets = array<i64: 0, 0>, operandSegmentSizes = array<i32: 1, 0, 0, 0>}> : (memref<8x16xf16>) -> !xegpu.tensor_desc<16xf16>
      %153 = "xegpu.load_nd"(%152) <{l1_hint = #xegpu.cache_hint<cached>, l2_hint = #xegpu.cache_hint<uncached>}> : (!xegpu.tensor_desc<16xf16>) -> vector<1xf16>
      "gpu.return"() : () -> ()
    }) {sym_name = "simt_load_nd_2", workgroup_attributions = 0 : i64} : () -> ()
    "gpu.func"() <{function_type = (memref<24x32xf32>) -> ()}> ({
    ^bb0(%arg104: memref<24x32xf32>):
      %150 = "xegpu.create_nd_tdesc"(%arg104) <{const_offsets = array<i64: 0, 0>, operandSegmentSizes = array<i32: 1, 0, 0, 0>}> : (memref<24x32xf32>) -> !xegpu.tensor_desc<8x16xf32>
      %151 = "xegpu.load_nd"(%150) <{l1_hint = #xegpu.cache_hint<cached>, l2_hint = #xegpu.cache_hint<uncached>}> : (!xegpu.tensor_desc<8x16xf32>) -> vector<8x16xf32>
      "gpu.return"() : () -> ()
    }) {sym_name = "subgroup_load_nd_3", workgroup_attributions = 0 : i64} : () -> ()
    "gpu.func"() <{function_type = (memref<24x32xf32>) -> ()}> ({
    ^bb0(%arg103: memref<24x32xf32>):
      %148 = "xegpu.create_nd_tdesc"(%arg103) <{const_offsets = array<i64: 0, 0>, operandSegmentSizes = array<i32: 1, 0, 0, 0>}> : (memref<24x32xf32>) -> !xegpu.tensor_desc<8x16xf32>
      %149 = "xegpu.load_nd"(%148) <{l1_hint = #xegpu.cache_hint<cached>, l2_hint = #xegpu.cache_hint<uncached>}> : (!xegpu.tensor_desc<8x16xf32>) -> vector<8xf32>
      "gpu.return"() : () -> ()
    }) {sym_name = "simt_load_nd_3", workgroup_attributions = 0 : i64} : () -> ()
    "gpu.func"() <{function_type = (memref<24x32xf16>) -> ()}> ({
    ^bb0(%arg102: memref<24x32xf16>):
      %146 = "xegpu.create_nd_tdesc"(%arg102) <{const_offsets = array<i64: 0, 0>, operandSegmentSizes = array<i32: 1, 0, 0, 0>}> : (memref<24x32xf16>) -> !xegpu.tensor_desc<16x16xf16>
      %147 = "xegpu.load_nd"(%146) <{l1_hint = #xegpu.cache_hint<cached>, l2_hint = #xegpu.cache_hint<uncached>, packed}> : (!xegpu.tensor_desc<16x16xf16>) -> vector<8x16x2xf16>
      "gpu.return"() : () -> ()
    }) {sym_name = "subgroup_load_nd_4", workgroup_attributions = 0 : i64} : () -> ()
    "gpu.func"() <{function_type = (memref<24x32xf16>) -> ()}> ({
    ^bb0(%arg101: memref<24x32xf16>):
      %144 = "xegpu.create_nd_tdesc"(%arg101) <{const_offsets = array<i64: 0, 0>, operandSegmentSizes = array<i32: 1, 0, 0, 0>}> : (memref<24x32xf16>) -> !xegpu.tensor_desc<16x16xf16>
      %145 = "xegpu.load_nd"(%144) <{l1_hint = #xegpu.cache_hint<cached>, l2_hint = #xegpu.cache_hint<uncached>}> : (!xegpu.tensor_desc<16x16xf16>) -> vector<16xf16>
      "gpu.return"() : () -> ()
    }) {sym_name = "simt_load_nd_4", workgroup_attributions = 0 : i64} : () -> ()
    "gpu.func"() <{function_type = (memref<24x32xf32>) -> ()}> ({
    ^bb0(%arg100: memref<24x32xf32>):
      %142 = "xegpu.create_nd_tdesc"(%arg100) <{const_offsets = array<i64: 0, 0>, operandSegmentSizes = array<i32: 1, 0, 0, 0>}> : (memref<24x32xf32>) -> !xegpu.tensor_desc<32xf32>
      %143 = "xegpu.load_nd"(%142) <{l1_hint = #xegpu.cache_hint<cached>, l2_hint = #xegpu.cache_hint<uncached>}> : (!xegpu.tensor_desc<32xf32>) -> vector<32xf32>
      "gpu.return"() : () -> ()
    }) {sym_name = "subgroup_load_nd_5", workgroup_attributions = 0 : i64} : () -> ()
    "gpu.func"() <{function_type = (memref<24x32xf32>) -> ()}> ({
    ^bb0(%arg99: memref<24x32xf32>):
      %140 = "xegpu.create_nd_tdesc"(%arg99) <{const_offsets = array<i64: 0, 0>, operandSegmentSizes = array<i32: 1, 0, 0, 0>}> : (memref<24x32xf32>) -> !xegpu.tensor_desc<32xf32>
      %141 = "xegpu.load_nd"(%140) <{l1_hint = #xegpu.cache_hint<cached>, l2_hint = #xegpu.cache_hint<uncached>}> : (!xegpu.tensor_desc<32xf32>) -> vector<2xf32>
      "gpu.return"() : () -> ()
    }) {sym_name = "simt_load_nd_5", workgroup_attributions = 0 : i64} : () -> ()
    "gpu.func"() <{function_type = (memref<24x32xf16>) -> ()}> ({
    ^bb0(%arg98: memref<24x32xf16>):
      %138 = "xegpu.create_nd_tdesc"(%arg98) <{const_offsets = array<i64: 0, 0>, operandSegmentSizes = array<i32: 1, 0, 0, 0>}> : (memref<24x32xf16>) -> !xegpu.tensor_desc<16x16xf16, #xegpu.block_tdesc_attr<array_length = 2 : i64>>
      %139 = "xegpu.load_nd"(%138) <{l1_hint = #xegpu.cache_hint<cached>, l2_hint = #xegpu.cache_hint<uncached>}> : (!xegpu.tensor_desc<16x16xf16, #xegpu.block_tdesc_attr<array_length = 2 : i64>>) -> vector<2x16x16xf16>
      "gpu.return"() : () -> ()
    }) {sym_name = "subgroup_load_nd_6", workgroup_attributions = 0 : i64} : () -> ()
    "gpu.func"() <{function_type = (memref<24x32xf16>) -> ()}> ({
    ^bb0(%arg97: memref<24x32xf16>):
      %136 = "xegpu.create_nd_tdesc"(%arg97) <{const_offsets = array<i64: 0, 0>, operandSegmentSizes = array<i32: 1, 0, 0, 0>}> : (memref<24x32xf16>) -> !xegpu.tensor_desc<16x16xf16, #xegpu.block_tdesc_attr<array_length = 2 : i64>>
      %137 = "xegpu.load_nd"(%136) <{l1_hint = #xegpu.cache_hint<cached>, l2_hint = #xegpu.cache_hint<uncached>}> : (!xegpu.tensor_desc<16x16xf16, #xegpu.block_tdesc_attr<array_length = 2 : i64>>) -> vector<32xf16>
      "gpu.return"() : () -> ()
    }) {sym_name = "simt_load_nd_6", workgroup_attributions = 0 : i64} : () -> ()
    "gpu.func"() <{function_type = (memref<24x32xf16>) -> ()}> ({
    ^bb0(%arg96: memref<24x32xf16>):
      %134 = "xegpu.create_nd_tdesc"(%arg96) <{const_offsets = array<i64: 0, 0>, operandSegmentSizes = array<i32: 1, 0, 0, 0>}> : (memref<24x32xf16>) -> !xegpu.tensor_desc<16x16xf16, #xegpu.block_tdesc_attr<array_length = 2 : i64>>
      %135 = "xegpu.load_nd"(%134) <{l1_hint = #xegpu.cache_hint<cached>, l2_hint = #xegpu.cache_hint<uncached>, packed}> : (!xegpu.tensor_desc<16x16xf16, #xegpu.block_tdesc_attr<array_length = 2 : i64>>) -> vector<2x8x16x2xf16>
      "gpu.return"() : () -> ()
    }) {sym_name = "subgroup_load_nd_7", workgroup_attributions = 0 : i64} : () -> ()
    "gpu.func"() <{function_type = (memref<24x32xf16>) -> ()}> ({
    ^bb0(%arg95: memref<24x32xf16>):
      %132 = "xegpu.create_nd_tdesc"(%arg95) <{const_offsets = array<i64: 0, 0>, operandSegmentSizes = array<i32: 1, 0, 0, 0>}> : (memref<24x32xf16>) -> !xegpu.tensor_desc<16x16xf16, #xegpu.block_tdesc_attr<array_length = 2 : i64>>
      %133 = "xegpu.load_nd"(%132) <{l1_hint = #xegpu.cache_hint<cached>, l2_hint = #xegpu.cache_hint<uncached>}> : (!xegpu.tensor_desc<16x16xf16, #xegpu.block_tdesc_attr<array_length = 2 : i64>>) -> vector<32xf16>
      "gpu.return"() : () -> ()
    }) {sym_name = "simt_load_nd_7", workgroup_attributions = 0 : i64} : () -> ()
    "gpu.func"() <{function_type = (memref<24x32xf32>) -> ()}> ({
    ^bb0(%arg94: memref<24x32xf32>):
      %130 = "xegpu.create_nd_tdesc"(%arg94) <{const_offsets = array<i64: 0, 0>, operandSegmentSizes = array<i32: 1, 0, 0, 0>}> : (memref<24x32xf32>) -> !xegpu.tensor_desc<16x8xf32>
      %131 = "xegpu.load_nd"(%130) <{l1_hint = #xegpu.cache_hint<cached>, l2_hint = #xegpu.cache_hint<uncached>, transpose = array<i64: 1, 0>}> : (!xegpu.tensor_desc<16x8xf32>) -> vector<8x16xf32>
      "gpu.return"() : () -> ()
    }) {sym_name = "subgroup_load_nd_8", workgroup_attributions = 0 : i64} : () -> ()
    "gpu.func"() <{function_type = (memref<24x32xf32>, index, index) -> ()}> ({
    ^bb0(%arg91: memref<24x32xf32>, %arg92: index, %arg93: index):
      %128 = "xegpu.create_nd_tdesc"(%arg91) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>}> : (memref<24x32xf32>) -> !xegpu.tensor_desc<16x8xf32>
      %129 = "xegpu.load_nd"(%128, %arg92, %arg93) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>, l1_hint = #xegpu.cache_hint<cached>, l2_hint = #xegpu.cache_hint<uncached>, transpose = array<i64: 1, 0>}> : (!xegpu.tensor_desc<16x8xf32>, index, index) -> vector<8x16xf32>
      "gpu.return"() : () -> ()
    }) {sym_name = "subgroup_load_nd_offset_1", workgroup_attributions = 0 : i64} : () -> ()
    "gpu.func"() <{function_type = (memref<24x32xf32>, index) -> ()}> ({
    ^bb0(%arg89: memref<24x32xf32>, %arg90: index):
      %126 = "xegpu.create_nd_tdesc"(%arg89) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>}> : (memref<24x32xf32>) -> !xegpu.tensor_desc<16x8xf32>
      %127 = "xegpu.load_nd"(%126, %arg90) <{const_offsets = array<i64: -9223372036854775808, 0>, l1_hint = #xegpu.cache_hint<cached>, l2_hint = #xegpu.cache_hint<uncached>, transpose = array<i64: 1, 0>}> : (!xegpu.tensor_desc<16x8xf32>, index) -> vector<8x16xf32>
      "gpu.return"() : () -> ()
    }) {sym_name = "subgroup_load_nd_offset_2", workgroup_attributions = 0 : i64} : () -> ()
    "gpu.func"() <{function_type = (memref<24x32xf32>) -> ()}> ({
    ^bb0(%arg88: memref<24x32xf32>):
      %124 = "xegpu.create_nd_tdesc"(%arg88) <{const_offsets = array<i64: 0, 0>, operandSegmentSizes = array<i32: 1, 0, 0, 0>}> : (memref<24x32xf32>) -> !xegpu.tensor_desc<16x8xf32>
      %125 = "xegpu.load_nd"(%124) <{l1_hint = #xegpu.cache_hint<cached>, l2_hint = #xegpu.cache_hint<uncached>, transpose = array<i64: 1, 0>}> : (!xegpu.tensor_desc<16x8xf32>) -> vector<8xf32>
      "gpu.return"() : () -> ()
    }) {sym_name = "simt_load_nd_8", workgroup_attributions = 0 : i64} : () -> ()
    "gpu.func"() <{function_type = (memref<24x32xf32>) -> ()}> ({
    ^bb0(%arg87: memref<24x32xf32>):
      %122 = "xegpu.create_nd_tdesc"(%arg87) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>}> : (memref<24x32xf32>) -> !xegpu.tensor_desc<16x8xf32>
      %123 = "xegpu.load_nd"(%122) <{const_offsets = array<i64: 0, 0>, l1_hint = #xegpu.cache_hint<cached>, l2_hint = #xegpu.cache_hint<uncached>, transpose = array<i64: 1, 0>}> : (!xegpu.tensor_desc<16x8xf32>) -> vector<8xf32>
      "gpu.return"() : () -> ()
    }) {sym_name = "simt_load_nd_offset_1", workgroup_attributions = 0 : i64} : () -> ()
    "gpu.func"() <{function_type = (memref<24x32xf16>) -> ()}> ({
    ^bb0(%arg86: memref<24x32xf16>):
      %120 = "arith.constant"() <{value = dense<1.000000e+00> : vector<24x32xf16>}> : () -> vector<24x32xf16>
      %121 = "xegpu.create_nd_tdesc"(%arg86) <{const_offsets = array<i64: 0, 0>, operandSegmentSizes = array<i32: 1, 0, 0, 0>}> : (memref<24x32xf16>) -> !xegpu.tensor_desc<24x32xf16>
      "xegpu.store_nd"(%120, %121) <{l1_hint = #xegpu.cache_hint<write_back>, l2_hint = #xegpu.cache_hint<uncached>}> : (vector<24x32xf16>, !xegpu.tensor_desc<24x32xf16>) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "subgroup_store_nd", workgroup_attributions = 0 : i64} : () -> ()
    "gpu.func"() <{function_type = (memref<24x32xf16>) -> ()}> ({
    ^bb0(%arg85: memref<24x32xf16>):
      %118 = "arith.constant"() <{value = dense<1.000000e+00> : vector<48xf16>}> : () -> vector<48xf16>
      %119 = "xegpu.create_nd_tdesc"(%arg85) <{const_offsets = array<i64: 0, 0>, operandSegmentSizes = array<i32: 1, 0, 0, 0>}> : (memref<24x32xf16>) -> !xegpu.tensor_desc<24x32xf16>
      "xegpu.store_nd"(%118, %119) <{l1_hint = #xegpu.cache_hint<write_back>, l2_hint = #xegpu.cache_hint<uncached>}> : (vector<48xf16>, !xegpu.tensor_desc<24x32xf16>) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "simt_store_nd", workgroup_attributions = 0 : i64} : () -> ()
    "gpu.func"() <{function_type = (memref<24x32xf16>, index) -> ()}> ({
    ^bb0(%arg83: memref<24x32xf16>, %arg84: index):
      %116 = "arith.constant"() <{value = dense<1.000000e+00> : vector<32xf16>}> : () -> vector<32xf16>
      %117 = "xegpu.create_nd_tdesc"(%arg83) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>}> : (memref<24x32xf16>) -> !xegpu.tensor_desc<32xf16>
      "xegpu.store_nd"(%116, %117, %arg84) <{const_offsets = array<i64: -9223372036854775808>, l1_hint = #xegpu.cache_hint<write_back>, l2_hint = #xegpu.cache_hint<uncached>}> : (vector<32xf16>, !xegpu.tensor_desc<32xf16>, index) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "subgroup_store_nd_2", workgroup_attributions = 0 : i64} : () -> ()
    "gpu.func"() <{function_type = (memref<24x32xf16>) -> ()}> ({
    ^bb0(%arg82: memref<24x32xf16>):
      %114 = "arith.constant"() <{value = dense<1.000000e+00> : vector<32xf16>}> : () -> vector<32xf16>
      %115 = "xegpu.create_nd_tdesc"(%arg82) <{const_offsets = array<i64: 0, 0>, operandSegmentSizes = array<i32: 1, 0, 0, 0>}> : (memref<24x32xf16>) -> !xegpu.tensor_desc<32xf16>
      "xegpu.store_nd"(%114, %115) <{l1_hint = #xegpu.cache_hint<write_back>, l2_hint = #xegpu.cache_hint<uncached>}> : (vector<32xf16>, !xegpu.tensor_desc<32xf16>) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "subgroup_store_nd_offset_1", workgroup_attributions = 0 : i64} : () -> ()
    "gpu.func"() <{function_type = (memref<24x32xf16>) -> ()}> ({
    ^bb0(%arg81: memref<24x32xf16>):
      %112 = "arith.constant"() <{value = dense<1.000000e+00> : vector<2xf16>}> : () -> vector<2xf16>
      %113 = "xegpu.create_nd_tdesc"(%arg81) <{const_offsets = array<i64: 0, 0>, operandSegmentSizes = array<i32: 1, 0, 0, 0>}> : (memref<24x32xf16>) -> !xegpu.tensor_desc<32xf16>
      "xegpu.store_nd"(%112, %113) <{l1_hint = #xegpu.cache_hint<write_back>, l2_hint = #xegpu.cache_hint<uncached>}> : (vector<2xf16>, !xegpu.tensor_desc<32xf16>) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "simt_store_nd_2", workgroup_attributions = 0 : i64} : () -> ()
    "gpu.func"() <{function_type = (memref<24x32xf16>) -> ()}> ({
    ^bb0(%arg80: memref<24x32xf16>):
      %110 = "arith.constant"() <{value = dense<1.000000e+00> : vector<2xf16>}> : () -> vector<2xf16>
      %111 = "xegpu.create_nd_tdesc"(%arg80) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>}> : (memref<24x32xf16>) -> !xegpu.tensor_desc<32xf16>
      "xegpu.store_nd"(%110, %111) <{const_offsets = array<i64: 0>, l1_hint = #xegpu.cache_hint<write_back>, l2_hint = #xegpu.cache_hint<uncached>}> : (vector<2xf16>, !xegpu.tensor_desc<32xf16>) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "simt_store_nd_offset_1", workgroup_attributions = 0 : i64} : () -> ()
    "gpu.func"() <{function_type = (memref<24x32xf32>) -> ()}> ({
    ^bb0(%arg79: memref<24x32xf32>):
      %108 = "xegpu.create_nd_tdesc"(%arg79) <{const_offsets = array<i64: 0, 0>, operandSegmentSizes = array<i32: 1, 0, 0, 0>}> : (memref<24x32xf32>) -> !xegpu.tensor_desc<8x16xf32>
      %109 = "xegpu.update_nd_offset"(%108) <{const_offsets = array<i64: 0, 16>}> : (!xegpu.tensor_desc<8x16xf32>) -> !xegpu.tensor_desc<8x16xf32>
      "gpu.return"() : () -> ()
    }) {sym_name = "update_nd_tdesc", workgroup_attributions = 0 : i64} : () -> ()
    "gpu.func"() <{function_type = (memref<8x24x32xf32>) -> ()}> ({
    ^bb0(%arg78: memref<8x24x32xf32>):
      %106 = "xegpu.create_nd_tdesc"(%arg78) <{const_offsets = array<i64: 0, 0, 0>, operandSegmentSizes = array<i32: 1, 0, 0, 0>}> : (memref<8x24x32xf32>) -> !xegpu.tensor_desc<2x8x16xf32>
      %107 = "xegpu.update_nd_offset"(%106) <{const_offsets = array<i64: 0, 0, 16>}> : (!xegpu.tensor_desc<2x8x16xf32>) -> !xegpu.tensor_desc<2x8x16xf32>
      "gpu.return"() : () -> ()
    }) {sym_name = "update_nd_tdesc_2", workgroup_attributions = 0 : i64} : () -> ()
    "gpu.func"() <{function_type = (ui64) -> ()}> ({
    ^bb0(%arg77: ui64):
      %104 = "arith.constant"() <{value = dense<[0, 8, 16, 24]> : vector<4xindex>}> : () -> vector<4xindex>
      %105 = "xegpu.create_tdesc"(%arg77, %104) : (ui64, vector<4xindex>) -> !xegpu.tensor_desc<4x2xf32, #xegpu.scatter_tdesc_attr<chunk_size = 2 : i64>>
      "gpu.return"() : () -> ()
    }) {sym_name = "create_tdesc", workgroup_attributions = 0 : i64} : () -> ()
    "gpu.func"() <{function_type = (memref<?xf32, 3>) -> ()}> ({
    ^bb0(%arg76: memref<?xf32, 3>):
      %102 = "arith.constant"() <{value = dense<[0, 8, 16, 24]> : vector<4xindex>}> : () -> vector<4xindex>
      %103 = "xegpu.create_tdesc"(%arg76, %102) : (memref<?xf32, 3>, vector<4xindex>) -> !xegpu.tensor_desc<4x2xf32, #xegpu.scatter_tdesc_attr<memory_space =  slm, chunk_size = 2 : i64>>
      "gpu.return"() : () -> ()
    }) {sym_name = "create_tdesc_1", workgroup_attributions = 0 : i64} : () -> ()
    "gpu.func"() <{function_type = (memref<?xf32>) -> ()}> ({
    ^bb0(%arg75: memref<?xf32>):
      %100 = "arith.constant"() <{value = dense<[0, 8, 16, 24]> : vector<4xindex>}> : () -> vector<4xindex>
      %101 = "xegpu.create_tdesc"(%arg75, %100) : (memref<?xf32>, vector<4xindex>) -> !xegpu.tensor_desc<4xf32, #xegpu.scatter_tdesc_attr<>>
      "gpu.return"() : () -> ()
    }) {sym_name = "create_tdesc_2", workgroup_attributions = 0 : i64} : () -> ()
    "gpu.func"() <{function_type = (ui64) -> ()}> ({
    ^bb0(%arg74: ui64):
      %98 = "arith.constant"() <{value = dense<[0, 8, 16, 24]> : vector<4xindex>}> : () -> vector<4xindex>
      %99 = "xegpu.create_tdesc"(%arg74, %98) : (ui64, vector<4xindex>) -> !xegpu.tensor_desc<4x2xf16, #xegpu.scatter_tdesc_attr<chunk_size = 2 : i64>>
      "gpu.return"() : () -> ()
    }) {sym_name = "create_tdesc_3", workgroup_attributions = 0 : i64} : () -> ()
    "gpu.func"() <{function_type = (ui64) -> ()}> ({
    ^bb0(%arg73: ui64):
      %96 = "arith.constant"() <{value = dense<[[0, 8, 16, 24], [32, 40, 48, 56]]> : vector<2x4xindex>}> : () -> vector<2x4xindex>
      %97 = "xegpu.create_tdesc"(%arg73, %96) : (ui64, vector<2x4xindex>) -> !xegpu.tensor_desc<2x4x2xf16, #xegpu.scatter_tdesc_attr<chunk_size = 2 : i64>>
      "gpu.return"() : () -> ()
    }) {sym_name = "create_tdesc_4", workgroup_attributions = 0 : i64} : () -> ()
    "gpu.func"() <{function_type = (ui64) -> ()}> ({
    ^bb0(%arg72: ui64):
      %92 = "arith.constant"() <{value = dense<[0, 8, 16, 24]> : vector<4xindex>}> : () -> vector<4xindex>
      %93 = "arith.constant"() <{value = dense<true> : vector<4xi1>}> : () -> vector<4xi1>
      %94 = "xegpu.create_tdesc"(%arg72, %92) : (ui64, vector<4xindex>) -> !xegpu.tensor_desc<4x2xf32, #xegpu.scatter_tdesc_attr<chunk_size = 2 : i64>>
      %95 = "xegpu.load"(%94, %93) <{l1_hint = #xegpu.cache_hint<cached>, l2_hint = #xegpu.cache_hint<uncached>}> : (!xegpu.tensor_desc<4x2xf32, #xegpu.scatter_tdesc_attr<chunk_size = 2 : i64>>, vector<4xi1>) -> vector<4x2xf32>
      "gpu.return"() : () -> ()
    }) {sym_name = "subgroup_load", workgroup_attributions = 0 : i64} : () -> ()
    "gpu.func"() <{function_type = (ui64) -> ()}> ({
    ^bb0(%arg71: ui64):
      %88 = "arith.constant"() <{value = dense<[0, 8, 16, 24]> : vector<4xindex>}> : () -> vector<4xindex>
      %89 = "arith.constant"() <{value = dense<true> : vector<4xi1>}> : () -> vector<4xi1>
      %90 = "xegpu.create_tdesc"(%arg71, %88) : (ui64, vector<4xindex>) -> !xegpu.tensor_desc<4x2xf32, #xegpu.scatter_tdesc_attr<chunk_size = 2 : i64>>
      %91 = "xegpu.load"(%90, %89) <{l1_hint = #xegpu.cache_hint<cached>, l2_hint = #xegpu.cache_hint<uncached>}> : (!xegpu.tensor_desc<4x2xf32, #xegpu.scatter_tdesc_attr<chunk_size = 2 : i64>>, vector<4xi1>) -> vector<2xf32>
      "gpu.return"() : () -> ()
    }) {sym_name = "simt_load", workgroup_attributions = 0 : i64} : () -> ()
    "gpu.func"() <{function_type = (ui64) -> ()}> ({
    ^bb0(%arg70: ui64):
      %84 = "arith.constant"() <{value = dense<[0, 8, 16, 24]> : vector<4xindex>}> : () -> vector<4xindex>
      %85 = "arith.constant"() <{value = dense<true> : vector<4xi1>}> : () -> vector<4xi1>
      %86 = "xegpu.create_tdesc"(%arg70, %84) : (ui64, vector<4xindex>) -> !xegpu.tensor_desc<4xf32, #xegpu.scatter_tdesc_attr<>>
      %87 = "xegpu.load"(%86, %85) <{l1_hint = #xegpu.cache_hint<cached>, l2_hint = #xegpu.cache_hint<uncached>}> : (!xegpu.tensor_desc<4xf32, #xegpu.scatter_tdesc_attr<>>, vector<4xi1>) -> vector<4xf32>
      "gpu.return"() : () -> ()
    }) {sym_name = "subgroup_load_2", workgroup_attributions = 0 : i64} : () -> ()
    "gpu.func"() <{function_type = (ui64) -> ()}> ({
    ^bb0(%arg69: ui64):
      %80 = "arith.constant"() <{value = dense<[0, 8, 16, 24]> : vector<4xindex>}> : () -> vector<4xindex>
      %81 = "arith.constant"() <{value = dense<true> : vector<4xi1>}> : () -> vector<4xi1>
      %82 = "xegpu.create_tdesc"(%arg69, %80) : (ui64, vector<4xindex>) -> !xegpu.tensor_desc<4xf32, #xegpu.scatter_tdesc_attr<>>
      %83 = "xegpu.load"(%82, %81) <{l1_hint = #xegpu.cache_hint<cached>, l2_hint = #xegpu.cache_hint<uncached>}> : (!xegpu.tensor_desc<4xf32, #xegpu.scatter_tdesc_attr<>>, vector<4xi1>) -> vector<1xf32>
      "gpu.return"() : () -> ()
    }) {sym_name = "simt_load_2", workgroup_attributions = 0 : i64} : () -> ()
    "gpu.func"() <{function_type = (ui64) -> ()}> ({
    ^bb0(%arg68: ui64):
      %76 = "arith.constant"() <{value = dense<[0, 8, 16, 24]> : vector<4xindex>}> : () -> vector<4xindex>
      %77 = "arith.constant"() <{value = dense<true> : vector<4xi1>}> : () -> vector<4xi1>
      %78 = "xegpu.create_tdesc"(%arg68, %76) : (ui64, vector<4xindex>) -> !xegpu.tensor_desc<4x8xf16, #xegpu.scatter_tdesc_attr<chunk_size = 8 : i64>>
      %79 = "xegpu.load"(%78, %77) <{l1_hint = #xegpu.cache_hint<cached>, l2_hint = #xegpu.cache_hint<uncached>}> : (!xegpu.tensor_desc<4x8xf16, #xegpu.scatter_tdesc_attr<chunk_size = 8 : i64>>, vector<4xi1>) -> vector<4x8xf16>
      "gpu.return"() : () -> ()
    }) {sym_name = "subgroup_load_3", workgroup_attributions = 0 : i64} : () -> ()
    "gpu.func"() <{function_type = (ui64) -> ()}> ({
    ^bb0(%arg67: ui64):
      %72 = "arith.constant"() <{value = dense<[0, 8, 16, 24]> : vector<4xindex>}> : () -> vector<4xindex>
      %73 = "arith.constant"() <{value = dense<true> : vector<4xi1>}> : () -> vector<4xi1>
      %74 = "xegpu.create_tdesc"(%arg67, %72) : (ui64, vector<4xindex>) -> !xegpu.tensor_desc<4x8xf16, #xegpu.scatter_tdesc_attr<chunk_size = 8 : i64>>
      %75 = "xegpu.load"(%74, %73) <{l1_hint = #xegpu.cache_hint<cached>, l2_hint = #xegpu.cache_hint<uncached>}> : (!xegpu.tensor_desc<4x8xf16, #xegpu.scatter_tdesc_attr<chunk_size = 8 : i64>>, vector<4xi1>) -> vector<8xf16>
      "gpu.return"() : () -> ()
    }) {sym_name = "simt_load_3", workgroup_attributions = 0 : i64} : () -> ()
    "gpu.func"() <{function_type = (memref<256xf16>, vector<1xindex>, vector<1xi1>) -> ()}> ({
    ^bb0(%arg64: memref<256xf16>, %arg65: vector<1xindex>, %arg66: vector<1xi1>):
      %71 = "xegpu.load"(%arg64, %arg65, %arg66) <{chunk_size = 8 : i64}> : (memref<256xf16>, vector<1xindex>, vector<1xi1>) -> vector<8xf16>
      "gpu.return"() : () -> ()
    }) {sym_name = "simt_load_4", workgroup_attributions = 0 : i64} : () -> ()
    "gpu.func"() <{function_type = (memref<256xf16>, vector<1xindex>, vector<1xi1>) -> ()}> ({
    ^bb0(%arg61: memref<256xf16>, %arg62: vector<1xindex>, %arg63: vector<1xi1>):
      %70 = "xegpu.load"(%arg61, %arg62, %arg63) : (memref<256xf16>, vector<1xindex>, vector<1xi1>) -> vector<1xf16>
      "gpu.return"() : () -> ()
    }) {sym_name = "simt_load_5", workgroup_attributions = 0 : i64} : () -> ()
    "gpu.func"() <{function_type = (memref<256xf16>, index, i1) -> ()}> ({
    ^bb0(%arg58: memref<256xf16>, %arg59: index, %arg60: i1):
      %69 = "xegpu.load"(%arg58, %arg59, %arg60) <{chunk_size = 8 : i64}> : (memref<256xf16>, index, i1) -> vector<8xf16>
      "gpu.return"() : () -> ()
    }) {sym_name = "simt_load_6", workgroup_attributions = 0 : i64} : () -> ()
    "gpu.func"() <{function_type = (memref<256xf16>, index, i1) -> ()}> ({
    ^bb0(%arg55: memref<256xf16>, %arg56: index, %arg57: i1):
      %68 = "xegpu.load"(%arg55, %arg56, %arg57) : (memref<256xf16>, index, i1) -> f16
      "gpu.return"() : () -> ()
    }) {sym_name = "simt_load_7", workgroup_attributions = 0 : i64} : () -> ()
    "gpu.func"() <{function_type = (ui64) -> ()}> ({
    ^bb0(%arg54: ui64):
      %64 = "arith.constant"() <{value = dense<[[0, 8, 16, 24], [32, 40, 48, 56]]> : vector<2x4xindex>}> : () -> vector<2x4xindex>
      %65 = "arith.constant"() <{value = dense<true> : vector<2x4xi1>}> : () -> vector<2x4xi1>
      %66 = "xegpu.create_tdesc"(%arg54, %64) : (ui64, vector<2x4xindex>) -> !xegpu.tensor_desc<2x4x8xf16, #xegpu.scatter_tdesc_attr<chunk_size = 8 : i64>>
      %67 = "xegpu.load"(%66, %65) <{l1_hint = #xegpu.cache_hint<cached>, l2_hint = #xegpu.cache_hint<uncached>}> : (!xegpu.tensor_desc<2x4x8xf16, #xegpu.scatter_tdesc_attr<chunk_size = 8 : i64>>, vector<2x4xi1>) -> vector<2x4x8xf16>
      "gpu.return"() : () -> ()
    }) {sym_name = "subgroup_load_4", workgroup_attributions = 0 : i64} : () -> ()
    "gpu.func"() <{function_type = (memref<?xf16>) -> ()}> ({
    ^bb0(%arg53: memref<?xf16>):
      %61 = "arith.constant"() <{value = dense<[0, 8, 16, 24]> : vector<4xindex>}> : () -> vector<4xindex>
      %62 = "arith.constant"() <{value = dense<true> : vector<4xi1>}> : () -> vector<4xi1>
      %63 = "xegpu.load"(%arg53, %61, %62) <{chunk_size = 2 : i64, l1_hint = #xegpu.cache_hint<cached>}> : (memref<?xf16>, vector<4xindex>, vector<4xi1>) -> vector<4x2xf16>
      "gpu.return"() : () -> ()
    }) {sym_name = "subgroup_load_offset_1", workgroup_attributions = 0 : i64} : () -> ()
    "gpu.func"() <{function_type = (ui64) -> ()}> ({
    ^bb0(%arg52: ui64):
      %57 = "arith.constant"() <{value = dense<[0, 8, 16, 24]> : vector<4xindex>}> : () -> vector<4xindex>
      %58 = "arith.constant"() <{value = dense<true> : vector<4xi1>}> : () -> vector<4xi1>
      %59 = "arith.constant"() <{value = dense<2.900000e+00> : vector<4x2xf32>}> : () -> vector<4x2xf32>
      %60 = "xegpu.create_tdesc"(%arg52, %57) : (ui64, vector<4xindex>) -> !xegpu.tensor_desc<4x2xf32, #xegpu.scatter_tdesc_attr<chunk_size = 2 : i64>>
      "xegpu.store"(%59, %60, %58) <{l1_hint = #xegpu.cache_hint<write_back>, l2_hint = #xegpu.cache_hint<uncached>}> : (vector<4x2xf32>, !xegpu.tensor_desc<4x2xf32, #xegpu.scatter_tdesc_attr<chunk_size = 2 : i64>>, vector<4xi1>) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "subgroup_store", workgroup_attributions = 0 : i64} : () -> ()
    "gpu.func"() <{function_type = (ui64) -> ()}> ({
    ^bb0(%arg51: ui64):
      %53 = "arith.constant"() <{value = dense<[0, 8, 16, 24]> : vector<4xindex>}> : () -> vector<4xindex>
      %54 = "arith.constant"() <{value = dense<true> : vector<4xi1>}> : () -> vector<4xi1>
      %55 = "arith.constant"() <{value = dense<2.900000e+00> : vector<2xf32>}> : () -> vector<2xf32>
      %56 = "xegpu.create_tdesc"(%arg51, %53) : (ui64, vector<4xindex>) -> !xegpu.tensor_desc<4x2xf32, #xegpu.scatter_tdesc_attr<chunk_size = 2 : i64>>
      "xegpu.store"(%55, %56, %54) <{l1_hint = #xegpu.cache_hint<write_back>, l2_hint = #xegpu.cache_hint<uncached>}> : (vector<2xf32>, !xegpu.tensor_desc<4x2xf32, #xegpu.scatter_tdesc_attr<chunk_size = 2 : i64>>, vector<4xi1>) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "simt_store", workgroup_attributions = 0 : i64} : () -> ()
    "gpu.func"() <{function_type = (ui64) -> ()}> ({
    ^bb0(%arg50: ui64):
      %49 = "arith.constant"() <{value = dense<[0, 8, 16, 24]> : vector<4xindex>}> : () -> vector<4xindex>
      %50 = "arith.constant"() <{value = dense<true> : vector<4xi1>}> : () -> vector<4xi1>
      %51 = "arith.constant"() <{value = dense<2.900390e+00> : vector<4x2xf16>}> : () -> vector<4x2xf16>
      %52 = "xegpu.create_tdesc"(%arg50, %49) : (ui64, vector<4xindex>) -> !xegpu.tensor_desc<4x2xf16, #xegpu.scatter_tdesc_attr<chunk_size = 2 : i64>>
      "xegpu.store"(%51, %52, %50) <{l1_hint = #xegpu.cache_hint<write_back>, l2_hint = #xegpu.cache_hint<uncached>}> : (vector<4x2xf16>, !xegpu.tensor_desc<4x2xf16, #xegpu.scatter_tdesc_attr<chunk_size = 2 : i64>>, vector<4xi1>) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "subgroup_store_2", workgroup_attributions = 0 : i64} : () -> ()
    "gpu.func"() <{function_type = (ui64) -> ()}> ({
    ^bb0(%arg49: ui64):
      %45 = "arith.constant"() <{value = dense<[0, 8, 16, 24]> : vector<4xindex>}> : () -> vector<4xindex>
      %46 = "arith.constant"() <{value = dense<true> : vector<4xi1>}> : () -> vector<4xi1>
      %47 = "arith.constant"() <{value = dense<2.900390e+00> : vector<2xf16>}> : () -> vector<2xf16>
      %48 = "xegpu.create_tdesc"(%arg49, %45) : (ui64, vector<4xindex>) -> !xegpu.tensor_desc<4x2xf16, #xegpu.scatter_tdesc_attr<chunk_size = 2 : i64>>
      "xegpu.store"(%47, %48, %46) <{l1_hint = #xegpu.cache_hint<write_back>, l2_hint = #xegpu.cache_hint<uncached>}> : (vector<2xf16>, !xegpu.tensor_desc<4x2xf16, #xegpu.scatter_tdesc_attr<chunk_size = 2 : i64>>, vector<4xi1>) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "simt_store_2", workgroup_attributions = 0 : i64} : () -> ()
    "gpu.func"() <{function_type = (ui64) -> ()}> ({
    ^bb0(%arg48: ui64):
      %41 = "arith.constant"() <{value = dense<[0, 8, 16, 24]> : vector<4xindex>}> : () -> vector<4xindex>
      %42 = "arith.constant"() <{value = dense<true> : vector<4xi1>}> : () -> vector<4xi1>
      %43 = "arith.constant"() <{value = dense<2.900000e+00> : vector<4xf32>}> : () -> vector<4xf32>
      %44 = "xegpu.create_tdesc"(%arg48, %41) : (ui64, vector<4xindex>) -> !xegpu.tensor_desc<4xf32, #xegpu.scatter_tdesc_attr<>>
      "xegpu.store"(%43, %44, %42) <{l1_hint = #xegpu.cache_hint<write_back>, l2_hint = #xegpu.cache_hint<uncached>}> : (vector<4xf32>, !xegpu.tensor_desc<4xf32, #xegpu.scatter_tdesc_attr<>>, vector<4xi1>) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "subgroup_store_3", workgroup_attributions = 0 : i64} : () -> ()
    "gpu.func"() <{function_type = (ui64) -> ()}> ({
    ^bb0(%arg47: ui64):
      %37 = "arith.constant"() <{value = dense<[0, 8, 16, 24]> : vector<4xindex>}> : () -> vector<4xindex>
      %38 = "arith.constant"() <{value = dense<true> : vector<4xi1>}> : () -> vector<4xi1>
      %39 = "arith.constant"() <{value = dense<2.900000e+00> : vector<1xf32>}> : () -> vector<1xf32>
      %40 = "xegpu.create_tdesc"(%arg47, %37) : (ui64, vector<4xindex>) -> !xegpu.tensor_desc<4xf32, #xegpu.scatter_tdesc_attr<>>
      "xegpu.store"(%39, %40, %38) <{l1_hint = #xegpu.cache_hint<write_back>, l2_hint = #xegpu.cache_hint<uncached>}> : (vector<1xf32>, !xegpu.tensor_desc<4xf32, #xegpu.scatter_tdesc_attr<>>, vector<4xi1>) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "simt_store_3", workgroup_attributions = 0 : i64} : () -> ()
    "gpu.func"() <{function_type = (vector<8xf16>, memref<256xf16>, vector<1xindex>, vector<1xi1>) -> ()}> ({
    ^bb0(%arg43: vector<8xf16>, %arg44: memref<256xf16>, %arg45: vector<1xindex>, %arg46: vector<1xi1>):
      "xegpu.store"(%arg43, %arg44, %arg45, %arg46) <{chunk_size = 8 : i64}> : (vector<8xf16>, memref<256xf16>, vector<1xindex>, vector<1xi1>) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "simt_store_4", workgroup_attributions = 0 : i64} : () -> ()
    "gpu.func"() <{function_type = (vector<8xf16>, memref<256xf16>, index, i1) -> ()}> ({
    ^bb0(%arg39: vector<8xf16>, %arg40: memref<256xf16>, %arg41: index, %arg42: i1):
      "xegpu.store"(%arg39, %arg40, %arg41, %arg42) <{chunk_size = 8 : i64}> : (vector<8xf16>, memref<256xf16>, index, i1) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "simt_store_5", workgroup_attributions = 0 : i64} : () -> ()
    "gpu.func"() <{function_type = (vector<1xf16>, memref<256xf16>, vector<1xindex>, vector<1xi1>) -> ()}> ({
    ^bb0(%arg35: vector<1xf16>, %arg36: memref<256xf16>, %arg37: vector<1xindex>, %arg38: vector<1xi1>):
      "xegpu.store"(%arg35, %arg36, %arg37, %arg38) : (vector<1xf16>, memref<256xf16>, vector<1xindex>, vector<1xi1>) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "simt_store_6", workgroup_attributions = 0 : i64} : () -> ()
    "gpu.func"() <{function_type = (f16, memref<256xf16>, index, i1) -> ()}> ({
    ^bb0(%arg31: f16, %arg32: memref<256xf16>, %arg33: index, %arg34: i1):
      "xegpu.store"(%arg31, %arg32, %arg33, %arg34) : (f16, memref<256xf16>, index, i1) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "simt_store_7", workgroup_attributions = 0 : i64} : () -> ()
    "gpu.func"() <{function_type = (ui64) -> ()}> ({
    ^bb0(%arg30: ui64):
      %33 = "arith.constant"() <{value = dense<[[0, 8, 16, 24], [32, 40, 48, 56]]> : vector<2x4xindex>}> : () -> vector<2x4xindex>
      %34 = "arith.constant"() <{value = dense<true> : vector<2x4xi1>}> : () -> vector<2x4xi1>
      %35 = "arith.constant"() <{value = dense<2.900000e+00> : vector<2x4xf32>}> : () -> vector<2x4xf32>
      %36 = "xegpu.create_tdesc"(%arg30, %33) : (ui64, vector<2x4xindex>) -> !xegpu.tensor_desc<2x4xf32, #xegpu.scatter_tdesc_attr<>>
      "xegpu.store"(%35, %36, %34) <{l1_hint = #xegpu.cache_hint<write_back>, l2_hint = #xegpu.cache_hint<uncached>}> : (vector<2x4xf32>, !xegpu.tensor_desc<2x4xf32, #xegpu.scatter_tdesc_attr<>>, vector<2x4xi1>) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "subgroup_store_4", workgroup_attributions = 0 : i64} : () -> ()
    "gpu.func"() <{function_type = (memref<?xf16>) -> ()}> ({
    ^bb0(%arg29: memref<?xf16>):
      %30 = "arith.constant"() <{value = dense<2.900390e+00> : vector<4x2xf16>}> : () -> vector<4x2xf16>
      %31 = "arith.constant"() <{value = dense<[0, 8, 16, 24]> : vector<4xindex>}> : () -> vector<4xindex>
      %32 = "arith.constant"() <{value = dense<true> : vector<4xi1>}> : () -> vector<4xi1>
      "xegpu.store"(%30, %arg29, %31, %32) <{chunk_size = 2 : i64, l1_hint = #xegpu.cache_hint<cached>}> : (vector<4x2xf16>, memref<?xf16>, vector<4xindex>, vector<4xi1>) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "subgroup_store_offset_1", workgroup_attributions = 0 : i64} : () -> ()
    "gpu.func"() <{function_type = (ui64) -> ()}> ({
    ^bb0(%arg28: ui64):
      %28 = "arith.constant"() <{value = dense<[0, 8, 16, 24]> : vector<4xindex>}> : () -> vector<4xindex>
      %29 = "xegpu.create_tdesc"(%arg28, %28) : (ui64, vector<4xindex>) -> !xegpu.tensor_desc<4x2xf32, #xegpu.scatter_tdesc_attr<chunk_size = 2 : i64>>
      "xegpu.prefetch"(%29) <{l1_hint = #xegpu.cache_hint<cached>, l2_hint = #xegpu.cache_hint<uncached>}> : (!xegpu.tensor_desc<4x2xf32, #xegpu.scatter_tdesc_attr<chunk_size = 2 : i64>>) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "prefetch", workgroup_attributions = 0 : i64} : () -> ()
    "gpu.func"() <{function_type = (ui64) -> ()}> ({
    ^bb0(%arg27: ui64):
      %27 = "arith.constant"() <{value = dense<[0, 8, 16, 24]> : vector<4xindex>}> : () -> vector<4xindex>
      "xegpu.prefetch"(%arg27, %27) <{l1_hint = #xegpu.cache_hint<cached>, l2_hint = #xegpu.cache_hint<uncached>, offset_align_byte = 2 : i64}> : (ui64, vector<4xindex>) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "prefetch_offset", workgroup_attributions = 0 : i64} : () -> ()
    "gpu.func"() <{function_type = (ui64) -> ()}> ({
    ^bb0(%arg26: ui64):
      %23 = "arith.constant"() <{value = dense<[0, 8, 16, 24]> : vector<4xindex>}> : () -> vector<4xindex>
      %24 = "xegpu.create_tdesc"(%arg26, %23) : (ui64, vector<4xindex>) -> !xegpu.tensor_desc<4x2xf32, #xegpu.scatter_tdesc_attr<chunk_size = 2 : i64>>
      %25 = "arith.constant"() <{value = dense<32> : vector<4xindex>}> : () -> vector<4xindex>
      %26 = "xegpu.update_offset"(%24, %25) : (!xegpu.tensor_desc<4x2xf32, #xegpu.scatter_tdesc_attr<chunk_size = 2 : i64>>, vector<4xindex>) -> !xegpu.tensor_desc<4x2xf32, #xegpu.scatter_tdesc_attr<chunk_size = 2 : i64>>
      "gpu.return"() : () -> ()
    }) {sym_name = "create_update_tdesc", workgroup_attributions = 0 : i64} : () -> ()
    "gpu.func"() <{function_type = (vector<8x16xf16>, vector<16x16xf16>) -> ()}> ({
    ^bb0(%arg24: vector<8x16xf16>, %arg25: vector<16x16xf16>):
      %22 = "xegpu.dpas"(%arg24, %arg25) : (vector<8x16xf16>, vector<16x16xf16>) -> vector<8x16xf32>
      "gpu.return"() : () -> ()
    }) {sym_name = "subgroup_dpas", workgroup_attributions = 0 : i64} : () -> ()
    "gpu.func"() <{function_type = (vector<8xf16>, vector<16xf16>) -> ()}> ({
    ^bb0(%arg22: vector<8xf16>, %arg23: vector<16xf16>):
      %21 = "xegpu.dpas"(%arg22, %arg23) : (vector<8xf16>, vector<16xf16>) -> vector<8xf32>
      "gpu.return"() : () -> ()
    }) {sym_name = "simt_dpas", workgroup_attributions = 0 : i64} : () -> ()
    "gpu.func"() <{function_type = (vector<8x16xf16>, vector<8x16x2xf16>) -> ()}> ({
    ^bb0(%arg20: vector<8x16xf16>, %arg21: vector<8x16x2xf16>):
      %20 = "xegpu.dpas"(%arg20, %arg21) : (vector<8x16xf16>, vector<8x16x2xf16>) -> vector<8x16xf32>
      "gpu.return"() : () -> ()
    }) {sym_name = "subgroup_dpas_packed_b", workgroup_attributions = 0 : i64} : () -> ()
    "gpu.func"() <{function_type = (ui64, vector<16xf32>, vector<16xi1>) -> ()}> ({
    ^bb0(%arg17: ui64, %arg18: vector<16xf32>, %arg19: vector<16xi1>):
      %17 = "arith.constant"() <{value = dense<[0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15]> : vector<16xindex>}> : () -> vector<16xindex>
      %18 = "xegpu.create_tdesc"(%arg17, %17) : (ui64, vector<16xindex>) -> !xegpu.tensor_desc<16xf32, #xegpu.scatter_tdesc_attr<>>
      %19 = "xegpu.atomic_rmw"(%18, %arg19, %arg18) <{kind = 0 : i64}> : (!xegpu.tensor_desc<16xf32, #xegpu.scatter_tdesc_attr<>>, vector<16xi1>, vector<16xf32>) -> vector<16xf32>
      "gpu.return"() : () -> ()
    }) {sym_name = "subgroup_atomic_rmw", workgroup_attributions = 0 : i64} : () -> ()
    "gpu.func"() <{function_type = () -> ()}> ({
      "xegpu.alloc_nbarrier"() <{nbarrier_num = 8 : i64}> : () -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "alloc_nbarrier", workgroup_attributions = 0 : i64} : () -> ()
    "gpu.func"() <{function_type = () -> ()}> ({
      %14 = "arith.constant"() <{value = 1 : i8}> : () -> i8
      %15 = "arith.constant"() <{value = 16 : i8}> : () -> i8
      %16 = "xegpu.init_nbarrier"(%14, %15) : (i8, i8) -> !xegpu.nbarrier
      "gpu.return"() : () -> ()
    }) {sym_name = "init_nbarrier", workgroup_attributions = 0 : i64} : () -> ()
    "gpu.func"() <{function_type = (!xegpu.nbarrier) -> ()}> ({
    ^bb0(%arg16: !xegpu.nbarrier):
      "xegpu.nbarrier_arrive"(%arg16) : (!xegpu.nbarrier) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "nbarrier_arrive", workgroup_attributions = 0 : i64} : () -> ()
    "gpu.func"() <{function_type = (!xegpu.nbarrier) -> ()}> ({
    ^bb0(%arg15: !xegpu.nbarrier):
      "xegpu.nbarrier_wait"(%arg15) : (!xegpu.nbarrier) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "nbarrier_wait", workgroup_attributions = 0 : i64} : () -> ()
    "gpu.func"() <{function_type = () -> ()}> ({
      "xegpu.fence"() <{fence_scope = #xegpu<fence_scope workgroup>, memory_kind = #xegpu<memory_space global>}> : () -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "fence", workgroup_attributions = 0 : i64} : () -> ()
    "gpu.func"() <{function_type = () -> ()}> ({
      %12 = "memref.alloca"() <{alignment = 1024 : i64, operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<2048xi8, 3>
      %13 = "xegpu.create_mem_desc"(%12) : (memref<2048xi8, 3>) -> !xegpu.mem_desc<16x64xf16>
      "gpu.return"() : () -> ()
    }) {sym_name = "create_mem_desc", workgroup_attributions = 0 : i64} : () -> ()
    "gpu.func"() <{function_type = () -> ()}> ({
      %10 = "memref.alloca"() <{alignment = 1024 : i64, operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<2048xi8, 3>
      %11 = "xegpu.create_mem_desc"(%10) : (memref<2048xi8, 3>) -> !xegpu.mem_desc<16x64xf16, #xegpu.mem_layout<stride = [1, 16]>>
      "gpu.return"() : () -> ()
    }) {sym_name = "create_mem_desc_with_stride", workgroup_attributions = 0 : i64} : () -> ()
    "gpu.func"() <{function_type = () -> ()}> ({
      %8 = "memref.alloca"() <{alignment = 1024 : i64, operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<16x64xf16, 3>
      %9 = "xegpu.create_mem_desc"(%8) : (memref<16x64xf16, 3>) -> !xegpu.mem_desc<16x64xf16>
      "gpu.return"() : () -> ()
    }) {sym_name = "create_mem_desc_from_2d_memref", workgroup_attributions = 0 : i64} : () -> ()
    "gpu.func"() <{function_type = () -> ()}> ({
      %5 = "memref.alloca"() <{alignment = 1024 : i64, operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<32x64xf16, 3>
      %6 = "memref.subview"(%5) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_offsets = array<i64: 16, 0>, static_sizes = array<i64: 16, 64>, static_strides = array<i64: 1, 1>}> : (memref<32x64xf16, 3>) -> memref<16x64xf16, strided<[64, 1], offset: 1024>, 3>
      %7 = "xegpu.create_mem_desc"(%6) : (memref<16x64xf16, strided<[64, 1], offset: 1024>, 3>) -> !xegpu.mem_desc<16x64xf16, #xegpu.mem_layout<stride = [1, 16]>>
      "gpu.return"() : () -> ()
    }) {sym_name = "create_mem_desc_with_stride_from_2d_memref", workgroup_attributions = 0 : i64} : () -> ()
    "gpu.func"() <{function_type = (!xegpu.mem_desc<16x64xf16>) -> ()}> ({
    ^bb0(%arg14: !xegpu.mem_desc<16x64xf16>):
      %4 = "xegpu.load_matrix"(%arg14) <{const_offsets = array<i64: 8, 8>}> : (!xegpu.mem_desc<16x64xf16>) -> vector<8x16xf16>
      "gpu.return"() : () -> ()
    }) {sym_name = "load_matrix", workgroup_attributions = 0 : i64} : () -> ()
    "gpu.func"() <{function_type = (!xegpu.mem_desc<16x64xf16, #xegpu.mem_layout<stride = [1, 16]>>) -> ()}> ({
    ^bb0(%arg13: !xegpu.mem_desc<16x64xf16, #xegpu.mem_layout<stride = [1, 16]>>):
      %3 = "xegpu.load_matrix"(%arg13) <{const_offsets = array<i64: 8, 8>}> : (!xegpu.mem_desc<16x64xf16, #xegpu.mem_layout<stride = [1, 16]>>) -> vector<8x16xf16>
      "gpu.return"() : () -> ()
    }) {sym_name = "load_matrix_with_stride", workgroup_attributions = 0 : i64} : () -> ()
    "gpu.func"() <{function_type = (!xegpu.mem_desc<16x64xf16>) -> ()}> ({
    ^bb0(%arg12: !xegpu.mem_desc<16x64xf16>):
      %2 = "xegpu.load_matrix"(%arg12) <{const_offsets = array<i64: 8, 16>}> : (!xegpu.mem_desc<16x64xf16>) -> vector<1xf16>
      "gpu.return"() : () -> ()
    }) {sym_name = "simt_load_matrix", workgroup_attributions = 0 : i64} : () -> ()
    "gpu.func"() <{function_type = (!xegpu.mem_desc<16x64xf16, #xegpu.mem_layout<block = [16, 16]>>) -> ()}> ({
    ^bb0(%arg11: !xegpu.mem_desc<16x64xf16, #xegpu.mem_layout<block = [16, 16]>>):
      %1 = "xegpu.load_matrix"(%arg11) <{const_offsets = array<i64: 8, 16>, subgroup_block_io}> : (!xegpu.mem_desc<16x64xf16, #xegpu.mem_layout<block = [16, 16]>>) -> vector<8xf16>
      "gpu.return"() : () -> ()
    }) {sym_name = "simt_load_matrix_subgroup_block_io", workgroup_attributions = 0 : i64} : () -> ()
    "gpu.func"() <{function_type = (!xegpu.mem_desc<16x64xf16, #xegpu.mem_layout<stride = [1, 16]>>) -> ()}> ({
    ^bb0(%arg10: !xegpu.mem_desc<16x64xf16, #xegpu.mem_layout<stride = [1, 16]>>):
      %0 = "xegpu.load_matrix"(%arg10) <{const_offsets = array<i64: 8, 8>}> : (!xegpu.mem_desc<16x64xf16, #xegpu.mem_layout<stride = [1, 16]>>) -> vector<8xf16>
      "gpu.return"() : () -> ()
    }) {sym_name = "simt_load_matrix_vector", workgroup_attributions = 0 : i64} : () -> ()
    "gpu.func"() <{function_type = (!xegpu.mem_desc<16x64xf16>, vector<16x16xf16>) -> ()}> ({
    ^bb0(%arg8: !xegpu.mem_desc<16x64xf16>, %arg9: vector<16x16xf16>):
      "xegpu.store_matrix"(%arg9, %arg8) <{const_offsets = array<i64: 8, 8>}> : (vector<16x16xf16>, !xegpu.mem_desc<16x64xf16>) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "store_matrix", workgroup_attributions = 0 : i64} : () -> ()
    "gpu.func"() <{function_type = (!xegpu.mem_desc<16x64xf16, #xegpu.mem_layout<stride = [1, 16]>>, vector<16x16xf16>) -> ()}> ({
    ^bb0(%arg6: !xegpu.mem_desc<16x64xf16, #xegpu.mem_layout<stride = [1, 16]>>, %arg7: vector<16x16xf16>):
      "xegpu.store_matrix"(%arg7, %arg6) <{const_offsets = array<i64: 0, 8>}> : (vector<16x16xf16>, !xegpu.mem_desc<16x64xf16, #xegpu.mem_layout<stride = [1, 16]>>) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "store_matrix_with_stride", workgroup_attributions = 0 : i64} : () -> ()
    "gpu.func"() <{function_type = (!xegpu.mem_desc<16x64xf16>, vector<1xf16>) -> ()}> ({
    ^bb0(%arg4: !xegpu.mem_desc<16x64xf16>, %arg5: vector<1xf16>):
      "xegpu.store_matrix"(%arg5, %arg4) <{const_offsets = array<i64: 8, 16>}> : (vector<1xf16>, !xegpu.mem_desc<16x64xf16>) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "simt_store_matrix", workgroup_attributions = 0 : i64} : () -> ()
    "gpu.func"() <{function_type = (!xegpu.mem_desc<16x64xf16, #xegpu.mem_layout<block = [16, 16]>>, vector<8xf16>) -> ()}> ({
    ^bb0(%arg2: !xegpu.mem_desc<16x64xf16, #xegpu.mem_layout<block = [16, 16]>>, %arg3: vector<8xf16>):
      "xegpu.store_matrix"(%arg3, %arg2) <{const_offsets = array<i64: 8, 16>, subgroup_block_io}> : (vector<8xf16>, !xegpu.mem_desc<16x64xf16, #xegpu.mem_layout<block = [16, 16]>>) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "simt_store_matrix_subgroup_block_io", workgroup_attributions = 0 : i64} : () -> ()
    "gpu.func"() <{function_type = (!xegpu.mem_desc<16x64xf16, #xegpu.mem_layout<stride = [1, 16]>>, vector<8xf16>) -> ()}> ({
    ^bb0(%arg0: !xegpu.mem_desc<16x64xf16, #xegpu.mem_layout<stride = [1, 16]>>, %arg1: vector<8xf16>):
      "xegpu.store_matrix"(%arg1, %arg0) <{const_offsets = array<i64: 8, 8>}> : (vector<8xf16>, !xegpu.mem_desc<16x64xf16, #xegpu.mem_layout<stride = [1, 16]>>) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "simt_store_matrix_vector", workgroup_attributions = 0 : i64} : () -> ()
  }) : () -> ()
}) : () -> ()

