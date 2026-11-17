"builtin.module"() ({
  "func.func"() <{function_type = (vector<4x8x2xf16>, vector<8x16x2xf16>, vector<4x16xf32>) -> vector<4x16xf32>, sym_name = "contract_vnni_f16"}> ({
  ^bb0(%arg0: vector<4x8x2xf16> loc("<stdin>":6:8), %arg1: vector<8x16x2xf16> loc("<stdin>":6:34), %arg2: vector<4x16xf32> loc("<stdin>":6:61)):
    %0 = "vector.contract"(%arg0, %arg1, %arg2) <{fastmath = #arith.fastmath<none>, indexing_maps = [affine_map<(d0, d1, d2, d3) -> (d0, d2, d3)>, affine_map<(d0, d1, d2, d3) -> (d2, d1, d3)>, affine_map<(d0, d1, d2, d3) -> (d0, d1)>], iterator_types = [#vector.iterator_type<parallel>, #vector.iterator_type<parallel>, #vector.iterator_type<reduction>, #vector.iterator_type<reduction>], kind = #vector.kind<add>}> : (vector<4x8x2xf16>, vector<8x16x2xf16>, vector<4x16xf32>) -> vector<4x16xf32> loc("<stdin>":7:10)
    "func.return"(%0) : (vector<4x16xf32>) -> () loc("<stdin>":8:5)
  }) : () -> () loc("<stdin>":5:3)
}) : () -> () loc("<stdin>":4:1)
