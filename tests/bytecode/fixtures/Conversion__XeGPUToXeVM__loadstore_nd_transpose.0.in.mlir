"builtin.module"() ({
  "gpu.module"() <{sym_name = "load_check"}> ({
    "gpu.func"() <{function_type = (memref<16x16xf16, 1>, memref<16x16xf16, 1>) -> (), kernel}> ({
    ^bb0(%arg0: memref<16x16xf16, 1> loc("<stdin>":4:10), %arg1: memref<16x16xf16, 1> loc("<stdin>":4:39)):
      %0 = "memref.memory_space_cast"(%arg0) : (memref<16x16xf16, 1>) -> memref<16x16xf16> loc("<stdin>":5:12)
      %1 = "memref.memory_space_cast"(%arg1) : (memref<16x16xf16, 1>) -> memref<16x16xf16> loc("<stdin>":6:12)
      %2 = "xegpu.create_nd_tdesc"(%0) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<16x16xf16>) -> !xegpu.tensor_desc<16x16xf16> loc("<stdin>":7:12)
      %3 = "xegpu.load_nd"(%2) <{const_offsets = array<i64: 0, 16>, l1_hint = #xegpu.cache_hint<cached>, l2_hint = #xegpu.cache_hint<uncached>, transpose = array<i64: 1, 0>}> : (!xegpu.tensor_desc<16x16xf16>) -> vector<16xf16> loc("<stdin>":8:12)
      %4 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":9:12)
      "vector.store"(%3, %1, %4, %4) : (vector<16xf16>, memref<16x16xf16>, index, index) -> () loc("<stdin>":10:7)
      "gpu.return"() : () -> () loc("<stdin>":11:7)
    }) {sym_name = "load_nd_transpose_f16"} : () -> () loc("<stdin>":3:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
