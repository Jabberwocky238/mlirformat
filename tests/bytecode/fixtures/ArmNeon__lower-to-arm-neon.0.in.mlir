"builtin.module"() ({
  "func.func"() <{function_type = (vector<2x8xi8>, vector<2x8xi4>, vector<2x2xi32>) -> vector<2x2xi32>, sym_name = "vector_arm_neon_mixed_types"}> ({
  ^bb0(%arg0: vector<2x8xi8> loc("<stdin>":6:8), %arg1: vector<2x8xi4> loc("<stdin>":6:31), %arg2: vector<2x2xi32> loc("<stdin>":6:54)):
    %0 = "arith.extsi"(%arg0) : (vector<2x8xi8>) -> vector<2x8xi32> loc("<stdin>":7:10)
    %1 = "arith.extsi"(%arg1) : (vector<2x8xi4>) -> vector<2x8xi32> loc("<stdin>":8:10)
    %2 = "vector.contract"(%0, %1, %arg2) <{fastmath = #arith.fastmath<none>, indexing_maps = [affine_map<(d0, d1, d2) -> (d0, d2)>, affine_map<(d0, d1, d2) -> (d1, d2)>, affine_map<(d0, d1, d2) -> (d0, d1)>], iterator_types = [#vector.iterator_type<parallel>, #vector.iterator_type<parallel>, #vector.iterator_type<reduction>], kind = #vector.kind<add>}> : (vector<2x8xi32>, vector<2x8xi32>, vector<2x2xi32>) -> vector<2x2xi32> loc("<stdin>":9:10)
    "func.return"(%2) : (vector<2x2xi32>) -> () loc("<stdin>":10:5)
  }) : () -> () loc("<stdin>":5:3)
}) : () -> () loc("<stdin>":4:1)
