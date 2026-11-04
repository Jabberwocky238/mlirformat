"builtin.module"() ({
  "gpu.module"() <{sym_name = "test_elementwise_ops"}> ({
    "gpu.func"() <{function_type = (memref<24x32xf32>) -> ()}> ({
    ^bb0(%arg14: memref<24x32xf32>):
      %40 = "xegpu.create_nd_tdesc"(%arg14) <{const_offsets = array<i64: 0, 0>, operandSegmentSizes = array<i32: 1, 0, 0, 0>}> : (memref<24x32xf32>) -> !xegpu.tensor_desc<24x32xf32, #xegpu.layout<sg_layout = [2, 4], sg_data = [12, 8]>>
      %41 = "xegpu.load_nd"(%40) <{layout = #xegpu.layout<sg_layout = [2, 4], sg_data = [12, 8]>}> : (!xegpu.tensor_desc<24x32xf32, #xegpu.layout<sg_layout = [2, 4], sg_data = [12, 8]>>) -> vector<24x32xf32>
      %42 = "math.exp"(%41) <{fastmath = #arith.fastmath<none>}> {layout_result_0 = #xegpu.layout<sg_layout = [2, 4], sg_data = [12, 8]>} : (vector<24x32xf32>) -> vector<24x32xf32>
      %43 = "arith.negf"(%41) <{fastmath = #arith.fastmath<none>}> {layout_result_0 = #xegpu.layout<sg_layout = [2, 4], sg_data = [12, 8]>} : (vector<24x32xf32>) -> vector<24x32xf32>
      "gpu.return"() : () -> ()
    }) {sym_name = "unary_ops_sg_layout_only", workgroup_attributions = 0 : i64} : () -> ()
    "gpu.func"() <{function_type = (memref<24x32xf32>) -> ()}> ({
    ^bb0(%arg13: memref<24x32xf32>):
      %36 = "xegpu.create_nd_tdesc"(%arg13) <{const_offsets = array<i64: 0, 0>, operandSegmentSizes = array<i32: 1, 0, 0, 0>}> : (memref<24x32xf32>) -> !xegpu.tensor_desc<24x32xf32, #xegpu.layout<sg_layout = [2, 4], sg_data = [12, 8], lane_layout = [2, 8], lane_data = [1, 1]>>
      %37 = "xegpu.load_nd"(%36) <{layout = #xegpu.layout<sg_layout = [2, 4], sg_data = [12, 8], lane_layout = [2, 8], lane_data = [1, 1]>}> : (!xegpu.tensor_desc<24x32xf32, #xegpu.layout<sg_layout = [2, 4], sg_data = [12, 8], lane_layout = [2, 8], lane_data = [1, 1]>>) -> vector<24x32xf32>
      %38 = "math.exp"(%37) <{fastmath = #arith.fastmath<none>}> {layout_result_0 = #xegpu.layout<sg_layout = [2, 4], sg_data = [12, 8], lane_layout = [2, 8], lane_data = [1, 1]>} : (vector<24x32xf32>) -> vector<24x32xf32>
      %39 = "arith.negf"(%37) <{fastmath = #arith.fastmath<none>}> {layout_result_0 = #xegpu.layout<sg_layout = [2, 4], sg_data = [12, 8], lane_layout = [2, 8], lane_data = [1, 1]>} : (vector<24x32xf32>) -> vector<24x32xf32>
      "gpu.return"() : () -> ()
    }) {sym_name = "unary_ops", workgroup_attributions = 0 : i64} : () -> ()
    "gpu.func"() <{function_type = (memref<24x32xf32>, memref<24x32xf32>) -> ()}> ({
    ^bb0(%arg11: memref<24x32xf32>, %arg12: memref<24x32xf32>):
      %30 = "xegpu.create_nd_tdesc"(%arg11) <{const_offsets = array<i64: 0, 0>, operandSegmentSizes = array<i32: 1, 0, 0, 0>}> : (memref<24x32xf32>) -> !xegpu.tensor_desc<24x32xf32, #xegpu.layout<sg_layout = [2, 4], sg_data = [12, 8], lane_layout = [2, 8], lane_data = [1, 1]>>
      %31 = "xegpu.create_nd_tdesc"(%arg12) <{const_offsets = array<i64: 0, 0>, operandSegmentSizes = array<i32: 1, 0, 0, 0>}> : (memref<24x32xf32>) -> !xegpu.tensor_desc<24x32xf32, #xegpu.layout<sg_layout = [2, 4], sg_data = [12, 8], lane_layout = [2, 8], lane_data = [1, 1]>>
      %32 = "xegpu.load_nd"(%30) <{layout = #xegpu.layout<sg_layout = [2, 4], sg_data = [12, 8], lane_layout = [2, 8], lane_data = [1, 1]>}> : (!xegpu.tensor_desc<24x32xf32, #xegpu.layout<sg_layout = [2, 4], sg_data = [12, 8], lane_layout = [2, 8], lane_data = [1, 1]>>) -> vector<24x32xf32>
      %33 = "xegpu.load_nd"(%31) <{layout = #xegpu.layout<sg_layout = [2, 4], sg_data = [12, 8], lane_layout = [2, 8], lane_data = [1, 1]>}> : (!xegpu.tensor_desc<24x32xf32, #xegpu.layout<sg_layout = [2, 4], sg_data = [12, 8], lane_layout = [2, 8], lane_data = [1, 1]>>) -> vector<24x32xf32>
      %34 = "arith.addf"(%32, %33) <{fastmath = #arith.fastmath<none>}> {layout_result_0 = #xegpu.layout<sg_layout = [2, 4], sg_data = [12, 8], lane_layout = [2, 8], lane_data = [1, 1]>} : (vector<24x32xf32>, vector<24x32xf32>) -> vector<24x32xf32>
      %35 = "math.powf"(%32, %33) <{fastmath = #arith.fastmath<none>}> {layout_result_0 = #xegpu.layout<sg_layout = [2, 4], sg_data = [12, 8], lane_layout = [2, 8], lane_data = [1, 1]>} : (vector<24x32xf32>, vector<24x32xf32>) -> vector<24x32xf32>
      "gpu.return"() : () -> ()
    }) {sym_name = "binary_ops", workgroup_attributions = 0 : i64} : () -> ()
    "gpu.func"() <{function_type = (memref<24x32xf32>, memref<24x32xf32>, memref<24x32xi1>) -> ()}> ({
    ^bb0(%arg8: memref<24x32xf32>, %arg9: memref<24x32xf32>, %arg10: memref<24x32xi1>):
      %22 = "xegpu.create_nd_tdesc"(%arg8) <{const_offsets = array<i64: 0, 0>, operandSegmentSizes = array<i32: 1, 0, 0, 0>}> : (memref<24x32xf32>) -> !xegpu.tensor_desc<24x32xf32, #xegpu.layout<sg_layout = [2, 4], sg_data = [12, 8], lane_layout = [2, 8], lane_data = [1, 1]>>
      %23 = "xegpu.create_nd_tdesc"(%arg9) <{const_offsets = array<i64: 0, 0>, operandSegmentSizes = array<i32: 1, 0, 0, 0>}> : (memref<24x32xf32>) -> !xegpu.tensor_desc<24x32xf32, #xegpu.layout<sg_layout = [2, 4], sg_data = [12, 8], lane_layout = [2, 8], lane_data = [1, 1]>>
      %24 = "xegpu.create_nd_tdesc"(%arg10) <{const_offsets = array<i64: 0, 0>, operandSegmentSizes = array<i32: 1, 0, 0, 0>}> : (memref<24x32xi1>) -> !xegpu.tensor_desc<24x32xi1, #xegpu.layout<sg_layout = [2, 4], sg_data = [12, 8], lane_layout = [2, 8], lane_data = [1, 1]>>
      %25 = "xegpu.load_nd"(%22) <{layout = #xegpu.layout<sg_layout = [2, 4], sg_data = [12, 8], lane_layout = [2, 8], lane_data = [1, 1]>}> : (!xegpu.tensor_desc<24x32xf32, #xegpu.layout<sg_layout = [2, 4], sg_data = [12, 8], lane_layout = [2, 8], lane_data = [1, 1]>>) -> vector<24x32xf32>
      %26 = "xegpu.load_nd"(%23) <{layout = #xegpu.layout<sg_layout = [2, 4], sg_data = [12, 8], lane_layout = [2, 8], lane_data = [1, 1]>}> : (!xegpu.tensor_desc<24x32xf32, #xegpu.layout<sg_layout = [2, 4], sg_data = [12, 8], lane_layout = [2, 8], lane_data = [1, 1]>>) -> vector<24x32xf32>
      %27 = "xegpu.load_nd"(%24) <{layout = #xegpu.layout<sg_layout = [2, 4], sg_data = [12, 8], lane_layout = [2, 8], lane_data = [1, 1]>}> : (!xegpu.tensor_desc<24x32xi1, #xegpu.layout<sg_layout = [2, 4], sg_data = [12, 8], lane_layout = [2, 8], lane_data = [1, 1]>>) -> vector<24x32xi1>
      %28 = "arith.select"(%27, %25, %26) {layout_result_0 = #xegpu.layout<sg_layout = [2, 4], sg_data = [12, 8], lane_layout = [2, 8], lane_data = [1, 1]>} : (vector<24x32xi1>, vector<24x32xf32>, vector<24x32xf32>) -> vector<24x32xf32>
      %29 = "math.fma"(%25, %26, %25) <{fastmath = #arith.fastmath<none>}> {layout_result_0 = #xegpu.layout<sg_layout = [2, 4], sg_data = [12, 8], lane_layout = [2, 8], lane_data = [1, 1]>} : (vector<24x32xf32>, vector<24x32xf32>, vector<24x32xf32>) -> vector<24x32xf32>
      "gpu.return"() : () -> ()
    }) {sym_name = "ternary_ops", workgroup_attributions = 0 : i64} : () -> ()
    "gpu.func"() <{function_type = (memref<24x32xf32>, memref<24x32xi32>) -> ()}> ({
    ^bb0(%arg6: memref<24x32xf32>, %arg7: memref<24x32xi32>):
      %16 = "xegpu.create_nd_tdesc"(%arg6) <{const_offsets = array<i64: 0, 0>, operandSegmentSizes = array<i32: 1, 0, 0, 0>}> : (memref<24x32xf32>) -> !xegpu.tensor_desc<24x32xf32, #xegpu.layout<sg_layout = [2, 4], sg_data = [12, 8], lane_layout = [2, 8], lane_data = [1, 1]>>
      %17 = "xegpu.create_nd_tdesc"(%arg7) <{const_offsets = array<i64: 0, 0>, operandSegmentSizes = array<i32: 1, 0, 0, 0>}> : (memref<24x32xi32>) -> !xegpu.tensor_desc<24x32xi32, #xegpu.layout<sg_layout = [2, 4], sg_data = [12, 8], lane_layout = [2, 8], lane_data = [1, 1]>>
      %18 = "xegpu.load_nd"(%16) <{layout = #xegpu.layout<sg_layout = [2, 4], sg_data = [12, 8], lane_layout = [2, 8], lane_data = [1, 1]>}> : (!xegpu.tensor_desc<24x32xf32, #xegpu.layout<sg_layout = [2, 4], sg_data = [12, 8], lane_layout = [2, 8], lane_data = [1, 1]>>) -> vector<24x32xf32>
      %19 = "xegpu.load_nd"(%17) <{layout = #xegpu.layout<sg_layout = [2, 4], sg_data = [12, 8], lane_layout = [2, 8], lane_data = [1, 1]>}> : (!xegpu.tensor_desc<24x32xi32, #xegpu.layout<sg_layout = [2, 4], sg_data = [12, 8], lane_layout = [2, 8], lane_data = [1, 1]>>) -> vector<24x32xi32>
      %20 = "arith.truncf"(%18) {layout_result_0 = #xegpu.layout<sg_layout = [2, 4], sg_data = [12, 8], lane_layout = [2, 8], lane_data = [1, 1]>} : (vector<24x32xf32>) -> vector<24x32xf16>
      %21 = "arith.bitcast"(%19) {layout_result_0 = #xegpu.layout<sg_layout = [2, 4], sg_data = [12, 8], lane_layout = [2, 8], lane_data = [1, 1]>} : (vector<24x32xi32>) -> vector<24x32xf32>
      "gpu.return"() : () -> ()
    }) {sym_name = "type_conversion_ops", workgroup_attributions = 0 : i64} : () -> ()
    "gpu.func"() <{function_type = (memref<24x32xf32>, memref<24x32xf32>, memref<24x32xi32>, memref<24x32xi32>) -> ()}> ({
    ^bb0(%arg2: memref<24x32xf32>, %arg3: memref<24x32xf32>, %arg4: memref<24x32xi32>, %arg5: memref<24x32xi32>):
      %6 = "xegpu.create_nd_tdesc"(%arg2) <{const_offsets = array<i64: 0, 0>, operandSegmentSizes = array<i32: 1, 0, 0, 0>}> : (memref<24x32xf32>) -> !xegpu.tensor_desc<24x32xf32, #xegpu.layout<sg_layout = [2, 4], sg_data = [12, 8], lane_layout = [2, 8], lane_data = [1, 1]>>
      %7 = "xegpu.create_nd_tdesc"(%arg3) <{const_offsets = array<i64: 0, 0>, operandSegmentSizes = array<i32: 1, 0, 0, 0>}> : (memref<24x32xf32>) -> !xegpu.tensor_desc<24x32xf32, #xegpu.layout<sg_layout = [2, 4], sg_data = [12, 8], lane_layout = [2, 8], lane_data = [1, 1]>>
      %8 = "xegpu.create_nd_tdesc"(%arg4) <{const_offsets = array<i64: 0, 0>, operandSegmentSizes = array<i32: 1, 0, 0, 0>}> : (memref<24x32xi32>) -> !xegpu.tensor_desc<24x32xi32, #xegpu.layout<sg_layout = [2, 4], sg_data = [12, 8], lane_layout = [2, 8], lane_data = [1, 1]>>
      %9 = "xegpu.create_nd_tdesc"(%arg5) <{const_offsets = array<i64: 0, 0>, operandSegmentSizes = array<i32: 1, 0, 0, 0>}> : (memref<24x32xi32>) -> !xegpu.tensor_desc<24x32xi32, #xegpu.layout<sg_layout = [2, 4], sg_data = [12, 8], lane_layout = [2, 8], lane_data = [1, 1]>>
      %10 = "xegpu.load_nd"(%6) <{layout = #xegpu.layout<sg_layout = [2, 4], sg_data = [12, 8], lane_layout = [2, 8], lane_data = [1, 1]>}> : (!xegpu.tensor_desc<24x32xf32, #xegpu.layout<sg_layout = [2, 4], sg_data = [12, 8], lane_layout = [2, 8], lane_data = [1, 1]>>) -> vector<24x32xf32>
      %11 = "xegpu.load_nd"(%7) <{layout = #xegpu.layout<sg_layout = [2, 4], sg_data = [12, 8], lane_layout = [2, 8], lane_data = [1, 1]>}> : (!xegpu.tensor_desc<24x32xf32, #xegpu.layout<sg_layout = [2, 4], sg_data = [12, 8], lane_layout = [2, 8], lane_data = [1, 1]>>) -> vector<24x32xf32>
      %12 = "xegpu.load_nd"(%8) <{layout = #xegpu.layout<sg_layout = [2, 4], sg_data = [12, 8], lane_layout = [2, 8], lane_data = [1, 1]>}> : (!xegpu.tensor_desc<24x32xi32, #xegpu.layout<sg_layout = [2, 4], sg_data = [12, 8], lane_layout = [2, 8], lane_data = [1, 1]>>) -> vector<24x32xi32>
      %13 = "xegpu.load_nd"(%9) <{layout = #xegpu.layout<sg_layout = [2, 4], sg_data = [12, 8], lane_layout = [2, 8], lane_data = [1, 1]>}> : (!xegpu.tensor_desc<24x32xi32, #xegpu.layout<sg_layout = [2, 4], sg_data = [12, 8], lane_layout = [2, 8], lane_data = [1, 1]>>) -> vector<24x32xi32>
      %14 = "arith.cmpf"(%10, %11) <{fastmath = #arith.fastmath<none>, predicate = 11 : i64}> {layout_result_0 = #xegpu.layout<sg_layout = [2, 4], sg_data = [12, 8], lane_layout = [2, 8], lane_data = [1, 1]>} : (vector<24x32xf32>, vector<24x32xf32>) -> vector<24x32xi1>
      %15 = "arith.cmpi"(%12, %13) <{predicate = 0 : i64}> {layout_result_0 = #xegpu.layout<sg_layout = [2, 4], sg_data = [12, 8], lane_layout = [2, 8], lane_data = [1, 1]>} : (vector<24x32xi32>, vector<24x32xi32>) -> vector<24x32xi1>
      "gpu.return"() : () -> ()
    }) {sym_name = "comparison_ops", workgroup_attributions = 0 : i64} : () -> ()
    "gpu.func"() <{function_type = (memref<24x32xf32>, memref<24x32xf32>) -> ()}> ({
    ^bb0(%arg0: memref<24x32xf32>, %arg1: memref<24x32xf32>):
      %0 = "xegpu.create_nd_tdesc"(%arg0) <{const_offsets = array<i64: 0, 0>, operandSegmentSizes = array<i32: 1, 0, 0, 0>}> : (memref<24x32xf32>) -> !xegpu.tensor_desc<24x32xf32, #xegpu.layout<sg_layout = [4, 4], sg_data = [2, 2], lane_layout = [2, 2], lane_data = [1, 1]>>
      %1 = "xegpu.create_nd_tdesc"(%arg1) <{const_offsets = array<i64: 0, 0>, operandSegmentSizes = array<i32: 1, 0, 0, 0>}> : (memref<24x32xf32>) -> !xegpu.tensor_desc<24x32xf32, #xegpu.layout<sg_layout = [4, 4], sg_data = [2, 2], lane_layout = [2, 2], lane_data = [1, 1]>>
      %2 = "xegpu.load_nd"(%0) <{layout = #xegpu.layout<sg_layout = [4, 4], sg_data = [2, 2], lane_layout = [2, 2], lane_data = [1, 1]>}> : (!xegpu.tensor_desc<24x32xf32, #xegpu.layout<sg_layout = [4, 4], sg_data = [2, 2], lane_layout = [2, 2], lane_data = [1, 1]>>) -> vector<24x32xf32>
      %3 = "xegpu.load_nd"(%1) <{layout = #xegpu.layout<sg_layout = [4, 4], sg_data = [2, 2], lane_layout = [2, 2], lane_data = [1, 1]>}> : (!xegpu.tensor_desc<24x32xf32, #xegpu.layout<sg_layout = [4, 4], sg_data = [2, 2], lane_layout = [2, 2], lane_data = [1, 1]>>) -> vector<24x32xf32>
      %4 = "arith.negf"(%2) <{fastmath = #arith.fastmath<none>}> {layout_result_0 = #xegpu.layout<sg_layout = [4, 4], sg_data = [2, 2], lane_layout = [2, 2], lane_data = [1, 1]>} : (vector<24x32xf32>) -> vector<24x32xf32>
      %5 = "math.powf"(%2, %3) <{fastmath = #arith.fastmath<none>}> {layout_result_0 = #xegpu.layout<sg_layout = [4, 4], sg_data = [2, 2], lane_layout = [2, 2], lane_data = [1, 1]>} : (vector<24x32xf32>, vector<24x32xf32>) -> vector<24x32xf32>
      "gpu.return"() : () -> ()
    }) {sym_name = "elementwise_ops_rr_assignment", workgroup_attributions = 0 : i64} : () -> ()
  }) : () -> ()
}) : () -> ()

