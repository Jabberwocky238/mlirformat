"builtin.module"() ({
  "func.func"() <{function_type = (i32) -> (), sym_name = "omp_unroll_partial_raw"}> ({
  ^bb0(%arg5: i32 loc("<stdin>":3:8)):
    %3 = "omp.new_cli"() : () -> !omp.cli loc("<stdin>":4:10)
    "omp.canonical_loop"(%arg5, %3) ({
    ^bb0(%arg6: i32 loc("<stdin>":6:10)):
      "omp.terminator"() : () -> () loc("<stdin>":7:7)
    }) : (i32, !omp.cli) -> () loc("<stdin>":5:5)
    "omp.unroll_partial"(%3) <{unroll_factor = 4 : i64}> : (!omp.cli) -> () loc("<stdin>":9:5)
    "func.return"() : () -> () loc("<stdin>":10:5)
  }) : () -> () loc("<stdin>":2:3)
  "func.func"() <{function_type = (i32) -> (), sym_name = "omp_unroll_partial_pretty"}> ({
  ^bb0(%arg3: i32 loc("<stdin>":13:8)):
    %2 = "omp.new_cli"() : () -> !omp.cli loc("<stdin>":14:10)
    "omp.canonical_loop"(%arg3, %2) ({
    ^bb0(%arg4: i32 loc("<stdin>":16:10)):
      "omp.terminator"() : () -> () loc("<stdin>":17:7)
    }) : (i32, !omp.cli) -> () loc("<stdin>":15:5)
    "omp.unroll_partial"(%2) <{unroll_factor = 8 : i64}> : (!omp.cli) -> () loc("<stdin>":19:5)
    "func.return"() : () -> () loc("<stdin>":20:5)
  }) : () -> () loc("<stdin>":12:3)
  "func.func"() <{function_type = (i32) -> (), sym_name = "omp_unroll_partial_nested_pretty"}> ({
  ^bb0(%arg0: i32 loc("<stdin>":23:8)):
    %0 = "omp.new_cli"() : () -> !omp.cli loc("<stdin>":24:10)
    %1 = "omp.new_cli"() : () -> !omp.cli loc("<stdin>":25:10)
    "omp.canonical_loop"(%arg0, %0) ({
    ^bb0(%arg1: i32 loc("<stdin>":27:10)):
      "omp.canonical_loop"(%arg0, %1) ({
      ^bb0(%arg2: i32 loc("<stdin>":29:12)):
        "omp.terminator"() : () -> () loc("<stdin>":30:9)
      }) : (i32, !omp.cli) -> () loc("<stdin>":28:7)
      "omp.terminator"() : () -> () loc("<stdin>":32:7)
    }) : (i32, !omp.cli) -> () loc("<stdin>":26:5)
    "omp.unroll_partial"(%0) <{unroll_factor = 4 : i64}> : (!omp.cli) -> () loc("<stdin>":34:5)
    "omp.unroll_partial"(%1) <{unroll_factor = 2 : i64}> : (!omp.cli) -> () loc("<stdin>":35:5)
    "func.return"() : () -> () loc("<stdin>":36:5)
  }) : () -> () loc("<stdin>":22:3)
}) : () -> () loc("<stdin>":1:1)
