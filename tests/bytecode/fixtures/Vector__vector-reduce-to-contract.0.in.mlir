"builtin.module"() ({
  "func.func"() <{function_type = (vector<8x32x16xf32>, vector<8x32x16xf32>, vector<8x16xf32>) -> vector<8x16xf32>, sym_name = "multidimreduction_contract"}> ({
  ^bb0(%arg0: vector<8x32x16xf32> loc("<stdin>":3:8), %arg1: vector<8x32x16xf32> loc("<stdin>":3:36), %arg2: vector<8x16xf32> loc("<stdin>":3:64)):
    %0 = "arith.mulf"(%arg0, %arg1) <{fastmath = #arith.fastmath<none>}> : (vector<8x32x16xf32>, vector<8x32x16xf32>) -> vector<8x32x16xf32> loc("<stdin>":4:10)
    %1 = "vector.multi_reduction"(%0, %arg2) <{kind = #vector.kind<add>, reduction_dims = array<i64: 1>}> : (vector<8x32x16xf32>, vector<8x16xf32>) -> vector<8x16xf32> loc("<stdin>":5:10)
    "func.return"(%1) : (vector<8x16xf32>) -> () loc("<stdin>":6:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
