"builtin.module"() ({
  "func.func"() <{function_type = (i1) -> (), sym_name = "test_cfg"}> ({
  ^bb0(%arg20: i1):
    "cf.br"()[^bb1] : () -> ()
  ^bb1:  // 2 preds: ^bb0, ^bb1
    "cf.cond_br"(%arg20)[^bb1, ^bb2] <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (i1) -> ()
  ^bb2:  // pred: ^bb1
    "func.return"() : () -> ()
  }) {tag = "test_cfg"} : () -> ()
  "func.func"() <{function_type = (i1, i64, i64) -> (), sym_name = "test_region_control_flow"}> ({
  ^bb0(%arg14: i1, %arg15: i64, %arg16: i64):
    "scf.if"(%arg14) ({
      "scf.yield"() {then} : () -> ()
    }, {
      "scf.yield"() {else} : () -> ()
    }) {tag = "test_if"} : (i1) -> ()
    %17 = "arith.constant"() <{value = 2 : i64}> : () -> i64
    %18:2 = "scf.while"(%arg15) ({
    ^bb0(%arg19: i64):
      %20 = "arith.cmpi"(%arg19, %arg16) <{predicate = 2 : i64}> : (i64, i64) -> i1
      "scf.condition"(%20, %arg19, %arg19) : (i1, i64, i64) -> ()
    }, {
    ^bb0(%arg17: i64, %arg18: i64):
      %19 = "arith.muli"(%arg18, %17) <{overflowFlags = #arith.overflow<none>}> : (i64, i64) -> i64
      "scf.yield"(%19) : (i64) -> ()
    }) {tag = "test_while"} : (i64) -> (i64, i64)
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32) -> i32, sym_name = "foo", sym_visibility = "private"}> ({
  ^bb0(%arg13: i32):
    "func.return"(%arg13) {a} : (i32) -> ()
  }) {tag = "foo"} : () -> ()
  "func.func"() <{function_type = (i1) -> i32, sym_name = "bar"}> ({
  ^bb0(%arg12: i1):
    "cf.cond_br"(%arg12)[^bb1, ^bb2] <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (i1) -> ()
  ^bb1:  // pred: ^bb0
    %15 = "arith.constant"() <{value = 0 : i32}> : () -> i32
    "func.return"(%15) {b} : (i32) -> ()
  ^bb2:  // pred: ^bb0
    %16 = "arith.constant"() <{value = 1 : i32}> : () -> i32
    "func.return"(%16) {c} : (i32) -> ()
  }) {tag = "bar"} : () -> ()
  "func.func"() <{function_type = (i32) -> i32, sym_name = "baz", sym_visibility = "private"}> ({
  }) {tag = "baz"} : () -> ()
  "func.func"() <{function_type = (i1, i32) -> i32, sym_name = "test_callgraph"}> ({
  ^bb0(%arg10: i1, %arg11: i32):
    %11 = "func.call"(%arg11) <{callee = @foo}> {tag = "a"} : (i32) -> i32
    "cf.cond_br"(%arg10)[^bb1, ^bb2] <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (i1) -> ()
  ^bb1:  // pred: ^bb0
    %12 = "func.call"(%arg11) <{callee = @foo}> {tag = "b"} : (i32) -> i32
    "func.return"(%12) : (i32) -> ()
  ^bb2:  // pred: ^bb0
    %13 = "func.call"(%arg10) <{callee = @bar}> {tag = "c"} : (i1) -> i32
    %14 = "func.call"(%arg11) <{callee = @baz}> {tag = "d"} : (i32) -> i32
    "func.return"(%13) : (i32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32) -> (), sym_name = "bax", sym_visibility = "private"}> ({
  ^bb0(%arg9: i32):
    "func.return"() {void_return} : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32) -> i32, sym_name = "test_callgraph_void_return"}> ({
  ^bb0(%arg8: i32):
    "func.call"(%arg8) <{callee = @bax}> {tag = "call_void_return"} : (i32) -> ()
    "func.return"(%arg8) : (i32) -> ()
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
    %10 = "arith.constant"() <{value = true}> : () -> i1
    "cf.cond_br"(%10)[^bb1, ^bb2] <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (i1) -> ()
  ^bb1:  // pred: ^bb0
    "func.return"() : () -> ()
  ^bb2:  // pred: ^bb0
    "func.return"() : () -> ()
  }) {tag = "test_known_dead_block"} : () -> ()
  "func.func"() <{function_type = (i1) -> (), sym_name = "test_known_dead_edge"}> ({
  ^bb0(%arg7: i1):
    "cf.cond_br"(%arg7)[^bb1, ^bb2] <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (i1) -> ()
  ^bb1:  // pred: ^bb0
    %9 = "arith.constant"() <{value = true}> : () -> i1
    "cf.cond_br"(%9)[^bb3, ^bb2] <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (i1) -> ()
  ^bb2:  // 2 preds: ^bb0, ^bb1
    "func.return"() : () -> ()
  ^bb3:  // pred: ^bb1
    "func.return"() : () -> ()
  }) {tag = "test_known_dead_edge"} : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "test_known_region_predecessors"}> ({
    %8 = "arith.constant"() <{value = false}> : () -> i1
    "scf.if"(%8) ({
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
    %7 = "arith.constant"() <{value = true}> : () -> i1
    "scf.if"(%7) ({
      "func.call"() <{callee = @callable}> {then} : () -> ()
      "scf.yield"() : () -> ()
    }, {
      "func.call"() <{callee = @callable}> {else} : () -> ()
      "scf.yield"() : () -> ()
    }) : (i1) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32) -> i32, sym_name = "test_dead_return", sym_visibility = "private"}> ({
  ^bb0(%arg6: i32):
    %6 = "arith.constant"() <{value = true}> : () -> i1
    "cf.cond_br"(%6)[^bb1, ^bb1] <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (i1) -> ()
  ^bb1:  // 2 preds: ^bb0, ^bb0
    "func.return"(%arg6) {true} : (i32) -> ()
  ^bb2:  // no predecessors
    "func.return"(%arg6) {false} : (i32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32) -> (), sym_name = "test_call_dead_return"}> ({
  ^bb0(%arg5: i32):
    %5 = "func.call"(%arg5) <{callee = @test_dead_return}> {tag = "test_dead_return"} : (i32) -> i32
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "test_dca_doesnt_crash"}> ({
    %4 = "scf.execute_region"() ({
      "llvm.unreachable"() : () -> ()
    }) : () -> tensor<5x16xi16>
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "test_dca_doesnt_crash_2"}> ({
    "func.return"() : () -> ()
  }) {symbol = @notexistant} : () -> ()
  "func.func"() <{function_type = (index) -> (), sym_name = "test_forall_op_control_flow"}> ({
  ^bb0(%arg3: index):
    "scf.forall"(%arg3) <{operandSegmentSizes = array<i32: 0, 1, 0, 0>, staticLowerBound = array<i64: 0>, staticStep = array<i64: 1>, staticUpperBound = array<i64: -9223372036854775808>}> ({
    ^bb0(%arg4: index):
      "scf.forall.in_parallel"() ({
      ^bb0:
      }) : () -> ()
    }) {tag = "test_forall_op_control_flow"} : (index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "test_for_op_control_flow"}> ({
    %0 = "arith.constant"() <{value = 1 : index}> : () -> index
    %1 = "arith.constant"() <{value = 5 : index}> : () -> index
    %2 = "arith.constant"() <{value = 6 : index}> : () -> index
    %3 = "arith.constant"() <{value = 7 : index}> : () -> index
    "scf.for"(%1, %1, %0) ({
    ^bb0(%arg2: index):
      "scf.yield"() : () -> ()
    }) {tag = "test_for_op_control_flow_zero"} : (index, index, index) -> ()
    "scf.for"(%1, %2, %0) ({
    ^bb0(%arg1: index):
      "scf.yield"() : () -> ()
    }) {tag = "test_for_op_control_flow_one"} : (index, index, index) -> ()
    "scf.for"(%1, %3, %0) ({
    ^bb0(%arg0: index):
      "scf.yield"() : () -> ()
    }) {tag = "test_for_op_control_flow_multi"} : (index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

