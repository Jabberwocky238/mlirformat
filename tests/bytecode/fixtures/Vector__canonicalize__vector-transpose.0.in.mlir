"builtin.module"() ({
  "func.func"() <{function_type = (vector<1xf32>) -> vector<1x8xf32>, sym_name = "transpose_scalar_broadcast1"}> ({
  ^bb0(%arg0: vector<1xf32> loc("<stdin>":3:8)):
    %0 = "vector.broadcast"(%arg0) : (vector<1xf32>) -> vector<8x1xf32> loc("<stdin>":4:10)
    %1 = "vector.transpose"(%0) <{permutation = array<i64: 1, 0>}> : (vector<8x1xf32>) -> vector<1x8xf32> loc("<stdin>":5:10)
    "func.return"(%1) : (vector<1x8xf32>) -> () loc("<stdin>":6:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
