"builtin.module"() ({
  "func.func"() <{function_type = (vector<2xf32>) -> f32, sym_name = "extract"}> ({
  ^bb0(%arg0: vector<2xf32> loc("<stdin>":3:8)):
    %0 = "vector.extract"(%arg0) <{static_position = array<i64: 1>}> : (vector<2xf32>) -> f32 loc("<stdin>":4:10)
    "func.return"(%0) : (f32) -> () loc("<stdin>":5:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
