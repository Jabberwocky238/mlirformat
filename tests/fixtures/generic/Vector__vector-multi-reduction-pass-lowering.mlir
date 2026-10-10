"builtin.module"() ({
  "func.func"() <{function_type = (vector<2x4xf32>, vector<2xf32>) -> vector<2xf32>, sym_name = "vector_multi_reduction"}> ({
  ^bb0(%arg0: vector<2x4xf32>, %arg1: vector<2xf32>):
    %0 = "vector.multi_reduction"(%arg0, %arg1) <{kind = #vector.kind<mul>, reduction_dims = array<i64: 1>}> : (vector<2x4xf32>, vector<2xf32>) -> vector<2xf32>
    "func.return"(%0) : (vector<2xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<3x4x5xf32>, vector<4xf32>) -> vector<4xf32>, sym_name = "vector_multi_reduction_parallel_middle"}> ({
  ^bb0(%arg0: vector<3x4x5xf32>, %arg1: vector<4xf32>):
    %0 = "vector.multi_reduction"(%arg0, %arg1) <{kind = #vector.kind<add>, reduction_dims = array<i64: 0, 2>}> : (vector<3x4x5xf32>, vector<4xf32>) -> vector<4xf32>
    "func.return"(%0) : (vector<4xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<2x4xf32>, vector<2xf32>, vector<2x4xi1>) -> vector<2xf32>, sym_name = "vector_multi_reduction_masked"}> ({
  ^bb0(%arg0: vector<2x4xf32>, %arg1: vector<2xf32>, %arg2: vector<2x4xi1>):
    %0 = "vector.mask"(%arg2) ({
      %1 = "vector.multi_reduction"(%arg0, %arg1) <{kind = #vector.kind<mul>, reduction_dims = array<i64: 1>}> : (vector<2x4xf32>, vector<2xf32>) -> vector<2xf32>
      "vector.yield"(%1) : (vector<2xf32>) -> ()
    }) : (vector<2x4xi1>) -> vector<2xf32>
    "func.return"(%0) : (vector<2xf32>) -> ()
  }) : () -> ()
}) : () -> ()

