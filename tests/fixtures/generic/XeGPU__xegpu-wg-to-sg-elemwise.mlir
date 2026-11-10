"builtin.module"() ({
  "gpu.module"() <{sym_name = "test_elementwise_ops"}> ({
    "gpu.func"() <{function_type = (memref<24x32xf32>) -> ()}> ({
    ^bb0(%arg14: memref<24x32xf32>):
      %47 = "xegpu.create_nd_tdesc"(%arg14) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<24x32xf32>) -> !xegpu.tensor_desc<24x32xf32>
      %48 = "xegpu.load_nd"(%47) <{const_offsets = array<i64: 0, 0>, layout = #xegpu.layout<sg_layout = [2, 4], sg_data = [12, 8]>}> : (!xegpu.tensor_desc<24x32xf32>) -> vector<24x32xf32>
      %49 = "math.exp"(%48) <{fastmath = #arith.fastmath<none>}> : (vector<24x32xf32>) -> vector<24x32xf32>
      %50 = "arith.negf"(%49) <{fastmath = #arith.fastmath<none>}> : (vector<24x32xf32>) -> vector<24x32xf32>
      %51 = "xegpu.convert_layout"(%50) <{input_layout = #xegpu.layout<sg_layout = [2, 4], sg_data = [12, 8]>, target_layout = #xegpu.layout<sg_layout = [2, 4], sg_data = [12, 8]>}> : (vector<24x32xf32>) -> vector<24x32xf32>
      "gpu.return"() : () -> ()
    }) {sym_name = "unary_ops_sg_layout_only"} : () -> ()
    "gpu.func"() <{function_type = (memref<24x32xf32>) -> ()}> ({
    ^bb0(%arg13: memref<24x32xf32>):
      %42 = "xegpu.create_nd_tdesc"(%arg13) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<24x32xf32>) -> !xegpu.tensor_desc<24x32xf32>
      %43 = "xegpu.load_nd"(%42) <{const_offsets = array<i64: 0, 0>, layout = #xegpu.layout<sg_layout = [2, 4], sg_data = [12, 8], lane_layout = [2, 8], lane_data = [1, 1]>}> : (!xegpu.tensor_desc<24x32xf32>) -> vector<24x32xf32>
      %44 = "math.exp"(%43) <{fastmath = #arith.fastmath<none>}> : (vector<24x32xf32>) -> vector<24x32xf32>
      %45 = "arith.negf"(%44) <{fastmath = #arith.fastmath<none>}> : (vector<24x32xf32>) -> vector<24x32xf32>
      %46 = "xegpu.convert_layout"(%45) <{input_layout = #xegpu.layout<sg_layout = [2, 4], sg_data = [12, 8], lane_layout = [2, 8], lane_data = [1, 1]>, target_layout = #xegpu.layout<sg_layout = [2, 4], sg_data = [12, 8], lane_layout = [2, 8], lane_data = [1, 1]>}> : (vector<24x32xf32>) -> vector<24x32xf32>
      "gpu.return"() : () -> ()
    }) {sym_name = "unary_ops"} : () -> ()
    "gpu.func"() <{function_type = (memref<24x32xf32>, memref<24x32xf32>) -> ()}> ({
    ^bb0(%arg11: memref<24x32xf32>, %arg12: memref<24x32xf32>):
      %35 = "xegpu.create_nd_tdesc"(%arg11) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<24x32xf32>) -> !xegpu.tensor_desc<24x32xf32>
      %36 = "xegpu.create_nd_tdesc"(%arg12) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<24x32xf32>) -> !xegpu.tensor_desc<24x32xf32>
      %37 = "xegpu.load_nd"(%35) <{const_offsets = array<i64: 0, 0>, layout = #xegpu.layout<sg_layout = [2, 4], sg_data = [12, 8], lane_layout = [2, 8], lane_data = [1, 1]>}> : (!xegpu.tensor_desc<24x32xf32>) -> vector<24x32xf32>
      %38 = "xegpu.load_nd"(%36) <{const_offsets = array<i64: 0, 0>, layout = #xegpu.layout<sg_layout = [2, 4], sg_data = [12, 8], lane_layout = [2, 8], lane_data = [1, 1]>}> : (!xegpu.tensor_desc<24x32xf32>) -> vector<24x32xf32>
      %39 = "arith.addf"(%37, %38) <{fastmath = #arith.fastmath<none>}> : (vector<24x32xf32>, vector<24x32xf32>) -> vector<24x32xf32>
      %40 = "math.powf"(%39, %38) <{fastmath = #arith.fastmath<none>}> : (vector<24x32xf32>, vector<24x32xf32>) -> vector<24x32xf32>
      %41 = "xegpu.convert_layout"(%40) <{input_layout = #xegpu.layout<sg_layout = [2, 4], sg_data = [12, 8], lane_layout = [2, 8], lane_data = [1, 1]>, target_layout = #xegpu.layout<sg_layout = [2, 4], sg_data = [12, 8], lane_layout = [2, 8], lane_data = [1, 1]>}> : (vector<24x32xf32>) -> vector<24x32xf32>
      "gpu.return"() : () -> ()
    }) {sym_name = "binary_ops"} : () -> ()
    "gpu.func"() <{function_type = (memref<24x32xf32>, memref<24x32xf32>, memref<24x32xi1>) -> ()}> ({
    ^bb0(%arg8: memref<24x32xf32>, %arg9: memref<24x32xf32>, %arg10: memref<24x32xi1>):
      %26 = "xegpu.create_nd_tdesc"(%arg8) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<24x32xf32>) -> !xegpu.tensor_desc<24x32xf32>
      %27 = "xegpu.create_nd_tdesc"(%arg9) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<24x32xf32>) -> !xegpu.tensor_desc<24x32xf32>
      %28 = "xegpu.create_nd_tdesc"(%arg10) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<24x32xi1>) -> !xegpu.tensor_desc<24x32xi1>
      %29 = "xegpu.load_nd"(%26) <{const_offsets = array<i64: 0, 0>, layout = #xegpu.layout<sg_layout = [2, 4], sg_data = [12, 8], lane_layout = [2, 8], lane_data = [1, 1]>}> : (!xegpu.tensor_desc<24x32xf32>) -> vector<24x32xf32>
      %30 = "xegpu.load_nd"(%27) <{const_offsets = array<i64: 0, 0>, layout = #xegpu.layout<sg_layout = [2, 4], sg_data = [12, 8], lane_layout = [2, 8], lane_data = [1, 1]>}> : (!xegpu.tensor_desc<24x32xf32>) -> vector<24x32xf32>
      %31 = "xegpu.load_nd"(%28) <{const_offsets = array<i64: 0, 0>, layout = #xegpu.layout<sg_layout = [2, 4], sg_data = [12, 8], lane_layout = [2, 8], lane_data = [1, 1]>}> : (!xegpu.tensor_desc<24x32xi1>) -> vector<24x32xi1>
      %32 = "arith.select"(%31, %29, %30) : (vector<24x32xi1>, vector<24x32xf32>, vector<24x32xf32>) -> vector<24x32xf32>
      %33 = "math.fma"(%29, %30, %32) <{fastmath = #arith.fastmath<none>}> : (vector<24x32xf32>, vector<24x32xf32>, vector<24x32xf32>) -> vector<24x32xf32>
      %34 = "xegpu.convert_layout"(%33) <{input_layout = #xegpu.layout<sg_layout = [2, 4], sg_data = [12, 8], lane_layout = [2, 8], lane_data = [1, 1]>, target_layout = #xegpu.layout<sg_layout = [2, 4], sg_data = [12, 8], lane_layout = [2, 8], lane_data = [1, 1]>}> : (vector<24x32xf32>) -> vector<24x32xf32>
      "gpu.return"() : () -> ()
    }) {sym_name = "ternary_ops"} : () -> ()
    "gpu.func"() <{function_type = (memref<24x32xf32>, memref<24x32xi32>) -> ()}> ({
    ^bb0(%arg6: memref<24x32xf32>, %arg7: memref<24x32xi32>):
      %19 = "xegpu.create_nd_tdesc"(%arg6) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<24x32xf32>) -> !xegpu.tensor_desc<24x32xf32>
      %20 = "xegpu.create_nd_tdesc"(%arg7) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<24x32xi32>) -> !xegpu.tensor_desc<24x32xi32>
      %21 = "xegpu.load_nd"(%19) <{const_offsets = array<i64: 0, 0>, layout = #xegpu.layout<sg_layout = [2, 4], sg_data = [12, 8], lane_layout = [2, 8], lane_data = [1, 1]>}> : (!xegpu.tensor_desc<24x32xf32>) -> vector<24x32xf32>
      %22 = "xegpu.load_nd"(%20) <{const_offsets = array<i64: 0, 0>, layout = #xegpu.layout<sg_layout = [2, 4], sg_data = [12, 8], lane_layout = [2, 8], lane_data = [1, 1]>}> : (!xegpu.tensor_desc<24x32xi32>) -> vector<24x32xi32>
      %23 = "arith.truncf"(%21) : (vector<24x32xf32>) -> vector<24x32xf16>
      %24 = "arith.bitcast"(%23) : (vector<24x32xf16>) -> vector<24x32xi16>
      %25 = "xegpu.convert_layout"(%24) <{input_layout = #xegpu.layout<sg_layout = [2, 4], sg_data = [12, 8], lane_layout = [2, 8], lane_data = [1, 1]>, target_layout = #xegpu.layout<sg_layout = [2, 4], sg_data = [12, 8], lane_layout = [2, 8], lane_data = [1, 1]>}> : (vector<24x32xi16>) -> vector<24x32xi16>
      "gpu.return"() : () -> ()
    }) {sym_name = "type_conversion_ops"} : () -> ()
    "gpu.func"() <{function_type = (memref<24x32xf32>, memref<24x32xf32>, memref<24x32xi32>, memref<24x32xi32>) -> ()}> ({
    ^bb0(%arg2: memref<24x32xf32>, %arg3: memref<24x32xf32>, %arg4: memref<24x32xi32>, %arg5: memref<24x32xi32>):
      %7 = "xegpu.create_nd_tdesc"(%arg2) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<24x32xf32>) -> !xegpu.tensor_desc<24x32xf32>
      %8 = "xegpu.create_nd_tdesc"(%arg3) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<24x32xf32>) -> !xegpu.tensor_desc<24x32xf32>
      %9 = "xegpu.create_nd_tdesc"(%arg4) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<24x32xi32>) -> !xegpu.tensor_desc<24x32xi32>
      %10 = "xegpu.create_nd_tdesc"(%arg5) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<24x32xi32>) -> !xegpu.tensor_desc<24x32xi32>
      %11 = "xegpu.load_nd"(%7) <{const_offsets = array<i64: 0, 0>, layout = #xegpu.layout<sg_layout = [2, 4], sg_data = [12, 8], lane_layout = [2, 8], lane_data = [1, 1]>}> : (!xegpu.tensor_desc<24x32xf32>) -> vector<24x32xf32>
      %12 = "xegpu.load_nd"(%8) <{const_offsets = array<i64: 0, 0>, layout = #xegpu.layout<sg_layout = [2, 4], sg_data = [12, 8], lane_layout = [2, 8], lane_data = [1, 1]>}> : (!xegpu.tensor_desc<24x32xf32>) -> vector<24x32xf32>
      %13 = "xegpu.load_nd"(%9) <{const_offsets = array<i64: 0, 0>, layout = #xegpu.layout<sg_layout = [2, 4], sg_data = [12, 8], lane_layout = [2, 8], lane_data = [1, 1]>}> : (!xegpu.tensor_desc<24x32xi32>) -> vector<24x32xi32>
      %14 = "xegpu.load_nd"(%10) <{const_offsets = array<i64: 0, 0>, layout = #xegpu.layout<sg_layout = [2, 4], sg_data = [12, 8], lane_layout = [2, 8], lane_data = [1, 1]>}> : (!xegpu.tensor_desc<24x32xi32>) -> vector<24x32xi32>
      %15 = "arith.cmpf"(%11, %12) <{fastmath = #arith.fastmath<none>, predicate = 11 : i64}> : (vector<24x32xf32>, vector<24x32xf32>) -> vector<24x32xi1>
      %16 = "arith.cmpi"(%13, %14) <{predicate = 0 : i64}> : (vector<24x32xi32>, vector<24x32xi32>) -> vector<24x32xi1>
      %17 = "arith.select"(%16, %16, %15) : (vector<24x32xi1>, vector<24x32xi1>, vector<24x32xi1>) -> vector<24x32xi1>
      %18 = "xegpu.convert_layout"(%17) <{input_layout = #xegpu.layout<sg_layout = [2, 4], sg_data = [12, 8], lane_layout = [2, 8], lane_data = [1, 1]>, target_layout = #xegpu.layout<sg_layout = [2, 4], sg_data = [12, 8], lane_layout = [2, 8], lane_data = [1, 1]>}> : (vector<24x32xi1>) -> vector<24x32xi1>
      "gpu.return"() : () -> ()
    }) {sym_name = "comparison_ops"} : () -> ()
    "gpu.func"() <{function_type = (memref<24x32xf32>, memref<24x32xf32>) -> ()}> ({
    ^bb0(%arg0: memref<24x32xf32>, %arg1: memref<24x32xf32>):
      %0 = "xegpu.create_nd_tdesc"(%arg0) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<24x32xf32>) -> !xegpu.tensor_desc<24x32xf32>
      %1 = "xegpu.create_nd_tdesc"(%arg1) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<24x32xf32>) -> !xegpu.tensor_desc<24x32xf32>
      %2 = "xegpu.load_nd"(%0) <{const_offsets = array<i64: 0, 0>, layout = #xegpu.layout<sg_layout = [4, 4], sg_data = [2, 2], lane_layout = [2, 2], lane_data = [1, 1]>}> : (!xegpu.tensor_desc<24x32xf32>) -> vector<24x32xf32>
      %3 = "xegpu.load_nd"(%1) <{const_offsets = array<i64: 0, 0>, layout = #xegpu.layout<sg_layout = [4, 4], sg_data = [2, 2], lane_layout = [2, 2], lane_data = [1, 1]>}> : (!xegpu.tensor_desc<24x32xf32>) -> vector<24x32xf32>
      %4 = "arith.negf"(%2) <{fastmath = #arith.fastmath<none>}> : (vector<24x32xf32>) -> vector<24x32xf32>
      %5 = "math.powf"(%4, %3) <{fastmath = #arith.fastmath<none>}> : (vector<24x32xf32>, vector<24x32xf32>) -> vector<24x32xf32>
      %6 = "xegpu.convert_layout"(%5) <{input_layout = #xegpu.layout<sg_layout = [4, 4], sg_data = [2, 2], lane_layout = [2, 2], lane_data = [1, 1]>, target_layout = #xegpu.layout<sg_layout = [4, 4], sg_data = [2, 2], lane_layout = [2, 2], lane_data = [1, 1]>}> : (vector<24x32xf32>) -> vector<24x32xf32>
      "gpu.return"() : () -> ()
    }) {sym_name = "elementwise_ops_rr_assignment"} : () -> ()
  }) : () -> ()
}) : () -> ()

