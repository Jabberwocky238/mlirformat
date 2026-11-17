"builtin.module"() ({
  "func.func"() <{function_type = (vector<2x4xf32>) -> vector<4x2xf32>, sym_name = "transpose"}> ({
  ^bb0(%arg1: vector<2x4xf32> loc("<stdin>":3:8)):
    %1 = "vector.transpose"(%arg1) <{permutation = array<i64: 1, 0>}> : (vector<2x4xf32>) -> vector<4x2xf32> loc("<stdin>":4:10)
    "func.return"(%1) : (vector<4x2xf32>) -> () loc("<stdin>":5:5)
  }) : () -> () loc("<stdin>":2:3)
  "func.func"() <{function_type = (vector<2x[4]xf32>) -> vector<[4]x2xf32>, sym_name = "transpose_scalable"}> ({
  ^bb0(%arg0: vector<2x[4]xf32> loc("<stdin>":8:8)):
    %0 = "vector.transpose"(%arg0) <{permutation = array<i64: 1, 0>}> : (vector<2x[4]xf32>) -> vector<[4]x2xf32> loc("<stdin>":9:10)
    "func.return"(%0) : (vector<[4]x2xf32>) -> () loc("<stdin>":10:5)
  }) : () -> () loc("<stdin>":7:3)
}) : () -> () loc("<stdin>":1:1)
