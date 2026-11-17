"builtin.module"() ({
  "func.func"() <{function_type = (memref<7x14x21xf32>, memref<7x14x21xf32>) -> (), sym_name = "unary_ops"}> ({
  ^bb0(%arg0: memref<7x14x21xf32> loc("<stdin>":3:8), %arg1: memref<7x14x21xf32> loc("<stdin>":3:36)):
    "linalg.exp"(%arg0, %arg1) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg26: f32 loc("<stdin>":5:10), %arg27: f32 loc("<stdin>":5:23)):
      %13 = "math.exp"(%arg26) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32 loc("<stdin>":6:13)
      "linalg.yield"(%13) : (f32) -> () loc("<stdin>":7:7)
    }) : (memref<7x14x21xf32>, memref<7x14x21xf32>) -> () loc("<stdin>":4:5)
    "linalg.log"(%arg0, %arg1) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg24: f32 loc("<stdin>":10:10), %arg25: f32 loc("<stdin>":10:23)):
      %12 = "math.log"(%arg24) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32 loc("<stdin>":11:13)
      "linalg.yield"(%12) : (f32) -> () loc("<stdin>":12:7)
    }) : (memref<7x14x21xf32>, memref<7x14x21xf32>) -> () loc("<stdin>":9:5)
    "linalg.abs"(%arg0, %arg1) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg22: f32 loc("<stdin>":15:10), %arg23: f32 loc("<stdin>":15:23)):
      %11 = "math.absf"(%arg22) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32 loc("<stdin>":16:13)
      "linalg.yield"(%11) : (f32) -> () loc("<stdin>":17:7)
    }) : (memref<7x14x21xf32>, memref<7x14x21xf32>) -> () loc("<stdin>":14:5)
    "linalg.ceil"(%arg0, %arg1) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg20: f32 loc("<stdin>":20:10), %arg21: f32 loc("<stdin>":20:23)):
      %10 = "math.ceil"(%arg20) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32 loc("<stdin>":21:13)
      "linalg.yield"(%10) : (f32) -> () loc("<stdin>":22:7)
    }) : (memref<7x14x21xf32>, memref<7x14x21xf32>) -> () loc("<stdin>":19:5)
    "linalg.floor"(%arg0, %arg1) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg18: f32 loc("<stdin>":25:10), %arg19: f32 loc("<stdin>":25:23)):
      %9 = "math.floor"(%arg18) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32 loc("<stdin>":26:12)
      "linalg.yield"(%9) : (f32) -> () loc("<stdin>":27:7)
    }) : (memref<7x14x21xf32>, memref<7x14x21xf32>) -> () loc("<stdin>":24:5)
    "linalg.negf"(%arg0, %arg1) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg16: f32 loc("<stdin>":30:10), %arg17: f32 loc("<stdin>":30:23)):
      %8 = "arith.negf"(%arg16) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32 loc("<stdin>":31:12)
      "linalg.yield"(%8) : (f32) -> () loc("<stdin>":32:7)
    }) : (memref<7x14x21xf32>, memref<7x14x21xf32>) -> () loc("<stdin>":29:5)
    "linalg.reciprocal"(%arg0, %arg1) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg14: f32 loc("<stdin>":35:10), %arg15: f32 loc("<stdin>":35:23)):
      %6 = "arith.constant"() <{value = 1.000000e+00 : f32}> : () -> f32 loc("<stdin>":36:12)
      %7 = "arith.divf"(%6, %arg14) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":37:12)
      "linalg.yield"(%7) : (f32) -> () loc("<stdin>":38:7)
    }) : (memref<7x14x21xf32>, memref<7x14x21xf32>) -> () loc("<stdin>":34:5)
    "linalg.round"(%arg0, %arg1) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg12: f32 loc("<stdin>":41:10), %arg13: f32 loc("<stdin>":41:23)):
      %5 = "math.round"(%arg12) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32 loc("<stdin>":42:12)
      "linalg.yield"(%5) : (f32) -> () loc("<stdin>":43:7)
    }) : (memref<7x14x21xf32>, memref<7x14x21xf32>) -> () loc("<stdin>":40:5)
    "linalg.sqrt"(%arg0, %arg1) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg10: f32 loc("<stdin>":46:10), %arg11: f32 loc("<stdin>":46:23)):
      %4 = "math.sqrt"(%arg10) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32 loc("<stdin>":47:12)
      "linalg.yield"(%4) : (f32) -> () loc("<stdin>":48:7)
    }) : (memref<7x14x21xf32>, memref<7x14x21xf32>) -> () loc("<stdin>":45:5)
    "linalg.rsqrt"(%arg0, %arg1) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg8: f32 loc("<stdin>":51:10), %arg9: f32 loc("<stdin>":51:22)):
      %3 = "math.rsqrt"(%arg8) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32 loc("<stdin>":52:12)
      "linalg.yield"(%3) : (f32) -> () loc("<stdin>":53:7)
    }) : (memref<7x14x21xf32>, memref<7x14x21xf32>) -> () loc("<stdin>":50:5)
    "linalg.square"(%arg0, %arg1) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg6: f32 loc("<stdin>":56:10), %arg7: f32 loc("<stdin>":56:22)):
      %2 = "arith.mulf"(%arg6, %arg6) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":57:12)
      "linalg.yield"(%2) : (f32) -> () loc("<stdin>":58:7)
    }) : (memref<7x14x21xf32>, memref<7x14x21xf32>) -> () loc("<stdin>":55:5)
    "linalg.tanh"(%arg0, %arg1) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg4: f32 loc("<stdin>":61:10), %arg5: f32 loc("<stdin>":61:22)):
      %1 = "math.tanh"(%arg4) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32 loc("<stdin>":62:12)
      "linalg.yield"(%1) : (f32) -> () loc("<stdin>":63:7)
    }) : (memref<7x14x21xf32>, memref<7x14x21xf32>) -> () loc("<stdin>":60:5)
    "linalg.erf"(%arg0, %arg1) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg2: f32 loc("<stdin>":66:10), %arg3: f32 loc("<stdin>":66:22)):
      %0 = "math.erf"(%arg2) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32 loc("<stdin>":67:12)
      "linalg.yield"(%0) : (f32) -> () loc("<stdin>":68:7)
    }) : (memref<7x14x21xf32>, memref<7x14x21xf32>) -> () loc("<stdin>":65:5)
    "func.return"() : () -> () loc("<stdin>":70:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
