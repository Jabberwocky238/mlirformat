"builtin.module"() ({
  "func.func"() <{function_type = (vector<f32>) -> vector<i32>, sym_name = "bitcast_f32_to_i32_vector_0d"}> ({
  ^bb0(%arg0: vector<f32> loc("<stdin>":3:8)):
    %0 = "vector.bitcast"(%arg0) : (vector<f32>) -> vector<i32> loc("<stdin>":4:10)
    "func.return"(%0) : (vector<i32>) -> () loc("<stdin>":5:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
