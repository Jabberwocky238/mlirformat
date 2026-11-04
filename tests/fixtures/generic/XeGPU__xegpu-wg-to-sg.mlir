"builtin.module"() ({
  "gpu.module"() <{sym_name = "test_1_1_assignment"}> ({
    "gpu.func"() <{function_type = (memref<256x128xf32>) -> ()}> ({
    ^bb0(%arg35: memref<256x128xf32>):
      %100 = "xegpu.create_nd_tdesc"(%arg35) <{const_offsets = array<i64: 0, 0>, operandSegmentSizes = array<i32: 1, 0, 0, 0>}> : (memref<256x128xf32>) -> !xegpu.tensor_desc<256x128xf32, #xegpu.layout<sg_layout = [8, 4], sg_data = [32, 32], lane_layout = [1, 16], lane_data = [1, 1]>>
      "gpu.return"() : () -> ()
    }) {sym_name = "create_nd_tdesc", workgroup_attributions = 0 : i64} : () -> ()
    "gpu.func"() <{function_type = (memref<3x256x128xf32>) -> ()}> ({
    ^bb0(%arg34: memref<3x256x128xf32>):
      %99 = "xegpu.create_nd_tdesc"(%arg34) <{const_offsets = array<i64: 1, 0, 0>, operandSegmentSizes = array<i32: 1, 0, 0, 0>}> : (memref<3x256x128xf32>) -> !xegpu.tensor_desc<256x128xf32, #xegpu.layout<sg_layout = [8, 4], sg_data = [32, 32], lane_layout = [1, 16], lane_data = [1, 1]>>
      "gpu.return"() : () -> ()
    }) {sym_name = "create_nd_tdesc_from_higher_rank_memref", workgroup_attributions = 0 : i64} : () -> ()
    "gpu.func"() <{function_type = (memref<256x128xf32>) -> ()}> ({
    ^bb0(%arg33: memref<256x128xf32>):
      %97 = "xegpu.create_nd_tdesc"(%arg33) <{const_offsets = array<i64: 0, 0>, operandSegmentSizes = array<i32: 1, 0, 0, 0>}> : (memref<256x128xf32>) -> !xegpu.tensor_desc<256x128xf32, #xegpu.layout<sg_layout = [8, 4], sg_data = [32, 32], lane_layout = [1, 16], lane_data = [1, 1]>>
      %98 = "xegpu.load_nd"(%97) : (!xegpu.tensor_desc<256x128xf32, #xegpu.layout<sg_layout = [8, 4], sg_data = [32, 32], lane_layout = [1, 16], lane_data = [1, 1]>>) -> vector<256x128xf32>
      "gpu.return"() : () -> ()
    }) {sym_name = "load_nd_tdesc", workgroup_attributions = 0 : i64} : () -> ()
    "gpu.func"() <{function_type = (memref<256x128xf32>) -> ()}> ({
    ^bb0(%arg32: memref<256x128xf32>):
      %95 = "xegpu.create_nd_tdesc"(%arg32) <{const_offsets = array<i64: 0, 0>, operandSegmentSizes = array<i32: 1, 0, 0, 0>}> : (memref<256x128xf32>) -> !xegpu.tensor_desc<256x128xf32, #xegpu.layout<sg_layout = [8, 4], sg_data = [32, 32], lane_layout = [1, 16], lane_data = [1, 1]>>
      %96 = "xegpu.load_nd"(%95) : (!xegpu.tensor_desc<256x128xf32, #xegpu.layout<sg_layout = [8, 4], sg_data = [32, 32], lane_layout = [1, 16], lane_data = [1, 1]>>) -> vector<256x128xf32>
      "xegpu.store_nd"(%96, %95) : (vector<256x128xf32>, !xegpu.tensor_desc<256x128xf32, #xegpu.layout<sg_layout = [8, 4], sg_data = [32, 32], lane_layout = [1, 16], lane_data = [1, 1]>>) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "store_nd", workgroup_attributions = 0 : i64} : () -> ()
    "gpu.func"() <{function_type = (memref<256x128xf32>) -> ()}> ({
    ^bb0(%arg31: memref<256x128xf32>):
      %93 = "xegpu.create_nd_tdesc"(%arg31) <{const_offsets = array<i64: 0, 0>, operandSegmentSizes = array<i32: 1, 0, 0, 0>}> : (memref<256x128xf32>) -> !xegpu.tensor_desc<256x128xf32, #xegpu.layout<sg_layout = [8, 4], sg_data = [32, 32], lane_layout = [1, 16], lane_data = [1, 1]>>
      %94 = "xegpu.update_nd_offset"(%93) <{const_offsets = array<i64: 0, 16>}> : (!xegpu.tensor_desc<256x128xf32, #xegpu.layout<sg_layout = [8, 4], sg_data = [32, 32], lane_layout = [1, 16], lane_data = [1, 1]>>) -> !xegpu.tensor_desc<256x128xf32, #xegpu.layout<sg_layout = [8, 4], sg_data = [32, 32], lane_layout = [1, 16], lane_data = [1, 1]>>
      "gpu.return"() : () -> ()
    }) {sym_name = "update_nd", workgroup_attributions = 0 : i64} : () -> ()
    "gpu.func"() <{function_type = (memref<128x128xf16>, memref<128x128xf16>) -> ()}> ({
    ^bb0(%arg29: memref<128x128xf16>, %arg30: memref<128x128xf16>):
      %88 = "xegpu.create_nd_tdesc"(%arg29) <{const_offsets = array<i64: 0, 0>, operandSegmentSizes = array<i32: 1, 0, 0, 0>}> : (memref<128x128xf16>) -> !xegpu.tensor_desc<128x128xf16, #xegpu.layout<sg_layout = [8, 8], sg_data = [16, 128], lane_layout = [1, 16], lane_data = [1, 1]>>
      %89 = "xegpu.load_nd"(%88) <{layout = #xegpu.layout<sg_layout = [8, 8], sg_data = [16, 128], lane_layout = [1, 16], lane_data = [1, 1]>}> : (!xegpu.tensor_desc<128x128xf16, #xegpu.layout<sg_layout = [8, 8], sg_data = [16, 128], lane_layout = [1, 16], lane_data = [1, 1]>>) -> vector<128x128xf16>
      %90 = "xegpu.create_nd_tdesc"(%arg30) <{const_offsets = array<i64: 0, 0>, operandSegmentSizes = array<i32: 1, 0, 0, 0>}> : (memref<128x128xf16>) -> !xegpu.tensor_desc<128x128xf16, #xegpu.layout<sg_layout = [8, 8], sg_data = [128, 16], lane_layout = [1, 16], lane_data = [2, 1]>>
      %91 = "xegpu.load_nd"(%90) <{layout = #xegpu.layout<sg_layout = [8, 8], sg_data = [128, 16], lane_layout = [1, 16], lane_data = [2, 1]>}> : (!xegpu.tensor_desc<128x128xf16, #xegpu.layout<sg_layout = [8, 8], sg_data = [128, 16], lane_layout = [1, 16], lane_data = [2, 1]>>) -> vector<128x128xf16>
      %92 = "xegpu.dpas"(%89, %91) <{layout_a = #xegpu.layout<sg_layout = [8, 8], sg_data = [16, 128], lane_layout = [1, 16], lane_data = [1, 1]>, layout_b = #xegpu.layout<sg_layout = [8, 8], sg_data = [128, 16], lane_layout = [1, 16], lane_data = [2, 1]>, layout_cd = #xegpu.layout<sg_layout = [8, 8], sg_data = [16, 16], lane_layout = [1, 16], lane_data = [1, 1]>}> : (vector<128x128xf16>, vector<128x128xf16>) -> vector<128x128xf32>
      "gpu.return"() : () -> ()
    }) {sym_name = "dpas", workgroup_attributions = 0 : i64} : () -> ()
    "gpu.func"() <{function_type = (memref<128x128xf16>, memref<128x128xf16>) -> ()}> ({
    ^bb0(%arg27: memref<128x128xf16>, %arg28: memref<128x128xf16>):
      %83 = "xegpu.create_nd_tdesc"(%arg27) <{const_offsets = array<i64: 0, 0>, operandSegmentSizes = array<i32: 1, 0, 0, 0>}> : (memref<128x128xf16>) -> !xegpu.tensor_desc<128x128xf16, #xegpu.layout<sg_layout = [8, 8], lane_layout = [1, 16], lane_data = [1, 1], order = [1, 0]>>
      %84 = "xegpu.load_nd"(%83) <{layout = #xegpu.layout<sg_layout = [8, 8], lane_layout = [1, 16], lane_data = [1, 1], order = [1, 0]>}> : (!xegpu.tensor_desc<128x128xf16, #xegpu.layout<sg_layout = [8, 8], lane_layout = [1, 16], lane_data = [1, 1], order = [1, 0]>>) -> vector<128x128xf16>
      %85 = "xegpu.create_nd_tdesc"(%arg28) <{const_offsets = array<i64: 0, 0>, operandSegmentSizes = array<i32: 1, 0, 0, 0>}> : (memref<128x128xf16>) -> !xegpu.tensor_desc<128x128xf16, #xegpu.layout<sg_layout = [8, 8], lane_layout = [1, 16], lane_data = [2, 1], order = [1, 0]>>
      %86 = "xegpu.load_nd"(%85) <{layout = #xegpu.layout<sg_layout = [8, 8], lane_layout = [1, 16], lane_data = [2, 1], order = [1, 0]>}> : (!xegpu.tensor_desc<128x128xf16, #xegpu.layout<sg_layout = [8, 8], lane_layout = [1, 16], lane_data = [2, 1], order = [1, 0]>>) -> vector<128x128xf16>
      %87 = "xegpu.dpas"(%84, %86) <{layout_a = #xegpu.layout<sg_layout = [8, 8], lane_layout = [1, 16], lane_data = [1, 1], order = [1, 0]>, layout_b = #xegpu.layout<sg_layout = [8, 8], lane_layout = [1, 16], lane_data = [2, 1], order = [1, 0]>, layout_cd = #xegpu.layout<sg_layout = [8, 8], lane_layout = [1, 16], lane_data = [1, 1], order = [1, 0]>}> : (vector<128x128xf16>, vector<128x128xf16>) -> vector<128x128xf32>
      "gpu.return"() : () -> ()
    }) {sym_name = "dpas_no_sg_data", workgroup_attributions = 0 : i64} : () -> ()
    "gpu.func"() <{function_type = (memref<256x128xf32>) -> ()}> ({
    ^bb0(%arg26: memref<256x128xf32>):
      %82 = "xegpu.create_nd_tdesc"(%arg26) <{const_offsets = array<i64: 0, 0>, operandSegmentSizes = array<i32: 1, 0, 0, 0>}> : (memref<256x128xf32>) -> !xegpu.tensor_desc<256x128xf32, #xegpu.layout<sg_layout = [8, 4], sg_data = [32, 32], lane_layout = [1, 16], lane_data = [1, 1]>>
      "xegpu.prefetch_nd"(%82) : (!xegpu.tensor_desc<256x128xf32, #xegpu.layout<sg_layout = [8, 4], sg_data = [32, 32], lane_layout = [1, 16], lane_data = [1, 1]>>) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "prefetch_nd_tdesc", workgroup_attributions = 0 : i64} : () -> ()
    "gpu.func"() <{function_type = (vector<256x128xf32>, vector<128x256xf32>) -> ()}> ({
    ^bb0(%arg24: vector<256x128xf32>, %arg25: vector<128x256xf32>):
      %81 = "xegpu.dpas"(%arg24, %arg25) <{layout_a = #xegpu.layout<sg_layout = [8, 8], sg_data = [16, 128], inst_data = [8, 8], lane_layout = [2, 8], lane_data = [1, 1]>, layout_b = #xegpu.layout<sg_layout = [8, 8], sg_data = [128, 16], inst_data = [8, 16], lane_layout = [1, 16], lane_data = [1, 1]>, layout_cd = #xegpu.layout<sg_layout = [8, 8], sg_data = [16, 16], inst_data = [8, 16], lane_layout = [1, 16], lane_data = [1, 1]>}> : (vector<256x128xf32>, vector<128x256xf32>) -> vector<256x256xf32>
      "gpu.return"() : () -> ()
    }) {sym_name = "dpas_with_no_create_nd_desc", workgroup_attributions = 0 : i64} : () -> ()
    "gpu.func"() <{function_type = (memref<256x1xf32>) -> ()}> ({
    ^bb0(%arg23: memref<256x1xf32>):
      %78 = "xegpu.create_nd_tdesc"(%arg23) <{const_offsets = array<i64: 0, 0>, operandSegmentSizes = array<i32: 1, 0, 0, 0>}> : (memref<256x1xf32>) -> !xegpu.tensor_desc<256x1xf32, #xegpu.layout<sg_layout = [8, 1], sg_data = [32, 1], lane_layout = [8, 1], lane_data = [1, 1]>>
      %79 = "xegpu.load_nd"(%78) : (!xegpu.tensor_desc<256x1xf32, #xegpu.layout<sg_layout = [8, 1], sg_data = [32, 1], lane_layout = [8, 1], lane_data = [1, 1]>>) -> vector<256x1xf32>
      %80 = "vector.broadcast"(%79) {layout_result_0 = #xegpu.layout<sg_layout = [8, 1], sg_data = [32, 32], lane_layout = [8, 1], lane_data = [1, 1]>} : (vector<256x1xf32>) -> vector<256x32xf32>
      "gpu.return"() : () -> ()
    }) {sym_name = "broadcast_dim1", workgroup_attributions = 0 : i64} : () -> ()
    "gpu.func"() <{function_type = (memref<1x128xf32>) -> ()}> ({
    ^bb0(%arg22: memref<1x128xf32>):
      %75 = "xegpu.create_nd_tdesc"(%arg22) <{const_offsets = array<i64: 0, 0>, operandSegmentSizes = array<i32: 1, 0, 0, 0>}> : (memref<1x128xf32>) -> !xegpu.tensor_desc<1x128xf32, #xegpu.layout<sg_layout = [1, 4], sg_data = [1, 32], lane_layout = [1, 16], lane_data = [1, 1]>>
      %76 = "xegpu.load_nd"(%75) : (!xegpu.tensor_desc<1x128xf32, #xegpu.layout<sg_layout = [1, 4], sg_data = [1, 32], lane_layout = [1, 16], lane_data = [1, 1]>>) -> vector<1x128xf32>
      %77 = "vector.broadcast"(%76) {layout_result_0 = #xegpu.layout<sg_layout = [1, 4], sg_data = [32, 32], lane_layout = [1, 16], lane_data = [1, 1]>} : (vector<1x128xf32>) -> vector<32x128xf32>
      "gpu.return"() : () -> ()
    }) {sym_name = "broadcast_dim0", workgroup_attributions = 0 : i64} : () -> ()
    "gpu.func"() <{function_type = (memref<1024x1024xf16>, memref<1024x1024xf16>, memref<1024x1024xf32>) -> ()}> ({
    ^bb0(%arg15: memref<1024x1024xf16>, %arg16: memref<1024x1024xf16>, %arg17: memref<1024x1024xf32>):
      %57 = "arith.constant"() <{value = 0 : index}> : () -> index
      %58 = "arith.constant"() <{value = 128 : index}> : () -> index
      %59 = "arith.constant"() <{value = 1024 : index}> : () -> index
      %60 = "gpu.block_id"() <{dimension = #gpu<dim x>}> : () -> index
      %61 = "gpu.block_id"() <{dimension = #gpu<dim y>}> : () -> index
      %62 = "arith.muli"(%60, %58) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
      %63 = "arith.muli"(%61, %58) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
      %64 = "xegpu.create_nd_tdesc"(%arg17, %62, %63) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>, operandSegmentSizes = array<i32: 1, 2, 0, 0>}> : (memref<1024x1024xf32>, index, index) -> !xegpu.tensor_desc<128x128xf32, #xegpu.layout<sg_layout = [8, 8], sg_data = [16, 16]>>
      %65 = "xegpu.load_nd"(%64) <{layout = #xegpu.layout<sg_layout = [8, 8], sg_data = [16, 16]>}> : (!xegpu.tensor_desc<128x128xf32, #xegpu.layout<sg_layout = [8, 8], sg_data = [16, 16]>>) -> vector<128x128xf32>
      %66 = "xegpu.create_nd_tdesc"(%arg15, %62, %57) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>, operandSegmentSizes = array<i32: 1, 2, 0, 0>}> : (memref<1024x1024xf16>, index, index) -> !xegpu.tensor_desc<128x128xf16, #xegpu.layout<sg_layout = [8, 8], sg_data = [16, 128]>>
      %67 = "xegpu.create_nd_tdesc"(%arg16, %57, %63) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>, operandSegmentSizes = array<i32: 1, 2, 0, 0>}> : (memref<1024x1024xf16>, index, index) -> !xegpu.tensor_desc<128x128xf16, #xegpu.layout<sg_layout = [8, 8], sg_data = [128, 16]>>
      %68:3 = "scf.for"(%57, %59, %58, %66, %67, %65) ({
      ^bb0(%arg18: index, %arg19: !xegpu.tensor_desc<128x128xf16, #xegpu.layout<sg_layout = [8, 8], sg_data = [16, 128]>>, %arg20: !xegpu.tensor_desc<128x128xf16, #xegpu.layout<sg_layout = [8, 8], sg_data = [128, 16]>>, %arg21: vector<128x128xf32>):
        %70 = "xegpu.load_nd"(%arg19) <{layout = #xegpu.layout<sg_layout = [8, 8], sg_data = [16, 128]>}> : (!xegpu.tensor_desc<128x128xf16, #xegpu.layout<sg_layout = [8, 8], sg_data = [16, 128]>>) -> vector<128x128xf16>
        %71 = "xegpu.load_nd"(%arg20) <{layout = #xegpu.layout<sg_layout = [8, 8], sg_data = [128, 16]>}> : (!xegpu.tensor_desc<128x128xf16, #xegpu.layout<sg_layout = [8, 8], sg_data = [128, 16]>>) -> vector<128x128xf16>
        %72 = "xegpu.dpas"(%70, %71, %arg21) <{layout_a = #xegpu.layout<sg_layout = [8, 8], sg_data = [16, 128]>, layout_b = #xegpu.layout<sg_layout = [8, 8], sg_data = [128, 16]>, layout_cd = #xegpu.layout<sg_layout = [8, 8], sg_data = [16, 16]>}> : (vector<128x128xf16>, vector<128x128xf16>, vector<128x128xf32>) -> vector<128x128xf32>
        %73 = "xegpu.update_nd_offset"(%arg19, %57, %58) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>}> : (!xegpu.tensor_desc<128x128xf16, #xegpu.layout<sg_layout = [8, 8], sg_data = [16, 128]>>, index, index) -> !xegpu.tensor_desc<128x128xf16, #xegpu.layout<sg_layout = [8, 8], sg_data = [16, 128]>>
        %74 = "xegpu.update_nd_offset"(%arg20, %58, %57) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>}> : (!xegpu.tensor_desc<128x128xf16, #xegpu.layout<sg_layout = [8, 8], sg_data = [128, 16]>>, index, index) -> !xegpu.tensor_desc<128x128xf16, #xegpu.layout<sg_layout = [8, 8], sg_data = [128, 16]>>
        "scf.yield"(%73, %74, %72) : (!xegpu.tensor_desc<128x128xf16, #xegpu.layout<sg_layout = [8, 8], sg_data = [16, 128]>>, !xegpu.tensor_desc<128x128xf16, #xegpu.layout<sg_layout = [8, 8], sg_data = [128, 16]>>, vector<128x128xf32>) -> ()
      }) : (index, index, index, !xegpu.tensor_desc<128x128xf16, #xegpu.layout<sg_layout = [8, 8], sg_data = [16, 128]>>, !xegpu.tensor_desc<128x128xf16, #xegpu.layout<sg_layout = [8, 8], sg_data = [128, 16]>>, vector<128x128xf32>) -> (!xegpu.tensor_desc<128x128xf16, #xegpu.layout<sg_layout = [8, 8], sg_data = [16, 128]>>, !xegpu.tensor_desc<128x128xf16, #xegpu.layout<sg_layout = [8, 8], sg_data = [128, 16]>>, vector<128x128xf32>)
      %69 = "xegpu.create_nd_tdesc"(%arg17, %62, %63) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>, operandSegmentSizes = array<i32: 1, 2, 0, 0>}> : (memref<1024x1024xf32>, index, index) -> !xegpu.tensor_desc<128x128xf32, #xegpu.layout<sg_layout = [8, 8], sg_data = [16, 16]>>
      "xegpu.store_nd"(%68#2, %69) <{layout = #xegpu.layout<sg_layout = [8, 8], sg_data = [16, 16]>}> : (vector<128x128xf32>, !xegpu.tensor_desc<128x128xf32, #xegpu.layout<sg_layout = [8, 8], sg_data = [16, 16]>>) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "scf_for", workgroup_attributions = 0 : i64} : () -> ()
    "gpu.func"() <{function_type = (memref<1024xf32>, memref<1024xf32>) -> ()}> ({
    ^bb0(%arg9: memref<1024xf32>, %arg10: memref<1024xf32>):
      %46 = "arith.constant"() <{value = 1 : i32}> : () -> i32
      %47 = "arith.constant"() <{value = 10 : i32}> : () -> i32
      %48 = "arith.constant"() <{value = 0 : i32}> : () -> i32
      %49 = "xegpu.create_nd_tdesc"(%arg9) <{const_offsets = array<i64: 0>, operandSegmentSizes = array<i32: 1, 0, 0, 0>}> : (memref<1024xf32>) -> !xegpu.tensor_desc<256xf32, #xegpu.layout<sg_layout = [16], sg_data = [16]>>
      %50 = "xegpu.load_nd"(%49) <{layout = #xegpu.layout<sg_layout = [16], sg_data = [16]>}> : (!xegpu.tensor_desc<256xf32, #xegpu.layout<sg_layout = [16], sg_data = [16]>>) -> vector<256xf32>
      %51 = "xegpu.create_nd_tdesc"(%arg10) <{const_offsets = array<i64: 0>, operandSegmentSizes = array<i32: 1, 0, 0, 0>}> : (memref<1024xf32>) -> !xegpu.tensor_desc<256xf32, #xegpu.layout<sg_layout = [16], sg_data = [16]>>
      %52:2 = "scf.while"(%50, %48) ({
      ^bb0(%arg13: vector<256xf32>, %arg14: i32):
        %56 = "arith.cmpi"(%arg14, %47) <{predicate = 2 : i64}> : (i32, i32) -> i1
        "scf.condition"(%56, %arg13, %arg14) : (i1, vector<256xf32>, i32) -> ()
      }, {
      ^bb0(%arg11: vector<256xf32>, %arg12: i32):
        "xegpu.store_nd"(%arg11, %51) : (vector<256xf32>, !xegpu.tensor_desc<256xf32, #xegpu.layout<sg_layout = [16], sg_data = [16]>>) -> ()
        %53 = "arith.addi"(%arg12, %46) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
        %54 = "xegpu.update_nd_offset"(%49) <{const_offsets = array<i64: 256>}> : (!xegpu.tensor_desc<256xf32, #xegpu.layout<sg_layout = [16], sg_data = [16]>>) -> !xegpu.tensor_desc<256xf32, #xegpu.layout<sg_layout = [16], sg_data = [16]>>
        %55 = "xegpu.load_nd"(%54) <{layout = #xegpu.layout<sg_layout = [16], sg_data = [16]>}> : (!xegpu.tensor_desc<256xf32, #xegpu.layout<sg_layout = [16], sg_data = [16]>>) -> vector<256xf32>
        "scf.yield"(%55, %53) : (vector<256xf32>, i32) -> ()
      }) : (vector<256xf32>, i32) -> (vector<256xf32>, i32)
      "gpu.return"() : () -> ()
    }) {sym_name = "scf_while_and_condition", workgroup_attributions = 0 : i64} : () -> ()
    "gpu.func"() <{function_type = (memref<1024xf32>, memref<1024xf32>) -> ()}> ({
    ^bb0(%arg7: memref<1024xf32>, %arg8: memref<1024xf32>):
      %38 = "arith.constant"() <{value = 10 : index}> : () -> index
      %39 = "gpu.subgroup_id"() : () -> index
      %40 = "xegpu.create_nd_tdesc"(%arg7) <{const_offsets = array<i64: 0>, operandSegmentSizes = array<i32: 1, 0, 0, 0>}> : (memref<1024xf32>) -> !xegpu.tensor_desc<256xf32, #xegpu.layout<sg_layout = [16], sg_data = [16]>>
      %41 = "xegpu.create_nd_tdesc"(%arg8) <{const_offsets = array<i64: 0>, operandSegmentSizes = array<i32: 1, 0, 0, 0>}> : (memref<1024xf32>) -> !xegpu.tensor_desc<256xf32, #xegpu.layout<sg_layout = [16], sg_data = [16]>>
      %42 = "arith.cmpi"(%39, %38) <{predicate = 0 : i64}> : (index, index) -> i1
      %43 = "scf.if"(%42) ({
        %45 = "xegpu.load_nd"(%40) <{layout = #xegpu.layout<sg_layout = [16], sg_data = [16]>}> : (!xegpu.tensor_desc<256xf32, #xegpu.layout<sg_layout = [16], sg_data = [16]>>) -> vector<256xf32>
        "scf.yield"(%45) : (vector<256xf32>) -> ()
      }, {
        %44 = "xegpu.load_nd"(%41) <{layout = #xegpu.layout<sg_layout = [16], sg_data = [16]>}> : (!xegpu.tensor_desc<256xf32, #xegpu.layout<sg_layout = [16], sg_data = [16]>>) -> vector<256xf32>
        "scf.yield"(%44) : (vector<256xf32>) -> ()
      }) {layout_result_0 = #xegpu.layout<sg_layout = [16], sg_data = [16]>} : (i1) -> vector<256xf32>
      "xegpu.store_nd"(%43, %40) : (vector<256xf32>, !xegpu.tensor_desc<256xf32, #xegpu.layout<sg_layout = [16], sg_data = [16]>>) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "scf_if", workgroup_attributions = 0 : i64} : () -> ()
    "gpu.func"() <{function_type = (memref<1024xf32>, memref<1024xf32>) -> ()}> ({
    ^bb0(%arg5: memref<1024xf32>, %arg6: memref<1024xf32>):
      %30 = "arith.constant"() <{value = 10 : index}> : () -> index
      %31 = "gpu.subgroup_id"() : () -> index
      %32 = "xegpu.create_nd_tdesc"(%arg5) <{const_offsets = array<i64: 0>, operandSegmentSizes = array<i32: 1, 0, 0, 0>}> : (memref<1024xf32>) -> !xegpu.tensor_desc<256xf32, #xegpu.layout<sg_layout = [16], sg_data = [16]>>
      %33 = "xegpu.load_nd"(%32) : (!xegpu.tensor_desc<256xf32, #xegpu.layout<sg_layout = [16], sg_data = [16]>>) -> vector<256xf32>
      %34 = "arith.cmpi"(%31, %30) <{predicate = 0 : i64}> : (index, index) -> i1
      %35 = "scf.if"(%34) ({
        %37 = "xegpu.create_nd_tdesc"(%arg5) <{const_offsets = array<i64: 0>, operandSegmentSizes = array<i32: 1, 0, 0, 0>}> : (memref<1024xf32>) -> !xegpu.tensor_desc<256xf32, #xegpu.layout<sg_layout = [16], sg_data = [16]>>
        "scf.yield"(%37) : (!xegpu.tensor_desc<256xf32, #xegpu.layout<sg_layout = [16], sg_data = [16]>>) -> ()
      }, {
        %36 = "xegpu.create_nd_tdesc"(%arg6) <{const_offsets = array<i64: 0>, operandSegmentSizes = array<i32: 1, 0, 0, 0>}> : (memref<1024xf32>) -> !xegpu.tensor_desc<256xf32, #xegpu.layout<sg_layout = [16], sg_data = [16]>>
        "scf.yield"(%36) : (!xegpu.tensor_desc<256xf32, #xegpu.layout<sg_layout = [16], sg_data = [16]>>) -> ()
      }) : (i1) -> !xegpu.tensor_desc<256xf32, #xegpu.layout<sg_layout = [16], sg_data = [16]>>
      "xegpu.store_nd"(%33, %35) : (vector<256xf32>, !xegpu.tensor_desc<256xf32, #xegpu.layout<sg_layout = [16], sg_data = [16]>>) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "scf_if_tensor_desc", workgroup_attributions = 0 : i64} : () -> ()
    "gpu.func"() <{function_type = (memref<256x128xf32>, memref<128x256xf32>, memref<128x64xf32>) -> ()}> ({
    ^bb0(%arg2: memref<256x128xf32>, %arg3: memref<128x256xf32>, %arg4: memref<128x64xf32>):
      %13 = "gpu.subgroup_id"() : () -> index
      %14 = "arith.constant"() <{value = 0 : index}> : () -> index
      %15 = "arith.constant"() <{value = 1 : index}> : () -> index
      %16 = "arith.constant"() <{value = 2 : index}> : () -> index
      %17 = "arith.constant"() <{value = 31 : index}> : () -> index
      %18 = "arith.constant"() <{value = 3 : index}> : () -> index
      %19 = "arith.cmpi"(%13, %14) <{predicate = 5 : i64}> : (index, index) -> i1
      %20 = "arith.cmpi"(%13, %15) <{predicate = 2 : i64}> : (index, index) -> i1
      %21 = "arith.andi"(%19, %20) : (i1, i1) -> i1
      "scf.if"(%21) ({
        %28 = "xegpu.create_nd_tdesc"(%arg2) <{const_offsets = array<i64: 0, 0>, operandSegmentSizes = array<i32: 1, 0, 0, 0>}> : (memref<256x128xf32>) -> !xegpu.tensor_desc<256x128xf32, #xegpu.layout<sg_layout = [8, 4], sg_data = [32, 32], lane_layout = [8, 4], lane_data = [1, 1]>>
        %29 = "xegpu.load_nd"(%28) : (!xegpu.tensor_desc<256x128xf32, #xegpu.layout<sg_layout = [8, 4], sg_data = [32, 32], lane_layout = [8, 4], lane_data = [1, 1]>>) -> vector<256x128xf32>
        "scf.yield"() : () -> ()
      }, {
      }) {sg_id_range = #xegpu.range<[0 : i64, 32 : i64]>} : (i1) -> ()
      %22 = "arith.cmpi"(%13, %16) <{predicate = 5 : i64}> : (index, index) -> i1
      %23 = "arith.cmpi"(%13, %17) <{predicate = 2 : i64}> : (index, index) -> i1
      %24 = "arith.andi"(%22, %23) : (i1, i1) -> i1
      "scf.if"(%24) ({
        %25 = "xegpu.create_nd_tdesc"(%arg4) <{const_offsets = array<i64: 0, 0>, operandSegmentSizes = array<i32: 1, 0, 0, 0>}> : (memref<128x64xf32>) -> !xegpu.tensor_desc<128x64xf32, #xegpu.layout<sg_layout = [4, 4], sg_data = [32, 16], lane_layout = [8, 4], lane_data = [1, 1]>>
        %26 = "xegpu.load_nd"(%25) : (!xegpu.tensor_desc<128x64xf32, #xegpu.layout<sg_layout = [4, 4], sg_data = [32, 16], lane_layout = [8, 4], lane_data = [1, 1]>>) -> vector<128x64xf32>
        %27 = "math.exp"(%26) <{fastmath = #arith.fastmath<none>}> {layout_result_0 = #xegpu.layout<sg_layout = [4, 4], sg_data = [32, 16], lane_layout = [8, 4], lane_data = [1, 1]>} : (vector<128x64xf32>) -> vector<128x64xf32>
        "scf.yield"() : () -> ()
      }, {
      }) {sg_id_range = #xegpu.range<[2 : i64, 18 : i64]>} : (i1) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "subgroup_id_range", workgroup_attributions = 0 : i64} : () -> ()
    "gpu.func"() <{function_type = (memref<256x128xf32>, memref<128x64xf32>) -> ()}> ({
    ^bb0(%arg0: memref<256x128xf32>, %arg1: memref<128x64xf32>):
      %1 = "gpu.subgroup_id"() : () -> index
      %2 = "arith.constant"() <{value = true}> : () -> i1
      %3 = "arith.constant"() <{value = 3 : index}> : () -> index
      %4 = "arith.constant"() <{value = 32 : index}> : () -> index
      %5 = "xegpu.create_nd_tdesc"(%arg0) <{const_offsets = array<i64: 0, 0>, operandSegmentSizes = array<i32: 1, 0, 0, 0>}> : (memref<256x128xf32>) -> !xegpu.tensor_desc<256x128xf32, #xegpu.layout<sg_layout = [8, 4], sg_data = [32, 32], lane_layout = [8, 4], lane_data = [1, 1]>>
      %6 = "xegpu.load_nd"(%5) : (!xegpu.tensor_desc<256x128xf32, #xegpu.layout<sg_layout = [8, 4], sg_data = [32, 32], lane_layout = [8, 4], lane_data = [1, 1]>>) -> vector<256x128xf32>
      %7 = "arith.cmpi"(%1, %3) <{predicate = 5 : i64}> : (index, index) -> i1
      %8 = "arith.cmpi"(%1, %4) <{predicate = 2 : i64}> : (index, index) -> i1
      %9 = "arith.andi"(%7, %8) : (i1, i1) -> i1
      "scf.if"(%2) ({
        "scf.if"(%9) ({
          %10 = "xegpu.create_nd_tdesc"(%arg1) <{const_offsets = array<i64: 0, 0>, operandSegmentSizes = array<i32: 1, 0, 0, 0>}> : (memref<128x64xf32>) -> !xegpu.tensor_desc<128x64xf32, #xegpu.layout<sg_layout = [4, 4], sg_data = [32, 16], lane_layout = [8, 4], lane_data = [1, 1]>>
          %11 = "xegpu.load_nd"(%10) : (!xegpu.tensor_desc<128x64xf32, #xegpu.layout<sg_layout = [4, 4], sg_data = [32, 16], lane_layout = [8, 4], lane_data = [1, 1]>>) -> vector<128x64xf32>
          %12 = "math.exp"(%11) <{fastmath = #arith.fastmath<none>}> {layout_result_0 = #xegpu.layout<sg_layout = [4, 4], sg_data = [32, 16], lane_layout = [8, 4], lane_data = [1, 1]>} : (vector<128x64xf32>) -> vector<128x64xf32>
          "scf.yield"() : () -> ()
        }, {
        }) : (i1) -> ()
        "scf.yield"() : () -> ()
      }, {
      }) {sg_id_range = #xegpu.range<[3 : i64, 19 : i64]>} : (i1) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "subgroup_id_range_nested_if", workgroup_attributions = 0 : i64} : () -> ()
    "gpu.func"() <{function_type = () -> ()}> ({
      %0 = "arith.constant"() <{value = dense<1.000000e+00> : vector<256x128xf32>}> {layout_result_0 = #xegpu.layout<sg_layout = [8, 4], sg_data = [32, 32]>} : () -> vector<256x128xf32>
      "gpu.return"() : () -> ()
    }) {sym_name = "distribute_constant", workgroup_attributions = 0 : i64} : () -> ()
  }) : () -> ()
}) : () -> ()

