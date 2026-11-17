"builtin.module"() ({
  "func.func"() <{function_type = (vector<1x8xi32>) -> vector<1x8xi32>, sym_name = "fold_unit_dim_add_basic"}> ({
  ^bb0(%arg0: vector<1x8xi32> loc("<stdin>":3:8)):
    %0 = "arith.addi"(%arg0, %arg0) <{overflowFlags = #arith.overflow<none>}> : (vector<1x8xi32>, vector<1x8xi32>) -> vector<1x8xi32> loc("<stdin>":4:10)
    "func.return"(%0) : (vector<1x8xi32>) -> () loc("<stdin>":5:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
