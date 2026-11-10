"builtin.module"() ({
  "gpu.module"() <{sym_name = "test"}> ({
    "func.func"() <{function_type = (memref<4096x4096xf16>) -> vector<16x16xf16>, sym_name = "test_load_nd_with_extract_slice"}> ({
    ^bb0(%arg0: memref<4096x4096xf16>):
      %0 = "arith.constant"() <{value = 0 : index}> : () -> index
      %1 = "xegpu.create_nd_tdesc"(%arg0) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<4096x4096xf16>) -> !xegpu.tensor_desc<32x32xf16>
      %2 = "xegpu.load_nd"(%1, %0, %0) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>}> : (!xegpu.tensor_desc<32x32xf16>, index, index) -> vector<32x32xf16>
      %3 = "vector.extract_strided_slice"(%2) <{offsets = [0, 0], sizes = [16, 16], strides = [1, 1]}> : (vector<32x32xf16>) -> vector<16x16xf16>
      "func.return"(%3) : (vector<16x16xf16>) -> ()
    }) : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "gpu.module"() <{sym_name = "test"}> ({
    "func.func"() <{function_type = (memref<4096x4096xf16>) -> vector<16x16xf16>, sym_name = "test_load_nd_with_second_extract"}> ({
    ^bb0(%arg0: memref<4096x4096xf16>):
      %0 = "arith.constant"() <{value = 0 : index}> : () -> index
      %1 = "xegpu.create_nd_tdesc"(%arg0) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<4096x4096xf16>) -> !xegpu.tensor_desc<32x32xf16>
      %2 = "xegpu.load_nd"(%1, %0, %0) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>}> : (!xegpu.tensor_desc<32x32xf16>, index, index) -> vector<32x32xf16>
      %3 = "vector.extract_strided_slice"(%2) <{offsets = [0, 16], sizes = [16, 16], strides = [1, 1]}> : (vector<32x32xf16>) -> vector<16x16xf16>
      "func.return"(%3) : (vector<16x16xf16>) -> ()
    }) : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "gpu.module"() <{sym_name = "test"}> ({
    "func.func"() <{function_type = (memref<4096x4096xf16>) -> (), sym_name = "test_prefetch_nd_32x32"}> ({
    ^bb0(%arg0: memref<4096x4096xf16>):
      %0 = "arith.constant"() <{value = 0 : index}> : () -> index
      %1 = "xegpu.create_nd_tdesc"(%arg0) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<4096x4096xf16>) -> !xegpu.tensor_desc<32x32xf16>
      "xegpu.prefetch_nd"(%1, %0, %0) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>}> : (!xegpu.tensor_desc<32x32xf16>, index, index) -> ()
      "func.return"() : () -> ()
    }) : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "gpu.module"() <{sym_name = "test"}> ({
    "func.func"() <{function_type = (memref<4096x4096xf16>) -> vector<16x16xf16>, sym_name = "test_no_optimization_16x16"}> ({
    ^bb0(%arg0: memref<4096x4096xf16>):
      %0 = "arith.constant"() <{value = 0 : index}> : () -> index
      %1 = "xegpu.create_nd_tdesc"(%arg0) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<4096x4096xf16>) -> !xegpu.tensor_desc<16x16xf16>
      %2 = "xegpu.load_nd"(%1, %0, %0) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>}> : (!xegpu.tensor_desc<16x16xf16>, index, index) -> vector<16x16xf16>
      "func.return"(%2) : (vector<16x16xf16>) -> ()
    }) : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "gpu.module"() <{sym_name = "test"}> ({
    "func.func"() <{function_type = (memref<4096x4096xf32>) -> vector<32x32xf32>, sym_name = "test_no_optimization_with_transpose"}> ({
    ^bb0(%arg0: memref<4096x4096xf32>):
      %0 = "arith.constant"() <{value = 0 : index}> : () -> index
      %1 = "xegpu.create_nd_tdesc"(%arg0) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<4096x4096xf32>) -> !xegpu.tensor_desc<32x32xf32>
      %2 = "xegpu.load_nd"(%1, %0, %0) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>, transpose = array<i64: 1, 0>}> : (!xegpu.tensor_desc<32x32xf32>, index, index) -> vector<32x32xf32>
      "func.return"(%2) : (vector<32x32xf32>) -> ()
    }) : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "gpu.module"() <{sym_name = "test"}> ({
    "func.func"() <{function_type = (memref<4096x4096xf16>) -> (vector<16x16xf16>, vector<16x16xf16>, vector<16x16xf16>, vector<16x16xf16>), sym_name = "test_multiple_extracts"}> ({
    ^bb0(%arg0: memref<4096x4096xf16>):
      %0 = "arith.constant"() <{value = 0 : index}> : () -> index
      %1 = "xegpu.create_nd_tdesc"(%arg0) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<4096x4096xf16>) -> !xegpu.tensor_desc<32x32xf16>
      %2 = "xegpu.load_nd"(%1, %0, %0) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>}> : (!xegpu.tensor_desc<32x32xf16>, index, index) -> vector<32x32xf16>
      %3 = "vector.extract_strided_slice"(%2) <{offsets = [0, 0], sizes = [16, 16], strides = [1, 1]}> : (vector<32x32xf16>) -> vector<16x16xf16>
      %4 = "vector.extract_strided_slice"(%2) <{offsets = [0, 16], sizes = [16, 16], strides = [1, 1]}> : (vector<32x32xf16>) -> vector<16x16xf16>
      %5 = "vector.extract_strided_slice"(%2) <{offsets = [16, 0], sizes = [16, 16], strides = [1, 1]}> : (vector<32x32xf16>) -> vector<16x16xf16>
      %6 = "vector.extract_strided_slice"(%2) <{offsets = [16, 16], sizes = [16, 16], strides = [1, 1]}> : (vector<32x32xf16>) -> vector<16x16xf16>
      "func.return"(%3, %4, %5, %6) : (vector<16x16xf16>, vector<16x16xf16>, vector<16x16xf16>, vector<16x16xf16>) -> ()
    }) : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "gpu.module"() <{sym_name = "test"}> ({
    "func.func"() <{function_type = (i64) -> vector<16x16xf16>, sym_name = "test_pointer_source"}> ({
    ^bb0(%arg0: i64):
      %0 = "arith.constant"() <{value = 0 : index}> : () -> index
      %1 = "xegpu.create_nd_tdesc"(%arg0) <{const_shape = array<i64: 64, 64>, const_strides = array<i64: 64, 1>, operandSegmentSizes = array<i32: 1, 0, 0>}> : (i64) -> !xegpu.tensor_desc<32x32xf16, #xegpu.block_tdesc_attr<boundary_check = false>>
      %2 = "xegpu.load_nd"(%1, %0, %0) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>}> : (!xegpu.tensor_desc<32x32xf16, #xegpu.block_tdesc_attr<boundary_check = false>>, index, index) -> vector<32x32xf16>
      %3 = "vector.extract_strided_slice"(%2) <{offsets = [0, 16], sizes = [16, 16], strides = [1, 1]}> : (vector<32x32xf16>) -> vector<16x16xf16>
      "func.return"(%3) : (vector<16x16xf16>) -> ()
    }) : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "gpu.module"() <{sym_name = "test"}> ({
    "func.func"() <{function_type = (memref<?x?xf16>, index, index) -> vector<16x16xf16>, sym_name = "test_dynamic_memref_source"}> ({
    ^bb0(%arg0: memref<?x?xf16>, %arg1: index, %arg2: index):
      %0 = "arith.constant"() <{value = 0 : index}> : () -> index
      %1 = "arith.constant"() <{value = 1 : index}> : () -> index
      %2 = "xegpu.create_nd_tdesc"(%arg0, %arg1, %arg2, %arg2, %1) <{const_shape = array<i64: -9223372036854775808, -9223372036854775808>, const_strides = array<i64: -9223372036854775808, -9223372036854775808>, operandSegmentSizes = array<i32: 1, 2, 2>}> : (memref<?x?xf16>, index, index, index, index) -> !xegpu.tensor_desc<32x32xf16>
      %3 = "xegpu.load_nd"(%2, %0, %0) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>}> : (!xegpu.tensor_desc<32x32xf16>, index, index) -> vector<32x32xf16>
      %4 = "vector.extract_strided_slice"(%3) <{offsets = [0, 0], sizes = [16, 16], strides = [1, 1]}> : (vector<32x32xf16>) -> vector<16x16xf16>
      "func.return"(%4) : (vector<16x16xf16>) -> ()
    }) : () -> ()
  }) : () -> ()
}) : () -> ()

