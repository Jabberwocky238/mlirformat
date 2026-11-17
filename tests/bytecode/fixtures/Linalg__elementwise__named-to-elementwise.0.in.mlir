"builtin.module"() ({
  "func.func"() <{function_type = (tensor<16x8xf32>, tensor<16x8xf32>) -> tensor<16x8xf32>, sym_name = "exp"}> ({
  ^bb0(%arg19: tensor<16x8xf32> loc("<stdin>":3:8), %arg20: tensor<16x8xf32> loc("<stdin>":3:34)):
    %7 = "linalg.exp"(%arg19, %arg20) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg21: f32 loc("<stdin>":5:10), %arg22: f32 loc("<stdin>":5:23)):
      %8 = "math.exp"(%arg21) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32 loc("<stdin>":6:12)
      "linalg.yield"(%8) : (f32) -> () loc("<stdin>":7:7)
    }) : (tensor<16x8xf32>, tensor<16x8xf32>) -> tensor<16x8xf32> loc("<stdin>":4:10)
    "func.return"(%7) : (tensor<16x8xf32>) -> () loc("<stdin>":9:5)
  }) : () -> () loc("<stdin>":2:3)
  "func.func"() <{function_type = (tensor<16x8xf32>, tensor<16x8xf32>, tensor<16x8xf32>) -> tensor<16x8xf32>, sym_name = "add"}> ({
  ^bb0(%arg13: tensor<16x8xf32> loc("<stdin>":12:8), %arg14: tensor<16x8xf32> loc("<stdin>":12:34), %arg15: tensor<16x8xf32> loc("<stdin>":12:60)):
    %5 = "linalg.add"(%arg13, %arg14, %arg15) <{operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg16: f32 loc("<stdin>":14:10), %arg17: f32 loc("<stdin>":14:23), %arg18: f32 loc("<stdin>":14:36)):
      %6 = "arith.addf"(%arg16, %arg17) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":15:12)
      "linalg.yield"(%6) : (f32) -> () loc("<stdin>":16:7)
    }) : (tensor<16x8xf32>, tensor<16x8xf32>, tensor<16x8xf32>) -> tensor<16x8xf32> loc("<stdin>":13:10)
    "func.return"(%5) : (tensor<16x8xf32>) -> () loc("<stdin>":18:5)
  }) : () -> () loc("<stdin>":11:3)
  "func.func"() <{function_type = (tensor<16x8xf32>, tensor<16x8xf32>, tensor<16x8xf32>) -> tensor<16x8xf32>, sym_name = "sub"}> ({
  ^bb0(%arg7: tensor<16x8xf32> loc("<stdin>":21:8), %arg8: tensor<16x8xf32> loc("<stdin>":21:33), %arg9: tensor<16x8xf32> loc("<stdin>":21:58)):
    %3 = "linalg.sub"(%arg7, %arg8, %arg9) <{operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg10: f32 loc("<stdin>":23:10), %arg11: f32 loc("<stdin>":23:23), %arg12: f32 loc("<stdin>":23:36)):
      %4 = "arith.subf"(%arg10, %arg11) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":24:12)
      "linalg.yield"(%4) : (f32) -> () loc("<stdin>":25:7)
    }) : (tensor<16x8xf32>, tensor<16x8xf32>, tensor<16x8xf32>) -> tensor<16x8xf32> loc("<stdin>":22:10)
    "func.return"(%3) : (tensor<16x8xf32>) -> () loc("<stdin>":27:5)
  }) : () -> () loc("<stdin>":20:3)
  "func.func"() <{function_type = (tensor<4x8x16xi1>, tensor<4x8x16xf32>, tensor<4x8x16xf32>) -> tensor<4x8x16xf32>, sym_name = "ternary_select"}> ({
  ^bb0(%arg0: tensor<4x8x16xi1> loc("<stdin>":30:8), %arg1: tensor<4x8x16xf32> loc("<stdin>":30:34), %arg2: tensor<4x8x16xf32> loc("<stdin>":30:61)):
    %0 = "tensor.empty"() : () -> tensor<4x8x16xf32> loc("<stdin>":31:10)
    %1 = "linalg.select"(%arg0, %arg1, %arg2, %0) <{operandSegmentSizes = array<i32: 3, 1>}> ({
    ^bb0(%arg3: i1 loc("<stdin>":33:10), %arg4: f32 loc("<stdin>":33:21), %arg5: f32 loc("<stdin>":33:33), %arg6: f32 loc("<stdin>":33:45)):
      %2 = "arith.select"(%arg3, %arg4, %arg5) : (i1, f32, f32) -> f32 loc("<stdin>":34:12)
      "linalg.yield"(%2) : (f32) -> () loc("<stdin>":35:7)
    }) : (tensor<4x8x16xi1>, tensor<4x8x16xf32>, tensor<4x8x16xf32>, tensor<4x8x16xf32>) -> tensor<4x8x16xf32> loc("<stdin>":32:10)
    "func.return"(%1) : (tensor<4x8x16xf32>) -> () loc("<stdin>":37:5)
  }) : () -> () loc("<stdin>":29:3)
}) : () -> () loc("<stdin>":1:1)
