"builtin.module"() ({
  "func.func"() <{function_type = (i32) -> (), sym_name = "omp_unroll_heuristic_raw"}> ({
  ^bb0(%arg5: i32):
    %3 = "omp.new_cli"() : () -> !omp.cli
    "omp.canonical_loop"(%arg5, %3) ({
    ^bb0(%arg6: i32):
      "omp.terminator"() : () -> ()
    }) : (i32, !omp.cli) -> ()
    "omp.unroll_heuristic"(%3) : (!omp.cli) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32) -> (), sym_name = "omp_unroll_heuristic_pretty"}> ({
  ^bb0(%arg3: i32):
    %2 = "omp.new_cli"() : () -> !omp.cli
    "omp.canonical_loop"(%arg3, %2) ({
    ^bb0(%arg4: i32):
      "omp.terminator"() : () -> ()
    }) : (i32, !omp.cli) -> ()
    "omp.unroll_heuristic"(%2) : (!omp.cli) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32) -> (), sym_name = "omp_unroll_heuristic_nested_pretty"}> ({
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
    "omp.unroll_heuristic"(%0) : (!omp.cli) -> ()
    "omp.unroll_heuristic"(%1) : (!omp.cli) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

