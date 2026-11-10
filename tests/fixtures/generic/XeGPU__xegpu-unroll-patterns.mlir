"builtin.module"() ({
  "gpu.module"() <{sym_name = "test"}> ({
    "gpu.func"() <{function_type = (memref<24x32xf32>) -> !xegpu.tensor_desc<24x32xf32, #xegpu.layout<inst_data = [8, 16]>>}> ({
    ^bb0(%arg23: memref<24x32xf32>):
      %38 = "xegpu.create_nd_tdesc"(%arg23) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<24x32xf32>) -> !xegpu.tensor_desc<24x32xf32, #xegpu.layout<inst_data = [8, 16]>>
      "gpu.return"(%38) : (!xegpu.tensor_desc<24x32xf32, #xegpu.layout<inst_data = [8, 16]>>) -> ()
    }) {sym_name = "create_nd_tdesc"} : () -> ()
    "gpu.func"() <{function_type = (memref<64xf32>) -> !xegpu.tensor_desc<32xf32, #xegpu.layout<inst_data = [16]>>}> ({
    ^bb0(%arg22: memref<64xf32>):
      %37 = "xegpu.create_nd_tdesc"(%arg22) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<64xf32>) -> !xegpu.tensor_desc<32xf32, #xegpu.layout<inst_data = [16]>>
      "gpu.return"(%37) : (!xegpu.tensor_desc<32xf32, #xegpu.layout<inst_data = [16]>>) -> ()
    }) {sym_name = "create_nd_tdesc_1d"} : () -> ()
    "gpu.func"() <{function_type = (memref<24x32xf32>) -> ()}> ({
    ^bb0(%arg21: memref<24x32xf32>):
      %36 = "xegpu.create_nd_tdesc"(%arg21) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<24x32xf32>) -> !xegpu.tensor_desc<24x32xf32, #xegpu.layout<inst_data = [8, 16]>>
      "xegpu.prefetch_nd"(%36) <{const_offsets = array<i64: 0, 0>}> : (!xegpu.tensor_desc<24x32xf32, #xegpu.layout<inst_data = [8, 16]>>) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "prefetch_nd_tdesc"} : () -> ()
    "gpu.func"() <{function_type = (memref<64xf32>) -> ()}> ({
    ^bb0(%arg20: memref<64xf32>):
      %35 = "xegpu.create_nd_tdesc"(%arg20) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<64xf32>) -> !xegpu.tensor_desc<64xf32, #xegpu.layout<inst_data = [16]>>
      "xegpu.prefetch_nd"(%35) <{const_offsets = array<i64: 0>}> : (!xegpu.tensor_desc<64xf32, #xegpu.layout<inst_data = [16]>>) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "prefetch_nd_tdesc_1d"} : () -> ()
    "gpu.func"() <{function_type = (memref<24x32xf32>) -> vector<24x32xf32>}> ({
    ^bb0(%arg19: memref<24x32xf32>):
      %33 = "xegpu.create_nd_tdesc"(%arg19) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<24x32xf32>) -> !xegpu.tensor_desc<24x32xf32, #xegpu.layout<inst_data = [8, 16]>>
      %34 = "xegpu.load_nd"(%33) <{const_offsets = array<i64: 0, 0>}> : (!xegpu.tensor_desc<24x32xf32, #xegpu.layout<inst_data = [8, 16]>>) -> vector<24x32xf32>
      "gpu.return"(%34) : (vector<24x32xf32>) -> ()
    }) {sym_name = "load_nd"} : () -> ()
    "gpu.func"() <{function_type = (memref<64xf32>) -> vector<64xf32>}> ({
    ^bb0(%arg18: memref<64xf32>):
      %31 = "xegpu.create_nd_tdesc"(%arg18) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<64xf32>) -> !xegpu.tensor_desc<64xf32, #xegpu.layout<inst_data = [16]>>
      %32 = "xegpu.load_nd"(%31) <{const_offsets = array<i64: 0>}> : (!xegpu.tensor_desc<64xf32, #xegpu.layout<inst_data = [16]>>) -> vector<64xf32>
      "gpu.return"(%32) : (vector<64xf32>) -> ()
    }) {sym_name = "load_nd_1d"} : () -> ()
    "gpu.func"() <{function_type = (memref<24x32xf32>) -> ()}> ({
    ^bb0(%arg17: memref<24x32xf32>):
      %29 = "xegpu.create_nd_tdesc"(%arg17) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<24x32xf32>) -> !xegpu.tensor_desc<24x32xf32, #xegpu.layout<inst_data = [8, 16]>>
      %30 = "arith.constant"() <{value = dense<9.000000e+00> : vector<24x32xf32>}> : () -> vector<24x32xf32>
      "xegpu.store_nd"(%30, %29) <{const_offsets = array<i64: 0, 0>}> : (vector<24x32xf32>, !xegpu.tensor_desc<24x32xf32, #xegpu.layout<inst_data = [8, 16]>>) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "store_nd"} : () -> ()
    "gpu.func"() <{function_type = (memref<64xf32>) -> ()}> ({
    ^bb0(%arg16: memref<64xf32>):
      %27 = "xegpu.create_nd_tdesc"(%arg16) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<64xf32>) -> !xegpu.tensor_desc<64xf32, #xegpu.layout<inst_data = [16]>>
      %28 = "arith.constant"() <{value = dense<9.000000e+00> : vector<64xf32>}> : () -> vector<64xf32>
      "xegpu.store_nd"(%28, %27) <{const_offsets = array<i64: 0>}> : (vector<64xf32>, !xegpu.tensor_desc<64xf32, #xegpu.layout<inst_data = [16]>>) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "store_nd_1d"} : () -> ()
    "gpu.func"() <{function_type = (memref<24x32xf32>) -> ()}> ({
    ^bb0(%arg15: memref<24x32xf32>):
      %23 = "xegpu.create_nd_tdesc"(%arg15) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<24x32xf32>) -> !xegpu.tensor_desc<24x32xf32, #xegpu.layout<inst_data = [8, 16]>>
      %24 = "arith.constant"() <{value = dense<9.000000e+00> : vector<24x32xf32>}> : () -> vector<24x32xf32>
      %25 = "xegpu.load_nd"(%23) <{const_offsets = array<i64: 0, 0>}> : (!xegpu.tensor_desc<24x32xf32, #xegpu.layout<inst_data = [8, 16]>>) -> vector<24x32xf32>
      %26 = "arith.addf"(%24, %25) <{fastmath = #arith.fastmath<none>}> : (vector<24x32xf32>, vector<24x32xf32>) -> vector<24x32xf32>
      "xegpu.store_nd"(%26, %23) <{const_offsets = array<i64: 0, 0>}> : (vector<24x32xf32>, !xegpu.tensor_desc<24x32xf32, #xegpu.layout<inst_data = [8, 16]>>) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "createNd_loadNd_storeNd"} : () -> ()
    "gpu.func"() <{function_type = (vector<32x32xf16>, vector<32x32xf16>) -> vector<32x32xf32>}> ({
    ^bb0(%arg13: vector<32x32xf16>, %arg14: vector<32x32xf16>):
      %22 = "xegpu.dpas"(%arg13, %arg14) : (vector<32x32xf16>, vector<32x32xf16>) -> vector<32x32xf32>
      "gpu.return"(%22) : (vector<32x32xf32>) -> ()
    }) {sym_name = "dpas"} : () -> ()
    "gpu.func"() <{function_type = (ui64) -> vector<32xf32>}> ({
    ^bb0(%arg12: ui64):
      %18 = "arith.constant"() <{value = dense<[0, 8, 16, 24, 32, 40, 48, 56, 64, 72, 80, 88, 96, 104, 112, 120, 128, 136, 144, 152, 160, 168, 176, 184, 192, 200, 208, 216, 224, 232, 240, 248]> : vector<32xindex>}> : () -> vector<32xindex>
      %19 = "arith.constant"() <{value = 17 : index}> : () -> index
      %20 = "vector.create_mask"(%19) : (index) -> vector<32xi1>
      %21 = "xegpu.load"(%arg12, %18, %20) <{chunk_size = 1 : i64, l1_hint = #xegpu.cache_hint<cached>, layout = #xegpu.layout<inst_data = [16]>}> : (ui64, vector<32xindex>, vector<32xi1>) -> vector<32xf32>
      "gpu.return"(%21) : (vector<32xf32>) -> ()
    }) {sym_name = "load_with_offsets"} : () -> ()
    "gpu.func"() <{function_type = (ui64) -> ()}> ({
    ^bb0(%arg11: ui64):
      %14 = "arith.constant"() <{value = dense<[0, 8, 16, 24, 32, 40, 48, 56, 64, 72, 80, 88, 96, 104, 112, 120, 128, 136, 144, 152, 160, 168, 176, 184, 192, 200, 208, 216, 224, 232, 240, 248]> : vector<32xindex>}> : () -> vector<32xindex>
      %15 = "arith.constant"() <{value = 17 : index}> : () -> index
      %16 = "vector.create_mask"(%15) : (index) -> vector<32xi1>
      %17 = "arith.constant"() <{value = dense<1.023000e+03> : vector<32xf32>}> : () -> vector<32xf32>
      "xegpu.store"(%17, %arg11, %14, %16) <{chunk_size = 1 : i64, l1_hint = #xegpu.cache_hint<cached>, layout = #xegpu.layout<inst_data = [16]>}> : (vector<32xf32>, ui64, vector<32xindex>, vector<32xi1>) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "store_with_offsets"} : () -> ()
    "gpu.func"() <{function_type = (ui64) -> vector<32x4xf32>}> ({
    ^bb0(%arg10: ui64):
      %10 = "arith.constant"() <{value = dense<[0, 8, 16, 24, 32, 40, 48, 56, 64, 72, 80, 88, 96, 104, 112, 120, 128, 136, 144, 152, 160, 168, 176, 184, 192, 200, 208, 216, 224, 232, 240, 248]> : vector<32xindex>}> : () -> vector<32xindex>
      %11 = "arith.constant"() <{value = 17 : index}> : () -> index
      %12 = "vector.create_mask"(%11) : (index) -> vector<32xi1>
      %13 = "xegpu.load"(%arg10, %10, %12) <{chunk_size = 4 : i64, l1_hint = #xegpu.cache_hint<cached>, layout = #xegpu.layout<inst_data = [16, 2]>}> : (ui64, vector<32xindex>, vector<32xi1>) -> vector<32x4xf32>
      "gpu.return"(%13) : (vector<32x4xf32>) -> ()
    }) {sym_name = "load_with_offsets_chunk"} : () -> ()
    "gpu.func"() <{function_type = (ui64) -> ()}> ({
    ^bb0(%arg9: ui64):
      %6 = "arith.constant"() <{value = dense<[0, 8, 16, 24, 32, 40, 48, 56, 64, 72, 80, 88, 96, 104, 112, 120, 128, 136, 144, 152, 160, 168, 176, 184, 192, 200, 208, 216, 224, 232, 240, 248]> : vector<32xindex>}> : () -> vector<32xindex>
      %7 = "arith.constant"() <{value = 17 : index}> : () -> index
      %8 = "vector.create_mask"(%7) : (index) -> vector<32xi1>
      %9 = "arith.constant"() <{value = dense<1.023000e+03> : vector<32x4xf32>}> : () -> vector<32x4xf32>
      "xegpu.store"(%9, %arg9, %6, %8) <{chunk_size = 4 : i64, l1_hint = #xegpu.cache_hint<cached>, layout = #xegpu.layout<inst_data = [16, 2]>}> : (vector<32x4xf32>, ui64, vector<32xindex>, vector<32xi1>) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "store_with_offsets_chunk"} : () -> ()
    "gpu.func"() <{function_type = (memref<256x318xf32>) -> ()}> ({
    ^bb0(%arg8: memref<256x318xf32>):
      %4 = "xegpu.create_nd_tdesc"(%arg8) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<256x318xf32>) -> !xegpu.tensor_desc<24x32xf32, #xegpu.layout<inst_data = [8, 16]>>
      %5 = "xegpu.load_nd"(%4) <{const_offsets = array<i64: 8, 16>}> : (!xegpu.tensor_desc<24x32xf32, #xegpu.layout<inst_data = [8, 16]>>) -> vector<24x32xf32>
      "xegpu.store_nd"(%5, %4) <{const_offsets = array<i64: 0, 0>}> : (vector<24x32xf32>, !xegpu.tensor_desc<24x32xf32, #xegpu.layout<inst_data = [8, 16]>>) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "load_nd_store_nd"} : () -> ()
    "gpu.func"() <{function_type = (vector<32x80xf32>, vector<32xf32>) -> vector<32xf32>}> ({
    ^bb0(%arg6: vector<32x80xf32>, %arg7: vector<32xf32>):
      %3 = "vector.multi_reduction"(%arg6, %arg7) <{kind = #vector.kind<add>, reduction_dims = array<i64: 1>}> {layout_operand_0 = #xegpu.layout<inst_data = [16, 16]>} : (vector<32x80xf32>, vector<32xf32>) -> vector<32xf32>
      "gpu.return"(%3) : (vector<32xf32>) -> ()
    }) {sym_name = "multi_reduction_2d_last_dim"} : () -> ()
    "gpu.func"() <{function_type = (vector<4x8x16x32xf32>, vector<4x16xf32>) -> vector<4x16xf32>}> ({
    ^bb0(%arg4: vector<4x8x16x32xf32>, %arg5: vector<4x16xf32>):
      %2 = "vector.multi_reduction"(%arg4, %arg5) <{kind = #vector.kind<add>, reduction_dims = array<i64: 1, 3>}> {layout_operand_0 = #xegpu.layout<inst_data = [2, 4, 16, 16]>} : (vector<4x8x16x32xf32>, vector<4x16xf32>) -> vector<4x16xf32>
      "gpu.return"(%2) : (vector<4x16xf32>) -> ()
    }) {sym_name = "multi_reduction_multi_dim"} : () -> ()
    "gpu.func"() <{function_type = (vector<48x32xf32>, vector<32xf32>) -> vector<32xf32>}> ({
    ^bb0(%arg2: vector<48x32xf32>, %arg3: vector<32xf32>):
      %1 = "vector.multi_reduction"(%arg2, %arg3) <{kind = #vector.kind<add>, reduction_dims = array<i64: 0>}> {layout_operand_0 = #xegpu.layout<inst_data = [16, 16]>} : (vector<48x32xf32>, vector<32xf32>) -> vector<32xf32>
      "gpu.return"(%1) : (vector<32xf32>) -> ()
    }) {sym_name = "multi_reduction_reduce_dim0"} : () -> ()
    "gpu.func"() <{function_type = (vector<32x16xf32>, vector<32xf32>) -> vector<32xf32>}> ({
    ^bb0(%arg0: vector<32x16xf32>, %arg1: vector<32xf32>):
      %0 = "vector.multi_reduction"(%arg0, %arg1) <{kind = #vector.kind<add>, reduction_dims = array<i64: 1>}> {layout_operand_0 = #xegpu.layout<inst_data = [16, 16]>} : (vector<32x16xf32>, vector<32xf32>) -> vector<32xf32>
      "gpu.return"(%0) : (vector<32xf32>) -> ()
    }) {sym_name = "multi_reduction_no_elwise"} : () -> ()
  }) : () -> ()
}) : () -> ()

