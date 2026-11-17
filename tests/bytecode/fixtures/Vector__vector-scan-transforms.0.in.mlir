"builtin.module"() ({
  "func.func"() <{function_type = (vector<2xi32>, vector<i32>) -> (vector<2xi32>, vector<i32>), sym_name = "scan1d_inc"}> ({
  ^bb0(%arg0: vector<2xi32> loc("<stdin>":3:8), %arg1: vector<i32> loc("<stdin>":3:30)):
    %0:2 = "vector.scan"(%arg0, %arg1) <{inclusive = true, kind = #vector.kind<add>, reduction_dim = 0 : i64}> : (vector<2xi32>, vector<i32>) -> (vector<2xi32>, vector<i32>) loc("<stdin>":4:12)
    "func.return"(%0#0, %0#1) : (vector<2xi32>, vector<i32>) -> () loc("<stdin>":5:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
