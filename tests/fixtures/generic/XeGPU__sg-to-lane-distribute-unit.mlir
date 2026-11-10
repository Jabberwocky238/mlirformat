"builtin.module"() ({
  "gpu.module"() <{sym_name = "xevm_module"}> ({
    "gpu.func"() <{function_type = (memref<256x256xf16>) -> ()}> ({
    ^bb0(%arg13: memref<256x256xf16>):
      %167 = "arith.constant"() <{value = 0 : index}> : () -> index
      %168 = "xegpu.create_nd_tdesc"(%arg13) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<256x256xf16>) -> !xegpu.tensor_desc<16x16xf16>
      "gpu.return"() : () -> ()
    }) {sym_name = "create_nd_tdesc"} : () -> ()
    "gpu.func"() <{function_type = (ui64) -> ()}> ({
    ^bb0(%arg12: ui64):
      %165 = "arith.constant"() <{value = 0 : index}> : () -> index
      %166 = "xegpu.create_nd_tdesc"(%arg12) <{const_shape = array<i64: 256, 256>, const_strides = array<i64: 256, 1>, operandSegmentSizes = array<i32: 1, 0, 0>}> : (ui64) -> !xegpu.tensor_desc<16x16xf16>
      "gpu.return"() : () -> ()
    }) {sym_name = "cerate_nd_tedesc_nonmemref_source"} : () -> ()
    "gpu.func"() <{function_type = () -> ()}> ({
      %162 = "arith.constant"() <{value = 0 : index}> : () -> index
      %163 = "some_op"() : () -> !xegpu.tensor_desc<16x16xf16>
      %164 = "xegpu.load_nd"(%163, %162, %162) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>, layout = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>}> : (!xegpu.tensor_desc<16x16xf16>, index, index) -> vector<16x16xf16>
      "gpu.return"() : () -> ()
    }) {sym_name = "load_nd"} : () -> ()
    "gpu.func"() <{function_type = () -> ()}> ({
      %159 = "arith.constant"() <{value = 0 : index}> : () -> index
      %160 = "some_op"() : () -> !xegpu.tensor_desc<16x16xf16>
      %161 = "xegpu.load_nd"(%160, %159, %159) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>, layout = #xegpu.layout<lane_layout = [1, 16], lane_data = [2, 1]>}> : (!xegpu.tensor_desc<16x16xf16>, index, index) -> vector<16x16xf16>
      "gpu.return"() : () -> ()
    }) {sym_name = "load_nd_packed"} : () -> ()
    "gpu.func"() <{function_type = () -> ()}> ({
      %156 = "arith.constant"() <{value = 0 : index}> : () -> index
      %157 = "some_op"() : () -> !xegpu.tensor_desc<16x8xf32>
      %158 = "xegpu.load_nd"(%157, %156, %156) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>, layout = #xegpu.layout<lane_layout = [16, 1], lane_data = [1, 1]>}> : (!xegpu.tensor_desc<16x8xf32>, index, index) -> vector<16x8xf32>
      "gpu.return"() : () -> ()
    }) {sym_name = "load_nd_transpose"} : () -> ()
    "gpu.func"() <{function_type = () -> ()}> ({
      %153 = "arith.constant"() <{value = 0 : index}> : () -> index
      %154 = "some_op"() : () -> !xegpu.tensor_desc<32x16xf16, #xegpu.block_tdesc_attr<array_length = 2 : i64>>
      %155 = "xegpu.load_nd"(%154, %153, %153) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>, layout = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>}> : (!xegpu.tensor_desc<32x16xf16, #xegpu.block_tdesc_attr<array_length = 2 : i64>>, index, index) -> vector<64x16xf16>
      "gpu.return"() : () -> ()
    }) {sym_name = "load_nd_array_length"} : () -> ()
    "gpu.func"() <{function_type = () -> ()}> ({
      %149 = "arith.constant"() <{value = 0 : index}> : () -> index
      %150 = "some_op"() : () -> !xegpu.tensor_desc<16x16xf16>
      %151 = "some_op"() : () -> !xegpu.tensor_desc<16x16xf16>
      %152 = "xegpu.load_nd"(%150, %149, %149) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>, layout = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>}> : (!xegpu.tensor_desc<16x16xf16>, index, index) -> vector<16x16xf16>
      "xegpu.store_nd"(%152, %151, %149, %149) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>, layout = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>}> : (vector<16x16xf16>, !xegpu.tensor_desc<16x16xf16>, index, index) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "store_nd"} : () -> ()
    "gpu.func"() <{function_type = () -> ()}> ({
      %141 = "arith.constant"() <{value = 0 : index}> : () -> index
      %142 = "some_op"() : () -> !xegpu.tensor_desc<8x16xf16>
      %143 = "some_op"() : () -> !xegpu.tensor_desc<16x16xf16>
      %144 = "arith.constant"() <{value = dense<0.000000e+00> : vector<8x16xf32>}> : () -> vector<8x16xf32>
      %145 = "xegpu.load_nd"(%142, %141, %141) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>, layout = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>}> : (!xegpu.tensor_desc<8x16xf16>, index, index) -> vector<8x16xf16>
      %146 = "xegpu.load_nd"(%143, %141, %141) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>, layout = #xegpu.layout<lane_layout = [1, 16], lane_data = [2, 1]>}> : (!xegpu.tensor_desc<16x16xf16>, index, index) -> vector<16x16xf16>
      %147 = "xegpu.dpas"(%145, %146, %144) <{layout_a = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>, layout_b = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>, layout_cd = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>}> : (vector<8x16xf16>, vector<16x16xf16>, vector<8x16xf32>) -> vector<8x16xf32>
      %148 = "xegpu.convert_layout"(%147) <{input_layout = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>, target_layout = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>}> : (vector<8x16xf32>) -> vector<8x16xf32>
      "gpu.return"() : () -> ()
    }) {sym_name = "dpas"} : () -> ()
    "gpu.func"() <{function_type = () -> ()}> ({
      %135 = "arith.constant"() <{value = 0 : index}> : () -> index
      %136 = "arith.constant"() <{value = dense<1.000000e+00> : vector<16x16xf32>}> : () -> vector<16x16xf32>
      %137 = "some_op"() : () -> !xegpu.tensor_desc<16x16xf32>
      %138 = "xegpu.load_nd"(%137, %135, %135) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>, layout = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>}> : (!xegpu.tensor_desc<16x16xf32>, index, index) -> vector<16x16xf32>
      %139 = "arith.addf"(%136, %138) <{fastmath = #arith.fastmath<none>}> : (vector<16x16xf32>, vector<16x16xf32>) -> vector<16x16xf32>
      %140 = "xegpu.convert_layout"(%139) <{input_layout = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>, target_layout = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>}> : (vector<16x16xf32>) -> vector<16x16xf32>
      "gpu.return"() : () -> ()
    }) {sym_name = "elementwise"} : () -> ()
    "gpu.func"() <{function_type = () -> ()}> ({
      %133 = "arith.constant"() <{value = dense<1.000000e+00> : vector<16x16xf32>}> : () -> vector<16x16xf32>
      %134 = "xegpu.convert_layout"(%133) <{input_layout = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>, target_layout = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>}> : (vector<16x16xf32>) -> vector<16x16xf32>
      "gpu.return"() : () -> ()
    }) {sym_name = "arith_constant"} : () -> ()
    "gpu.func"() <{function_type = () -> ()}> ({
      %131 = "arith.constant"() <{value = dense<[0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15]> : vector<16xindex>}> {layout_result_0 = #xegpu.slice<#xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>, dims = [0]>} : () -> vector<16xindex>
      %132 = "xegpu.convert_layout"(%131) <{input_layout = #xegpu.slice<#xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>, dims = [0]>, target_layout = #xegpu.slice<#xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>, dims = [0]>}> : (vector<16xindex>) -> vector<16xindex>
      "gpu.return"() : () -> ()
    }) {sym_name = "arith_constant_non_splat"} : () -> ()
    "gpu.func"() <{function_type = () -> ()}> ({
      %129 = "arith.constant"() <{value = dense<[0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31]> : vector<32xindex>}> {layout_result_0 = #xegpu.slice<#xegpu.layout<lane_layout = [1, 16], lane_data = [1, 2]>, dims = [0]>} : () -> vector<32xindex>
      %130 = "xegpu.convert_layout"(%129) <{input_layout = #xegpu.slice<#xegpu.layout<lane_layout = [1, 16], lane_data = [1, 2]>, dims = [0]>, target_layout = #xegpu.slice<#xegpu.layout<lane_layout = [1, 16], lane_data = [1, 2]>, dims = [0]>}> : (vector<32xindex>) -> vector<32xindex>
      "gpu.return"() : () -> ()
    }) {sym_name = "arith_constant_non_splat_lane_data"} : () -> ()
    "gpu.func"() <{function_type = () -> ()}> ({
      %127 = "arith.constant"() <{value = dense<"0x00000000000000000100000000000000020000000000000003000000000000000400000000000000050000000000000006000000000000000700000000000000080000000000000009000000000000000A000000000000000B000000000000000C000000000000000D000000000000000E000000000000000F0000000000000010000000000000001100000000000000120000000000000013000000000000001400000000000000150000000000000016000000000000001700000000000000180000000000000019000000000000001A000000000000001B000000000000001C000000000000001D000000000000001E000000000000001F0000000000000020000000000000002100000000000000220000000000000023000000000000002400000000000000250000000000000026000000000000002700000000000000280000000000000029000000000000002A000000000000002B000000000000002C000000000000002D000000000000002E000000000000002F0000000000000030000000000000003100000000000000320000000000000033000000000000003400000000000000350000000000000036000000000000003700000000000000380000000000000039000000000000003A000000000000003B000000000000003C000000000000003D000000000000003E000000000000003F0000000000000040000000000000004100000000000000420000000000000043000000000000004400000000000000450000000000000046000000000000004700000000000000480000000000000049000000000000004A000000000000004B000000000000004C000000000000004D000000000000004E000000000000004F0000000000000050000000000000005100000000000000520000000000000053000000000000005400000000000000550000000000000056000000000000005700000000000000580000000000000059000000000000005A000000000000005B000000000000005C000000000000005D000000000000005E000000000000005F0000000000000060000000000000006100000000000000620000000000000063000000000000006400000000000000650000000000000066000000000000006700000000000000680000000000000069000000000000006A000000000000006B000000000000006C000000000000006D000000000000006E000000000000006F0000000000000070000000000000007100000000000000720000000000000073000000000000007400000000000000750000000000000076000000000000007700000000000000780000000000000079000000000000007A000000000000007B000000000000007C000000000000007D000000000000007E000000000000007F00000000000000"> : vector<4x32xindex>}> {layout_result_0 = #xegpu.layout<lane_layout = [1, 16], lane_data = [2, 1]>} : () -> vector<4x32xindex>
      %128 = "xegpu.convert_layout"(%127) <{input_layout = #xegpu.layout<lane_layout = [1, 16], lane_data = [2, 1]>, target_layout = #xegpu.layout<lane_layout = [1, 16], lane_data = [2, 1]>}> : (vector<4x32xindex>) -> vector<4x32xindex>
      "gpu.return"() : () -> ()
    }) {sym_name = "arith_constant_non_splat_2d_vertical_lanedata"} : () -> ()
    "gpu.func"() <{function_type = () -> ()}> ({
      %125 = "arith.constant"() <{value = 0 : index}> : () -> index
      %126 = "some_op"() : () -> !xegpu.tensor_desc<16x16xf16>
      "xegpu.prefetch_nd"(%126, %125, %125) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>, layout = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>}> : (!xegpu.tensor_desc<16x16xf16>, index, index) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "prefetch_nd"} : () -> ()
    "gpu.func"() <{function_type = (memref<256xf16>) -> ()}> ({
    ^bb0(%arg11: memref<256xf16>):
      %122 = "arith.constant"() <{value = dense<12> : vector<16xindex>}> : () -> vector<16xindex>
      %123 = "arith.constant"() <{value = dense<true> : vector<16xi1>}> : () -> vector<16xi1>
      %124 = "xegpu.load"(%arg11, %122, %123) <{chunk_size = 8 : i64, layout = #xegpu.layout<lane_layout = [16, 1], lane_data = [1, 1]>}> : (memref<256xf16>, vector<16xindex>, vector<16xi1>) -> vector<16x8xf16>
      "gpu.return"() : () -> ()
    }) {sym_name = "scatter_load_chunksize"} : () -> ()
    "gpu.func"() <{function_type = (memref<256xf16>) -> ()}> ({
    ^bb0(%arg10: memref<256xf16>):
      %119 = "arith.constant"() <{value = dense<12> : vector<16xindex>}> : () -> vector<16xindex>
      %120 = "arith.constant"() <{value = dense<true> : vector<16xi1>}> : () -> vector<16xi1>
      %121 = "xegpu.load"(%arg10, %119, %120) <{chunk_size = 8 : i64, layout = #xegpu.layout<lane_layout = [16, 1], lane_data = [1, 1]>}> : (memref<256xf16>, vector<16xindex>, vector<16xi1>) -> vector<16x8xf16>
      "xegpu.store"(%121, %arg10, %119, %120) <{chunk_size = 8 : i64, layout = #xegpu.layout<lane_layout = [16, 1], lane_data = [1, 1]>}> : (vector<16x8xf16>, memref<256xf16>, vector<16xindex>, vector<16xi1>) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "scatter_store_chunksize"} : () -> ()
    "gpu.func"() <{function_type = (memref<256xf16>) -> ()}> ({
    ^bb0(%arg9: memref<256xf16>):
      %116 = "arith.constant"() <{value = dense<12> : vector<16xindex>}> : () -> vector<16xindex>
      %117 = "arith.constant"() <{value = dense<true> : vector<16xi1>}> : () -> vector<16xi1>
      %118 = "xegpu.load"(%arg9, %116, %117) <{layout = #xegpu.layout<lane_layout = [16], lane_data = [1]>}> : (memref<256xf16>, vector<16xindex>, vector<16xi1>) -> vector<16xf16>
      "gpu.return"() : () -> ()
    }) {sym_name = "scatter_load"} : () -> ()
    "gpu.func"() <{function_type = (memref<256xf16>) -> ()}> ({
    ^bb0(%arg8: memref<256xf16>):
      %113 = "arith.constant"() <{value = dense<12> : vector<16xindex>}> : () -> vector<16xindex>
      %114 = "arith.constant"() <{value = dense<true> : vector<16xi1>}> : () -> vector<16xi1>
      %115 = "xegpu.load"(%arg8, %113, %114) <{layout = #xegpu.layout<lane_layout = [16], lane_data = [1]>}> : (memref<256xf16>, vector<16xindex>, vector<16xi1>) -> vector<16xf16>
      "xegpu.store"(%115, %arg8, %113, %114) <{layout = #xegpu.layout<lane_layout = [16], lane_data = [1]>}> : (vector<16xf16>, memref<256xf16>, vector<16xindex>, vector<16xi1>) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "scatter_store"} : () -> ()
    "gpu.func"() <{function_type = (memref<256xf16>) -> ()}> ({
    ^bb0(%arg7: memref<256xf16>):
      %110 = "arith.constant"() <{value = dense<true> : vector<1x1x16xi1>}> : () -> vector<1x1x16xi1>
      %111 = "arith.constant"() <{value = dense<12> : vector<1x1x16xindex>}> : () -> vector<1x1x16xindex>
      %112 = "xegpu.load"(%arg7, %111, %110) <{layout = #xegpu.layout<lane_layout = [1, 1, 16], lane_data = [1, 1, 1]>}> : (memref<256xf16>, vector<1x1x16xindex>, vector<1x1x16xi1>) -> vector<1x1x16xf16>
      "xegpu.store"(%112, %arg7, %111, %110) <{layout = #xegpu.layout<lane_layout = [1, 1, 16], lane_data = [1, 1, 1]>}> : (vector<1x1x16xf16>, memref<256xf16>, vector<1x1x16xindex>, vector<1x1x16xi1>) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "scatter_ops_with_leading_dims"} : () -> ()
    "gpu.func"() <{function_type = () -> ()}> ({
      %106 = "arith.constant"() <{value = 1.000000e+00 : f32}> : () -> f32
      %107 = "some_op"() : () -> vector<32xf32>
      %108 = "vector.reduction"(%107, %106) <{fastmath = #arith.fastmath<none>, kind = #vector.kind<add>}> : (vector<32xf32>, f32) -> f32
      %109 = "xegpu.convert_layout"(%108) <{input_layout = #xegpu.slice<#xegpu.layout<lane_layout = [16], lane_data = [1]>, dims = [0]>, target_layout = #xegpu.slice<#xegpu.layout<lane_layout = [16], lane_data = [1]>, dims = [0]>}> : (f32) -> f32
      "gpu.return"() : () -> ()
    }) {sym_name = "vector_reduction"} : () -> ()
    "gpu.func"() <{function_type = (index) -> ()}> ({
    ^bb0(%arg6: index):
      %101 = "arith.constant"() <{value = 0 : index}> : () -> index
      %102 = "arith.constant"() <{value = dense<0.000000e+00> : vector<2x16xf32>}> : () -> vector<2x16xf32>
      %103 = "arith.constant"() <{value = dense<0.000000e+00> : vector<2xf32>}> : () -> vector<2xf32>
      %104 = "vector.multi_reduction"(%102, %103) <{kind = #vector.kind<add>, reduction_dims = array<i64: 1>}> : (vector<2x16xf32>, vector<2xf32>) -> vector<2xf32>
      %105 = "xegpu.convert_layout"(%104) <{input_layout = #xegpu.slice<#xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>, dims = [1]>, target_layout = #xegpu.slice<#xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>, dims = [1]>}> : (vector<2xf32>) -> vector<2xf32>
      "gpu.return"() : () -> ()
    }) {sym_name = "vector_multi_reduction_dim1_distributed_dim1_reduction"} : () -> ()
    "gpu.func"() <{function_type = (index) -> ()}> ({
    ^bb0(%arg5: index):
      %96 = "arith.constant"() <{value = 0 : index}> : () -> index
      %97 = "arith.constant"() <{value = dense<0.000000e+00> : vector<16x2xf32>}> : () -> vector<16x2xf32>
      %98 = "arith.constant"() <{value = dense<0.000000e+00> : vector<2xf32>}> : () -> vector<2xf32>
      %99 = "vector.multi_reduction"(%97, %98) <{kind = #vector.kind<add>, reduction_dims = array<i64: 0>}> : (vector<16x2xf32>, vector<2xf32>) -> vector<2xf32>
      %100 = "xegpu.convert_layout"(%99) <{input_layout = #xegpu.slice<#xegpu.layout<lane_layout = [16, 1], lane_data = [1, 1]>, dims = [0]>, target_layout = #xegpu.slice<#xegpu.layout<lane_layout = [16, 1], lane_data = [1, 1]>, dims = [0]>}> : (vector<2xf32>) -> vector<2xf32>
      "gpu.return"() : () -> ()
    }) {sym_name = "vector_multi_reduction_dim0_distributed_dim0_reduction"} : () -> ()
    "gpu.func"() <{function_type = (index) -> ()}> ({
    ^bb0(%arg4: index):
      %91 = "arith.constant"() <{value = 0 : index}> : () -> index
      %92 = "arith.constant"() <{value = dense<0.000000e+00> : vector<4x16xf32>}> : () -> vector<4x16xf32>
      %93 = "arith.constant"() <{value = dense<0.000000e+00> : vector<16xf32>}> : () -> vector<16xf32>
      %94 = "vector.multi_reduction"(%92, %93) <{kind = #vector.kind<add>, reduction_dims = array<i64: 0>}> : (vector<4x16xf32>, vector<16xf32>) -> vector<16xf32>
      %95 = "xegpu.convert_layout"(%94) <{input_layout = #xegpu.slice<#xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>, dims = [0]>, target_layout = #xegpu.slice<#xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>, dims = [0]>}> : (vector<16xf32>) -> vector<16xf32>
      "gpu.return"() : () -> ()
    }) {sym_name = "vector_multi_reduction_dim1_distributed_dim0_reduction"} : () -> ()
    "gpu.func"() <{function_type = (index) -> ()}> ({
    ^bb0(%arg3: index):
      %86 = "arith.constant"() <{value = 0 : index}> : () -> index
      %87 = "arith.constant"() <{value = dense<0.000000e+00> : vector<16x12xf32>}> : () -> vector<16x12xf32>
      %88 = "arith.constant"() <{value = dense<0.000000e+00> : vector<16xf32>}> : () -> vector<16xf32>
      %89 = "vector.multi_reduction"(%87, %88) <{kind = #vector.kind<add>, reduction_dims = array<i64: 1>}> : (vector<16x12xf32>, vector<16xf32>) -> vector<16xf32>
      %90 = "xegpu.convert_layout"(%89) <{input_layout = #xegpu.slice<#xegpu.layout<lane_layout = [16, 1], lane_data = [1, 1]>, dims = [1]>, target_layout = #xegpu.slice<#xegpu.layout<lane_layout = [16, 1], lane_data = [1, 1]>, dims = [1]>}> : (vector<16xf32>) -> vector<16xf32>
      "gpu.return"() : () -> ()
    }) {sym_name = "vector_multi_reduction_dim0_distributed_dim1_reduction"} : () -> ()
    "gpu.func"() <{function_type = () -> ()}> ({
      %83 = "some_op"() : () -> vector<16x2xf32>
      %84 = "vector.transpose"(%83) <{permutation = array<i64: 1, 0>}> : (vector<16x2xf32>) -> vector<2x16xf32>
      %85 = "xegpu.convert_layout"(%84) <{input_layout = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>, target_layout = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>}> : (vector<2x16xf32>) -> vector<2x16xf32>
      "gpu.return"() : () -> ()
    }) {sym_name = "vector_transpose"} : () -> ()
    "gpu.func"() <{function_type = () -> ()}> ({
      %80 = "some_op"() : () -> vector<4x32xi8>
      %81 = "vector.bitcast"(%80) : (vector<4x32xi8>) -> vector<4x16xi16>
      %82 = "xegpu.convert_layout"(%81) <{input_layout = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>, target_layout = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>}> : (vector<4x16xi16>) -> vector<4x16xi16>
      "gpu.return"() : () -> ()
    }) {sym_name = "vector_bitcast"} : () -> ()
    "gpu.func"() <{function_type = (index) -> ()}> ({
    ^bb0(%arg2: index):
      %78 = "vector.create_mask"(%arg2) : (index) -> vector<16xi1>
      %79 = "xegpu.convert_layout"(%78) <{input_layout = #xegpu.layout<lane_layout = [16], lane_data = [1]>, target_layout = #xegpu.layout<lane_layout = [16], lane_data = [1]>}> : (vector<16xi1>) -> vector<16xi1>
      "gpu.return"() : () -> ()
    }) {sym_name = "create_mask_1d"} : () -> ()
    "gpu.func"() <{function_type = () -> ()}> ({
      %76 = "vector.constant_mask"() <{mask_dim_sizes = array<i64: 4>}> : () -> vector<16xi1>
      %77 = "xegpu.convert_layout"(%76) <{input_layout = #xegpu.layout<lane_layout = [16], lane_data = [1]>, target_layout = #xegpu.layout<lane_layout = [16], lane_data = [1]>}> : (vector<16xi1>) -> vector<16xi1>
      "gpu.return"() : () -> ()
    }) {sym_name = "constant_mask_1d"} : () -> ()
    "gpu.func"() <{function_type = (index, index) -> ()}> ({
    ^bb0(%arg0: index, %arg1: index):
      %74 = "vector.create_mask"(%arg0, %arg1) : (index, index) -> vector<8x4xi1>
      %75 = "xegpu.convert_layout"(%74) <{input_layout = #xegpu.layout<lane_layout = [8, 2], lane_data = [1, 1]>, target_layout = #xegpu.layout<lane_layout = [8, 2], lane_data = [1, 1]>}> : (vector<8x4xi1>) -> vector<8x4xi1>
      "gpu.return"() : () -> ()
    }) {sym_name = "create_mask_2d"} : () -> ()
    "gpu.func"() <{function_type = () -> ()}> ({
      %72 = "vector.constant_mask"() <{mask_dim_sizes = array<i64: 2, 3>}> : () -> vector<8x4xi1>
      %73 = "xegpu.convert_layout"(%72) <{input_layout = #xegpu.layout<lane_layout = [8, 2], lane_data = [1, 1]>, target_layout = #xegpu.layout<lane_layout = [8, 2], lane_data = [1, 1]>}> : (vector<8x4xi1>) -> vector<8x4xi1>
      "gpu.return"() : () -> ()
    }) {sym_name = "constant_mask_2d"} : () -> ()
    "gpu.func"() <{function_type = () -> ()}> ({
      %68 = "arith.constant"() <{value = dense<0.000000e+00> : vector<1x16x32xf32>}> : () -> vector<1x16x32xf32>
      %69 = "arith.constant"() <{value = dense<0.000000e+00> : vector<1x32xf32>}> : () -> vector<1x32xf32>
      %70 = "vector.multi_reduction"(%68, %69) <{kind = #vector.kind<add>, reduction_dims = array<i64: 1>}> : (vector<1x16x32xf32>, vector<1x32xf32>) -> vector<1x32xf32>
      %71 = "xegpu.convert_layout"(%70) <{input_layout = #xegpu.slice<#xegpu.layout<lane_layout = [1, 1, 16], lane_data = [1, 1, 1]>, dims = [1]>, target_layout = #xegpu.slice<#xegpu.layout<lane_layout = [1, 1, 16], lane_data = [1, 1, 1]>, dims = [1]>}> : (vector<1x32xf32>) -> vector<1x32xf32>
      "gpu.return"() : () -> ()
    }) {sym_name = "vector_multi_reduction_3d_leading_unit_dim_lane_local"} : () -> ()
    "gpu.func"() <{function_type = () -> ()}> ({
      %64 = "arith.constant"() <{value = dense<0.000000e+00> : vector<1x16x2xf32>}> : () -> vector<1x16x2xf32>
      %65 = "arith.constant"() <{value = dense<0.000000e+00> : vector<1x2xf32>}> : () -> vector<1x2xf32>
      %66 = "vector.multi_reduction"(%64, %65) <{kind = #vector.kind<add>, reduction_dims = array<i64: 1>}> : (vector<1x16x2xf32>, vector<1x2xf32>) -> vector<1x2xf32>
      %67 = "xegpu.convert_layout"(%66) <{input_layout = #xegpu.slice<#xegpu.layout<lane_layout = [1, 16, 1], lane_data = [1, 1, 1]>, dims = [1]>, target_layout = #xegpu.slice<#xegpu.layout<lane_layout = [1, 16, 1], lane_data = [1, 1, 1]>, dims = [1]>}> : (vector<1x2xf32>) -> vector<1x2xf32>
      "gpu.return"() : () -> ()
    }) {sym_name = "vector_multi_reduction_3d_leading_unit_dim_cross_lane"} : () -> ()
    "gpu.func"() <{function_type = () -> ()}> ({
      %61 = "some_op"() : () -> vector<4x16xf32>
      %62 = "vector.extract"(%61) <{static_position = array<i64: 0>}> : (vector<4x16xf32>) -> vector<16xf32>
      %63 = "xegpu.convert_layout"(%62) <{input_layout = #xegpu.layout<lane_layout = [16], lane_data = [1]>, target_layout = #xegpu.layout<lane_layout = [16], lane_data = [1]>}> : (vector<16xf32>) -> vector<16xf32>
      "gpu.return"() : () -> ()
    }) {sym_name = "vector_extract_from_2d"} : () -> ()
    "gpu.func"() <{function_type = () -> ()}> ({
      %58 = "some_op"() : () -> vector<8x16xf32>
      %59 = "vector.extract"(%58) <{static_position = array<i64: 2>}> : (vector<8x16xf32>) -> vector<16xf32>
      %60 = "xegpu.convert_layout"(%59) <{input_layout = #xegpu.layout<lane_layout = [16], lane_data = [1]>, target_layout = #xegpu.layout<lane_layout = [16], lane_data = [1]>}> : (vector<16xf32>) -> vector<16xf32>
      "gpu.return"() : () -> ()
    }) {sym_name = "vector_extract_from_2d_offset2"} : () -> ()
    "gpu.func"() <{function_type = () -> ()}> ({
      %54 = "some_op"() : () -> vector<16xf32>
      %55 = "some_op"() : () -> vector<4x16xf32>
      %56 = "vector.insert"(%54, %55) <{static_position = array<i64: 0>}> : (vector<16xf32>, vector<4x16xf32>) -> vector<4x16xf32>
      %57 = "xegpu.convert_layout"(%56) <{input_layout = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>, target_layout = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>}> : (vector<4x16xf32>) -> vector<4x16xf32>
      "gpu.return"() : () -> ()
    }) {sym_name = "vector_insert_into_2d"} : () -> ()
    "gpu.func"() <{function_type = () -> ()}> ({
      %50 = "some_op"() : () -> vector<16xf32>
      %51 = "some_op"() : () -> vector<8x16xf32>
      %52 = "vector.insert"(%50, %51) <{static_position = array<i64: 2>}> : (vector<16xf32>, vector<8x16xf32>) -> vector<8x16xf32>
      %53 = "xegpu.convert_layout"(%52) <{input_layout = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>, target_layout = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>}> : (vector<8x16xf32>) -> vector<8x16xf32>
      "gpu.return"() : () -> ()
    }) {sym_name = "vector_insert_into_2d_offset2"} : () -> ()
    "gpu.func"() <{function_type = () -> ()}> ({
      %47 = "some_op"() : () -> vector<24x16xf32>
      %48 = "vector.extract_strided_slice"(%47) <{offsets = [8, 0], sizes = [8, 16], strides = [1, 1]}> : (vector<24x16xf32>) -> vector<8x16xf32>
      %49 = "xegpu.convert_layout"(%48) <{input_layout = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>, target_layout = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>}> : (vector<8x16xf32>) -> vector<8x16xf32>
      "gpu.return"() : () -> ()
    }) {sym_name = "vector_extract_strided_slice_distributed_dim_fully_extracted"} : () -> ()
    "gpu.func"() <{function_type = () -> ()}> ({
      %44 = "some_op"() : () -> vector<24x64xf32>
      %45 = "vector.extract_strided_slice"(%44) <{offsets = [8, 48], sizes = [8, 16], strides = [1, 1]}> : (vector<24x64xf32>) -> vector<8x16xf32>
      %46 = "xegpu.convert_layout"(%45) <{input_layout = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>, target_layout = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>}> : (vector<8x16xf32>) -> vector<8x16xf32>
      "gpu.return"() : () -> ()
    }) {sym_name = "vector_extract_strided_slice_inner_distributed"} : () -> ()
    "gpu.func"() <{function_type = () -> ()}> ({
      %41 = "some_op"() : () -> vector<32x16xf32>
      %42 = "vector.extract_strided_slice"(%41) <{offsets = [16], sizes = [16], strides = [1]}> : (vector<32x16xf32>) -> vector<16x16xf32>
      %43 = "xegpu.convert_layout"(%42) <{input_layout = #xegpu.layout<lane_layout = [16, 1], lane_data = [1, 1]>, target_layout = #xegpu.layout<lane_layout = [16, 1], lane_data = [1, 1]>}> : (vector<16x16xf32>) -> vector<16x16xf32>
      "gpu.return"() : () -> ()
    }) {sym_name = "vector_extract_strided_slice_outer_distributed"} : () -> ()
    "gpu.func"() <{function_type = () -> ()}> ({
      %38 = "some_op"() : () -> vector<64xf32>
      %39 = "vector.extract_strided_slice"(%38) <{offsets = [16], sizes = [32], strides = [1]}> : (vector<64xf32>) -> vector<32xf32>
      %40 = "xegpu.convert_layout"(%39) <{input_layout = #xegpu.layout<lane_layout = [16], lane_data = [1]>, target_layout = #xegpu.layout<lane_layout = [16], lane_data = [1]>}> : (vector<32xf32>) -> vector<32xf32>
      "gpu.return"() : () -> ()
    }) {sym_name = "vector_extract_strided_slice_1d"} : () -> ()
    "gpu.func"() <{function_type = () -> ()}> ({
      %35 = "some_op"() : () -> vector<24x16xf32>
      %36 = "vector.extract_strided_slice"(%35) <{offsets = [8], sizes = [8], strides = [1]}> : (vector<24x16xf32>) -> vector<8x16xf32>
      %37 = "xegpu.convert_layout"(%36) <{input_layout = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>, target_layout = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>}> : (vector<8x16xf32>) -> vector<8x16xf32>
      "gpu.return"() : () -> ()
    }) {sym_name = "vector_extract_strided_slice_partial_offsets"} : () -> ()
    "gpu.func"() <{function_type = () -> ()}> ({
      %25 = "some_op"() : () -> vector<32x16xi8>
      %26 = "xegpu.convert_layout"(%25) <{input_layout = #xegpu.layout<lane_layout = [1, 16], lane_data = [4, 1]>, target_layout = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1], order = [1, 0]>}> : (vector<32x16xi8>) -> vector<32x16xi8>
      %27 = "vector.extract_strided_slice"(%26) <{offsets = [0, 0], sizes = [8, 16], strides = [1, 1]}> : (vector<32x16xi8>) -> vector<8x16xi8>
      %28 = "vector.extract_strided_slice"(%26) <{offsets = [8, 0], sizes = [8, 16], strides = [1, 1]}> : (vector<32x16xi8>) -> vector<8x16xi8>
      %29 = "vector.extract_strided_slice"(%26) <{offsets = [16, 0], sizes = [8, 16], strides = [1, 1]}> : (vector<32x16xi8>) -> vector<8x16xi8>
      %30 = "vector.extract_strided_slice"(%26) <{offsets = [24, 0], sizes = [8, 16], strides = [1, 1]}> : (vector<32x16xi8>) -> vector<8x16xi8>
      %31 = "xegpu.convert_layout"(%27) <{input_layout = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1], order = [1, 0]>, target_layout = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1], order = [1, 0]>}> : (vector<8x16xi8>) -> vector<8x16xi8>
      %32 = "xegpu.convert_layout"(%28) <{input_layout = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1], order = [1, 0]>, target_layout = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1], order = [1, 0]>}> : (vector<8x16xi8>) -> vector<8x16xi8>
      %33 = "xegpu.convert_layout"(%29) <{input_layout = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1], order = [1, 0]>, target_layout = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1], order = [1, 0]>}> : (vector<8x16xi8>) -> vector<8x16xi8>
      %34 = "xegpu.convert_layout"(%30) <{input_layout = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1], order = [1, 0]>, target_layout = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1], order = [1, 0]>}> : (vector<8x16xi8>) -> vector<8x16xi8>
      "gpu.return"() : () -> ()
    }) {sym_name = "convert_layout_repack_lane_data"} : () -> ()
    "gpu.func"() <{function_type = () -> ()}> ({
      %21 = "some_op"() : () -> vector<16x16xf32>
      %22 = "some_op"() : () -> vector<64x16xf32>
      %23 = "vector.insert_strided_slice"(%21, %22) <{offsets = [24, 0], strides = [1, 1]}> : (vector<16x16xf32>, vector<64x16xf32>) -> vector<64x16xf32>
      %24 = "xegpu.convert_layout"(%23) <{input_layout = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>, target_layout = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>}> : (vector<64x16xf32>) -> vector<64x16xf32>
      "gpu.return"() : () -> ()
    }) {sym_name = "vector_insert_strided_slice_distributed_dim_fully_inserted"} : () -> ()
    "gpu.func"() <{function_type = () -> ()}> ({
      %17 = "some_op"() : () -> vector<16x16xf32>
      %18 = "some_op"() : () -> vector<64x32xf32>
      %19 = "vector.insert_strided_slice"(%17, %18) <{offsets = [24, 16], strides = [1, 1]}> : (vector<16x16xf32>, vector<64x32xf32>) -> vector<64x32xf32>
      %20 = "xegpu.convert_layout"(%19) <{input_layout = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>, target_layout = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>}> : (vector<64x32xf32>) -> vector<64x32xf32>
      "gpu.return"() : () -> ()
    }) {sym_name = "vector_insert_strided_slice_inner_distributed"} : () -> ()
    "gpu.func"() <{function_type = () -> ()}> ({
      %13 = "some_op"() : () -> vector<16x16xf32>
      %14 = "some_op"() : () -> vector<48x32xf32>
      %15 = "vector.insert_strided_slice"(%13, %14) <{offsets = [32, 4], strides = [1, 1]}> : (vector<16x16xf32>, vector<48x32xf32>) -> vector<48x32xf32>
      %16 = "xegpu.convert_layout"(%15) <{input_layout = #xegpu.layout<lane_layout = [16, 1], lane_data = [1, 1]>, target_layout = #xegpu.layout<lane_layout = [16, 1], lane_data = [1, 1]>}> : (vector<48x32xf32>) -> vector<48x32xf32>
      "gpu.return"() : () -> ()
    }) {sym_name = "vector_insert_strided_slice_outer_distributed"} : () -> ()
    "gpu.func"() <{function_type = () -> ()}> ({
      %9 = "some_op"() : () -> vector<16xf32>
      %10 = "some_op"() : () -> vector<48xf32>
      %11 = "vector.insert_strided_slice"(%9, %10) <{offsets = [16], strides = [1]}> : (vector<16xf32>, vector<48xf32>) -> vector<48xf32>
      %12 = "xegpu.convert_layout"(%11) <{input_layout = #xegpu.layout<lane_layout = [16], lane_data = [1]>, target_layout = #xegpu.layout<lane_layout = [16], lane_data = [1]>}> : (vector<48xf32>) -> vector<48xf32>
      "gpu.return"() : () -> ()
    }) {sym_name = "vector_insert_strided_slice_1d"} : () -> ()
    "gpu.func"() <{function_type = () -> ()}> ({
      %5 = "some_op"() : () -> vector<16xf32>
      %6 = "some_op"() : () -> vector<64x16xf32>
      %7 = "vector.insert_strided_slice"(%5, %6) <{offsets = [13, 0], strides = [1]}> : (vector<16xf32>, vector<64x16xf32>) -> vector<64x16xf32>
      %8 = "xegpu.convert_layout"(%7) <{input_layout = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>, target_layout = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>}> : (vector<64x16xf32>) -> vector<64x16xf32>
      "gpu.return"() : () -> ()
    }) {sym_name = "vector_insert_strided_slice_different_ranks"} : () -> ()
    "gpu.func"() <{function_type = () -> ()}> ({
      %0 = "some_op"() : () -> vector<16xf32>
      %1 = "some_op"() : () -> vector<1xf32>
      %2 = "xegpu.convert_layout"(%0) <{input_layout = #xegpu.layout<lane_layout = [16], lane_data = [1]>, target_layout = #xegpu.slice<#xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>, dims = [0]>}> : (vector<16xf32>) -> vector<16xf32>
      %3 = "xegpu.convert_layout"(%1) <{input_layout = #xegpu.slice<#xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>, dims = [0]>, target_layout = #xegpu.layout<lane_layout = [1], lane_data = [1]>}> : (vector<1xf32>) -> vector<1xf32>
      %4 = "xegpu.convert_layout"(%3) <{input_layout = #xegpu.layout<lane_layout = [1], lane_data = [1]>, target_layout = #xegpu.slice<#xegpu.layout<lane_layout = [1, 1, 16], lane_data = [1, 1, 1]>, dims = [0, 1]>}> : (vector<1xf32>) -> vector<1xf32>
      "gpu.return"() : () -> ()
    }) {sym_name = "convert_layout_removed_when_compatible"} : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "gpu.module"() <{sym_name = "xevm_module"}> ({
    "gpu.func"() <{function_type = () -> ()}> ({
      %0 = "some_op"() : () -> f32
      %1 = "xegpu.convert_layout"(%0) <{input_layout = #xegpu.slice<#xegpu.layout<lane_layout = [16], lane_data = [1]>, dims = [0]>, target_layout = #xegpu.slice<#xegpu.layout<lane_layout = [16], lane_data = [1]>, dims = [0]>}> : (f32) -> f32
      "some_use"(%1) : (f32) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "convert_layout_scalar"} : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "gpu.module"() <{sym_name = "xevm_module"}> ({
    "gpu.func"() <{function_type = (!xegpu.mem_desc<32x32xf32>) -> ()}> ({
    ^bb0(%arg0: !xegpu.mem_desc<32x32xf32>):
      %0 = "arith.constant"() <{value = 0 : index}> : () -> index
      %1 = "xegpu.load_matrix"(%arg0, %0, %0) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>, layout = #xegpu.layout<lane_layout = [2, 8], lane_data = [1, 1]>}> : (!xegpu.mem_desc<32x32xf32>, index, index) -> vector<2x8xf32>
      "xegpu.store_matrix"(%1, %arg0, %0, %0) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>, layout = #xegpu.layout<lane_layout = [2, 8], lane_data = [1, 1]>}> : (vector<2x8xf32>, !xegpu.mem_desc<32x32xf32>, index, index) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "load_store_matrix_1"} : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "gpu.module"() <{sym_name = "xevm_module"}> ({
    "gpu.func"() <{function_type = (!xegpu.mem_desc<32x32xf32>) -> ()}> ({
    ^bb0(%arg0: !xegpu.mem_desc<32x32xf32>):
      %0 = "arith.constant"() <{value = 0 : index}> : () -> index
      %1 = "arith.constant"() <{value = 1 : index}> : () -> index
      %2 = "xegpu.load_matrix"(%arg0, %0, %1) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>, layout = #xegpu.layout<lane_layout = [4, 4], lane_data = [2, 1]>}> : (!xegpu.mem_desc<32x32xf32>, index, index) -> vector<8x4xf32>
      "xegpu.store_matrix"(%2, %arg0, %0, %1) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>, layout = #xegpu.layout<lane_layout = [4, 4], lane_data = [2, 1]>}> : (vector<8x4xf32>, !xegpu.mem_desc<32x32xf32>, index, index) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "load_store_matrix_2"} : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "gpu.module"() <{sym_name = "xevm_module"}> ({
    "gpu.func"() <{function_type = (!xegpu.mem_desc<32x32xf32, #xegpu.mem_layout<block = [16, 1], stride = [1, 32]>>) -> ()}> ({
    ^bb0(%arg0: !xegpu.mem_desc<32x32xf32, #xegpu.mem_layout<block = [16, 1], stride = [1, 32]>>):
      %0 = "arith.constant"() <{value = 0 : index}> : () -> index
      %1 = "arith.constant"() <{value = 1 : index}> : () -> index
      %2 = "xegpu.load_matrix"(%arg0, %0, %1) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>, layout = #xegpu.layout<lane_layout = [16, 1], lane_data = [1, 1]>, subgroup_block_io}> : (!xegpu.mem_desc<32x32xf32, #xegpu.mem_layout<block = [16, 1], stride = [1, 32]>>, index, index) -> vector<16x2xf32>
      "xegpu.store_matrix"(%2, %arg0, %0, %1) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>, layout = #xegpu.layout<lane_layout = [16, 1], lane_data = [1, 1]>, subgroup_block_io}> : (vector<16x2xf32>, !xegpu.mem_desc<32x32xf32, #xegpu.mem_layout<block = [16, 1], stride = [1, 32]>>, index, index) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "load_store_matrix_3"} : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "gpu.module"() <{sym_name = "xevm_module"}> ({
    "gpu.func"() <{function_type = () -> ()}> ({
      %0 = "some_op"() : () -> vector<16x1xf16>
      %1 = "arith.negf"(%0) <{fastmath = #arith.fastmath<none>}> : (vector<16x1xf16>) -> vector<16x1xf16>
      %2 = "xegpu.convert_layout"(%1) <{input_layout = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>, target_layout = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>}> : (vector<16x1xf16>) -> vector<16x1xf16>
      "gpu.return"() : () -> ()
    }) {sym_name = "elementwise_wrap_around_dim"} : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "gpu.module"() <{sym_name = "xevm_module"}> ({
    "gpu.func"() <{function_type = () -> ()}> ({
      %0 = "vector.step"() : () -> vector<16xindex>
      %1 = "xegpu.convert_layout"(%0) <{input_layout = #xegpu.slice<#xegpu.layout<lane_layout = [1, 1, 1, 16], lane_data = [1, 1, 1, 1]>, dims = [0, 1, 2]>, target_layout = #xegpu.slice<#xegpu.layout<lane_layout = [1, 1, 1, 16], lane_data = [1, 1, 1, 1]>, dims = [0, 1, 2]>}> : (vector<16xindex>) -> vector<16xindex>
      "gpu.return"() : () -> ()
    }) {sym_name = "vector_step_slice"} : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "gpu.module"() <{sym_name = "xevm_module"}> ({
    "gpu.func"() <{function_type = () -> ()}> ({
      %0 = "vector.step"() : () -> vector<1xindex>
      %1 = "xegpu.convert_layout"(%0) <{input_layout = #xegpu.slice<#xegpu.layout<lane_layout = [1, 1, 1, 16], lane_data = [1, 1, 1, 1]>, dims = [0, 1, 3]>, target_layout = #xegpu.slice<#xegpu.layout<lane_layout = [1, 1, 1, 16], lane_data = [1, 1, 1, 1]>, dims = [0, 1, 3]>}> : (vector<1xindex>) -> vector<1xindex>
      "gpu.return"() : () -> ()
    }) {sym_name = "vector_step_slice_unit"} : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "gpu.module"() <{sym_name = "xevm_module"}> ({
    "gpu.func"() <{function_type = () -> ()}> ({
      %0 = "vector.step"() : () -> vector<16xindex>
      %1 = "xegpu.convert_layout"(%0) <{input_layout = #xegpu.slice<#xegpu.layout<lane_layout = [2, 4, 2], lane_data = [1, 2, 1]>, dims = [0, 2]>, target_layout = #xegpu.slice<#xegpu.layout<lane_layout = [2, 4, 2], lane_data = [1, 2, 1]>, dims = [0, 2]>}> : (vector<16xindex>) -> vector<16xindex>
      "gpu.return"() : () -> ()
    }) {sym_name = "vector_step_slice_multi_dist"} : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "gpu.module"() <{sym_name = "xevm_module"}> ({
    "gpu.func"() <{function_type = () -> ()}> ({
      %0 = "some_op"() : () -> vector<16xf32>
      %1 = "vector.shape_cast"(%0) : (vector<16xf32>) -> vector<1x16xf32>
      %2 = "xegpu.convert_layout"(%1) <{input_layout = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>, target_layout = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>}> : (vector<1x16xf32>) -> vector<1x16xf32>
      "gpu.return"() : () -> ()
    }) {sym_name = "vector_shapecast_rank_increasing"} : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "gpu.module"() <{sym_name = "xevm_module"}> ({
    "gpu.func"() <{function_type = () -> ()}> ({
      %0 = "some_op"() : () -> vector<1x16xf32>
      %1 = "vector.shape_cast"(%0) : (vector<1x16xf32>) -> vector<16xf32>
      %2 = "xegpu.convert_layout"(%1) <{input_layout = #xegpu.slice<#xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>, dims = [0]>, target_layout = #xegpu.slice<#xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>, dims = [0]>}> : (vector<16xf32>) -> vector<16xf32>
      "gpu.return"() : () -> ()
    }) {sym_name = "vector_shapecast_rank_reducing"} : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "gpu.module"() <{sym_name = "xevm_module"}> ({
    "gpu.func"() <{function_type = () -> ()}> ({
      %0 = "some_op"() : () -> vector<16xf32>
      %1 = "vector.shape_cast"(%0) : (vector<16xf32>) -> vector<1x16xf32>
      %2 = "xegpu.convert_layout"(%1) <{input_layout = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>, target_layout = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>}> : (vector<1x16xf32>) -> vector<1x16xf32>
      "gpu.return"() : () -> ()
    }) {sym_name = "vector_shapecast_rank_increasing_without_slicing_layout"} : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "gpu.module"() <{sym_name = "xevm_module"}> ({
    "gpu.func"() <{function_type = (index) -> ()}> ({
    ^bb0(%arg0: index):
      %0 = "some_op"() : () -> vector<16xf16>
      %1 = "vector.broadcast"(%0) : (vector<16xf16>) -> vector<16x16xf16>
      %2 = "xegpu.convert_layout"(%1) <{input_layout = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>, target_layout = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>}> : (vector<16x16xf16>) -> vector<16x16xf16>
      "gpu.return"() : () -> ()
    }) {sym_name = "vector_broadcast_1d_to_2d"} : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "gpu.module"() <{sym_name = "xevm_module"}> ({
    "gpu.func"() <{function_type = () -> ()}> ({
      %0 = "arith.constant"() <{value = dense<1.000000e+00> : vector<16x1xf16>}> : () -> vector<16x1xf16>
      %1 = "xegpu.convert_layout"(%0) <{input_layout = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>, target_layout = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>}> : (vector<16x1xf16>) -> vector<16x1xf16>
      "gpu.return"() : () -> ()
    }) {sym_name = "constant_wrap_around_dim"} : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "gpu.module"() <{sym_name = "xevm_module"}> ({
    "gpu.func"() <{function_type = (index) -> ()}> ({
    ^bb0(%arg0: index):
      %0 = "some_op"() : () -> vector<16x16xf16>
      %1 = "vector.broadcast"(%0) : (vector<16x16xf16>) -> vector<1x16x16xf16>
      %2 = "xegpu.convert_layout"(%1) <{input_layout = #xegpu.layout<lane_layout = [1, 1, 16], lane_data = [1, 1, 1]>, target_layout = #xegpu.layout<lane_layout = [1, 1, 16], lane_data = [1, 1, 1]>}> : (vector<1x16x16xf16>) -> vector<1x16x16xf16>
      "some_use"(%2) : (vector<1x16x16xf16>) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "vector_broadcast_2d_to_3d"} : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "gpu.module"() <{sym_name = "xevm_module"}> ({
    "gpu.func"() <{function_type = (index) -> ()}> ({
    ^bb0(%arg0: index):
      %0 = "some_op"() : () -> vector<16x1xf16>
      %1 = "vector.broadcast"(%0) : (vector<16x1xf16>) -> vector<16x16xf16>
      %2 = "xegpu.convert_layout"(%1) <{input_layout = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>, target_layout = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>}> : (vector<16x16xf16>) -> vector<16x16xf16>
      "some_use"(%2) : (vector<16x16xf16>) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "vector_broadcast_2d_to_2d_noop"} : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "gpu.module"() <{sym_name = "xevm_module"}> ({
    "gpu.func"() <{function_type = (index) -> ()}> ({
    ^bb0(%arg0: index):
      %0 = "some_op"() : () -> f16
      %1 = "vector.broadcast"(%0) : (f16) -> vector<16x16xf16>
      %2 = "xegpu.convert_layout"(%1) <{input_layout = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>, target_layout = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>}> : (vector<16x16xf16>) -> vector<16x16xf16>
      "some_use"(%2) : (vector<16x16xf16>) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "vector_broadcast_scalar_to_vector"} : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "gpu.module"() <{sym_name = "xevm_module"}> ({
    "gpu.func"() <{function_type = (index) -> ()}> ({
    ^bb0(%arg0: index):
      %0 = "some_op"() : () -> f16
      %1 = "vector.broadcast"(%0) : (f16) -> vector<16x16xf16>
      "some_use"(%1) : (vector<16x16xf16>) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "vector_broadcast_scalar_to_vector_uniform"} : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "gpu.module"() <{sym_name = "xevm_module"}> ({
    "gpu.func"() <{function_type = () -> ()}> ({
      %0 = "some_op"() : () -> vector<32xf32>
      %1 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
      %2 = "vector.multi_reduction"(%0, %1) <{kind = #vector.kind<add>, reduction_dims = array<i64: 0>}> : (vector<32xf32>, f32) -> f32
      %3 = "xegpu.convert_layout"(%2) <{input_layout = #xegpu.slice<#xegpu.layout<lane_layout = [16], lane_data = [1]>, dims = [0]>, target_layout = #xegpu.slice<#xegpu.layout<lane_layout = [16], lane_data = [1]>, dims = [0]>}> : (f32) -> f32
      "gpu.return"() : () -> ()
    }) {sym_name = "vector_multi_reduction_1d_to_scalar"} : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "gpu.module"() <{sym_name = "xevm_module"}> ({
    "gpu.func"() <{function_type = () -> ()}> ({
      %0 = "arith.constant"() <{value = dense<2.000000e+00> : vector<8x2xf32>}> : () -> vector<8x2xf32>
      %1 = "arith.constant"() <{value = dense<3.000000e+00> : vector<8x2xf32>}> : () -> vector<8x2xf32>
      %2 = "vector.interleave"(%0, %1) : (vector<8x2xf32>, vector<8x2xf32>) -> vector<8x4xf32>
      %3 = "xegpu.convert_layout"(%2) <{input_layout = #xegpu.layout<lane_layout = [8, 2], lane_data = [1, 2]>, target_layout = #xegpu.layout<lane_layout = [8, 2], lane_data = [1, 2]>}> : (vector<8x4xf32>) -> vector<8x4xf32>
      "gpu.return"() : () -> ()
    }) {sym_name = "vector_interleave"} : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "gpu.module"() <{sym_name = "xevm_module"}> ({
    "gpu.func"() <{function_type = () -> ()}> ({
      %0 = "arith.constant"() <{value = dense<3.000000e+00> : vector<8x4xf32>}> : () -> vector<8x4xf32>
      %1:2 = "vector.deinterleave"(%0) : (vector<8x4xf32>) -> (vector<8x2xf32>, vector<8x2xf32>)
      %2 = "xegpu.convert_layout"(%1#0) <{input_layout = #xegpu.layout<lane_layout = [8, 2], lane_data = [1, 1]>, target_layout = #xegpu.layout<lane_layout = [8, 2], lane_data = [1, 1]>}> : (vector<8x2xf32>) -> vector<8x2xf32>
      "gpu.return"() : () -> ()
    }) {sym_name = "vector_deinterleave"} : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "gpu.module"() <{sym_name = "xevm_module"}> ({
    "gpu.func"() <{function_type = (!xegpu.mem_desc<8x8xf16>, !xegpu.mem_desc<8x8xf16>) -> ()}> ({
    ^bb0(%arg0: !xegpu.mem_desc<8x8xf16>, %arg1: !xegpu.mem_desc<8x8xf16>):
      %0 = "arith.constant"() <{value = dense<3.000000e+00> : vector<8x16xf8E4M3FN>}> : () -> vector<8x16xf8E4M3FN>
      %1 = "arith.constant"() <{value = dense<3.000000e+00> : vector<16x16xf8E4M3FN>}> : () -> vector<16x16xf8E4M3FN>
      %2 = "arith.constant"() <{value = dense<1.000000e+00> : vector<8x2xf8E8M0FNU>}> : () -> vector<8x2xf8E8M0FNU>
      %3 = "arith.constant"() <{value = dense<5.000000e-01> : vector<2x16xf8E8M0FNU>}> : () -> vector<2x16xf8E8M0FNU>
      %4 = "xegpu.dpas_mx"(%0, %1, %2, %3) <{layout_a = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>, layout_a_scale = #xegpu.layout<lane_layout = [8, 1], lane_data = [1, 1]>, layout_b = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>, layout_b_scale = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>, layout_cd = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>, operandSegmentSizes = array<i32: 1, 1, 0, 1, 1>}> : (vector<8x16xf8E4M3FN>, vector<16x16xf8E4M3FN>, vector<8x2xf8E8M0FNU>, vector<2x16xf8E8M0FNU>) -> vector<8x16xf32>
      %5 = "xegpu.convert_layout"(%4) <{input_layout = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>, target_layout = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>}> : (vector<8x16xf32>) -> vector<8x16xf32>
      "gpu.return"() : () -> ()
    }) {sym_name = "xegpu_dpas_mx"} : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "gpu.module"() <{sym_name = "xevm_module"}> ({
    "gpu.func"() <{function_type = () -> ()}> ({
      %0 = "arith.constant"() <{value = dense<1.000000e+00> : vector<8x64xf4E2M1FN>}> : () -> vector<8x64xf4E2M1FN>
      %1 = "arith.constant"() <{value = dense<1.000000e+00> : vector<64x16xf4E2M1FN>}> : () -> vector<64x16xf4E2M1FN>
      %2 = "arith.constant"() <{value = dense<1.000000e+00> : vector<2x16xf8E8M0FNU>}> : () -> vector<2x16xf8E8M0FNU>
      %3 = "arith.constant"() <{value = dense<1.000000e+00> : vector<16x4xf8E8M0FNU>}> : () -> vector<16x4xf8E8M0FNU>
      %4 = "xegpu.convert_layout"(%3) <{input_layout = #xegpu.layout<lane_layout = [16, 1], lane_data = [1, 1]>, target_layout = #xegpu.layout<lane_layout = [8, 1], lane_data = [1, 1]>}> : (vector<16x4xf8E8M0FNU>) -> vector<16x4xf8E8M0FNU>
      %5 = "vector.extract_strided_slice"(%4) <{offsets = [0, 0], sizes = [8, 2], strides = [1, 1]}> : (vector<16x4xf8E8M0FNU>) -> vector<8x2xf8E8M0FNU>
      %6 = "vector.extract_strided_slice"(%4) <{offsets = [8, 0], sizes = [8, 2], strides = [1, 1]}> : (vector<16x4xf8E8M0FNU>) -> vector<8x2xf8E8M0FNU>
      %7 = "xegpu.dpas_mx"(%0, %1, %5, %2) <{layout_a = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>, layout_a_scale = #xegpu.layout<lane_layout = [8, 1], lane_data = [1, 1]>, layout_b = #xegpu.layout<lane_layout = [1, 16], lane_data = [8, 1]>, layout_b_scale = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>, layout_cd = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>, operandSegmentSizes = array<i32: 1, 1, 0, 1, 1>}> : (vector<8x64xf4E2M1FN>, vector<64x16xf4E2M1FN>, vector<8x2xf8E8M0FNU>, vector<2x16xf8E8M0FNU>) -> vector<8x16xf32>
      %8 = "xegpu.dpas_mx"(%0, %1, %6, %2) <{layout_a = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>, layout_a_scale = #xegpu.layout<lane_layout = [8, 1], lane_data = [1, 1]>, layout_b = #xegpu.layout<lane_layout = [1, 16], lane_data = [8, 1]>, layout_b_scale = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>, layout_cd = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>, operandSegmentSizes = array<i32: 1, 1, 0, 1, 1>}> : (vector<8x64xf4E2M1FN>, vector<64x16xf4E2M1FN>, vector<8x2xf8E8M0FNU>, vector<2x16xf8E8M0FNU>) -> vector<8x16xf32>
      "gpu.return"() : () -> ()
    }) {sym_name = "convert_layout_partial_subgroup"} : () -> ()
  }) : () -> ()
}) : () -> ()

