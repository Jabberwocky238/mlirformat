"builtin.module"() ({
  "gpu.module"() <{sym_name = "test_elementwise_ops"}> ({
    "gpu.func"() <{function_type = (memref<24x32xf32>) -> ()}> ({
    ^bb0(%arg14: memref<24x32xf32> loc("<stdin>":4:10)):
      %47 = "xegpu.create_nd_tdesc"(%arg14) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<24x32xf32>) -> !xegpu.tensor_desc<24x32xf32> loc("<stdin>":5:13)
      %48 = "xegpu.load_nd"(%47) <{const_offsets = array<i64: 0, 0>, layout = #xegpu.layout<sg_layout = [2, 4], sg_data = [12, 8]>}> : (!xegpu.tensor_desc<24x32xf32>) -> vector<24x32xf32> loc("<stdin>":6:13)
      %49 = "math.exp"(%48) <{fastmath = #arith.fastmath<none>}> : (vector<24x32xf32>) -> vector<24x32xf32> loc("<stdin>":7:13)
      %50 = "arith.negf"(%49) <{fastmath = #arith.fastmath<none>}> : (vector<24x32xf32>) -> vector<24x32xf32> loc("<stdin>":8:13)
      %51 = "xegpu.convert_layout"(%50) <{input_layout = #xegpu.layout<sg_layout = [2, 4], sg_data = [12, 8]>, target_layout = #xegpu.layout<sg_layout = [2, 4], sg_data = [12, 8]>}> : (vector<24x32xf32>) -> vector<24x32xf32> loc("<stdin>":9:13)
      "gpu.return"() : () -> () loc("<stdin>":10:7)
    }) {sym_name = "unary_ops_sg_layout_only"} : () -> () loc("<stdin>":3:5)
    "gpu.func"() <{function_type = (memref<24x32xf32>) -> ()}> ({
    ^bb0(%arg13: memref<24x32xf32> loc("<stdin>":13:10)):
      %42 = "xegpu.create_nd_tdesc"(%arg13) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<24x32xf32>) -> !xegpu.tensor_desc<24x32xf32> loc("<stdin>":14:13)
      %43 = "xegpu.load_nd"(%42) <{const_offsets = array<i64: 0, 0>, layout = #xegpu.layout<sg_layout = [2, 4], sg_data = [12, 8], lane_layout = [2, 8], lane_data = [1, 1]>}> : (!xegpu.tensor_desc<24x32xf32>) -> vector<24x32xf32> loc("<stdin>":15:13)
      %44 = "math.exp"(%43) <{fastmath = #arith.fastmath<none>}> : (vector<24x32xf32>) -> vector<24x32xf32> loc("<stdin>":16:13)
      %45 = "arith.negf"(%44) <{fastmath = #arith.fastmath<none>}> : (vector<24x32xf32>) -> vector<24x32xf32> loc("<stdin>":17:13)
      %46 = "xegpu.convert_layout"(%45) <{input_layout = #xegpu.layout<sg_layout = [2, 4], sg_data = [12, 8], lane_layout = [2, 8], lane_data = [1, 1]>, target_layout = #xegpu.layout<sg_layout = [2, 4], sg_data = [12, 8], lane_layout = [2, 8], lane_data = [1, 1]>}> : (vector<24x32xf32>) -> vector<24x32xf32> loc("<stdin>":18:13)
      "gpu.return"() : () -> () loc("<stdin>":19:7)
    }) {sym_name = "unary_ops"} : () -> () loc("<stdin>":12:5)
    "gpu.func"() <{function_type = (memref<24x32xf32>, memref<24x32xf32>) -> ()}> ({
    ^bb0(%arg11: memref<24x32xf32> loc("<stdin>":22:10), %arg12: memref<24x32xf32> loc("<stdin>":22:37)):
      %35 = "xegpu.create_nd_tdesc"(%arg11) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<24x32xf32>) -> !xegpu.tensor_desc<24x32xf32> loc("<stdin>":23:13)
      %36 = "xegpu.create_nd_tdesc"(%arg12) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<24x32xf32>) -> !xegpu.tensor_desc<24x32xf32> loc("<stdin>":24:13)
      %37 = "xegpu.load_nd"(%35) <{const_offsets = array<i64: 0, 0>, layout = #xegpu.layout<sg_layout = [2, 4], sg_data = [12, 8], lane_layout = [2, 8], lane_data = [1, 1]>}> : (!xegpu.tensor_desc<24x32xf32>) -> vector<24x32xf32> loc("<stdin>":25:13)
      %38 = "xegpu.load_nd"(%36) <{const_offsets = array<i64: 0, 0>, layout = #xegpu.layout<sg_layout = [2, 4], sg_data = [12, 8], lane_layout = [2, 8], lane_data = [1, 1]>}> : (!xegpu.tensor_desc<24x32xf32>) -> vector<24x32xf32> loc("<stdin>":26:13)
      %39 = "arith.addf"(%37, %38) <{fastmath = #arith.fastmath<none>}> : (vector<24x32xf32>, vector<24x32xf32>) -> vector<24x32xf32> loc("<stdin>":27:13)
      %40 = "math.powf"(%39, %38) <{fastmath = #arith.fastmath<none>}> : (vector<24x32xf32>, vector<24x32xf32>) -> vector<24x32xf32> loc("<stdin>":28:13)
      %41 = "xegpu.convert_layout"(%40) <{input_layout = #xegpu.layout<sg_layout = [2, 4], sg_data = [12, 8], lane_layout = [2, 8], lane_data = [1, 1]>, target_layout = #xegpu.layout<sg_layout = [2, 4], sg_data = [12, 8], lane_layout = [2, 8], lane_data = [1, 1]>}> : (vector<24x32xf32>) -> vector<24x32xf32> loc("<stdin>":29:13)
      "gpu.return"() : () -> () loc("<stdin>":30:7)
    }) {sym_name = "binary_ops"} : () -> () loc("<stdin>":21:5)
    "gpu.func"() <{function_type = (memref<24x32xf32>, memref<24x32xf32>, memref<24x32xi1>) -> ()}> ({
    ^bb0(%arg8: memref<24x32xf32> loc("<stdin>":33:10), %arg9: memref<24x32xf32> loc("<stdin>":33:36), %arg10: memref<24x32xi1> loc("<stdin>":33:62)):
      %26 = "xegpu.create_nd_tdesc"(%arg8) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<24x32xf32>) -> !xegpu.tensor_desc<24x32xf32> loc("<stdin>":34:13)
      %27 = "xegpu.create_nd_tdesc"(%arg9) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<24x32xf32>) -> !xegpu.tensor_desc<24x32xf32> loc("<stdin>":35:13)
      %28 = "xegpu.create_nd_tdesc"(%arg10) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<24x32xi1>) -> !xegpu.tensor_desc<24x32xi1> loc("<stdin>":36:13)
      %29 = "xegpu.load_nd"(%26) <{const_offsets = array<i64: 0, 0>, layout = #xegpu.layout<sg_layout = [2, 4], sg_data = [12, 8], lane_layout = [2, 8], lane_data = [1, 1]>}> : (!xegpu.tensor_desc<24x32xf32>) -> vector<24x32xf32> loc("<stdin>":37:13)
      %30 = "xegpu.load_nd"(%27) <{const_offsets = array<i64: 0, 0>, layout = #xegpu.layout<sg_layout = [2, 4], sg_data = [12, 8], lane_layout = [2, 8], lane_data = [1, 1]>}> : (!xegpu.tensor_desc<24x32xf32>) -> vector<24x32xf32> loc("<stdin>":38:13)
      %31 = "xegpu.load_nd"(%28) <{const_offsets = array<i64: 0, 0>, layout = #xegpu.layout<sg_layout = [2, 4], sg_data = [12, 8], lane_layout = [2, 8], lane_data = [1, 1]>}> : (!xegpu.tensor_desc<24x32xi1>) -> vector<24x32xi1> loc("<stdin>":39:13)
      %32 = "arith.select"(%31, %29, %30) : (vector<24x32xi1>, vector<24x32xf32>, vector<24x32xf32>) -> vector<24x32xf32> loc("<stdin>":40:13)
      %33 = "math.fma"(%29, %30, %32) <{fastmath = #arith.fastmath<none>}> : (vector<24x32xf32>, vector<24x32xf32>, vector<24x32xf32>) -> vector<24x32xf32> loc("<stdin>":41:13)
      %34 = "xegpu.convert_layout"(%33) <{input_layout = #xegpu.layout<sg_layout = [2, 4], sg_data = [12, 8], lane_layout = [2, 8], lane_data = [1, 1]>, target_layout = #xegpu.layout<sg_layout = [2, 4], sg_data = [12, 8], lane_layout = [2, 8], lane_data = [1, 1]>}> : (vector<24x32xf32>) -> vector<24x32xf32> loc("<stdin>":42:13)
      "gpu.return"() : () -> () loc("<stdin>":43:7)
    }) {sym_name = "ternary_ops"} : () -> () loc("<stdin>":32:5)
    "gpu.func"() <{function_type = (memref<24x32xf32>, memref<24x32xi32>) -> ()}> ({
    ^bb0(%arg6: memref<24x32xf32> loc("<stdin>":46:10), %arg7: memref<24x32xi32> loc("<stdin>":46:36)):
      %19 = "xegpu.create_nd_tdesc"(%arg6) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<24x32xf32>) -> !xegpu.tensor_desc<24x32xf32> loc("<stdin>":47:13)
      %20 = "xegpu.create_nd_tdesc"(%arg7) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<24x32xi32>) -> !xegpu.tensor_desc<24x32xi32> loc("<stdin>":48:13)
      %21 = "xegpu.load_nd"(%19) <{const_offsets = array<i64: 0, 0>, layout = #xegpu.layout<sg_layout = [2, 4], sg_data = [12, 8], lane_layout = [2, 8], lane_data = [1, 1]>}> : (!xegpu.tensor_desc<24x32xf32>) -> vector<24x32xf32> loc("<stdin>":49:13)
      %22 = "xegpu.load_nd"(%20) <{const_offsets = array<i64: 0, 0>, layout = #xegpu.layout<sg_layout = [2, 4], sg_data = [12, 8], lane_layout = [2, 8], lane_data = [1, 1]>}> : (!xegpu.tensor_desc<24x32xi32>) -> vector<24x32xi32> loc("<stdin>":50:13)
      %23 = "arith.truncf"(%21) : (vector<24x32xf32>) -> vector<24x32xf16> loc("<stdin>":51:13)
      %24 = "arith.bitcast"(%23) : (vector<24x32xf16>) -> vector<24x32xi16> loc("<stdin>":52:13)
      %25 = "xegpu.convert_layout"(%24) <{input_layout = #xegpu.layout<sg_layout = [2, 4], sg_data = [12, 8], lane_layout = [2, 8], lane_data = [1, 1]>, target_layout = #xegpu.layout<sg_layout = [2, 4], sg_data = [12, 8], lane_layout = [2, 8], lane_data = [1, 1]>}> : (vector<24x32xi16>) -> vector<24x32xi16> loc("<stdin>":53:13)
      "gpu.return"() : () -> () loc("<stdin>":54:7)
    }) {sym_name = "type_conversion_ops"} : () -> () loc("<stdin>":45:5)
    "gpu.func"() <{function_type = (memref<24x32xf32>, memref<24x32xf32>, memref<24x32xi32>, memref<24x32xi32>) -> ()}> ({
    ^bb0(%arg2: memref<24x32xf32> loc("<stdin>":57:10), %arg3: memref<24x32xf32> loc("<stdin>":57:36), %arg4: memref<24x32xi32> loc("<stdin>":57:62), %arg5: memref<24x32xi32> loc("<stdin>":57:88)):
      %7 = "xegpu.create_nd_tdesc"(%arg2) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<24x32xf32>) -> !xegpu.tensor_desc<24x32xf32> loc("<stdin>":58:12)
      %8 = "xegpu.create_nd_tdesc"(%arg3) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<24x32xf32>) -> !xegpu.tensor_desc<24x32xf32> loc("<stdin>":59:12)
      %9 = "xegpu.create_nd_tdesc"(%arg4) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<24x32xi32>) -> !xegpu.tensor_desc<24x32xi32> loc("<stdin>":60:12)
      %10 = "xegpu.create_nd_tdesc"(%arg5) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<24x32xi32>) -> !xegpu.tensor_desc<24x32xi32> loc("<stdin>":61:13)
      %11 = "xegpu.load_nd"(%7) <{const_offsets = array<i64: 0, 0>, layout = #xegpu.layout<sg_layout = [2, 4], sg_data = [12, 8], lane_layout = [2, 8], lane_data = [1, 1]>}> : (!xegpu.tensor_desc<24x32xf32>) -> vector<24x32xf32> loc("<stdin>":62:13)
      %12 = "xegpu.load_nd"(%8) <{const_offsets = array<i64: 0, 0>, layout = #xegpu.layout<sg_layout = [2, 4], sg_data = [12, 8], lane_layout = [2, 8], lane_data = [1, 1]>}> : (!xegpu.tensor_desc<24x32xf32>) -> vector<24x32xf32> loc("<stdin>":63:13)
      %13 = "xegpu.load_nd"(%9) <{const_offsets = array<i64: 0, 0>, layout = #xegpu.layout<sg_layout = [2, 4], sg_data = [12, 8], lane_layout = [2, 8], lane_data = [1, 1]>}> : (!xegpu.tensor_desc<24x32xi32>) -> vector<24x32xi32> loc("<stdin>":64:13)
      %14 = "xegpu.load_nd"(%10) <{const_offsets = array<i64: 0, 0>, layout = #xegpu.layout<sg_layout = [2, 4], sg_data = [12, 8], lane_layout = [2, 8], lane_data = [1, 1]>}> : (!xegpu.tensor_desc<24x32xi32>) -> vector<24x32xi32> loc("<stdin>":65:13)
      %15 = "arith.cmpf"(%11, %12) <{fastmath = #arith.fastmath<none>, predicate = 11 : i64}> : (vector<24x32xf32>, vector<24x32xf32>) -> vector<24x32xi1> loc("<stdin>":66:13)
      %16 = "arith.cmpi"(%13, %14) <{predicate = 0 : i64}> : (vector<24x32xi32>, vector<24x32xi32>) -> vector<24x32xi1> loc("<stdin>":67:13)
      %17 = "arith.select"(%16, %16, %15) : (vector<24x32xi1>, vector<24x32xi1>, vector<24x32xi1>) -> vector<24x32xi1> loc("<stdin>":68:13)
      %18 = "xegpu.convert_layout"(%17) <{input_layout = #xegpu.layout<sg_layout = [2, 4], sg_data = [12, 8], lane_layout = [2, 8], lane_data = [1, 1]>, target_layout = #xegpu.layout<sg_layout = [2, 4], sg_data = [12, 8], lane_layout = [2, 8], lane_data = [1, 1]>}> : (vector<24x32xi1>) -> vector<24x32xi1> loc("<stdin>":69:13)
      "gpu.return"() : () -> () loc("<stdin>":70:7)
    }) {sym_name = "comparison_ops"} : () -> () loc("<stdin>":56:5)
    "gpu.func"() <{function_type = (memref<24x32xf32>, memref<24x32xf32>) -> ()}> ({
    ^bb0(%arg0: memref<24x32xf32> loc("<stdin>":73:10), %arg1: memref<24x32xf32> loc("<stdin>":73:36)):
      %0 = "xegpu.create_nd_tdesc"(%arg0) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<24x32xf32>) -> !xegpu.tensor_desc<24x32xf32> loc("<stdin>":74:12)
      %1 = "xegpu.create_nd_tdesc"(%arg1) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<24x32xf32>) -> !xegpu.tensor_desc<24x32xf32> loc("<stdin>":75:12)
      %2 = "xegpu.load_nd"(%0) <{const_offsets = array<i64: 0, 0>, layout = #xegpu.layout<sg_layout = [4, 4], sg_data = [2, 2], lane_layout = [2, 2], lane_data = [1, 1]>}> : (!xegpu.tensor_desc<24x32xf32>) -> vector<24x32xf32> loc("<stdin>":76:12)
      %3 = "xegpu.load_nd"(%1) <{const_offsets = array<i64: 0, 0>, layout = #xegpu.layout<sg_layout = [4, 4], sg_data = [2, 2], lane_layout = [2, 2], lane_data = [1, 1]>}> : (!xegpu.tensor_desc<24x32xf32>) -> vector<24x32xf32> loc("<stdin>":77:12)
      %4 = "arith.negf"(%2) <{fastmath = #arith.fastmath<none>}> : (vector<24x32xf32>) -> vector<24x32xf32> loc("<stdin>":78:12)
      %5 = "math.powf"(%4, %3) <{fastmath = #arith.fastmath<none>}> : (vector<24x32xf32>, vector<24x32xf32>) -> vector<24x32xf32> loc("<stdin>":79:12)
      %6 = "xegpu.convert_layout"(%5) <{input_layout = #xegpu.layout<sg_layout = [4, 4], sg_data = [2, 2], lane_layout = [2, 2], lane_data = [1, 1]>, target_layout = #xegpu.layout<sg_layout = [4, 4], sg_data = [2, 2], lane_layout = [2, 2], lane_data = [1, 1]>}> : (vector<24x32xf32>) -> vector<24x32xf32> loc("<stdin>":80:12)
      "gpu.return"() : () -> () loc("<stdin>":81:7)
    }) {sym_name = "elementwise_ops_rr_assignment"} : () -> () loc("<stdin>":72:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
