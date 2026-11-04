"builtin.module"() ({
  "smt.solver"() ({
    %0 = "smt.bv.constant"() <{value = #smt.bv<0> : !smt.bv<32>}> : () -> !smt.bv<32>
    %1 = "smt.constant"() <{value = true}> : () -> !smt.bool
    %2 = "smt.constant"() <{value = false}> : () -> !smt.bool
    %3 = "smt.declare_fun"() <{namePrefix = "b"}> : () -> !smt.bv<32>
    %4 = "smt.eq"(%0, %3) : (!smt.bv<32>, !smt.bv<32>) -> !smt.bool
    "smt.assert"(%4) : (!smt.bool) -> ()
    %5 = "smt.distinct"(%0, %0) : (!smt.bv<32>, !smt.bv<32>) -> !smt.bool
    "smt.assert"(%5) : (!smt.bool) -> ()
    %6 = "smt.declare_fun"() <{namePrefix = "a"}> : () -> !smt.bool
    %7 = "smt.ite"(%6, %0, %3) : (!smt.bool, !smt.bv<32>, !smt.bv<32>) -> !smt.bv<32>
    %8 = "smt.eq"(%0, %7) : (!smt.bv<32>, !smt.bv<32>) -> !smt.bool
    "smt.assert"(%8) : (!smt.bool) -> ()
    %9 = "smt.not"(%1) : (!smt.bool) -> !smt.bool
    %10 = "smt.and"(%9, %1, %2) : (!smt.bool, !smt.bool, !smt.bool) -> !smt.bool
    %11 = "smt.or"(%10, %9, %1) : (!smt.bool, !smt.bool, !smt.bool) -> !smt.bool
    %12 = "smt.xor"(%9, %11) : (!smt.bool, !smt.bool) -> !smt.bool
    %13 = "smt.implies"(%12, %2) : (!smt.bool, !smt.bool) -> !smt.bool
    "smt.assert"(%13) : (!smt.bool) -> ()
    %14 = "smt.declare_fun"() <{namePrefix = "func1"}> : () -> !smt.func<(!smt.bool, !smt.bool) !smt.bool>
    %15 = "smt.apply_func"(%14, %1, %2) : (!smt.func<(!smt.bool, !smt.bool) !smt.bool>, !smt.bool, !smt.bool) -> !smt.bool
    "smt.assert"(%15) : (!smt.bool) -> ()
    %16 = "smt.forall"() <{boundVarNames = ["a", "b"], weight = 0 : i32}> ({
    ^bb0(%arg6: !smt.int, %arg7: !smt.int):
      %24 = "smt.eq"(%arg6, %arg7) : (!smt.int, !smt.int) -> !smt.bool
      "smt.yield"(%24) : (!smt.bool) -> ()
    }) : () -> !smt.bool
    "smt.assert"(%16) : (!smt.bool) -> ()
    %17 = "smt.exists"() <{weight = 0 : i32}> ({
    ^bb0(%arg4: !smt.int, %arg5: !smt.int):
      %23 = "smt.eq"(%arg4, %arg5) : (!smt.int, !smt.int) -> !smt.bool
      "smt.yield"(%23) : (!smt.bool) -> ()
    }) : () -> !smt.bool
    "smt.assert"(%17) : (!smt.bool) -> ()
    %18 = "smt.exists"() <{weight = 0 : i32}> ({
    ^bb0(%arg2: !smt.int, %arg3: !smt.int):
      %22 = "smt.eq"(%arg2, %arg3) : (!smt.int, !smt.int) -> !smt.bool
      "smt.yield"(%22) : (!smt.bool) -> ()
    }) : () -> !smt.bool
    %19 = "smt.exists"() <{weight = 0 : i32}> ({
    ^bb0(%arg0: !smt.int, %arg1: !smt.int):
      %21 = "smt.eq"(%arg0, %arg1) : (!smt.int, !smt.int) -> !smt.bool
      "smt.yield"(%21) : (!smt.bool) -> ()
    }) : () -> !smt.bool
    %20 = "smt.and"(%18, %19) : (!smt.bool, !smt.bool) -> !smt.bool
    "smt.assert"(%20) : (!smt.bool) -> ()
    "smt.check"() ({
      "smt.yield"() : () -> ()
    }, {
      "smt.yield"() : () -> ()
    }, {
      "smt.yield"() : () -> ()
    }) : () -> ()
    "smt.reset"() : () -> ()
    "smt.push"() <{count = 1 : i32}> : () -> ()
    "smt.pop"() <{count = 1 : i32}> : () -> ()
    "smt.set_logic"() <{logic = "AUFLIA"}> : () -> ()
    "smt.yield"() : () -> ()
  }) : () -> ()
}) : () -> ()

