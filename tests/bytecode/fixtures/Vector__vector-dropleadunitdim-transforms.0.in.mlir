"builtin.module"() ({
  "func.func"() <{function_type = (vector<1x16x8xf32>, vector<1x8x16xf32>, vector<1x16x16xf32>) -> vector<1x16x16xf32>, sym_name = "cast_away_contraction_leading_one_dims"}> ({
  ^bb0(%arg0: vector<1x16x8xf32> loc("<stdin>":6:8), %arg1: vector<1x8x16xf32> loc("<stdin>":6:35), %arg2: vector<1x16x16xf32> loc("<stdin>":6:62)):
    %0 = "vector.contract"(%arg0, %arg1, %arg2) <{fastmath = #arith.fastmath<none>, indexing_maps = [affine_map<(d0, d1, d2, d3) -> (d0, d1, d3)>, affine_map<(d0, d1, d2, d3) -> (d0, d3, d2)>, affine_map<(d0, d1, d2, d3) -> (d0, d1, d2)>], iterator_types = [#vector.iterator_type<parallel>, #vector.iterator_type<parallel>, #vector.iterator_type<parallel>, #vector.iterator_type<reduction>], kind = #vector.kind<add>}> : (vector<1x16x8xf32>, vector<1x8x16xf32>, vector<1x16x16xf32>) -> vector<1x16x16xf32> loc("<stdin>":7:10)
    "func.return"(%0) : (vector<1x16x16xf32>) -> () loc("<stdin>":8:5)
  }) : () -> () loc("<stdin>":5:3)
}) : () -> () loc("<stdin>":4:1)
