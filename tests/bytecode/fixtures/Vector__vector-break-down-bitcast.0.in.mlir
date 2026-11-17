"builtin.module"() ({
  "func.func"() <{function_type = (vector<8xf16>) -> vector<4xf32>, sym_name = "bitcast_f16_to_f32"}> ({
  ^bb0(%arg0: vector<8xf16> loc("<stdin>":3:8)):
    %0 = "vector.bitcast"(%arg0) : (vector<8xf16>) -> vector<4xf32> loc("<stdin>":4:10)
    "func.return"(%0) : (vector<4xf32>) -> () loc("<stdin>":5:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
