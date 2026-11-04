"builtin.module"() ({
  "func.func"() <{function_type = (tensor<16x8xf32>, tensor<16x8xf32>) -> tensor<16x8xf32>, sym_name = "exp"}> ({
  ^bb0(%arg19: tensor<16x8xf32>, %arg20: tensor<16x8xf32>):
    %7 = "linalg.exp"(%arg19, %arg20) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg21: f32, %arg22: f32):
      %8 = "math.exp"(%arg21) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
      "linalg.yield"(%8) : (f32) -> ()
    }) : (tensor<16x8xf32>, tensor<16x8xf32>) -> tensor<16x8xf32>
    "func.return"(%7) : (tensor<16x8xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<16x8xf32>, tensor<16x8xf32>, tensor<16x8xf32>) -> tensor<16x8xf32>, sym_name = "add"}> ({
  ^bb0(%arg13: tensor<16x8xf32>, %arg14: tensor<16x8xf32>, %arg15: tensor<16x8xf32>):
    %5 = "linalg.add"(%arg13, %arg14, %arg15) <{operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg16: f32, %arg17: f32, %arg18: f32):
      %6 = "arith.addf"(%arg16, %arg17) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%6) : (f32) -> ()
    }) : (tensor<16x8xf32>, tensor<16x8xf32>, tensor<16x8xf32>) -> tensor<16x8xf32>
    "func.return"(%5) : (tensor<16x8xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<16x8xf32>, tensor<16x8xf32>, tensor<16x8xf32>) -> tensor<16x8xf32>, sym_name = "sub"}> ({
  ^bb0(%arg7: tensor<16x8xf32>, %arg8: tensor<16x8xf32>, %arg9: tensor<16x8xf32>):
    %3 = "linalg.sub"(%arg7, %arg8, %arg9) <{operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg10: f32, %arg11: f32, %arg12: f32):
      %4 = "arith.subf"(%arg10, %arg11) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%4) : (f32) -> ()
    }) : (tensor<16x8xf32>, tensor<16x8xf32>, tensor<16x8xf32>) -> tensor<16x8xf32>
    "func.return"(%3) : (tensor<16x8xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<4x8x16xi1>, tensor<4x8x16xf32>, tensor<4x8x16xf32>) -> tensor<4x8x16xf32>, sym_name = "ternary_select"}> ({
  ^bb0(%arg0: tensor<4x8x16xi1>, %arg1: tensor<4x8x16xf32>, %arg2: tensor<4x8x16xf32>):
    %0 = "tensor.empty"() : () -> tensor<4x8x16xf32>
    %1 = "linalg.select"(%arg0, %arg1, %arg2, %0) <{operandSegmentSizes = array<i32: 3, 1>}> ({
    ^bb0(%arg3: i1, %arg4: f32, %arg5: f32, %arg6: f32):
      %2 = "arith.select"(%arg3, %arg4, %arg5) : (i1, f32, f32) -> f32
      "linalg.yield"(%2) : (f32) -> ()
    }) : (tensor<4x8x16xi1>, tensor<4x8x16xf32>, tensor<4x8x16xf32>, tensor<4x8x16xf32>) -> tensor<4x8x16xf32>
    "func.return"(%1) : (tensor<4x8x16xf32>) -> ()
  }) : () -> ()
}) : () -> ()

