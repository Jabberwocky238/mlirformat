"builtin.module"() ({
  "smt.solver"() ({
    %28 = "smt.constant"() <{value = true}> : () -> !smt.bool loc("<stdin>":3:11)
    %29 = "smt.exists"() <{weight = 2 : i32}> ({
    ^bb0(%arg18: !smt.int loc("<stdin>":5:10), %arg19: !smt.int loc("<stdin>":5:28)):
      %30 = "smt.eq"(%arg18, %arg19) : (!smt.int, !smt.int) -> !smt.bool loc("<stdin>":6:13)
      %31 = "smt.implies"(%30, %28) : (!smt.bool, !smt.bool) -> !smt.bool loc("<stdin>":7:13)
      "smt.yield"(%31) : (!smt.bool) -> () loc("<stdin>":8:7)
    }) : () -> !smt.bool loc("<stdin>":4:11)
    "smt.assert"(%29) : (!smt.bool) -> () loc("<stdin>":10:5)
    "smt.check"() ({
      "smt.yield"() : () -> () loc("<stdin>":12:7)
    }, {
      "smt.yield"() : () -> () loc("<stdin>":14:7)
    }, {
      "smt.yield"() : () -> () loc("<stdin>":16:7)
    }) : () -> () loc("<stdin>":11:5)
    "smt.yield"() : () -> () loc("<stdin>":18:5)
  }) : () -> () loc("<stdin>":2:3)
  "smt.solver"() ({
    %23 = "smt.constant"() <{value = true}> : () -> !smt.bool loc("<stdin>":21:11)
    %24 = "smt.exists"() <{weight = 2 : i32}> ({
    ^bb0(%arg16: !smt.int loc("<stdin>":23:10), %arg17: !smt.int loc("<stdin>":23:28)):
      %26 = "smt.eq"(%arg16, %arg17) : (!smt.int, !smt.int) -> !smt.bool loc("<stdin>":24:13)
      %27 = "smt.implies"(%26, %23) : (!smt.bool, !smt.bool) -> !smt.bool loc("<stdin>":25:13)
      "smt.yield"(%27) : (!smt.bool) -> () loc("<stdin>":26:7)
    }, {
    ^bb0(%arg14: !smt.int loc("<stdin>":28:10), %arg15: !smt.int loc("<stdin>":28:28)):
      %25 = "smt.eq"(%arg14, %arg15) : (!smt.int, !smt.int) -> !smt.bool loc("<stdin>":29:13)
      "smt.yield"(%25) : (!smt.bool) -> () loc("<stdin>":30:7)
    }) : () -> !smt.bool loc("<stdin>":22:11)
    "smt.assert"(%24) : (!smt.bool) -> () loc("<stdin>":32:5)
    "smt.check"() ({
      "smt.yield"() : () -> () loc("<stdin>":34:7)
    }, {
      "smt.yield"() : () -> () loc("<stdin>":36:7)
    }, {
      "smt.yield"() : () -> () loc("<stdin>":38:7)
    }) : () -> () loc("<stdin>":33:5)
    "smt.yield"() : () -> () loc("<stdin>":40:5)
  }) : () -> () loc("<stdin>":20:3)
  "smt.solver"() ({
    %18 = "smt.constant"() <{value = true}> : () -> !smt.bool loc("<stdin>":43:11)
    %19 = "smt.exists"() <{weight = 0 : i32}> ({
    ^bb0(%arg12: !smt.int loc("<stdin>":45:10), %arg13: !smt.int loc("<stdin>":45:28)):
      %21 = "smt.eq"(%arg12, %arg13) : (!smt.int, !smt.int) -> !smt.bool loc("<stdin>":46:13)
      %22 = "smt.implies"(%21, %18) : (!smt.bool, !smt.bool) -> !smt.bool loc("<stdin>":47:13)
      "smt.yield"(%22) : (!smt.bool) -> () loc("<stdin>":48:7)
    }, {
    ^bb0(%arg10: !smt.int loc("<stdin>":50:10), %arg11: !smt.int loc("<stdin>":50:28)):
      %20 = "smt.eq"(%arg10, %arg11) : (!smt.int, !smt.int) -> !smt.bool loc("<stdin>":51:13)
      "smt.yield"(%20) : (!smt.bool) -> () loc("<stdin>":52:7)
    }) : () -> !smt.bool loc("<stdin>":44:11)
    "smt.assert"(%19) : (!smt.bool) -> () loc("<stdin>":54:5)
    "smt.check"() ({
      "smt.yield"() : () -> () loc("<stdin>":56:7)
    }, {
      "smt.yield"() : () -> () loc("<stdin>":58:7)
    }, {
      "smt.yield"() : () -> () loc("<stdin>":60:7)
    }) : () -> () loc("<stdin>":55:5)
    "smt.yield"() : () -> () loc("<stdin>":62:5)
  }) : () -> () loc("<stdin>":42:3)
  "smt.solver"() ({
    %9 = "smt.constant"() <{value = true}> : () -> !smt.bool loc("<stdin>":65:10)
    %10 = "smt.int.constant"() <{value = 3 : ui4}> : () -> !smt.int loc("<stdin>":66:11)
    %11 = "smt.int.constant"() <{value = 4 : ui4}> : () -> !smt.int loc("<stdin>":67:11)
    %12 = "smt.exists"() <{weight = 0 : i32}> ({
    ^bb0(%arg8: !smt.int loc("<stdin>":69:10), %arg9: !smt.int loc("<stdin>":69:27)):
      %15 = "smt.eq"(%arg8, %10) : (!smt.int, !smt.int) -> !smt.bool loc("<stdin>":70:13)
      %16 = "smt.eq"(%arg9, %11) : (!smt.int, !smt.int) -> !smt.bool loc("<stdin>":71:13)
      %17 = "smt.eq"(%15, %16) : (!smt.bool, !smt.bool) -> !smt.bool loc("<stdin>":72:13)
      "smt.yield"(%17) : (!smt.bool) -> () loc("<stdin>":73:7)
    }, {
    ^bb0(%arg6: !smt.int loc("<stdin>":75:10), %arg7: !smt.int loc("<stdin>":75:27)):
      %14 = "smt.eq"(%arg6, %10) : (!smt.int, !smt.int) -> !smt.bool loc("<stdin>":76:13)
      "smt.yield"(%14) : (!smt.bool) -> () loc("<stdin>":77:7)
    }, {
    ^bb0(%arg4: !smt.int loc("<stdin>":79:10), %arg5: !smt.int loc("<stdin>":79:27)):
      %13 = "smt.eq"(%arg5, %11) : (!smt.int, !smt.int) -> !smt.bool loc("<stdin>":80:13)
      "smt.yield"(%13) : (!smt.bool) -> () loc("<stdin>":81:7)
    }) : () -> !smt.bool loc("<stdin>":68:11)
    "smt.assert"(%12) : (!smt.bool) -> () loc("<stdin>":83:5)
    "smt.check"() ({
      "smt.yield"() : () -> () loc("<stdin>":85:7)
    }, {
      "smt.yield"() : () -> () loc("<stdin>":87:7)
    }, {
      "smt.yield"() : () -> () loc("<stdin>":89:7)
    }) : () -> () loc("<stdin>":84:5)
    "smt.yield"() : () -> () loc("<stdin>":91:5)
  }) : () -> () loc("<stdin>":64:3)
  "smt.solver"() ({
    %0 = "smt.constant"() <{value = true}> : () -> !smt.bool loc("<stdin>":94:10)
    %1 = "smt.int.constant"() <{value = 3 : ui4}> : () -> !smt.int loc("<stdin>":95:10)
    %2 = "smt.int.constant"() <{value = 4 : ui4}> : () -> !smt.int loc("<stdin>":96:10)
    %3 = "smt.exists"() <{weight = 0 : i32}> ({
    ^bb0(%arg2: !smt.int loc("<stdin>":98:10), %arg3: !smt.int loc("<stdin>":98:27)):
      %6 = "smt.eq"(%arg2, %1) : (!smt.int, !smt.int) -> !smt.bool loc("<stdin>":99:12)
      %7 = "smt.eq"(%arg3, %2) : (!smt.int, !smt.int) -> !smt.bool loc("<stdin>":100:12)
      %8 = "smt.eq"(%6, %7) : (!smt.bool, !smt.bool) -> !smt.bool loc("<stdin>":101:12)
      "smt.yield"(%8) : (!smt.bool) -> () loc("<stdin>":102:7)
    }, {
    ^bb0(%arg0: !smt.int loc("<stdin>":104:10), %arg1: !smt.int loc("<stdin>":104:27)):
      %4 = "smt.eq"(%arg0, %1) : (!smt.int, !smt.int) -> !smt.bool loc("<stdin>":105:12)
      %5 = "smt.eq"(%arg1, %2) : (!smt.int, !smt.int) -> !smt.bool loc("<stdin>":106:12)
      "smt.yield"(%4, %5) : (!smt.bool, !smt.bool) -> () loc("<stdin>":107:7)
    }) : () -> !smt.bool loc("<stdin>":97:10)
    "smt.assert"(%3) : (!smt.bool) -> () loc("<stdin>":109:5)
    "smt.check"() ({
      "smt.yield"() : () -> () loc("<stdin>":111:7)
    }, {
      "smt.yield"() : () -> () loc("<stdin>":113:7)
    }, {
      "smt.yield"() : () -> () loc("<stdin>":115:7)
    }) : () -> () loc("<stdin>":110:5)
    "smt.yield"() : () -> () loc("<stdin>":117:5)
  }) : () -> () loc("<stdin>":93:3)
}) : () -> () loc("<stdin>":1:1)
