"builtin.module"() ({
  "func.func"() <{function_type = (i1) -> (), sym_name = "test_cfg"}> ({
  ^bb0(%arg15: i1):
    "cf.br"()[^bb1] : () -> ()
  ^bb1:  // 2 preds: ^bb0, ^bb1
    "cf.cond_br"(%arg15)[^bb1, ^bb2] <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (i1) -> ()
  ^bb2:  // pred: ^bb1
    "func.return"() : () -> ()
  }) {tag = "test_cfg"} : () -> ()
  "func.func"() <{function_type = (i1, i64, i64) -> (), sym_name = "test_region_control_flow"}> ({
  ^bb0(%arg9: i1, %arg10: i64, %arg11: i64):
    "scf.if"(%arg9) ({
      "scf.yield"() {then} : () -> ()
    }, {
      "scf.yield"() {else} : () -> ()
    }) {tag = "test_if"} : (i1) -> ()
    %13 = "arith.constant"() <{value = 2 : i64}> : () -> i64
    %14:2 = "scf.while"(%arg10) ({
    ^bb0(%arg14: i64):
      %16 = "arith.cmpi"(%arg14, %arg11) <{predicate = 2 : i64}> : (i64, i64) -> i1
      "scf.condition"(%16, %arg14, %arg14) : (i1, i64, i64) -> ()
    }, {
    ^bb0(%arg12: i64, %arg13: i64):
      %15 = "arith.muli"(%arg13, %13) <{overflowFlags = #arith.overflow<none>}> : (i64, i64) -> i64
      "scf.yield"(%15) : (i64) -> ()
    }) {tag = "test_while"} : (i64) -> (i64, i64)
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32) -> i32, sym_name = "foo", sym_visibility = "private"}> ({
  ^bb0(%arg8: i32):
    "func.return"(%arg8) {a} : (i32) -> ()
  }) {tag = "foo"} : () -> ()
  "func.func"() <{function_type = (i1) -> i32, sym_name = "bar"}> ({
  ^bb0(%arg7: i1):
    "cf.cond_br"(%arg7)[^bb1, ^bb2] <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (i1) -> ()
  ^bb1:  // pred: ^bb0
    %11 = "arith.constant"() <{value = 0 : i32}> : () -> i32
    "func.return"(%11) {b} : (i32) -> ()
  ^bb2:  // pred: ^bb0
    %12 = "arith.constant"() <{value = 1 : i32}> : () -> i32
    "func.return"(%12) {c} : (i32) -> ()
  }) {tag = "bar"} : () -> ()
  "func.func"() <{function_type = (i32) -> i32, sym_name = "baz", sym_visibility = "private"}> ({
  }) {tag = "baz"} : () -> ()
  "func.func"() <{function_type = (i1, i32) -> i32, sym_name = "test_callgraph"}> ({
  ^bb0(%arg5: i1, %arg6: i32):
    %7 = "func.call"(%arg6) <{callee = @foo}> {tag = "a"} : (i32) -> i32
    "cf.cond_br"(%arg5)[^bb1, ^bb2] <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (i1) -> ()
  ^bb1:  // pred: ^bb0
    %8 = "func.call"(%arg6) <{callee = @foo}> {tag = "b"} : (i32) -> i32
    "func.return"(%8) : (i32) -> ()
  ^bb2:  // pred: ^bb0
    %9 = "func.call"(%arg5) <{callee = @bar}> {tag = "c"} : (i1) -> i32
    %10 = "func.call"(%arg6) <{callee = @baz}> {tag = "d"} : (i32) -> i32
    "func.return"(%9) : (i32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32) -> (), sym_name = "bax", sym_visibility = "private"}> ({
  ^bb0(%arg4: i32):
    "func.return"() {void_return} : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32) -> i32, sym_name = "test_callgraph_void_return"}> ({
  ^bb0(%arg3: i32):
    "func.call"(%arg3) <{callee = @bax}> {tag = "call_void_return"} : (i32) -> ()
    "func.return"(%arg3) : (i32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "test_unknown_branch"}> ({
    "test.unknown_br"()[^bb1, ^bb2] : () -> ()
  ^bb1:  // pred: ^bb0
    "func.return"() : () -> ()
  ^bb2:  // pred: ^bb0
    "func.return"() : () -> ()
  }) {tag = "test_unknown_branch"} : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "test_unknown_region"}> ({
    "test.unknown_region_br"() ({
      "test.unknown_region_end"() : () -> ()
    }, {
      "test.unknown_region_end"() : () -> ()
    }) {tag = "test_unknown_region"} : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "test_known_dead_block"}> ({
    %6 = "arith.constant"() <{value = true}> : () -> i1
    "cf.cond_br"(%6)[^bb1, ^bb2] <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (i1) -> ()
  ^bb1:  // pred: ^bb0
    "func.return"() : () -> ()
  ^bb2:  // pred: ^bb0
    "func.return"() : () -> ()
  }) {tag = "test_known_dead_block"} : () -> ()
  "func.func"() <{function_type = (i1) -> (), sym_name = "test_known_dead_edge"}> ({
  ^bb0(%arg2: i1):
    "cf.cond_br"(%arg2)[^bb1, ^bb2] <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (i1) -> ()
  ^bb1:  // pred: ^bb0
    %5 = "arith.constant"() <{value = true}> : () -> i1
    "cf.cond_br"(%5)[^bb3, ^bb2] <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (i1) -> ()
  ^bb2:  // 2 preds: ^bb0, ^bb1
    "func.return"() : () -> ()
  ^bb3:  // pred: ^bb1
    "func.return"() : () -> ()
  }) {tag = "test_known_dead_edge"} : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "test_known_region_predecessors"}> ({
    %4 = "arith.constant"() <{value = false}> : () -> i1
    "scf.if"(%4) ({
      "scf.yield"() {then} : () -> ()
    }, {
      "scf.yield"() {else} : () -> ()
    }) {tag = "test_known_if"} : (i1) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "callable"}> ({
    "func.return"() : () -> ()
  }) {tag = "callable"} : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "test_dead_callsite"}> ({
    %3 = "arith.constant"() <{value = true}> : () -> i1
    "scf.if"(%3) ({
      "func.call"() <{callee = @callable}> {then} : () -> ()
      "scf.yield"() : () -> ()
    }, {
      "func.call"() <{callee = @callable}> {else} : () -> ()
      "scf.yield"() : () -> ()
    }) : (i1) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32) -> i32, sym_name = "test_dead_return", sym_visibility = "private"}> ({
  ^bb0(%arg1: i32):
    %2 = "arith.constant"() <{value = true}> : () -> i1
    "cf.cond_br"(%2)[^bb1, ^bb1] <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (i1) -> ()
  ^bb1:  // 2 preds: ^bb0, ^bb0
    "func.return"(%arg1) {true} : (i32) -> ()
  ^bb2:  // no predecessors
    "func.return"(%arg1) {false} : (i32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32) -> (), sym_name = "test_call_dead_return"}> ({
  ^bb0(%arg0: i32):
    %1 = "func.call"(%arg0) <{callee = @test_dead_return}> {tag = "test_dead_return"} : (i32) -> i32
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "test_dca_doesnt_crash"}> ({
    %0 = "scf.execute_region"() ({
      "llvm.unreachable"() : () -> ()
    }) : () -> tensor<5x16xi16>
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "test_dca_doesnt_crash_2"}> ({
    "func.return"() : () -> ()
  }) {symbol = @notexistant} : () -> ()
}) : () -> ()

