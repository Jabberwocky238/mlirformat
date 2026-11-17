"builtin.module"() ({
  "func.func"() <{function_type = (index) -> (), sym_name = "switch_no_result"}> ({
  ^bb0(%arg2: index loc("<stdin>":3:8)):
    "scf.index_switch"(%arg2) <{cases = array<i64: 2, 5>}> ({
      %13 = "arith.constant"() <{value = 30 : i32}> : () -> i32 loc("<stdin>":5:13)
      "scf.yield"() : () -> () loc("<stdin>":6:7)
    }, {
      %12 = "arith.constant"() <{value = 10 : i32}> : () -> i32 loc("<stdin>":8:13)
      "scf.yield"() : () -> () loc("<stdin>":9:7)
    }, {
      %11 = "arith.constant"() <{value = 20 : i32}> : () -> i32 loc("<stdin>":11:13)
      "scf.yield"() : () -> () loc("<stdin>":12:7)
    }) : (index) -> () loc("<stdin>":4:5)
    "func.return"() : () -> () loc("<stdin>":14:5)
  }) : () -> () loc("<stdin>":2:3)
  "func.func"() <{function_type = (index) -> (), sym_name = "switch_one_result"}> ({
  ^bb0(%arg1: index loc("<stdin>":17:8)):
    %7 = "scf.index_switch"(%arg1) <{cases = array<i64: 2, 5>}> ({
      %10 = "arith.constant"() <{value = 30 : i32}> : () -> i32 loc("<stdin>":19:13)
      "scf.yield"(%10) : (i32) -> () loc("<stdin>":20:7)
    }, {
      %9 = "arith.constant"() <{value = 10 : i32}> : () -> i32 loc("<stdin>":22:12)
      "scf.yield"(%9) : (i32) -> () loc("<stdin>":23:7)
    }, {
      %8 = "arith.constant"() <{value = 20 : i32}> : () -> i32 loc("<stdin>":25:12)
      "scf.yield"(%8) : (i32) -> () loc("<stdin>":26:7)
    }) : (index) -> i32 loc("<stdin>":18:10)
    "func.return"() : () -> () loc("<stdin>":28:5)
  }) : () -> () loc("<stdin>":16:3)
  "func.func"() <{function_type = (index) -> (i32, f32), sym_name = "switch_two_results"}> ({
  ^bb0(%arg0: index loc("<stdin>":31:8)):
    %0:2 = "scf.index_switch"(%arg0) <{cases = array<i64: 2, 5>}> ({
      %5 = "arith.constant"() <{value = 30 : i32}> : () -> i32 loc("<stdin>":33:12)
      %6 = "arith.constant"() <{value = 3.600000e+00 : f32}> : () -> f32 loc("<stdin>":34:12)
      "scf.yield"(%5, %6) : (i32, f32) -> () loc("<stdin>":35:7)
    }, {
      %3 = "arith.constant"() <{value = 10 : i32}> : () -> i32 loc("<stdin>":37:12)
      %4 = "arith.constant"() <{value = 1.200000e+00 : f32}> : () -> f32 loc("<stdin>":38:12)
      "scf.yield"(%3, %4) : (i32, f32) -> () loc("<stdin>":39:7)
    }, {
      %1 = "arith.constant"() <{value = 20 : i32}> : () -> i32 loc("<stdin>":41:12)
      %2 = "arith.constant"() <{value = 2.400000e+00 : f32}> : () -> f32 loc("<stdin>":42:12)
      "scf.yield"(%1, %2) : (i32, f32) -> () loc("<stdin>":43:7)
    }) : (index) -> (i32, f32) loc("<stdin>":32:12)
    "func.return"(%0#0, %0#1) : (i32, f32) -> () loc("<stdin>":45:5)
  }) : () -> () loc("<stdin>":30:3)
}) : () -> () loc("<stdin>":1:1)
