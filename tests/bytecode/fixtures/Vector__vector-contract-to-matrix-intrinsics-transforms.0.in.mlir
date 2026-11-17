"builtin.module"() ({
  "func.func"() <{function_type = (vector<2x4xf32>, vector<4x3xf32>, vector<2x3xf32>) -> vector<2x3xf32>, sym_name = "matmul"}> ({
  ^bb0(%arg3: vector<2x4xf32> loc("<stdin>":6:8), %arg4: vector<4x3xf32> loc("<stdin>":6:32), %arg5: vector<2x3xf32> loc("<stdin>":6:56)):
    %1 = "vector.contract"(%arg3, %arg4, %arg5) <{fastmath = #arith.fastmath<none>, indexing_maps = [affine_map<(d0, d1, d2) -> (d0, d2)>, affine_map<(d0, d1, d2) -> (d2, d1)>, affine_map<(d0, d1, d2) -> (d0, d1)>], iterator_types = [#vector.iterator_type<parallel>, #vector.iterator_type<parallel>, #vector.iterator_type<reduction>], kind = #vector.kind<add>}> : (vector<2x4xf32>, vector<4x3xf32>, vector<2x3xf32>) -> vector<2x3xf32> loc("<stdin>":7:10)
    "func.return"(%1) : (vector<2x3xf32>) -> () loc("<stdin>":8:5)
  }) : () -> () loc("<stdin>":5:3)
  "func.func"() <{function_type = (vector<2x4xf32>, vector<4x[3]xf32>, vector<2x[3]xf32>) -> vector<2x[3]xf32>, sym_name = "matmul_scalable"}> ({
  ^bb0(%arg0: vector<2x4xf32> loc("<stdin>":11:8), %arg1: vector<4x[3]xf32> loc("<stdin>":11:32), %arg2: vector<2x[3]xf32> loc("<stdin>":11:58)):
    %0 = "vector.contract"(%arg0, %arg1, %arg2) <{fastmath = #arith.fastmath<none>, indexing_maps = [affine_map<(d0, d1, d2) -> (d0, d2)>, affine_map<(d0, d1, d2) -> (d2, d1)>, affine_map<(d0, d1, d2) -> (d0, d1)>], iterator_types = [#vector.iterator_type<parallel>, #vector.iterator_type<parallel>, #vector.iterator_type<reduction>], kind = #vector.kind<add>}> : (vector<2x4xf32>, vector<4x[3]xf32>, vector<2x[3]xf32>) -> vector<2x[3]xf32> loc("<stdin>":12:10)
    "func.return"(%0) : (vector<2x[3]xf32>) -> () loc("<stdin>":13:5)
  }) : () -> () loc("<stdin>":10:3)
}) : () -> () loc("<stdin>":4:1)
