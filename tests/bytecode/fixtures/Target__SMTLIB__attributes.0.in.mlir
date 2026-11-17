"builtin.module"() ({
  "smt.solver"() ({
    %0 = "smt.constant"() <{value = true}> : () -> !smt.bool loc("<stdin>":3:10)
    %1 = "smt.forall"() <{boundVarNames = ["a", "b"], weight = 2 : i32}> ({
    ^bb0(%arg22: !smt.int loc("<stdin>":5:10), %arg23: !smt.int loc("<stdin>":5:28)):
      %29 = "smt.eq"(%arg22, %arg23) : (!smt.int, !smt.int) -> !smt.bool loc("<stdin>":6:13)
      "smt.yield"(%29) : (!smt.bool) -> () loc("<stdin>":7:7)
    }) : () -> !smt.bool loc("<stdin>":4:10)
    "smt.assert"(%1) : (!smt.bool) -> () loc("<stdin>":9:5)
    %2 = "smt.exists"() <{weight = 2 : i32}> ({
    ^bb0(%arg20: !smt.int loc("<stdin>":11:10), %arg21: !smt.int loc("<stdin>":11:28)):
      %28 = "smt.eq"(%arg20, %arg21) : (!smt.int, !smt.int) -> !smt.bool loc("<stdin>":12:13)
      "smt.yield"(%28) : (!smt.bool) -> () loc("<stdin>":13:7)
    }) : () -> !smt.bool loc("<stdin>":10:10)
    "smt.assert"(%2) : (!smt.bool) -> () loc("<stdin>":15:5)
    %3 = "smt.exists"() <{weight = 2 : i32}> ({
    ^bb0(%arg18: !smt.int loc("<stdin>":17:10), %arg19: !smt.int loc("<stdin>":17:28)):
      %26 = "smt.eq"(%arg18, %arg19) : (!smt.int, !smt.int) -> !smt.bool loc("<stdin>":18:13)
      %27 = "smt.implies"(%26, %0) : (!smt.bool, !smt.bool) -> !smt.bool loc("<stdin>":19:13)
      "smt.yield"(%27) : (!smt.bool) -> () loc("<stdin>":20:7)
    }) : () -> !smt.bool loc("<stdin>":16:10)
    "smt.assert"(%3) : (!smt.bool) -> () loc("<stdin>":22:5)
    %4 = "smt.exists"() <{weight = 0 : i32}> ({
    ^bb0(%arg16: !smt.int loc("<stdin>":24:10), %arg17: !smt.int loc("<stdin>":24:28)):
      %24 = "smt.eq"(%arg16, %arg17) : (!smt.int, !smt.int) -> !smt.bool loc("<stdin>":25:13)
      %25 = "smt.implies"(%24, %0) : (!smt.bool, !smt.bool) -> !smt.bool loc("<stdin>":26:13)
      "smt.yield"(%25) : (!smt.bool) -> () loc("<stdin>":27:7)
    }, {
    ^bb0(%arg14: !smt.int loc("<stdin>":29:10), %arg15: !smt.int loc("<stdin>":29:28)):
      %23 = "smt.eq"(%arg14, %arg15) : (!smt.int, !smt.int) -> !smt.bool loc("<stdin>":30:13)
      "smt.yield"(%23) : (!smt.bool) -> () loc("<stdin>":31:7)
    }) : () -> !smt.bool loc("<stdin>":23:10)
    "smt.assert"(%4) : (!smt.bool) -> () loc("<stdin>":33:5)
    %5 = "smt.exists"() <{weight = 2 : i32}> ({
    ^bb0(%arg12: !smt.int loc("<stdin>":35:10), %arg13: !smt.int loc("<stdin>":35:28)):
      %21 = "smt.eq"(%arg12, %arg13) : (!smt.int, !smt.int) -> !smt.bool loc("<stdin>":36:13)
      %22 = "smt.implies"(%21, %0) : (!smt.bool, !smt.bool) -> !smt.bool loc("<stdin>":37:13)
      "smt.yield"(%22) : (!smt.bool) -> () loc("<stdin>":38:7)
    }, {
    ^bb0(%arg10: !smt.int loc("<stdin>":40:10), %arg11: !smt.int loc("<stdin>":40:28)):
      %20 = "smt.eq"(%arg10, %arg11) : (!smt.int, !smt.int) -> !smt.bool loc("<stdin>":41:13)
      "smt.yield"(%20) : (!smt.bool) -> () loc("<stdin>":42:7)
    }) : () -> !smt.bool loc("<stdin>":34:10)
    "smt.assert"(%5) : (!smt.bool) -> () loc("<stdin>":44:5)
    %6 = "smt.int.constant"() <{value = 3 : ui4}> : () -> !smt.int loc("<stdin>":45:10)
    %7 = "smt.int.constant"() <{value = 4 : ui4}> : () -> !smt.int loc("<stdin>":46:10)
    %8 = "smt.exists"() <{weight = 0 : i32}> ({
    ^bb0(%arg8: !smt.int loc("<stdin>":48:10), %arg9: !smt.int loc("<stdin>":48:27)):
      %17 = "smt.eq"(%arg8, %6) : (!smt.int, !smt.int) -> !smt.bool loc("<stdin>":49:13)
      %18 = "smt.eq"(%arg9, %7) : (!smt.int, !smt.int) -> !smt.bool loc("<stdin>":50:13)
      %19 = "smt.eq"(%17, %18) : (!smt.bool, !smt.bool) -> !smt.bool loc("<stdin>":51:13)
      "smt.yield"(%19) : (!smt.bool) -> () loc("<stdin>":52:7)
    }, {
    ^bb0(%arg6: !smt.int loc("<stdin>":54:10), %arg7: !smt.int loc("<stdin>":54:27)):
      %16 = "smt.eq"(%arg6, %6) : (!smt.int, !smt.int) -> !smt.bool loc("<stdin>":55:13)
      "smt.yield"(%16) : (!smt.bool) -> () loc("<stdin>":56:7)
    }, {
    ^bb0(%arg4: !smt.int loc("<stdin>":58:10), %arg5: !smt.int loc("<stdin>":58:27)):
      %15 = "smt.eq"(%arg5, %7) : (!smt.int, !smt.int) -> !smt.bool loc("<stdin>":59:13)
      "smt.yield"(%15) : (!smt.bool) -> () loc("<stdin>":60:7)
    }) : () -> !smt.bool loc("<stdin>":47:10)
    "smt.assert"(%8) : (!smt.bool) -> () loc("<stdin>":62:5)
    "smt.check"() ({
      "smt.yield"() : () -> () loc("<stdin>":64:7)
    }, {
      "smt.yield"() : () -> () loc("<stdin>":66:7)
    }, {
      "smt.yield"() : () -> () loc("<stdin>":68:7)
    }) : () -> () loc("<stdin>":63:5)
    %9 = "smt.exists"() <{weight = 0 : i32}> ({
    ^bb0(%arg2: !smt.int loc("<stdin>":71:10), %arg3: !smt.int loc("<stdin>":71:27)):
      %12 = "smt.eq"(%arg2, %6) : (!smt.int, !smt.int) -> !smt.bool loc("<stdin>":72:13)
      %13 = "smt.eq"(%arg3, %7) : (!smt.int, !smt.int) -> !smt.bool loc("<stdin>":73:13)
      %14 = "smt.eq"(%12, %13) : (!smt.bool, !smt.bool) -> !smt.bool loc("<stdin>":74:13)
      "smt.yield"(%14) : (!smt.bool) -> () loc("<stdin>":75:7)
    }, {
    ^bb0(%arg0: !smt.int loc("<stdin>":77:10), %arg1: !smt.int loc("<stdin>":77:27)):
      %10 = "smt.eq"(%arg0, %6) : (!smt.int, !smt.int) -> !smt.bool loc("<stdin>":78:13)
      %11 = "smt.eq"(%arg1, %7) : (!smt.int, !smt.int) -> !smt.bool loc("<stdin>":79:13)
      "smt.yield"(%10, %11) : (!smt.bool, !smt.bool) -> () loc("<stdin>":80:7)
    }) : () -> !smt.bool loc("<stdin>":70:10)
    "smt.assert"(%9) : (!smt.bool) -> () loc("<stdin>":82:5)
    "smt.check"() ({
      "smt.yield"() : () -> () loc("<stdin>":84:7)
    }, {
      "smt.yield"() : () -> () loc("<stdin>":86:7)
    }, {
      "smt.yield"() : () -> () loc("<stdin>":88:7)
    }) : () -> () loc("<stdin>":83:5)
    "smt.yield"() : () -> () loc("<stdin>":90:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
