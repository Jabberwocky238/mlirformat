"builtin.module"() ({
  "gpu.module"() <{sym_name = "test"}> ({
    "gpu.func"() <{function_type = (memref<24x32xf32>) -> !xegpu.tensor_desc<24x32xf32, #xegpu.layout<inst_data = [8, 16]>>}> ({
    ^bb0(%arg28: memref<24x32xf32>):
      %82 = "xegpu.create_nd_tdesc"(%arg28) <{const_offsets = array<i64: 0, 0>, operandSegmentSizes = array<i32: 1, 0, 0, 0>}> : (memref<24x32xf32>) -> !xegpu.tensor_desc<24x32xf32, #xegpu.layout<inst_data = [8, 16]>>
      "gpu.return"(%82) : (!xegpu.tensor_desc<24x32xf32, #xegpu.layout<inst_data = [8, 16]>>) -> ()
    }) {sym_name = "create_nd_tdesc", workgroup_attributions = 0 : i64} : () -> ()
    "gpu.func"() <{function_type = (memref<64xf32>) -> !xegpu.tensor_desc<32xf32, #xegpu.layout<inst_data = [16]>>}> ({
    ^bb0(%arg27: memref<64xf32>):
      %81 = "xegpu.create_nd_tdesc"(%arg27) <{const_offsets = array<i64: 0>, operandSegmentSizes = array<i32: 1, 0, 0, 0>}> : (memref<64xf32>) -> !xegpu.tensor_desc<32xf32, #xegpu.layout<inst_data = [16]>>
      "gpu.return"(%81) : (!xegpu.tensor_desc<32xf32, #xegpu.layout<inst_data = [16]>>) -> ()
    }) {sym_name = "create_nd_tdesc_1d", workgroup_attributions = 0 : i64} : () -> ()
    "gpu.func"() <{function_type = (memref<24x32xf32>) -> !xegpu.tensor_desc<24x32xf32, #xegpu.layout<inst_data = [8, 16]>>}> ({
    ^bb0(%arg26: memref<24x32xf32>):
      %79 = "xegpu.create_nd_tdesc"(%arg26) <{const_offsets = array<i64: 0, 0>, operandSegmentSizes = array<i32: 1, 0, 0, 0>}> : (memref<24x32xf32>) -> !xegpu.tensor_desc<24x32xf32, #xegpu.layout<inst_data = [8, 16]>>
      %80 = "xegpu.update_nd_offset"(%79) <{const_offsets = array<i64: 0, 16>}> : (!xegpu.tensor_desc<24x32xf32, #xegpu.layout<inst_data = [8, 16]>>) -> !xegpu.tensor_desc<24x32xf32, #xegpu.layout<inst_data = [8, 16]>>
      "gpu.return"(%80) : (!xegpu.tensor_desc<24x32xf32, #xegpu.layout<inst_data = [8, 16]>>) -> ()
    }) {sym_name = "update_nd_tdesc", workgroup_attributions = 0 : i64} : () -> ()
    "gpu.func"() <{function_type = (memref<64xf32>) -> !xegpu.tensor_desc<32xf32, #xegpu.layout<inst_data = [16]>>}> ({
    ^bb0(%arg25: memref<64xf32>):
      %77 = "xegpu.create_nd_tdesc"(%arg25) <{const_offsets = array<i64: 0>, operandSegmentSizes = array<i32: 1, 0, 0, 0>}> : (memref<64xf32>) -> !xegpu.tensor_desc<32xf32, #xegpu.layout<inst_data = [16]>>
      %78 = "xegpu.update_nd_offset"(%77) <{const_offsets = array<i64: 32>}> : (!xegpu.tensor_desc<32xf32, #xegpu.layout<inst_data = [16]>>) -> !xegpu.tensor_desc<32xf32, #xegpu.layout<inst_data = [16]>>
      "gpu.return"(%78) : (!xegpu.tensor_desc<32xf32, #xegpu.layout<inst_data = [16]>>) -> ()
    }) {sym_name = "update_nd_tdesc_1d", workgroup_attributions = 0 : i64} : () -> ()
    "gpu.func"() <{function_type = (memref<24x32xf32>) -> ()}> ({
    ^bb0(%arg24: memref<24x32xf32>):
      %76 = "xegpu.create_nd_tdesc"(%arg24) <{const_offsets = array<i64: 0, 0>, operandSegmentSizes = array<i32: 1, 0, 0, 0>}> : (memref<24x32xf32>) -> !xegpu.tensor_desc<24x32xf32, #xegpu.layout<inst_data = [8, 16]>>
      "xegpu.prefetch_nd"(%76) : (!xegpu.tensor_desc<24x32xf32, #xegpu.layout<inst_data = [8, 16]>>) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "prefetch_nd_tdesc", workgroup_attributions = 0 : i64} : () -> ()
    "gpu.func"() <{function_type = (memref<64xf32>) -> ()}> ({
    ^bb0(%arg23: memref<64xf32>):
      %75 = "xegpu.create_nd_tdesc"(%arg23) <{const_offsets = array<i64: 0>, operandSegmentSizes = array<i32: 1, 0, 0, 0>}> : (memref<64xf32>) -> !xegpu.tensor_desc<64xf32, #xegpu.layout<inst_data = [16]>>
      "xegpu.prefetch_nd"(%75) : (!xegpu.tensor_desc<64xf32, #xegpu.layout<inst_data = [16]>>) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "prefetch_nd_tdesc_1d", workgroup_attributions = 0 : i64} : () -> ()
    "gpu.func"() <{function_type = (memref<24x32xf32>) -> vector<24x32xf32>}> ({
    ^bb0(%arg22: memref<24x32xf32>):
      %73 = "xegpu.create_nd_tdesc"(%arg22) <{const_offsets = array<i64: 0, 0>, operandSegmentSizes = array<i32: 1, 0, 0, 0>}> : (memref<24x32xf32>) -> !xegpu.tensor_desc<24x32xf32, #xegpu.layout<inst_data = [8, 16]>>
      %74 = "xegpu.load_nd"(%73) : (!xegpu.tensor_desc<24x32xf32, #xegpu.layout<inst_data = [8, 16]>>) -> vector<24x32xf32>
      "gpu.return"(%74) : (vector<24x32xf32>) -> ()
    }) {sym_name = "load_nd", workgroup_attributions = 0 : i64} : () -> ()
    "gpu.func"() <{function_type = (memref<64xf32>) -> vector<64xf32>}> ({
    ^bb0(%arg21: memref<64xf32>):
      %71 = "xegpu.create_nd_tdesc"(%arg21) <{const_offsets = array<i64: 0>, operandSegmentSizes = array<i32: 1, 0, 0, 0>}> : (memref<64xf32>) -> !xegpu.tensor_desc<64xf32, #xegpu.layout<inst_data = [16]>>
      %72 = "xegpu.load_nd"(%71) : (!xegpu.tensor_desc<64xf32, #xegpu.layout<inst_data = [16]>>) -> vector<64xf32>
      "gpu.return"(%72) : (vector<64xf32>) -> ()
    }) {sym_name = "load_nd_1d", workgroup_attributions = 0 : i64} : () -> ()
    "gpu.func"() <{function_type = (memref<24x32xf32>) -> ()}> ({
    ^bb0(%arg20: memref<24x32xf32>):
      %69 = "xegpu.create_nd_tdesc"(%arg20) <{const_offsets = array<i64: 0, 0>, operandSegmentSizes = array<i32: 1, 0, 0, 0>}> : (memref<24x32xf32>) -> !xegpu.tensor_desc<24x32xf32, #xegpu.layout<inst_data = [8, 16]>>
      %70 = "arith.constant"() <{value = dense<9.000000e+00> : vector<24x32xf32>}> : () -> vector<24x32xf32>
      "xegpu.store_nd"(%70, %69) : (vector<24x32xf32>, !xegpu.tensor_desc<24x32xf32, #xegpu.layout<inst_data = [8, 16]>>) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "store_nd", workgroup_attributions = 0 : i64} : () -> ()
    "gpu.func"() <{function_type = (memref<64xf32>) -> ()}> ({
    ^bb0(%arg19: memref<64xf32>):
      %67 = "xegpu.create_nd_tdesc"(%arg19) <{const_offsets = array<i64: 0>, operandSegmentSizes = array<i32: 1, 0, 0, 0>}> : (memref<64xf32>) -> !xegpu.tensor_desc<64xf32, #xegpu.layout<inst_data = [16]>>
      %68 = "arith.constant"() <{value = dense<9.000000e+00> : vector<64xf32>}> : () -> vector<64xf32>
      "xegpu.store_nd"(%68, %67) : (vector<64xf32>, !xegpu.tensor_desc<64xf32, #xegpu.layout<inst_data = [16]>>) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "store_nd_1d", workgroup_attributions = 0 : i64} : () -> ()
    "gpu.func"() <{function_type = (memref<24x32xf32>) -> ()}> ({
    ^bb0(%arg18: memref<24x32xf32>):
      %63 = "xegpu.create_nd_tdesc"(%arg18) <{const_offsets = array<i64: 0, 0>, operandSegmentSizes = array<i32: 1, 0, 0, 0>}> : (memref<24x32xf32>) -> !xegpu.tensor_desc<24x32xf32, #xegpu.layout<inst_data = [8, 16]>>
      %64 = "arith.constant"() <{value = dense<9.000000e+00> : vector<24x32xf32>}> : () -> vector<24x32xf32>
      %65 = "xegpu.load_nd"(%63) : (!xegpu.tensor_desc<24x32xf32, #xegpu.layout<inst_data = [8, 16]>>) -> vector<24x32xf32>
      %66 = "arith.addf"(%64, %65) <{fastmath = #arith.fastmath<none>}> : (vector<24x32xf32>, vector<24x32xf32>) -> vector<24x32xf32>
      "xegpu.store_nd"(%66, %63) : (vector<24x32xf32>, !xegpu.tensor_desc<24x32xf32, #xegpu.layout<inst_data = [8, 16]>>) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "createNd_loadNd_storeNd", workgroup_attributions = 0 : i64} : () -> ()
    "gpu.func"() <{function_type = (vector<32x32xf16>, vector<32x32xf16>) -> vector<32x32xf32>}> ({
    ^bb0(%arg16: vector<32x32xf16>, %arg17: vector<32x32xf16>):
      %62 = "xegpu.dpas"(%arg16, %arg17) : (vector<32x32xf16>, vector<32x32xf16>) -> vector<32x32xf32>
      "gpu.return"(%62) : (vector<32x32xf32>) -> ()
    }) {sym_name = "dpas", workgroup_attributions = 0 : i64} : () -> ()
    "gpu.func"() <{function_type = (ui64) -> !xegpu.tensor_desc<32xf32, #xegpu.scatter_tdesc_attr<>, #xegpu.layout<inst_data = [16]>>}> ({
    ^bb0(%arg15: ui64):
      %60 = "arith.constant"() <{value = dense<[0, 8, 16, 24, 32, 40, 48, 56, 64, 72, 80, 88, 96, 104, 112, 120, 128, 136, 144, 152, 160, 168, 176, 184, 192, 200, 208, 216, 224, 232, 240, 248]> : vector<32xindex>}> : () -> vector<32xindex>
      %61 = "xegpu.create_tdesc"(%arg15, %60) : (ui64, vector<32xindex>) -> !xegpu.tensor_desc<32xf32, #xegpu.scatter_tdesc_attr<>, #xegpu.layout<inst_data = [16]>>
      "gpu.return"(%61) : (!xegpu.tensor_desc<32xf32, #xegpu.scatter_tdesc_attr<>, #xegpu.layout<inst_data = [16]>>) -> ()
    }) {sym_name = "create_tdesc_vec", workgroup_attributions = 0 : i64} : () -> ()
    "gpu.func"() <{function_type = (ui64) -> !xegpu.tensor_desc<32xf32, #xegpu.scatter_tdesc_attr<>, #xegpu.layout<inst_data = [16]>>}> ({
    ^bb0(%arg14: ui64):
      %56 = "arith.constant"() <{value = dense<8> : vector<32xindex>}> : () -> vector<32xindex>
      %57 = "vector.step"() : () -> vector<32xindex>
      %58 = "arith.muli"(%57, %56) <{overflowFlags = #arith.overflow<none>}> : (vector<32xindex>, vector<32xindex>) -> vector<32xindex>
      %59 = "xegpu.create_tdesc"(%arg14, %58) : (ui64, vector<32xindex>) -> !xegpu.tensor_desc<32xf32, #xegpu.scatter_tdesc_attr<>, #xegpu.layout<inst_data = [16]>>
      "gpu.return"(%59) : (!xegpu.tensor_desc<32xf32, #xegpu.scatter_tdesc_attr<>, #xegpu.layout<inst_data = [16]>>) -> ()
    }) {sym_name = "create_tdesc_step", workgroup_attributions = 0 : i64} : () -> ()
    "gpu.func"() <{function_type = (ui64) -> vector<32xf32>}> ({
    ^bb0(%arg13: ui64):
      %51 = "arith.constant"() <{value = dense<[0, 8, 16, 24, 32, 40, 48, 56, 64, 72, 80, 88, 96, 104, 112, 120, 128, 136, 144, 152, 160, 168, 176, 184, 192, 200, 208, 216, 224, 232, 240, 248]> : vector<32xindex>}> : () -> vector<32xindex>
      %52 = "arith.constant"() <{value = 17 : index}> : () -> index
      %53 = "vector.create_mask"(%52) : (index) -> vector<32xi1>
      %54 = "xegpu.create_tdesc"(%arg13, %51) : (ui64, vector<32xindex>) -> !xegpu.tensor_desc<32xf32, #xegpu.scatter_tdesc_attr<>, #xegpu.layout<inst_data = [16]>>
      %55 = "xegpu.load"(%54, %53) : (!xegpu.tensor_desc<32xf32, #xegpu.scatter_tdesc_attr<>, #xegpu.layout<inst_data = [16]>>, vector<32xi1>) -> vector<32xf32>
      "gpu.return"(%55) : (vector<32xf32>) -> ()
    }) {sym_name = "load", workgroup_attributions = 0 : i64} : () -> ()
    "gpu.func"() <{function_type = (ui64) -> vector<32xf32>}> ({
    ^bb0(%arg12: ui64):
      %47 = "arith.constant"() <{value = dense<[0, 8, 16, 24, 32, 40, 48, 56, 64, 72, 80, 88, 96, 104, 112, 120, 128, 136, 144, 152, 160, 168, 176, 184, 192, 200, 208, 216, 224, 232, 240, 248]> : vector<32xindex>}> : () -> vector<32xindex>
      %48 = "arith.constant"() <{value = 17 : index}> : () -> index
      %49 = "vector.create_mask"(%48) : (index) -> vector<32xi1>
      %50 = "xegpu.load"(%arg12, %47, %49) <{chunk_size = 1 : i64, l1_hint = #xegpu.cache_hint<cached>, layout = #xegpu.layout<inst_data = [16]>}> : (ui64, vector<32xindex>, vector<32xi1>) -> vector<32xf32>
      "gpu.return"(%50) : (vector<32xf32>) -> ()
    }) {sym_name = "load_with_offsets", workgroup_attributions = 0 : i64} : () -> ()
    "gpu.func"() <{function_type = (ui64) -> ()}> ({
    ^bb0(%arg11: ui64):
      %45 = "arith.constant"() <{value = dense<[0, 8, 16, 24, 32, 40, 48, 56, 64, 72, 80, 88, 96, 104, 112, 120, 128, 136, 144, 152, 160, 168, 176, 184, 192, 200, 208, 216, 224, 232, 240, 248]> : vector<32xindex>}> : () -> vector<32xindex>
      %46 = "xegpu.create_tdesc"(%arg11, %45) : (ui64, vector<32xindex>) -> !xegpu.tensor_desc<32xf32, #xegpu.scatter_tdesc_attr<>, #xegpu.layout<inst_data = [16]>>
      "xegpu.prefetch"(%46) : (!xegpu.tensor_desc<32xf32, #xegpu.scatter_tdesc_attr<>, #xegpu.layout<inst_data = [16]>>) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "prefetch", workgroup_attributions = 0 : i64} : () -> ()
    "gpu.func"() <{function_type = (ui64) -> ()}> ({
    ^bb0(%arg10: ui64):
      %40 = "arith.constant"() <{value = dense<[0, 8, 16, 24, 32, 40, 48, 56, 64, 72, 80, 88, 96, 104, 112, 120, 128, 136, 144, 152, 160, 168, 176, 184, 192, 200, 208, 216, 224, 232, 240, 248]> : vector<32xindex>}> : () -> vector<32xindex>
      %41 = "arith.constant"() <{value = 17 : index}> : () -> index
      %42 = "vector.create_mask"(%41) : (index) -> vector<32xi1>
      %43 = "arith.constant"() <{value = dense<1.023000e+03> : vector<32xf32>}> : () -> vector<32xf32>
      %44 = "xegpu.create_tdesc"(%arg10, %40) : (ui64, vector<32xindex>) -> !xegpu.tensor_desc<32xf32, #xegpu.scatter_tdesc_attr<>, #xegpu.layout<inst_data = [16]>>
      "xegpu.store"(%43, %44, %42) : (vector<32xf32>, !xegpu.tensor_desc<32xf32, #xegpu.scatter_tdesc_attr<>, #xegpu.layout<inst_data = [16]>>, vector<32xi1>) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "store", workgroup_attributions = 0 : i64} : () -> ()
    "gpu.func"() <{function_type = (ui64) -> ()}> ({
    ^bb0(%arg9: ui64):
      %36 = "arith.constant"() <{value = dense<[0, 8, 16, 24, 32, 40, 48, 56, 64, 72, 80, 88, 96, 104, 112, 120, 128, 136, 144, 152, 160, 168, 176, 184, 192, 200, 208, 216, 224, 232, 240, 248]> : vector<32xindex>}> : () -> vector<32xindex>
      %37 = "arith.constant"() <{value = 17 : index}> : () -> index
      %38 = "vector.create_mask"(%37) : (index) -> vector<32xi1>
      %39 = "arith.constant"() <{value = dense<1.023000e+03> : vector<32xf32>}> : () -> vector<32xf32>
      "xegpu.store"(%39, %arg9, %36, %38) <{chunk_size = 1 : i64, l1_hint = #xegpu.cache_hint<cached>, layout = #xegpu.layout<inst_data = [16]>}> : (vector<32xf32>, ui64, vector<32xindex>, vector<32xi1>) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "store_with_offsets", workgroup_attributions = 0 : i64} : () -> ()
    "gpu.func"() <{function_type = (ui64) -> !xegpu.tensor_desc<32x4xf32, #xegpu.scatter_tdesc_attr<chunk_size = 4 : i64>, #xegpu.layout<inst_data = [16, 4]>>}> ({
    ^bb0(%arg8: ui64):
      %32 = "arith.constant"() <{value = dense<8> : vector<32xindex>}> : () -> vector<32xindex>
      %33 = "vector.step"() : () -> vector<32xindex>
      %34 = "arith.muli"(%33, %32) <{overflowFlags = #arith.overflow<none>}> : (vector<32xindex>, vector<32xindex>) -> vector<32xindex>
      %35 = "xegpu.create_tdesc"(%arg8, %34) : (ui64, vector<32xindex>) -> !xegpu.tensor_desc<32x4xf32, #xegpu.scatter_tdesc_attr<chunk_size = 4 : i64>, #xegpu.layout<inst_data = [16, 4]>>
      "gpu.return"(%35) : (!xegpu.tensor_desc<32x4xf32, #xegpu.scatter_tdesc_attr<chunk_size = 4 : i64>, #xegpu.layout<inst_data = [16, 4]>>) -> ()
    }) {sym_name = "create_tdesc_step_chunk", workgroup_attributions = 0 : i64} : () -> ()
    "gpu.func"() <{function_type = (ui64) -> !xegpu.tensor_desc<32x4xf32, #xegpu.scatter_tdesc_attr<chunk_size = 4 : i64>, #xegpu.layout<inst_data = [16, 2]>>}> ({
    ^bb0(%arg7: ui64):
      %28 = "arith.constant"() <{value = dense<8> : vector<32xindex>}> : () -> vector<32xindex>
      %29 = "vector.step"() : () -> vector<32xindex>
      %30 = "arith.muli"(%29, %28) <{overflowFlags = #arith.overflow<none>}> : (vector<32xindex>, vector<32xindex>) -> vector<32xindex>
      %31 = "xegpu.create_tdesc"(%arg7, %30) : (ui64, vector<32xindex>) -> !xegpu.tensor_desc<32x4xf32, #xegpu.scatter_tdesc_attr<chunk_size = 4 : i64>, #xegpu.layout<inst_data = [16, 2]>>
      "gpu.return"(%31) : (!xegpu.tensor_desc<32x4xf32, #xegpu.scatter_tdesc_attr<chunk_size = 4 : i64>, #xegpu.layout<inst_data = [16, 2]>>) -> ()
    }) {sym_name = "create_tdesc_step_chunk2", workgroup_attributions = 0 : i64} : () -> ()
    "gpu.func"() <{function_type = (ui64) -> !xegpu.tensor_desc<16x8xf32, #xegpu.scatter_tdesc_attr<chunk_size = 8 : i64>, #xegpu.layout<inst_data = [16, 2]>>}> ({
    ^bb0(%arg6: ui64):
      %24 = "arith.constant"() <{value = dense<8> : vector<16xindex>}> : () -> vector<16xindex>
      %25 = "vector.step"() : () -> vector<16xindex>
      %26 = "arith.muli"(%25, %24) <{overflowFlags = #arith.overflow<none>}> : (vector<16xindex>, vector<16xindex>) -> vector<16xindex>
      %27 = "xegpu.create_tdesc"(%arg6, %26) : (ui64, vector<16xindex>) -> !xegpu.tensor_desc<16x8xf32, #xegpu.scatter_tdesc_attr<chunk_size = 8 : i64>, #xegpu.layout<inst_data = [16, 2]>>
      "gpu.return"(%27) : (!xegpu.tensor_desc<16x8xf32, #xegpu.scatter_tdesc_attr<chunk_size = 8 : i64>, #xegpu.layout<inst_data = [16, 2]>>) -> ()
    }) {sym_name = "create_tdesc_step_chunk3", workgroup_attributions = 0 : i64} : () -> ()
    "gpu.func"() <{function_type = (ui64) -> vector<32x4xf32>}> ({
    ^bb0(%arg5: ui64):
      %19 = "arith.constant"() <{value = dense<[0, 8, 16, 24, 32, 40, 48, 56, 64, 72, 80, 88, 96, 104, 112, 120, 128, 136, 144, 152, 160, 168, 176, 184, 192, 200, 208, 216, 224, 232, 240, 248]> : vector<32xindex>}> : () -> vector<32xindex>
      %20 = "arith.constant"() <{value = 17 : index}> : () -> index
      %21 = "vector.create_mask"(%20) : (index) -> vector<32xi1>
      %22 = "xegpu.create_tdesc"(%arg5, %19) : (ui64, vector<32xindex>) -> !xegpu.tensor_desc<32x4xf32, #xegpu.scatter_tdesc_attr<chunk_size = 4 : i64>, #xegpu.layout<inst_data = [16, 2]>>
      %23 = "xegpu.load"(%22, %21) <{l1_hint = #xegpu.cache_hint<cached>, l2_hint = #xegpu.cache_hint<uncached>}> : (!xegpu.tensor_desc<32x4xf32, #xegpu.scatter_tdesc_attr<chunk_size = 4 : i64>, #xegpu.layout<inst_data = [16, 2]>>, vector<32xi1>) -> vector<32x4xf32>
      "gpu.return"(%23) : (vector<32x4xf32>) -> ()
    }) {sym_name = "load_chunk", workgroup_attributions = 0 : i64} : () -> ()
    "gpu.func"() <{function_type = (ui64) -> vector<32x4xf32>}> ({
    ^bb0(%arg4: ui64):
      %15 = "arith.constant"() <{value = dense<[0, 8, 16, 24, 32, 40, 48, 56, 64, 72, 80, 88, 96, 104, 112, 120, 128, 136, 144, 152, 160, 168, 176, 184, 192, 200, 208, 216, 224, 232, 240, 248]> : vector<32xindex>}> : () -> vector<32xindex>
      %16 = "arith.constant"() <{value = 17 : index}> : () -> index
      %17 = "vector.create_mask"(%16) : (index) -> vector<32xi1>
      %18 = "xegpu.load"(%arg4, %15, %17) <{chunk_size = 4 : i64, l1_hint = #xegpu.cache_hint<cached>, layout = #xegpu.layout<inst_data = [16, 2]>}> : (ui64, vector<32xindex>, vector<32xi1>) -> vector<32x4xf32>
      "gpu.return"(%18) : (vector<32x4xf32>) -> ()
    }) {sym_name = "load_with_offsets_chunk", workgroup_attributions = 0 : i64} : () -> ()
    "gpu.func"() <{function_type = (ui64) -> ()}> ({
    ^bb0(%arg3: ui64):
      %10 = "arith.constant"() <{value = dense<[0, 8, 16, 24, 32, 40, 48, 56, 64, 72, 80, 88, 96, 104, 112, 120, 128, 136, 144, 152, 160, 168, 176, 184, 192, 200, 208, 216, 224, 232, 240, 248]> : vector<32xindex>}> : () -> vector<32xindex>
      %11 = "arith.constant"() <{value = 17 : index}> : () -> index
      %12 = "vector.create_mask"(%11) : (index) -> vector<32xi1>
      %13 = "arith.constant"() <{value = dense<1.023000e+03> : vector<32x4xf32>}> : () -> vector<32x4xf32>
      %14 = "xegpu.create_tdesc"(%arg3, %10) : (ui64, vector<32xindex>) -> !xegpu.tensor_desc<32x4xf32, #xegpu.scatter_tdesc_attr<chunk_size = 4 : i64>, #xegpu.layout<inst_data = [16, 2]>>
      "xegpu.store"(%13, %14, %12) <{l1_hint = #xegpu.cache_hint<cached>, l2_hint = #xegpu.cache_hint<uncached>}> : (vector<32x4xf32>, !xegpu.tensor_desc<32x4xf32, #xegpu.scatter_tdesc_attr<chunk_size = 4 : i64>, #xegpu.layout<inst_data = [16, 2]>>, vector<32xi1>) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "store_chunk", workgroup_attributions = 0 : i64} : () -> ()
    "gpu.func"() <{function_type = (ui64) -> ()}> ({
    ^bb0(%arg2: ui64):
      %6 = "arith.constant"() <{value = dense<[0, 8, 16, 24, 32, 40, 48, 56, 64, 72, 80, 88, 96, 104, 112, 120, 128, 136, 144, 152, 160, 168, 176, 184, 192, 200, 208, 216, 224, 232, 240, 248]> : vector<32xindex>}> : () -> vector<32xindex>
      %7 = "arith.constant"() <{value = 17 : index}> : () -> index
      %8 = "vector.create_mask"(%7) : (index) -> vector<32xi1>
      %9 = "arith.constant"() <{value = dense<1.023000e+03> : vector<32x4xf32>}> : () -> vector<32x4xf32>
      "xegpu.store"(%9, %arg2, %6, %8) <{chunk_size = 4 : i64, l1_hint = #xegpu.cache_hint<cached>, layout = #xegpu.layout<inst_data = [16, 2]>}> : (vector<32x4xf32>, ui64, vector<32xindex>, vector<32xi1>) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "store_with_offsets_chunk", workgroup_attributions = 0 : i64} : () -> ()
    "gpu.func"() <{function_type = (ui64) -> ()}> ({
    ^bb0(%arg1: ui64):
      %4 = "arith.constant"() <{value = dense<[0, 8, 16, 24, 32, 40, 48, 56, 64, 72, 80, 88, 96, 104, 112, 120, 128, 136, 144, 152, 160, 168, 176, 184, 192, 200, 208, 216, 224, 232, 240, 248]> : vector<32xindex>}> : () -> vector<32xindex>
      %5 = "xegpu.create_tdesc"(%arg1, %4) : (ui64, vector<32xindex>) -> !xegpu.tensor_desc<32x4xf32, #xegpu.scatter_tdesc_attr<chunk_size = 4 : i64>, #xegpu.layout<inst_data = [16, 2]>>
      "xegpu.prefetch"(%5) : (!xegpu.tensor_desc<32x4xf32, #xegpu.scatter_tdesc_attr<chunk_size = 4 : i64>, #xegpu.layout<inst_data = [16, 2]>>) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "prefetch_chunk", workgroup_attributions = 0 : i64} : () -> ()
    "gpu.func"() <{function_type = (ui64) -> !xegpu.tensor_desc<32x4xf32, #xegpu.scatter_tdesc_attr<chunk_size = 4 : i64>, #xegpu.layout<inst_data = [16, 2]>>}> ({
    ^bb0(%arg0: ui64):
      %0 = "arith.constant"() <{value = dense<[0, 8, 16, 24, 32, 40, 48, 56, 64, 72, 80, 88, 96, 104, 112, 120, 128, 136, 144, 152, 160, 168, 176, 184, 192, 200, 208, 216, 224, 232, 240, 248]> : vector<32xindex>}> : () -> vector<32xindex>
      %1 = "arith.constant"() <{value = dense<32> : vector<32xindex>}> : () -> vector<32xindex>
      %2 = "xegpu.create_tdesc"(%arg0, %0) : (ui64, vector<32xindex>) -> !xegpu.tensor_desc<32x4xf32, #xegpu.scatter_tdesc_attr<chunk_size = 4 : i64>, #xegpu.layout<inst_data = [16, 2]>>
      %3 = "xegpu.update_offset"(%2, %1) : (!xegpu.tensor_desc<32x4xf32, #xegpu.scatter_tdesc_attr<chunk_size = 4 : i64>, #xegpu.layout<inst_data = [16, 2]>>, vector<32xindex>) -> !xegpu.tensor_desc<32x4xf32, #xegpu.scatter_tdesc_attr<chunk_size = 4 : i64>, #xegpu.layout<inst_data = [16, 2]>>
      "gpu.return"(%3) : (!xegpu.tensor_desc<32x4xf32, #xegpu.scatter_tdesc_attr<chunk_size = 4 : i64>, #xegpu.layout<inst_data = [16, 2]>>) -> ()
    }) {sym_name = "update_chunk", workgroup_attributions = 0 : i64} : () -> ()
  }) : () -> ()
}) : () -> ()

