"builtin.module"() ({
  "func.func"() <{function_type = (i32) -> (), sym_name = "omp_unroll_partial_raw"}> ({
  ^bb0(%arg5: i32):
    %3 = "omp.new_cli"() : () -> !omp.cli
    "omp.canonical_loop"(%arg5, %3) ({
    ^bb0(%arg6: i32):
      "omp.terminator"() : () -> ()
    }) : (i32, !omp.cli) -> ()
    "omp.unroll_partial"(%3) <{unroll_factor = 4 : i64}> : (!omp.cli) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32) -> (), sym_name = "omp_unroll_partial_pretty"}> ({
  ^bb0(%arg3: i32):
    %2 = "omp.new_cli"() : () -> !omp.cli
    "omp.canonical_loop"(%arg3, %2) ({
    ^bb0(%arg4: i32):
      "omp.terminator"() : () -> ()
    }) : (i32, !omp.cli) -> ()
    "omp.unroll_partial"(%2) <{unroll_factor = 8 : i64}> : (!omp.cli) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32) -> (), sym_name = "omp_unroll_partial_nested_pretty"}> ({
  ^bb0(%arg0: i32):
    %0 = "omp.new_cli"() : () -> !omp.cli
    %1 = "omp.new_cli"() : () -> !omp.cli
    "omp.canonical_loop"(%arg0, %0) ({
    ^bb0(%arg1: i32):
      "omp.canonical_loop"(%arg0, %1) ({
      ^bb0(%arg2: i32):
        "omp.terminator"() : () -> ()
      }) : (i32, !omp.cli) -> ()
      "omp.terminator"() : () -> ()
    }) : (i32, !omp.cli) -> ()
    "omp.unroll_partial"(%0) <{unroll_factor = 4 : i64}> : (!omp.cli) -> ()
    "omp.unroll_partial"(%1) <{unroll_factor = 2 : i64}> : (!omp.cli) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

