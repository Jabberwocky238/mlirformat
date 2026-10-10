"builtin.module"() ({
  "func.func"() <{function_type = (vector<2x4xf32>) -> vector<4x2xf32>, sym_name = "transpose"}> ({
  ^bb0(%arg1: vector<2x4xf32>):
    %1 = "vector.transpose"(%arg1) <{permutation = array<i64: 1, 0>}> : (vector<2x4xf32>) -> vector<4x2xf32>
    "func.return"(%1) : (vector<4x2xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<2x[4]xf32>) -> vector<[4]x2xf32>, sym_name = "transpose_scalable"}> ({
  ^bb0(%arg0: vector<2x[4]xf32>):
    %0 = "vector.transpose"(%arg0) <{permutation = array<i64: 1, 0>}> : (vector<2x[4]xf32>) -> vector<[4]x2xf32>
    "func.return"(%0) : (vector<[4]x2xf32>) -> ()
  }) : () -> ()
}) : () -> ()

