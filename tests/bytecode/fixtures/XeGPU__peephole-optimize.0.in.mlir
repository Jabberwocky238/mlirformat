"builtin.module"() ({
  "gpu.module"() <{sym_name = "xevm_module"}> ({
    "gpu.func"() <{function_type = (memref<64x64xf16>, vector<8x16xf16>) -> vector<8x16xf32>}> ({
    ^bb0(%arg0: memref<64x64xf16> loc("<stdin>":4:10), %arg1: vector<8x16xf16> loc("<stdin>":4:36)):
      %0 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":5:12)
      %1 = "arith.constant"() <{value = 32 : index}> : () -> index loc("<stdin>":6:12)
      %2 = "xegpu.create_nd_tdesc"(%arg0) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<64x64xf16>) -> !xegpu.tensor_desc<16x16xf16, #xegpu.layout<lane_layout = [16, 1], lane_data = [1, 2], order = [0, 1]>> loc("<stdin>":7:12)
      %3 = "xegpu.load_nd"(%2, %0, %1) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>}> {result_layout = #xegpu.layout<lane_layout = [16, 1], lane_data = [1, 2], order = [0, 1]>} : (!xegpu.tensor_desc<16x16xf16, #xegpu.layout<lane_layout = [16, 1], lane_data = [1, 2], order = [0, 1]>>, index, index) -> vector<16x16xf16> loc("<stdin>":8:12)
      %4 = "vector.transpose"(%3) <{permutation = array<i64: 1, 0>}> {layout_result_0 = #xegpu.layout<lane_layout = [1, 16], lane_data = [2, 1]>} : (vector<16x16xf16>) -> vector<16x16xf16> loc("<stdin>":9:12)
      %5 = "xegpu.dpas"(%arg1, %4) {layout_result_0 = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>} : (vector<8x16xf16>, vector<16x16xf16>) -> vector<8x16xf32> loc("<stdin>":10:12)
      "gpu.return"(%5) : (vector<8x16xf32>) -> () loc("<stdin>":11:7)
    }) {sym_name = "no_scf"} : () -> () loc("<stdin>":3:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
