"builtin.module"() ({
  "func.func"() <{function_type = (vector<[8]xf32>, i64) -> vector<[8]xf32>, sym_name = "cos"}> ({
  ^bb0(%arg0: vector<[8]xf32> loc("<stdin>":3:8), %arg1: i64 loc("<stdin>":3:32)):
    %0 = "math.cos"(%arg0) <{fastmath = #arith.fastmath<none>}> : (vector<[8]xf32>) -> vector<[8]xf32> loc("<stdin>":4:10)
    "func.return"(%0) : (vector<[8]xf32>) -> () loc("<stdin>":5:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
