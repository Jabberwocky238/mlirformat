"builtin.module"() ({
  "test.some_op_with_region"() ({
  ^bb0(%arg0: f64):
    %0 = "math.atan"(%arg0) <{fastmath = #arith.fastmath<none>}> : (f64) -> f64
    "test.possible_terminator"() : () -> ()
  }) : () -> ()
}) : () -> ()

