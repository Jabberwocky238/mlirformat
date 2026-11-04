"builtin.module"() ({
  "gpu.module"() <{sym_name = "test_distribution"}> ({
    "gpu.func"() <{function_type = (memref<256x128xf32>) -> ()}> ({
    ^bb0(%arg41: memref<256x128xf32>):
      %127 = "xegpu.create_nd_tdesc"(%arg41) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>}> : (memref<256x128xf32>) -> !xegpu.tensor_desc<256x128xf32, #xegpu.layout<sg_layout = [8, 4], sg_data = [32, 32], lane_layout = [1, 16], lane_data = [1, 1]>>
      "gpu.return"() : () -> ()
    }) {sym_name = "create_nd_tdesc_no_offset", workgroup_attributions = 0 : i64} : () -> ()
    "gpu.func"() <{function_type = (ui64, index, index, index, index) -> ()}> ({
    ^bb0(%arg36: ui64, %arg37: index, %arg38: index, %arg39: index, %arg40: index):
      %125 = "arith.constant"() <{value = 1 : index}> : () -> index
      %126 = "xegpu.create_nd_tdesc"(%arg36, %arg38, %arg37, %arg37, %125) <{const_shape = array<i64: -9223372036854775808, -9223372036854775808>, const_strides = array<i64: -9223372036854775808, -9223372036854775808>, operandSegmentSizes = array<i32: 1, 0, 2, 2>}> : (ui64, index, index, index, index) -> !xegpu.tensor_desc<256x128xf32, #xegpu.layout<sg_layout = [8, 4], sg_data = [32, 32], lane_layout = [1, 16], lane_data = [1, 1]>>
      "gpu.return"() : () -> ()
    }) {sym_name = "create_nd_tdesc_with_ptr", workgroup_attributions = 0 : i64} : () -> ()
    "gpu.func"() <{function_type = (memref<256x128xf32>) -> ()}> ({
    ^bb0(%arg35: memref<256x128xf32>):
      %123 = "xegpu.create_nd_tdesc"(%arg35) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>}> : (memref<256x128xf32>) -> !xegpu.tensor_desc<256x128xf32, #xegpu.layout<sg_layout = [8, 4], sg_data = [32, 32], lane_layout = [1, 16], lane_data = [1, 1]>>
      %124 = "xegpu.load_nd"(%123) <{const_offsets = array<i64: 0, 0>, layout = #xegpu.layout<sg_layout = [8, 4], sg_data = [32, 32], lane_layout = [1, 16], lane_data = [1, 1]>}> : (!xegpu.tensor_desc<256x128xf32, #xegpu.layout<sg_layout = [8, 4], sg_data = [32, 32], lane_layout = [1, 16], lane_data = [1, 1]>>) -> vector<256x128xf32>
      "gpu.return"() : () -> ()
    }) {sym_name = "load_nd_tdesc_with_offset", workgroup_attributions = 0 : i64} : () -> ()
    "gpu.func"() <{function_type = (memref<256x128xf32>) -> ()}> ({
    ^bb0(%arg34: memref<256x128xf32>):
      %121 = "xegpu.create_nd_tdesc"(%arg34) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>}> : (memref<256x128xf32>) -> !xegpu.tensor_desc<256x128xf32, #xegpu.layout<sg_layout = [8, 4], sg_data = [32, 32], lane_layout = [1, 16], lane_data = [1, 1]>>
      %122 = "xegpu.load_nd"(%121) <{const_offsets = array<i64: 0, 0>, layout = #xegpu.layout<sg_layout = [8, 4], sg_data = [32, 32], lane_layout = [1, 16], lane_data = [1, 1]>}> : (!xegpu.tensor_desc<256x128xf32, #xegpu.layout<sg_layout = [8, 4], sg_data = [32, 32], lane_layout = [1, 16], lane_data = [1, 1]>>) -> vector<256x128xf32>
      "xegpu.store_nd"(%122, %121) <{const_offsets = array<i64: 0, 0>}> : (vector<256x128xf32>, !xegpu.tensor_desc<256x128xf32, #xegpu.layout<sg_layout = [8, 4], sg_data = [32, 32], lane_layout = [1, 16], lane_data = [1, 1]>>) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "store_nd_with_offsets", workgroup_attributions = 0 : i64} : () -> ()
    "gpu.func"() <{function_type = (memref<256x128xf32>) -> ()}> ({
    ^bb0(%arg33: memref<256x128xf32>):
      %119 = "arith.constant"() <{value = 0 : index}> : () -> index
      %120 = "xegpu.create_nd_tdesc"(%arg33) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>}> : (memref<256x128xf32>) -> !xegpu.tensor_desc<256x128xf32, #xegpu.layout<sg_layout = [8, 4], sg_data = [32, 32], lane_layout = [1, 16], lane_data = [1, 1]>>
      "xegpu.prefetch_nd"(%120, %119, %119) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>}> : (!xegpu.tensor_desc<256x128xf32, #xegpu.layout<sg_layout = [8, 4], sg_data = [32, 32], lane_layout = [1, 16], lane_data = [1, 1]>>, index, index) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "prefetch_nd_tdesc_with_offset", workgroup_attributions = 0 : i64} : () -> ()
    "gpu.func"() <{function_type = (memref<128x128xf16>, memref<128x128xf16>) -> ()}> ({
    ^bb0(%arg31: memref<128x128xf16>, %arg32: memref<128x128xf16>):
      %114 = "xegpu.create_nd_tdesc"(%arg31) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>}> : (memref<128x128xf16>) -> !xegpu.tensor_desc<128x128xf16, #xegpu.layout<sg_layout = [8, 8], sg_data = [16, 128], lane_layout = [1, 16], lane_data = [1, 1]>>
      %115 = "xegpu.load_nd"(%114) <{const_offsets = array<i64: 0, 0>, layout = #xegpu.layout<sg_layout = [8, 8], sg_data = [16, 128], lane_layout = [1, 16], lane_data = [1, 1]>}> : (!xegpu.tensor_desc<128x128xf16, #xegpu.layout<sg_layout = [8, 8], sg_data = [16, 128], lane_layout = [1, 16], lane_data = [1, 1]>>) -> vector<128x128xf16>
      %116 = "xegpu.create_nd_tdesc"(%arg32) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>}> : (memref<128x128xf16>) -> !xegpu.tensor_desc<128x128xf16, #xegpu.layout<sg_layout = [8, 8], sg_data = [128, 16], lane_layout = [1, 16], lane_data = [2, 1]>>
      %117 = "xegpu.load_nd"(%116) <{const_offsets = array<i64: 0, 0>, layout = #xegpu.layout<sg_layout = [8, 8], sg_data = [128, 16], lane_layout = [1, 16], lane_data = [2, 1]>}> : (!xegpu.tensor_desc<128x128xf16, #xegpu.layout<sg_layout = [8, 8], sg_data = [128, 16], lane_layout = [1, 16], lane_data = [2, 1]>>) -> vector<128x128xf16>
      %118 = "xegpu.dpas"(%115, %117) <{layout_a = #xegpu.layout<sg_layout = [8, 8], sg_data = [16, 128], lane_layout = [1, 16], lane_data = [1, 1]>, layout_b = #xegpu.layout<sg_layout = [8, 8], sg_data = [128, 16], lane_layout = [1, 16], lane_data = [2, 1]>, layout_cd = #xegpu.layout<sg_layout = [8, 8], sg_data = [16, 16], lane_layout = [1, 16], lane_data = [1, 1]>}> : (vector<128x128xf16>, vector<128x128xf16>) -> vector<128x128xf32>
      "gpu.return"() : () -> ()
    }) {sym_name = "dpas", workgroup_attributions = 0 : i64} : () -> ()
    "gpu.func"() <{function_type = (memref<128x128xf16>, memref<128x128xf16>) -> ()}> ({
    ^bb0(%arg29: memref<128x128xf16>, %arg30: memref<128x128xf16>):
      %109 = "xegpu.create_nd_tdesc"(%arg29) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>}> : (memref<128x128xf16>) -> !xegpu.tensor_desc<128x128xf16, #xegpu.layout<sg_layout = [8, 8], lane_layout = [1, 16], lane_data = [1, 1], order = [1, 0]>>
      %110 = "xegpu.load_nd"(%109) <{const_offsets = array<i64: 0, 0>, layout = #xegpu.layout<sg_layout = [8, 8], lane_layout = [1, 16], lane_data = [1, 1], order = [1, 0]>}> : (!xegpu.tensor_desc<128x128xf16, #xegpu.layout<sg_layout = [8, 8], lane_layout = [1, 16], lane_data = [1, 1], order = [1, 0]>>) -> vector<128x128xf16>
      %111 = "xegpu.create_nd_tdesc"(%arg30) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>}> : (memref<128x128xf16>) -> !xegpu.tensor_desc<128x128xf16, #xegpu.layout<sg_layout = [8, 8], lane_layout = [1, 16], lane_data = [2, 1], order = [1, 0]>>
      %112 = "xegpu.load_nd"(%111) <{const_offsets = array<i64: 0, 0>, layout = #xegpu.layout<sg_layout = [8, 8], lane_layout = [1, 16], lane_data = [2, 1], order = [1, 0]>}> : (!xegpu.tensor_desc<128x128xf16, #xegpu.layout<sg_layout = [8, 8], lane_layout = [1, 16], lane_data = [2, 1], order = [1, 0]>>) -> vector<128x128xf16>
      %113 = "xegpu.dpas"(%110, %112) <{layout_a = #xegpu.layout<sg_layout = [8, 8], lane_layout = [1, 16], lane_data = [1, 1], order = [1, 0]>, layout_b = #xegpu.layout<sg_layout = [8, 8], lane_layout = [1, 16], lane_data = [2, 1], order = [1, 0]>, layout_cd = #xegpu.layout<sg_layout = [8, 8], lane_layout = [1, 16], lane_data = [1, 1], order = [1, 0]>}> : (vector<128x128xf16>, vector<128x128xf16>) -> vector<128x128xf32>
      "gpu.return"() : () -> ()
    }) {sym_name = "dpas_no_sg_data", workgroup_attributions = 0 : i64} : () -> ()
    "gpu.func"() <{function_type = (vector<256x128xf32>, vector<128x256xf32>) -> ()}> ({
    ^bb0(%arg27: vector<256x128xf32>, %arg28: vector<128x256xf32>):
      %108 = "xegpu.dpas"(%arg27, %arg28) <{layout_a = #xegpu.layout<sg_layout = [8, 8], sg_data = [16, 128], lane_layout = [1, 16], lane_data = [1, 1]>, layout_b = #xegpu.layout<sg_layout = [8, 8], sg_data = [128, 16], lane_layout = [1, 16], lane_data = [1, 1]>, layout_cd = #xegpu.layout<sg_layout = [8, 8], sg_data = [16, 16], lane_layout = [1, 16], lane_data = [1, 1]>}> : (vector<256x128xf32>, vector<128x256xf32>) -> vector<256x256xf32>
      "gpu.return"() : () -> ()
    }) {sym_name = "dpas_with_no_create_nd_desc", workgroup_attributions = 0 : i64} : () -> ()
    "gpu.func"() <{function_type = (memref<256x1xf32>) -> ()}> ({
    ^bb0(%arg26: memref<256x1xf32>):
      %105 = "xegpu.create_nd_tdesc"(%arg26) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>}> : (memref<256x1xf32>) -> !xegpu.tensor_desc<256x1xf32, #xegpu.layout<sg_layout = [8, 1], sg_data = [32, 1], lane_layout = [8, 1], lane_data = [1, 1]>>
      %106 = "xegpu.load_nd"(%105) <{const_offsets = array<i64: 0, 0>, layout = #xegpu.layout<sg_layout = [8, 1], sg_data = [32, 1], lane_layout = [8, 1], lane_data = [1, 1]>}> : (!xegpu.tensor_desc<256x1xf32, #xegpu.layout<sg_layout = [8, 1], sg_data = [32, 1], lane_layout = [8, 1], lane_data = [1, 1]>>) -> vector<256x1xf32>
      %107 = "vector.broadcast"(%106) {layout_result_0 = #xegpu.layout<sg_layout = [8, 1], sg_data = [32, 32], lane_layout = [8, 1], lane_data = [1, 1]>} : (vector<256x1xf32>) -> vector<256x32xf32>
      "gpu.return"() : () -> ()
    }) {sym_name = "broadcast_dim1", workgroup_attributions = 0 : i64} : () -> ()
    "gpu.func"() <{function_type = (memref<1x128xf32>) -> ()}> ({
    ^bb0(%arg25: memref<1x128xf32>):
      %102 = "xegpu.create_nd_tdesc"(%arg25) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>}> : (memref<1x128xf32>) -> !xegpu.tensor_desc<1x128xf32, #xegpu.layout<sg_layout = [1, 4], sg_data = [1, 32], lane_layout = [1, 16], lane_data = [1, 1]>>
      %103 = "xegpu.load_nd"(%102) <{const_offsets = array<i64: 0, 0>, layout = #xegpu.layout<sg_layout = [1, 4], sg_data = [1, 32], lane_layout = [1, 16], lane_data = [1, 1]>}> : (!xegpu.tensor_desc<1x128xf32, #xegpu.layout<sg_layout = [1, 4], sg_data = [1, 32], lane_layout = [1, 16], lane_data = [1, 1]>>) -> vector<1x128xf32>
      %104 = "vector.broadcast"(%103) {layout_result_0 = #xegpu.layout<sg_layout = [1, 4], sg_data = [32, 32], lane_layout = [1, 16], lane_data = [1, 1]>} : (vector<1x128xf32>) -> vector<32x128xf32>
      "gpu.return"() : () -> ()
    }) {sym_name = "broadcast_dim0", workgroup_attributions = 0 : i64} : () -> ()
    "gpu.func"() <{function_type = (memref<1024x1024xf16>, memref<1024x1024xf16>, memref<1024x1024xf32>) -> ()}> ({
    ^bb0(%arg18: memref<1024x1024xf16>, %arg19: memref<1024x1024xf16>, %arg20: memref<1024x1024xf32>):
      %85 = "arith.constant"() <{value = 0 : index}> : () -> index
      %86 = "arith.constant"() <{value = 128 : index}> : () -> index
      %87 = "arith.constant"() <{value = 1024 : index}> : () -> index
      %88 = "gpu.block_id"() <{dimension = #gpu<dim x>}> : () -> index
      %89 = "gpu.block_id"() <{dimension = #gpu<dim y>}> : () -> index
      %90 = "arith.muli"(%88, %86) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
      %91 = "arith.muli"(%89, %86) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
      %92 = "xegpu.create_nd_tdesc"(%arg20) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>}> : (memref<1024x1024xf32>) -> !xegpu.tensor_desc<128x128xf32, #xegpu.layout<sg_layout = [8, 8], sg_data = [16, 16]>>
      %93 = "xegpu.create_nd_tdesc"(%arg18) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>}> : (memref<1024x1024xf16>) -> !xegpu.tensor_desc<128x128xf16, #xegpu.layout<sg_layout = [8, 8], sg_data = [16, 128]>>
      %94 = "xegpu.create_nd_tdesc"(%arg19) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>}> : (memref<1024x1024xf16>) -> !xegpu.tensor_desc<128x128xf16, #xegpu.layout<sg_layout = [8, 8], sg_data = [128, 16]>>
      %95 = "xegpu.load_nd"(%92, %90, %91) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>, layout = #xegpu.layout<sg_layout = [8, 8], sg_data = [16, 16]>}> : (!xegpu.tensor_desc<128x128xf32, #xegpu.layout<sg_layout = [8, 8], sg_data = [16, 16]>>, index, index) -> vector<128x128xf32>
      %96 = "xegpu.load_nd"(%93, %90, %85) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>, layout = #xegpu.layout<sg_layout = [8, 8], sg_data = [16, 128]>}> : (!xegpu.tensor_desc<128x128xf16, #xegpu.layout<sg_layout = [8, 8], sg_data = [16, 128]>>, index, index) -> vector<128x128xf16>
      %97 = "xegpu.load_nd"(%94, %85, %91) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>, layout = #xegpu.layout<sg_layout = [8, 8], sg_data = [128, 16]>}> : (!xegpu.tensor_desc<128x128xf16, #xegpu.layout<sg_layout = [8, 8], sg_data = [128, 16]>>, index, index) -> vector<128x128xf16>
      %98:3 = "scf.for"(%85, %87, %86, %96, %97, %95) ({
      ^bb0(%arg21: index, %arg22: vector<128x128xf16>, %arg23: vector<128x128xf16>, %arg24: vector<128x128xf32>):
        %99 = "xegpu.dpas"(%arg22, %arg23, %arg24) <{layout_a = #xegpu.layout<sg_layout = [8, 8], sg_data = [16, 128]>, layout_b = #xegpu.layout<sg_layout = [8, 8], sg_data = [128, 16]>, layout_cd = #xegpu.layout<sg_layout = [8, 8], sg_data = [16, 16]>}> : (vector<128x128xf16>, vector<128x128xf16>, vector<128x128xf32>) -> vector<128x128xf32>
        %100 = "xegpu.load_nd"(%93, %arg21, %85) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>, layout = #xegpu.layout<sg_layout = [8, 8], sg_data = [16, 128]>}> : (!xegpu.tensor_desc<128x128xf16, #xegpu.layout<sg_layout = [8, 8], sg_data = [16, 128]>>, index, index) -> vector<128x128xf16>
        %101 = "xegpu.load_nd"(%94, %85, %arg21) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>, layout = #xegpu.layout<sg_layout = [8, 8], sg_data = [128, 16]>}> : (!xegpu.tensor_desc<128x128xf16, #xegpu.layout<sg_layout = [8, 8], sg_data = [128, 16]>>, index, index) -> vector<128x128xf16>
        "scf.yield"(%100, %101, %99) : (vector<128x128xf16>, vector<128x128xf16>, vector<128x128xf32>) -> ()
      }) : (index, index, index, vector<128x128xf16>, vector<128x128xf16>, vector<128x128xf32>) -> (vector<128x128xf16>, vector<128x128xf16>, vector<128x128xf32>)
      "xegpu.store_nd"(%98#2, %92, %90, %91) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>}> : (vector<128x128xf32>, !xegpu.tensor_desc<128x128xf32, #xegpu.layout<sg_layout = [8, 8], sg_data = [16, 16]>>, index, index) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "gemm_with_load_store_offset", workgroup_attributions = 0 : i64} : () -> ()
    "gpu.func"() <{function_type = (memref<256x128xf32>, memref<128x256xf32>, memref<128x64xf32>) -> ()}> ({
    ^bb0(%arg15: memref<256x128xf32>, %arg16: memref<128x256xf32>, %arg17: memref<128x64xf32>):
      %68 = "gpu.subgroup_id"() : () -> index
      %69 = "arith.constant"() <{value = 0 : index}> : () -> index
      %70 = "arith.constant"() <{value = 1 : index}> : () -> index
      %71 = "arith.constant"() <{value = 2 : index}> : () -> index
      %72 = "arith.constant"() <{value = 31 : index}> : () -> index
      %73 = "arith.constant"() <{value = 3 : index}> : () -> index
      %74 = "arith.cmpi"(%68, %69) <{predicate = 5 : i64}> : (index, index) -> i1
      %75 = "arith.cmpi"(%68, %70) <{predicate = 2 : i64}> : (index, index) -> i1
      %76 = "arith.andi"(%74, %75) : (i1, i1) -> i1
      "scf.if"(%76) ({
        %83 = "xegpu.create_nd_tdesc"(%arg15) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>}> : (memref<256x128xf32>) -> !xegpu.tensor_desc<256x128xf32, #xegpu.layout<sg_layout = [8, 4], sg_data = [32, 32], lane_layout = [8, 4], lane_data = [1, 1]>>
        %84 = "xegpu.load_nd"(%83) <{const_offsets = array<i64: 0, 0>, layout = #xegpu.layout<sg_layout = [8, 4], sg_data = [32, 32], lane_layout = [8, 4], lane_data = [1, 1]>}> : (!xegpu.tensor_desc<256x128xf32, #xegpu.layout<sg_layout = [8, 4], sg_data = [32, 32], lane_layout = [8, 4], lane_data = [1, 1]>>) -> vector<256x128xf32>
        "scf.yield"() : () -> ()
      }, {
      }) {sg_id_range = #xegpu.range<[0 : i64, 32 : i64]>} : (i1) -> ()
      %77 = "arith.cmpi"(%68, %71) <{predicate = 5 : i64}> : (index, index) -> i1
      %78 = "arith.cmpi"(%68, %72) <{predicate = 2 : i64}> : (index, index) -> i1
      %79 = "arith.andi"(%77, %78) : (i1, i1) -> i1
      "scf.if"(%79) ({
        %80 = "xegpu.create_nd_tdesc"(%arg17) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>}> : (memref<128x64xf32>) -> !xegpu.tensor_desc<128x64xf32, #xegpu.layout<sg_layout = [4, 4], sg_data = [32, 16], lane_layout = [8, 4], lane_data = [1, 1]>>
        %81 = "xegpu.load_nd"(%80) <{const_offsets = array<i64: 0, 0>, layout = #xegpu.layout<sg_layout = [4, 4], sg_data = [32, 16], lane_layout = [8, 4], lane_data = [1, 1]>}> : (!xegpu.tensor_desc<128x64xf32, #xegpu.layout<sg_layout = [4, 4], sg_data = [32, 16], lane_layout = [8, 4], lane_data = [1, 1]>>) -> vector<128x64xf32>
        %82 = "math.exp"(%81) <{fastmath = #arith.fastmath<none>}> {layout_result_0 = #xegpu.layout<sg_layout = [4, 4], sg_data = [32, 16], lane_layout = [8, 4], lane_data = [1, 1]>} : (vector<128x64xf32>) -> vector<128x64xf32>
        "scf.yield"() : () -> ()
      }, {
      }) {sg_id_range = #xegpu.range<[2 : i64, 18 : i64]>} : (i1) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "subgroup_id_range", workgroup_attributions = 0 : i64} : () -> ()
    "gpu.func"() <{function_type = (memref<256x128xf32>, memref<128x64xf32>) -> ()}> ({
    ^bb0(%arg13: memref<256x128xf32>, %arg14: memref<128x64xf32>):
      %56 = "gpu.subgroup_id"() : () -> index
      %57 = "arith.constant"() <{value = true}> : () -> i1
      %58 = "arith.constant"() <{value = 3 : index}> : () -> index
      %59 = "arith.constant"() <{value = 32 : index}> : () -> index
      %60 = "xegpu.create_nd_tdesc"(%arg13) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>}> : (memref<256x128xf32>) -> !xegpu.tensor_desc<256x128xf32, #xegpu.layout<sg_layout = [8, 4], sg_data = [32, 32], lane_layout = [8, 4], lane_data = [1, 1]>>
      %61 = "xegpu.load_nd"(%60) <{const_offsets = array<i64: 0, 0>, layout = #xegpu.layout<sg_layout = [8, 4], sg_data = [32, 32], lane_layout = [8, 4], lane_data = [1, 1]>}> : (!xegpu.tensor_desc<256x128xf32, #xegpu.layout<sg_layout = [8, 4], sg_data = [32, 32], lane_layout = [8, 4], lane_data = [1, 1]>>) -> vector<256x128xf32>
      %62 = "arith.cmpi"(%56, %58) <{predicate = 5 : i64}> : (index, index) -> i1
      %63 = "arith.cmpi"(%56, %59) <{predicate = 2 : i64}> : (index, index) -> i1
      %64 = "arith.andi"(%62, %63) : (i1, i1) -> i1
      "scf.if"(%57) ({
        "scf.if"(%64) ({
          %65 = "xegpu.create_nd_tdesc"(%arg14) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>}> : (memref<128x64xf32>) -> !xegpu.tensor_desc<128x64xf32, #xegpu.layout<sg_layout = [4, 4], sg_data = [32, 16], lane_layout = [8, 4], lane_data = [1, 1]>>
          %66 = "xegpu.load_nd"(%65) <{const_offsets = array<i64: 0, 0>, layout = #xegpu.layout<sg_layout = [4, 4], sg_data = [32, 16], lane_layout = [8, 4], lane_data = [1, 1]>}> : (!xegpu.tensor_desc<128x64xf32, #xegpu.layout<sg_layout = [4, 4], sg_data = [32, 16], lane_layout = [8, 4], lane_data = [1, 1]>>) -> vector<128x64xf32>
          %67 = "math.exp"(%66) <{fastmath = #arith.fastmath<none>}> {layout_result_0 = #xegpu.layout<sg_layout = [4, 4], sg_data = [32, 16], lane_layout = [8, 4], lane_data = [1, 1]>} : (vector<128x64xf32>) -> vector<128x64xf32>
          "scf.yield"() : () -> ()
        }, {
        }) : (i1) -> ()
        "scf.yield"() : () -> ()
      }, {
      }) {sg_id_range = #xegpu.range<[3 : i64, 19 : i64]>} : (i1) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "subgroup_id_range_nested_if", workgroup_attributions = 0 : i64} : () -> ()
    "gpu.func"() <{function_type = (memref<?xf16>) -> ()}> ({
    ^bb0(%arg12: memref<?xf16>):
      %53 = "arith.constant"() <{value = dense<0> : vector<256x16xindex>}> {layout_result_0 = #xegpu.layout<sg_layout = [8, 4], sg_data = [32, 4]>} : () -> vector<256x16xindex>
      %54 = "arith.constant"() <{value = dense<true> : vector<256x16xi1>}> {layout_result_0 = #xegpu.layout<sg_layout = [8, 4], sg_data = [32, 4]>} : () -> vector<256x16xi1>
      %55 = "xegpu.load"(%arg12, %53, %54) <{chunk_size = 1 : i64, l1_hint = #xegpu.cache_hint<cached>, layout = #xegpu.layout<sg_layout = [8, 4], sg_data = [32, 4]>}> : (memref<?xf16>, vector<256x16xindex>, vector<256x16xi1>) -> vector<256x16xf16>
      "gpu.return"() : () -> ()
    }) {sym_name = "load_gather", workgroup_attributions = 0 : i64} : () -> ()
    "gpu.func"() <{function_type = (memref<256xf16>) -> ()}> ({
    ^bb0(%arg11: memref<256xf16>):
      %50 = "arith.constant"() <{value = dense<2.550000e+01> : vector<256xf16>}> {layout_result_0 = #xegpu.layout<sg_layout = [32], sg_data = [8], inst_data = [8]>} : () -> vector<256xf16>
      %51 = "arith.constant"() <{value = dense<0> : vector<256xindex>}> {layout_result_0 = #xegpu.layout<sg_layout = [32], sg_data = [8], inst_data = [8]>} : () -> vector<256xindex>
      %52 = "arith.constant"() <{value = dense<true> : vector<256xi1>}> {layout_result_0 = #xegpu.layout<sg_layout = [32], sg_data = [8], inst_data = [8]>} : () -> vector<256xi1>
      "xegpu.store"(%50, %arg11, %51, %52) <{chunk_size = 1 : i64, l1_hint = #xegpu.cache_hint<cached>, layout = #xegpu.layout<sg_layout = [32], sg_data = [8], inst_data = [8]>}> {layout_operand_2 = #xegpu.layout<sg_layout = [32], sg_data = [8], inst_data = [8]>, layout_operand_3 = #xegpu.layout<sg_layout = [32], sg_data = [8], inst_data = [8]>} : (vector<256xf16>, memref<256xf16>, vector<256xindex>, vector<256xi1>) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "store_scatter", workgroup_attributions = 0 : i64} : () -> ()
    "gpu.func"() <{function_type = (memref<?xf16>) -> ()}> ({
    ^bb0(%arg10: memref<?xf16>):
      %47 = "arith.constant"() <{value = dense<0> : vector<256xindex>}> {layout_result_0 = #xegpu.layout<sg_layout = [32], sg_data = [8]>} : () -> vector<256xindex>
      %48 = "arith.constant"() <{value = dense<true> : vector<256xi1>}> {layout_result_0 = #xegpu.layout<sg_layout = [32], sg_data = [8]>} : () -> vector<256xi1>
      %49 = "xegpu.load"(%arg10, %47, %48) <{chunk_size = 4 : i64, l1_hint = #xegpu.cache_hint<cached>, layout = #xegpu.layout<sg_layout = [32, 1], sg_data = [8, 4]>}> : (memref<?xf16>, vector<256xindex>, vector<256xi1>) -> vector<256x4xf16>
      "gpu.return"() : () -> ()
    }) {sym_name = "load_with_non_unit_chunk_size", workgroup_attributions = 0 : i64} : () -> ()
    "gpu.func"() <{function_type = (memref<32768xi8, 3>) -> ()}> ({
    ^bb0(%arg9: memref<32768xi8, 3>):
      %45 = "xegpu.create_mem_desc"(%arg9) : (memref<32768xi8, 3>) -> !xegpu.mem_desc<64x128xf32>
      %46 = "xegpu.load_matrix"(%45) <{const_offsets = array<i64: 0, 0>, layout = #xegpu.layout<sg_layout = [2, 4], sg_data = [32, 32], lane_layout = [2, 8], lane_data = [1, 1]>}> : (!xegpu.mem_desc<64x128xf32>) -> vector<64x128xf32>
      "gpu.return"() : () -> ()
    }) {sym_name = "distribute_load_matrix", workgroup_attributions = 0 : i64} : () -> ()
    "gpu.func"() <{function_type = (memref<32768xi8, 3>) -> ()}> ({
    ^bb0(%arg8: memref<32768xi8, 3>):
      %43 = "arith.constant"() <{value = dense<1.000000e+00> : vector<64x128xf32>}> {layout_result_0 = #xegpu.layout<sg_layout = [2, 4], sg_data = [32, 32]>} : () -> vector<64x128xf32>
      %44 = "xegpu.create_mem_desc"(%arg8) : (memref<32768xi8, 3>) -> !xegpu.mem_desc<64x128xf32>
      "xegpu.store_matrix"(%43, %44) <{const_offsets = array<i64: 0, 0>, layout = #xegpu.layout<sg_layout = [2, 4], sg_data = [32, 32]>}> : (vector<64x128xf32>, !xegpu.mem_desc<64x128xf32>) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "distribute_store_matrix", workgroup_attributions = 0 : i64} : () -> ()
    "gpu.func"() <{function_type = (memref<4x128xf32>) -> ()}> ({
    ^bb0(%arg7: memref<4x128xf32>):
      %39 = "arith.constant"() <{value = dense<1.000000e+00> : vector<128xf32>}> {layout_result_0 = #xegpu.slice<#xegpu.layout<sg_layout = [1, 32], sg_data = [4, 4]>, dims = [0]>} : () -> vector<128xf32>
      %40 = "xegpu.create_nd_tdesc"(%arg7) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>}> : (memref<4x128xf32>) -> !xegpu.tensor_desc<4x128xf32, #xegpu.layout<sg_layout = [1, 32], sg_data = [4, 4]>>
      %41 = "xegpu.load_nd"(%40) <{const_offsets = array<i64: 0, 0>, layout = #xegpu.layout<sg_layout = [1, 32], sg_data = [4, 4]>}> : (!xegpu.tensor_desc<4x128xf32, #xegpu.layout<sg_layout = [1, 32], sg_data = [4, 4]>>) -> vector<4x128xf32>
      %42 = "vector.multi_reduction"(%41, %39) <{kind = #vector.kind<add>, reduction_dims = array<i64: 0>}> {layout_result_0 = #xegpu.slice<#xegpu.layout<sg_layout = [1, 32], sg_data = [4, 4]>, dims = [0]>} : (vector<4x128xf32>, vector<128xf32>) -> vector<128xf32>
      "gpu.return"() : () -> ()
    }) {sym_name = "vector_reduce_dim_0", workgroup_attributions = 0 : i64} : () -> ()
    "gpu.func"() <{function_type = (memref<256x64xf32>) -> ()}> ({
    ^bb0(%arg6: memref<256x64xf32>):
      %35 = "arith.constant"() <{value = dense<1.000000e+00> : vector<256xf32>}> {layout_result_0 = #xegpu.slice<#xegpu.layout<sg_layout = [16, 1], sg_data = [16, 64]>, dims = [1]>} : () -> vector<256xf32>
      %36 = "xegpu.create_nd_tdesc"(%arg6) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>}> : (memref<256x64xf32>) -> !xegpu.tensor_desc<256x64xf32, #xegpu.layout<sg_layout = [16, 1], sg_data = [16, 64]>>
      %37 = "xegpu.load_nd"(%36) <{const_offsets = array<i64: 0, 0>, layout = #xegpu.layout<sg_layout = [16, 1], sg_data = [16, 64]>}> : (!xegpu.tensor_desc<256x64xf32, #xegpu.layout<sg_layout = [16, 1], sg_data = [16, 64]>>) -> vector<256x64xf32>
      %38 = "vector.multi_reduction"(%37, %35) <{kind = #vector.kind<add>, reduction_dims = array<i64: 1>}> {layout_result_0 = #xegpu.slice<#xegpu.layout<sg_layout = [16, 1], sg_data = [16, 64]>, dims = [1]>} : (vector<256x64xf32>, vector<256xf32>) -> vector<256xf32>
      "gpu.return"() : () -> ()
    }) {sym_name = "vector_reduce_dim_1", workgroup_attributions = 0 : i64} : () -> ()
    "gpu.func"() <{function_type = (ui64) -> ()}> ({
    ^bb0(%arg5: ui64):
      %30 = "arith.constant"() <{value = dense<0.000000e+00> : vector<4x2x6xf16>}> {layout_result_0 = #xegpu.slice<#xegpu.layout<sg_layout = [4, 2, 6, 1], sg_data = [1, 1, 1, 32]>, dims = [3]>} : () -> vector<4x2x6xf16>
      %31 = "arith.constant"() <{value = dense<0> : vector<4x2x6x32xindex>}> {layout_result_0 = #xegpu.layout<sg_layout = [4, 2, 6, 1], sg_data = [1, 1, 1, 32]>} : () -> vector<4x2x6x32xindex>
      %32 = "arith.constant"() <{value = dense<true> : vector<4x2x6x32xi1>}> {layout_result_0 = #xegpu.layout<sg_layout = [4, 2, 6, 1], sg_data = [1, 1, 1, 32]>} : () -> vector<4x2x6x32xi1>
      %33 = "xegpu.load"(%arg5, %31, %32) <{layout = #xegpu.layout<sg_layout = [4, 2, 6, 1], sg_data = [1, 1, 1, 32]>}> : (ui64, vector<4x2x6x32xindex>, vector<4x2x6x32xi1>) -> vector<4x2x6x32xf16>
      %34 = "vector.multi_reduction"(%33, %30) <{kind = #vector.kind<add>, reduction_dims = array<i64: 3>}> {layout_result_0 = #xegpu.slice<#xegpu.layout<sg_layout = [4, 2, 6, 1], sg_data = [1, 1, 1, 32]>, dims = [3]>} : (vector<4x2x6x32xf16>, vector<4x2x6xf16>) -> vector<4x2x6xf16>
      "gpu.return"() : () -> ()
    }) {sym_name = "vector_reduce_4D", workgroup_attributions = 0 : i64} : () -> ()
    "gpu.func"() <{function_type = () -> ()}> ({
      %29 = "vector.step"() {layout_result_0 = #xegpu.slice<#xegpu.layout<sg_layout = [4, 8], sg_data = [32, 32]>, dims = [1]>} : () -> vector<128xindex>
      "gpu.return"() : () -> ()
    }) {sym_name = "vector_step_op_slice_attr", workgroup_attributions = 0 : i64} : () -> ()
    "gpu.func"() <{function_type = () -> ()}> ({
      %28 = "vector.step"() {layout_result_0 = #xegpu.layout<sg_layout = [16], sg_data = [8]>} : () -> vector<128xindex>
      "gpu.return"() : () -> ()
    }) {sym_name = "vector_step_op_layout_attr", workgroup_attributions = 0 : i64} : () -> ()
    "gpu.func"() <{function_type = () -> ()}> ({
      %27 = "arith.constant"() <{value = dense<10> : vector<4xindex>}> {layout_result_0 = #xegpu.slice<#xegpu.layout<sg_layout = [4, 2, 6, 1], sg_data = [1, 1, 1, 1]>, dims = [1, 2, 3]>} : () -> vector<4xindex>
      "gpu.return"() : () -> ()
    }) {sym_name = "constant_with_slice_attr", workgroup_attributions = 0 : i64} : () -> ()
    "gpu.func"() <{function_type = () -> ()}> ({
      %23 = "arith.constant"() <{value = dense<10> : vector<128xindex>}> {layout_result_0 = #xegpu.slice<#xegpu.layout<sg_layout = [8, 1, 1, 4], sg_data = [1, 1, 1, 32]>, dims = [0, 1, 2]>} : () -> vector<128xindex>
      %24 = "vector.step"() {layout_result_0 = #xegpu.slice<#xegpu.layout<sg_layout = [8, 1, 1, 4], sg_data = [1, 1, 1, 32]>, dims = [0, 1, 2]>} : () -> vector<128xindex>
      %25 = "arith.muli"(%23, %24) <{overflowFlags = #arith.overflow<none>}> {layout_result_0 = #xegpu.slice<#xegpu.layout<sg_layout = [8, 1, 1, 4], sg_data = [1, 1, 1, 32]>, dims = [0, 1, 2]>} : (vector<128xindex>, vector<128xindex>) -> vector<128xindex>
      %26 = "vector.shape_cast"(%25) {layout_result_0 = #xegpu.layout<sg_layout = [8, 1, 1, 4], sg_data = [1, 1, 1, 32]>} : (vector<128xindex>) -> vector<1x1x1x128xindex>
      "gpu.return"() : () -> ()
    }) {sym_name = "vector_shape_cast", workgroup_attributions = 0 : i64} : () -> ()
    "gpu.func"() <{function_type = (index, index) -> ()}> ({
    ^bb0(%arg3: index, %arg4: index):
      %21 = "arith.muli"(%arg3, %arg4) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
      %22 = "vector.broadcast"(%21) {layout_result_0 = #xegpu.layout<sg_layout = [4, 2, 6, 1], sg_data = [1, 1, 1, 32]>} : (index) -> vector<4x2x6x32xindex>
      "gpu.return"() : () -> ()
    }) {sym_name = "vector_broadcast", workgroup_attributions = 0 : i64} : () -> ()
    "gpu.func"() <{function_type = (memref<256x32xf32>) -> ()}> ({
    ^bb0(%arg2: memref<256x32xf32>):
      %18 = "xegpu.create_nd_tdesc"(%arg2) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>}> : (memref<256x32xf32>) -> !xegpu.tensor_desc<256x32xf32, #xegpu.layout<sg_layout = [4, 8], sg_data = [64, 32], lane_layout = [16, 1], lane_data = [1, 1], order = [0, 1]>>
      %19 = "xegpu.load_nd"(%18) <{const_offsets = array<i64: 0, 0>, layout = #xegpu.layout<sg_layout = [4, 8], sg_data = [64, 32], lane_layout = [16, 1], lane_data = [1, 1], order = [0, 1]>}> : (!xegpu.tensor_desc<256x32xf32, #xegpu.layout<sg_layout = [4, 8], sg_data = [64, 32], lane_layout = [16, 1], lane_data = [1, 1], order = [0, 1]>>) -> vector<256x32xf32>
      %20 = "vector.transpose"(%19) <{permutation = array<i64: 1, 0>}> {layout_result_0 = #xegpu.layout<sg_layout = [8, 4], sg_data = [32, 64], lane_layout = [1, 16], lane_data = [1, 1], order = [1, 0]>} : (vector<256x32xf32>) -> vector<32x256xf32>
      "gpu.return"() : () -> ()
    }) {sym_name = "vector_transpose", workgroup_attributions = 0 : i64} : () -> ()
    "gpu.func"() <{function_type = () -> ()}> ({
      %17 = "arith.constant"() <{value = dense<[[0], [16], [32], [48], [64], [80], [96], [112], [128], [144], [160], [176], [192], [208], [224], [240], [256], [272], [288], [304], [320], [336], [352], [368], [384], [400], [416], [432], [448], [464], [480], [496]]> : vector<32x1xindex>}> {layout_result_0 = #xegpu.layout<sg_layout = [32, 1], sg_data = [1, 1]>} : () -> vector<32x1xindex>
      "gpu.return"() : () -> ()
    }) {sym_name = "non_splat_constant_2D", workgroup_attributions = 0 : i64} : () -> ()
    "gpu.func"() <{function_type = () -> ()}> ({
      %16 = "arith.constant"() <{value = dense<[[0, 16, 32, 48, 64, 80, 96, 112], [8, 24, 40, 56, 72, 88, 104, 120], [16, 32, 48, 64, 80, 96, 112, 128], [24, 40, 56, 72, 88, 104, 120, 136], [32, 48, 64, 80, 96, 112, 128, 144], [40, 56, 72, 88, 104, 120, 136, 152], [48, 64, 80, 96, 112, 128, 144, 160], [56, 72, 88, 104, 120, 136, 152, 168]]> : vector<8x8xindex>}> {layout_result_0 = #xegpu.layout<sg_layout = [4, 4], sg_data = [2, 2]>} : () -> vector<8x8xindex>
      "gpu.return"() : () -> ()
    }) {sym_name = "non_splat_constant_2D_non_unit_dim", workgroup_attributions = 0 : i64} : () -> ()
    "gpu.func"() <{function_type = () -> ()}> ({
      %14 = "arith.constant"() <{value = dense<[0, 16, 32, 48, 64, 80, 96, 112, 128, 144, 160, 176, 192, 208, 224, 240, 256, 272, 288, 304, 320, 336, 352, 368, 384, 400, 416, 432, 448, 464, 480, 496]> : vector<32xindex>}> {layout_result_0 = #xegpu.layout<sg_layout = [32], sg_data = [1]>} : () -> vector<32xindex>
      %15 = "arith.constant"() <{value = dense<[[0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15]]> : vector<1x16xindex>}> {layout_result_0 = #xegpu.layout<sg_layout = [32, 1], sg_data = [1, 16]>} : () -> vector<1x16xindex>
      "gpu.return"() : () -> ()
    }) {sym_name = "non_splat_constant", workgroup_attributions = 0 : i64} : () -> ()
    "gpu.func"() <{function_type = (index) -> ()}> ({
    ^bb0(%arg1: index):
      %13 = "vector.broadcast"(%arg1) {layout_result_0 = #xegpu.layout<sg_layout = [4, 8, 1], sg_data = [1, 1, 1]>} : (index) -> vector<4x1x1xindex>
      "gpu.return"() : () -> ()
    }) {sym_name = "scalar_broadcast", workgroup_attributions = 0 : i64} : () -> ()
    "gpu.func"() <{function_type = () -> ()}> ({
      %12 = "vector.constant_mask"() <{mask_dim_sizes = array<i64: 8>}> {layout_result_0 = #xegpu.layout<sg_layout = [2], sg_data = [16]>} : () -> vector<32xi1>
      "gpu.return"() : () -> ()
    }) {sym_name = "vector_mask_1D", workgroup_attributions = 0 : i64} : () -> ()
    "gpu.func"() <{function_type = () -> ()}> ({
      %11 = "vector.constant_mask"() <{mask_dim_sizes = array<i64: 16, 16>}> {layout_result_0 = #xegpu.layout<sg_layout = [8, 4], sg_data = [32, 32]>} : () -> vector<256x128xi1>
      "gpu.return"() : () -> ()
    }) {sym_name = "vector_mask_2D", workgroup_attributions = 0 : i64} : () -> ()
    "gpu.func"() <{function_type = () -> ()}> ({
      %9 = "arith.constant"() <{value = 8 : index}> : () -> index
      %10 = "vector.create_mask"(%9) {layout_result_0 = #xegpu.layout<sg_layout = [2], sg_data = [16]>} : (index) -> vector<32xi1>
      "gpu.return"() : () -> ()
    }) {sym_name = "vector_create_mask_1D", workgroup_attributions = 0 : i64} : () -> ()
    "gpu.func"() <{function_type = () -> ()}> ({
      %7 = "arith.constant"() <{value = 16 : index}> : () -> index
      %8 = "vector.create_mask"(%7, %7) {layout_result_0 = #xegpu.layout<sg_layout = [8, 4], sg_data = [32, 32]>} : (index, index) -> vector<256x128xi1>
      "gpu.return"() : () -> ()
    }) {sym_name = "vector_create_mask_2D", workgroup_attributions = 0 : i64} : () -> ()
    "gpu.func"() <{function_type = () -> ()}> ({
      %2 = "memref.alloca"() <{alignment = 1024 : i64, operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<4096xf32>
      %3 = "arith.constant"() <{value = dense<0> : vector<256xindex>}> {layout_result_0 = #xegpu.layout<sg_layout = [8], sg_data = [32], inst_data = [16]>} : () -> vector<256xindex>
      %4 = "arith.constant"() <{value = dense<true> : vector<256xi1>}> {layout_result_0 = #xegpu.layout<sg_layout = [8], sg_data = [32], inst_data = [16]>} : () -> vector<256xi1>
      %5 = "xegpu.load"(%2, %3, %4) <{chunk_size = 1 : i64, layout = #xegpu.slice<#xegpu.layout<sg_layout = [8, 8], sg_data = [32, 32], inst_data = [8, 16]>, dims = [0]>}> : (memref<4096xf32>, vector<256xindex>, vector<256xi1>) -> vector<256xf32>
      %6 = "vector.broadcast"(%5) {layout_result_0 = #xegpu.layout<sg_layout = [8, 8], sg_data = [32, 32], inst_data = [8, 16]>} : (vector<256xf32>) -> vector<256x256xf32>
      "gpu.return"() : () -> ()
    }) {sym_name = "distribute_load_slice_attr", workgroup_attributions = 0 : i64} : () -> ()
    "gpu.func"() <{function_type = (memref<256x128xf32>) -> ()}> ({
    ^bb0(%arg0: memref<256x128xf32>):
      %0 = "xegpu.create_nd_tdesc"(%arg0) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>}> : (memref<256x128xf32>) -> !xegpu.tensor_desc<256x128xf32, #xegpu.layout<sg_layout = [8, 4], sg_data = [32, 32], lane_layout = [1, 16], lane_data = [1, 1]>>
      %1 = "xegpu.load_nd"(%0) <{const_offsets = array<i64: 0, 0>, layout = #xegpu.layout<sg_layout = [8, 4], sg_data = [32, 32], inst_data = [32, 16], lane_layout = [1, 16], lane_data = [1, 1]>}> : (!xegpu.tensor_desc<256x128xf32, #xegpu.layout<sg_layout = [8, 4], sg_data = [32, 32], lane_layout = [1, 16], lane_data = [1, 1]>>) -> vector<256x128xf32>
      "gpu.return"() : () -> ()
    }) {sym_name = "load_nd_tdesc_with_anchor_layout", workgroup_attributions = 0 : i64} : () -> ()
  }) : () -> ()
}) : () -> ()

