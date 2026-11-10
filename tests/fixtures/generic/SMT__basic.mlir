"builtin.module"() ({
  "func.func"() <{function_type = (!smt.bool, !smt.bv<32>, !smt.int, !smt.sort<"uninterpreted_sort">, !smt.sort<"uninterpreted_sort"[!smt.bool, !smt.int]>, !smt.func<(!smt.bool, !smt.bool) !smt.bool>) -> (), sym_name = "types"}> ({
  ^bb0(%arg18: !smt.bool, %arg19: !smt.bv<32>, %arg20: !smt.int, %arg21: !smt.sort<"uninterpreted_sort">, %arg22: !smt.sort<"uninterpreted_sort"[!smt.bool, !smt.int]>, %arg23: !smt.func<(!smt.bool, !smt.bool) !smt.bool>):
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i8) -> (), sym_name = "core"}> ({
  ^bb0(%arg16: i8):
    %12 = "smt.declare_fun"() <{namePrefix = "a"}> {smt.some_attr} : () -> !smt.bool
    %13 = "smt.declare_fun"() {smt.some_attr} : () -> !smt.bv<32>
    %14 = "smt.declare_fun"() {smt.some_attr} : () -> !smt.int
    %15 = "smt.declare_fun"() {smt.some_attr} : () -> !smt.sort<"uninterpreted_sort">
    %16 = "smt.declare_fun"() {smt.some_attr} : () -> !smt.func<(!smt.int, !smt.bool) !smt.bool>
    %17 = "smt.declare_fun"() {smt.some_attr} : () -> !smt.func<() !smt.bool>
    %18 = "smt.constant"() <{value = true}> {smt.some_attr} : () -> !smt.bool
    %19 = "smt.constant"() <{value = false}> {smt.some_attr} : () -> !smt.bool
    "smt.assert"(%12) {smt.some_attr} : (!smt.bool) -> ()
    "smt.reset"() {smt.some_attr} : () -> ()
    "smt.push"() <{count = 1 : i32}> {smt.some_attr} : () -> ()
    "smt.pop"() <{count = 1 : i32}> {smt.some_attr} : () -> ()
    %20:2 = "smt.solver"(%arg16) ({
    ^bb0(%arg17: i8):
      %33 = "smt.check"() ({
        %36 = "arith.constant"() <{value = 1 : i32}> : () -> i32
        "smt.yield"(%36) : (i32) -> ()
      }, {
        %35 = "arith.constant"() <{value = 0 : i32}> : () -> i32
        "smt.yield"(%35) : (i32) -> ()
      }, {
        %34 = "arith.constant"() <{value = -1 : i32}> : () -> i32
        "smt.yield"(%34) : (i32) -> ()
      }) {smt.some_attr} : () -> i32
      "smt.yield"(%arg17, %33) : (i8, i32) -> ()
    }) {smt.some_attr} : (i8) -> (i8, i32)
    "smt.solver"() ({
      "smt.yield"() : () -> ()
    }) : () -> ()
    "smt.solver"() ({
      "smt.set_logic"() <{logic = "AUFLIA"}> : () -> ()
      "smt.yield"() : () -> ()
    }) : () -> ()
    "smt.check"() ({
      "smt.yield"() : () -> ()
    }, {
      "smt.yield"() : () -> ()
    }, {
      "smt.yield"() : () -> ()
    }) : () -> ()
    %21 = "smt.eq"(%13, %13) {smt.some_attr} : (!smt.bv<32>, !smt.bv<32>) -> !smt.bool
    %22 = "smt.distinct"(%13, %13) {smt.some_attr} : (!smt.bv<32>, !smt.bv<32>) -> !smt.bool
    %23 = "smt.eq"(%12, %12, %12) : (!smt.bool, !smt.bool, !smt.bool) -> !smt.bool
    %24 = "smt.distinct"(%12, %12, %12) : (!smt.bool, !smt.bool, !smt.bool) -> !smt.bool
    %25 = "smt.ite"(%12, %13, %13) {smt.some_attr} : (!smt.bool, !smt.bv<32>, !smt.bv<32>) -> !smt.bv<32>
    %26 = "smt.not"(%12) {smt.some_attr} : (!smt.bool) -> !smt.bool
    %27 = "smt.and"(%12, %12, %12) {smt.some_attr} : (!smt.bool, !smt.bool, !smt.bool) -> !smt.bool
    %28 = "smt.or"(%12, %12, %12) {smt.some_attr} : (!smt.bool, !smt.bool, !smt.bool) -> !smt.bool
    %29 = "smt.xor"(%12, %12, %12) {smt.some_attr} : (!smt.bool, !smt.bool, !smt.bool) -> !smt.bool
    %30 = "smt.implies"(%12, %12) {smt.some_attr} : (!smt.bool, !smt.bool) -> !smt.bool
    %31 = "smt.apply_func"(%16, %14, %12) {smt.some_attr} : (!smt.func<(!smt.int, !smt.bool) !smt.bool>, !smt.int, !smt.bool) -> !smt.bool
    %32 = "smt.apply_func"(%17) {smt.some_attr} : (!smt.func<() !smt.bool>) -> !smt.bool
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "quantifiers"}> ({
    %0 = "smt.forall"() <{boundVarNames = ["a", "b"], weight = 2 : i32}> ({
    ^bb0(%arg14: !smt.bool, %arg15: !smt.bool):
      %11 = "smt.eq"(%arg14, %arg15) : (!smt.bool, !smt.bool) -> !smt.bool
      "smt.yield"(%11) : (!smt.bool) -> ()
    }, {
    ^bb0(%arg12: !smt.bool, %arg13: !smt.bool):
      "smt.yield"(%arg12, %arg13) : (!smt.bool, !smt.bool) -> ()
    }, {
    ^bb0(%arg10: !smt.bool, %arg11: !smt.bool):
      "smt.yield"(%arg10, %arg11) : (!smt.bool, !smt.bool) -> ()
    }) {smt.some_attr} : () -> !smt.bool
    %1 = "smt.forall"() <{boundVarNames = ["a", "b"], noPattern, weight = 0 : i32}> ({
    ^bb0(%arg8: !smt.bool, %arg9: !smt.bool):
      %10 = "smt.eq"(%arg8, %arg9) : (!smt.bool, !smt.bool) -> !smt.bool
      "smt.yield"(%10) : (!smt.bool) -> ()
    }) {smt.some_attr} : () -> !smt.bool
    %2 = "smt.forall"() <{weight = 0 : i32}> ({
      %9 = "smt.constant"() <{value = true}> : () -> !smt.bool
      "smt.yield"(%9) : (!smt.bool) -> ()
    }) : () -> !smt.bool
    %3 = "smt.exists"() <{boundVarNames = ["a", "b"], weight = 2 : i32}> ({
    ^bb0(%arg6: !smt.bool, %arg7: !smt.bool):
      %8 = "smt.eq"(%arg6, %arg7) : (!smt.bool, !smt.bool) -> !smt.bool
      "smt.yield"(%8) {smt.some_attr} : (!smt.bool) -> ()
    }, {
    ^bb0(%arg4: !smt.bool, %arg5: !smt.bool):
      "smt.yield"(%arg4, %arg5) : (!smt.bool, !smt.bool) -> ()
    }, {
    ^bb0(%arg2: !smt.bool, %arg3: !smt.bool):
      "smt.yield"(%arg2, %arg3) : (!smt.bool, !smt.bool) -> ()
    }) {smt.some_attr} : () -> !smt.bool
    %4 = "smt.exists"() <{noPattern, weight = 0 : i32}> ({
    ^bb0(%arg0: !smt.bool, %arg1: !smt.bool):
      %7 = "smt.eq"(%arg0, %arg1) : (!smt.bool, !smt.bool) -> !smt.bool
      "smt.yield"(%7) {smt.some_attr} : (!smt.bool) -> ()
    }) {smt.some_attr} : () -> !smt.bool
    %5 = "smt.exists"() <{boundVarNames = [], weight = 0 : i32}> ({
      %6 = "smt.constant"() <{value = true}> : () -> !smt.bool
      "smt.yield"(%6) : (!smt.bool) -> ()
    }) : () -> !smt.bool
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

