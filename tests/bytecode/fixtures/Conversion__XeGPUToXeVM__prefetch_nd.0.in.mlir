"builtin.module"() ({
  "gpu.module"() <{sym_name = "prefetch_nd_check"}> ({
    "gpu.func"() <{function_type = (memref<8x16xf32, 1>, memref<8x16xf32, 1>) -> (), kernel}> ({
    ^bb0(%arg0: memref<8x16xf32, 1> loc("<stdin>":4:10), %arg1: memref<8x16xf32, 1> loc("<stdin>":4:38)):
      %0 = "memref.memory_space_cast"(%arg0) : (memref<8x16xf32, 1>) -> memref<8x16xf32> loc("<stdin>":5:12)
      %1 = "xegpu.create_nd_tdesc"(%0) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<8x16xf32>) -> !xegpu.tensor_desc<8x16xf32, #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>> loc("<stdin>":6:12)
      "xegpu.prefetch_nd"(%1) <{const_offsets = array<i64: 0, 0>, l1_hint = #xegpu.cache_hint<cached>, l2_hint = #xegpu.cache_hint<uncached>}> : (!xegpu.tensor_desc<8x16xf32, #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>>) -> () loc("<stdin>":7:7)
      "gpu.return"() : () -> () loc("<stdin>":8:7)
    }) {sym_name = "prefetch_nd"} : () -> () loc("<stdin>":3:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
