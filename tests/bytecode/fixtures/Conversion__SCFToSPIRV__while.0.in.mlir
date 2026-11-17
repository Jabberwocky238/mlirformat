"builtin.module"() ({
  "func.func"() <{function_type = (f32) -> i64, sym_name = "while_loop2"}> ({
  ^bb0(%arg0: f32 loc("<stdin>":3:8)):
    %0 = "scf.while"(%arg0) ({
    ^bb0(%arg2: f32 loc("<stdin>":5:10)):
      %2 = "foo.shared_compute"(%arg2) : (f32) -> i64 loc("<stdin>":6:12)
      %3 = "foo.evaluate_condition"(%arg2, %2) : (f32, i64) -> i1 loc("<stdin>":7:12)
      "scf.condition"(%3, %2) : (i1, i64) -> () loc("<stdin>":8:7)
    }, {
    ^bb0(%arg1: i64 loc("<stdin>":10:10)):
      %1 = "foo.payload"(%arg1) : (i64) -> f32 loc("<stdin>":11:12)
      "scf.yield"(%1) : (f32) -> () loc("<stdin>":12:7)
    }) : (f32) -> i64 loc("<stdin>":4:10)
    "func.return"(%0) : (i64) -> () loc("<stdin>":14:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
