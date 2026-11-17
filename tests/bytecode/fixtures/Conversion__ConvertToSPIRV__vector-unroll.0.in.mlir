"builtin.module"() ({
  "func.func"() <{function_type = (vector<6xi32>, vector<6xi32>) -> vector<6xi32>, sym_name = "vaddi"}> ({
  ^bb0(%arg4: vector<6xi32> loc("<stdin>":3:8), %arg5: vector<6xi32> loc("<stdin>":3:30)):
    %2 = "arith.addi"(%arg4, %arg5) <{overflowFlags = #arith.overflow<none>}> : (vector<6xi32>, vector<6xi32>) -> vector<6xi32> loc("<stdin>":4:10)
    "func.return"(%2) : (vector<6xi32>) -> () loc("<stdin>":5:5)
  }) : () -> () loc("<stdin>":2:3)
  "func.func"() <{function_type = (vector<2x2xi32>, vector<2x2xi32>) -> vector<2x2xi32>, sym_name = "vaddi_2d"}> ({
  ^bb0(%arg2: vector<2x2xi32> loc("<stdin>":8:8), %arg3: vector<2x2xi32> loc("<stdin>":8:32)):
    %1 = "arith.addi"(%arg2, %arg3) <{overflowFlags = #arith.overflow<none>}> : (vector<2x2xi32>, vector<2x2xi32>) -> vector<2x2xi32> loc("<stdin>":9:10)
    "func.return"(%1) : (vector<2x2xi32>) -> () loc("<stdin>":10:5)
  }) : () -> () loc("<stdin>":7:3)
  "func.func"() <{function_type = (vector<2x8xi32>, vector<2x8xi32>) -> vector<2x8xi32>, sym_name = "vaddi_2d_8"}> ({
  ^bb0(%arg0: vector<2x8xi32> loc("<stdin>":13:8), %arg1: vector<2x8xi32> loc("<stdin>":13:32)):
    %0 = "arith.addi"(%arg0, %arg1) <{overflowFlags = #arith.overflow<none>}> : (vector<2x8xi32>, vector<2x8xi32>) -> vector<2x8xi32> loc("<stdin>":14:10)
    "func.return"(%0) : (vector<2x8xi32>) -> () loc("<stdin>":15:5)
  }) : () -> () loc("<stdin>":12:3)
}) : () -> () loc("<stdin>":1:1)
