"builtin.module"() ({
  "gpu.module"() <{sym_name = "test"}> ({
    "func.func"() <{function_type = (memref<8x32xf32>, memref<8x32xf32>) -> (), sym_name = "load_store_no_array_len"}> ({
    ^bb0(%arg0: memref<8x32xf32>, %arg1: memref<8x32xf32>):
      %0 = "arith.constant"() <{value = dense<0.000000e+00> : vector<8x16xf32>}> : () -> vector<8x16xf32>
      %1 = "xegpu.create_nd_tdesc"(%arg0) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<8x32xf32>) -> !xegpu.tensor_desc<8x32xf32>
      %2 = "xegpu.create_nd_tdesc"(%arg1) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<8x32xf32>) -> !xegpu.tensor_desc<8x32xf32>
      "xegpu.prefetch_nd"(%1) <{const_offsets = array<i64: 0, 0>, l1_hint = #xegpu.cache_hint<cached>, l2_hint = #xegpu.cache_hint<uncached>}> : (!xegpu.tensor_desc<8x32xf32>) -> ()
      %3 = "xegpu.load_nd"(%1) <{const_offsets = array<i64: 0, 0>}> : (!xegpu.tensor_desc<8x32xf32>) -> vector<8x32xf32>
      "xegpu.store_nd"(%3, %2) <{const_offsets = array<i64: 0, 0>}> : (vector<8x32xf32>, !xegpu.tensor_desc<8x32xf32>) -> ()
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
      %2 = "xegpu.create_nd_tdesc"(%arg0) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<8x16xf16>) -> !xegpu.tensor_desc<8x16xf16>
      %3 = "xegpu.create_nd_tdesc"(%arg1) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<16x16xf16>) -> !xegpu.tensor_desc<16x16xf16>
      %4 = "xegpu.load_nd"(%2) <{const_offsets = array<i64: 0, 0>}> : (!xegpu.tensor_desc<8x16xf16>) -> vector<8x16xf16>
      %5 = "xegpu.load_nd"(%3) <{const_offsets = array<i64: 0, 0>}> : (!xegpu.tensor_desc<16x16xf16>) -> vector<16x16xf16>
      %6 = "xegpu.dpas"(%4, %5, %1) : (vector<8x16xf16>, vector<16x16xf16>, vector<8x16xf32>) -> vector<8x16xf32>
      %7 = "xegpu.create_nd_tdesc"(%arg2) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<8x16xf32>) -> !xegpu.tensor_desc<8x16xf32>
      "xegpu.store_nd"(%6, %7) <{const_offsets = array<i64: 0, 0>}> : (vector<8x16xf32>, !xegpu.tensor_desc<8x16xf32>) -> ()
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
      %6 = "xegpu.create_nd_tdesc"(%arg0) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<1024x1024xf16>) -> !xegpu.tensor_desc<16x32xf16>
      %7 = "xegpu.create_nd_tdesc"(%arg1) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<1024x1024xf16>) -> !xegpu.tensor_desc<16x32xf16>
      %8 = "xegpu.create_nd_tdesc"(%arg2) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<1024x1024xf16>) -> !xegpu.tensor_desc<16x32xf16>
      "scf.for"(%0, %2, %1) ({
      ^bb0(%arg3: index):
        %9 = "xegpu.load_nd"(%6, %arg3) <{const_offsets = array<i64: 0, -9223372036854775808>}> : (!xegpu.tensor_desc<16x32xf16>, index) -> vector<16x32xf16>
        %10 = "xegpu.load_nd"(%7, %arg3) <{const_offsets = array<i64: 0, -9223372036854775808>}> : (!xegpu.tensor_desc<16x32xf16>, index) -> vector<16x32xf16>
        %11 = "arith.addf"(%9, %10) <{fastmath = #arith.fastmath<none>}> : (vector<16x32xf16>, vector<16x32xf16>) -> vector<16x32xf16>
        "xegpu.store_nd"(%11, %8, %arg3) <{const_offsets = array<i64: 0, -9223372036854775808>}> : (vector<16x32xf16>, !xegpu.tensor_desc<16x32xf16>, index) -> ()
        "scf.yield"() : () -> ()
      }) : (index, index, index) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "elementwise_with_inst_data_only"} : () -> ()
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
      %6 = "xegpu.create_nd_tdesc"(%arg0) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<1024x1024xf16>) -> !xegpu.tensor_desc<12x32xf16>
      %7 = "xegpu.create_nd_tdesc"(%arg1) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<1024x1024xf16>) -> !xegpu.tensor_desc<12x32xf16>
      %8 = "xegpu.create_nd_tdesc"(%arg2) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<1024x1024xf16>) -> !xegpu.tensor_desc<12x32xf16>
      "scf.for"(%0, %2, %1) ({
      ^bb0(%arg3: index):
        %9 = "xegpu.load_nd"(%6, %arg3) <{const_offsets = array<i64: 0, -9223372036854775808>}> : (!xegpu.tensor_desc<12x32xf16>, index) -> vector<12x32xf16>
        %10 = "xegpu.load_nd"(%7, %arg3) <{const_offsets = array<i64: 0, -9223372036854775808>}> : (!xegpu.tensor_desc<12x32xf16>, index) -> vector<12x32xf16>
        %11 = "arith.addf"(%9, %10) <{fastmath = #arith.fastmath<none>}> : (vector<12x32xf16>, vector<12x32xf16>) -> vector<12x32xf16>
        "xegpu.store_nd"(%11, %8, %arg3) <{const_offsets = array<i64: 0, -9223372036854775808>}> : (vector<12x32xf16>, !xegpu.tensor_desc<12x32xf16>, index) -> ()
        "scf.yield"() : () -> ()
      }) : (index, index, index) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "elementwise_with_inst_data_12"} : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "gpu.module"() <{sym_name = "test"}> ({
    "func.func"() <{function_type = (!xegpu.mem_desc<16x64xf16>) -> (), sym_name = "store_matrix"}> ({
    ^bb0(%arg0: !xegpu.mem_desc<16x64xf16>):
      %0 = "arith.constant"() <{value = dense<0.000000e+00> : vector<16x16xf16>}> : () -> vector<16x16xf16>
      "xegpu.store_matrix"(%0, %arg0) <{const_offsets = array<i64: 8, 8>}> : (vector<16x16xf16>, !xegpu.mem_desc<16x64xf16>) -> ()
      "func.return"() : () -> ()
    }) : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "gpu.module"() <{sym_name = "test"}> ({
    "func.func"() <{function_type = (memref<512xf32>) -> (), sym_name = "scatter_ops_coalesce_chunksize"}> ({
    ^bb0(%arg0: memref<512xf32>):
      %0 = "arith.constant"() <{value = dense<true> : vector<16x32xi1>}> : () -> vector<16x32xi1>
      %1 = "arith.constant"() <{value = dense<12> : vector<16x32xindex>}> : () -> vector<16x32xindex>
      %2 = "xegpu.load"(%arg0, %1, %0) : (memref<512xf32>, vector<16x32xindex>, vector<16x32xi1>) -> vector<16x32xf32>
      "xegpu.store"(%2, %arg0, %1, %0) <{layout = #xegpu.layout<inst_data = [16, 16]>}> : (vector<16x32xf32>, memref<512xf32>, vector<16x32xindex>, vector<16x32xi1>) -> ()
      "func.return"() : () -> ()
    }) : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "gpu.module"() <{sym_name = "test"}> ({
    "func.func"() <{function_type = (memref<8x16xf16>, memref<256xf16>, memref<8x16xf32>) -> (), sym_name = "load_gather_with_coalesce_chunksize"}> ({
    ^bb0(%arg0: memref<8x16xf16>, %arg1: memref<256xf16>, %arg2: memref<8x16xf32>):
      %0 = "arith.constant"() <{value = 0 : index}> : () -> index
      %1 = "xegpu.create_nd_tdesc"(%arg0) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<8x16xf16>) -> !xegpu.tensor_desc<8x16xf16>
      %2 = "xegpu.load_nd"(%1) <{const_offsets = array<i64: 0, 0>}> : (!xegpu.tensor_desc<8x16xf16>) -> vector<8x16xf16>
      %3 = "arith.constant"() <{value = dense<0> : vector<16x16xindex>}> : () -> vector<16x16xindex>
      %4 = "arith.constant"() <{value = dense<true> : vector<16x16xi1>}> : () -> vector<16x16xi1>
      %5 = "xegpu.load"(%arg1, %3, %4) : (memref<256xf16>, vector<16x16xindex>, vector<16x16xi1>) -> vector<16x16xf16>
      %6 = "vector.transpose"(%5) <{permutation = array<i64: 1, 0>}> : (vector<16x16xf16>) -> vector<16x16xf16>
      %7 = "xegpu.dpas"(%2, %6) : (vector<8x16xf16>, vector<16x16xf16>) -> vector<8x16xf32>
      %8 = "xegpu.create_nd_tdesc"(%arg2) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<8x16xf32>) -> !xegpu.tensor_desc<8x16xf32>
      "xegpu.store_nd"(%7, %8) <{const_offsets = array<i64: 0, 0>}> : (vector<8x16xf32>, !xegpu.tensor_desc<8x16xf32>) -> ()
      "func.return"() : () -> ()
    }) : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "gpu.module"() <{sym_name = "test"}> ({
    "func.func"() <{function_type = (memref<1024xf16>, memref<16xf16>) -> (), sym_name = "vector_shape_cast_expand_non_unit_dims"}> ({
    ^bb0(%arg0: memref<1024xf16>, %arg1: memref<16xf16>):
      %0 = "arith.constant"() <{value = dense<true> : vector<1024xi1>}> : () -> vector<1024xi1>
      %1 = "vector.step"() : () -> vector<1024xindex>
      %2 = "xegpu.load"(%arg0, %1, %0) : (memref<1024xf16>, vector<1024xindex>, vector<1024xi1>) -> vector<1024xf16>
      %3 = "vector.shape_cast"(%2) : (vector<1024xf16>) -> vector<8x8x16xf16>
      %4 = "arith.constant"() <{value = dense<0.000000e+00> : vector<8x16xf16>}> : () -> vector<8x16xf16>
      %5 = "arith.constant"() <{value = dense<0.000000e+00> : vector<16xf16>}> : () -> vector<16xf16>
      %6 = "vector.multi_reduction"(%3, %4) <{kind = #vector.kind<add>, reduction_dims = array<i64: 0>}> : (vector<8x8x16xf16>, vector<8x16xf16>) -> vector<8x16xf16>
      %7 = "vector.multi_reduction"(%6, %5) <{kind = #vector.kind<add>, reduction_dims = array<i64: 0>}> : (vector<8x16xf16>, vector<16xf16>) -> vector<16xf16>
      %8 = "arith.constant"() <{value = dense<true> : vector<16xi1>}> : () -> vector<16xi1>
      %9 = "arith.constant"() <{value = dense<1> : vector<16xindex>}> : () -> vector<16xindex>
      "xegpu.store"(%7, %arg1, %9, %8) <{layout = #xegpu.layout<inst_data = [16]>}> : (vector<16xf16>, memref<16xf16>, vector<16xindex>, vector<16xi1>) -> ()
      "func.return"() : () -> ()
    }) : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "gpu.module"() <{sym_name = "test"}> ({
    "func.func"() <{function_type = (memref<1024xf16>, memref<16xf16>) -> (), sym_name = "vector_2d_reduction_with_fractional_subgroup_size"}> ({
    ^bb0(%arg0: memref<1024xf16>, %arg1: memref<16xf16>):
      %0 = "arith.constant"() <{value = dense<true> : vector<16xi1>}> : () -> vector<16xi1>
      %1 = "vector.step"() : () -> vector<16xindex>
      %2 = "xegpu.load"(%arg0, %1, %0) : (memref<1024xf16>, vector<16xindex>, vector<16xi1>) -> vector<16xf16>
      %3 = "vector.shape_cast"(%2) : (vector<16xf16>) -> vector<1x16x1xf16>
      %4 = "arith.constant"() <{value = dense<0.000000e+00> : vector<1xf16>}> : () -> vector<1xf16>
      %5 = "vector.multi_reduction"(%3, %4) <{kind = #vector.kind<add>, reduction_dims = array<i64: 1, 2>}> : (vector<1x16x1xf16>, vector<1xf16>) -> vector<1xf16>
      %6 = "arith.constant"() <{value = dense<true> : vector<1xi1>}> : () -> vector<1xi1>
      %7 = "arith.constant"() <{value = dense<1> : vector<1xindex>}> : () -> vector<1xindex>
      "xegpu.store"(%5, %arg1, %7, %6) <{layout = #xegpu.slice<#xegpu.layout<inst_data = [1, 1, 16]>, dims = [1, 2]>}> : (vector<1xf16>, memref<16xf16>, vector<1xindex>, vector<1xi1>) -> ()
      "func.return"() : () -> ()
    }) : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "gpu.module"() <{sym_name = "test"}> ({
    "func.func"() <{function_type = (memref<1024xf16>, memref<16xf16>) -> (), sym_name = "vector_2d_reduction_with_fractional_subgroup_size_1x4x1"}> ({
    ^bb0(%arg0: memref<1024xf16>, %arg1: memref<16xf16>):
      %0 = "arith.constant"() <{value = dense<true> : vector<64xi1>}> : () -> vector<64xi1>
      %1 = "vector.step"() : () -> vector<64xindex>
      %2 = "xegpu.load"(%arg0, %1, %0) : (memref<1024xf16>, vector<64xindex>, vector<64xi1>) -> vector<64xf16>
      %3 = "vector.shape_cast"(%2) : (vector<64xf16>) -> vector<1x16x4xf16>
      %4 = "arith.constant"() <{value = dense<0.000000e+00> : vector<1xf16>}> : () -> vector<1xf16>
      %5 = "vector.multi_reduction"(%3, %4) <{kind = #vector.kind<add>, reduction_dims = array<i64: 1, 2>}> : (vector<1x16x4xf16>, vector<1xf16>) -> vector<1xf16>
      %6 = "arith.constant"() <{value = dense<true> : vector<1xi1>}> : () -> vector<1xi1>
      %7 = "arith.constant"() <{value = dense<1> : vector<1xindex>}> : () -> vector<1xindex>
      "xegpu.store"(%5, %arg1, %7, %6) <{layout = #xegpu.slice<#xegpu.layout<inst_data = [1, 1, 16]>, dims = [1, 2]>}> : (vector<1xf16>, memref<16xf16>, vector<1xindex>, vector<1xi1>) -> ()
      "func.return"() : () -> ()
    }) : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "gpu.module"() <{sym_name = "test"}> ({
    "func.func"() <{function_type = (memref<256xf16>, memref<256xf16>) -> (), sym_name = "vector_shape_cast_expand_and_merge"}> ({
    ^bb0(%arg0: memref<256xf16>, %arg1: memref<256xf16>):
      %0 = "arith.constant"() <{value = dense<true> : vector<256xi1>}> : () -> vector<256xi1>
      %1 = "vector.step"() : () -> vector<256xindex>
      %2 = "xegpu.load"(%arg0, %1, %0) : (memref<256xf16>, vector<256xindex>, vector<256xi1>) -> vector<256xf16>
      %3 = "vector.shape_cast"(%2) : (vector<256xf16>) -> vector<2x4x32xf16>
      %4 = "vector.shape_cast"(%3) : (vector<2x4x32xf16>) -> vector<1x256xf16>
      %5 = "vector.shape_cast"(%4) : (vector<1x256xf16>) -> vector<256xf16>
      "xegpu.store"(%5, %arg1, %1, %0) <{layout = #xegpu.layout<inst_data = [32]>}> : (vector<256xf16>, memref<256xf16>, vector<256xindex>, vector<256xi1>) -> ()
      "func.return"() : () -> ()
    }) : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "gpu.module"() <{sym_name = "test"}> ({
    "func.func"() <{function_type = (!xegpu.mem_desc<64x128xf32>, i1) -> (), sym_name = "load_store_matrix"}> ({
    ^bb0(%arg0: !xegpu.mem_desc<64x128xf32>, %arg1: i1):
      %0 = "arith.constant"() <{value = 0 : index}> : () -> index
      "scf.if"(%arg1) ({
        %1 = "xegpu.load_matrix"(%arg0, %0, %0) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>}> : (!xegpu.mem_desc<64x128xf32>, index, index) -> vector<2x1xf32>
        "xegpu.store_matrix"(%1, %arg0, %0, %0) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>}> : (vector<2x1xf32>, !xegpu.mem_desc<64x128xf32>, index, index) -> ()
        "scf.yield"() : () -> ()
      }, {
      }) : (i1) -> ()
      "func.return"() : () -> ()
    }) : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "gpu.module"() <{sym_name = "test"}> ({
    "gpu.func"() <{function_type = (memref<32x2x192xf32>, memref<32x2x192xf32>, memref<32x2x192xf32>) -> (), kernel, known_block_size = array<i32: 768, 1, 1>, known_grid_size = array<i32: 16, 1, 1>}> ({
    ^bb0(%arg0: memref<32x2x192xf32>, %arg1: memref<32x2x192xf32>, %arg2: memref<32x2x192xf32>):
      %0 = "arith.constant"() <{value = dense<true> : vector<2x2x6x32xi1>}> : () -> vector<2x2x6x32xi1>
      %1 = "arith.constant"() <{value = dense<1.000000e+00> : vector<2x2x6x32xf32>}> : () -> vector<2x2x6x32xf32>
      %2 = "memref.extract_aligned_pointer_as_index"(%arg2) : (memref<32x2x192xf32>) -> index
      %3 = "arith.index_cast"(%2) : (index) -> i64
      %4 = "vector.step"() : () -> vector<6xindex>
      %5 = "vector.shape_cast"(%4) : (vector<6xindex>) -> vector<6x1xindex>
      %6 = "vector.broadcast"(%5) : (vector<6x1xindex>) -> vector<2x2x6x32xindex>
      "xegpu.store"(%1, %3, %6, %0) <{layout = #xegpu.layout<inst_data = [1, 1, 1, 16]>}> : (vector<2x2x6x32xf32>, i64, vector<2x2x6x32xindex>, vector<2x2x6x32xi1>) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "broadcast_both_leadingdims_innerdims"} : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "gpu.module"() <{sym_name = "test_collapse_dims", targets = [#xevm.target<O = 3, chip = "pvc">]}> ({
    "gpu.func"() <{function_type = (memref<32x32xf32>) -> ()}> ({
    ^bb0(%arg0: memref<32x32xf32>):
      %0 = "vector.step"() : () -> vector<1024xindex>
      %1 = "vector.shape_cast"(%0) : (vector<1024xindex>) -> vector<32x32xindex>
      %2 = "memref.extract_aligned_pointer_as_index"(%arg0) : (memref<32x32xf32>) -> index
      %3 = "arith.index_cast"(%2) : (index) -> i64
      %4 = "arith.constant"() <{value = dense<true> : vector<32x32xi1>}> : () -> vector<32x32xi1>
      %5 = "arith.constant"() <{value = dense<0.000000e+00> : vector<32x32xf32>}> : () -> vector<32x32xf32>
      "xegpu.store"(%5, %3, %1, %4) <{layout = #xegpu.layout<inst_data = [32, 32]>}> : (vector<32x32xf32>, i64, vector<32x32xindex>, vector<32x32xi1>) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "shape_cast_collapse_dims_with_order"} : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "gpu.module"() <{sym_name = "test"}> ({
    "func.func"() <{function_type = (memref<256x32xui8>) -> (), sym_name = "bitcast_ui8_to_f4"}> ({
    ^bb0(%arg0: memref<256x32xui8>):
      %0 = "xegpu.create_nd_tdesc"(%arg0) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<256x32xui8>) -> !xegpu.tensor_desc<256x32xui8>
      %1 = "xegpu.load_nd"(%0) <{const_offsets = array<i64: 0, 0>}> : (!xegpu.tensor_desc<256x32xui8>) -> vector<256x32xui8>
      %2 = "vector.bitcast"(%1) : (vector<256x32xui8>) -> vector<256x64xf4E2M1FN>
      %3 = "xegpu.convert_layout"(%2) <{input_layout = #xegpu.layout<inst_data = [32, 32], lane_layout = [1, 16], lane_data = [1, 2]>, target_layout = #xegpu.layout<inst_data = [32, 32], lane_layout = [1, 16], lane_data = [1, 2]>}> : (vector<256x64xf4E2M1FN>) -> vector<256x64xf4E2M1FN>
      "func.return"() : () -> ()
    }) : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "gpu.module"() <{sym_name = "test"}> ({
    "func.func"() <{function_type = (memref<256x16xui16>) -> (), sym_name = "bitcast_ui16_to_f4"}> ({
    ^bb0(%arg0: memref<256x16xui16>):
      %0 = "xegpu.create_nd_tdesc"(%arg0) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<256x16xui16>) -> !xegpu.tensor_desc<256x16xui16>
      %1 = "xegpu.load_nd"(%0) <{const_offsets = array<i64: 0, 0>}> : (!xegpu.tensor_desc<256x16xui16>) -> vector<256x16xui16>
      %2 = "vector.bitcast"(%1) : (vector<256x16xui16>) -> vector<256x64xf4E2M1FN>
      %3 = "xegpu.convert_layout"(%2) <{input_layout = #xegpu.layout<inst_data = [32, 64], lane_layout = [1, 16], lane_data = [1, 4]>, target_layout = #xegpu.layout<inst_data = [32, 64], lane_layout = [1, 16], lane_data = [1, 4]>}> : (vector<256x64xf4E2M1FN>) -> vector<256x64xf4E2M1FN>
      "func.return"() : () -> ()
    }) : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "gpu.module"() <{sym_name = "test"}> ({
    "func.func"() <{function_type = (memref<16x1024xf8E5M2>, memref<1024x32xf8E5M2>, memref<16x32xbf16>, memref<16x32xf8E8M0FNU>, memref<32x32xf8E8M0FNU>) -> (), sym_name = "dpas_mx_f8e5m2"}> ({
    ^bb0(%arg0: memref<16x1024xf8E5M2>, %arg1: memref<1024x32xf8E5M2>, %arg2: memref<16x32xbf16>, %arg3: memref<16x32xf8E8M0FNU>, %arg4: memref<32x32xf8E8M0FNU>):
      %0 = "arith.constant"() <{value = 0 : index}> : () -> index
      %1 = "arith.constant"() <{value = dense<0.000000e+00> : vector<16x32xbf16>}> : () -> vector<16x32xbf16>
      %2 = "xegpu.create_nd_tdesc"(%arg0) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<16x1024xf8E5M2>) -> !xegpu.tensor_desc<16x1024xf8E5M2>
      %3 = "xegpu.create_nd_tdesc"(%arg1) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<1024x32xf8E5M2>) -> !xegpu.tensor_desc<1024x32xf8E5M2>
      %4 = "xegpu.load_nd"(%2) <{const_offsets = array<i64: 0, 0>}> : (!xegpu.tensor_desc<16x1024xf8E5M2>) -> vector<16x1024xf8E5M2>
      %5 = "xegpu.load_nd"(%3) <{const_offsets = array<i64: 0, 0>}> : (!xegpu.tensor_desc<1024x32xf8E5M2>) -> vector<1024x32xf8E5M2>
      %6 = "xegpu.create_nd_tdesc"(%arg3) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<16x32xf8E8M0FNU>) -> !xegpu.tensor_desc<16x32xf8E8M0FNU>
      %7 = "xegpu.load_nd"(%6) <{const_offsets = array<i64: 0, 0>}> : (!xegpu.tensor_desc<16x32xf8E8M0FNU>) -> vector<16x32xf8E8M0FNU>
      %8 = "xegpu.create_nd_tdesc"(%arg4) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<32x32xf8E8M0FNU>) -> !xegpu.tensor_desc<32x32xf8E8M0FNU>
      %9 = "xegpu.load_nd"(%8) <{const_offsets = array<i64: 0, 0>}> : (!xegpu.tensor_desc<32x32xf8E8M0FNU>) -> vector<32x32xf8E8M0FNU>
      %10 = "xegpu.dpas_mx"(%4, %5, %1, %7, %9) <{operandSegmentSizes = array<i32: 1, 1, 1, 1, 1>}> : (vector<16x1024xf8E5M2>, vector<1024x32xf8E5M2>, vector<16x32xbf16>, vector<16x32xf8E8M0FNU>, vector<32x32xf8E8M0FNU>) -> vector<16x32xbf16>
      %11 = "xegpu.create_nd_tdesc"(%arg2) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<16x32xbf16>) -> !xegpu.tensor_desc<16x32xbf16>
      "xegpu.store_nd"(%10, %11) <{const_offsets = array<i64: 0, 0>}> : (vector<16x32xbf16>, !xegpu.tensor_desc<16x32xbf16>) -> ()
      "func.return"() : () -> ()
    }) : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "gpu.module"() <{sym_name = "test"}> ({
    "func.func"() <{function_type = (memref<16x1024xf4E2M1FN>, memref<1024x32xf4E2M1FN>, memref<16x32xbf16>, memref<16x32xf8E8M0FNU>, memref<32x32xf8E8M0FNU>) -> (), sym_name = "dpas_mx_f4e2m1"}> ({
    ^bb0(%arg0: memref<16x1024xf4E2M1FN>, %arg1: memref<1024x32xf4E2M1FN>, %arg2: memref<16x32xbf16>, %arg3: memref<16x32xf8E8M0FNU>, %arg4: memref<32x32xf8E8M0FNU>):
      %0 = "arith.constant"() <{value = 0 : index}> : () -> index
      %1 = "arith.constant"() <{value = dense<0.000000e+00> : vector<16x32xbf16>}> : () -> vector<16x32xbf16>
      %2 = "xegpu.create_nd_tdesc"(%arg0) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<16x1024xf4E2M1FN>) -> !xegpu.tensor_desc<16x1024xf4E2M1FN>
      %3 = "xegpu.create_nd_tdesc"(%arg1) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<1024x32xf4E2M1FN>) -> !xegpu.tensor_desc<1024x32xf4E2M1FN>
      %4 = "xegpu.load_nd"(%2) <{const_offsets = array<i64: 0, 0>}> : (!xegpu.tensor_desc<16x1024xf4E2M1FN>) -> vector<16x1024xf4E2M1FN>
      %5 = "xegpu.load_nd"(%3) <{const_offsets = array<i64: 0, 0>}> : (!xegpu.tensor_desc<1024x32xf4E2M1FN>) -> vector<1024x32xf4E2M1FN>
      %6 = "xegpu.create_nd_tdesc"(%arg3) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<16x32xf8E8M0FNU>) -> !xegpu.tensor_desc<16x32xf8E8M0FNU>
      %7 = "xegpu.load_nd"(%6) <{const_offsets = array<i64: 0, 0>}> : (!xegpu.tensor_desc<16x32xf8E8M0FNU>) -> vector<16x32xf8E8M0FNU>
      %8 = "xegpu.create_nd_tdesc"(%arg4) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<32x32xf8E8M0FNU>) -> !xegpu.tensor_desc<32x32xf8E8M0FNU>
      %9 = "xegpu.load_nd"(%8) <{const_offsets = array<i64: 0, 0>}> : (!xegpu.tensor_desc<32x32xf8E8M0FNU>) -> vector<32x32xf8E8M0FNU>
      %10 = "xegpu.dpas_mx"(%4, %5, %1, %7, %9) <{operandSegmentSizes = array<i32: 1, 1, 1, 1, 1>}> : (vector<16x1024xf4E2M1FN>, vector<1024x32xf4E2M1FN>, vector<16x32xbf16>, vector<16x32xf8E8M0FNU>, vector<32x32xf8E8M0FNU>) -> vector<16x32xbf16>
      %11 = "xegpu.create_nd_tdesc"(%arg2) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<16x32xbf16>) -> !xegpu.tensor_desc<16x32xbf16>
      "xegpu.store_nd"(%10, %11) <{const_offsets = array<i64: 0, 0>}> : (vector<16x32xbf16>, !xegpu.tensor_desc<16x32xbf16>) -> ()
      "func.return"() : () -> ()
    }) : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "gpu.module"() <{sym_name = "test"}> ({
    "func.func"() <{function_type = (memref<4096xf16>) -> (), sym_name = "vector_shape_cast_collapse_innermost"}> ({
    ^bb0(%arg0: memref<4096xf16>):
      %0 = "arith.constant"() <{value = dense<0.000000e+00> : vector<8x16x32xf16>}> : () -> vector<8x16x32xf16>
      %1 = "vector.shape_cast"(%0) : (vector<8x16x32xf16>) -> vector<4096xf16>
      %2 = "arith.constant"() <{value = dense<true> : vector<4096xi1>}> : () -> vector<4096xi1>
      %3 = "vector.step"() : () -> vector<4096xindex>
      "xegpu.store"(%1, %arg0, %3, %2) <{layout = #xegpu.layout<inst_data = [32], lane_layout = [16], lane_data = [1]>}> : (vector<4096xf16>, memref<4096xf16>, vector<4096xindex>, vector<4096xi1>) -> ()
      "func.return"() : () -> ()
    }) : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "gpu.module"() <{sym_name = "test"}> ({
    "func.func"() <{function_type = (memref<512xf16>) -> (), sym_name = "vector_shape_cast_collapse_lane_layout_spill_inward"}> ({
    ^bb0(%arg0: memref<512xf16>):
      %0 = "arith.constant"() <{value = dense<0.000000e+00> : vector<2x8x32xf16>}> : () -> vector<2x8x32xf16>
      %1 = "vector.shape_cast"(%0) : (vector<2x8x32xf16>) -> vector<512xf16>
      %2 = "arith.constant"() <{value = dense<true> : vector<512xi1>}> : () -> vector<512xi1>
      %3 = "vector.step"() : () -> vector<512xindex>
      "xegpu.store"(%1, %arg0, %3, %2) <{layout = #xegpu.layout<inst_data = [64], lane_layout = [16], lane_data = [2]>}> : (vector<512xf16>, memref<512xf16>, vector<512xindex>, vector<512xi1>) -> ()
      "func.return"() : () -> ()
    }) : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "gpu.module"() <{sym_name = "test"}> ({
    "func.func"() <{function_type = (memref<8x128xf16>) -> (), sym_name = "vector_shape_cast_collapse_multi_groups"}> ({
    ^bb0(%arg0: memref<8x128xf16>):
      %0 = "arith.constant"() <{value = dense<0.000000e+00> : vector<2x4x8x16xf16>}> : () -> vector<2x4x8x16xf16>
      %1 = "vector.shape_cast"(%0) : (vector<2x4x8x16xf16>) -> vector<8x128xf16>
      %2 = "xegpu.create_nd_tdesc"(%arg0) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<8x128xf16>) -> !xegpu.tensor_desc<8x128xf16>
      "xegpu.store_nd"(%1, %2) <{const_offsets = array<i64: 0, 0>, layout = #xegpu.layout<inst_data = [1, 16], lane_layout = [1, 16], lane_data = [1, 1]>}> : (vector<8x128xf16>, !xegpu.tensor_desc<8x128xf16>) -> ()
      "func.return"() : () -> ()
    }) : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "gpu.module"() <{sym_name = "test"}> ({
    "gpu.func"() <{function_type = (memref<256x32xf8E8M0FNU>) -> (), kernel}> ({
    ^bb0(%arg0: memref<256x32xf8E8M0FNU>):
      %0 = "arith.constant"() <{value = dense<5.877470e-39> : vector<8x1x32xf8E8M0FNU>}> : () -> vector<8x1x32xf8E8M0FNU>
      %1 = "vector.broadcast"(%0) : (vector<8x1x32xf8E8M0FNU>) -> vector<8x32x32xf8E8M0FNU>
      %2 = "vector.shape_cast"(%1) : (vector<8x32x32xf8E8M0FNU>) -> vector<256x32xf8E8M0FNU>
      %3 = "xegpu.create_nd_tdesc"(%arg0) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<256x32xf8E8M0FNU>) -> !xegpu.tensor_desc<256x32xf8E8M0FNU>
      "xegpu.store_nd"(%2, %3) <{const_offsets = array<i64: 0, 0>, layout = #xegpu.layout<inst_data = [16, 4], lane_layout = [8, 4], lane_data = [2, 1], order = [0, 1]>}> : (vector<256x32xf8E8M0FNU>, !xegpu.tensor_desc<256x32xf8E8M0FNU>) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "shape_cast_collapse_lane_layout"} : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "gpu.module"() <{sym_name = "test"}> ({
    "func.func"() <{function_type = (memref<8x32xf32>) -> (), sym_name = "complete_store_nd_inst_data"}> ({
    ^bb0(%arg0: memref<8x32xf32>):
      %0 = "arith.constant"() <{value = dense<0.000000e+00> : vector<8x32xf32>}> : () -> vector<8x32xf32>
      %1 = "xegpu.create_nd_tdesc"(%arg0) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<8x32xf32>) -> !xegpu.tensor_desc<8x32xf32>
      "xegpu.store_nd"(%0, %1) <{const_offsets = array<i64: 0, 0>, layout = #xegpu.layout<inst_data = [8, 16]>}> : (vector<8x32xf32>, !xegpu.tensor_desc<8x32xf32>) -> ()
      "func.return"() : () -> ()
    }) : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "gpu.module"() <{sym_name = "test"}> ({
    "func.func"() <{function_type = (memref<8x32xf32>) -> (), sym_name = "complete_prefetch_nd_inst_data"}> ({
    ^bb0(%arg0: memref<8x32xf32>):
      %0 = "xegpu.create_nd_tdesc"(%arg0) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<8x32xf32>) -> !xegpu.tensor_desc<8x32xf32>
      "xegpu.prefetch_nd"(%0) <{const_offsets = array<i64: 0, 0>, l1_hint = #xegpu.cache_hint<cached>, layout = #xegpu.layout<inst_data = [8, 16]>}> : (!xegpu.tensor_desc<8x32xf32>) -> ()
      "func.return"() : () -> ()
    }) : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "gpu.module"() <{sym_name = "test"}> ({
    "func.func"() <{function_type = (memref<8x16xf16>, memref<16x16xf16>, memref<8x16xf32>) -> (), sym_name = "complete_load_nd_inst_data"}> ({
    ^bb0(%arg0: memref<8x16xf16>, %arg1: memref<16x16xf16>, %arg2: memref<8x16xf32>):
      %0 = "arith.constant"() <{value = dense<0.000000e+00> : vector<8x16xf32>}> : () -> vector<8x16xf32>
      %1 = "xegpu.create_nd_tdesc"(%arg0) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<8x16xf16>) -> !xegpu.tensor_desc<8x16xf16>
      %2 = "xegpu.create_nd_tdesc"(%arg1) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<16x16xf16>) -> !xegpu.tensor_desc<16x16xf16>
      %3 = "xegpu.load_nd"(%1) <{const_offsets = array<i64: 0, 0>, layout = #xegpu.layout<inst_data = [8, 16]>}> : (!xegpu.tensor_desc<8x16xf16>) -> vector<8x16xf16>
      %4 = "xegpu.load_nd"(%2) <{const_offsets = array<i64: 0, 0>, layout = #xegpu.layout<inst_data = [16, 16]>}> : (!xegpu.tensor_desc<16x16xf16>) -> vector<16x16xf16>
      %5 = "xegpu.dpas"(%3, %4, %0) : (vector<8x16xf16>, vector<16x16xf16>, vector<8x16xf32>) -> vector<8x16xf32>
      %6 = "xegpu.create_nd_tdesc"(%arg2) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<8x16xf32>) -> !xegpu.tensor_desc<8x16xf32>
      "xegpu.store_nd"(%5, %6) <{const_offsets = array<i64: 0, 0>}> : (vector<8x16xf32>, !xegpu.tensor_desc<8x16xf32>) -> ()
      "func.return"() : () -> ()
    }) : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "gpu.module"() <{sym_name = "test"}> ({
    "func.func"() <{function_type = (memref<512xf32>) -> (), sym_name = "complete_scatter_store_inst_data"}> ({
    ^bb0(%arg0: memref<512xf32>):
      %0 = "arith.constant"() <{value = dense<true> : vector<16x32xi1>}> : () -> vector<16x32xi1>
      %1 = "arith.constant"() <{value = dense<12> : vector<16x32xindex>}> : () -> vector<16x32xindex>
      %2 = "arith.constant"() <{value = dense<0.000000e+00> : vector<16x32xf32>}> : () -> vector<16x32xf32>
      "xegpu.store"(%2, %arg0, %1, %0) <{layout = #xegpu.layout<inst_data = [1, 16]>}> : (vector<16x32xf32>, memref<512xf32>, vector<16x32xindex>, vector<16x32xi1>) -> ()
      "func.return"() : () -> ()
    }) : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "gpu.module"() <{sym_name = "test"}> ({
    "func.func"() <{function_type = (memref<512xf32>) -> (), sym_name = "complete_scatter_load_inst_data"}> ({
    ^bb0(%arg0: memref<512xf32>):
      %0 = "arith.constant"() <{value = dense<true> : vector<16x32xi1>}> : () -> vector<16x32xi1>
      %1 = "arith.constant"() <{value = dense<12> : vector<16x32xindex>}> : () -> vector<16x32xindex>
      %2 = "xegpu.load"(%arg0, %1, %0) <{layout = #xegpu.layout<inst_data = [1, 16]>}> : (memref<512xf32>, vector<16x32xindex>, vector<16x32xi1>) -> vector<16x32xf32>
      "xegpu.store"(%2, %arg0, %1, %0) <{layout = #xegpu.layout<inst_data = [1, 16]>}> : (vector<16x32xf32>, memref<512xf32>, vector<16x32xindex>, vector<16x32xi1>) -> ()
      "func.return"() : () -> ()
    }) : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "gpu.module"() <{sym_name = "test"}> ({
    "func.func"() <{function_type = (vector<8x16xf16>, vector<16x16xf16>) -> (), sym_name = "complete_dpas_inst_data"}> ({
    ^bb0(%arg0: vector<8x16xf16>, %arg1: vector<16x16xf16>):
      %0 = "arith.constant"() <{value = dense<0.000000e+00> : vector<8x16xf32>}> : () -> vector<8x16xf32>
      %1 = "xegpu.dpas"(%arg0, %arg1, %0) <{layout_a = #xegpu.layout<inst_data = [8, 16]>, layout_b = #xegpu.layout<inst_data = [16, 16]>, layout_cd = #xegpu.layout<inst_data = [8, 16]>}> : (vector<8x16xf16>, vector<16x16xf16>, vector<8x16xf32>) -> vector<8x16xf32>
      "func.return"() : () -> ()
    }) : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "gpu.module"() <{sym_name = "test"}> ({
    "func.func"() <{function_type = (vector<16x1024xf8E5M2>, vector<1024x32xf8E5M2>, vector<16x32xf8E8M0FNU>, vector<32x32xf8E8M0FNU>) -> (), sym_name = "complete_dpas_mx_inst_data"}> ({
    ^bb0(%arg0: vector<16x1024xf8E5M2>, %arg1: vector<1024x32xf8E5M2>, %arg2: vector<16x32xf8E8M0FNU>, %arg3: vector<32x32xf8E8M0FNU>):
      %0 = "arith.constant"() <{value = dense<0.000000e+00> : vector<16x32xbf16>}> : () -> vector<16x32xbf16>
      %1 = "xegpu.dpas_mx"(%arg0, %arg1, %0, %arg2, %arg3) <{layout_a = #xegpu.layout<inst_data = [8, 32]>, layout_a_scale = #xegpu.layout<inst_data = [8, 1]>, layout_b = #xegpu.layout<inst_data = [32, 16]>, layout_b_scale = #xegpu.layout<inst_data = [1, 16]>, layout_cd = #xegpu.layout<inst_data = [8, 16]>, operandSegmentSizes = array<i32: 1, 1, 1, 1, 1>}> : (vector<16x1024xf8E5M2>, vector<1024x32xf8E5M2>, vector<16x32xbf16>, vector<16x32xf8E8M0FNU>, vector<32x32xf8E8M0FNU>) -> vector<16x32xbf16>
      "func.return"() : () -> ()
    }) : () -> ()
  }) : () -> ()
}) : () -> ()

