"builtin.module"() ({
  "smt.solver"() ({
    %0 = "smt.constant"() <{value = true}> : () -> !smt.bool
    %1 = "smt.forall"() <{boundVarNames = ["a", "b"], weight = 2 : i32}> ({
    ^bb0(%arg22: !smt.int, %arg23: !smt.int):
      %29 = "smt.eq"(%arg22, %arg23) : (!smt.int, !smt.int) -> !smt.bool
      "smt.yield"(%29) : (!smt.bool) -> ()
    }) : () -> !smt.bool
    "smt.assert"(%1) : (!smt.bool) -> ()
    %2 = "smt.exists"() <{weight = 2 : i32}> ({
    ^bb0(%arg20: !smt.int, %arg21: !smt.int):
      %28 = "smt.eq"(%arg20, %arg21) : (!smt.int, !smt.int) -> !smt.bool
      "smt.yield"(%28) : (!smt.bool) -> ()
    }) : () -> !smt.bool
    "smt.assert"(%2) : (!smt.bool) -> ()
    %3 = "smt.exists"() <{weight = 2 : i32}> ({
    ^bb0(%arg18: !smt.int, %arg19: !smt.int):
      %26 = "smt.eq"(%arg18, %arg19) : (!smt.int, !smt.int) -> !smt.bool
      %27 = "smt.implies"(%26, %0) : (!smt.bool, !smt.bool) -> !smt.bool
      "smt.yield"(%27) : (!smt.bool) -> ()
    }) : () -> !smt.bool
    "smt.assert"(%3) : (!smt.bool) -> ()
    %4 = "smt.exists"() <{weight = 0 : i32}> ({
    ^bb0(%arg16: !smt.int, %arg17: !smt.int):
      %24 = "smt.eq"(%arg16, %arg17) : (!smt.int, !smt.int) -> !smt.bool
      %25 = "smt.implies"(%24, %0) : (!smt.bool, !smt.bool) -> !smt.bool
      "smt.yield"(%25) : (!smt.bool) -> ()
    }, {
    ^bb0(%arg14: !smt.int, %arg15: !smt.int):
      %23 = "smt.eq"(%arg14, %arg15) : (!smt.int, !smt.int) -> !smt.bool
      "smt.yield"(%23) : (!smt.bool) -> ()
    }) : () -> !smt.bool
    "smt.assert"(%4) : (!smt.bool) -> ()
    %5 = "smt.exists"() <{weight = 2 : i32}> ({
    ^bb0(%arg12: !smt.int, %arg13: !smt.int):
      %21 = "smt.eq"(%arg12, %arg13) : (!smt.int, !smt.int) -> !smt.bool
      %22 = "smt.implies"(%21, %0) : (!smt.bool, !smt.bool) -> !smt.bool
      "smt.yield"(%22) : (!smt.bool) -> ()
    }, {
    ^bb0(%arg10: !smt.int, %arg11: !smt.int):
      %20 = "smt.eq"(%arg10, %arg11) : (!smt.int, !smt.int) -> !smt.bool
      "smt.yield"(%20) : (!smt.bool) -> ()
    }) : () -> !smt.bool
    "smt.assert"(%5) : (!smt.bool) -> ()
    %6 = "smt.int.constant"() <{value = 3 : ui4}> : () -> !smt.int
    %7 = "smt.int.constant"() <{value = 4 : ui4}> : () -> !smt.int
    %8 = "smt.exists"() <{weight = 0 : i32}> ({
    ^bb0(%arg8: !smt.int, %arg9: !smt.int):
      %17 = "smt.eq"(%arg8, %6) : (!smt.int, !smt.int) -> !smt.bool
      %18 = "smt.eq"(%arg9, %7) : (!smt.int, !smt.int) -> !smt.bool
      %19 = "smt.eq"(%17, %18) : (!smt.bool, !smt.bool) -> !smt.bool
      "smt.yield"(%19) : (!smt.bool) -> ()
    }, {
    ^bb0(%arg6: !smt.int, %arg7: !smt.int):
      %16 = "smt.eq"(%arg6, %6) : (!smt.int, !smt.int) -> !smt.bool
      "smt.yield"(%16) : (!smt.bool) -> ()
    }, {
    ^bb0(%arg4: !smt.int, %arg5: !smt.int):
      %15 = "smt.eq"(%arg5, %7) : (!smt.int, !smt.int) -> !smt.bool
      "smt.yield"(%15) : (!smt.bool) -> ()
    }) : () -> !smt.bool
    "smt.assert"(%8) : (!smt.bool) -> ()
    "smt.check"() ({
      "smt.yield"() : () -> ()
    }, {
      "smt.yield"() : () -> ()
    }, {
      "smt.yield"() : () -> ()
    }) : () -> ()
    %9 = "smt.exists"() <{weight = 0 : i32}> ({
    ^bb0(%arg2: !smt.int, %arg3: !smt.int):
      %12 = "smt.eq"(%arg2, %6) : (!smt.int, !smt.int) -> !smt.bool
      %13 = "smt.eq"(%arg3, %7) : (!smt.int, !smt.int) -> !smt.bool
      %14 = "smt.eq"(%12, %13) : (!smt.bool, !smt.bool) -> !smt.bool
      "smt.yield"(%14) : (!smt.bool) -> ()
    }, {
    ^bb0(%arg0: !smt.int, %arg1: !smt.int):
      %10 = "smt.eq"(%arg0, %6) : (!smt.int, !smt.int) -> !smt.bool
      %11 = "smt.eq"(%arg1, %7) : (!smt.int, !smt.int) -> !smt.bool
      "smt.yield"(%10, %11) : (!smt.bool, !smt.bool) -> ()
    }) : () -> !smt.bool
    "smt.assert"(%9) : (!smt.bool) -> ()
    "smt.check"() ({
      "smt.yield"() : () -> ()
    }, {
      "smt.yield"() : () -> ()
    }, {
      "smt.yield"() : () -> ()
    }) : () -> ()
    "smt.yield"() : () -> ()
  }) : () -> ()
}) : () -> ()

