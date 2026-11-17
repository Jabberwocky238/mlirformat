"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "empty"}> ({
    "memref.alloca_scope"() ({
      "memref.alloca_scope.return"() : () -> () loc("<stdin>":4:7)
    }) : () -> () loc("<stdin>":3:5)
    "func.return"() : () -> () loc("<stdin>":6:5)
  }) : () -> () loc("<stdin>":2:3)
  "func.func"() <{function_type = (f32) -> (), sym_name = "returns_nothing"}> ({
  ^bb0(%arg2: f32 loc("<stdin>":9:8)):
    %8 = "arith.constant"() <{value = 1.000000e+01 : f32}> : () -> f32 loc("<stdin>":10:10)
    "memref.alloca_scope"() ({
      %9 = "arith.addf"(%8, %arg2) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":12:12)
      "memref.alloca_scope.return"() : () -> () loc("<stdin>":13:7)
    }) : () -> () loc("<stdin>":11:5)
    "func.return"() : () -> () loc("<stdin>":15:5)
  }) : () -> () loc("<stdin>":8:3)
  "func.func"() <{function_type = (f32) -> f32, sym_name = "returns_one_value"}> ({
  ^bb0(%arg1: f32 loc("<stdin>":18:8)):
    %5 = "arith.constant"() <{value = 1.000000e+01 : f32}> : () -> f32 loc("<stdin>":19:10)
    %6 = "memref.alloca_scope"() ({
      %7 = "arith.addf"(%5, %arg1) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":21:12)
      "memref.alloca_scope.return"(%7) : (f32) -> () loc("<stdin>":22:7)
    }) : () -> f32 loc("<stdin>":20:10)
    "func.return"(%6) : (f32) -> () loc("<stdin>":24:5)
  }) : () -> () loc("<stdin>":17:3)
  "func.func"() <{function_type = (f32) -> f32, sym_name = "returns_multiple_values"}> ({
  ^bb0(%arg0: f32 loc("<stdin>":27:8)):
    %0 = "arith.constant"() <{value = 1.000000e+01 : f32}> : () -> f32 loc("<stdin>":28:10)
    %1:2 = "memref.alloca_scope"() ({
      %3 = "arith.addf"(%0, %arg0) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":30:12)
      %4 = "arith.subf"(%0, %arg0) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":31:12)
      "memref.alloca_scope.return"(%3, %4) : (f32, f32) -> () loc("<stdin>":32:7)
    }) : () -> (f32, f32) loc("<stdin>":29:12)
    %2 = "arith.addf"(%1#0, %1#1) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":34:10)
    "func.return"(%2) : (f32) -> () loc("<stdin>":35:5)
  }) : () -> () loc("<stdin>":26:3)
}) : () -> () loc("<stdin>":1:1)
