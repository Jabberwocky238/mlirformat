"builtin.module"() ({
  "func.func"() <{function_type = (tensor<16x8xf32>, tensor<16x8xf32>) -> tensor<16x8xf32>, sym_name = "unary_ops"}> ({
  ^bb0(%arg0: tensor<16x8xf32> loc("<stdin>":4:8), %arg1: tensor<16x8xf32> loc("<stdin>":4:33)):
    %0 = "linalg.elementwise"(%arg0, %arg1) <{indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>], kind = #linalg.elementwise_kind<exp>, operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg26: f32 loc("<stdin>":6:10), %arg27: f32 loc("<stdin>":6:23)):
      %26 = "math.exp"(%arg26) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32 loc("<stdin>":7:13)
      "linalg.yield"(%26) : (f32) -> () loc("<stdin>":8:7)
    }) : (tensor<16x8xf32>, tensor<16x8xf32>) -> tensor<16x8xf32> loc("<stdin>":5:10)
    %1 = "linalg.elementwise"(%0, %arg1) <{indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>], kind = #linalg.elementwise_kind<log>, operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg24: f32 loc("<stdin>":11:10), %arg25: f32 loc("<stdin>":11:23)):
      %25 = "math.log"(%arg24) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32 loc("<stdin>":12:13)
      "linalg.yield"(%25) : (f32) -> () loc("<stdin>":13:7)
    }) : (tensor<16x8xf32>, tensor<16x8xf32>) -> tensor<16x8xf32> loc("<stdin>":10:10)
    %2 = "linalg.elementwise"(%1, %arg1) <{indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>], kind = #linalg.elementwise_kind<abs>, operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg22: f32 loc("<stdin>":16:10), %arg23: f32 loc("<stdin>":16:23)):
      %24 = "math.absf"(%arg22) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32 loc("<stdin>":17:13)
      "linalg.yield"(%24) : (f32) -> () loc("<stdin>":18:7)
    }) : (tensor<16x8xf32>, tensor<16x8xf32>) -> tensor<16x8xf32> loc("<stdin>":15:10)
    %3 = "linalg.elementwise"(%2, %arg1) <{indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>], kind = #linalg.elementwise_kind<ceil>, operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg20: f32 loc("<stdin>":21:10), %arg21: f32 loc("<stdin>":21:23)):
      %23 = "math.ceil"(%arg20) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32 loc("<stdin>":22:13)
      "linalg.yield"(%23) : (f32) -> () loc("<stdin>":23:7)
    }) : (tensor<16x8xf32>, tensor<16x8xf32>) -> tensor<16x8xf32> loc("<stdin>":20:10)
    %4 = "linalg.elementwise"(%3, %arg1) <{indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>], kind = #linalg.elementwise_kind<floor>, operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg18: f32 loc("<stdin>":26:10), %arg19: f32 loc("<stdin>":26:23)):
      %22 = "math.floor"(%arg18) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32 loc("<stdin>":27:13)
      "linalg.yield"(%22) : (f32) -> () loc("<stdin>":28:7)
    }) : (tensor<16x8xf32>, tensor<16x8xf32>) -> tensor<16x8xf32> loc("<stdin>":25:10)
    %5 = "linalg.elementwise"(%4, %arg1) <{indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>], kind = #linalg.elementwise_kind<negf>, operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg16: f32 loc("<stdin>":31:10), %arg17: f32 loc("<stdin>":31:23)):
      %21 = "arith.negf"(%arg16) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32 loc("<stdin>":32:13)
      "linalg.yield"(%21) : (f32) -> () loc("<stdin>":33:7)
    }) : (tensor<16x8xf32>, tensor<16x8xf32>) -> tensor<16x8xf32> loc("<stdin>":30:10)
    %6 = "linalg.elementwise"(%5, %arg1) <{indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>], kind = #linalg.elementwise_kind<reciprocal>, operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg14: f32 loc("<stdin>":36:10), %arg15: f32 loc("<stdin>":36:23)):
      %19 = "arith.constant"() <{value = 1.000000e+00 : f32}> : () -> f32 loc("<stdin>":37:13)
      %20 = "arith.divf"(%19, %arg14) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":38:13)
      "linalg.yield"(%20) : (f32) -> () loc("<stdin>":39:7)
    }) : (tensor<16x8xf32>, tensor<16x8xf32>) -> tensor<16x8xf32> loc("<stdin>":35:10)
    %7 = "linalg.elementwise"(%6, %arg1) <{indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>], kind = #linalg.elementwise_kind<round>, operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg12: f32 loc("<stdin>":42:10), %arg13: f32 loc("<stdin>":42:23)):
      %18 = "math.round"(%arg12) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32 loc("<stdin>":43:13)
      "linalg.yield"(%18) : (f32) -> () loc("<stdin>":44:7)
    }) : (tensor<16x8xf32>, tensor<16x8xf32>) -> tensor<16x8xf32> loc("<stdin>":41:10)
    %8 = "linalg.elementwise"(%7, %arg1) <{indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>], kind = #linalg.elementwise_kind<sqrt>, operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg10: f32 loc("<stdin>":47:10), %arg11: f32 loc("<stdin>":47:23)):
      %17 = "math.sqrt"(%arg10) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32 loc("<stdin>":48:13)
      "linalg.yield"(%17) : (f32) -> () loc("<stdin>":49:7)
    }) : (tensor<16x8xf32>, tensor<16x8xf32>) -> tensor<16x8xf32> loc("<stdin>":46:10)
    %9 = "linalg.elementwise"(%8, %arg1) <{indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>], kind = #linalg.elementwise_kind<rsqrt>, operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg8: f32 loc("<stdin>":52:10), %arg9: f32 loc("<stdin>":52:22)):
      %16 = "math.rsqrt"(%arg8) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32 loc("<stdin>":53:13)
      "linalg.yield"(%16) : (f32) -> () loc("<stdin>":54:7)
    }) : (tensor<16x8xf32>, tensor<16x8xf32>) -> tensor<16x8xf32> loc("<stdin>":51:10)
    %10 = "linalg.elementwise"(%9, %arg1) <{indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>], kind = #linalg.elementwise_kind<square>, operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg6: f32 loc("<stdin>":57:10), %arg7: f32 loc("<stdin>":57:22)):
      %15 = "arith.mulf"(%arg6, %arg6) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":58:13)
      "linalg.yield"(%15) : (f32) -> () loc("<stdin>":59:7)
    }) : (tensor<16x8xf32>, tensor<16x8xf32>) -> tensor<16x8xf32> loc("<stdin>":56:11)
    %11 = "linalg.elementwise"(%10, %arg1) <{indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>], kind = #linalg.elementwise_kind<tanh>, operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg4: f32 loc("<stdin>":62:10), %arg5: f32 loc("<stdin>":62:22)):
      %14 = "math.tanh"(%arg4) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32 loc("<stdin>":63:13)
      "linalg.yield"(%14) : (f32) -> () loc("<stdin>":64:7)
    }) : (tensor<16x8xf32>, tensor<16x8xf32>) -> tensor<16x8xf32> loc("<stdin>":61:11)
    %12 = "linalg.elementwise"(%11, %arg1) <{indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>], kind = #linalg.elementwise_kind<erf>, operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg2: f32 loc("<stdin>":67:10), %arg3: f32 loc("<stdin>":67:22)):
      %13 = "math.erf"(%arg2) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32 loc("<stdin>":68:13)
      "linalg.yield"(%13) : (f32) -> () loc("<stdin>":69:7)
    }) : (tensor<16x8xf32>, tensor<16x8xf32>) -> tensor<16x8xf32> loc("<stdin>":66:11)
    "func.return"(%12) : (tensor<16x8xf32>) -> () loc("<stdin>":71:5)
  }) : () -> () loc("<stdin>":3:3)
}) : () -> () loc("<stdin>":2:1)
