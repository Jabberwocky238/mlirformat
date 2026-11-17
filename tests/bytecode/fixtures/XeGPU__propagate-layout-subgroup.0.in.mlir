"builtin.module"() ({
  "gpu.module"() <{sym_name = "test"}> ({
    "func.func"() <{function_type = (memref<256x128xf32>) -> (), sym_name = "store_nd"}> ({
    ^bb0(%arg0: memref<256x128xf32> loc("<stdin>":4:10)):
      %0 = "xegpu.create_nd_tdesc"(%arg0) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<256x128xf32>) -> !xegpu.tensor_desc<256x128xf32> loc("<stdin>":5:12)
      %1 = "xegpu.load_nd"(%0) <{const_offsets = array<i64: 0, 0>}> : (!xegpu.tensor_desc<256x128xf32>) -> vector<256x128xf32> loc("<stdin>":6:12)
      "xegpu.store_nd"(%1, %0) <{const_offsets = array<i64: 0, 0>, layout = #xegpu.layout<sg_layout = [8, 4], sg_data = [32, 32]>}> : (vector<256x128xf32>, !xegpu.tensor_desc<256x128xf32>) -> () loc("<stdin>":7:7)
      "func.return"() : () -> () loc("<stdin>":8:7)
    }) : () -> () loc("<stdin>":3:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
