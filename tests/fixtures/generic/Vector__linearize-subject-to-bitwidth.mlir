"builtin.module"() ({
  "func.func"() <{function_type = (vector<2x2xf32>) -> vector<2x2xf32>, sym_name = "test_result_bitwidth_64"}> ({
  ^bb0(%arg0: vector<2x2xf32>):
    %0 = "arith.constant"() <{value = dense<[[1.000000e+00, 2.000000e+00], [3.000000e+00, 4.000000e+00]]> : vector<2x2xf32>}> : () -> vector<2x2xf32>
    %1 = "math.sin"(%arg0) <{fastmath = #arith.fastmath<none>}> : (vector<2x2xf32>) -> vector<2x2xf32>
    "func.return"(%0) : (vector<2x2xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<2x2xindex>, vector<2x2xindex>) -> vector<2x2xindex>, sym_name = "test_index_no_linearize"}> ({
  ^bb0(%arg0: vector<2x2xindex>, %arg1: vector<2x2xindex>):
    %0 = "arith.addi"(%arg0, %arg1) <{overflowFlags = #arith.overflow<none>}> : (vector<2x2xindex>, vector<2x2xindex>) -> vector<2x2xindex>
    "func.return"(%0) : (vector<2x2xindex>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<2x8x4xf32>, vector<8x4xf32>) -> vector<2x8x4xf32>, sym_name = "test_vector_insert"}> ({
  ^bb0(%arg0: vector<2x8x4xf32>, %arg1: vector<8x4xf32>):
    %0 = "vector.insert"(%arg1, %arg0) <{static_position = array<i64: 0>}> : (vector<8x4xf32>, vector<2x8x4xf32>) -> vector<2x8x4xf32>
    "func.return"(%0) : (vector<2x8x4xf32>) -> ()
  }) : () -> ()
}) : () -> ()

