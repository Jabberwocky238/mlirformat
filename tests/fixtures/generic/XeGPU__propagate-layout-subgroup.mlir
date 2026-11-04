"builtin.module"() ({
  "gpu.module"() <{sym_name = "test"}> ({
    "func.func"() <{function_type = (memref<256x128xf32>) -> (), sym_name = "store_nd"}> ({
    ^bb0(%arg0: memref<256x128xf32>):
      %0 = "xegpu.create_nd_tdesc"(%arg0) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>}> : (memref<256x128xf32>) -> !xegpu.tensor_desc<256x128xf32>
      %1 = "xegpu.load_nd"(%0) : (!xegpu.tensor_desc<256x128xf32>) -> vector<256x128xf32>
      "xegpu.store_nd"(%1, %0) <{layout = #xegpu.layout<sg_layout = [8, 4], sg_data = [32, 32]>}> : (vector<256x128xf32>, !xegpu.tensor_desc<256x128xf32>) -> ()
      "func.return"() : () -> ()
    }) : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "gpu.module"() <{sym_name = "test"}> ({
    "func.func"() <{function_type = (memref<256x128xf32>, memref<128x256xf32>) -> (), sym_name = "vector_transpose"}> ({
    ^bb0(%arg0: memref<256x128xf32>, %arg1: memref<128x256xf32>):
      %0 = "xegpu.create_nd_tdesc"(%arg0) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>}> : (memref<256x128xf32>) -> !xegpu.tensor_desc<256x128xf32>
      %1 = "xegpu.create_nd_tdesc"(%arg1) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>}> : (memref<128x256xf32>) -> !xegpu.tensor_desc<128x256xf32>
      %2 = "xegpu.load_nd"(%0) <{const_offsets = array<i64: 0, 0>}> : (!xegpu.tensor_desc<256x128xf32>) -> vector<256x128xf32>
      %3 = "vector.transpose"(%2) <{permutation = array<i64: 1, 0>}> : (vector<256x128xf32>) -> vector<128x256xf32>
      "xegpu.store_nd"(%3, %1) <{const_offsets = array<i64: 0, 0>, layout = #xegpu.layout<sg_layout = [8, 4], sg_data = [32, 64], order = [1, 0]>}> : (vector<128x256xf32>, !xegpu.tensor_desc<128x256xf32>) -> ()
      "func.return"() : () -> ()
    }) : () -> ()
  }) : () -> ()
}) : () -> ()

