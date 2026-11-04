"builtin.module"() ({
  "func.func"() <{function_type = (vector<2x8x4xf32>, vector<4xf32>) -> vector<2x8x4xf32>, sym_name = "test_vector_insert_2d_idx"}> ({
  ^bb0(%arg0: vector<2x8x4xf32>, %arg1: vector<4xf32>):
    %0 = "vector.insert"(%arg1, %arg0) <{static_position = array<i64: 0, 3>}> : (vector<4xf32>, vector<2x8x4xf32>) -> vector<2x8x4xf32>
    "func.return"(%0) : (vector<2x8x4xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<2x8xf32>) -> vector<8x2xf32>, sym_name = "test_vector_transpose"}> ({
  ^bb0(%arg0: vector<2x8xf32>):
    %0 = "vector.transpose"(%arg0) <{permutation = array<i64: 1, 0>}> : (vector<2x8xf32>) -> vector<8x2xf32>
    "func.return"(%0) : (vector<8x2xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<16x16xf32>) -> vector<16x16xf32>, sym_name = "test_vector_transpose_16x16"}> ({
  ^bb0(%arg0: vector<16x16xf32>):
    %0 = "vector.transpose"(%arg0) <{permutation = array<i64: 1, 0>}> : (vector<16x16xf32>) -> vector<16x16xf32>
    "func.return"(%0) : (vector<16x16xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<4x4xf16>) -> (), sym_name = "test_vector_store_load_4x4_f16"}> ({
  ^bb0(%arg0: memref<4x4xf16>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "vector.load"(%arg0, %0, %0) : (memref<4x4xf16>, index, index) -> vector<4x4xf16>
    "vector.store"(%1, %arg0, %0, %0) : (vector<4x4xf16>, memref<4x4xf16>, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<4x4x4xf32>) -> (), sym_name = "test_vector_store_load_4x4x4"}> ({
  ^bb0(%arg0: memref<4x4x4xf32>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "vector.load"(%arg0, %0, %0, %0) : (memref<4x4x4xf32>, index, index, index) -> vector<4x4x4xf32>
    "vector.store"(%1, %arg0, %0, %0, %0) : (vector<4x4x4xf32>, memref<4x4x4xf32>, index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<2x2xindex>, vector<2x2xi32>) -> vector<2x2xindex>, sym_name = "test_linearize_index"}> ({
  ^bb0(%arg0: vector<2x2xindex>, %arg1: vector<2x2xi32>):
    %0 = "arith.constant"() <{value = dense<[[0, 1], [2, 3]]> : vector<2x2xindex>}> : () -> vector<2x2xindex>
    %1 = "arith.addi"(%arg0, %0) <{overflowFlags = #arith.overflow<none>}> : (vector<2x2xindex>, vector<2x2xindex>) -> vector<2x2xindex>
    %2 = "arith.index_cast"(%1) : (vector<2x2xindex>) -> vector<2x2xi32>
    %3 = "arith.muli"(%2, %arg1) <{overflowFlags = #arith.overflow<none>}> : (vector<2x2xi32>, vector<2x2xi32>) -> vector<2x2xi32>
    %4 = "arith.index_cast"(%3) : (vector<2x2xi32>) -> vector<2x2xindex>
    "func.return"(%4) : (vector<2x2xindex>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<1x4xf32>) -> vector<3x4xf32>, sym_name = "broadcast_stretch_at_start"}> ({
  ^bb0(%arg0: vector<1x4xf32>):
    %0 = "vector.broadcast"(%arg0) : (vector<1x4xf32>) -> vector<3x4xf32>
    "func.return"(%0) : (vector<3x4xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<4x1xf32>) -> vector<4x3xf32>, sym_name = "broadcast_stretch_at_end"}> ({
  ^bb0(%arg0: vector<4x1xf32>):
    %0 = "vector.broadcast"(%arg0) : (vector<4x1xf32>) -> vector<4x3xf32>
    "func.return"(%0) : (vector<4x3xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<4x1x2xf32>) -> vector<4x3x2xf32>, sym_name = "broadcast_stretch_in_middle"}> ({
  ^bb0(%arg4: vector<4x1x2xf32>):
    %3 = "vector.broadcast"(%arg4) : (vector<4x1x2xf32>) -> vector<4x3x2xf32>
    "func.return"(%3) : (vector<4x3x2xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<?x?xf32>, vector<2x3xindex>, vector<2x3xi1>, vector<2x3xf32>) -> vector<2x3xf32>, sym_name = "gather_memref_2d"}> ({
  ^bb0(%arg0: memref<?x?xf32>, %arg1: vector<2x3xindex>, %arg2: vector<2x3xi1>, %arg3: vector<2x3xf32>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index
    %2 = "vector.gather"(%arg0, %0, %1, %arg1, %arg2, %arg3) : (memref<?x?xf32>, index, index, vector<2x3xindex>, vector<2x3xi1>, vector<2x3xf32>) -> vector<2x3xf32>
    "func.return"(%2) : (vector<2x3xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "gpu.module"() <{sym_name = "test_kernel"}> ({
    "gpu.func"() <{function_type = (memref<8x16xf16>, memref<16x16xf16>, memref<8x16xf32>) -> ()}> ({
    ^bb0(%arg0: memref<8x16xf16>, %arg1: memref<16x16xf16>, %arg2: memref<8x16xf32>):
      %0 = "arith.constant"() <{value = 0 : index}> : () -> index
      %1 = "arith.constant"() <{value = dense<0.000000e+00> : vector<8x8xf16>}> : () -> vector<8x8xf16>
      %2 = "arith.constant"() <{value = dense<0.000000e+00> : vector<8x8xf16>}> : () -> vector<8x8xf16>
      %3 = "arith.constant"() <{value = dense<5.000000e+00> : vector<8x8xf32>}> : () -> vector<8x8xf32>
      %4 = "xegpu.create_nd_tdesc"(%arg0, %0, %0) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>, operandSegmentSizes = array<i32: 1, 2, 0, 0>}> : (memref<8x16xf16>, index, index) -> !xegpu.tensor_desc<8x16xf16>
      %5 = "xegpu.load_nd"(%4) : (!xegpu.tensor_desc<8x16xf16>) -> vector<8x16xf16>
      %6 = "vector.insert_strided_slice"(%1, %5) <{offsets = [0, 0], strides = [1, 1]}> {sizes = [8, 8]} : (vector<8x8xf16>, vector<8x16xf16>) -> vector<8x16xf16>
      %7 = "xegpu.create_nd_tdesc"(%arg1, %0, %0) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>, operandSegmentSizes = array<i32: 1, 2, 0, 0>}> : (memref<16x16xf16>, index, index) -> !xegpu.tensor_desc<16x16xf16>
      %8 = "xegpu.load_nd"(%7) : (!xegpu.tensor_desc<16x16xf16>) -> vector<16x16xf16>
      %9 = "vector.insert_strided_slice"(%2, %8) <{offsets = [0, 0], strides = [1, 1]}> {sizes = [8, 8]} : (vector<8x8xf16>, vector<16x16xf16>) -> vector<16x16xf16>
      %10 = "xegpu.dpas"(%6, %9) : (vector<8x16xf16>, vector<16x16xf16>) -> vector<8x16xf32>
      %11 = "vector.extract_strided_slice"(%10) <{offsets = [0, 0], sizes = [8, 8], strides = [1, 1]}> : (vector<8x16xf32>) -> vector<8x8xf32>
      %12 = "arith.addf"(%11, %3) <{fastmath = #arith.fastmath<none>}> : (vector<8x8xf32>, vector<8x8xf32>) -> vector<8x8xf32>
      %13 = "vector.insert_strided_slice"(%12, %10) <{offsets = [0, 0], strides = [1, 1]}> {sizes = [8, 8]} : (vector<8x8xf32>, vector<8x16xf32>) -> vector<8x16xf32>
      %14 = "xegpu.create_nd_tdesc"(%arg2, %0, %0) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>, operandSegmentSizes = array<i32: 1, 2, 0, 0>}> : (memref<8x16xf32>, index, index) -> !xegpu.tensor_desc<8x16xf32>
      "xegpu.store_nd"(%13, %14) : (vector<8x16xf32>, !xegpu.tensor_desc<8x16xf32>) -> ()
      "gpu.return"() : () -> ()
    }) {gpu.kernel, sym_name = "test_kernel", workgroup_attributions = 0 : i64} : () -> ()
  }) : () -> ()
}) : () -> ()

