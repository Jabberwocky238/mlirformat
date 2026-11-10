"builtin.module"() ({
  "gpu.module"() <{sym_name = "test"}> ({
    "gpu.func"() <{function_type = (memref<24x32xf32>) -> ()}> ({
    ^bb0(%arg150: memref<24x32xf32>):
      %109 = "xegpu.create_nd_tdesc"(%arg150) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<24x32xf32>) -> !xegpu.tensor_desc<8x16xf32>
      "gpu.return"() : () -> ()
    }) {sym_name = "create_nd_tdesc_1"} : () -> ()
    "gpu.func"() <{function_type = (ui64, index, index, index, index) -> ()}> ({
    ^bb0(%arg145: ui64, %arg146: index, %arg147: index, %arg148: index, %arg149: index):
      %107 = "arith.constant"() <{value = 1 : index}> : () -> index
      %108 = "xegpu.create_nd_tdesc"(%arg145, %arg147, %arg146, %arg146, %107) <{const_shape = array<i64: -9223372036854775808, -9223372036854775808>, const_strides = array<i64: -9223372036854775808, -9223372036854775808>, operandSegmentSizes = array<i32: 1, 2, 2>}> : (ui64, index, index, index, index) -> !xegpu.tensor_desc<8x16xf32>
      "gpu.return"() : () -> ()
    }) {sym_name = "create_nd_tdesc_2"} : () -> ()
    "gpu.func"() <{function_type = (memref<24x32xf32>) -> ()}> ({
    ^bb0(%arg144: memref<24x32xf32>):
      %106 = "xegpu.create_nd_tdesc"(%arg144) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<24x32xf32>) -> !xegpu.tensor_desc<24x16xf32, #xegpu.block_tdesc_attr<array_length = 2 : i64>>
      "gpu.return"() : () -> ()
    }) {sym_name = "create_nd_tdesc_3"} : () -> ()
    "gpu.func"() <{function_type = (memref<2x24x32xf32>) -> ()}> ({
    ^bb0(%arg143: memref<2x24x32xf32>):
      %105 = "xegpu.create_nd_tdesc"(%arg143) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<2x24x32xf32>) -> !xegpu.tensor_desc<8x16xf32>
      "gpu.return"() : () -> ()
    }) {sym_name = "create_nd_tdesc_4"} : () -> ()
    "gpu.func"() <{function_type = (memref<2x24x32xf32, 3>) -> ()}> ({
    ^bb0(%arg142: memref<2x24x32xf32, 3>):
      %104 = "xegpu.create_nd_tdesc"(%arg142) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<2x24x32xf32, 3>) -> !xegpu.tensor_desc<16xf32, #xegpu.block_tdesc_attr<memory_space = slm>>
      "gpu.return"() : () -> ()
    }) {sym_name = "create_nd_tdesc_5"} : () -> ()
    "gpu.func"() <{function_type = (memref<24x32xf32>) -> ()}> ({
    ^bb0(%arg141: memref<24x32xf32>):
      %103 = "xegpu.create_nd_tdesc"(%arg141) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<24x32xf32>) -> !xegpu.tensor_desc<24x16xf32, #xegpu.block_tdesc_attr<array_length = 2 : i64>>
      "gpu.return"() : () -> ()
    }) {sym_name = "create_nd_tdesc_6"} : () -> ()
    "gpu.func"() <{function_type = (memref<8x24x32x48x64xf32>) -> ()}> ({
    ^bb0(%arg140: memref<8x24x32x48x64xf32>):
      %102 = "xegpu.create_nd_tdesc"(%arg140) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<8x24x32x48x64xf32>) -> !xegpu.tensor_desc<8x8x8x24x32xf32>
      "gpu.return"() : () -> ()
    }) {sym_name = "create_nd_tdesc_7"} : () -> ()
    "gpu.func"() <{function_type = (ui64, index, index, index, index, memref<24x32xf32>) -> ()}> ({
    ^bb0(%arg134: ui64, %arg135: index, %arg136: index, %arg137: index, %arg138: index, %arg139: memref<24x32xf32>):
      %100 = "arith.constant"() <{value = 1 : index}> : () -> index
      %101 = "xegpu.create_nd_tdesc"(%arg139) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<24x32xf32>) -> !xegpu.tensor_desc<8x16xf32>
      "gpu.return"() : () -> ()
    }) {sym_name = "test_create_nd_tdesc_7"} : () -> ()
    "gpu.func"() <{function_type = (ui64, index, index, index, index) -> ()}> ({
    ^bb0(%arg129: ui64, %arg130: index, %arg131: index, %arg132: index, %arg133: index):
      %98 = "arith.constant"() <{value = 1 : index}> : () -> index
      %99 = "xegpu.create_nd_tdesc"(%arg129, %arg131, %arg130, %arg130, %98) <{const_shape = array<i64: -9223372036854775808, -9223372036854775808>, const_strides = array<i64: -9223372036854775808, -9223372036854775808>, operandSegmentSizes = array<i32: 1, 2, 2>}> : (ui64, index, index, index, index) -> !xegpu.tensor_desc<8x16xf32>
      "gpu.return"() : () -> ()
    }) {sym_name = "test_create_nd_tdesc_8"} : () -> ()
    "gpu.func"() <{function_type = (memref<?x?xf16>, index, index, index, index) -> ()}> ({
    ^bb0(%arg124: memref<?x?xf16>, %arg125: index, %arg126: index, %arg127: index, %arg128: index):
      %96 = "arith.constant"() <{value = 1 : index}> : () -> index
      %97 = "xegpu.create_nd_tdesc"(%arg124, %arg126, %arg125, %arg125, %96) <{const_shape = array<i64: -9223372036854775808, -9223372036854775808>, const_strides = array<i64: -9223372036854775808, -9223372036854775808>, operandSegmentSizes = array<i32: 1, 2, 2>}> : (memref<?x?xf16>, index, index, index, index) -> !xegpu.tensor_desc<8x16xf16>
      "gpu.return"() : () -> ()
    }) {sym_name = "test_create_nd_tdesc_9"} : () -> ()
    "gpu.func"() <{function_type = (memref<?x?xf16>, index, index, index, index) -> ()}> ({
    ^bb0(%arg119: memref<?x?xf16>, %arg120: index, %arg121: index, %arg122: index, %arg123: index):
      %94 = "arith.constant"() <{value = 1 : index}> : () -> index
      %95 = "xegpu.create_nd_tdesc"(%arg119, %arg121, %arg120, %arg120, %94) <{const_shape = array<i64: -9223372036854775808, -9223372036854775808>, const_strides = array<i64: -9223372036854775808, -9223372036854775808>, operandSegmentSizes = array<i32: 1, 2, 2>}> : (memref<?x?xf16>, index, index, index, index) -> !xegpu.tensor_desc<8x16xf16>
      "gpu.return"() : () -> ()
    }) {sym_name = "test_create_nd_tdesc_10"} : () -> ()
    "gpu.func"() <{function_type = (memref<24x32xf16>) -> ()}> ({
    ^bb0(%arg118: memref<24x32xf16>):
      %93 = "xegpu.create_nd_tdesc"(%arg118) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<24x32xf16>) -> !xegpu.tensor_desc<8x16xf16>
      "xegpu.prefetch_nd"(%93) <{const_offsets = array<i64: 0, 0>, l1_hint = #xegpu.cache_hint<cached>, l2_hint = #xegpu.cache_hint<uncached>}> : (!xegpu.tensor_desc<8x16xf16>) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "prefetch_nd"} : () -> ()
    "gpu.func"() <{function_type = (memref<48x64xf16>) -> ()}> ({
    ^bb0(%arg117: memref<48x64xf16>):
      %92 = "xegpu.create_nd_tdesc"(%arg117) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<48x64xf16>) -> !xegpu.tensor_desc<8x16xf16>
      "xegpu.prefetch_nd"(%92) <{const_offsets = array<i64: 0, 0>, l1_hint = #xegpu.cache_hint<cached>, l2_hint = #xegpu.cache_hint<uncached>}> : (!xegpu.tensor_desc<8x16xf16>) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "prefetch_nd_2"} : () -> ()
    "gpu.func"() <{function_type = (memref<48x64xf16>, index, index) -> ()}> ({
    ^bb0(%arg114: memref<48x64xf16>, %arg115: index, %arg116: index):
      %91 = "xegpu.create_nd_tdesc"(%arg114) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<48x64xf16>) -> !xegpu.tensor_desc<8x16xf16>
      "xegpu.prefetch_nd"(%91, %arg115, %arg116) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>, l1_hint = #xegpu.cache_hint<cached>, l2_hint = #xegpu.cache_hint<uncached>}> : (!xegpu.tensor_desc<8x16xf16>, index, index) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "prefetch_nd_offset_1"} : () -> ()
    "gpu.func"() <{function_type = (memref<8x16xf16>) -> ()}> ({
    ^bb0(%arg113: memref<8x16xf16>):
      %89 = "xegpu.create_nd_tdesc"(%arg113) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<8x16xf16>) -> !xegpu.tensor_desc<8x16xf16>
      %90 = "xegpu.load_nd"(%89) <{const_offsets = array<i64: 0, 0>, l1_hint = #xegpu.cache_hint<cached>, l2_hint = #xegpu.cache_hint<uncached>, packed}> : (!xegpu.tensor_desc<8x16xf16>) -> vector<4x16x2xf16>
      "gpu.return"() : () -> ()
    }) {sym_name = "subgroup_load_nd"} : () -> ()
    "gpu.func"() <{function_type = (memref<8x16xf16>) -> ()}> ({
    ^bb0(%arg112: memref<8x16xf16>):
      %87 = "xegpu.create_nd_tdesc"(%arg112) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<8x16xf16>) -> !xegpu.tensor_desc<8x16xf16>
      %88 = "xegpu.load_nd"(%87) <{const_offsets = array<i64: 0, 0>, l1_hint = #xegpu.cache_hint<cached>, l2_hint = #xegpu.cache_hint<uncached>}> : (!xegpu.tensor_desc<8x16xf16>) -> vector<8xf16>
      "gpu.return"() : () -> ()
    }) {sym_name = "simt_load_nd"} : () -> ()
    "gpu.func"() <{function_type = (memref<8x16xf16>) -> ()}> ({
    ^bb0(%arg111: memref<8x16xf16>):
      %85 = "xegpu.create_nd_tdesc"(%arg111) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<8x16xf16>) -> !xegpu.tensor_desc<16xf16>
      %86 = "xegpu.load_nd"(%85) <{const_offsets = array<i64: 0>, l1_hint = #xegpu.cache_hint<cached>, l2_hint = #xegpu.cache_hint<uncached>}> : (!xegpu.tensor_desc<16xf16>) -> vector<16xf16>
      "gpu.return"() : () -> ()
    }) {sym_name = "subgroup_load_nd_2"} : () -> ()
    "gpu.func"() <{function_type = (memref<8x16xf16>) -> ()}> ({
    ^bb0(%arg110: memref<8x16xf16>):
      %83 = "xegpu.create_nd_tdesc"(%arg110) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<8x16xf16>) -> !xegpu.tensor_desc<16xf16>
      %84 = "xegpu.load_nd"(%83) <{const_offsets = array<i64: 0>, l1_hint = #xegpu.cache_hint<cached>, l2_hint = #xegpu.cache_hint<uncached>}> : (!xegpu.tensor_desc<16xf16>) -> vector<1xf16>
      "gpu.return"() : () -> ()
    }) {sym_name = "simt_load_nd_2"} : () -> ()
    "gpu.func"() <{function_type = (memref<24x32xf32>) -> ()}> ({
    ^bb0(%arg109: memref<24x32xf32>):
      %81 = "xegpu.create_nd_tdesc"(%arg109) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<24x32xf32>) -> !xegpu.tensor_desc<8x16xf32>
      %82 = "xegpu.load_nd"(%81) <{const_offsets = array<i64: 0, 0>, l1_hint = #xegpu.cache_hint<cached>, l2_hint = #xegpu.cache_hint<uncached>}> : (!xegpu.tensor_desc<8x16xf32>) -> vector<8x16xf32>
      "gpu.return"() : () -> ()
    }) {sym_name = "subgroup_load_nd_3"} : () -> ()
    "gpu.func"() <{function_type = (memref<24x32xf32>) -> ()}> ({
    ^bb0(%arg108: memref<24x32xf32>):
      %79 = "xegpu.create_nd_tdesc"(%arg108) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<24x32xf32>) -> !xegpu.tensor_desc<8x16xf32>
      %80 = "xegpu.load_nd"(%79) <{const_offsets = array<i64: 0, 0>, l1_hint = #xegpu.cache_hint<cached>, l2_hint = #xegpu.cache_hint<uncached>}> : (!xegpu.tensor_desc<8x16xf32>) -> vector<8xf32>
      "gpu.return"() : () -> ()
    }) {sym_name = "simt_load_nd_3"} : () -> ()
    "gpu.func"() <{function_type = (memref<24x32xf16>) -> ()}> ({
    ^bb0(%arg107: memref<24x32xf16>):
      %77 = "xegpu.create_nd_tdesc"(%arg107) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<24x32xf16>) -> !xegpu.tensor_desc<16x16xf16>
      %78 = "xegpu.load_nd"(%77) <{const_offsets = array<i64: 0, 0>, l1_hint = #xegpu.cache_hint<cached>, l2_hint = #xegpu.cache_hint<uncached>, packed}> : (!xegpu.tensor_desc<16x16xf16>) -> vector<8x16x2xf16>
      "gpu.return"() : () -> ()
    }) {sym_name = "subgroup_load_nd_4"} : () -> ()
    "gpu.func"() <{function_type = (memref<24x32xf16>) -> ()}> ({
    ^bb0(%arg106: memref<24x32xf16>):
      %75 = "xegpu.create_nd_tdesc"(%arg106) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<24x32xf16>) -> !xegpu.tensor_desc<16x16xf16>
      %76 = "xegpu.load_nd"(%75) <{const_offsets = array<i64: 0, 0>, l1_hint = #xegpu.cache_hint<cached>, l2_hint = #xegpu.cache_hint<uncached>}> : (!xegpu.tensor_desc<16x16xf16>) -> vector<16xf16>
      "gpu.return"() : () -> ()
    }) {sym_name = "simt_load_nd_4"} : () -> ()
    "gpu.func"() <{function_type = (memref<24x32xf32>) -> ()}> ({
    ^bb0(%arg105: memref<24x32xf32>):
      %73 = "xegpu.create_nd_tdesc"(%arg105) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<24x32xf32>) -> !xegpu.tensor_desc<32xf32>
      %74 = "xegpu.load_nd"(%73) <{const_offsets = array<i64: 0>, l1_hint = #xegpu.cache_hint<cached>, l2_hint = #xegpu.cache_hint<uncached>}> : (!xegpu.tensor_desc<32xf32>) -> vector<32xf32>
      "gpu.return"() : () -> ()
    }) {sym_name = "subgroup_load_nd_5"} : () -> ()
    "gpu.func"() <{function_type = (memref<24x32xf32>) -> ()}> ({
    ^bb0(%arg104: memref<24x32xf32>):
      %71 = "xegpu.create_nd_tdesc"(%arg104) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<24x32xf32>) -> !xegpu.tensor_desc<32xf32>
      %72 = "xegpu.load_nd"(%71) <{const_offsets = array<i64: 0>, l1_hint = #xegpu.cache_hint<cached>, l2_hint = #xegpu.cache_hint<uncached>}> : (!xegpu.tensor_desc<32xf32>) -> vector<2xf32>
      "gpu.return"() : () -> ()
    }) {sym_name = "simt_load_nd_5"} : () -> ()
    "gpu.func"() <{function_type = (memref<24x32xf16>) -> ()}> ({
    ^bb0(%arg103: memref<24x32xf16>):
      %69 = "xegpu.create_nd_tdesc"(%arg103) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<24x32xf16>) -> !xegpu.tensor_desc<16x16xf16, #xegpu.block_tdesc_attr<array_length = 2 : i64>>
      %70 = "xegpu.load_nd"(%69) <{const_offsets = array<i64: 0, 0>, l1_hint = #xegpu.cache_hint<cached>, l2_hint = #xegpu.cache_hint<uncached>}> : (!xegpu.tensor_desc<16x16xf16, #xegpu.block_tdesc_attr<array_length = 2 : i64>>) -> vector<32x16xf16>
      "gpu.return"() : () -> ()
    }) {sym_name = "subgroup_load_nd_6"} : () -> ()
    "gpu.func"() <{function_type = (memref<24x32xf16>) -> ()}> ({
    ^bb0(%arg102: memref<24x32xf16>):
      %67 = "xegpu.create_nd_tdesc"(%arg102) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<24x32xf16>) -> !xegpu.tensor_desc<16x16xf16, #xegpu.block_tdesc_attr<array_length = 2 : i64>>
      %68 = "xegpu.load_nd"(%67) <{const_offsets = array<i64: 0, 0>, l1_hint = #xegpu.cache_hint<cached>, l2_hint = #xegpu.cache_hint<uncached>}> : (!xegpu.tensor_desc<16x16xf16, #xegpu.block_tdesc_attr<array_length = 2 : i64>>) -> vector<32xf16>
      "gpu.return"() : () -> ()
    }) {sym_name = "simt_load_nd_6"} : () -> ()
    "gpu.func"() <{function_type = (memref<24x32xf16>) -> ()}> ({
    ^bb0(%arg101: memref<24x32xf16>):
      %65 = "xegpu.create_nd_tdesc"(%arg101) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<24x32xf16>) -> !xegpu.tensor_desc<16x16xf16, #xegpu.block_tdesc_attr<array_length = 2 : i64>>
      %66 = "xegpu.load_nd"(%65) <{const_offsets = array<i64: 0, 0>, l1_hint = #xegpu.cache_hint<cached>, l2_hint = #xegpu.cache_hint<uncached>, packed}> : (!xegpu.tensor_desc<16x16xf16, #xegpu.block_tdesc_attr<array_length = 2 : i64>>) -> vector<16x16x2xf16>
      "gpu.return"() : () -> ()
    }) {sym_name = "subgroup_load_nd_7"} : () -> ()
    "gpu.func"() <{function_type = (memref<24x32xf16>) -> ()}> ({
    ^bb0(%arg100: memref<24x32xf16>):
      %63 = "xegpu.create_nd_tdesc"(%arg100) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<24x32xf16>) -> !xegpu.tensor_desc<16x16xf16, #xegpu.block_tdesc_attr<array_length = 2 : i64>>
      %64 = "xegpu.load_nd"(%63) <{const_offsets = array<i64: 0, 0>, l1_hint = #xegpu.cache_hint<cached>, l2_hint = #xegpu.cache_hint<uncached>}> : (!xegpu.tensor_desc<16x16xf16, #xegpu.block_tdesc_attr<array_length = 2 : i64>>) -> vector<32xf16>
      "gpu.return"() : () -> ()
    }) {sym_name = "simt_load_nd_7"} : () -> ()
    "gpu.func"() <{function_type = (memref<24x32xf32>) -> ()}> ({
    ^bb0(%arg99: memref<24x32xf32>):
      %61 = "xegpu.create_nd_tdesc"(%arg99) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<24x32xf32>) -> !xegpu.tensor_desc<16x8xf32>
      %62 = "xegpu.load_nd"(%61) <{const_offsets = array<i64: 0, 0>, l1_hint = #xegpu.cache_hint<cached>, l2_hint = #xegpu.cache_hint<uncached>, transpose = array<i64: 1, 0>}> : (!xegpu.tensor_desc<16x8xf32>) -> vector<8x16xf32>
      "gpu.return"() : () -> ()
    }) {sym_name = "subgroup_load_nd_8"} : () -> ()
    "gpu.func"() <{function_type = (memref<24x32xf32>, index, index) -> ()}> ({
    ^bb0(%arg96: memref<24x32xf32>, %arg97: index, %arg98: index):
      %59 = "xegpu.create_nd_tdesc"(%arg96) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<24x32xf32>) -> !xegpu.tensor_desc<16x8xf32>
      %60 = "xegpu.load_nd"(%59, %arg97, %arg98) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>, l1_hint = #xegpu.cache_hint<cached>, l2_hint = #xegpu.cache_hint<uncached>, transpose = array<i64: 1, 0>}> : (!xegpu.tensor_desc<16x8xf32>, index, index) -> vector<8x16xf32>
      "gpu.return"() : () -> ()
    }) {sym_name = "subgroup_load_nd_offset_1"} : () -> ()
    "gpu.func"() <{function_type = (memref<24x32xf32>, index) -> ()}> ({
    ^bb0(%arg94: memref<24x32xf32>, %arg95: index):
      %57 = "xegpu.create_nd_tdesc"(%arg94) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<24x32xf32>) -> !xegpu.tensor_desc<16x8xf32>
      %58 = "xegpu.load_nd"(%57, %arg95) <{const_offsets = array<i64: -9223372036854775808, 0>, l1_hint = #xegpu.cache_hint<cached>, l2_hint = #xegpu.cache_hint<uncached>, transpose = array<i64: 1, 0>}> : (!xegpu.tensor_desc<16x8xf32>, index) -> vector<8x16xf32>
      "gpu.return"() : () -> ()
    }) {sym_name = "subgroup_load_nd_offset_2"} : () -> ()
    "gpu.func"() <{function_type = (memref<24x32xf32>) -> ()}> ({
    ^bb0(%arg93: memref<24x32xf32>):
      %55 = "xegpu.create_nd_tdesc"(%arg93) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<24x32xf32>) -> !xegpu.tensor_desc<16x8xf32>
      %56 = "xegpu.load_nd"(%55) <{const_offsets = array<i64: 0, 0>, l1_hint = #xegpu.cache_hint<cached>, l2_hint = #xegpu.cache_hint<uncached>, transpose = array<i64: 1, 0>}> : (!xegpu.tensor_desc<16x8xf32>) -> vector<8xf32>
      "gpu.return"() : () -> ()
    }) {sym_name = "simt_load_nd_8"} : () -> ()
    "gpu.func"() <{function_type = (memref<24x32xf16>) -> ()}> ({
    ^bb0(%arg92: memref<24x32xf16>):
      %53 = "arith.constant"() <{value = dense<1.000000e+00> : vector<24x32xf16>}> : () -> vector<24x32xf16>
      %54 = "xegpu.create_nd_tdesc"(%arg92) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<24x32xf16>) -> !xegpu.tensor_desc<24x32xf16>
      "xegpu.store_nd"(%53, %54) <{const_offsets = array<i64: 0, 0>, l1_hint = #xegpu.cache_hint<write_back>, l2_hint = #xegpu.cache_hint<uncached>}> : (vector<24x32xf16>, !xegpu.tensor_desc<24x32xf16>) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "subgroup_store_nd"} : () -> ()
    "gpu.func"() <{function_type = (memref<24x32xf16>) -> ()}> ({
    ^bb0(%arg91: memref<24x32xf16>):
      %51 = "arith.constant"() <{value = dense<1.000000e+00> : vector<48xf16>}> : () -> vector<48xf16>
      %52 = "xegpu.create_nd_tdesc"(%arg91) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<24x32xf16>) -> !xegpu.tensor_desc<24x32xf16>
      "xegpu.store_nd"(%51, %52) <{const_offsets = array<i64: 0, 0>, l1_hint = #xegpu.cache_hint<write_back>, l2_hint = #xegpu.cache_hint<uncached>}> : (vector<48xf16>, !xegpu.tensor_desc<24x32xf16>) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "simt_store_nd"} : () -> ()
    "gpu.func"() <{function_type = (memref<24x32xf16>, index) -> ()}> ({
    ^bb0(%arg89: memref<24x32xf16>, %arg90: index):
      %49 = "arith.constant"() <{value = dense<1.000000e+00> : vector<32xf16>}> : () -> vector<32xf16>
      %50 = "xegpu.create_nd_tdesc"(%arg89) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<24x32xf16>) -> !xegpu.tensor_desc<32xf16>
      "xegpu.store_nd"(%49, %50, %arg90) <{const_offsets = array<i64: -9223372036854775808>, l1_hint = #xegpu.cache_hint<write_back>, l2_hint = #xegpu.cache_hint<uncached>}> : (vector<32xf16>, !xegpu.tensor_desc<32xf16>, index) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "subgroup_store_nd_2"} : () -> ()
    "gpu.func"() <{function_type = (memref<24x32xf16>) -> ()}> ({
    ^bb0(%arg88: memref<24x32xf16>):
      %47 = "arith.constant"() <{value = dense<1.000000e+00> : vector<32xf16>}> : () -> vector<32xf16>
      %48 = "xegpu.create_nd_tdesc"(%arg88) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<24x32xf16>) -> !xegpu.tensor_desc<32xf16>
      "xegpu.store_nd"(%47, %48) <{const_offsets = array<i64: 0>, l1_hint = #xegpu.cache_hint<write_back>, l2_hint = #xegpu.cache_hint<uncached>}> : (vector<32xf16>, !xegpu.tensor_desc<32xf16>) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "subgroup_store_nd_offset_1"} : () -> ()
    "gpu.func"() <{function_type = (memref<24x32xf16>) -> ()}> ({
    ^bb0(%arg87: memref<24x32xf16>):
      %45 = "arith.constant"() <{value = dense<1.000000e+00> : vector<2xf16>}> : () -> vector<2xf16>
      %46 = "xegpu.create_nd_tdesc"(%arg87) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<24x32xf16>) -> !xegpu.tensor_desc<32xf16>
      "xegpu.store_nd"(%45, %46) <{const_offsets = array<i64: 0>, l1_hint = #xegpu.cache_hint<write_back>, l2_hint = #xegpu.cache_hint<uncached>}> : (vector<2xf16>, !xegpu.tensor_desc<32xf16>) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "simt_store_nd_2"} : () -> ()
    "gpu.func"() <{function_type = (memref<4x8x16xf16>) -> ()}> ({
    ^bb0(%arg86: memref<4x8x16xf16>):
      %43 = "xegpu.create_nd_tdesc"(%arg86) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<4x8x16xf16>) -> !xegpu.tensor_desc<4x8x16xf16>
      %44 = "xegpu.load_nd"(%43) <{const_offsets = array<i64: 0, 0, 0>, l1_hint = #xegpu.cache_hint<cached>, l2_hint = #xegpu.cache_hint<uncached>}> : (!xegpu.tensor_desc<4x8x16xf16>) -> vector<4x8x16xf16>
      "gpu.return"() : () -> ()
    }) {sym_name = "load_nd_3d"} : () -> ()
    "gpu.func"() <{function_type = (memref<4x8x16xf16>) -> ()}> ({
    ^bb0(%arg85: memref<4x8x16xf16>):
      %41 = "arith.constant"() <{value = dense<1.000000e+00> : vector<4x8x16xf16>}> : () -> vector<4x8x16xf16>
      %42 = "xegpu.create_nd_tdesc"(%arg85) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<4x8x16xf16>) -> !xegpu.tensor_desc<4x8x16xf16>
      "xegpu.store_nd"(%41, %42) <{const_offsets = array<i64: 0, 0, 0>, l1_hint = #xegpu.cache_hint<write_back>, l2_hint = #xegpu.cache_hint<uncached>}> : (vector<4x8x16xf16>, !xegpu.tensor_desc<4x8x16xf16>) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "store_nd_3d"} : () -> ()
    "gpu.func"() <{function_type = (memref<4x8x16xf16>) -> ()}> ({
    ^bb0(%arg84: memref<4x8x16xf16>):
      %40 = "xegpu.create_nd_tdesc"(%arg84) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<4x8x16xf16>) -> !xegpu.tensor_desc<4x8x16xf16>
      "xegpu.prefetch_nd"(%40) <{const_offsets = array<i64: 0, 0, 0>, l1_hint = #xegpu.cache_hint<cached>, l2_hint = #xegpu.cache_hint<uncached>}> : (!xegpu.tensor_desc<4x8x16xf16>) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "prefetch_nd_3d"} : () -> ()
    "gpu.func"() <{function_type = (memref<256xf16>, vector<1xindex>, vector<1xi1>) -> ()}> ({
    ^bb0(%arg81: memref<256xf16>, %arg82: vector<1xindex>, %arg83: vector<1xi1>):
      %39 = "xegpu.load"(%arg81, %arg82, %arg83) <{chunk_size = 8 : i64}> : (memref<256xf16>, vector<1xindex>, vector<1xi1>) -> vector<8xf16>
      "gpu.return"() : () -> ()
    }) {sym_name = "simt_load_4"} : () -> ()
    "gpu.func"() <{function_type = (memref<256xf16>, vector<1xindex>, vector<1xi1>) -> ()}> ({
    ^bb0(%arg78: memref<256xf16>, %arg79: vector<1xindex>, %arg80: vector<1xi1>):
      %38 = "xegpu.load"(%arg78, %arg79, %arg80) : (memref<256xf16>, vector<1xindex>, vector<1xi1>) -> vector<1xf16>
      "gpu.return"() : () -> ()
    }) {sym_name = "simt_load_5"} : () -> ()
    "gpu.func"() <{function_type = (memref<256xf16>, index, i1) -> ()}> ({
    ^bb0(%arg75: memref<256xf16>, %arg76: index, %arg77: i1):
      %37 = "xegpu.load"(%arg75, %arg76, %arg77) <{chunk_size = 8 : i64}> : (memref<256xf16>, index, i1) -> vector<8xf16>
      "gpu.return"() : () -> ()
    }) {sym_name = "simt_load_6"} : () -> ()
    "gpu.func"() <{function_type = (memref<256xf16>, index, i1) -> ()}> ({
    ^bb0(%arg72: memref<256xf16>, %arg73: index, %arg74: i1):
      %36 = "xegpu.load"(%arg72, %arg73, %arg74) : (memref<256xf16>, index, i1) -> f16
      "gpu.return"() : () -> ()
    }) {sym_name = "simt_load_7"} : () -> ()
    "gpu.func"() <{function_type = (memref<?xf16>) -> ()}> ({
    ^bb0(%arg71: memref<?xf16>):
      %33 = "arith.constant"() <{value = dense<[0, 8, 16, 24]> : vector<4xindex>}> : () -> vector<4xindex>
      %34 = "arith.constant"() <{value = dense<true> : vector<4xi1>}> : () -> vector<4xi1>
      %35 = "xegpu.load"(%arg71, %33, %34) <{chunk_size = 2 : i64, l1_hint = #xegpu.cache_hint<cached>}> : (memref<?xf16>, vector<4xindex>, vector<4xi1>) -> vector<4x2xf16>
      "gpu.return"() : () -> ()
    }) {sym_name = "subgroup_load_offset_1"} : () -> ()
    "gpu.func"() <{function_type = (vector<8xf16>, memref<256xf16>, vector<1xindex>, vector<1xi1>) -> ()}> ({
    ^bb0(%arg67: vector<8xf16>, %arg68: memref<256xf16>, %arg69: vector<1xindex>, %arg70: vector<1xi1>):
      "xegpu.store"(%arg67, %arg68, %arg69, %arg70) <{chunk_size = 8 : i64}> : (vector<8xf16>, memref<256xf16>, vector<1xindex>, vector<1xi1>) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "simt_store_4"} : () -> ()
    "gpu.func"() <{function_type = (vector<8xf16>, memref<256xf16>, index, i1) -> ()}> ({
    ^bb0(%arg63: vector<8xf16>, %arg64: memref<256xf16>, %arg65: index, %arg66: i1):
      "xegpu.store"(%arg63, %arg64, %arg65, %arg66) <{chunk_size = 8 : i64}> : (vector<8xf16>, memref<256xf16>, index, i1) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "simt_store_5"} : () -> ()
    "gpu.func"() <{function_type = (vector<1xf16>, memref<256xf16>, vector<1xindex>, vector<1xi1>) -> ()}> ({
    ^bb0(%arg59: vector<1xf16>, %arg60: memref<256xf16>, %arg61: vector<1xindex>, %arg62: vector<1xi1>):
      "xegpu.store"(%arg59, %arg60, %arg61, %arg62) : (vector<1xf16>, memref<256xf16>, vector<1xindex>, vector<1xi1>) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "simt_store_6"} : () -> ()
    "gpu.func"() <{function_type = (f16, memref<256xf16>, index, i1) -> ()}> ({
    ^bb0(%arg55: f16, %arg56: memref<256xf16>, %arg57: index, %arg58: i1):
      "xegpu.store"(%arg55, %arg56, %arg57, %arg58) : (f16, memref<256xf16>, index, i1) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "simt_store_7"} : () -> ()
    "gpu.func"() <{function_type = (memref<?xf16>) -> ()}> ({
    ^bb0(%arg54: memref<?xf16>):
      %30 = "arith.constant"() <{value = dense<2.900390e+00> : vector<4x2xf16>}> : () -> vector<4x2xf16>
      %31 = "arith.constant"() <{value = dense<[0, 8, 16, 24]> : vector<4xindex>}> : () -> vector<4xindex>
      %32 = "arith.constant"() <{value = dense<true> : vector<4xi1>}> : () -> vector<4xi1>
      "xegpu.store"(%30, %arg54, %31, %32) <{chunk_size = 2 : i64, l1_hint = #xegpu.cache_hint<cached>}> : (vector<4x2xf16>, memref<?xf16>, vector<4xindex>, vector<4xi1>) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "subgroup_store_offset_1"} : () -> ()
    "gpu.func"() <{function_type = (i64, vector<16xindex>, vector<16xi1>) -> ()}> ({
    ^bb0(%arg51: i64, %arg52: vector<16xindex>, %arg53: vector<16xi1>):
      %29 = "xegpu.load"(%arg51, %arg52, %arg53) <{contiguity = 4 : i64}> : (i64, vector<16xindex>, vector<16xi1>) -> vector<16xf32>
      "gpu.return"() : () -> ()
    }) {sym_name = "load_contiguity"} : () -> ()
    "gpu.func"() <{function_type = (vector<16xf32>, i64, vector<16xindex>, vector<16xi1>) -> ()}> ({
    ^bb0(%arg47: vector<16xf32>, %arg48: i64, %arg49: vector<16xindex>, %arg50: vector<16xi1>):
      "xegpu.store"(%arg47, %arg48, %arg49, %arg50) <{contiguity = 4 : i64}> : (vector<16xf32>, i64, vector<16xindex>, vector<16xi1>) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "store_contiguity"} : () -> ()
    "gpu.func"() <{function_type = (ui64) -> ()}> ({
    ^bb0(%arg46: ui64):
      %28 = "arith.constant"() <{value = dense<[0, 8, 16, 24]> : vector<4xindex>}> : () -> vector<4xindex>
      "xegpu.prefetch"(%arg46, %28) <{l1_hint = #xegpu.cache_hint<cached>, l2_hint = #xegpu.cache_hint<uncached>, offset_align_byte = 2 : i64}> : (ui64, vector<4xindex>) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "prefetch_offset"} : () -> ()
    "gpu.func"() <{function_type = (vector<8x16xf16>, vector<16x16xf16>) -> ()}> ({
    ^bb0(%arg44: vector<8x16xf16>, %arg45: vector<16x16xf16>):
      %27 = "xegpu.dpas"(%arg44, %arg45) : (vector<8x16xf16>, vector<16x16xf16>) -> vector<8x16xf32>
      "gpu.return"() : () -> ()
    }) {sym_name = "subgroup_dpas"} : () -> ()
    "gpu.func"() <{function_type = (vector<8xf16>, vector<16xf16>) -> ()}> ({
    ^bb0(%arg42: vector<8xf16>, %arg43: vector<16xf16>):
      %26 = "xegpu.dpas"(%arg42, %arg43) : (vector<8xf16>, vector<16xf16>) -> vector<8xf32>
      "gpu.return"() : () -> ()
    }) {sym_name = "simt_dpas"} : () -> ()
    "gpu.func"() <{function_type = (vector<8x16xf16>, vector<8x16x2xf16>) -> ()}> ({
    ^bb0(%arg40: vector<8x16xf16>, %arg41: vector<8x16x2xf16>):
      %25 = "xegpu.dpas"(%arg40, %arg41) : (vector<8x16xf16>, vector<8x16x2xf16>) -> vector<8x16xf32>
      "gpu.return"() : () -> ()
    }) {sym_name = "subgroup_dpas_packed_b"} : () -> ()
    "gpu.func"() <{function_type = () -> ()}> ({
      "xegpu.alloc_nbarrier"() <{nbarrier_num = 8 : i64}> : () -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "alloc_nbarrier"} : () -> ()
    "gpu.func"() <{function_type = () -> ()}> ({
      %22 = "arith.constant"() <{value = 1 : i8}> : () -> i8
      %23 = "arith.constant"() <{value = 16 : i8}> : () -> i8
      %24 = "xegpu.init_nbarrier"(%22, %23) : (i8, i8) -> !xegpu.nbarrier
      "gpu.return"() : () -> ()
    }) {sym_name = "init_nbarrier"} : () -> ()
    "gpu.func"() <{function_type = (!xegpu.nbarrier) -> ()}> ({
    ^bb0(%arg39: !xegpu.nbarrier):
      "xegpu.nbarrier_arrive"(%arg39) : (!xegpu.nbarrier) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "nbarrier_arrive"} : () -> ()
    "gpu.func"() <{function_type = (!xegpu.nbarrier) -> ()}> ({
    ^bb0(%arg38: !xegpu.nbarrier):
      "xegpu.nbarrier_wait"(%arg38) : (!xegpu.nbarrier) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "nbarrier_wait"} : () -> ()
    "gpu.func"() <{function_type = () -> ()}> ({
      "xegpu.fence"() <{fence_scope = #xegpu<fence_scope workgroup>, memory_kind = #xegpu<memory_space global>}> : () -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "fence"} : () -> ()
    "gpu.func"() <{function_type = () -> ()}> ({
      %20 = "memref.alloca"() <{alignment = 1024 : i64, operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<2048xi8, 3>
      %21 = "xegpu.create_mem_desc"(%20) : (memref<2048xi8, 3>) -> !xegpu.mem_desc<16x64xf16>
      "gpu.return"() : () -> ()
    }) {sym_name = "create_mem_desc"} : () -> ()
    "gpu.func"() <{function_type = () -> ()}> ({
      %18 = "memref.alloca"() <{alignment = 1024 : i64, operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<2048xi8, 3>
      %19 = "xegpu.create_mem_desc"(%18) : (memref<2048xi8, 3>) -> !xegpu.mem_desc<16x64xf16, #xegpu.mem_layout<stride = [1, 16]>>
      "gpu.return"() : () -> ()
    }) {sym_name = "create_mem_desc_with_stride"} : () -> ()
    "gpu.func"() <{function_type = () -> ()}> ({
      %16 = "memref.alloca"() <{alignment = 1024 : i64, operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<16x64xf16, 3>
      %17 = "xegpu.create_mem_desc"(%16) : (memref<16x64xf16, 3>) -> !xegpu.mem_desc<16x64xf16>
      "gpu.return"() : () -> ()
    }) {sym_name = "create_mem_desc_from_2d_memref"} : () -> ()
    "gpu.func"() <{function_type = () -> ()}> ({
      %13 = "memref.alloca"() <{alignment = 1024 : i64, operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<32x64xf16, 3>
      %14 = "memref.subview"(%13) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_offsets = array<i64: 16, 0>, static_sizes = array<i64: 16, 64>, static_strides = array<i64: 1, 1>}> : (memref<32x64xf16, 3>) -> memref<16x64xf16, strided<[64, 1], offset: 1024>, 3>
      %15 = "xegpu.create_mem_desc"(%14) : (memref<16x64xf16, strided<[64, 1], offset: 1024>, 3>) -> !xegpu.mem_desc<16x64xf16, #xegpu.mem_layout<stride = [1, 16]>>
      "gpu.return"() : () -> ()
    }) {sym_name = "create_mem_desc_with_stride_from_2d_memref"} : () -> ()
    "gpu.func"() <{function_type = (!xegpu.mem_desc<16x64xf16>) -> ()}> ({
    ^bb0(%arg37: !xegpu.mem_desc<16x64xf16>):
      %12 = "xegpu.load_matrix"(%arg37) <{const_offsets = array<i64: 8, 8>}> : (!xegpu.mem_desc<16x64xf16>) -> vector<8x16xf16>
      "gpu.return"() : () -> ()
    }) {sym_name = "load_matrix"} : () -> ()
    "gpu.func"() <{function_type = (!xegpu.mem_desc<16x64xf16, #xegpu.mem_layout<stride = [1, 16]>>) -> ()}> ({
    ^bb0(%arg36: !xegpu.mem_desc<16x64xf16, #xegpu.mem_layout<stride = [1, 16]>>):
      %11 = "xegpu.load_matrix"(%arg36) <{const_offsets = array<i64: 8, 8>}> : (!xegpu.mem_desc<16x64xf16, #xegpu.mem_layout<stride = [1, 16]>>) -> vector<8x16xf16>
      "gpu.return"() : () -> ()
    }) {sym_name = "load_matrix_with_stride"} : () -> ()
    "gpu.func"() <{function_type = (!xegpu.mem_desc<16x64xf16>) -> ()}> ({
    ^bb0(%arg35: !xegpu.mem_desc<16x64xf16>):
      %10 = "xegpu.load_matrix"(%arg35) <{const_offsets = array<i64: 8, 16>}> : (!xegpu.mem_desc<16x64xf16>) -> vector<1xf16>
      "gpu.return"() : () -> ()
    }) {sym_name = "simt_load_matrix"} : () -> ()
    "gpu.func"() <{function_type = (!xegpu.mem_desc<16x64xf16, #xegpu.mem_layout<block = [16, 16]>>) -> ()}> ({
    ^bb0(%arg34: !xegpu.mem_desc<16x64xf16, #xegpu.mem_layout<block = [16, 16]>>):
      %9 = "xegpu.load_matrix"(%arg34) <{const_offsets = array<i64: 8, 16>, subgroup_block_io}> : (!xegpu.mem_desc<16x64xf16, #xegpu.mem_layout<block = [16, 16]>>) -> vector<8xf16>
      "gpu.return"() : () -> ()
    }) {sym_name = "simt_load_matrix_subgroup_block_io"} : () -> ()
    "gpu.func"() <{function_type = (!xegpu.mem_desc<16x64xf16, #xegpu.mem_layout<stride = [1, 16]>>) -> ()}> ({
    ^bb0(%arg33: !xegpu.mem_desc<16x64xf16, #xegpu.mem_layout<stride = [1, 16]>>):
      %8 = "xegpu.load_matrix"(%arg33) <{const_offsets = array<i64: 8, 8>}> : (!xegpu.mem_desc<16x64xf16, #xegpu.mem_layout<stride = [1, 16]>>) -> vector<8xf16>
      "gpu.return"() : () -> ()
    }) {sym_name = "simt_load_matrix_vector"} : () -> ()
    "gpu.func"() <{function_type = (!xegpu.mem_desc<16x64xf16>, vector<16x16xf16>) -> ()}> ({
    ^bb0(%arg31: !xegpu.mem_desc<16x64xf16>, %arg32: vector<16x16xf16>):
      "xegpu.store_matrix"(%arg32, %arg31) <{const_offsets = array<i64: 8, 8>}> : (vector<16x16xf16>, !xegpu.mem_desc<16x64xf16>) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "store_matrix"} : () -> ()
    "gpu.func"() <{function_type = (!xegpu.mem_desc<16x64xf16, #xegpu.mem_layout<stride = [1, 16]>>, vector<16x16xf16>) -> ()}> ({
    ^bb0(%arg29: !xegpu.mem_desc<16x64xf16, #xegpu.mem_layout<stride = [1, 16]>>, %arg30: vector<16x16xf16>):
      "xegpu.store_matrix"(%arg30, %arg29) <{const_offsets = array<i64: 0, 8>}> : (vector<16x16xf16>, !xegpu.mem_desc<16x64xf16, #xegpu.mem_layout<stride = [1, 16]>>) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "store_matrix_with_stride"} : () -> ()
    "gpu.func"() <{function_type = (!xegpu.mem_desc<16x64xf16>, vector<1xf16>) -> ()}> ({
    ^bb0(%arg27: !xegpu.mem_desc<16x64xf16>, %arg28: vector<1xf16>):
      "xegpu.store_matrix"(%arg28, %arg27) <{const_offsets = array<i64: 8, 16>}> : (vector<1xf16>, !xegpu.mem_desc<16x64xf16>) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "simt_store_matrix"} : () -> ()
    "gpu.func"() <{function_type = (!xegpu.mem_desc<16x64xf16, #xegpu.mem_layout<block = [16, 16]>>, vector<8xf16>) -> ()}> ({
    ^bb0(%arg25: !xegpu.mem_desc<16x64xf16, #xegpu.mem_layout<block = [16, 16]>>, %arg26: vector<8xf16>):
      "xegpu.store_matrix"(%arg26, %arg25) <{const_offsets = array<i64: 8, 16>, subgroup_block_io}> : (vector<8xf16>, !xegpu.mem_desc<16x64xf16, #xegpu.mem_layout<block = [16, 16]>>) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "simt_store_matrix_subgroup_block_io"} : () -> ()
    "gpu.func"() <{function_type = (!xegpu.mem_desc<16x64xf16, #xegpu.mem_layout<stride = [1, 16]>>, vector<8xf16>) -> ()}> ({
    ^bb0(%arg23: !xegpu.mem_desc<16x64xf16, #xegpu.mem_layout<stride = [1, 16]>>, %arg24: vector<8xf16>):
      "xegpu.store_matrix"(%arg24, %arg23) <{const_offsets = array<i64: 8, 8>}> : (vector<8xf16>, !xegpu.mem_desc<16x64xf16, #xegpu.mem_layout<stride = [1, 16]>>) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "simt_store_matrix_vector"} : () -> ()
    "gpu.func"() <{function_type = (!xegpu.mem_desc<64xf16>) -> ()}> ({
    ^bb0(%arg22: !xegpu.mem_desc<64xf16>):
      %7 = "xegpu.load_matrix"(%arg22) <{const_offsets = array<i64: 16>}> : (!xegpu.mem_desc<64xf16>) -> vector<16xf16>
      "gpu.return"() : () -> ()
    }) {sym_name = "load_matrix_1d"} : () -> ()
    "gpu.func"() <{function_type = (!xegpu.mem_desc<64xf16>, vector<16xf16>) -> ()}> ({
    ^bb0(%arg20: !xegpu.mem_desc<64xf16>, %arg21: vector<16xf16>):
      "xegpu.store_matrix"(%arg21, %arg20) <{const_offsets = array<i64: 0>}> : (vector<16xf16>, !xegpu.mem_desc<64xf16>) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "store_matrix_1d"} : () -> ()
    "gpu.func"() <{function_type = (!xegpu.mem_desc<64xf16, #xegpu.mem_layout<block = [16]>>) -> ()}> ({
    ^bb0(%arg19: !xegpu.mem_desc<64xf16, #xegpu.mem_layout<block = [16]>>):
      %6 = "xegpu.load_matrix"(%arg19) <{const_offsets = array<i64: 0>, subgroup_block_io}> : (!xegpu.mem_desc<64xf16, #xegpu.mem_layout<block = [16]>>) -> vector<16xf16>
      "gpu.return"() : () -> ()
    }) {sym_name = "load_matrix_1d_block_io"} : () -> ()
    "gpu.func"() <{function_type = (!xegpu.mem_desc<64xf16, #xegpu.mem_layout<block = [16]>>, vector<16xf16>) -> ()}> ({
    ^bb0(%arg17: !xegpu.mem_desc<64xf16, #xegpu.mem_layout<block = [16]>>, %arg18: vector<16xf16>):
      "xegpu.store_matrix"(%arg18, %arg17) <{const_offsets = array<i64: 0>, subgroup_block_io}> : (vector<16xf16>, !xegpu.mem_desc<64xf16, #xegpu.mem_layout<block = [16]>>) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "store_matrix_1d_block_io"} : () -> ()
    "gpu.func"() <{function_type = (!xegpu.mem_desc<64xf16>) -> ()}> ({
    ^bb0(%arg16: !xegpu.mem_desc<64xf16>):
      %5 = "xegpu.load_matrix"(%arg16) <{const_offsets = array<i64: 0>}> : (!xegpu.mem_desc<64xf16>) -> vector<1xf16>
      "gpu.return"() : () -> ()
    }) {sym_name = "simt_load_matrix_1d"} : () -> ()
    "gpu.func"() <{function_type = (vector<8x16xf16>) -> ()}> ({
    ^bb0(%arg15: vector<8x16xf16>):
      %4 = "xegpu.truncf"(%arg15) : (vector<8x16xf16>) -> vector<8x16xf8E5M2>
      "gpu.return"() : () -> ()
    }) {sym_name = "truncf"} : () -> ()
    "gpu.func"() <{function_type = (vector<8x32xf8E5M2>, vector<32x16xf8E5M2>, vector<8x16xbf16>, vector<8x1xf8E8M0FNU>, vector<1x16xf8E8M0FNU>) -> ()}> ({
    ^bb0(%arg10: vector<8x32xf8E5M2>, %arg11: vector<32x16xf8E5M2>, %arg12: vector<8x16xbf16>, %arg13: vector<8x1xf8E8M0FNU>, %arg14: vector<1x16xf8E8M0FNU>):
      %3 = "xegpu.dpas_mx"(%arg10, %arg11, %arg12, %arg13, %arg14) <{operandSegmentSizes = array<i32: 1, 1, 1, 1, 1>}> : (vector<8x32xf8E5M2>, vector<32x16xf8E5M2>, vector<8x16xbf16>, vector<8x1xf8E8M0FNU>, vector<1x16xf8E8M0FNU>) -> vector<8x16xbf16>
      "gpu.return"() : () -> ()
    }) {sym_name = "dpas_mx"} : () -> ()
    "gpu.func"() <{function_type = (vector<4x8x16xf16>, vector<4x16x16xf16>) -> ()}> ({
    ^bb0(%arg8: vector<4x8x16xf16>, %arg9: vector<4x16x16xf16>):
      %2 = "xegpu.dpas"(%arg8, %arg9) : (vector<4x8x16xf16>, vector<4x16x16xf16>) -> vector<4x8x16xf32>
      "gpu.return"() : () -> ()
    }) {sym_name = "dpas_3d_batch"} : () -> ()
    "gpu.func"() <{function_type = (vector<4x8x16xf16>, vector<4x16x16xf16>, vector<4x8x16xf32>) -> ()}> ({
    ^bb0(%arg5: vector<4x8x16xf16>, %arg6: vector<4x16x16xf16>, %arg7: vector<4x8x16xf32>):
      %1 = "xegpu.dpas"(%arg5, %arg6, %arg7) : (vector<4x8x16xf16>, vector<4x16x16xf16>, vector<4x8x16xf32>) -> vector<4x8x16xf32>
      "gpu.return"() : () -> ()
    }) {sym_name = "dpas_3d_batch_with_acc"} : () -> ()
    "gpu.func"() <{function_type = (vector<4x8x32xf8E5M2>, vector<4x32x16xf8E5M2>, vector<4x8x16xbf16>, vector<4x8x1xf8E8M0FNU>, vector<4x1x16xf8E8M0FNU>) -> ()}> ({
    ^bb0(%arg0: vector<4x8x32xf8E5M2>, %arg1: vector<4x32x16xf8E5M2>, %arg2: vector<4x8x16xbf16>, %arg3: vector<4x8x1xf8E8M0FNU>, %arg4: vector<4x1x16xf8E8M0FNU>):
      %0 = "xegpu.dpas_mx"(%arg0, %arg1, %arg2, %arg3, %arg4) <{operandSegmentSizes = array<i32: 1, 1, 1, 1, 1>}> : (vector<4x8x32xf8E5M2>, vector<4x32x16xf8E5M2>, vector<4x8x16xbf16>, vector<4x8x1xf8E8M0FNU>, vector<4x1x16xf8E8M0FNU>) -> vector<4x8x16xbf16>
      "gpu.return"() : () -> ()
    }) {sym_name = "dpas_mx_3d_batch"} : () -> ()
  }) : () -> ()
}) : () -> ()

