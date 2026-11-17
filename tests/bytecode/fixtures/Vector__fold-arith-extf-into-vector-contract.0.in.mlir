"builtin.module"() ({
  "func.func"() <{function_type = (vector<64x64xf16>, vector<64x64xf16>, vector<64x64xf32>) -> vector<64x64xf32>, sym_name = "fold_arith_extf_into_contract"}> ({
  ^bb0(%arg0: vector<64x64xf16> loc("<stdin>":6:8), %arg1: vector<64x64xf16> loc("<stdin>":6:34), %arg2: vector<64x64xf32> loc("<stdin>":6:60)):
    %0 = "arith.extf"(%arg0) : (vector<64x64xf16>) -> vector<64x64xf32> loc("<stdin>":7:10)
    %1 = "arith.extf"(%arg1) : (vector<64x64xf16>) -> vector<64x64xf32> loc("<stdin>":8:10)
    %2 = "vector.contract"(%0, %1, %arg2) <{fastmath = #arith.fastmath<none>, indexing_maps = [affine_map<(d0, d1, d2) -> (d0, d2)>, affine_map<(d0, d1, d2) -> (d2, d1)>, affine_map<(d0, d1, d2) -> (d0, d1)>], iterator_types = [#vector.iterator_type<parallel>, #vector.iterator_type<parallel>, #vector.iterator_type<reduction>], kind = #vector.kind<add>}> : (vector<64x64xf32>, vector<64x64xf32>, vector<64x64xf32>) -> vector<64x64xf32> loc("<stdin>":9:10)
    "func.return"(%2) : (vector<64x64xf32>) -> () loc("<stdin>":10:5)
  }) : () -> () loc("<stdin>":5:3)
}) : () -> () loc("<stdin>":4:1)
