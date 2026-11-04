"builtin.module"() ({
  "gpu.module"() <{sym_name = "xevm_test"}> ({
    "gpu.func"() <{function_type = (memref<24x32xf32>) -> !xegpu.tensor_desc<24x32xf32, #xegpu.layout<inst_data = [8, 16]>>}> ({
    ^bb0(%arg4: memref<24x32xf32>):
      %7 = "xegpu.create_nd_tdesc"(%arg4) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>}> : (memref<24x32xf32>) -> !xegpu.tensor_desc<24x32xf32, #xegpu.layout<inst_data = [8, 16]>>
      "gpu.return"(%7) : (!xegpu.tensor_desc<24x32xf32, #xegpu.layout<inst_data = [8, 16]>>) -> ()
    }) {sym_name = "create_nd_tdesc", workgroup_attributions = 0 : i64} : () -> ()
    "gpu.func"() <{function_type = (memref<256x318xf32>) -> vector<24x32xf32>}> ({
    ^bb0(%arg3: memref<256x318xf32>):
      %5 = "xegpu.create_nd_tdesc"(%arg3) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>}> : (memref<256x318xf32>) -> !xegpu.tensor_desc<24x32xf32, #xegpu.layout<inst_data = [8, 16]>>
      %6 = "xegpu.load_nd"(%5) <{const_offsets = array<i64: 8, 16>}> : (!xegpu.tensor_desc<24x32xf32, #xegpu.layout<inst_data = [8, 16]>>) -> vector<24x32xf32>
      "gpu.return"(%6) : (vector<24x32xf32>) -> ()
    }) {sym_name = "load_nd", workgroup_attributions = 0 : i64} : () -> ()
    "gpu.func"() <{function_type = (memref<256x318xf32>) -> ()}> ({
    ^bb0(%arg2: memref<256x318xf32>):
      %3 = "xegpu.create_nd_tdesc"(%arg2) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>}> : (memref<256x318xf32>) -> !xegpu.tensor_desc<24x32xf32, #xegpu.layout<inst_data = [8, 16]>>
      %4 = "xegpu.load_nd"(%3) <{const_offsets = array<i64: 8, 16>}> : (!xegpu.tensor_desc<24x32xf32, #xegpu.layout<inst_data = [8, 16]>>) -> vector<24x32xf32>
      "xegpu.store_nd"(%4, %3) <{const_offsets = array<i64: 0, 0>}> : (vector<24x32xf32>, !xegpu.tensor_desc<24x32xf32, #xegpu.layout<inst_data = [8, 16]>>) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "load_nd_store_nd", workgroup_attributions = 0 : i64} : () -> ()
    "gpu.func"() <{function_type = (memref<24x32xf32>) -> ()}> ({
    ^bb0(%arg1: memref<24x32xf32>):
      %2 = "xegpu.create_nd_tdesc"(%arg1) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>}> : (memref<24x32xf32>) -> !xegpu.tensor_desc<24x32xf32, #xegpu.layout<inst_data = [8, 16]>>
      "xegpu.prefetch_nd"(%2) <{const_offsets = array<i64: 8, 16>}> : (!xegpu.tensor_desc<24x32xf32, #xegpu.layout<inst_data = [8, 16]>>) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "prefetch_nd_tdesc", workgroup_attributions = 0 : i64} : () -> ()
    "gpu.func"() <{function_type = (memref<256x318xf32>) -> vector<24x32xf32>}> ({
    ^bb0(%arg0: memref<256x318xf32>):
      %0 = "xegpu.create_nd_tdesc"(%arg0) <{const_offsets = array<i64: 16, 8>, operandSegmentSizes = array<i32: 1, 0, 0, 0>}> : (memref<256x318xf32>) -> !xegpu.tensor_desc<24x32xf32, #xegpu.layout<inst_data = [8, 16]>>
      %1 = "xegpu.load_nd"(%0) <{const_offsets = array<i64: 8, 16>}> : (!xegpu.tensor_desc<24x32xf32, #xegpu.layout<inst_data = [8, 16]>>) -> vector<24x32xf32>
      "gpu.return"(%1) : (vector<24x32xf32>) -> ()
    }) {sym_name = "load_nd_offsets_at_both_places", workgroup_attributions = 0 : i64} : () -> ()
  }) : () -> ()
}) : () -> ()

