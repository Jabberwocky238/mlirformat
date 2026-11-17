"builtin.module"() ({
  "func.func"() <{function_type = (index, index) -> vector<1x4xindex>, sym_name = "broadcast_scalar_with_bcast"}> ({
  ^bb0(%arg2: index loc("<stdin>":3:8), %arg3: index loc("<stdin>":3:22)):
    %3 = "vector.broadcast"(%arg2) : (index) -> vector<1x4xindex> loc("<stdin>":4:10)
    %4 = "vector.broadcast"(%arg3) : (index) -> vector<1x4xindex> loc("<stdin>":5:10)
    %5 = "arith.addi"(%3, %4) <{overflowFlags = #arith.overflow<none>}> : (vector<1x4xindex>, vector<1x4xindex>) -> vector<1x4xindex> loc("<stdin>":6:10)
    "func.return"(%5) : (vector<1x4xindex>) -> () loc("<stdin>":7:5)
  }) : () -> () loc("<stdin>":2:3)
  "func.func"() <{function_type = (index, index) -> vector<1x[4]xindex>, sym_name = "broadcast_scalar_with_bcast_scalable"}> ({
  ^bb0(%arg0: index loc("<stdin>":10:8), %arg1: index loc("<stdin>":10:22)):
    %0 = "vector.broadcast"(%arg0) : (index) -> vector<1x[4]xindex> loc("<stdin>":11:10)
    %1 = "vector.broadcast"(%arg1) : (index) -> vector<1x[4]xindex> loc("<stdin>":12:10)
    %2 = "arith.addi"(%0, %1) <{overflowFlags = #arith.overflow<none>}> : (vector<1x[4]xindex>, vector<1x[4]xindex>) -> vector<1x[4]xindex> loc("<stdin>":13:10)
    "func.return"(%2) : (vector<1x[4]xindex>) -> () loc("<stdin>":14:5)
  }) : () -> () loc("<stdin>":9:3)
}) : () -> () loc("<stdin>":1:1)
