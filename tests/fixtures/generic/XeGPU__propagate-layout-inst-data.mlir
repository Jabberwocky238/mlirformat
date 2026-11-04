"builtin.module"() ({
  "gpu.module"() <{sym_name = "test"}> ({
    "func.func"() <{function_type = (memref<8x32xf32>, memref<8x32xf32>) -> (), sym_name = "load_store_no_array_len"}> ({
    ^bb0(%arg0: memref<8x32xf32>, %arg1: memref<8x32xf32>):
      %0 = "arith.constant"() <{value = dense<0.000000e+00> : vector<8x16xf32>}> : () -> vector<8x16xf32>
      %1 = "xegpu.create_nd_tdesc"(%arg0) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>}> : (memref<8x32xf32>) -> !xegpu.tensor_desc<8x32xf32>
      %2 = "xegpu.create_nd_tdesc"(%arg1) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>}> : (memref<8x32xf32>) -> !xegpu.tensor_desc<8x32xf32>
      "xegpu.prefetch_nd"(%1) <{l1_hint = #xegpu.cache_hint<cached>, l2_hint = #xegpu.cache_hint<uncached>}> : (!xegpu.tensor_desc<8x32xf32>) -> ()
      %3 = "xegpu.load_nd"(%1) : (!xegpu.tensor_desc<8x32xf32>) -> vector<8x32xf32>
      "xegpu.store_nd"(%3, %2) : (vector<8x32xf32>, !xegpu.tensor_desc<8x32xf32>) -> ()
      "func.return"() : () -> ()
    }) : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "gpu.module"() <{sym_name = "test"}> ({
    "func.func"() <{function_type = (memref<8x16xf16>, memref<16x16xf16>, memref<8x16xf32>) -> (), sym_name = "dpas_f16"}> ({
    ^bb0(%arg0: memref<8x16xf16>, %arg1: memref<16x16xf16>, %arg2: memref<8x16xf32>):
      %0 = "arith.constant"() <{value = 0 : index}> : () -> index
      %1 = "arith.constant"() <{value = dense<0.000000e+00> : vector<8x16xf32>}> : () -> vector<8x16xf32>
      %2 = "xegpu.create_nd_tdesc"(%arg0, %0, %0) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>, operandSegmentSizes = array<i32: 1, 2, 0, 0>}> : (memref<8x16xf16>, index, index) -> !xegpu.tensor_desc<8x16xf16>
      %3 = "xegpu.create_nd_tdesc"(%arg1, %0, %0) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>, operandSegmentSizes = array<i32: 1, 2, 0, 0>}> : (memref<16x16xf16>, index, index) -> !xegpu.tensor_desc<16x16xf16>
      %4 = "xegpu.load_nd"(%2) : (!xegpu.tensor_desc<8x16xf16>) -> vector<8x16xf16>
      %5 = "xegpu.load_nd"(%3) : (!xegpu.tensor_desc<16x16xf16>) -> vector<16x16xf16>
      %6 = "xegpu.dpas"(%4, %5, %1) : (vector<8x16xf16>, vector<16x16xf16>, vector<8x16xf32>) -> vector<8x16xf32>
      %7 = "xegpu.create_nd_tdesc"(%arg2, %0, %0) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>, operandSegmentSizes = array<i32: 1, 2, 0, 0>}> : (memref<8x16xf32>, index, index) -> !xegpu.tensor_desc<8x16xf32>
      "xegpu.store_nd"(%6, %7) : (vector<8x16xf32>, !xegpu.tensor_desc<8x16xf32>) -> ()
      "func.return"() : () -> ()
    }) : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "gpu.module"() <{sym_name = "test_kernel"}> ({
    "gpu.func"() <{function_type = (memref<1024x1024xf16>, memref<1024x1024xf16>, memref<1024x1024xf16>) -> ()}> ({
    ^bb0(%arg0: memref<1024x1024xf16>, %arg1: memref<1024x1024xf16>, %arg2: memref<1024x1024xf16>):
      %0 = "arith.constant"() <{value = 0 : index}> : () -> index
      %1 = "arith.constant"() <{value = 32 : index}> : () -> index
      %2 = "arith.constant"() <{value = 1024 : index}> : () -> index
      %3 = "gpu.block_id"() <{dimension = #gpu<dim x>}> : () -> index
      %4 = "gpu.block_id"() <{dimension = #gpu<dim y>}> : () -> index
      %5 = "arith.muli"(%3, %1) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
      %6 = "xegpu.create_nd_tdesc"(%arg0, %5, %0) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>, operandSegmentSizes = array<i32: 1, 2, 0, 0>}> : (memref<1024x1024xf16>, index, index) -> !xegpu.tensor_desc<16x32xf16>
      %7 = "xegpu.create_nd_tdesc"(%arg1, %5, %0) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>, operandSegmentSizes = array<i32: 1, 2, 0, 0>}> : (memref<1024x1024xf16>, index, index) -> !xegpu.tensor_desc<16x32xf16>
      %8 = "xegpu.create_nd_tdesc"(%arg2, %5, %0) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>, operandSegmentSizes = array<i32: 1, 2, 0, 0>}> : (memref<1024x1024xf16>, index, index) -> !xegpu.tensor_desc<16x32xf16>
      %9:3 = "scf.for"(%0, %2, %1, %6, %7, %8) ({
      ^bb0(%arg3: index, %arg4: !xegpu.tensor_desc<16x32xf16>, %arg5: !xegpu.tensor_desc<16x32xf16>, %arg6: !xegpu.tensor_desc<16x32xf16>):
        %10 = "xegpu.load_nd"(%arg4) : (!xegpu.tensor_desc<16x32xf16>) -> vector<16x32xf16>
        %11 = "xegpu.load_nd"(%arg5) : (!xegpu.tensor_desc<16x32xf16>) -> vector<16x32xf16>
        %12 = "arith.addf"(%10, %11) <{fastmath = #arith.fastmath<none>}> : (vector<16x32xf16>, vector<16x32xf16>) -> vector<16x32xf16>
        "xegpu.store_nd"(%12, %arg6) : (vector<16x32xf16>, !xegpu.tensor_desc<16x32xf16>) -> ()
        %13 = "xegpu.update_nd_offset"(%arg4, %0, %1) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>}> : (!xegpu.tensor_desc<16x32xf16>, index, index) -> !xegpu.tensor_desc<16x32xf16>
        %14 = "xegpu.update_nd_offset"(%arg5, %0, %1) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>}> : (!xegpu.tensor_desc<16x32xf16>, index, index) -> !xegpu.tensor_desc<16x32xf16>
        %15 = "xegpu.update_nd_offset"(%arg6, %0, %1) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>}> : (!xegpu.tensor_desc<16x32xf16>, index, index) -> !xegpu.tensor_desc<16x32xf16>
        "scf.yield"(%13, %14, %15) : (!xegpu.tensor_desc<16x32xf16>, !xegpu.tensor_desc<16x32xf16>, !xegpu.tensor_desc<16x32xf16>) -> ()
      }) : (index, index, index, !xegpu.tensor_desc<16x32xf16>, !xegpu.tensor_desc<16x32xf16>, !xegpu.tensor_desc<16x32xf16>) -> (!xegpu.tensor_desc<16x32xf16>, !xegpu.tensor_desc<16x32xf16>, !xegpu.tensor_desc<16x32xf16>)
      "gpu.return"() : () -> ()
    }) {sym_name = "elementwise_with_inst_data_only", workgroup_attributions = 0 : i64} : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "gpu.module"() <{sym_name = "test_kernel"}> ({
    "gpu.func"() <{function_type = (memref<1024x1024xf16>, memref<1024x1024xf16>, memref<1024x1024xf16>) -> ()}> ({
    ^bb0(%arg0: memref<1024x1024xf16>, %arg1: memref<1024x1024xf16>, %arg2: memref<1024x1024xf16>):
      %0 = "arith.constant"() <{value = 0 : index}> : () -> index
      %1 = "arith.constant"() <{value = 32 : index}> : () -> index
      %2 = "arith.constant"() <{value = 1024 : index}> : () -> index
      %3 = "gpu.block_id"() <{dimension = #gpu<dim x>}> : () -> index
      %4 = "gpu.block_id"() <{dimension = #gpu<dim y>}> : () -> index
      %5 = "arith.muli"(%3, %1) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
      %6 = "xegpu.create_nd_tdesc"(%arg0, %5, %0) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>, operandSegmentSizes = array<i32: 1, 2, 0, 0>}> : (memref<1024x1024xf16>, index, index) -> !xegpu.tensor_desc<12x32xf16>
      %7 = "xegpu.create_nd_tdesc"(%arg1, %5, %0) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>, operandSegmentSizes = array<i32: 1, 2, 0, 0>}> : (memref<1024x1024xf16>, index, index) -> !xegpu.tensor_desc<12x32xf16>
      %8 = "xegpu.create_nd_tdesc"(%arg2, %5, %0) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>, operandSegmentSizes = array<i32: 1, 2, 0, 0>}> : (memref<1024x1024xf16>, index, index) -> !xegpu.tensor_desc<12x32xf16>
      %9:3 = "scf.for"(%0, %2, %1, %6, %7, %8) ({
      ^bb0(%arg3: index, %arg4: !xegpu.tensor_desc<12x32xf16>, %arg5: !xegpu.tensor_desc<12x32xf16>, %arg6: !xegpu.tensor_desc<12x32xf16>):
        %10 = "xegpu.load_nd"(%arg4) : (!xegpu.tensor_desc<12x32xf16>) -> vector<12x32xf16>
        %11 = "xegpu.load_nd"(%arg5) : (!xegpu.tensor_desc<12x32xf16>) -> vector<12x32xf16>
        %12 = "arith.addf"(%10, %11) <{fastmath = #arith.fastmath<none>}> : (vector<12x32xf16>, vector<12x32xf16>) -> vector<12x32xf16>
        "xegpu.store_nd"(%12, %arg6) : (vector<12x32xf16>, !xegpu.tensor_desc<12x32xf16>) -> ()
        %13 = "xegpu.update_nd_offset"(%arg4, %0, %1) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>}> : (!xegpu.tensor_desc<12x32xf16>, index, index) -> !xegpu.tensor_desc<12x32xf16>
        %14 = "xegpu.update_nd_offset"(%arg5, %0, %1) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>}> : (!xegpu.tensor_desc<12x32xf16>, index, index) -> !xegpu.tensor_desc<12x32xf16>
        %15 = "xegpu.update_nd_offset"(%arg6, %0, %1) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>}> : (!xegpu.tensor_desc<12x32xf16>, index, index) -> !xegpu.tensor_desc<12x32xf16>
        "scf.yield"(%13, %14, %15) : (!xegpu.tensor_desc<12x32xf16>, !xegpu.tensor_desc<12x32xf16>, !xegpu.tensor_desc<12x32xf16>) -> ()
      }) : (index, index, index, !xegpu.tensor_desc<12x32xf16>, !xegpu.tensor_desc<12x32xf16>, !xegpu.tensor_desc<12x32xf16>) -> (!xegpu.tensor_desc<12x32xf16>, !xegpu.tensor_desc<12x32xf16>, !xegpu.tensor_desc<12x32xf16>)
      "gpu.return"() : () -> ()
    }) {sym_name = "elementwise_with_inst_data_12", workgroup_attributions = 0 : i64} : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "gpu.module"() <{sym_name = "test"}> ({
    "func.func"() <{function_type = (memref<256xf16>) -> (), sym_name = "scatter_ops_chunksize"}> ({
    ^bb0(%arg0: memref<256xf16>):
      %0 = "arith.constant"() <{value = dense<true> : vector<16xi1>}> : () -> vector<16xi1>
      %1 = "arith.constant"() <{value = dense<12> : vector<16xindex>}> : () -> vector<16xindex>
      %2 = "xegpu.load"(%arg0, %1, %0) <{chunk_size = 8 : i64}> : (memref<256xf16>, vector<16xindex>, vector<16xi1>) -> vector<16x8xf16>
      "xegpu.store"(%2, %arg0, %1, %0) <{chunk_size = 8 : i64}> : (vector<16x8xf16>, memref<256xf16>, vector<16xindex>, vector<16xi1>) -> ()
      "func.return"() : () -> ()
    }) : () -> ()
  }) : () -> ()
}) : () -> ()

