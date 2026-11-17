"builtin.module"() ({
  "gpu.module"() <{sym_name = "test_kernel"}> ({
    "gpu.func"() <{function_type = (memref<1024x1024xf16>, memref<1024x1024xf16>, memref<1024x1024xf32>) -> ()}> ({
    ^bb0(%arg0: memref<1024x1024xf16> loc("<stdin>":4:10), %arg1: memref<1024x1024xf16> loc("<stdin>":4:40), %arg2: memref<1024x1024xf32> loc("<stdin>":4:70)):
      %0 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":5:12)
      %1 = "arith.constant"() <{value = 16 : index}> : () -> index loc("<stdin>":6:12)
      %2 = "arith.constant"() <{value = 32 : index}> : () -> index loc("<stdin>":7:12)
      %3 = "arith.constant"() <{value = 1024 : index}> : () -> index loc("<stdin>":8:12)
      %4 = "gpu.block_id"() <{dimension = #gpu<dim x>}> : () -> index loc("<stdin>":9:12)
      %5 = "gpu.block_id"() <{dimension = #gpu<dim y>}> : () -> index loc("<stdin>":10:12)
      %6 = "arith.muli"(%4, %1) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index loc("<stdin>":11:12)
      %7 = "arith.muli"(%5, %2) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index loc("<stdin>":12:12)
      %8 = "xegpu.create_nd_tdesc"(%arg2) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<1024x1024xf32>) -> !xegpu.tensor_desc<16x32xf32, #xegpu.layout<inst_data = [8, 16], lane_layout = [1, 16], lane_data = [8, 1]>> loc("<stdin>":13:12)
      %9 = "xegpu.load_nd"(%8) <{const_offsets = array<i64: 0, 0>, layout = #xegpu.layout<inst_data = [8, 16], lane_layout = [1, 16], lane_data = [8, 1]>}> : (!xegpu.tensor_desc<16x32xf32, #xegpu.layout<inst_data = [8, 16], lane_layout = [1, 16], lane_data = [8, 1]>>) -> vector<16x32xf32> loc("<stdin>":14:12)
      %10 = "xegpu.create_nd_tdesc"(%arg0) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<1024x1024xf16>) -> !xegpu.tensor_desc<16x32xf16, #xegpu.layout<inst_data = [8, 16], lane_layout = [1, 16], lane_data = [8, 1]>> loc("<stdin>":15:13)
      %11 = "xegpu.create_nd_tdesc"(%arg1) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<1024x1024xf16>) -> !xegpu.tensor_desc<32x32xf16, #xegpu.layout<inst_data = [16, 16], lane_layout = [1, 16], lane_data = [16, 1]>> loc("<stdin>":16:13)
      %12 = "scf.for"(%0, %3, %2, %9) ({
      ^bb0(%arg3: index loc("<stdin>":18:12), %arg4: vector<16x32xf32> loc("<stdin>":18:26)):
        %13 = "xegpu.load_nd"(%10, %0, %arg3) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>, layout = #xegpu.layout<inst_data = [8, 16], lane_layout = [1, 16], lane_data = [8, 1]>}> : (!xegpu.tensor_desc<16x32xf16, #xegpu.layout<inst_data = [8, 16], lane_layout = [1, 16], lane_data = [8, 1]>>, index, index) -> vector<16x32xf16> loc("<stdin>":19:15)
        %14 = "xegpu.load_nd"(%11, %arg3, %0) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>, layout = #xegpu.layout<inst_data = [16, 16], lane_layout = [1, 16], lane_data = [16, 1]>}> : (!xegpu.tensor_desc<32x32xf16, #xegpu.layout<inst_data = [16, 16], lane_layout = [1, 16], lane_data = [16, 1]>>, index, index) -> vector<32x32xf16> loc("<stdin>":20:15)
        %15 = "xegpu.dpas"(%13, %14, %arg4) <{layout_a = #xegpu.layout<inst_data = [8, 16], lane_layout = [1, 16], lane_data = [8, 1]>, layout_b = #xegpu.layout<inst_data = [16, 16], lane_layout = [1, 16], lane_data = [16, 1]>, layout_cd = #xegpu.layout<inst_data = [8, 16], lane_layout = [1, 16], lane_data = [8, 1]>}> : (vector<16x32xf16>, vector<32x32xf16>, vector<16x32xf32>) -> vector<16x32xf32> loc("<stdin>":21:15)
        "scf.yield"(%15) : (vector<16x32xf32>) -> () loc("<stdin>":22:9)
      }) : (index, index, index, vector<16x32xf32>) -> vector<16x32xf32> loc("<stdin>":17:13)
      "xegpu.store_nd"(%12, %8) <{const_offsets = array<i64: 0, 0>, layout = #xegpu.layout<inst_data = [8, 16], lane_layout = [1, 16], lane_data = [8, 1]>}> : (vector<16x32xf32>, !xegpu.tensor_desc<16x32xf32, #xegpu.layout<inst_data = [8, 16], lane_layout = [1, 16], lane_data = [8, 1]>>) -> () loc("<stdin>":24:7)
      "gpu.return"() : () -> () loc("<stdin>":25:7)
    }) {sym_name = "gemm_with_one_to_n_lowering"} : () -> () loc("<stdin>":3:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
