"builtin.module"() ({
  "smt.solver"() ({
    %28 = "smt.constant"() <{value = true}> : () -> !smt.bool
    %29 = "smt.exists"() <{weight = 2 : i32}> ({
    ^bb0(%arg18: !smt.int, %arg19: !smt.int):
      %30 = "smt.eq"(%arg18, %arg19) : (!smt.int, !smt.int) -> !smt.bool
      %31 = "smt.implies"(%30, %28) : (!smt.bool, !smt.bool) -> !smt.bool
      "smt.yield"(%31) : (!smt.bool) -> ()
    }) : () -> !smt.bool
    "smt.assert"(%29) : (!smt.bool) -> ()
    "smt.check"() ({
      "smt.yield"() : () -> ()
    }, {
      "smt.yield"() : () -> ()
    }, {
      "smt.yield"() : () -> ()
    }) : () -> ()
    "smt.yield"() : () -> ()
  }) : () -> ()
  "smt.solver"() ({
    %23 = "smt.constant"() <{value = true}> : () -> !smt.bool
    %24 = "smt.exists"() <{weight = 2 : i32}> ({
    ^bb0(%arg16: !smt.int, %arg17: !smt.int):
      %26 = "smt.eq"(%arg16, %arg17) : (!smt.int, !smt.int) -> !smt.bool
      %27 = "smt.implies"(%26, %23) : (!smt.bool, !smt.bool) -> !smt.bool
      "smt.yield"(%27) : (!smt.bool) -> ()
    }, {
    ^bb0(%arg14: !smt.int, %arg15: !smt.int):
      %25 = "smt.eq"(%arg14, %arg15) : (!smt.int, !smt.int) -> !smt.bool
      "smt.yield"(%25) : (!smt.bool) -> ()
    }) : () -> !smt.bool
    "smt.assert"(%24) : (!smt.bool) -> ()
    "smt.check"() ({
      "smt.yield"() : () -> ()
    }, {
      "smt.yield"() : () -> ()
    }, {
      "smt.yield"() : () -> ()
    }) : () -> ()
    "smt.yield"() : () -> ()
  }) : () -> ()
  "smt.solver"() ({
    %18 = "smt.constant"() <{value = true}> : () -> !smt.bool
    %19 = "smt.exists"() <{weight = 0 : i32}> ({
    ^bb0(%arg12: !smt.int, %arg13: !smt.int):
      %21 = "smt.eq"(%arg12, %arg13) : (!smt.int, !smt.int) -> !smt.bool
      %22 = "smt.implies"(%21, %18) : (!smt.bool, !smt.bool) -> !smt.bool
      "smt.yield"(%22) : (!smt.bool) -> ()
    }, {
    ^bb0(%arg10: !smt.int, %arg11: !smt.int):
      %20 = "smt.eq"(%arg10, %arg11) : (!smt.int, !smt.int) -> !smt.bool
      "smt.yield"(%20) : (!smt.bool) -> ()
    }) : () -> !smt.bool
    "smt.assert"(%19) : (!smt.bool) -> ()
    "smt.check"() ({
      "smt.yield"() : () -> ()
    }, {
      "smt.yield"() : () -> ()
    }, {
      "smt.yield"() : () -> ()
    }) : () -> ()
    "smt.yield"() : () -> ()
  }) : () -> ()
  "smt.solver"() ({
    %9 = "smt.constant"() <{value = true}> : () -> !smt.bool
    %10 = "smt.int.constant"() <{value = 3 : ui4}> : () -> !smt.int
    %11 = "smt.int.constant"() <{value = 4 : ui4}> : () -> !smt.int
    %12 = "smt.exists"() <{weight = 0 : i32}> ({
    ^bb0(%arg8: !smt.int, %arg9: !smt.int):
      %15 = "smt.eq"(%arg8, %10) : (!smt.int, !smt.int) -> !smt.bool
      %16 = "smt.eq"(%arg9, %11) : (!smt.int, !smt.int) -> !smt.bool
      %17 = "smt.eq"(%15, %16) : (!smt.bool, !smt.bool) -> !smt.bool
      "smt.yield"(%17) : (!smt.bool) -> ()
    }, {
    ^bb0(%arg6: !smt.int, %arg7: !smt.int):
      %14 = "smt.eq"(%arg6, %10) : (!smt.int, !smt.int) -> !smt.bool
      "smt.yield"(%14) : (!smt.bool) -> ()
    }, {
    ^bb0(%arg4: !smt.int, %arg5: !smt.int):
      %13 = "smt.eq"(%arg5, %11) : (!smt.int, !smt.int) -> !smt.bool
      "smt.yield"(%13) : (!smt.bool) -> ()
    }) : () -> !smt.bool
    "smt.assert"(%12) : (!smt.bool) -> ()
    "smt.check"() ({
      "smt.yield"() : () -> ()
    }, {
      "smt.yield"() : () -> ()
    }, {
      "smt.yield"() : () -> ()
    }) : () -> ()
    "smt.yield"() : () -> ()
  }) : () -> ()
  "smt.solver"() ({
    %0 = "smt.constant"() <{value = true}> : () -> !smt.bool
    %1 = "smt.int.constant"() <{value = 3 : ui4}> : () -> !smt.int
    %2 = "smt.int.constant"() <{value = 4 : ui4}> : () -> !smt.int
    %3 = "smt.exists"() <{weight = 0 : i32}> ({
    ^bb0(%arg2: !smt.int, %arg3: !smt.int):
      %6 = "smt.eq"(%arg2, %1) : (!smt.int, !smt.int) -> !smt.bool
      %7 = "smt.eq"(%arg3, %2) : (!smt.int, !smt.int) -> !smt.bool
      %8 = "smt.eq"(%6, %7) : (!smt.bool, !smt.bool) -> !smt.bool
      "smt.yield"(%8) : (!smt.bool) -> ()
    }, {
    ^bb0(%arg0: !smt.int, %arg1: !smt.int):
      %4 = "smt.eq"(%arg0, %1) : (!smt.int, !smt.int) -> !smt.bool
      %5 = "smt.eq"(%arg1, %2) : (!smt.int, !smt.int) -> !smt.bool
      "smt.yield"(%4, %5) : (!smt.bool, !smt.bool) -> ()
    }) : () -> !smt.bool
    "smt.assert"(%3) : (!smt.bool) -> ()
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

