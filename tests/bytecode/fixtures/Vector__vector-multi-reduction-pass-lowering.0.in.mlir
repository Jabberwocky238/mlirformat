"builtin.module"() ({
  "func.func"() <{function_type = (vector<2x4xf32>, vector<2xf32>) -> vector<2xf32>, sym_name = "vector_multi_reduction"}> ({
  ^bb0(%arg0: vector<2x4xf32> loc("<stdin>":3:8), %arg1: vector<2xf32> loc("<stdin>":3:32)):
    %0 = "vector.multi_reduction"(%arg0, %arg1) <{kind = #vector.kind<mul>, reduction_dims = array<i64: 1>}> : (vector<2x4xf32>, vector<2xf32>) -> vector<2xf32> loc("<stdin>":4:10)
    "func.return"(%0) : (vector<2xf32>) -> () loc("<stdin>":5:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
