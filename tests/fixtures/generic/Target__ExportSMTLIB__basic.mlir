"builtin.module"() ({
  "smt.solver"() ({
    %39 = "smt.declare_fun"() <{namePrefix = "b"}> : () -> !smt.bv<32>
    %40 = "smt.declare_fun"() : () -> !smt.int
    %41 = "smt.declare_fun"() : () -> !smt.func<(!smt.int, !smt.bv<32>) !smt.bool>
    %42 = "smt.apply_func"(%41, %40, %39) : (!smt.func<(!smt.int, !smt.bv<32>) !smt.bool>, !smt.int, !smt.bv<32>) -> !smt.bool
    "smt.assert"(%42) : (!smt.bool) -> ()
    %43 = "smt.declare_fun"() : () -> !smt.sort<"uninterpreted">
    %44 = "smt.declare_fun"() : () -> !smt.sort<"other"[!smt.sort<"uninterpreted">]>
    %45 = "smt.declare_fun"() : () -> !smt.func<(!smt.sort<"other"[!smt.sort<"uninterpreted">]>, !smt.sort<"uninterpreted">) !smt.bool>
    %46 = "smt.apply_func"(%45, %44, %43) : (!smt.func<(!smt.sort<"other"[!smt.sort<"uninterpreted">]>, !smt.sort<"uninterpreted">) !smt.bool>, !smt.sort<"other"[!smt.sort<"uninterpreted">]>, !smt.sort<"uninterpreted">) -> !smt.bool
    "smt.assert"(%46) : (!smt.bool) -> ()
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
    %31 = "smt.constant"() <{value = true}> : () -> !smt.bool
    %32 = "smt.constant"() <{value = false}> : () -> !smt.bool
    %33 = "smt.not"(%31) : (!smt.bool) -> !smt.bool
    %34 = "smt.and"(%33, %31, %32) : (!smt.bool, !smt.bool, !smt.bool) -> !smt.bool
    %35 = "smt.or"(%34, %33, %31) : (!smt.bool, !smt.bool, !smt.bool) -> !smt.bool
    %36 = "smt.xor"(%33, %35) : (!smt.bool, !smt.bool) -> !smt.bool
    %37 = "smt.implies"(%36, %32) : (!smt.bool, !smt.bool) -> !smt.bool
    %38 = "smt.implies"(%37, %31) : (!smt.bool, !smt.bool) -> !smt.bool
    "smt.assert"(%38) : (!smt.bool) -> ()
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
    %25 = "smt.constant"() <{value = true}> : () -> !smt.bool
    %26 = "smt.constant"() <{value = false}> : () -> !smt.bool
    %27 = "smt.int.constant"() <{value = 0 : ui64}> : () -> !smt.int
    %28 = "smt.array.broadcast"(%25) : (!smt.bool) -> !smt.array<[!smt.int -> !smt.bool]>
    %29 = "smt.array.store"(%28, %27, %26) : (!smt.array<[!smt.int -> !smt.bool]>, !smt.int, !smt.bool) -> !smt.array<[!smt.int -> !smt.bool]>
    %30 = "smt.array.select"(%29, %27) : (!smt.array<[!smt.int -> !smt.bool]>, !smt.int) -> !smt.bool
    "smt.assert"(%30) : (!smt.bool) -> ()
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
    %18 = "smt.bv.constant"() <{value = #smt.bv<-1> : !smt.bv<4>}> : () -> !smt.bv<4>
    %19 = "smt.bv.constant"() <{value = #smt.bv<0> : !smt.bv<4>}> : () -> !smt.bv<4>
    %20 = "smt.bv.constant"() <{value = #smt.bv<-1> : !smt.bv<8>}> : () -> !smt.bv<8>
    %21 = "smt.bv.concat"(%18, %19) : (!smt.bv<4>, !smt.bv<4>) -> !smt.bv<8>
    %22 = "smt.bv.extract"(%21) <{lowBit = 4 : i32}> : (!smt.bv<8>) -> !smt.bv<4>
    %23 = "smt.bv.repeat"(%22) : (!smt.bv<4>) -> !smt.bv<8>
    %24 = "smt.eq"(%23, %20) : (!smt.bv<8>, !smt.bv<8>) -> !smt.bool
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
    %11 = "smt.forall"() <{boundVarNames = ["a"], weight = 0 : i32}> ({
    ^bb0(%arg0: !smt.int):
      %12 = "smt.int.constant"() <{value = 2 : ui4}> : () -> !smt.int
      %13 = "smt.int.mul"(%arg0, %12) : (!smt.int, !smt.int) -> !smt.int
      %14 = "smt.exists"() <{weight = 0 : i32}> ({
      ^bb0(%arg1: !smt.int):
        %15 = "smt.int.constant"() <{value = 2 : ui4}> : () -> !smt.int
        %16 = "smt.int.mul"(%15, %arg1) : (!smt.int, !smt.int) -> !smt.int
        %17 = "smt.eq"(%16, %13) : (!smt.int, !smt.int) -> !smt.bool
        "smt.yield"(%17) : (!smt.bool) -> ()
      }) : () -> !smt.bool
      "smt.yield"(%14) : (!smt.bool) -> ()
    }) : () -> !smt.bool
    "smt.assert"(%11) : (!smt.bool) -> ()
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
    %7 = "smt.int.constant"() <{value = 3 : ui4}> : () -> !smt.int
    %8 = "smt.int.constant"() <{value = 4 : ui4}> : () -> !smt.int
    %9 = "smt.eq"(%7, %8) : (!smt.int, !smt.int) -> !smt.bool
    %10 = "smt.eq"(%7, %7) : (!smt.int, !smt.int) -> !smt.bool
    "smt.push"() <{count = 1 : i32}> : () -> ()
    "smt.assert"(%9) : (!smt.bool) -> ()
    "smt.check"() ({
      "smt.yield"() : () -> ()
    }, {
      "smt.yield"() : () -> ()
    }, {
      "smt.yield"() : () -> ()
    }) : () -> ()
    "smt.pop"() <{count = 1 : i32}> : () -> ()
    "smt.assert"(%10) : (!smt.bool) -> ()
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
    %3 = "smt.int.constant"() <{value = 3 : ui4}> : () -> !smt.int
    %4 = "smt.int.constant"() <{value = 4 : ui4}> : () -> !smt.int
    %5 = "smt.eq"(%3, %4) : (!smt.int, !smt.int) -> !smt.bool
    %6 = "smt.eq"(%3, %3) : (!smt.int, !smt.int) -> !smt.bool
    "smt.assert"(%5) : (!smt.bool) -> ()
    "smt.check"() ({
      "smt.yield"() : () -> ()
    }, {
      "smt.yield"() : () -> ()
    }, {
      "smt.yield"() : () -> ()
    }) : () -> ()
    "smt.reset"() : () -> ()
    "smt.assert"(%6) : (!smt.bool) -> ()
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
    "smt.set_logic"() <{logic = "HORN"}> : () -> ()
    %0 = "smt.declare_fun"() : () -> !smt.int
    %1 = "smt.int.constant"() <{value = 4 : ui4}> : () -> !smt.int
    %2 = "smt.eq"(%0, %1) : (!smt.int, !smt.int) -> !smt.bool
    "smt.assert"(%2) : (!smt.bool) -> ()
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

