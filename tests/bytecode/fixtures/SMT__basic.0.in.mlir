"builtin.module"() ({
  "func.func"() <{function_type = (!smt.bool, !smt.bv<32>, !smt.int, !smt.sort<"uninterpreted_sort">, !smt.sort<"uninterpreted_sort"[!smt.bool, !smt.int]>, !smt.func<(!smt.bool, !smt.bool) !smt.bool>) -> (), sym_name = "types"}> ({
  ^bb0(%arg18: !smt.bool loc("<stdin>":3:8), %arg19: !smt.bv<32> loc("<stdin>":3:27), %arg20: !smt.int loc("<stdin>":3:48), %arg21: !smt.sort<"uninterpreted_sort"> loc("<stdin>":3:66), %arg22: !smt.sort<"uninterpreted_sort"[!smt.bool, !smt.int]> loc("<stdin>":3:107), %arg23: !smt.func<(!smt.bool, !smt.bool) !smt.bool> loc("<stdin>":3:169)):
    "func.return"() : () -> () loc("<stdin>":4:5)
  }) : () -> () loc("<stdin>":2:3)
  "func.func"() <{function_type = (i8) -> (), sym_name = "core"}> ({
  ^bb0(%arg16: i8 loc("<stdin>":7:8)):
    %12 = "smt.declare_fun"() <{namePrefix = "a"}> {smt.some_attr} : () -> !smt.bool loc("<stdin>":8:11)
    %13 = "smt.declare_fun"() {smt.some_attr} : () -> !smt.bv<32> loc("<stdin>":9:11)
    %14 = "smt.declare_fun"() {smt.some_attr} : () -> !smt.int loc("<stdin>":10:11)
    %15 = "smt.declare_fun"() {smt.some_attr} : () -> !smt.sort<"uninterpreted_sort"> loc("<stdin>":11:11)
    %16 = "smt.declare_fun"() {smt.some_attr} : () -> !smt.func<(!smt.int, !smt.bool) !smt.bool> loc("<stdin>":12:11)
    %17 = "smt.declare_fun"() {smt.some_attr} : () -> !smt.func<() !smt.bool> loc("<stdin>":13:11)
    %18 = "smt.constant"() <{value = true}> {smt.some_attr} : () -> !smt.bool loc("<stdin>":14:11)
    %19 = "smt.constant"() <{value = false}> {smt.some_attr} : () -> !smt.bool loc("<stdin>":15:11)
    "smt.assert"(%12) {smt.some_attr} : (!smt.bool) -> () loc("<stdin>":16:5)
    "smt.reset"() {smt.some_attr} : () -> () loc("<stdin>":17:5)
    "smt.push"() <{count = 1 : i32}> {smt.some_attr} : () -> () loc("<stdin>":18:5)
    "smt.pop"() <{count = 1 : i32}> {smt.some_attr} : () -> () loc("<stdin>":19:5)
    %20:2 = "smt.solver"(%arg16) ({
    ^bb0(%arg17: i8 loc("<stdin>":21:10)):
      %33 = "smt.check"() ({
        %36 = "arith.constant"() <{value = 1 : i32}> : () -> i32 loc("<stdin>":23:15)
        "smt.yield"(%36) : (i32) -> () loc("<stdin>":24:9)
      }, {
        %35 = "arith.constant"() <{value = 0 : i32}> : () -> i32 loc("<stdin>":26:15)
        "smt.yield"(%35) : (i32) -> () loc("<stdin>":27:9)
      }, {
        %34 = "arith.constant"() <{value = -1 : i32}> : () -> i32 loc("<stdin>":29:15)
        "smt.yield"(%34) : (i32) -> () loc("<stdin>":30:9)
      }) {smt.some_attr} : () -> i32 loc("<stdin>":22:13)
      "smt.yield"(%arg17, %33) : (i8, i32) -> () loc("<stdin>":32:7)
    }) {smt.some_attr} : (i8) -> (i8, i32) loc("<stdin>":20:13)
    "smt.solver"() ({
      "smt.yield"() : () -> () loc("<stdin>":35:7)
    }) : () -> () loc("<stdin>":34:5)
    "smt.solver"() ({
      "smt.set_logic"() <{logic = "AUFLIA"}> : () -> () loc("<stdin>":38:7)
      "smt.yield"() : () -> () loc("<stdin>":39:7)
    }) : () -> () loc("<stdin>":37:5)
    "smt.check"() ({
      "smt.yield"() : () -> () loc("<stdin>":42:7)
    }, {
      "smt.yield"() : () -> () loc("<stdin>":44:7)
    }, {
      "smt.yield"() : () -> () loc("<stdin>":46:7)
    }) : () -> () loc("<stdin>":41:5)
    %21 = "smt.eq"(%13, %13) {smt.some_attr} : (!smt.bv<32>, !smt.bv<32>) -> !smt.bool loc("<stdin>":48:11)
    %22 = "smt.distinct"(%13, %13) {smt.some_attr} : (!smt.bv<32>, !smt.bv<32>) -> !smt.bool loc("<stdin>":49:11)
    %23 = "smt.eq"(%12, %12, %12) : (!smt.bool, !smt.bool, !smt.bool) -> !smt.bool loc("<stdin>":50:11)
    %24 = "smt.distinct"(%12, %12, %12) : (!smt.bool, !smt.bool, !smt.bool) -> !smt.bool loc("<stdin>":51:11)
    %25 = "smt.ite"(%12, %13, %13) {smt.some_attr} : (!smt.bool, !smt.bv<32>, !smt.bv<32>) -> !smt.bv<32> loc("<stdin>":52:11)
    %26 = "smt.not"(%12) {smt.some_attr} : (!smt.bool) -> !smt.bool loc("<stdin>":53:11)
    %27 = "smt.and"(%12, %12, %12) {smt.some_attr} : (!smt.bool, !smt.bool, !smt.bool) -> !smt.bool loc("<stdin>":54:11)
    %28 = "smt.or"(%12, %12, %12) {smt.some_attr} : (!smt.bool, !smt.bool, !smt.bool) -> !smt.bool loc("<stdin>":55:11)
    %29 = "smt.xor"(%12, %12, %12) {smt.some_attr} : (!smt.bool, !smt.bool, !smt.bool) -> !smt.bool loc("<stdin>":56:11)
    %30 = "smt.implies"(%12, %12) {smt.some_attr} : (!smt.bool, !smt.bool) -> !smt.bool loc("<stdin>":57:11)
    %31 = "smt.apply_func"(%16, %14, %12) {smt.some_attr} : (!smt.func<(!smt.int, !smt.bool) !smt.bool>, !smt.int, !smt.bool) -> !smt.bool loc("<stdin>":58:11)
    %32 = "smt.apply_func"(%17) {smt.some_attr} : (!smt.func<() !smt.bool>) -> !smt.bool loc("<stdin>":59:11)
    "func.return"() : () -> () loc("<stdin>":60:5)
  }) : () -> () loc("<stdin>":6:3)
  "func.func"() <{function_type = () -> (), sym_name = "quantifiers"}> ({
    %0 = "smt.forall"() <{boundVarNames = ["a", "b"], weight = 2 : i32}> ({
    ^bb0(%arg14: !smt.bool loc("<stdin>":64:10), %arg15: !smt.bool loc("<stdin>":64:29)):
      %11 = "smt.eq"(%arg14, %arg15) : (!smt.bool, !smt.bool) -> !smt.bool loc("<stdin>":65:13)
      "smt.yield"(%11) : (!smt.bool) -> () loc("<stdin>":66:7)
    }, {
    ^bb0(%arg12: !smt.bool loc("<stdin>":68:10), %arg13: !smt.bool loc("<stdin>":68:29)):
      "smt.yield"(%arg12, %arg13) : (!smt.bool, !smt.bool) -> () loc("<stdin>":69:7)
    }, {
    ^bb0(%arg10: !smt.bool loc("<stdin>":71:10), %arg11: !smt.bool loc("<stdin>":71:29)):
      "smt.yield"(%arg10, %arg11) : (!smt.bool, !smt.bool) -> () loc("<stdin>":72:7)
    }) {smt.some_attr} : () -> !smt.bool loc("<stdin>":63:10)
    %1 = "smt.forall"() <{boundVarNames = ["a", "b"], noPattern, weight = 0 : i32}> ({
    ^bb0(%arg8: !smt.bool loc("<stdin>":75:10), %arg9: !smt.bool loc("<stdin>":75:28)):
      %10 = "smt.eq"(%arg8, %arg9) : (!smt.bool, !smt.bool) -> !smt.bool loc("<stdin>":76:13)
      "smt.yield"(%10) : (!smt.bool) -> () loc("<stdin>":77:7)
    }) {smt.some_attr} : () -> !smt.bool loc("<stdin>":74:10)
    %2 = "smt.forall"() <{weight = 0 : i32}> ({
      %9 = "smt.constant"() <{value = true}> : () -> !smt.bool loc("<stdin>":80:12)
      "smt.yield"(%9) : (!smt.bool) -> () loc("<stdin>":81:7)
    }) : () -> !smt.bool loc("<stdin>":79:10)
    %3 = "smt.exists"() <{boundVarNames = ["a", "b"], weight = 2 : i32}> ({
    ^bb0(%arg6: !smt.bool loc("<stdin>":84:10), %arg7: !smt.bool loc("<stdin>":84:28)):
      %8 = "smt.eq"(%arg6, %arg7) : (!smt.bool, !smt.bool) -> !smt.bool loc("<stdin>":85:12)
      "smt.yield"(%8) {smt.some_attr} : (!smt.bool) -> () loc("<stdin>":86:7)
    }, {
    ^bb0(%arg4: !smt.bool loc("<stdin>":88:10), %arg5: !smt.bool loc("<stdin>":88:28)):
      "smt.yield"(%arg4, %arg5) : (!smt.bool, !smt.bool) -> () loc("<stdin>":89:7)
    }, {
    ^bb0(%arg2: !smt.bool loc("<stdin>":91:10), %arg3: !smt.bool loc("<stdin>":91:28)):
      "smt.yield"(%arg2, %arg3) : (!smt.bool, !smt.bool) -> () loc("<stdin>":92:7)
    }) {smt.some_attr} : () -> !smt.bool loc("<stdin>":83:10)
    %4 = "smt.exists"() <{noPattern, weight = 0 : i32}> ({
    ^bb0(%arg0: !smt.bool loc("<stdin>":95:10), %arg1: !smt.bool loc("<stdin>":95:28)):
      %7 = "smt.eq"(%arg0, %arg1) : (!smt.bool, !smt.bool) -> !smt.bool loc("<stdin>":96:12)
      "smt.yield"(%7) {smt.some_attr} : (!smt.bool) -> () loc("<stdin>":97:7)
    }) {smt.some_attr} : () -> !smt.bool loc("<stdin>":94:10)
    %5 = "smt.exists"() <{boundVarNames = [], weight = 0 : i32}> ({
      %6 = "smt.constant"() <{value = true}> : () -> !smt.bool loc("<stdin>":100:12)
      "smt.yield"(%6) : (!smt.bool) -> () loc("<stdin>":101:7)
    }) : () -> !smt.bool loc("<stdin>":99:10)
    "func.return"() : () -> () loc("<stdin>":103:5)
  }) : () -> () loc("<stdin>":62:3)
}) : () -> () loc("<stdin>":1:1)
