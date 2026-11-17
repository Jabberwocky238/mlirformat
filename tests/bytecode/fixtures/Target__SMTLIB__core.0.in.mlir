"builtin.module"() ({
  "smt.solver"() ({
    %0 = "smt.bv.constant"() <{value = #smt.bv<0> : !smt.bv<32>}> : () -> !smt.bv<32> loc("<stdin>":3:10)
    %1 = "smt.constant"() <{value = true}> : () -> !smt.bool loc("<stdin>":4:10)
    %2 = "smt.constant"() <{value = false}> : () -> !smt.bool loc("<stdin>":5:10)
    %3 = "smt.declare_fun"() <{namePrefix = "b"}> : () -> !smt.bv<32> loc("<stdin>":6:10)
    %4 = "smt.eq"(%0, %3) : (!smt.bv<32>, !smt.bv<32>) -> !smt.bool loc("<stdin>":7:10)
    "smt.assert"(%4) : (!smt.bool) -> () loc("<stdin>":8:5)
    %5 = "smt.distinct"(%0, %0) : (!smt.bv<32>, !smt.bv<32>) -> !smt.bool loc("<stdin>":9:10)
    "smt.assert"(%5) : (!smt.bool) -> () loc("<stdin>":10:5)
    %6 = "smt.declare_fun"() <{namePrefix = "a"}> : () -> !smt.bool loc("<stdin>":11:10)
    %7 = "smt.ite"(%6, %0, %3) : (!smt.bool, !smt.bv<32>, !smt.bv<32>) -> !smt.bv<32> loc("<stdin>":12:10)
    %8 = "smt.eq"(%0, %7) : (!smt.bv<32>, !smt.bv<32>) -> !smt.bool loc("<stdin>":13:10)
    "smt.assert"(%8) : (!smt.bool) -> () loc("<stdin>":14:5)
    %9 = "smt.not"(%1) : (!smt.bool) -> !smt.bool loc("<stdin>":15:10)
    %10 = "smt.and"(%9, %1, %2) : (!smt.bool, !smt.bool, !smt.bool) -> !smt.bool loc("<stdin>":16:11)
    %11 = "smt.or"(%10, %9, %1) : (!smt.bool, !smt.bool, !smt.bool) -> !smt.bool loc("<stdin>":17:11)
    %12 = "smt.xor"(%9, %11) : (!smt.bool, !smt.bool) -> !smt.bool loc("<stdin>":18:11)
    %13 = "smt.implies"(%12, %2) : (!smt.bool, !smt.bool) -> !smt.bool loc("<stdin>":19:11)
    "smt.assert"(%13) : (!smt.bool) -> () loc("<stdin>":20:5)
    %14 = "smt.declare_fun"() <{namePrefix = "func1"}> : () -> !smt.func<(!smt.bool, !smt.bool) !smt.bool> loc("<stdin>":21:11)
    %15 = "smt.apply_func"(%14, %1, %2) : (!smt.func<(!smt.bool, !smt.bool) !smt.bool>, !smt.bool, !smt.bool) -> !smt.bool loc("<stdin>":22:11)
    "smt.assert"(%15) : (!smt.bool) -> () loc("<stdin>":23:5)
    %16 = "smt.forall"() <{boundVarNames = ["a", "b"], weight = 0 : i32}> ({
    ^bb0(%arg6: !smt.int loc("<stdin>":25:10), %arg7: !smt.int loc("<stdin>":25:27)):
      %24 = "smt.eq"(%arg6, %arg7) : (!smt.int, !smt.int) -> !smt.bool loc("<stdin>":26:13)
      "smt.yield"(%24) : (!smt.bool) -> () loc("<stdin>":27:7)
    }) : () -> !smt.bool loc("<stdin>":24:11)
    "smt.assert"(%16) : (!smt.bool) -> () loc("<stdin>":29:5)
    %17 = "smt.exists"() <{weight = 0 : i32}> ({
    ^bb0(%arg4: !smt.int loc("<stdin>":31:10), %arg5: !smt.int loc("<stdin>":31:27)):
      %23 = "smt.eq"(%arg4, %arg5) : (!smt.int, !smt.int) -> !smt.bool loc("<stdin>":32:13)
      "smt.yield"(%23) : (!smt.bool) -> () loc("<stdin>":33:7)
    }) : () -> !smt.bool loc("<stdin>":30:11)
    "smt.assert"(%17) : (!smt.bool) -> () loc("<stdin>":35:5)
    %18 = "smt.exists"() <{weight = 0 : i32}> ({
    ^bb0(%arg2: !smt.int loc("<stdin>":37:10), %arg3: !smt.int loc("<stdin>":37:27)):
      %22 = "smt.eq"(%arg2, %arg3) : (!smt.int, !smt.int) -> !smt.bool loc("<stdin>":38:13)
      "smt.yield"(%22) : (!smt.bool) -> () loc("<stdin>":39:7)
    }) : () -> !smt.bool loc("<stdin>":36:11)
    %19 = "smt.exists"() <{weight = 0 : i32}> ({
    ^bb0(%arg0: !smt.int loc("<stdin>":42:10), %arg1: !smt.int loc("<stdin>":42:27)):
      %21 = "smt.eq"(%arg0, %arg1) : (!smt.int, !smt.int) -> !smt.bool loc("<stdin>":43:13)
      "smt.yield"(%21) : (!smt.bool) -> () loc("<stdin>":44:7)
    }) : () -> !smt.bool loc("<stdin>":41:11)
    %20 = "smt.and"(%18, %19) : (!smt.bool, !smt.bool) -> !smt.bool loc("<stdin>":46:11)
    "smt.assert"(%20) : (!smt.bool) -> () loc("<stdin>":47:5)
    "smt.check"() ({
      "smt.yield"() : () -> () loc("<stdin>":49:7)
    }, {
      "smt.yield"() : () -> () loc("<stdin>":51:7)
    }, {
      "smt.yield"() : () -> () loc("<stdin>":53:7)
    }) : () -> () loc("<stdin>":48:5)
    "smt.reset"() : () -> () loc("<stdin>":55:5)
    "smt.push"() <{count = 1 : i32}> : () -> () loc("<stdin>":56:5)
    "smt.pop"() <{count = 1 : i32}> : () -> () loc("<stdin>":57:5)
    "smt.set_logic"() <{logic = "AUFLIA"}> : () -> () loc("<stdin>":58:5)
    "smt.yield"() : () -> () loc("<stdin>":59:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
