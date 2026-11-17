"builtin.module"() ({
  "func.func"() <{function_type = (f32) -> vector<4xf32>, sym_name = "inner_func_inlinable"}> ({
  ^bb0(%arg1: f32 loc("<stdin>":3:8)):
    %1 = "vector.broadcast"(%arg1) : (f32) -> vector<4xf32> loc("<stdin>":4:10)
    "func.return"(%1) : (vector<4xf32>) -> () loc("<stdin>":5:5)
  }) : () -> () loc("<stdin>":2:3)
  "func.func"() <{function_type = (f32) -> vector<4xf32>, sym_name = "test_inline"}> ({
  ^bb0(%arg0: f32 loc("<stdin>":8:8)):
    %0 = "func.call"(%arg0) <{callee = @inner_func_inlinable}> : (f32) -> vector<4xf32> loc("<stdin>":9:10)
    "func.return"(%0) : (vector<4xf32>) -> () loc("<stdin>":10:5)
  }) : () -> () loc("<stdin>":7:3)
}) : () -> () loc("<stdin>":1:1)
