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
  "gpu.module"() <{sym_name = "test"}> ({
    "func.func"() <{function_type = (vector<8x32xi8>, vector<32x16xi8>, memref<8x16xi32>) -> (), sym_name = "dpas_i8"}> ({
    ^bb0(%arg0: vector<8x32xi8>, %arg1: vector<32x16xi8>, %arg2: memref<8x16xi32>):
      %0 = "arith.constant"() <{value = 0 : index}> : () -> index
      %1 = "xegpu.dpas"(%arg0, %arg1) : (vector<8x32xi8>, vector<32x16xi8>) -> vector<8x16xi32>
      %2 = "xegpu.create_nd_tdesc"(%arg2, %0, %0) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>, operandSegmentSizes = array<i32: 1, 2, 0, 0>}> : (memref<8x16xi32>, index, index) -> !xegpu.tensor_desc<8x16xi32>
      "xegpu.store_nd"(%1, %2) : (vector<8x16xi32>, !xegpu.tensor_desc<8x16xi32>) -> ()
      "func.return"() : () -> ()
    }) : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "gpu.module"() <{sym_name = "test"}> ({
    "func.func"() <{function_type = (memref<8x16xf16>, memref<16x16xf16>, memref<8x16xf32>) -> (), sym_name = "load_with_transpose_effect"}> ({
    ^bb0(%arg0: memref<8x16xf16>, %arg1: memref<16x16xf16>, %arg2: memref<8x16xf32>):
      %0 = "arith.constant"() <{value = 0 : index}> : () -> index
      %1 = "arith.constant"() <{value = dense<0.000000e+00> : vector<8x16xf32>}> : () -> vector<8x16xf32>
      %2 = "xegpu.create_nd_tdesc"(%arg0, %0, %0) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>, operandSegmentSizes = array<i32: 1, 2, 0, 0>}> : (memref<8x16xf16>, index, index) -> !xegpu.tensor_desc<8x16xf16>
      %3 = "xegpu.create_nd_tdesc"(%arg1, %0, %0) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>, operandSegmentSizes = array<i32: 1, 2, 0, 0>}> : (memref<16x16xf16>, index, index) -> !xegpu.tensor_desc<16x16xf16>
      %4 = "xegpu.load_nd"(%2) : (!xegpu.tensor_desc<8x16xf16>) -> vector<8x16xf16>
      %5 = "xegpu.load_nd"(%3) <{transpose = array<i64: 1, 0>}> : (!xegpu.tensor_desc<16x16xf16>) -> vector<16x16xf16>
      %6 = "xegpu.dpas"(%4, %5, %1) : (vector<8x16xf16>, vector<16x16xf16>, vector<8x16xf32>) -> vector<8x16xf32>
      %7 = "xegpu.create_nd_tdesc"(%arg2, %0, %0) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>, operandSegmentSizes = array<i32: 1, 2, 0, 0>}> : (memref<8x16xf32>, index, index) -> !xegpu.tensor_desc<8x16xf32>
      "xegpu.store_nd"(%6, %7) : (vector<8x16xf32>, !xegpu.tensor_desc<8x16xf32>) -> ()
      "func.return"() : () -> ()
    }) : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "gpu.module"() <{sym_name = "test"}> ({
    "func.func"() <{function_type = (memref<8x16xf16>, memref<16x16xf16>, memref<8x16xf32>) -> (), sym_name = "vector_transpose"}> ({
    ^bb0(%arg0: memref<8x16xf16>, %arg1: memref<16x16xf16>, %arg2: memref<8x16xf32>):
      %0 = "arith.constant"() <{value = 0 : index}> : () -> index
      %1 = "arith.constant"() <{value = dense<0.000000e+00> : vector<8x16xf32>}> : () -> vector<8x16xf32>
      %2 = "xegpu.create_nd_tdesc"(%arg0, %0, %0) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>, operandSegmentSizes = array<i32: 1, 2, 0, 0>}> : (memref<8x16xf16>, index, index) -> !xegpu.tensor_desc<8x16xf16>
      %3 = "xegpu.create_nd_tdesc"(%arg1, %0, %0) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>, operandSegmentSizes = array<i32: 1, 2, 0, 0>}> : (memref<16x16xf16>, index, index) -> !xegpu.tensor_desc<16x16xf16>
      %4 = "xegpu.load_nd"(%2) : (!xegpu.tensor_desc<8x16xf16>) -> vector<8x16xf16>
      %5 = "xegpu.load_nd"(%3) : (!xegpu.tensor_desc<16x16xf16>) -> vector<16x16xf16>
      %6 = "vector.transpose"(%5) <{permutation = array<i64: 1, 0>}> : (vector<16x16xf16>) -> vector<16x16xf16>
      %7 = "xegpu.dpas"(%4, %6, %1) : (vector<8x16xf16>, vector<16x16xf16>, vector<8x16xf32>) -> vector<8x16xf32>
      %8 = "xegpu.create_nd_tdesc"(%arg2, %0, %0) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>, operandSegmentSizes = array<i32: 1, 2, 0, 0>}> : (memref<8x16xf32>, index, index) -> !xegpu.tensor_desc<8x16xf32>
      "xegpu.store_nd"(%7, %8) : (vector<8x16xf32>, !xegpu.tensor_desc<8x16xf32>) -> ()
      "func.return"() : () -> ()
    }) : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "gpu.module"() <{sym_name = "test"}> ({
    "func.func"() <{function_type = (!xegpu.tensor_desc<8x16xf16>, !xegpu.tensor_desc<16x16xf16>) -> vector<8x16xf32>, sym_name = "extf_truncf"}> ({
    ^bb0(%arg0: !xegpu.tensor_desc<8x16xf16>, %arg1: !xegpu.tensor_desc<16x16xf16>):
      %0 = "xegpu.load_nd"(%arg0) : (!xegpu.tensor_desc<8x16xf16>) -> vector<8x16xf16>
      %1 = "xegpu.load_nd"(%arg1) : (!xegpu.tensor_desc<16x16xf16>) -> vector<16x16xf16>
      %2 = "arith.extf"(%1) : (vector<16x16xf16>) -> vector<16x16xf32>
      %3 = "arith.truncf"(%2) : (vector<16x16xf32>) -> vector<16x16xf16>
      %4 = "xegpu.dpas"(%0, %3) : (vector<8x16xf16>, vector<16x16xf16>) -> vector<8x16xf32>
      "func.return"(%4) : (vector<8x16xf32>) -> ()
    }) : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "gpu.module"() <{sym_name = "test"}> ({
    "func.func"() <{function_type = (memref<8x16xf16>, memref<256xf16>, memref<8x16xf32>) -> (), sym_name = "load_gather_with_chunksize"}> ({
    ^bb0(%arg0: memref<8x16xf16>, %arg1: memref<256xf16>, %arg2: memref<8x16xf32>):
      %0 = "arith.constant"() <{value = 0 : index}> : () -> index
      %1 = "xegpu.create_nd_tdesc"(%arg0, %0, %0) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>, operandSegmentSizes = array<i32: 1, 2, 0, 0>}> : (memref<8x16xf16>, index, index) -> !xegpu.tensor_desc<8x16xf16>
      %2 = "xegpu.load_nd"(%1) : (!xegpu.tensor_desc<8x16xf16>) -> vector<8x16xf16>
      %3 = "arith.constant"() <{value = dense<[0, 16, 32, 48, 64, 80, 96, 112, 128, 144, 160, 176, 192, 208, 224, 240]> : vector<16xindex>}> : () -> vector<16xindex>
      %4 = "arith.constant"() <{value = dense<true> : vector<16xi1>}> : () -> vector<16xi1>
      %5 = "xegpu.create_tdesc"(%arg1, %3) : (memref<256xf16>, vector<16xindex>) -> !xegpu.tensor_desc<16x16xf16, #xegpu.scatter_tdesc_attr<chunk_size = 16 : i64>>
      %6 = "xegpu.load"(%5, %4) : (!xegpu.tensor_desc<16x16xf16, #xegpu.scatter_tdesc_attr<chunk_size = 16 : i64>>, vector<16xi1>) -> vector<16x16xf16>
      %7 = "vector.transpose"(%6) <{permutation = array<i64: 1, 0>}> : (vector<16x16xf16>) -> vector<16x16xf16>
      %8 = "xegpu.dpas"(%2, %7) : (vector<8x16xf16>, vector<16x16xf16>) -> vector<8x16xf32>
      %9 = "xegpu.create_nd_tdesc"(%arg2, %0, %0) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>, operandSegmentSizes = array<i32: 1, 2, 0, 0>}> : (memref<8x16xf32>, index, index) -> !xegpu.tensor_desc<8x16xf32>
      "xegpu.store_nd"(%8, %9) : (vector<8x16xf32>, !xegpu.tensor_desc<8x16xf32>) -> ()
      "func.return"() : () -> ()
    }) : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "gpu.module"() <{sym_name = "test"}> ({
    "func.func"() <{function_type = (memref<256xf32>, !xegpu.tensor_desc<16xf32>) -> (), sym_name = "load_gather_1d"}> ({
    ^bb0(%arg0: memref<256xf32>, %arg1: !xegpu.tensor_desc<16xf32>):
      %0 = "arith.constant"() <{value = dense<[0, 16, 32, 48, 64, 80, 96, 112, 128, 144, 160, 176, 192, 208, 224, 240]> : vector<16xindex>}> : () -> vector<16xindex>
      %1 = "arith.constant"() <{value = dense<true> : vector<16xi1>}> : () -> vector<16xi1>
      %2 = "xegpu.create_tdesc"(%arg0, %0) : (memref<256xf32>, vector<16xindex>) -> !xegpu.tensor_desc<16xf32, #xegpu.scatter_tdesc_attr<>>
      %3 = "xegpu.load"(%2, %1) : (!xegpu.tensor_desc<16xf32, #xegpu.scatter_tdesc_attr<>>, vector<16xi1>) -> vector<16xf32>
      "xegpu.store_nd"(%3, %arg1) : (vector<16xf32>, !xegpu.tensor_desc<16xf32>) -> ()
      "func.return"() : () -> ()
    }) : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "gpu.module"() <{sym_name = "test"}> ({
    "func.func"() <{function_type = (memref<128xf32>) -> (), sym_name = "store_scatter_with_chunksize"}> ({
    ^bb0(%arg0: memref<128xf32>):
      %0 = "arith.constant"() <{value = dense<1.000000e+00> : vector<16x8xf32>}> : () -> vector<16x8xf32>
      %1 = "arith.constant"() <{value = dense<true> : vector<16xi1>}> : () -> vector<16xi1>
      %2 = "arith.constant"() <{value = dense<[0, 16, 32, 48, 64, 80, 96, 112, 128, 144, 160, 176, 192, 208, 224, 240]> : vector<16xindex>}> : () -> vector<16xindex>
      %3 = "xegpu.create_tdesc"(%arg0, %2) : (memref<128xf32>, vector<16xindex>) -> !xegpu.tensor_desc<16x8xf32, #xegpu.scatter_tdesc_attr<chunk_size = 8 : i64>>
      "xegpu.store"(%0, %3, %1) : (vector<16x8xf32>, !xegpu.tensor_desc<16x8xf32, #xegpu.scatter_tdesc_attr<chunk_size = 8 : i64>>, vector<16xi1>) -> ()
      "func.return"() : () -> ()
    }) : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "gpu.module"() <{sym_name = "test"}> ({
    "func.func"() <{function_type = (vector<16xf32>, memref<256xf32>) -> (), sym_name = "store_scatter_1d"}> ({
    ^bb0(%arg0: vector<16xf32>, %arg1: memref<256xf32>):
      %0 = "arith.constant"() <{value = dense<[0, 16, 32, 48, 64, 80, 96, 112, 128, 144, 160, 176, 192, 208, 224, 240]> : vector<16xindex>}> : () -> vector<16xindex>
      %1 = "arith.constant"() <{value = dense<true> : vector<16xi1>}> : () -> vector<16xi1>
      %2 = "xegpu.create_tdesc"(%arg1, %0) : (memref<256xf32>, vector<16xindex>) -> !xegpu.tensor_desc<16xf32, #xegpu.scatter_tdesc_attr<>>
      "xegpu.store"(%arg0, %2, %1) : (vector<16xf32>, !xegpu.tensor_desc<16xf32, #xegpu.scatter_tdesc_attr<>>, vector<16xi1>) -> ()
      "func.return"() : () -> ()
    }) : () -> ()
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

// -----
"builtin.module"() ({
  "gpu.module"() <{sym_name = "test"}> ({
    "func.func"() <{function_type = (memref<256xf16>) -> (), sym_name = "scatter_ops"}> ({
    ^bb0(%arg0: memref<256xf16>):
      %0 = "arith.constant"() <{value = dense<true> : vector<16xi1>}> : () -> vector<16xi1>
      %1 = "arith.constant"() <{value = dense<12> : vector<16xindex>}> : () -> vector<16xindex>
      %2 = "xegpu.load"(%arg0, %1, %0) : (memref<256xf16>, vector<16xindex>, vector<16xi1>) -> vector<16xf16>
      "xegpu.store"(%2, %arg0, %1, %0) : (vector<16xf16>, memref<256xf16>, vector<16xindex>, vector<16xi1>) -> ()
      "func.return"() : () -> ()
    }) : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "gpu.module"() <{sym_name = "test"}> ({
    "func.func"() <{function_type = (memref<256xf16>) -> (), sym_name = "scatter_ops_custom_perm_layout"}> ({
    ^bb0(%arg0: memref<256xf16>):
      %0 = "arith.constant"() <{value = dense<true> : vector<16xi1>}> : () -> vector<16xi1>
      %1 = "arith.constant"() <{value = dense<12> : vector<16xindex>}> : () -> vector<16xindex>
      %2 = "xegpu.load"(%arg0, %1, %0) : (memref<256xf16>, vector<16xindex>, vector<16xi1>) -> vector<16xf16>
      %3 = "arith.addf"(%2, %2) <{fastmath = #arith.fastmath<none>}> : (vector<16xf16>, vector<16xf16>) -> vector<16xf16>
      "xegpu.store"(%3, %arg0, %1, %0) <{layout = #xegpu.layout<lane_layout = [8], lane_data = [1]>}> : (vector<16xf16>, memref<256xf16>, vector<16xindex>, vector<16xi1>) -> ()
      "func.return"() : () -> ()
    }) : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "gpu.module"() <{sym_name = "test"}> ({
    "func.func"() <{function_type = (memref<256xf16>) -> (), sym_name = "scatter_ops_preserve_load_perm_layout"}> ({
    ^bb0(%arg0: memref<256xf16>):
      %0 = "arith.constant"() <{value = dense<true> : vector<16xi1>}> : () -> vector<16xi1>
      %1 = "arith.constant"() <{value = dense<12> : vector<16xindex>}> : () -> vector<16xindex>
      %2 = "xegpu.load"(%arg0, %1, %0) <{layout = #xegpu.layout<lane_layout = [16], lane_data = [1]>}> : (memref<256xf16>, vector<16xindex>, vector<16xi1>) -> vector<16xf16>
      %3 = "arith.addf"(%2, %2) <{fastmath = #arith.fastmath<none>}> : (vector<16xf16>, vector<16xf16>) -> vector<16xf16>
      "xegpu.store"(%3, %arg0, %1, %0) <{layout = #xegpu.layout<lane_layout = [8], lane_data = [1]>}> : (vector<16xf16>, memref<256xf16>, vector<16xindex>, vector<16xi1>) -> ()
      "func.return"() : () -> ()
    }) : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "gpu.module"() <{sym_name = "test"}> ({
    "func.func"() <{function_type = (memref<8x16xi16>, memref<16x16xi16>, memref<8x16xf32>) -> (), sym_name = "vector_bitcast_i16_to_f16"}> ({
    ^bb0(%arg0: memref<8x16xi16>, %arg1: memref<16x16xi16>, %arg2: memref<8x16xf32>):
      %0 = "arith.constant"() <{value = 0 : index}> : () -> index
      %1 = "xegpu.create_nd_tdesc"(%arg0, %0, %0) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>, operandSegmentSizes = array<i32: 1, 2, 0, 0>}> : (memref<8x16xi16>, index, index) -> !xegpu.tensor_desc<8x16xi16>
      %2 = "xegpu.create_nd_tdesc"(%arg1, %0, %0) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>, operandSegmentSizes = array<i32: 1, 2, 0, 0>}> : (memref<16x16xi16>, index, index) -> !xegpu.tensor_desc<16x16xi16>
      %3 = "xegpu.load_nd"(%1) : (!xegpu.tensor_desc<8x16xi16>) -> vector<8x16xi16>
      %4 = "xegpu.load_nd"(%2) : (!xegpu.tensor_desc<16x16xi16>) -> vector<16x16xi16>
      %5 = "vector.bitcast"(%3) : (vector<8x16xi16>) -> vector<8x16xf16>
      %6 = "vector.bitcast"(%4) : (vector<16x16xi16>) -> vector<16x16xf16>
      %7 = "xegpu.dpas"(%5, %6) : (vector<8x16xf16>, vector<16x16xf16>) -> vector<8x16xf32>
      %8 = "xegpu.create_nd_tdesc"(%arg2, %0, %0) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>, operandSegmentSizes = array<i32: 1, 2, 0, 0>}> : (memref<8x16xf32>, index, index) -> !xegpu.tensor_desc<8x16xf32>
      "xegpu.store_nd"(%7, %8) : (vector<8x16xf32>, !xegpu.tensor_desc<8x16xf32>) -> ()
      "func.return"() : () -> ()
    }) : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "gpu.module"() <{sym_name = "test"}> ({
    "func.func"() <{function_type = (memref<8x16xf16>, memref<16x8xi32>, memref<8x16xf32>) -> (), sym_name = "vector_bitcast_i32_to_f16"}> ({
    ^bb0(%arg0: memref<8x16xf16>, %arg1: memref<16x8xi32>, %arg2: memref<8x16xf32>):
      %0 = "arith.constant"() <{value = 0 : index}> : () -> index
      %1 = "xegpu.create_nd_tdesc"(%arg0, %0, %0) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>, operandSegmentSizes = array<i32: 1, 2, 0, 0>}> : (memref<8x16xf16>, index, index) -> !xegpu.tensor_desc<8x16xf16>
      %2 = "xegpu.create_nd_tdesc"(%arg1, %0, %0) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>, operandSegmentSizes = array<i32: 1, 2, 0, 0>}> : (memref<16x8xi32>, index, index) -> !xegpu.tensor_desc<16x8xi32>
      %3 = "xegpu.load_nd"(%1) : (!xegpu.tensor_desc<8x16xf16>) -> vector<8x16xf16>
      %4 = "xegpu.load_nd"(%2) : (!xegpu.tensor_desc<16x8xi32>) -> vector<16x8xi32>
      %5 = "vector.bitcast"(%4) : (vector<16x8xi32>) -> vector<16x16xf16>
      %6 = "vector.transpose"(%5) <{permutation = array<i64: 1, 0>}> : (vector<16x16xf16>) -> vector<16x16xf16>
      %7 = "xegpu.dpas"(%3, %6) : (vector<8x16xf16>, vector<16x16xf16>) -> vector<8x16xf32>
      %8 = "xegpu.create_nd_tdesc"(%arg2, %0, %0) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>, operandSegmentSizes = array<i32: 1, 2, 0, 0>}> : (memref<8x16xf32>, index, index) -> !xegpu.tensor_desc<8x16xf32>
      "xegpu.store_nd"(%7, %8) : (vector<8x16xf32>, !xegpu.tensor_desc<8x16xf32>) -> ()
      "func.return"() : () -> ()
    }) : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "gpu.module"() <{sym_name = "test"}> ({
    "func.func"() <{function_type = (memref<8x32xi16>, memref<8x16xi32>) -> (), sym_name = "vector_bitcast_i16_to_i32"}> ({
    ^bb0(%arg0: memref<8x32xi16>, %arg1: memref<8x16xi32>):
      %0 = "arith.constant"() <{value = 0 : index}> : () -> index
      %1 = "xegpu.create_nd_tdesc"(%arg0, %0, %0) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>, operandSegmentSizes = array<i32: 1, 2, 0, 0>}> : (memref<8x32xi16>, index, index) -> !xegpu.tensor_desc<8x32xi16>
      %2 = "xegpu.create_nd_tdesc"(%arg1, %0, %0) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>, operandSegmentSizes = array<i32: 1, 2, 0, 0>}> : (memref<8x16xi32>, index, index) -> !xegpu.tensor_desc<8x16xi32>
      %3 = "xegpu.load_nd"(%1) : (!xegpu.tensor_desc<8x32xi16>) -> vector<8x32xi16>
      %4 = "vector.bitcast"(%3) : (vector<8x32xi16>) -> vector<8x16xi32>
      "xegpu.store_nd"(%4, %2) : (vector<8x16xi32>, !xegpu.tensor_desc<8x16xi32>) -> ()
      "func.return"() : () -> ()
    }) : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "gpu.module"() <{sym_name = "test"}> ({
    "func.func"() <{function_type = (memref<8x16xi32>, memref<8x32xi16>) -> (), sym_name = "vector_bitcast_require_cross_lane_shuffle"}> ({
    ^bb0(%arg0: memref<8x16xi32>, %arg1: memref<8x32xi16>):
      %0 = "arith.constant"() <{value = 0 : index}> : () -> index
      %1 = "xegpu.create_nd_tdesc"(%arg0, %0, %0) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>, operandSegmentSizes = array<i32: 1, 2, 0, 0>}> : (memref<8x16xi32>, index, index) -> !xegpu.tensor_desc<8x16xi32>
      %2 = "xegpu.create_nd_tdesc"(%arg1, %0, %0) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>, operandSegmentSizes = array<i32: 1, 2, 0, 0>}> : (memref<8x32xi16>, index, index) -> !xegpu.tensor_desc<8x32xi16>
      %3 = "xegpu.load_nd"(%1) : (!xegpu.tensor_desc<8x16xi32>) -> vector<8x16xi32>
      %4 = "vector.bitcast"(%3) : (vector<8x16xi32>) -> vector<8x32xi16>
      "xegpu.store_nd"(%4, %2) : (vector<8x32xi16>, !xegpu.tensor_desc<8x32xi16>) -> ()
      "func.return"() : () -> ()
    }) : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "gpu.module"() <{sym_name = "test"}> ({
    "func.func"() <{function_type = (!xegpu.tensor_desc<8x16xf16>, !xegpu.tensor_desc<16x16xf16>, !xegpu.tensor_desc<8x16xf32>) -> (), sym_name = "binary_op_one_use"}> ({
    ^bb0(%arg0: !xegpu.tensor_desc<8x16xf16>, %arg1: !xegpu.tensor_desc<16x16xf16>, %arg2: !xegpu.tensor_desc<8x16xf32>):
      %0 = "xegpu.load_nd"(%arg0) : (!xegpu.tensor_desc<8x16xf16>) -> vector<8x16xf16>
      %1 = "xegpu.load_nd"(%arg1) : (!xegpu.tensor_desc<16x16xf16>) -> vector<16x16xf16>
      %2 = "xegpu.load_nd"(%arg1) : (!xegpu.tensor_desc<16x16xf16>) -> vector<16x16xf16>
      %3 = "arith.addf"(%1, %2) <{fastmath = #arith.fastmath<none>}> : (vector<16x16xf16>, vector<16x16xf16>) -> vector<16x16xf16>
      %4 = "xegpu.dpas"(%0, %3) : (vector<8x16xf16>, vector<16x16xf16>) -> vector<8x16xf32>
      "xegpu.store_nd"(%4, %arg2) : (vector<8x16xf32>, !xegpu.tensor_desc<8x16xf32>) -> ()
      "func.return"() : () -> ()
    }) : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "gpu.module"() <{sym_name = "test"}> ({
    "func.func"() <{function_type = (!xegpu.tensor_desc<8x16xf16>, !xegpu.tensor_desc<16x16xf16>, !xegpu.tensor_desc<8x16xf32>, !xegpu.tensor_desc<16x16xf16>) -> (), sym_name = "binary_op_multiple_uses"}> ({
    ^bb0(%arg0: !xegpu.tensor_desc<8x16xf16>, %arg1: !xegpu.tensor_desc<16x16xf16>, %arg2: !xegpu.tensor_desc<8x16xf32>, %arg3: !xegpu.tensor_desc<16x16xf16>):
      %0 = "xegpu.load_nd"(%arg0) : (!xegpu.tensor_desc<8x16xf16>) -> vector<8x16xf16>
      %1 = "xegpu.load_nd"(%arg1) : (!xegpu.tensor_desc<16x16xf16>) -> vector<16x16xf16>
      %2 = "arith.constant"() <{value = dense<1.000000e+00> : vector<16x16xf16>}> : () -> vector<16x16xf16>
      %3 = "arith.addf"(%1, %2) <{fastmath = #arith.fastmath<none>}> : (vector<16x16xf16>, vector<16x16xf16>) -> vector<16x16xf16>
      %4 = "xegpu.dpas"(%0, %3) : (vector<8x16xf16>, vector<16x16xf16>) -> vector<8x16xf32>
      "xegpu.store_nd"(%4, %arg2) : (vector<8x16xf32>, !xegpu.tensor_desc<8x16xf32>) -> ()
      "xegpu.store_nd"(%3, %arg3) : (vector<16x16xf16>, !xegpu.tensor_desc<16x16xf16>) -> ()
      "func.return"() : () -> ()
    }) : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "gpu.module"() <{sym_name = "test"}> ({
    "func.func"() <{function_type = (memref<8x128xf16>, memref<128x16xf16>, memref<8x16xf32>) -> (), sym_name = "for_op"}> ({
    ^bb0(%arg0: memref<8x128xf16>, %arg1: memref<128x16xf16>, %arg2: memref<8x16xf32>):
      %0 = "arith.constant"() <{value = 0 : index}> : () -> index
      %1 = "arith.constant"() <{value = 128 : index}> : () -> index
      %2 = "arith.constant"() <{value = 16 : index}> : () -> index
      %3 = "xegpu.create_nd_tdesc"(%arg0, %0, %0) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>, operandSegmentSizes = array<i32: 1, 2, 0, 0>}> : (memref<8x128xf16>, index, index) -> !xegpu.tensor_desc<8x16xf16>
      %4 = "xegpu.create_nd_tdesc"(%arg1, %0, %0) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>, operandSegmentSizes = array<i32: 1, 2, 0, 0>}> : (memref<128x16xf16>, index, index) -> !xegpu.tensor_desc<16x16xf16>
      %5 = "arith.constant"() <{value = dense<0.000000e+00> : vector<8x16xf32>}> : () -> vector<8x16xf32>
      %6:3 = "scf.for"(%0, %1, %2, %3, %4, %5) ({
      ^bb0(%arg3: index, %arg4: !xegpu.tensor_desc<8x16xf16>, %arg5: !xegpu.tensor_desc<16x16xf16>, %arg6: vector<8x16xf32>):
        %8 = "xegpu.load_nd"(%arg4) : (!xegpu.tensor_desc<8x16xf16>) -> vector<8x16xf16>
        %9 = "xegpu.load_nd"(%arg5) : (!xegpu.tensor_desc<16x16xf16>) -> vector<16x16xf16>
        %10 = "xegpu.dpas"(%8, %9, %arg6) : (vector<8x16xf16>, vector<16x16xf16>, vector<8x16xf32>) -> vector<8x16xf32>
        %11 = "xegpu.update_nd_offset"(%arg4, %0, %2) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>}> : (!xegpu.tensor_desc<8x16xf16>, index, index) -> !xegpu.tensor_desc<8x16xf16>
        %12 = "xegpu.update_nd_offset"(%arg5, %2, %0) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>}> : (!xegpu.tensor_desc<16x16xf16>, index, index) -> !xegpu.tensor_desc<16x16xf16>
        "scf.yield"(%11, %12, %10) : (!xegpu.tensor_desc<8x16xf16>, !xegpu.tensor_desc<16x16xf16>, vector<8x16xf32>) -> ()
      }) : (index, index, index, !xegpu.tensor_desc<8x16xf16>, !xegpu.tensor_desc<16x16xf16>, vector<8x16xf32>) -> (!xegpu.tensor_desc<8x16xf16>, !xegpu.tensor_desc<16x16xf16>, vector<8x16xf32>)
      %7 = "xegpu.create_nd_tdesc"(%arg2, %0, %0) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>, operandSegmentSizes = array<i32: 1, 2, 0, 0>}> : (memref<8x16xf32>, index, index) -> !xegpu.tensor_desc<8x16xf32>
      "xegpu.store_nd"(%6#2, %7) : (vector<8x16xf32>, !xegpu.tensor_desc<8x16xf32>) -> ()
      "func.return"() : () -> ()
    }) : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "gpu.module"() <{sym_name = "test"}> ({
    "func.func"() <{function_type = (!xegpu.tensor_desc<8x16xf16>, !xegpu.tensor_desc<16x16xf16>, i1, !xegpu.tensor_desc<8x16xf32>) -> (), sym_name = "if_single_use"}> ({
    ^bb0(%arg0: !xegpu.tensor_desc<8x16xf16>, %arg1: !xegpu.tensor_desc<16x16xf16>, %arg2: i1, %arg3: !xegpu.tensor_desc<8x16xf32>):
      %0 = "xegpu.load_nd"(%arg0) : (!xegpu.tensor_desc<8x16xf16>) -> vector<8x16xf16>
      %1 = "scf.if"(%arg2) ({
        %4 = "xegpu.load_nd"(%arg1) : (!xegpu.tensor_desc<16x16xf16>) -> vector<16x16xf16>
        "scf.yield"(%4) : (vector<16x16xf16>) -> ()
      }, {
        %3 = "xegpu.load_nd"(%arg1) : (!xegpu.tensor_desc<16x16xf16>) -> vector<16x16xf16>
        "scf.yield"(%3) : (vector<16x16xf16>) -> ()
      }) : (i1) -> vector<16x16xf16>
      %2 = "xegpu.dpas"(%0, %1) : (vector<8x16xf16>, vector<16x16xf16>) -> vector<8x16xf32>
      "xegpu.store_nd"(%2, %arg3) : (vector<8x16xf32>, !xegpu.tensor_desc<8x16xf32>) -> ()
      "func.return"() : () -> ()
    }) : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "gpu.module"() <{sym_name = "test"}> ({
    "func.func"() <{function_type = (!xegpu.tensor_desc<8x16xf16>, !xegpu.tensor_desc<16x16xf16>, i1, !xegpu.tensor_desc<8x16xf32>, !xegpu.tensor_desc<16x16xf16>) -> (), sym_name = "if_multiple_uses"}> ({
    ^bb0(%arg0: !xegpu.tensor_desc<8x16xf16>, %arg1: !xegpu.tensor_desc<16x16xf16>, %arg2: i1, %arg3: !xegpu.tensor_desc<8x16xf32>, %arg4: !xegpu.tensor_desc<16x16xf16>):
      %0 = "xegpu.load_nd"(%arg0) : (!xegpu.tensor_desc<8x16xf16>) -> vector<8x16xf16>
      %1 = "scf.if"(%arg2) ({
        %4 = "xegpu.load_nd"(%arg1) : (!xegpu.tensor_desc<16x16xf16>) -> vector<16x16xf16>
        "scf.yield"(%4) : (vector<16x16xf16>) -> ()
      }, {
        %3 = "xegpu.load_nd"(%arg1) : (!xegpu.tensor_desc<16x16xf16>) -> vector<16x16xf16>
        "scf.yield"(%3) : (vector<16x16xf16>) -> ()
      }) : (i1) -> vector<16x16xf16>
      %2 = "xegpu.dpas"(%0, %1) : (vector<8x16xf16>, vector<16x16xf16>) -> vector<8x16xf32>
      "xegpu.store_nd"(%2, %arg3) : (vector<8x16xf32>, !xegpu.tensor_desc<8x16xf32>) -> ()
      "xegpu.store_nd"(%1, %arg4) : (vector<16x16xf16>, !xegpu.tensor_desc<16x16xf16>) -> ()
      "func.return"() : () -> ()
    }) : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "gpu.module"() <{sym_name = "test"}> ({
    "func.func"() <{function_type = (vector<16x16xf32>, !xegpu.tensor_desc<16xf32>) -> (), sym_name = "vector_outer_reduction"}> ({
    ^bb0(%arg0: vector<16x16xf32>, %arg1: !xegpu.tensor_desc<16xf32>):
      %0 = "arith.constant"() <{value = dense<0.000000e+00> : vector<16xf32>}> : () -> vector<16xf32>
      %1 = "vector.multi_reduction"(%arg0, %0) <{kind = #vector.kind<add>, reduction_dims = array<i64: 0>}> : (vector<16x16xf32>, vector<16xf32>) -> vector<16xf32>
      "xegpu.store_nd"(%1, %arg1) : (vector<16xf32>, !xegpu.tensor_desc<16xf32>) -> ()
      "func.return"() : () -> ()
    }) : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "gpu.module"() <{sym_name = "test"}> ({
    "func.func"() <{function_type = (vector<16x16xf32>, !xegpu.tensor_desc<16xf32>) -> (), sym_name = "vector_inner_reduction"}> ({
    ^bb0(%arg0: vector<16x16xf32>, %arg1: !xegpu.tensor_desc<16xf32>):
      %0 = "arith.constant"() <{value = dense<0.000000e+00> : vector<16xf32>}> : () -> vector<16xf32>
      %1 = "vector.multi_reduction"(%arg0, %0) <{kind = #vector.kind<add>, reduction_dims = array<i64: 1>}> : (vector<16x16xf32>, vector<16xf32>) -> vector<16xf32>
      "xegpu.store_nd"(%1, %arg1) : (vector<16xf32>, !xegpu.tensor_desc<16xf32>) -> ()
      "func.return"() : () -> ()
    }) : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "gpu.module"() <{sym_name = "test"}> ({
    "func.func"() <{function_type = (memref<256xf32>) -> (), sym_name = "update_nd_offset_1d"}> ({
    ^bb0(%arg0: memref<256xf32>):
      %0 = "arith.constant"() <{value = 0 : index}> : () -> index
      %1 = "arith.constant"() <{value = 32 : index}> : () -> index
      %2 = "arith.constant"() <{value = dense<1.000000e+00> : vector<16xf32>}> : () -> vector<16xf32>
      %3 = "xegpu.create_nd_tdesc"(%arg0, %0) <{const_offsets = array<i64: -9223372036854775808>, operandSegmentSizes = array<i32: 1, 1, 0, 0>}> : (memref<256xf32>, index) -> !xegpu.tensor_desc<16xf32>
      %4 = "xegpu.update_nd_offset"(%3, %1) <{const_offsets = array<i64: -9223372036854775808>}> : (!xegpu.tensor_desc<16xf32>, index) -> !xegpu.tensor_desc<16xf32>
      "xegpu.store_nd"(%2, %4) : (vector<16xf32>, !xegpu.tensor_desc<16xf32>) -> ()
      "func.return"() : () -> ()
    }) : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "gpu.module"() <{sym_name = "test"}> ({
    "func.func"() <{function_type = (memref<256x256xf32>) -> (), sym_name = "update_nd_offset_2d"}> ({
    ^bb0(%arg0: memref<256x256xf32>):
      %0 = "arith.constant"() <{value = 0 : index}> : () -> index
      %1 = "arith.constant"() <{value = 32 : index}> : () -> index
      %2 = "arith.constant"() <{value = dense<1.000000e+00> : vector<16x16xf32>}> : () -> vector<16x16xf32>
      %3 = "xegpu.create_nd_tdesc"(%arg0, %0, %0) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>, operandSegmentSizes = array<i32: 1, 2, 0, 0>}> : (memref<256x256xf32>, index, index) -> !xegpu.tensor_desc<16x16xf32>
      %4 = "xegpu.update_nd_offset"(%3, %1, %1) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>}> : (!xegpu.tensor_desc<16x16xf32>, index, index) -> !xegpu.tensor_desc<16x16xf32>
      "xegpu.store_nd"(%2, %4) : (vector<16x16xf32>, !xegpu.tensor_desc<16x16xf32>) -> ()
      "func.return"() : () -> ()
    }) : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "gpu.module"() <{sym_name = "test"}> ({
    "func.func"() <{function_type = (memref<256x256xf16>) -> (), sym_name = "prefetch_2d"}> ({
    ^bb0(%arg0: memref<256x256xf16>):
      %0 = "arith.constant"() <{value = 0 : index}> : () -> index
      %1 = "xegpu.create_nd_tdesc"(%arg0, %0, %0) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>, operandSegmentSizes = array<i32: 1, 2, 0, 0>}> : (memref<256x256xf16>, index, index) -> !xegpu.tensor_desc<16x16xf16>
      "xegpu.prefetch_nd"(%1) <{l1_hint = #xegpu.cache_hint<cached>, l2_hint = #xegpu.cache_hint<uncached>}> : (!xegpu.tensor_desc<16x16xf16>) -> ()
      "func.return"() : () -> ()
    }) : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "gpu.module"() <{sym_name = "test"}> ({
    "func.func"() <{function_type = (memref<256xf16>) -> (), sym_name = "prefetch_1d"}> ({
    ^bb0(%arg0: memref<256xf16>):
      %0 = "arith.constant"() <{value = 0 : index}> : () -> index
      %1 = "xegpu.create_nd_tdesc"(%arg0, %0) <{const_offsets = array<i64: -9223372036854775808>, operandSegmentSizes = array<i32: 1, 1, 0, 0>}> : (memref<256xf16>, index) -> !xegpu.tensor_desc<16xf16>
      "xegpu.prefetch_nd"(%1) <{l1_hint = #xegpu.cache_hint<cached>, l2_hint = #xegpu.cache_hint<uncached>}> : (!xegpu.tensor_desc<16xf16>) -> ()
      "func.return"() : () -> ()
    }) : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "gpu.module"() <{sym_name = "test"}> ({
    "func.func"() <{function_type = (memref<256xf32>, memref<256xf32>) -> (), sym_name = "scf_while_and_condition"}> ({
    ^bb0(%arg0: memref<256xf32>, %arg1: memref<256xf32>):
      %0 = "arith.constant"() <{value = 0 : i32}> : () -> i32
      %1 = "arith.constant"() <{value = 16 : i32}> : () -> i32
      %2 = "arith.constant"() <{value = 256 : i32}> : () -> i32
      %3 = "xegpu.create_nd_tdesc"(%arg0) <{const_offsets = array<i64: 0>, operandSegmentSizes = array<i32: 1, 0, 0, 0>}> : (memref<256xf32>) -> !xegpu.tensor_desc<16xf32>
      %4 = "xegpu.load_nd"(%3) : (!xegpu.tensor_desc<16xf32>) -> vector<16xf32>
      %5 = "xegpu.create_nd_tdesc"(%arg1) <{const_offsets = array<i64: 0>, operandSegmentSizes = array<i32: 1, 0, 0, 0>}> : (memref<256xf32>) -> !xegpu.tensor_desc<16xf32>
      %6:3 = "scf.while"(%4, %0, %3) ({
      ^bb0(%arg5: vector<16xf32>, %arg6: i32, %arg7: !xegpu.tensor_desc<16xf32>):
        %10 = "arith.cmpi"(%arg6, %2) <{predicate = 2 : i64}> : (i32, i32) -> i1
        "scf.condition"(%10, %arg5, %arg6, %arg7) : (i1, vector<16xf32>, i32, !xegpu.tensor_desc<16xf32>) -> ()
      }, {
      ^bb0(%arg2: vector<16xf32>, %arg3: i32, %arg4: !xegpu.tensor_desc<16xf32>):
        "xegpu.store_nd"(%arg2, %5) : (vector<16xf32>, !xegpu.tensor_desc<16xf32>) -> ()
        %7 = "arith.addi"(%arg3, %1) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
        %8 = "xegpu.update_nd_offset"(%arg4) <{const_offsets = array<i64: 16>}> : (!xegpu.tensor_desc<16xf32>) -> !xegpu.tensor_desc<16xf32>
        %9 = "xegpu.load_nd"(%8) : (!xegpu.tensor_desc<16xf32>) -> vector<16xf32>
        "scf.yield"(%9, %7, %8) : (vector<16xf32>, i32, !xegpu.tensor_desc<16xf32>) -> ()
      }) : (vector<16xf32>, i32, !xegpu.tensor_desc<16xf32>) -> (vector<16xf32>, i32, !xegpu.tensor_desc<16xf32>)
      "func.return"() : () -> ()
    }) : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "gpu.module"() <{sym_name = "test"}> ({
    "func.func"() <{function_type = (!xegpu.tensor_desc<16x16xf16>, !xegpu.tensor_desc<16x16xf16>) -> (), sym_name = "vector_shape_cast_1d_to_2d_dim1_distributed"}> ({
    ^bb0(%arg0: !xegpu.tensor_desc<16x16xf16>, %arg1: !xegpu.tensor_desc<16x16xf16>):
      %0 = "arith.constant"() <{value = 0 : index}> : () -> index
      %1 = "arith.constant"() <{value = dense<0.000000e+00> : vector<16xf16>}> : () -> vector<16xf16>
      %2 = "xegpu.load_nd"(%arg0) : (!xegpu.tensor_desc<16x16xf16>) -> vector<16x16xf16>
      %3 = "vector.multi_reduction"(%2, %1) <{kind = #vector.kind<add>, reduction_dims = array<i64: 0>}> : (vector<16x16xf16>, vector<16xf16>) -> vector<16xf16>
      %4 = "vector.shape_cast"(%3) : (vector<16xf16>) -> vector<1x16xf16>
      %5 = "vector.broadcast"(%4) : (vector<1x16xf16>) -> vector<16x16xf16>
      "xegpu.store_nd"(%5, %arg1) : (vector<16x16xf16>, !xegpu.tensor_desc<16x16xf16>) -> ()
      "func.return"() : () -> ()
    }) : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "gpu.module"() <{sym_name = "test"}> ({
    "func.func"() <{function_type = (!xegpu.tensor_desc<16x16xf16>, !xegpu.tensor_desc<16x16xf16>) -> (), sym_name = "vector_shape_cast_1d_to_2d_dim0_broadcasted"}> ({
    ^bb0(%arg0: !xegpu.tensor_desc<16x16xf16>, %arg1: !xegpu.tensor_desc<16x16xf16>):
      %0 = "arith.constant"() <{value = 0 : index}> : () -> index
      %1 = "arith.constant"() <{value = dense<0.000000e+00> : vector<16xf16>}> : () -> vector<16xf16>
      %2 = "xegpu.load_nd"(%arg0) : (!xegpu.tensor_desc<16x16xf16>) -> vector<16x16xf16>
      %3 = "vector.multi_reduction"(%2, %1) <{kind = #vector.kind<add>, reduction_dims = array<i64: 1>}> : (vector<16x16xf16>, vector<16xf16>) -> vector<16xf16>
      %4 = "vector.shape_cast"(%3) : (vector<16xf16>) -> vector<16x1xf16>
      %5 = "vector.broadcast"(%4) : (vector<16x1xf16>) -> vector<16x16xf16>
      "xegpu.store_nd"(%5, %arg1) : (vector<16x16xf16>, !xegpu.tensor_desc<16x16xf16>) -> ()
      "func.return"() : () -> ()
    }) : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "gpu.module"() <{sym_name = "test"}> ({
    "func.func"() <{function_type = (!xegpu.tensor_desc<16x16xf16>, !xegpu.tensor_desc<16x16xf16>) -> (), sym_name = "vector_broadcast_1d_to_2d_broadcast_along_row"}> ({
    ^bb0(%arg0: !xegpu.tensor_desc<16x16xf16>, %arg1: !xegpu.tensor_desc<16x16xf16>):
      %0 = "arith.constant"() <{value = 0 : index}> : () -> index
      %1 = "arith.constant"() <{value = dense<0.000000e+00> : vector<16xf16>}> : () -> vector<16xf16>
      %2 = "xegpu.load_nd"(%arg0) : (!xegpu.tensor_desc<16x16xf16>) -> vector<16x16xf16>
      %3 = "vector.multi_reduction"(%2, %1) <{kind = #vector.kind<add>, reduction_dims = array<i64: 0>}> : (vector<16x16xf16>, vector<16xf16>) -> vector<16xf16>
      %4 = "vector.broadcast"(%3) : (vector<16xf16>) -> vector<16x16xf16>
      "xegpu.store_nd"(%4, %arg1) : (vector<16x16xf16>, !xegpu.tensor_desc<16x16xf16>) -> ()
      "func.return"() : () -> ()
    }) : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "gpu.module"() <{sym_name = "test"}> ({
    "func.func"() <{function_type = (!xegpu.tensor_desc<16x16xf16>, !xegpu.tensor_desc<16x16xf16>) -> (), sym_name = "vector_broadcast_2d_to_2d_along_column"}> ({
    ^bb0(%arg0: !xegpu.tensor_desc<16x16xf16>, %arg1: !xegpu.tensor_desc<16x16xf16>):
      %0 = "arith.constant"() <{value = 0 : index}> : () -> index
      %1 = "arith.constant"() <{value = dense<0.000000e+00> : vector<16xf16>}> : () -> vector<16xf16>
      %2 = "xegpu.load_nd"(%arg0) : (!xegpu.tensor_desc<16x16xf16>) -> vector<16x16xf16>
      %3 = "vector.multi_reduction"(%2, %1) <{kind = #vector.kind<add>, reduction_dims = array<i64: 1>}> : (vector<16x16xf16>, vector<16xf16>) -> vector<16xf16>
      %4 = "vector.shape_cast"(%3) : (vector<16xf16>) -> vector<16x1xf16>
      %5 = "vector.broadcast"(%4) : (vector<16x1xf16>) -> vector<16x16xf16>
      "xegpu.store_nd"(%5, %arg1) : (vector<16x16xf16>, !xegpu.tensor_desc<16x16xf16>) -> ()
      "func.return"() : () -> ()
    }) : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "gpu.module"() <{sym_name = "test"}> ({
    "func.func"() <{function_type = (!xegpu.tensor_desc<16x16xf16>) -> (), sym_name = "vector_broadcast_scalar_to_vector"}> ({
    ^bb0(%arg0: !xegpu.tensor_desc<16x16xf16>):
      %0 = "arith.constant"() <{value = 0.000000e+00 : f16}> : () -> f16
      %1 = "vector.broadcast"(%0) : (f16) -> vector<16x16xf16>
      "xegpu.store_nd"(%1, %arg0) : (vector<16x16xf16>, !xegpu.tensor_desc<16x16xf16>) -> ()
      "func.return"() : () -> ()
    }) : () -> ()
  }) : () -> ()
}) : () -> ()

