"builtin.module"() ({
  "func.func"() <{function_type = (f32) -> f32, sym_name = "foo", sym_visibility = "private"}> ({
  }) : () -> () loc("<stdin>":3:3)
  "func.func"() <{function_type = (f32) -> (), sym_name = "bar", sym_visibility = "private"}> ({
  }) : () -> () loc("<stdin>":5:3)
  "func.func"() <{function_type = (i32, f32, f32) -> (), sym_name = "switch_with_fallthrough"}> ({
  ^bb0(%arg0: i32 loc("<stdin>":8:8), %arg1: f32 loc("<stdin>":8:20), %arg2: f32 loc("<stdin>":8:32)):
    "cf.switch"(%arg0, %arg1, %arg2)[^bb1, ^bb2, ^bb3] <{case_operand_segments = array<i32: 1, 0>, case_values = dense<[0, 1]> : vector<2xi32>, operandSegmentSizes = array<i32: 1, 1, 1>}> : (i32, f32, f32) -> () loc("<stdin>":9:5)
  ^bb1(%0: f32 loc("<stdin>":10:8)):  // pred: ^bb0
    %1 = "func.call"(%0) <{callee = @foo}> : (f32) -> f32 loc("<stdin>":11:10)
    "cf.br"(%1)[^bb2] : (f32) -> () loc("<stdin>":12:5)
  ^bb2(%2: f32 loc("<stdin>":13:8)):  // 2 preds: ^bb0, ^bb1
    "func.call"(%2) <{callee = @bar}> : (f32) -> () loc("<stdin>":14:5)
    "cf.br"()[^bb3] : () -> () loc("<stdin>":15:5)
  ^bb3:  // 2 preds: ^bb0, ^bb2
    "func.return"() : () -> () loc("<stdin>":17:5)
  }) : () -> () loc("<stdin>":7:3)
}) : () -> () loc("<stdin>":2:1)
