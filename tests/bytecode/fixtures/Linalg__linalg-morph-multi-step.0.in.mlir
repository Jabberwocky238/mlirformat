"builtin.module"() ({
  "func.func"() <{function_type = (tensor<16x8xf32>, tensor<16x8xf32>) -> tensor<16x8xf32>, sym_name = "unary_ops"}> ({
  ^bb0(%arg0: tensor<16x8xf32> loc("<stdin>":3:8), %arg1: tensor<16x8xf32> loc("<stdin>":3:33)):
    %0 = "linalg.exp"(%arg0, %arg1) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg26: f32 loc("<stdin>":5:10), %arg27: f32 loc("<stdin>":5:23)):
      %26 = "math.exp"(%arg26) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32 loc("<stdin>":6:13)
      "linalg.yield"(%26) : (f32) -> () loc("<stdin>":7:7)
    }) : (tensor<16x8xf32>, tensor<16x8xf32>) -> tensor<16x8xf32> loc("<stdin>":4:10)
    %1 = "linalg.log"(%0, %arg1) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg24: f32 loc("<stdin>":10:10), %arg25: f32 loc("<stdin>":10:23)):
      %25 = "math.log"(%arg24) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32 loc("<stdin>":11:13)
      "linalg.yield"(%25) : (f32) -> () loc("<stdin>":12:7)
    }) : (tensor<16x8xf32>, tensor<16x8xf32>) -> tensor<16x8xf32> loc("<stdin>":9:10)
    %2 = "linalg.abs"(%1, %arg1) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg22: f32 loc("<stdin>":15:10), %arg23: f32 loc("<stdin>":15:23)):
      %24 = "math.absf"(%arg22) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32 loc("<stdin>":16:13)
      "linalg.yield"(%24) : (f32) -> () loc("<stdin>":17:7)
    }) : (tensor<16x8xf32>, tensor<16x8xf32>) -> tensor<16x8xf32> loc("<stdin>":14:10)
    %3 = "linalg.ceil"(%2, %arg1) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg20: f32 loc("<stdin>":20:10), %arg21: f32 loc("<stdin>":20:23)):
      %23 = "math.ceil"(%arg20) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32 loc("<stdin>":21:13)
      "linalg.yield"(%23) : (f32) -> () loc("<stdin>":22:7)
    }) : (tensor<16x8xf32>, tensor<16x8xf32>) -> tensor<16x8xf32> loc("<stdin>":19:10)
    %4 = "linalg.floor"(%3, %arg1) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg18: f32 loc("<stdin>":25:10), %arg19: f32 loc("<stdin>":25:23)):
      %22 = "math.floor"(%arg18) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32 loc("<stdin>":26:13)
      "linalg.yield"(%22) : (f32) -> () loc("<stdin>":27:7)
    }) : (tensor<16x8xf32>, tensor<16x8xf32>) -> tensor<16x8xf32> loc("<stdin>":24:10)
    %5 = "linalg.negf"(%4, %arg1) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg16: f32 loc("<stdin>":30:10), %arg17: f32 loc("<stdin>":30:23)):
      %21 = "arith.negf"(%arg16) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32 loc("<stdin>":31:13)
      "linalg.yield"(%21) : (f32) -> () loc("<stdin>":32:7)
    }) : (tensor<16x8xf32>, tensor<16x8xf32>) -> tensor<16x8xf32> loc("<stdin>":29:10)
    %6 = "linalg.reciprocal"(%5, %arg1) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg14: f32 loc("<stdin>":35:10), %arg15: f32 loc("<stdin>":35:23)):
      %19 = "arith.constant"() <{value = 1.000000e+00 : f32}> : () -> f32 loc("<stdin>":36:13)
      %20 = "arith.divf"(%19, %arg14) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":37:13)
      "linalg.yield"(%20) : (f32) -> () loc("<stdin>":38:7)
    }) : (tensor<16x8xf32>, tensor<16x8xf32>) -> tensor<16x8xf32> loc("<stdin>":34:10)
    %7 = "linalg.round"(%6, %arg1) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg12: f32 loc("<stdin>":41:10), %arg13: f32 loc("<stdin>":41:23)):
      %18 = "math.round"(%arg12) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32 loc("<stdin>":42:13)
      "linalg.yield"(%18) : (f32) -> () loc("<stdin>":43:7)
    }) : (tensor<16x8xf32>, tensor<16x8xf32>) -> tensor<16x8xf32> loc("<stdin>":40:10)
    %8 = "linalg.sqrt"(%7, %arg1) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg10: f32 loc("<stdin>":46:10), %arg11: f32 loc("<stdin>":46:23)):
      %17 = "math.sqrt"(%arg10) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32 loc("<stdin>":47:13)
      "linalg.yield"(%17) : (f32) -> () loc("<stdin>":48:7)
    }) : (tensor<16x8xf32>, tensor<16x8xf32>) -> tensor<16x8xf32> loc("<stdin>":45:10)
    %9 = "linalg.rsqrt"(%8, %arg1) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg8: f32 loc("<stdin>":51:10), %arg9: f32 loc("<stdin>":51:22)):
      %16 = "math.rsqrt"(%arg8) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32 loc("<stdin>":52:13)
      "linalg.yield"(%16) : (f32) -> () loc("<stdin>":53:7)
    }) : (tensor<16x8xf32>, tensor<16x8xf32>) -> tensor<16x8xf32> loc("<stdin>":50:10)
    %10 = "linalg.square"(%9, %arg1) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg6: f32 loc("<stdin>":56:10), %arg7: f32 loc("<stdin>":56:22)):
      %15 = "arith.mulf"(%arg6, %arg6) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":57:13)
      "linalg.yield"(%15) : (f32) -> () loc("<stdin>":58:7)
    }) : (tensor<16x8xf32>, tensor<16x8xf32>) -> tensor<16x8xf32> loc("<stdin>":55:11)
    %11 = "linalg.tanh"(%10, %arg1) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg4: f32 loc("<stdin>":61:10), %arg5: f32 loc("<stdin>":61:22)):
      %14 = "math.tanh"(%arg4) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32 loc("<stdin>":62:13)
      "linalg.yield"(%14) : (f32) -> () loc("<stdin>":63:7)
    }) : (tensor<16x8xf32>, tensor<16x8xf32>) -> tensor<16x8xf32> loc("<stdin>":60:11)
    %12 = "linalg.erf"(%11, %arg1) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg2: f32 loc("<stdin>":66:10), %arg3: f32 loc("<stdin>":66:22)):
      %13 = "math.erf"(%arg2) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32 loc("<stdin>":67:13)
      "linalg.yield"(%13) : (f32) -> () loc("<stdin>":68:7)
    }) : (tensor<16x8xf32>, tensor<16x8xf32>) -> tensor<16x8xf32> loc("<stdin>":65:11)
    "func.return"(%12) : (tensor<16x8xf32>) -> () loc("<stdin>":70:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
