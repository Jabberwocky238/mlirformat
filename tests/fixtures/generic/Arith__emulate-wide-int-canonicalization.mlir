"builtin.module"() ({
  "func.func"() <{function_type = (i16) -> f64, sym_name = "uitofp_i16_ext_f64"}> ({
  ^bb0(%arg0: i16):
    %0 = "arith.extui"(%arg0) : (i16) -> i64
    %1 = "arith.uitofp"(%0) : (i64) -> f64
    "func.return"(%1) : (f64) -> ()
  }) : () -> ()
}) : () -> ()

