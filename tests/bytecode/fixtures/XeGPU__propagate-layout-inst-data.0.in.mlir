"builtin.module"() ({
  "gpu.module"() <{sym_name = "test"}> ({
    "func.func"() <{function_type = (memref<8x32xf32>, memref<8x32xf32>) -> (), sym_name = "load_store_no_array_len"}> ({
    ^bb0(%arg0: memref<8x32xf32> loc("<stdin>":4:10), %arg1: memref<8x32xf32> loc("<stdin>":4:35)):
      %0 = "arith.constant"() <{value = dense<0.000000e+00> : vector<8x16xf32>}> : () -> vector<8x16xf32> loc("<stdin>":5:12)
      %1 = "xegpu.create_nd_tdesc"(%arg0) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<8x32xf32>) -> !xegpu.tensor_desc<8x32xf32> loc("<stdin>":6:12)
      %2 = "xegpu.create_nd_tdesc"(%arg1) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<8x32xf32>) -> !xegpu.tensor_desc<8x32xf32> loc("<stdin>":7:12)
      "xegpu.prefetch_nd"(%1) <{const_offsets = array<i64: 0, 0>, l1_hint = #xegpu.cache_hint<cached>, l2_hint = #xegpu.cache_hint<uncached>}> : (!xegpu.tensor_desc<8x32xf32>) -> () loc("<stdin>":8:7)
      %3 = "xegpu.load_nd"(%1) <{const_offsets = array<i64: 0, 0>}> : (!xegpu.tensor_desc<8x32xf32>) -> vector<8x32xf32> loc("<stdin>":9:12)
      "xegpu.store_nd"(%3, %2) <{const_offsets = array<i64: 0, 0>}> : (vector<8x32xf32>, !xegpu.tensor_desc<8x32xf32>) -> () loc("<stdin>":10:7)
      "func.return"() : () -> () loc("<stdin>":11:7)
    }) : () -> () loc("<stdin>":3:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
