"builtin.module"() ({
  "func.func"() <{function_type = (i32, i1) -> i32, sym_name = "grouped_gemm_while_hang"}> ({
  ^bb0(%arg0: i32, %arg1: i1):
    %0 = "arith.constant"() <{value = 0 : i32}> : () -> i32
    %1 = "arith.constant"() <{value = 1 : i32}> : () -> i32
    %2 = "arith.constant"() <{value = 3 : i32}> : () -> i32
    %3 = "arith.constant"() <{value = 7 : i32}> : () -> i32
    %4 = "arith.constant"() <{value = 127 : i32}> : () -> i32
    %5 = "arith.cmpi"(%0, %arg0) <{predicate = 2 : i64}> : (i32, i32) -> i1
    %6:2 = "scf.while"(%0, %5) ({
    ^bb0(%arg8: i32, %arg9: i1):
      "scf.condition"(%arg9, %arg8, %arg9) : (i1, i32, i1) -> ()
    }, {
    ^bb0(%arg2: i32, %arg3: i1):
      %8 = "arith.addi"(%arg2, %1) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      %9 = "arith.cmpi"(%8, %arg0) <{predicate = 2 : i64}> : (i32, i32) -> i1
      %10:2 = "scf.while"(%8, %9) ({
      ^bb0(%arg6: i32, %arg7: i1):
        "scf.condition"(%arg7, %arg6, %arg7) : (i1, i32, i1) -> ()
      }, {
      ^bb0(%arg4: i32, %arg5: i1):
        %12 = "scf.if"(%arg1) ({
          %25 = "arith.addi"(%arg4, %1) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
          %26 = "arith.muli"(%25, %3) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
          %27 = "arith.remui"(%26, %4) : (i32, i32) -> i32
          "scf.yield"(%27) : (i32) -> ()
        }, {
          %22 = "arith.addi"(%arg4, %2) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
          %23 = "arith.muli"(%22, %3) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
          %24 = "arith.remui"(%23, %4) : (i32, i32) -> i32
          "scf.yield"(%24) : (i32) -> ()
        }) : (i1) -> i32
        %13 = "scf.if"(%arg1) ({
          %19 = "arith.addi"(%12, %1) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
          %20 = "arith.muli"(%19, %3) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
          %21 = "arith.remui"(%20, %4) : (i32, i32) -> i32
          "scf.yield"(%21) : (i32) -> ()
        }, {
          %16 = "arith.addi"(%12, %2) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
          %17 = "arith.muli"(%16, %3) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
          %18 = "arith.remui"(%17, %4) : (i32, i32) -> i32
          "scf.yield"(%18) : (i32) -> ()
        }) : (i1) -> i32
        %14 = "arith.cmpi"(%13, %arg0) <{predicate = 2 : i64}> : (i32, i32) -> i1
        %15 = "test.reflect_bounds"(%13) : (i32) -> i32
        "scf.yield"(%13, %14) : (i32, i1) -> ()
      }) : (i32, i1) -> (i32, i1)
      %11 = "arith.cmpi"(%10#0, %arg0) <{predicate = 2 : i64}> : (i32, i32) -> i1
      "scf.yield"(%10#0, %11) : (i32, i1) -> ()
    }) : (i32, i1) -> (i32, i1)
    %7 = "test.reflect_bounds"(%6#0) : (i32) -> i32
    "func.return"(%7) : (i32) -> ()
  }) : () -> ()
}) : () -> ()

