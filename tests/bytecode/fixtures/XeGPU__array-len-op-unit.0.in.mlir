"builtin.module"() ({
  "gpu.module"() <{sym_name = "test"}> ({
    "func.func"() <{function_type = (memref<4096x4096xf16>) -> vector<16x16xf16>, sym_name = "test_load_nd_with_extract_slice"}> ({
    ^bb0(%arg0: memref<4096x4096xf16> loc("<stdin>":4:10)):
      %0 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":5:12)
      %1 = "xegpu.create_nd_tdesc"(%arg0) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<4096x4096xf16>) -> !xegpu.tensor_desc<32x32xf16> loc("<stdin>":6:12)
      %2 = "xegpu.load_nd"(%1, %0, %0) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>}> : (!xegpu.tensor_desc<32x32xf16>, index, index) -> vector<32x32xf16> loc("<stdin>":7:12)
      %3 = "vector.extract_strided_slice"(%2) <{offsets = [0, 0], sizes = [16, 16], strides = [1, 1]}> : (vector<32x32xf16>) -> vector<16x16xf16> loc("<stdin>":8:12)
      "func.return"(%3) : (vector<16x16xf16>) -> () loc("<stdin>":9:7)
    }) : () -> () loc("<stdin>":3:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
