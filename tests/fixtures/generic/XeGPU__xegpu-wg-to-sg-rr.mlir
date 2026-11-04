"builtin.module"() ({
  "gpu.module"() <{sym_name = "test_round_robin_assignment"}> ({
    "gpu.func"() <{function_type = (memref<256x128xf32>) -> ()}> ({
    ^bb0(%arg24: memref<256x128xf32>):
      %57 = "xegpu.create_nd_tdesc"(%arg24) <{const_offsets = array<i64: 0, 0>, operandSegmentSizes = array<i32: 1, 0, 0, 0>}> : (memref<256x128xf32>) -> !xegpu.tensor_desc<256x128xf32, #xegpu.layout<sg_layout = [8, 4], sg_data = [16, 16], lane_layout = [1, 16], lane_data = [1, 1]>>
      "gpu.return"() : () -> ()
    }) {sym_name = "create_nd_tdesc", workgroup_attributions = 0 : i64} : () -> ()
    "gpu.func"() <{function_type = (memref<256x128xf32>) -> ()}> ({
    ^bb0(%arg23: memref<256x128xf32>):
      %56 = "xegpu.create_nd_tdesc"(%arg23) <{const_offsets = array<i64: 0, 0>, operandSegmentSizes = array<i32: 1, 0, 0, 0>}> : (memref<256x128xf32>) -> !xegpu.tensor_desc<128x64xf32, #xegpu.layout<sg_layout = [8, 4], sg_data = [16, 64]>>
      "gpu.return"() : () -> ()
    }) {sym_name = "create_nd_tdesc_with_shared_data", workgroup_attributions = 0 : i64} : () -> ()
    "gpu.func"() <{function_type = (memref<256x128xf32>) -> ()}> ({
    ^bb0(%arg22: memref<256x128xf32>):
      %54 = "xegpu.create_nd_tdesc"(%arg22) <{const_offsets = array<i64: 0, 0>, operandSegmentSizes = array<i32: 1, 0, 0, 0>}> : (memref<256x128xf32>) -> !xegpu.tensor_desc<256x128xf32, #xegpu.layout<sg_layout = [8, 4], sg_data = [16, 16], lane_layout = [1, 16], lane_data = [1, 1]>>
      %55 = "xegpu.load_nd"(%54) <{layout = #xegpu.layout<sg_layout = [8, 4], sg_data = [16, 16], lane_layout = [1, 16], lane_data = [1, 1]>}> : (!xegpu.tensor_desc<256x128xf32, #xegpu.layout<sg_layout = [8, 4], sg_data = [16, 16], lane_layout = [1, 16], lane_data = [1, 1]>>) -> vector<256x128xf32>
      "gpu.return"() : () -> ()
    }) {sym_name = "load_nd_tdesc", workgroup_attributions = 0 : i64} : () -> ()
    "gpu.func"() <{function_type = (memref<256x128xf32>) -> ()}> ({
    ^bb0(%arg21: memref<256x128xf32>):
      %52 = "xegpu.create_nd_tdesc"(%arg21) <{const_offsets = array<i64: 0, 0>, operandSegmentSizes = array<i32: 1, 0, 0, 0>}> : (memref<256x128xf32>) -> !xegpu.tensor_desc<256x128xf32, #xegpu.layout<sg_layout = [8, 4], sg_data = [16, 16], lane_layout = [1, 16], lane_data = [1, 1]>>
      %53 = "xegpu.load_nd"(%52) <{layout = #xegpu.layout<sg_layout = [8, 4], sg_data = [16, 16], lane_layout = [1, 16], lane_data = [1, 1]>}> : (!xegpu.tensor_desc<256x128xf32, #xegpu.layout<sg_layout = [8, 4], sg_data = [16, 16], lane_layout = [1, 16], lane_data = [1, 1]>>) -> vector<256x128xf32>
      "xegpu.store_nd"(%53, %52) : (vector<256x128xf32>, !xegpu.tensor_desc<256x128xf32, #xegpu.layout<sg_layout = [8, 4], sg_data = [16, 16], lane_layout = [1, 16], lane_data = [1, 1]>>) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "store_nd", workgroup_attributions = 0 : i64} : () -> ()
    "gpu.func"() <{function_type = (memref<256x128xf32>) -> ()}> ({
    ^bb0(%arg20: memref<256x128xf32>):
      %50 = "xegpu.create_nd_tdesc"(%arg20) <{const_offsets = array<i64: 0, 0>, operandSegmentSizes = array<i32: 1, 0, 0, 0>}> : (memref<256x128xf32>) -> !xegpu.tensor_desc<256x128xf32, #xegpu.layout<sg_layout = [8, 4], sg_data = [16, 16], lane_layout = [1, 16], lane_data = [1, 1]>>
      %51 = "xegpu.update_nd_offset"(%50) <{const_offsets = array<i64: 0, 16>}> : (!xegpu.tensor_desc<256x128xf32, #xegpu.layout<sg_layout = [8, 4], sg_data = [16, 16], lane_layout = [1, 16], lane_data = [1, 1]>>) -> !xegpu.tensor_desc<256x128xf32, #xegpu.layout<sg_layout = [8, 4], sg_data = [16, 16], lane_layout = [1, 16], lane_data = [1, 1]>>
      "gpu.return"() : () -> ()
    }) {sym_name = "update_nd", workgroup_attributions = 0 : i64} : () -> ()
    "gpu.func"() <{function_type = (memref<256x128xf16>, memref<128x256xf16>) -> ()}> ({
    ^bb0(%arg18: memref<256x128xf16>, %arg19: memref<128x256xf16>):
      %45 = "xegpu.create_nd_tdesc"(%arg18) <{const_offsets = array<i64: 0, 0>, operandSegmentSizes = array<i32: 1, 0, 0, 0>}> : (memref<256x128xf16>) -> !xegpu.tensor_desc<256x128xf16, #xegpu.layout<sg_layout = [8, 4], sg_data = [16, 16], lane_layout = [1, 16], lane_data = [1, 1]>>
      %46 = "xegpu.load_nd"(%45) <{layout = #xegpu.layout<sg_layout = [8, 4], sg_data = [16, 16], lane_layout = [1, 16], lane_data = [1, 1]>}> : (!xegpu.tensor_desc<256x128xf16, #xegpu.layout<sg_layout = [8, 4], sg_data = [16, 16], lane_layout = [1, 16], lane_data = [1, 1]>>) -> vector<256x128xf16>
      %47 = "xegpu.create_nd_tdesc"(%arg19) <{const_offsets = array<i64: 0, 0>, operandSegmentSizes = array<i32: 1, 0, 0, 0>}> : (memref<128x256xf16>) -> !xegpu.tensor_desc<128x256xf16, #xegpu.layout<sg_layout = [4, 8], sg_data = [16, 16], lane_layout = [1, 16], lane_data = [2, 1]>>
      %48 = "xegpu.load_nd"(%47) <{layout = #xegpu.layout<sg_layout = [4, 8], sg_data = [16, 16], lane_layout = [1, 16], lane_data = [2, 1]>}> : (!xegpu.tensor_desc<128x256xf16, #xegpu.layout<sg_layout = [4, 8], sg_data = [16, 16], lane_layout = [1, 16], lane_data = [2, 1]>>) -> vector<128x256xf16>
      %49 = "xegpu.dpas"(%46, %48) <{layout_a = #xegpu.layout<sg_layout = [8, 4], sg_data = [16, 16], lane_layout = [1, 16], lane_data = [1, 1]>, layout_b = #xegpu.layout<sg_layout = [4, 8], sg_data = [16, 16], lane_layout = [1, 16], lane_data = [2, 1]>, layout_cd = #xegpu.layout<sg_layout = [8, 8], sg_data = [16, 16], lane_layout = [1, 16], lane_data = [1, 1]>}> : (vector<256x128xf16>, vector<128x256xf16>) -> vector<256x256xf32>
      "gpu.return"() : () -> ()
    }) {sym_name = "dpas", workgroup_attributions = 0 : i64} : () -> ()
    "gpu.func"() <{function_type = (memref<256x128xf32>) -> ()}> ({
    ^bb0(%arg17: memref<256x128xf32>):
      %44 = "xegpu.create_nd_tdesc"(%arg17) <{const_offsets = array<i64: 0, 0>, operandSegmentSizes = array<i32: 1, 0, 0, 0>}> : (memref<256x128xf32>) -> !xegpu.tensor_desc<256x128xf32, #xegpu.layout<sg_layout = [8, 4], sg_data = [16, 16], lane_layout = [1, 16], lane_data = [1, 1]>>
      "xegpu.prefetch_nd"(%44) : (!xegpu.tensor_desc<256x128xf32, #xegpu.layout<sg_layout = [8, 4], sg_data = [16, 16], lane_layout = [1, 16], lane_data = [1, 1]>>) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "prefetch_nd_tdesc", workgroup_attributions = 0 : i64} : () -> ()
    "gpu.func"() <{function_type = (memref<128x1xf32>) -> ()}> ({
    ^bb0(%arg16: memref<128x1xf32>):
      %41 = "xegpu.create_nd_tdesc"(%arg16) <{const_offsets = array<i64: 0, 0>, operandSegmentSizes = array<i32: 1, 0, 0, 0>}> : (memref<128x1xf32>) -> !xegpu.tensor_desc<128x1xf32, #xegpu.layout<sg_layout = [4, 1], sg_data = [16, 1], lane_layout = [8, 1], lane_data = [1, 1]>>
      %42 = "xegpu.load_nd"(%41) <{layout = #xegpu.layout<sg_layout = [4, 1], sg_data = [16, 1], lane_layout = [8, 1], lane_data = [1, 1]>}> : (!xegpu.tensor_desc<128x1xf32, #xegpu.layout<sg_layout = [4, 1], sg_data = [16, 1], lane_layout = [8, 1], lane_data = [1, 1]>>) -> vector<128x1xf32>
      %43 = "vector.broadcast"(%42) {layout_result_0 = #xegpu.layout<sg_layout = [4, 1], sg_data = [16, 32], lane_layout = [8, 1], lane_data = [1, 1]>} : (vector<128x1xf32>) -> vector<128x64xf32>
      "gpu.return"() : () -> ()
    }) {sym_name = "broadcast", workgroup_attributions = 0 : i64} : () -> ()
    "gpu.func"() <{function_type = (memref<1024xf32>, memref<1024xf32>) -> ()}> ({
    ^bb0(%arg11: memref<1024xf32>, %arg12: memref<1024xf32>):
      %30 = "arith.constant"() <{value = 1 : index}> : () -> index
      %31 = "arith.constant"() <{value = 10 : index}> : () -> index
      %32 = "arith.constant"() <{value = 0 : index}> : () -> index
      %33 = "arith.constant"() <{value = 256 : index}> : () -> index
      %34 = "arith.constant"() <{value = 1024 : index}> : () -> index
      %35 = "xegpu.create_nd_tdesc"(%arg11) <{const_offsets = array<i64: 0>, operandSegmentSizes = array<i32: 1, 0, 0, 0>}> : (memref<1024xf32>) -> !xegpu.tensor_desc<256xf32, #xegpu.layout<sg_layout = [8], sg_data = [16]>>
      %36 = "xegpu.create_nd_tdesc"(%arg12) <{const_offsets = array<i64: 0>, operandSegmentSizes = array<i32: 1, 0, 0, 0>}> : (memref<1024xf32>) -> !xegpu.tensor_desc<256xf32, #xegpu.layout<sg_layout = [8], sg_data = [16]>>
      %37:2 = "scf.for"(%32, %34, %33, %35, %36) ({
      ^bb0(%arg13: index, %arg14: !xegpu.tensor_desc<256xf32, #xegpu.layout<sg_layout = [8], sg_data = [16]>>, %arg15: !xegpu.tensor_desc<256xf32, #xegpu.layout<sg_layout = [8], sg_data = [16]>>):
        %38 = "xegpu.load_nd"(%35) <{layout = #xegpu.layout<sg_layout = [8], sg_data = [16]>}> : (!xegpu.tensor_desc<256xf32, #xegpu.layout<sg_layout = [8], sg_data = [16]>>) -> vector<256xf32>
        "xegpu.store_nd"(%38, %arg14) : (vector<256xf32>, !xegpu.tensor_desc<256xf32, #xegpu.layout<sg_layout = [8], sg_data = [16]>>) -> ()
        %39 = "xegpu.update_nd_offset"(%arg14) <{const_offsets = array<i64: 256>}> : (!xegpu.tensor_desc<256xf32, #xegpu.layout<sg_layout = [8], sg_data = [16]>>) -> !xegpu.tensor_desc<256xf32, #xegpu.layout<sg_layout = [8], sg_data = [16]>>
        %40 = "xegpu.update_nd_offset"(%arg15) <{const_offsets = array<i64: 256>}> : (!xegpu.tensor_desc<256xf32, #xegpu.layout<sg_layout = [8], sg_data = [16]>>) -> !xegpu.tensor_desc<256xf32, #xegpu.layout<sg_layout = [8], sg_data = [16]>>
        "scf.yield"(%39, %40) : (!xegpu.tensor_desc<256xf32, #xegpu.layout<sg_layout = [8], sg_data = [16]>>, !xegpu.tensor_desc<256xf32, #xegpu.layout<sg_layout = [8], sg_data = [16]>>) -> ()
      }) : (index, index, index, !xegpu.tensor_desc<256xf32, #xegpu.layout<sg_layout = [8], sg_data = [16]>>, !xegpu.tensor_desc<256xf32, #xegpu.layout<sg_layout = [8], sg_data = [16]>>) -> (!xegpu.tensor_desc<256xf32, #xegpu.layout<sg_layout = [8], sg_data = [16]>>, !xegpu.tensor_desc<256xf32, #xegpu.layout<sg_layout = [8], sg_data = [16]>>)
      "gpu.return"() : () -> ()
    }) {sym_name = "scf_for", workgroup_attributions = 0 : i64} : () -> ()
    "gpu.func"() <{function_type = (memref<1024xf32>, memref<1024xf32>) -> ()}> ({
    ^bb0(%arg5: memref<1024xf32>, %arg6: memref<1024xf32>):
      %19 = "arith.constant"() <{value = 1 : i32}> : () -> i32
      %20 = "arith.constant"() <{value = 10 : i32}> : () -> i32
      %21 = "arith.constant"() <{value = 0 : i32}> : () -> i32
      %22 = "xegpu.create_nd_tdesc"(%arg5) <{const_offsets = array<i64: 0>, operandSegmentSizes = array<i32: 1, 0, 0, 0>}> : (memref<1024xf32>) -> !xegpu.tensor_desc<256xf32, #xegpu.layout<sg_layout = [8], sg_data = [16]>>
      %23 = "xegpu.load_nd"(%22) <{layout = #xegpu.layout<sg_layout = [8], sg_data = [16]>}> : (!xegpu.tensor_desc<256xf32, #xegpu.layout<sg_layout = [8], sg_data = [16]>>) -> vector<256xf32>
      %24 = "xegpu.create_nd_tdesc"(%arg6) <{const_offsets = array<i64: 0>, operandSegmentSizes = array<i32: 1, 0, 0, 0>}> : (memref<1024xf32>) -> !xegpu.tensor_desc<256xf32, #xegpu.layout<sg_layout = [8], sg_data = [16]>>
      %25:2 = "scf.while"(%23, %21) ({
      ^bb0(%arg9: vector<256xf32>, %arg10: i32):
        %29 = "arith.cmpi"(%arg10, %20) <{predicate = 2 : i64}> : (i32, i32) -> i1
        "scf.condition"(%29, %arg9, %arg10) : (i1, vector<256xf32>, i32) -> ()
      }, {
      ^bb0(%arg7: vector<256xf32>, %arg8: i32):
        "xegpu.store_nd"(%arg7, %24) : (vector<256xf32>, !xegpu.tensor_desc<256xf32, #xegpu.layout<sg_layout = [8], sg_data = [16]>>) -> ()
        %26 = "arith.addi"(%arg8, %19) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
        %27 = "xegpu.update_nd_offset"(%22) <{const_offsets = array<i64: 256>}> : (!xegpu.tensor_desc<256xf32, #xegpu.layout<sg_layout = [8], sg_data = [16]>>) -> !xegpu.tensor_desc<256xf32, #xegpu.layout<sg_layout = [8], sg_data = [16]>>
        %28 = "xegpu.load_nd"(%27) <{layout = #xegpu.layout<sg_layout = [8], sg_data = [16]>}> : (!xegpu.tensor_desc<256xf32, #xegpu.layout<sg_layout = [8], sg_data = [16]>>) -> vector<256xf32>
        "scf.yield"(%28, %26) : (vector<256xf32>, i32) -> ()
      }) : (vector<256xf32>, i32) -> (vector<256xf32>, i32)
      "gpu.return"() : () -> ()
    }) {sym_name = "scf_while_and_condition", workgroup_attributions = 0 : i64} : () -> ()
    "gpu.func"() <{function_type = (memref<1024xf32>, memref<1024xf32>) -> ()}> ({
    ^bb0(%arg3: memref<1024xf32>, %arg4: memref<1024xf32>):
      %11 = "arith.constant"() <{value = 10 : index}> : () -> index
      %12 = "gpu.subgroup_id"() : () -> index
      %13 = "xegpu.create_nd_tdesc"(%arg3) <{const_offsets = array<i64: 0>, operandSegmentSizes = array<i32: 1, 0, 0, 0>}> : (memref<1024xf32>) -> !xegpu.tensor_desc<256xf32, #xegpu.layout<sg_layout = [8], sg_data = [16]>>
      %14 = "xegpu.create_nd_tdesc"(%arg4) <{const_offsets = array<i64: 0>, operandSegmentSizes = array<i32: 1, 0, 0, 0>}> : (memref<1024xf32>) -> !xegpu.tensor_desc<256xf32, #xegpu.layout<sg_layout = [8], sg_data = [16]>>
      %15 = "arith.cmpi"(%12, %11) <{predicate = 0 : i64}> : (index, index) -> i1
      %16 = "scf.if"(%15) ({
        %18 = "xegpu.load_nd"(%13) <{layout = #xegpu.layout<sg_layout = [8], sg_data = [16]>}> : (!xegpu.tensor_desc<256xf32, #xegpu.layout<sg_layout = [8], sg_data = [16]>>) -> vector<256xf32>
        "scf.yield"(%18) : (vector<256xf32>) -> ()
      }, {
        %17 = "xegpu.load_nd"(%14) <{layout = #xegpu.layout<sg_layout = [8], sg_data = [16]>}> : (!xegpu.tensor_desc<256xf32, #xegpu.layout<sg_layout = [8], sg_data = [16]>>) -> vector<256xf32>
        "scf.yield"(%17) : (vector<256xf32>) -> ()
      }) {layout_result_0 = #xegpu.layout<sg_layout = [8], sg_data = [16]>} : (i1) -> vector<256xf32>
      "xegpu.store_nd"(%16, %13) : (vector<256xf32>, !xegpu.tensor_desc<256xf32, #xegpu.layout<sg_layout = [8], sg_data = [16]>>) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "scf_if", workgroup_attributions = 0 : i64} : () -> ()
    "gpu.func"() <{function_type = (memref<1024xf32>, memref<1024xf32>) -> ()}> ({
    ^bb0(%arg1: memref<1024xf32>, %arg2: memref<1024xf32>):
      %3 = "arith.constant"() <{value = 10 : index}> : () -> index
      %4 = "gpu.subgroup_id"() : () -> index
      %5 = "xegpu.create_nd_tdesc"(%arg1) <{const_offsets = array<i64: 0>, operandSegmentSizes = array<i32: 1, 0, 0, 0>}> : (memref<1024xf32>) -> !xegpu.tensor_desc<256xf32, #xegpu.layout<sg_layout = [8], sg_data = [16]>>
      %6 = "xegpu.load_nd"(%5) <{layout = #xegpu.layout<sg_layout = [8], sg_data = [16]>}> : (!xegpu.tensor_desc<256xf32, #xegpu.layout<sg_layout = [8], sg_data = [16]>>) -> vector<256xf32>
      %7 = "arith.cmpi"(%4, %3) <{predicate = 0 : i64}> : (index, index) -> i1
      %8 = "scf.if"(%7) ({
        %10 = "xegpu.create_nd_tdesc"(%arg1) <{const_offsets = array<i64: 0>, operandSegmentSizes = array<i32: 1, 0, 0, 0>}> : (memref<1024xf32>) -> !xegpu.tensor_desc<256xf32, #xegpu.layout<sg_layout = [8], sg_data = [16]>>
        "scf.yield"(%10) : (!xegpu.tensor_desc<256xf32, #xegpu.layout<sg_layout = [8], sg_data = [16]>>) -> ()
      }, {
        %9 = "xegpu.create_nd_tdesc"(%arg2) <{const_offsets = array<i64: 0>, operandSegmentSizes = array<i32: 1, 0, 0, 0>}> : (memref<1024xf32>) -> !xegpu.tensor_desc<256xf32, #xegpu.layout<sg_layout = [8], sg_data = [16]>>
        "scf.yield"(%9) : (!xegpu.tensor_desc<256xf32, #xegpu.layout<sg_layout = [8], sg_data = [16]>>) -> ()
      }) : (i1) -> !xegpu.tensor_desc<256xf32, #xegpu.layout<sg_layout = [8], sg_data = [16]>>
      "xegpu.store_nd"(%6, %8) : (vector<256xf32>, !xegpu.tensor_desc<256xf32, #xegpu.layout<sg_layout = [8], sg_data = [16]>>) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "scf_if_tensor_desc", workgroup_attributions = 0 : i64} : () -> ()
    "gpu.func"() <{function_type = (memref<32x64xf32>) -> ()}> ({
    ^bb0(%arg0: memref<32x64xf32>):
      %0 = "xegpu.create_nd_tdesc"(%arg0) <{const_offsets = array<i64: 0, 0>, operandSegmentSizes = array<i32: 1, 0, 0, 0>}> : (memref<32x64xf32>) -> !xegpu.tensor_desc<32x64xf32, #xegpu.layout<sg_layout = [2, 2], sg_data = [16, 16], inst_data = [16, 16]>>
      %1 = "xegpu.load_nd"(%0) <{layout = #xegpu.layout<sg_layout = [2, 2], sg_data = [16, 16], inst_data = [16, 16]>}> : (!xegpu.tensor_desc<32x64xf32, #xegpu.layout<sg_layout = [2, 2], sg_data = [16, 16], inst_data = [16, 16]>>) -> vector<32x64xf32>
      %2 = "xegpu.convert_layout"(%1) <{input_layout = #xegpu.layout<sg_layout = [2, 2], sg_data = [16, 16], inst_data = [16, 16]>, target_layout = #xegpu.layout<sg_layout = [2, 2], sg_data = [16, 16], inst_data = [8, 16]>}> : (vector<32x64xf32>) -> vector<32x64xf32>
      "gpu.return"() : () -> ()
    }) {sym_name = "convert_layout_optimal", workgroup_attributions = 0 : i64} : () -> ()
  }) : () -> ()
}) : () -> ()

