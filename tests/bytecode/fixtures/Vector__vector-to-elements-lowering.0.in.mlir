"builtin.module"() ({
  "func.func"() <{function_type = (vector<2xf32>) -> (f32, f32), sym_name = "negative_unroll_to_elements_1d"}> ({
  ^bb0(%arg0: vector<2xf32> loc("<stdin>":3:8)):
    %0:2 = "vector.to_elements"(%arg0) : (vector<2xf32>) -> (f32, f32) loc("<stdin>":4:12)
    "func.return"(%0#0, %0#1) : (f32, f32) -> () loc("<stdin>":5:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
