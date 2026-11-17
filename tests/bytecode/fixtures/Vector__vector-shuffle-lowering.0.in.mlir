"builtin.module"() ({
  "func.func"() <{function_type = (vector<2xf32>, vector<4xf32>) -> vector<5xf32>, sym_name = "shuffle_smaller_lhs_arbitrary"}> ({
  ^bb0(%arg0: vector<2xf32> loc("<stdin>":3:8), %arg1: vector<4xf32> loc("<stdin>":3:30)):
    %0 = "vector.shuffle"(%arg0, %arg1) <{mask = array<i64: 1, 3, 0, 4, 5>}> : (vector<2xf32>, vector<4xf32>) -> vector<5xf32> loc("<stdin>":4:10)
    "func.return"(%0) : (vector<5xf32>) -> () loc("<stdin>":5:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
