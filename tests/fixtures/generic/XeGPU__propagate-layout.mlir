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
  "gpu.module"() <{sym_name = "test"}> ({
    "func.func"() <{function_type = (memref<8x16xf16>, memref<16x16xf16>, memref<8x16xf16>) -> (), sym_name = "dpas_f16_result_f16"}> ({
    ^bb0(%arg0: memref<8x16xf16>, %arg1: memref<16x16xf16>, %arg2: memref<8x16xf16>):
      %0 = "arith.constant"() <{value = 0 : index}> : () -> index
      %1 = "arith.constant"() <{value = dense<0.000000e+00> : vector<8x16xf16>}> : () -> vector<8x16xf16>
      %2 = "xegpu.create_nd_tdesc"(%arg0) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<8x16xf16>) -> !xegpu.tensor_desc<8x16xf16>
      %3 = "xegpu.create_nd_tdesc"(%arg1) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<16x16xf16>) -> !xegpu.tensor_desc<16x16xf16>
      %4 = "xegpu.load_nd"(%2) <{const_offsets = array<i64: 0, 0>}> : (!xegpu.tensor_desc<8x16xf16>) -> vector<8x16xf16>
      %5 = "xegpu.load_nd"(%3) <{const_offsets = array<i64: 0, 0>}> : (!xegpu.tensor_desc<16x16xf16>) -> vector<16x16xf16>
      %6 = "xegpu.dpas"(%4, %5, %1) : (vector<8x16xf16>, vector<16x16xf16>, vector<8x16xf16>) -> vector<8x16xf16>
      %7 = "xegpu.create_nd_tdesc"(%arg2) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<8x16xf16>) -> !xegpu.tensor_desc<8x16xf16>
      "xegpu.store_nd"(%6, %7) <{const_offsets = array<i64: 0, 0>}> : (vector<8x16xf16>, !xegpu.tensor_desc<8x16xf16>) -> ()
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
      %2 = "xegpu.create_nd_tdesc"(%arg2) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<8x16xi32>) -> !xegpu.tensor_desc<8x16xi32>
      "xegpu.store_nd"(%1, %2) <{const_offsets = array<i64: 0, 0>}> : (vector<8x16xi32>, !xegpu.tensor_desc<8x16xi32>) -> ()
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
      %2 = "xegpu.create_nd_tdesc"(%arg0) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<8x16xf16>) -> !xegpu.tensor_desc<8x16xf16>
      %3 = "xegpu.create_nd_tdesc"(%arg1) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<16x16xf16>) -> !xegpu.tensor_desc<16x16xf16>
      %4 = "xegpu.load_nd"(%2) <{const_offsets = array<i64: 0, 0>}> : (!xegpu.tensor_desc<8x16xf16>) -> vector<8x16xf16>
      %5 = "xegpu.load_nd"(%3) <{const_offsets = array<i64: 0, 0>, transpose = array<i64: 1, 0>}> : (!xegpu.tensor_desc<16x16xf16>) -> vector<16x16xf16>
      %6 = "xegpu.dpas"(%4, %5, %1) : (vector<8x16xf16>, vector<16x16xf16>, vector<8x16xf32>) -> vector<8x16xf32>
      %7 = "xegpu.create_nd_tdesc"(%arg2) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<8x16xf32>) -> !xegpu.tensor_desc<8x16xf32>
      "xegpu.store_nd"(%6, %7) <{const_offsets = array<i64: 0, 0>}> : (vector<8x16xf32>, !xegpu.tensor_desc<8x16xf32>) -> ()
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
      %2 = "xegpu.create_nd_tdesc"(%arg0) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<8x16xf16>) -> !xegpu.tensor_desc<8x16xf16>
      %3 = "xegpu.create_nd_tdesc"(%arg1) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<16x16xf16>) -> !xegpu.tensor_desc<16x16xf16>
      %4 = "xegpu.load_nd"(%2) <{const_offsets = array<i64: 0, 0>}> : (!xegpu.tensor_desc<8x16xf16>) -> vector<8x16xf16>
      %5 = "xegpu.load_nd"(%3) <{const_offsets = array<i64: 0, 0>}> : (!xegpu.tensor_desc<16x16xf16>) -> vector<16x16xf16>
      %6 = "vector.transpose"(%5) <{permutation = array<i64: 1, 0>}> : (vector<16x16xf16>) -> vector<16x16xf16>
      %7 = "xegpu.dpas"(%4, %6, %1) : (vector<8x16xf16>, vector<16x16xf16>, vector<8x16xf32>) -> vector<8x16xf32>
      %8 = "xegpu.create_nd_tdesc"(%arg2) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<8x16xf32>) -> !xegpu.tensor_desc<8x16xf32>
      "xegpu.store_nd"(%7, %8) <{const_offsets = array<i64: 0, 0>}> : (vector<8x16xf32>, !xegpu.tensor_desc<8x16xf32>) -> ()
      "func.return"() : () -> ()
    }) : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "gpu.module"() <{sym_name = "test"}> ({
    "func.func"() <{function_type = (!xegpu.tensor_desc<8x16xf16>, !xegpu.tensor_desc<16x16xf16>) -> vector<8x16xf32>, sym_name = "extf_truncf"}> ({
    ^bb0(%arg0: !xegpu.tensor_desc<8x16xf16>, %arg1: !xegpu.tensor_desc<16x16xf16>):
      %0 = "xegpu.load_nd"(%arg0) <{const_offsets = array<i64: 0, 0>}> : (!xegpu.tensor_desc<8x16xf16>) -> vector<8x16xf16>
      %1 = "xegpu.load_nd"(%arg1) <{const_offsets = array<i64: 0, 0>}> : (!xegpu.tensor_desc<16x16xf16>) -> vector<16x16xf16>
      %2 = "arith.extf"(%1) : (vector<16x16xf16>) -> vector<16x16xf32>
      %3 = "arith.truncf"(%2) : (vector<16x16xf32>) -> vector<16x16xf16>
      %4 = "xegpu.dpas"(%0, %3) : (vector<8x16xf16>, vector<16x16xf16>) -> vector<8x16xf32>
      %5 = "xegpu.convert_layout"(%4) <{input_layout = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>, target_layout = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>}> : (vector<8x16xf32>) -> vector<8x16xf32>
      "func.return"(%4) : (vector<8x16xf32>) -> ()
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
    "func.func"() <{function_type = (memref<128xf16>) -> (), sym_name = "scatter_ops_coalesce_chunksize"}> ({
    ^bb0(%arg0: memref<128xf16>):
      %0 = "arith.constant"() <{value = dense<true> : vector<16x8xi1>}> : () -> vector<16x8xi1>
      %1 = "arith.constant"() <{value = dense<12> : vector<16x8xindex>}> : () -> vector<16x8xindex>
      %2 = "xegpu.load"(%arg0, %1, %0) : (memref<128xf16>, vector<16x8xindex>, vector<16x8xi1>) -> vector<16x8xf16>
      "xegpu.store"(%2, %arg0, %1, %0) : (vector<16x8xf16>, memref<128xf16>, vector<16x8xindex>, vector<16x8xi1>) -> ()
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
      %1 = "xegpu.create_nd_tdesc"(%arg0) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<8x16xi16>) -> !xegpu.tensor_desc<8x16xi16>
      %2 = "xegpu.create_nd_tdesc"(%arg1) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<16x16xi16>) -> !xegpu.tensor_desc<16x16xi16>
      %3 = "xegpu.load_nd"(%1) <{const_offsets = array<i64: 0, 0>}> : (!xegpu.tensor_desc<8x16xi16>) -> vector<8x16xi16>
      %4 = "xegpu.load_nd"(%2) <{const_offsets = array<i64: 0, 0>}> : (!xegpu.tensor_desc<16x16xi16>) -> vector<16x16xi16>
      %5 = "vector.bitcast"(%3) : (vector<8x16xi16>) -> vector<8x16xf16>
      %6 = "vector.bitcast"(%4) : (vector<16x16xi16>) -> vector<16x16xf16>
      %7 = "xegpu.dpas"(%5, %6) : (vector<8x16xf16>, vector<16x16xf16>) -> vector<8x16xf32>
      %8 = "xegpu.create_nd_tdesc"(%arg2) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<8x16xf32>) -> !xegpu.tensor_desc<8x16xf32>
      "xegpu.store_nd"(%7, %8) <{const_offsets = array<i64: 0, 0>}> : (vector<8x16xf32>, !xegpu.tensor_desc<8x16xf32>) -> ()
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
      %1 = "xegpu.create_nd_tdesc"(%arg0) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<8x16xf16>) -> !xegpu.tensor_desc<8x16xf16>
      %2 = "xegpu.create_nd_tdesc"(%arg1) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<16x8xi32>) -> !xegpu.tensor_desc<16x8xi32>
      %3 = "xegpu.load_nd"(%1) <{const_offsets = array<i64: 0, 0>}> : (!xegpu.tensor_desc<8x16xf16>) -> vector<8x16xf16>
      %4 = "xegpu.load_nd"(%2) <{const_offsets = array<i64: 0, 0>}> : (!xegpu.tensor_desc<16x8xi32>) -> vector<16x8xi32>
      %5 = "vector.bitcast"(%4) : (vector<16x8xi32>) -> vector<16x16xf16>
      %6 = "vector.transpose"(%5) <{permutation = array<i64: 1, 0>}> : (vector<16x16xf16>) -> vector<16x16xf16>
      %7 = "xegpu.dpas"(%3, %6) : (vector<8x16xf16>, vector<16x16xf16>) -> vector<8x16xf32>
      %8 = "xegpu.create_nd_tdesc"(%arg2) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<8x16xf32>) -> !xegpu.tensor_desc<8x16xf32>
      "xegpu.store_nd"(%7, %8) <{const_offsets = array<i64: 0, 0>}> : (vector<8x16xf32>, !xegpu.tensor_desc<8x16xf32>) -> ()
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
      %1 = "xegpu.create_nd_tdesc"(%arg0) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<8x32xi16>) -> !xegpu.tensor_desc<8x32xi16>
      %2 = "xegpu.create_nd_tdesc"(%arg1) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<8x16xi32>) -> !xegpu.tensor_desc<8x16xi32>
      %3 = "xegpu.load_nd"(%1) <{const_offsets = array<i64: 0, 0>}> : (!xegpu.tensor_desc<8x32xi16>) -> vector<8x32xi16>
      %4 = "vector.bitcast"(%3) : (vector<8x32xi16>) -> vector<8x16xi32>
      "xegpu.store_nd"(%4, %2) <{const_offsets = array<i64: 0, 0>}> : (vector<8x16xi32>, !xegpu.tensor_desc<8x16xi32>) -> ()
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
      %1 = "xegpu.create_nd_tdesc"(%arg0) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<8x16xi32>) -> !xegpu.tensor_desc<8x16xi32>
      %2 = "xegpu.create_nd_tdesc"(%arg1) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<8x32xi16>) -> !xegpu.tensor_desc<8x32xi16>
      %3 = "xegpu.load_nd"(%1) <{const_offsets = array<i64: 0, 0>}> : (!xegpu.tensor_desc<8x16xi32>) -> vector<8x16xi32>
      %4 = "vector.bitcast"(%3) : (vector<8x16xi32>) -> vector<8x32xi16>
      "xegpu.store_nd"(%4, %2) <{const_offsets = array<i64: 0, 0>}> : (vector<8x32xi16>, !xegpu.tensor_desc<8x32xi16>) -> ()
      "func.return"() : () -> ()
    }) : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "gpu.module"() <{sym_name = "test"}> ({
    "func.func"() <{function_type = (!xegpu.tensor_desc<8x16xf16>, !xegpu.tensor_desc<16x16xf16>, !xegpu.tensor_desc<8x16xf32>) -> (), sym_name = "binary_op_one_use"}> ({
    ^bb0(%arg0: !xegpu.tensor_desc<8x16xf16>, %arg1: !xegpu.tensor_desc<16x16xf16>, %arg2: !xegpu.tensor_desc<8x16xf32>):
      %0 = "xegpu.load_nd"(%arg0) <{const_offsets = array<i64: 0, 0>}> : (!xegpu.tensor_desc<8x16xf16>) -> vector<8x16xf16>
      %1 = "xegpu.load_nd"(%arg1) <{const_offsets = array<i64: 0, 0>}> : (!xegpu.tensor_desc<16x16xf16>) -> vector<16x16xf16>
      %2 = "xegpu.load_nd"(%arg1) <{const_offsets = array<i64: 0, 0>}> : (!xegpu.tensor_desc<16x16xf16>) -> vector<16x16xf16>
      %3 = "arith.addf"(%1, %2) <{fastmath = #arith.fastmath<none>}> : (vector<16x16xf16>, vector<16x16xf16>) -> vector<16x16xf16>
      %4 = "xegpu.dpas"(%0, %3) : (vector<8x16xf16>, vector<16x16xf16>) -> vector<8x16xf32>
      "xegpu.store_nd"(%4, %arg2) <{const_offsets = array<i64: 0, 0>}> : (vector<8x16xf32>, !xegpu.tensor_desc<8x16xf32>) -> ()
      "func.return"() : () -> ()
    }) : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "gpu.module"() <{sym_name = "test"}> ({
    "func.func"() <{function_type = (!xegpu.tensor_desc<8x16xf16>, !xegpu.tensor_desc<16x16xf16>, !xegpu.tensor_desc<8x16xf32>, !xegpu.tensor_desc<16x16xf16>) -> (), sym_name = "binary_op_multiple_uses"}> ({
    ^bb0(%arg0: !xegpu.tensor_desc<8x16xf16>, %arg1: !xegpu.tensor_desc<16x16xf16>, %arg2: !xegpu.tensor_desc<8x16xf32>, %arg3: !xegpu.tensor_desc<16x16xf16>):
      %0 = "xegpu.load_nd"(%arg0) <{const_offsets = array<i64: 0, 0>}> : (!xegpu.tensor_desc<8x16xf16>) -> vector<8x16xf16>
      %1 = "xegpu.load_nd"(%arg1) <{const_offsets = array<i64: 0, 0>}> : (!xegpu.tensor_desc<16x16xf16>) -> vector<16x16xf16>
      %2 = "arith.constant"() <{value = dense<1.000000e+00> : vector<16x16xf16>}> : () -> vector<16x16xf16>
      %3 = "arith.addf"(%1, %2) <{fastmath = #arith.fastmath<none>}> : (vector<16x16xf16>, vector<16x16xf16>) -> vector<16x16xf16>
      %4 = "xegpu.dpas"(%0, %3) : (vector<8x16xf16>, vector<16x16xf16>) -> vector<8x16xf32>
      "xegpu.store_nd"(%4, %arg2) <{const_offsets = array<i64: 0, 0>}> : (vector<8x16xf32>, !xegpu.tensor_desc<8x16xf32>) -> ()
      "xegpu.store_nd"(%3, %arg3) <{const_offsets = array<i64: 0, 0>}> : (vector<16x16xf16>, !xegpu.tensor_desc<16x16xf16>) -> ()
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
      %3 = "xegpu.create_nd_tdesc"(%arg0) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<8x128xf16>) -> !xegpu.tensor_desc<8x16xf16>
      %4 = "xegpu.create_nd_tdesc"(%arg1) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<128x16xf16>) -> !xegpu.tensor_desc<16x16xf16>
      %5 = "arith.constant"() <{value = dense<0.000000e+00> : vector<8x16xf32>}> : () -> vector<8x16xf32>
      %6 = "scf.for"(%0, %1, %2, %5) ({
      ^bb0(%arg3: index, %arg4: vector<8x16xf32>):
        %8 = "xegpu.load_nd"(%3, %arg3) <{const_offsets = array<i64: 0, -9223372036854775808>}> : (!xegpu.tensor_desc<8x16xf16>, index) -> vector<8x16xf16>
        %9 = "xegpu.load_nd"(%4, %arg3) <{const_offsets = array<i64: -9223372036854775808, 0>}> : (!xegpu.tensor_desc<16x16xf16>, index) -> vector<16x16xf16>
        %10 = "xegpu.dpas"(%8, %9, %arg4) : (vector<8x16xf16>, vector<16x16xf16>, vector<8x16xf32>) -> vector<8x16xf32>
        "scf.yield"(%10) : (vector<8x16xf32>) -> ()
      }) : (index, index, index, vector<8x16xf32>) -> vector<8x16xf32>
      %7 = "xegpu.create_nd_tdesc"(%arg2) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<8x16xf32>) -> !xegpu.tensor_desc<8x16xf32>
      "xegpu.store_nd"(%6, %7) <{const_offsets = array<i64: 0, 0>}> : (vector<8x16xf32>, !xegpu.tensor_desc<8x16xf32>) -> ()
      "func.return"() : () -> ()
    }) : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "gpu.module"() <{sym_name = "test"}> ({
    "func.func"() <{function_type = (!xegpu.tensor_desc<8x16xf16>, !xegpu.tensor_desc<16x16xf16>, i1, !xegpu.tensor_desc<8x16xf32>) -> (), sym_name = "if_single_use"}> ({
    ^bb0(%arg0: !xegpu.tensor_desc<8x16xf16>, %arg1: !xegpu.tensor_desc<16x16xf16>, %arg2: i1, %arg3: !xegpu.tensor_desc<8x16xf32>):
      %0 = "xegpu.load_nd"(%arg0) <{const_offsets = array<i64: 0, 0>}> : (!xegpu.tensor_desc<8x16xf16>) -> vector<8x16xf16>
      %1 = "scf.if"(%arg2) ({
        %4 = "xegpu.load_nd"(%arg1) <{const_offsets = array<i64: 0, 0>}> : (!xegpu.tensor_desc<16x16xf16>) -> vector<16x16xf16>
        "scf.yield"(%4) : (vector<16x16xf16>) -> ()
      }, {
        %3 = "xegpu.load_nd"(%arg1) <{const_offsets = array<i64: 0, 0>}> : (!xegpu.tensor_desc<16x16xf16>) -> vector<16x16xf16>
        "scf.yield"(%3) : (vector<16x16xf16>) -> ()
      }) : (i1) -> vector<16x16xf16>
      %2 = "xegpu.dpas"(%0, %1) : (vector<8x16xf16>, vector<16x16xf16>) -> vector<8x16xf32>
      "xegpu.store_nd"(%2, %arg3) <{const_offsets = array<i64: 0, 0>}> : (vector<8x16xf32>, !xegpu.tensor_desc<8x16xf32>) -> ()
      "func.return"() : () -> ()
    }) : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "gpu.module"() <{sym_name = "test"}> ({
    "func.func"() <{function_type = (!xegpu.tensor_desc<8x16xf16>, !xegpu.tensor_desc<16x16xf16>, i1, !xegpu.tensor_desc<8x16xf32>, !xegpu.tensor_desc<16x16xf16>) -> (), sym_name = "if_multiple_uses"}> ({
    ^bb0(%arg0: !xegpu.tensor_desc<8x16xf16>, %arg1: !xegpu.tensor_desc<16x16xf16>, %arg2: i1, %arg3: !xegpu.tensor_desc<8x16xf32>, %arg4: !xegpu.tensor_desc<16x16xf16>):
      %0 = "xegpu.load_nd"(%arg0) <{const_offsets = array<i64: 0, 0>}> : (!xegpu.tensor_desc<8x16xf16>) -> vector<8x16xf16>
      %1 = "scf.if"(%arg2) ({
        %4 = "xegpu.load_nd"(%arg1) <{const_offsets = array<i64: 0, 0>}> : (!xegpu.tensor_desc<16x16xf16>) -> vector<16x16xf16>
        "scf.yield"(%4) : (vector<16x16xf16>) -> ()
      }, {
        %3 = "xegpu.load_nd"(%arg1) <{const_offsets = array<i64: 0, 0>}> : (!xegpu.tensor_desc<16x16xf16>) -> vector<16x16xf16>
        "scf.yield"(%3) : (vector<16x16xf16>) -> ()
      }) : (i1) -> vector<16x16xf16>
      %2 = "xegpu.dpas"(%0, %1) : (vector<8x16xf16>, vector<16x16xf16>) -> vector<8x16xf32>
      "xegpu.store_nd"(%2, %arg3) <{const_offsets = array<i64: 0, 0>}> : (vector<8x16xf32>, !xegpu.tensor_desc<8x16xf32>) -> ()
      "xegpu.store_nd"(%1, %arg4) <{const_offsets = array<i64: 0, 0>}> : (vector<16x16xf16>, !xegpu.tensor_desc<16x16xf16>) -> ()
      "func.return"() : () -> ()
    }) : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "gpu.module"() <{sym_name = "test"}> ({
    "func.func"() <{function_type = (vector<16x16xf32>, memref<256xf32>) -> (), sym_name = "vector_outer_reduction"}> ({
    ^bb0(%arg0: vector<16x16xf32>, %arg1: memref<256xf32>):
      %0 = "arith.constant"() <{value = dense<0.000000e+00> : vector<16xf32>}> : () -> vector<16xf32>
      %1 = "arith.constant"() <{value = dense<true> : vector<16xi1>}> : () -> vector<16xi1>
      %2 = "vector.step"() : () -> vector<16xindex>
      %3 = "vector.multi_reduction"(%arg0, %0) <{kind = #vector.kind<add>, reduction_dims = array<i64: 0>}> : (vector<16x16xf32>, vector<16xf32>) -> vector<16xf32>
      "xegpu.store"(%3, %arg1, %2, %1) : (vector<16xf32>, memref<256xf32>, vector<16xindex>, vector<16xi1>) -> ()
      "func.return"() : () -> ()
    }) : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "gpu.module"() <{sym_name = "test"}> ({
    "func.func"() <{function_type = (vector<16x16xf32>, memref<256xf32>) -> (), sym_name = "vector_inner_reduction"}> ({
    ^bb0(%arg0: vector<16x16xf32>, %arg1: memref<256xf32>):
      %0 = "arith.constant"() <{value = dense<0.000000e+00> : vector<16xf32>}> : () -> vector<16xf32>
      %1 = "arith.constant"() <{value = dense<true> : vector<16xi1>}> : () -> vector<16xi1>
      %2 = "vector.step"() : () -> vector<16xindex>
      %3 = "vector.multi_reduction"(%arg0, %0) <{kind = #vector.kind<add>, reduction_dims = array<i64: 1>}> : (vector<16x16xf32>, vector<16xf32>) -> vector<16xf32>
      "xegpu.store"(%3, %arg1, %2, %1) : (vector<16xf32>, memref<256xf32>, vector<16xindex>, vector<16xi1>) -> ()
      "func.return"() : () -> ()
    }) : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "gpu.module"() <{sym_name = "test"}> ({
    "func.func"() <{function_type = (memref<256xf32>) -> (), sym_name = "store_with_offset"}> ({
    ^bb0(%arg0: memref<256xf32>):
      %0 = "arith.constant"() <{value = 32 : index}> : () -> index
      %1 = "arith.constant"() <{value = dense<true> : vector<16xi1>}> : () -> vector<16xi1>
      %2 = "vector.step"() : () -> vector<16xindex>
      %3 = "arith.constant"() <{value = dense<1.000000e+00> : vector<16xf32>}> : () -> vector<16xf32>
      "xegpu.store"(%3, %arg0, %2, %1) : (vector<16xf32>, memref<256xf32>, vector<16xindex>, vector<16xi1>) -> ()
      "func.return"() : () -> ()
    }) : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "gpu.module"() <{sym_name = "test"}> ({
    "func.func"() <{function_type = (memref<256x256xf32>) -> (), sym_name = "store_nd_with_offset_2d"}> ({
    ^bb0(%arg0: memref<256x256xf32>):
      %0 = "arith.constant"() <{value = 32 : index}> : () -> index
      %1 = "arith.constant"() <{value = dense<1.000000e+00> : vector<16x16xf32>}> : () -> vector<16x16xf32>
      %2 = "xegpu.create_nd_tdesc"(%arg0) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<256x256xf32>) -> !xegpu.tensor_desc<16x16xf32>
      "xegpu.store_nd"(%1, %2, %0, %0) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>}> : (vector<16x16xf32>, !xegpu.tensor_desc<16x16xf32>, index, index) -> ()
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
      %1 = "xegpu.create_nd_tdesc"(%arg0) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<256x256xf16>) -> !xegpu.tensor_desc<16x16xf16>
      "xegpu.prefetch_nd"(%1) <{const_offsets = array<i64: 0, 0>, l1_hint = #xegpu.cache_hint<cached>, l2_hint = #xegpu.cache_hint<uncached>}> : (!xegpu.tensor_desc<16x16xf16>) -> ()
      "func.return"() : () -> ()
    }) : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "gpu.module"() <{sym_name = "test"}> ({
    "func.func"() <{function_type = (memref<256xf16>) -> (), sym_name = "prefetch_1d"}> ({
    ^bb0(%arg0: memref<256xf16>):
      %0 = "vector.step"() : () -> vector<16xindex>
      "xegpu.prefetch"(%arg0, %0) <{l1_hint = #xegpu.cache_hint<cached>, l2_hint = #xegpu.cache_hint<uncached>, layout = #xegpu.layout<lane_layout = [16], lane_data = [1]>}> : (memref<256xf16>, vector<16xindex>) -> ()
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
      %2 = "arith.constant"() <{value = 16 : index}> : () -> index
      %3 = "arith.constant"() <{value = 256 : i32}> : () -> i32
      %4 = "arith.constant"() <{value = dense<true> : vector<16xi1>}> : () -> vector<16xi1>
      %5 = "vector.step"() : () -> vector<16xindex>
      %6 = "xegpu.load"(%arg0, %5, %4) : (memref<256xf32>, vector<16xindex>, vector<16xi1>) -> vector<16xf32>
      %7:2 = "scf.while"(%6, %0) ({
      ^bb0(%arg4: vector<16xf32>, %arg5: i32):
        %12 = "arith.cmpi"(%arg5, %3) <{predicate = 2 : i64}> : (i32, i32) -> i1
        "scf.condition"(%12, %arg4, %arg5) : (i1, vector<16xf32>, i32) -> ()
      }, {
      ^bb0(%arg2: vector<16xf32>, %arg3: i32):
        "xegpu.store"(%arg2, %arg1, %5, %4) : (vector<16xf32>, memref<256xf32>, vector<16xindex>, vector<16xi1>) -> ()
        %8 = "arith.addi"(%arg3, %1) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
        %9 = "arith.index_cast"(%8) : (i32) -> index
        %10 = "vector.broadcast"(%9) : (index) -> vector<16xindex>
        %11 = "xegpu.load"(%arg0, %5, %4) : (memref<256xf32>, vector<16xindex>, vector<16xi1>) -> vector<16xf32>
        "scf.yield"(%11, %8) : (vector<16xf32>, i32) -> ()
      }) : (vector<16xf32>, i32) -> (vector<16xf32>, i32)
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
      %2 = "xegpu.load_nd"(%arg0) <{const_offsets = array<i64: 0, 0>}> : (!xegpu.tensor_desc<16x16xf16>) -> vector<16x16xf16>
      %3 = "vector.multi_reduction"(%2, %1) <{kind = #vector.kind<add>, reduction_dims = array<i64: 0>}> : (vector<16x16xf16>, vector<16xf16>) -> vector<16xf16>
      %4 = "vector.shape_cast"(%3) : (vector<16xf16>) -> vector<1x16xf16>
      %5 = "vector.broadcast"(%4) : (vector<1x16xf16>) -> vector<16x16xf16>
      "xegpu.store_nd"(%5, %arg1) <{const_offsets = array<i64: 0, 0>}> : (vector<16x16xf16>, !xegpu.tensor_desc<16x16xf16>) -> ()
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
      %2 = "xegpu.load_nd"(%arg0) <{const_offsets = array<i64: 0, 0>}> : (!xegpu.tensor_desc<16x16xf16>) -> vector<16x16xf16>
      %3 = "vector.multi_reduction"(%2, %1) <{kind = #vector.kind<add>, reduction_dims = array<i64: 1>}> : (vector<16x16xf16>, vector<16xf16>) -> vector<16xf16>
      %4 = "vector.shape_cast"(%3) : (vector<16xf16>) -> vector<16x1xf16>
      %5 = "vector.broadcast"(%4) : (vector<16x1xf16>) -> vector<16x16xf16>
      "xegpu.store_nd"(%5, %arg1) <{const_offsets = array<i64: 0, 0>}> : (vector<16x16xf16>, !xegpu.tensor_desc<16x16xf16>) -> ()
      "func.return"() : () -> ()
    }) : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "gpu.module"() <{sym_name = "test"}> ({
    "gpu.func"() <{function_type = (memref<32x2x192xf32>, memref<32x2x192xf32>, memref<32x2x192xf32>) -> (), kernel, known_block_size = array<i32: 768, 1, 1>, known_grid_size = array<i32: 16, 1, 1>}> ({
    ^bb0(%arg0: memref<32x2x192xf32>, %arg1: memref<32x2x192xf32>, %arg2: memref<32x2x192xf32>):
      %0 = "arith.constant"() <{value = dense<1.000000e+00> : vector<1x1x1x16xf32>}> : () -> vector<1x1x1x16xf32>
      %1 = "arith.constant"() <{value = dense<true> : vector<1x1x1x16xi1>}> : () -> vector<1x1x1x16xi1>
      %2 = "arith.constant"() <{value = 6 : index}> : () -> index
      %3 = "memref.extract_aligned_pointer_as_index"(%arg2) : (memref<32x2x192xf32>) -> index
      %4 = "arith.index_cast"(%3) : (index) -> i64
      %5 = "gpu.subgroup_id"() : () -> index
      %6 = "arith.remui"(%5, %2) : (index, index) -> index
      %7 = "arith.remui"(%6, %2) : (index, index) -> index
      %8 = "vector.step"() : () -> vector<1xindex>
      %9 = "vector.broadcast"(%7) : (index) -> vector<1xindex>
      %10 = "arith.addi"(%8, %9) <{overflowFlags = #arith.overflow<none>}> : (vector<1xindex>, vector<1xindex>) -> vector<1xindex>
      %11 = "vector.broadcast"(%10) : (vector<1xindex>) -> vector<1x1x1x16xindex>
      "xegpu.store"(%0, %4, %11, %1) <{chunk_size = 1 : i64}> : (vector<1x1x1x16xf32>, i64, vector<1x1x1x16xindex>, vector<1x1x1x16xi1>) -> ()
      "xegpu.store"(%0, %4, %11, %1) <{chunk_size = 1 : i64}> : (vector<1x1x1x16xf32>, i64, vector<1x1x1x16xindex>, vector<1x1x1x16xi1>) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "broadcast_both_leadingdims_innerdims"} : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "gpu.module"() <{sym_name = "test"}> ({
    "func.func"() <{function_type = (memref<128xf16>, memref<16xf16>) -> (), sym_name = "vector_shape_cast_expand_non_unit_dims"}> ({
    ^bb0(%arg0: memref<128xf16>, %arg1: memref<16xf16>):
      %0 = "arith.constant"() <{value = dense<true> : vector<128xi1>}> : () -> vector<128xi1>
      %1 = "vector.step"() : () -> vector<128xindex>
      %2 = "xegpu.load"(%arg0, %1, %0) : (memref<128xf16>, vector<128xindex>, vector<128xi1>) -> vector<128xf16>
      %3 = "vector.shape_cast"(%2) : (vector<128xf16>) -> vector<1x8x16xf16>
      %4 = "arith.constant"() <{value = dense<0.000000e+00> : vector<8x16xf16>}> : () -> vector<8x16xf16>
      %5 = "arith.constant"() <{value = dense<0.000000e+00> : vector<16xf16>}> : () -> vector<16xf16>
      %6 = "vector.multi_reduction"(%3, %4) <{kind = #vector.kind<add>, reduction_dims = array<i64: 0>}> : (vector<1x8x16xf16>, vector<8x16xf16>) -> vector<8x16xf16>
      %7 = "vector.multi_reduction"(%6, %5) <{kind = #vector.kind<add>, reduction_dims = array<i64: 0>}> : (vector<8x16xf16>, vector<16xf16>) -> vector<16xf16>
      %8 = "arith.constant"() <{value = dense<true> : vector<16xi1>}> : () -> vector<16xi1>
      %9 = "arith.constant"() <{value = dense<1> : vector<16xindex>}> : () -> vector<16xindex>
      "xegpu.store"(%7, %arg1, %9, %8) <{layout = #xegpu.layout<lane_layout = [16], lane_data = [1]>}> : (vector<16xf16>, memref<16xf16>, vector<16xindex>, vector<16xi1>) -> ()
      "func.return"() : () -> ()
    }) : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "gpu.module"() <{sym_name = "test"}> ({
    "func.func"() <{function_type = (memref<1024xf16>, memref<16xf16>) -> (), sym_name = "vector_2d_reduction_with_fractional_subgroup_size"}> ({
    ^bb0(%arg0: memref<1024xf16>, %arg1: memref<16xf16>):
      %0 = "arith.constant"() <{value = dense<true> : vector<1xi1>}> : () -> vector<1xi1>
      %1 = "vector.step"() : () -> vector<1xindex>
      %2 = "xegpu.load"(%arg0, %1, %0) : (memref<1024xf16>, vector<1xindex>, vector<1xi1>) -> vector<1xf16>
      %3 = "vector.shape_cast"(%2) : (vector<1xf16>) -> vector<1x1x1xf16>
      %4 = "arith.constant"() <{value = dense<0.000000e+00> : vector<1xf16>}> : () -> vector<1xf16>
      %5 = "vector.multi_reduction"(%3, %4) <{kind = #vector.kind<add>, reduction_dims = array<i64: 1, 2>}> : (vector<1x1x1xf16>, vector<1xf16>) -> vector<1xf16>
      %6 = "arith.constant"() <{value = dense<true> : vector<1xi1>}> : () -> vector<1xi1>
      %7 = "arith.constant"() <{value = dense<1> : vector<1xindex>}> : () -> vector<1xindex>
      "xegpu.store"(%5, %arg1, %7, %6) : (vector<1xf16>, memref<16xf16>, vector<1xindex>, vector<1xi1>) -> ()
      "func.return"() : () -> ()
    }) : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "gpu.module"() <{sym_name = "test"}> ({
    "func.func"() <{function_type = (memref<1024xf16>, memref<16xf16>) -> (), sym_name = "vector_2d_reduction_scalar"}> ({
    ^bb0(%arg0: memref<1024xf16>, %arg1: memref<16xf16>):
      %0 = "arith.constant"() <{value = dense<true> : vector<1xi1>}> : () -> vector<1xi1>
      %1 = "vector.step"() : () -> vector<1xindex>
      %2 = "xegpu.load"(%arg0, %1, %0) : (memref<1024xf16>, vector<1xindex>, vector<1xi1>) -> vector<1xf16>
      %3 = "vector.shape_cast"(%2) : (vector<1xf16>) -> vector<1x1x1xf16>
      %4 = "arith.constant"() <{value = 0.000000e+00 : f16}> : () -> f16
      %5 = "vector.multi_reduction"(%3, %4) <{kind = #vector.kind<add>, reduction_dims = array<i64: 0, 1, 2>}> : (vector<1x1x1xf16>, f16) -> f16
      %6 = "arith.constant"() <{value = true}> : () -> i1
      %7 = "arith.constant"() <{value = 1 : index}> : () -> index
      "xegpu.store"(%5, %arg1, %7, %6) : (f16, memref<16xf16>, index, i1) -> ()
      "func.return"() : () -> ()
    }) : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "gpu.module"() <{sym_name = "test"}> ({
    "func.func"() <{function_type = (memref<1024xf16>, memref<16xf16>) -> (), sym_name = "vector_reduction_scalar"}> ({
    ^bb0(%arg0: memref<1024xf16>, %arg1: memref<16xf16>):
      %0 = "arith.constant"() <{value = dense<true> : vector<16xi1>}> : () -> vector<16xi1>
      %1 = "vector.step"() : () -> vector<16xindex>
      %2 = "xegpu.load"(%arg0, %1, %0) : (memref<1024xf16>, vector<16xindex>, vector<16xi1>) -> vector<16xf16>
      %3 = "vector.reduction"(%2) <{fastmath = #arith.fastmath<none>, kind = #vector.kind<add>}> : (vector<16xf16>) -> f16
      %4 = "arith.constant"() <{value = true}> : () -> i1
      %5 = "arith.constant"() <{value = 1 : index}> : () -> index
      "xegpu.store"(%3, %arg1, %5, %4) : (f16, memref<16xf16>, index, i1) -> ()
      "func.return"() : () -> ()
    }) : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "gpu.module"() <{sym_name = "test"}> ({
    "func.func"() <{function_type = (memref<1024xf16>, memref<16xf16>) -> (), sym_name = "vector_2d_reduction_with_fractional_subgroup_size_1x4"}> ({
    ^bb0(%arg0: memref<1024xf16>, %arg1: memref<16xf16>):
      %0 = "arith.constant"() <{value = dense<true> : vector<4xi1>}> : () -> vector<4xi1>
      %1 = "vector.step"() : () -> vector<4xindex>
      %2 = "xegpu.load"(%arg0, %1, %0) : (memref<1024xf16>, vector<4xindex>, vector<4xi1>) -> vector<4xf16>
      %3 = "vector.shape_cast"(%2) : (vector<4xf16>) -> vector<1x4xf16>
      %4 = "arith.constant"() <{value = dense<0.000000e+00> : vector<1xf16>}> : () -> vector<1xf16>
      %5 = "vector.multi_reduction"(%3, %4) <{kind = #vector.kind<add>, reduction_dims = array<i64: 1, 2>}> : (vector<1x4xf16>, vector<1xf16>) -> vector<1xf16>
      %6 = "arith.constant"() <{value = dense<true> : vector<1xi1>}> : () -> vector<1xi1>
      %7 = "arith.constant"() <{value = dense<1> : vector<1xindex>}> : () -> vector<1xindex>
      "xegpu.store"(%5, %arg1, %7, %6) : (vector<1xf16>, memref<16xf16>, vector<1xindex>, vector<1xi1>) -> ()
      "func.return"() : () -> ()
    }) : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "gpu.module"() <{sym_name = "test"}> ({
    "func.func"() <{function_type = (memref<1024x64xf32>, memref<1024x64xf32>) -> (), sym_name = "vector_reduction_broadcast_transpose"}> ({
    ^bb0(%arg0: memref<1024x64xf32>, %arg1: memref<1024x64xf32>):
      %0 = "arith.constant"() <{value = dense<0.000000e+00> : vector<1xf32>}> : () -> vector<1xf32>
      %1 = "arith.constant"() <{value = dense<0xFF800000> : vector<1x16xf32>}> : () -> vector<1x16xf32>
      %2 = "arith.constant"() <{value = dense<0.000000e+00> : vector<8xf32>}> : () -> vector<8xf32>
      %3 = "arith.constant"() <{value = 0 : index}> : () -> index
      %4 = "vector.multi_reduction"(%1, %0) <{kind = #vector.kind<add>, reduction_dims = array<i64: 1>}> : (vector<1x16xf32>, vector<1xf32>) -> vector<1xf32>
      %5 = "vector.insert_strided_slice"(%4, %2) <{offsets = [0], strides = [1]}> : (vector<1xf32>, vector<8xf32>) -> vector<8xf32>
      %6 = "arith.addf"(%5, %2) <{fastmath = #arith.fastmath<none>}> : (vector<8xf32>, vector<8xf32>) -> vector<8xf32>
      %7 = "vector.broadcast"(%6) : (vector<8xf32>) -> vector<16x8xf32>
      %8 = "vector.transpose"(%7) <{permutation = array<i64: 1, 0>}> : (vector<16x8xf32>) -> vector<8x16xf32>
      %9 = "xegpu.create_nd_tdesc"(%arg1) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<1024x64xf32>) -> !xegpu.tensor_desc<8x16xf32, #xegpu.block_tdesc_attr<boundary_check = false>>
      "xegpu.store_nd"(%8, %9, %3, %3) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>}> : (vector<8x16xf32>, !xegpu.tensor_desc<8x16xf32, #xegpu.block_tdesc_attr<boundary_check = false>>, index, index) -> ()
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
      "xegpu.store"(%5, %arg1, %1, %0) <{layout = #xegpu.layout<lane_layout = [16], lane_data = [2]>}> : (vector<256xf16>, memref<256xf16>, vector<256xindex>, vector<256xi1>) -> ()
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
      %2 = "xegpu.load_nd"(%arg0) <{const_offsets = array<i64: 0, 0>}> : (!xegpu.tensor_desc<16x16xf16>) -> vector<16x16xf16>
      %3 = "vector.multi_reduction"(%2, %1) <{kind = #vector.kind<add>, reduction_dims = array<i64: 0>}> : (vector<16x16xf16>, vector<16xf16>) -> vector<16xf16>
      %4 = "vector.broadcast"(%3) : (vector<16xf16>) -> vector<16x16xf16>
      "xegpu.store_nd"(%4, %arg1) <{const_offsets = array<i64: 0, 0>}> : (vector<16x16xf16>, !xegpu.tensor_desc<16x16xf16>) -> ()
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
      %2 = "xegpu.load_nd"(%arg0) <{const_offsets = array<i64: 0, 0>}> : (!xegpu.tensor_desc<16x16xf16>) -> vector<16x16xf16>
      %3 = "vector.multi_reduction"(%2, %1) <{kind = #vector.kind<add>, reduction_dims = array<i64: 1>}> : (vector<16x16xf16>, vector<16xf16>) -> vector<16xf16>
      %4 = "vector.shape_cast"(%3) : (vector<16xf16>) -> vector<16x1xf16>
      %5 = "math.exp"(%4) <{fastmath = #arith.fastmath<none>}> : (vector<16x1xf16>) -> vector<16x1xf16>
      %6 = "vector.broadcast"(%5) : (vector<16x1xf16>) -> vector<16x16xf16>
      "xegpu.store_nd"(%6, %arg1) <{const_offsets = array<i64: 0, 0>}> : (vector<16x16xf16>, !xegpu.tensor_desc<16x16xf16>) -> ()
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
      "xegpu.store_nd"(%1, %arg0) <{const_offsets = array<i64: 0, 0>}> : (vector<16x16xf16>, !xegpu.tensor_desc<16x16xf16>) -> ()
      "func.return"() : () -> ()
    }) : () -> ()
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
    "func.func"() <{function_type = (memref<4x64xf32>) -> (), sym_name = "insert_strided_slice_lane_layout_no_packing"}> ({
    ^bb0(%arg0: memref<4x64xf32>):
      %0 = "arith.constant"() <{value = 0 : index}> : () -> index
      %1 = "arith.constant"() <{value = dense<1.000000e+00> : vector<2x32xf32>}> : () -> vector<2x32xf32>
      %2 = "arith.constant"() <{value = dense<0.000000e+00> : vector<4x64xf32>}> : () -> vector<4x64xf32>
      %3 = "vector.insert_strided_slice"(%1, %2) <{offsets = [0, 0], strides = [1, 1]}> : (vector<2x32xf32>, vector<4x64xf32>) -> vector<4x64xf32>
      %4 = "xegpu.create_nd_tdesc"(%arg0) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<4x64xf32>) -> !xegpu.tensor_desc<4x64xf32>
      "xegpu.store_nd"(%3, %4) <{const_offsets = array<i64: 0, 0>}> : (vector<4x64xf32>, !xegpu.tensor_desc<4x64xf32>) -> ()
      "func.return"() : () -> ()
    }) : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "gpu.module"() <{sym_name = "test"}> ({
    "func.func"() <{function_type = (memref<4x64xf16>) -> (), sym_name = "insert_strided_slice_lane_layout_with_packing"}> ({
    ^bb0(%arg0: memref<4x64xf16>):
      %0 = "arith.constant"() <{value = 0 : index}> : () -> index
      %1 = "arith.constant"() <{value = dense<1.000000e+00> : vector<2x32xf16>}> : () -> vector<2x32xf16>
      %2 = "arith.constant"() <{value = dense<0.000000e+00> : vector<4x64xf16>}> : () -> vector<4x64xf16>
      %3 = "vector.insert_strided_slice"(%1, %2) <{offsets = [0, 0], strides = [1, 1]}> : (vector<2x32xf16>, vector<4x64xf16>) -> vector<4x64xf16>
      %4 = "xegpu.create_nd_tdesc"(%arg0) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<4x64xf16>) -> !xegpu.tensor_desc<4x64xf16, #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 2]>>
      "xegpu.store_nd"(%3, %4) <{const_offsets = array<i64: 0, 0>, layout = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 2]>}> : (vector<4x64xf16>, !xegpu.tensor_desc<4x64xf16, #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 2]>>) -> ()
      "func.return"() : () -> ()
    }) : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "gpu.module"() <{sym_name = "test"}> ({
    "func.func"() <{function_type = (memref<8x16xf32>) -> (), sym_name = "insert_strided_slice_with_slice_layout"}> ({
    ^bb0(%arg0: memref<8x16xf32>):
      %0 = "arith.constant"() <{value = 0 : index}> : () -> index
      %1 = "arith.constant"() <{value = dense<1.000000e+00> : vector<1xf32>}> : () -> vector<1xf32>
      %2 = "arith.constant"() <{value = dense<1.000000e+00> : vector<16xf32>}> : () -> vector<16xf32>
      %3 = "vector.insert_strided_slice"(%1, %2) <{offsets = [15], strides = [1]}> : (vector<1xf32>, vector<16xf32>) -> vector<16xf32>
      %4 = "vector.extract_strided_slice"(%3) <{offsets = [0], sizes = [8], strides = [1]}> : (vector<16xf32>) -> vector<8xf32>
      %5 = "vector.broadcast"(%4) : (vector<8xf32>) -> vector<16x8xf32>
      %6 = "vector.transpose"(%5) <{permutation = array<i64: 1, 0>}> : (vector<16x8xf32>) -> vector<8x16xf32>
      %7 = "xegpu.create_nd_tdesc"(%arg0) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<8x16xf32>) -> !xegpu.tensor_desc<8x16xf32>
      "xegpu.store_nd"(%6, %7) <{const_offsets = array<i64: 0, 0>, layout = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>}> : (vector<8x16xf32>, !xegpu.tensor_desc<8x16xf32>) -> ()
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
    "func.func"() <{function_type = (memref<8x64xf4E2M1FN>, memref<64x16xf4E2M1FN>, memref<8x16xbf16>, memref<8x2xf8E8M0FNU>, memref<2x16xf8E8M0FNU>) -> (), sym_name = "dpas_mx_fp4"}> ({
    ^bb0(%arg0: memref<8x64xf4E2M1FN>, %arg1: memref<64x16xf4E2M1FN>, %arg2: memref<8x16xbf16>, %arg3: memref<8x2xf8E8M0FNU>, %arg4: memref<2x16xf8E8M0FNU>):
      %0 = "arith.constant"() <{value = 0 : index}> : () -> index
      %1 = "arith.constant"() <{value = dense<0.000000e+00> : vector<8x16xbf16>}> : () -> vector<8x16xbf16>
      %2 = "xegpu.create_nd_tdesc"(%arg0) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<8x64xf4E2M1FN>) -> !xegpu.tensor_desc<8x64xf4E2M1FN>
      %3 = "xegpu.create_nd_tdesc"(%arg1) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<64x16xf4E2M1FN>) -> !xegpu.tensor_desc<64x16xf4E2M1FN>
      %4 = "xegpu.load_nd"(%2) <{const_offsets = array<i64: 0, 0>}> : (!xegpu.tensor_desc<8x64xf4E2M1FN>) -> vector<8x64xf4E2M1FN>
      %5 = "xegpu.load_nd"(%3) <{const_offsets = array<i64: 0, 0>}> : (!xegpu.tensor_desc<64x16xf4E2M1FN>) -> vector<64x16xf4E2M1FN>
      %6 = "xegpu.create_nd_tdesc"(%arg3) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<8x2xf8E8M0FNU>) -> !xegpu.tensor_desc<8x2xf8E8M0FNU>
      %7 = "xegpu.load_nd"(%6) <{const_offsets = array<i64: 0, 0>}> : (!xegpu.tensor_desc<8x2xf8E8M0FNU>) -> vector<8x2xf8E8M0FNU>
      %8 = "xegpu.create_nd_tdesc"(%arg4) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<2x16xf8E8M0FNU>) -> !xegpu.tensor_desc<2x16xf8E8M0FNU>
      %9 = "xegpu.load_nd"(%8) <{const_offsets = array<i64: 0, 0>}> : (!xegpu.tensor_desc<2x16xf8E8M0FNU>) -> vector<2x16xf8E8M0FNU>
      %10 = "xegpu.dpas_mx"(%4, %5, %1, %7, %9) <{operandSegmentSizes = array<i32: 1, 1, 1, 1, 1>}> : (vector<8x64xf4E2M1FN>, vector<64x16xf4E2M1FN>, vector<8x16xbf16>, vector<8x2xf8E8M0FNU>, vector<2x16xf8E8M0FNU>) -> vector<8x16xbf16>
      %11 = "xegpu.create_nd_tdesc"(%arg2) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<8x16xbf16>) -> !xegpu.tensor_desc<8x16xbf16>
      "xegpu.store_nd"(%10, %11) <{const_offsets = array<i64: 0, 0>}> : (vector<8x16xbf16>, !xegpu.tensor_desc<8x16xbf16>) -> ()
      "func.return"() : () -> ()
    }) : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "gpu.module"() <{sym_name = "test"}> ({
    "func.func"() <{function_type = (memref<8x64xf4E2M1FN>, memref<64x16xf4E2M1FN>, memref<8x16xbf16>, memref<8x2xf8E8M0FNU>, memref<2x16xf8E8M0FNU>) -> (), sym_name = "dpas_mx_fp4"}> ({
    ^bb0(%arg0: memref<8x64xf4E2M1FN>, %arg1: memref<64x16xf4E2M1FN>, %arg2: memref<8x16xbf16>, %arg3: memref<8x2xf8E8M0FNU>, %arg4: memref<2x16xf8E8M0FNU>):
      %0 = "arith.constant"() <{value = 0 : index}> : () -> index
      %1 = "arith.constant"() <{value = dense<0.000000e+00> : vector<8x16xbf16>}> : () -> vector<8x16xbf16>
      %2 = "xegpu.create_nd_tdesc"(%arg0) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<8x64xf4E2M1FN>) -> !xegpu.tensor_desc<8x64xf4E2M1FN>
      %3 = "xegpu.create_nd_tdesc"(%arg1) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<64x16xf4E2M1FN>) -> !xegpu.tensor_desc<64x16xf4E2M1FN>
      %4 = "xegpu.load_nd"(%2) <{const_offsets = array<i64: 0, 0>}> : (!xegpu.tensor_desc<8x64xf4E2M1FN>) -> vector<8x64xf4E2M1FN>
      %5 = "xegpu.load_nd"(%3) <{const_offsets = array<i64: 0, 0>}> : (!xegpu.tensor_desc<64x16xf4E2M1FN>) -> vector<64x16xf4E2M1FN>
      %6 = "xegpu.create_nd_tdesc"(%arg3) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<8x2xf8E8M0FNU>) -> !xegpu.tensor_desc<8x2xf8E8M0FNU>
      %7 = "xegpu.load_nd"(%6) <{const_offsets = array<i64: 0, 0>}> : (!xegpu.tensor_desc<8x2xf8E8M0FNU>) -> vector<8x2xf8E8M0FNU>
      %8 = "xegpu.create_nd_tdesc"(%arg4) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<2x16xf8E8M0FNU>) -> !xegpu.tensor_desc<2x16xf8E8M0FNU>
      %9 = "xegpu.load_nd"(%8) <{const_offsets = array<i64: 0, 0>}> : (!xegpu.tensor_desc<2x16xf8E8M0FNU>) -> vector<2x16xf8E8M0FNU>
      %10 = "xegpu.dpas_mx"(%4, %5, %1, %7, %9) <{operandSegmentSizes = array<i32: 1, 1, 1, 1, 1>}> : (vector<8x64xf4E2M1FN>, vector<64x16xf4E2M1FN>, vector<8x16xbf16>, vector<8x2xf8E8M0FNU>, vector<2x16xf8E8M0FNU>) -> vector<8x16xbf16>
      %11 = "xegpu.create_nd_tdesc"(%arg2) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<8x16xbf16>) -> !xegpu.tensor_desc<8x16xbf16>
      "xegpu.store_nd"(%10, %11) <{const_offsets = array<i64: 0, 0>}> : (vector<8x16xbf16>, !xegpu.tensor_desc<8x16xbf16>) -> ()
      "func.return"() : () -> ()
    }) : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "gpu.module"() <{sym_name = "test"}> ({
    "func.func"() <{function_type = (memref<8x16xf16>, memref<8x16xf16>, memref<8x32xf16>) -> (), sym_name = "vector_interleave_f16"}> ({
    ^bb0(%arg0: memref<8x16xf16>, %arg1: memref<8x16xf16>, %arg2: memref<8x32xf16>):
      %0 = "arith.constant"() <{value = 0 : index}> : () -> index
      %1 = "xegpu.create_nd_tdesc"(%arg0) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<8x16xf16>) -> !xegpu.tensor_desc<8x16xf16>
      %2 = "xegpu.create_nd_tdesc"(%arg1) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<8x16xf16>) -> !xegpu.tensor_desc<8x16xf16>
      %3 = "xegpu.load_nd"(%1) <{const_offsets = array<i64: 0, 0>}> : (!xegpu.tensor_desc<8x16xf16>) -> vector<8x16xf16>
      %4 = "xegpu.load_nd"(%2) <{const_offsets = array<i64: 0, 0>}> : (!xegpu.tensor_desc<8x16xf16>) -> vector<8x16xf16>
      %5 = "vector.interleave"(%3, %4) : (vector<8x16xf16>, vector<8x16xf16>) -> vector<8x32xf16>
      %6 = "xegpu.create_nd_tdesc"(%arg2) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<8x32xf16>) -> !xegpu.tensor_desc<8x32xf16>
      "xegpu.store_nd"(%5, %6) <{const_offsets = array<i64: 0, 0>}> : (vector<8x32xf16>, !xegpu.tensor_desc<8x32xf16>) -> ()
      "func.return"() : () -> ()
    }) : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "gpu.module"() <{sym_name = "test"}> ({
    "func.func"() <{function_type = (memref<8x32xf16>, memref<8x16xf16>, memref<8x16xf16>) -> (), sym_name = "vector_deinterleave_f16"}> ({
    ^bb0(%arg0: memref<8x32xf16>, %arg1: memref<8x16xf16>, %arg2: memref<8x16xf16>):
      %0 = "arith.constant"() <{value = 0 : index}> : () -> index
      %1 = "xegpu.create_nd_tdesc"(%arg0) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<8x32xf16>) -> !xegpu.tensor_desc<8x32xf16>
      %2 = "xegpu.load_nd"(%1) <{const_offsets = array<i64: 0, 0>}> : (!xegpu.tensor_desc<8x32xf16>) -> vector<8x32xf16>
      %3:2 = "vector.deinterleave"(%2) : (vector<8x32xf16>) -> (vector<8x16xf16>, vector<8x16xf16>)
      %4 = "xegpu.create_nd_tdesc"(%arg1) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<8x16xf16>) -> !xegpu.tensor_desc<8x16xf16>
      %5 = "xegpu.create_nd_tdesc"(%arg2) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<8x16xf16>) -> !xegpu.tensor_desc<8x16xf16>
      "xegpu.store_nd"(%3#0, %4) <{const_offsets = array<i64: 0, 0>}> : (vector<8x16xf16>, !xegpu.tensor_desc<8x16xf16>) -> ()
      "xegpu.store_nd"(%3#1, %5) <{const_offsets = array<i64: 0, 0>}> : (vector<8x16xf16>, !xegpu.tensor_desc<8x16xf16>) -> ()
      "func.return"() : () -> ()
    }) : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "gpu.module"() <{sym_name = "test"}> ({
    "func.func"() <{function_type = (!xegpu.mem_desc<16x4xbf16>) -> (), sym_name = "broadcast_slice_expanded_dim"}> ({
    ^bb0(%arg0: !xegpu.mem_desc<16x4xbf16>):
      %0 = "arith.constant"() <{value = dense<5.000000e-01> : vector<16x4xf4E2M1FN>}> : () -> vector<16x4xf4E2M1FN>
      %1 = "arith.constant"() <{value = dense<1.000000e+00> : vector<1x4xf8E8M0FNU>}> : () -> vector<1x4xf8E8M0FNU>
      %2 = "vector.broadcast"(%1) : (vector<1x4xf8E8M0FNU>) -> vector<1x16x4xf8E8M0FNU>
      %3 = "vector.shape_cast"(%2) : (vector<1x16x4xf8E8M0FNU>) -> vector<16x4xf8E8M0FNU>
      %4 = "arith.scaling_extf"(%0, %3) {layout_result_0 = #xegpu.layout<lane_layout = [8, 4], lane_data = [2, 1], order = [0, 1]>} : (vector<16x4xf4E2M1FN>, vector<16x4xf8E8M0FNU>) -> vector<16x4xbf16>
      "xegpu.store_matrix"(%4, %arg0) <{const_offsets = array<i64: 0, 0>, layout = #xegpu.layout<lane_layout = [8, 4], lane_data = [2, 1], order = [0, 1]>}> : (vector<16x4xbf16>, !xegpu.mem_desc<16x4xbf16>) -> ()
      "func.return"() : () -> ()
    }) : () -> ()
  }) : () -> ()
}) : () -> ()

