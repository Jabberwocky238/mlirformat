module {
  func.func @types(%arg0: !smt.bool, %arg1: !smt.bv<32>, %arg2: !smt.int, %arg3: !smt.sort<"uninterpreted_sort">, %arg4: !smt.sort<"uninterpreted_sort"[!smt.bool, !smt.int]>, %arg5: !smt.func<(!smt.bool, !smt.bool) !smt.bool>) {
    return
  }
  func.func @core(%arg0: i8) {
    %a = smt.declare_fun "a" {smt.some_attr} : !smt.bool
    %0 = smt.declare_fun {smt.some_attr} : !smt.bv<32>
    %1 = smt.declare_fun {smt.some_attr} : !smt.int
    %2 = smt.declare_fun {smt.some_attr} : !smt.sort<"uninterpreted_sort">
    %3 = smt.declare_fun {smt.some_attr} : !smt.func<(!smt.int, !smt.bool) !smt.bool>
    %4 = smt.declare_fun {smt.some_attr} : !smt.func<() !smt.bool>
    %true = smt.constant true {smt.some_attr}
    %false = smt.constant false {smt.some_attr}
    smt.assert %a {smt.some_attr}
    smt.reset {smt.some_attr}
    smt.push 1 {smt.some_attr}
    smt.pop 1 {smt.some_attr}
    %5:2 = smt.solver(%arg0) {smt.some_attr} : (i8) -> (i8, i32) {
    ^bb0(%arg1: i8):
      %18 = smt.check {smt.some_attr} sat {
        %c1_i32 = arith.constant 1 : i32
        smt.yield %c1_i32 : i32
      } unknown {
        %c0_i32 = arith.constant 0 : i32
        smt.yield %c0_i32 : i32
      } unsat {
        %c-1_i32 = arith.constant -1 : i32
        smt.yield %c-1_i32 : i32
      } -> i32
      smt.yield %arg1, %18 : i8, i32
    }
    smt.solver() : () -> () {
    }
    smt.solver() : () -> () {
      smt.set_logic "AUFLIA"
    }
    smt.check sat {
    } unknown {
    } unsat {
    }
    %6 = smt.eq %0, %0 {smt.some_attr} : !smt.bv<32>
    %7 = smt.distinct %0, %0 {smt.some_attr} : !smt.bv<32>
    %8 = smt.eq %a, %a, %a : !smt.bool
    %9 = smt.distinct %a, %a, %a : !smt.bool
    %10 = smt.ite %a, %0, %0 {smt.some_attr} : !smt.bv<32>
    %11 = smt.not %a {smt.some_attr}
    %12 = smt.and %a, %a, %a {smt.some_attr}
    %13 = smt.or %a, %a, %a {smt.some_attr}
    %14 = smt.xor %a, %a, %a {smt.some_attr}
    %15 = smt.implies %a, %a {smt.some_attr}
    %16 = smt.apply_func %3(%1, %a) {smt.some_attr} : !smt.func<(!smt.int, !smt.bool) !smt.bool>
    %17 = smt.apply_func %4() {smt.some_attr} : !smt.func<() !smt.bool>
    return
  }
  func.func @quantifiers() {
    %0 = smt.forall ["a", "b"] weight 2 attributes {smt.some_attr} {
    ^bb0(%arg0: !smt.bool, %arg1: !smt.bool):
      %6 = smt.eq %arg0, %arg1 : !smt.bool
      smt.yield %6 : !smt.bool
    } patterns {
    ^bb0(%arg0: !smt.bool, %arg1: !smt.bool):
      smt.yield %arg0, %arg1 : !smt.bool, !smt.bool
    }, {
    ^bb0(%arg0: !smt.bool, %arg1: !smt.bool):
      smt.yield %arg0, %arg1 : !smt.bool, !smt.bool
    }
    %1 = smt.forall ["a", "b"] no_pattern attributes {smt.some_attr} {
    ^bb0(%arg0: !smt.bool, %arg1: !smt.bool):
      %6 = smt.eq %arg0, %arg1 : !smt.bool
      smt.yield %6 : !smt.bool
    }
    %2 = smt.forall {
      %true = smt.constant true
      smt.yield %true : !smt.bool
    }
    %3 = smt.exists ["a", "b"] weight 2 attributes {smt.some_attr} {
    ^bb0(%arg0: !smt.bool, %arg1: !smt.bool):
      %6 = smt.eq %arg0, %arg1 : !smt.bool
      smt.yield %6 : !smt.bool {smt.some_attr}
    } patterns {
    ^bb0(%arg0: !smt.bool, %arg1: !smt.bool):
      smt.yield %arg0, %arg1 : !smt.bool, !smt.bool
    }, {
    ^bb0(%arg0: !smt.bool, %arg1: !smt.bool):
      smt.yield %arg0, %arg1 : !smt.bool, !smt.bool
    }
    %4 = smt.exists no_pattern attributes {smt.some_attr} {
    ^bb0(%arg0: !smt.bool, %arg1: !smt.bool):
      %6 = smt.eq %arg0, %arg1 : !smt.bool
      smt.yield %6 : !smt.bool {smt.some_attr}
    }
    %5 = smt.exists [] {
      %true = smt.constant true
      smt.yield %true : !smt.bool
    }
    return
  }
}

