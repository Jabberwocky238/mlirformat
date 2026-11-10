"builtin.module"() ({
  "func.func"() <{function_type = (i16) -> f64, sym_name = "uitofp_i16_ext_f64"}> ({
  ^bb0(%arg0: i16):
    %0 = "arith.extui"(%arg0) : (i16) -> i64
    %1 = "arith.constant"() <{value = 1 : i64}> : () -> i64
    %2 = "arith.ori"(%0, %1) : (i64, i64) -> i64
    %3 = "arith.uitofp"(%2) : (i64) -> f64
    "func.return"(%3) : (f64) -> ()
  }) : () -> ()
}) : () -> ()

