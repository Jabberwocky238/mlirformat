"builtin.module"() ({
  "gpu.module"() <{sym_name = "test"}> ({
    "func.func"() <{function_type = (memref<8x16xf16>, memref<16x16xf16>, memref<8x16xf32>) -> (), sym_name = "dpas_f16"}> ({
    ^bb0(%arg0: memref<8x16xf16> loc("<stdin>":4:10), %arg1: memref<16x16xf16> loc("<stdin>":4:35), %arg2: memref<8x16xf32> loc("<stdin>":4:61)):
      %0 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":5:12)
      %1 = "arith.constant"() <{value = dense<0.000000e+00> : vector<8x16xf32>}> : () -> vector<8x16xf32> loc("<stdin>":6:12)
      %2 = "xegpu.create_nd_tdesc"(%arg0) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<8x16xf16>) -> !xegpu.tensor_desc<8x16xf16> loc("<stdin>":7:12)
      %3 = "xegpu.create_nd_tdesc"(%arg1) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<16x16xf16>) -> !xegpu.tensor_desc<16x16xf16> loc("<stdin>":8:12)
      %4 = "xegpu.load_nd"(%2) <{const_offsets = array<i64: 0, 0>}> : (!xegpu.tensor_desc<8x16xf16>) -> vector<8x16xf16> loc("<stdin>":9:12)
      %5 = "xegpu.load_nd"(%3) <{const_offsets = array<i64: 0, 0>}> : (!xegpu.tensor_desc<16x16xf16>) -> vector<16x16xf16> loc("<stdin>":10:12)
      %6 = "xegpu.dpas"(%4, %5, %1) : (vector<8x16xf16>, vector<16x16xf16>, vector<8x16xf32>) -> vector<8x16xf32> loc("<stdin>":11:12)
      %7 = "xegpu.create_nd_tdesc"(%arg2) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<8x16xf32>) -> !xegpu.tensor_desc<8x16xf32> loc("<stdin>":12:12)
      "xegpu.store_nd"(%6, %7) <{const_offsets = array<i64: 0, 0>}> : (vector<8x16xf32>, !xegpu.tensor_desc<8x16xf32>) -> () loc("<stdin>":13:7)
      "func.return"() : () -> () loc("<stdin>":14:7)
    }) : () -> () loc("<stdin>":3:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
