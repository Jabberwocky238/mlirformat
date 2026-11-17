"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "test_loop_peeling_not_beneficial"}> ({
    %2 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":3:10)
    %3 = "arith.constant"() <{value = 40 : index}> : () -> index loc("<stdin>":4:10)
    %4 = "arith.constant"() <{value = 5 : index}> : () -> index loc("<stdin>":5:10)
    "scf.for"(%2, %3, %4) ({
    ^bb0(%arg4: index loc("<stdin>":7:10)):
      %5 = "arith.addi"(%arg4, %arg4) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index loc("<stdin>":8:12)
      "scf.yield"() : () -> () loc("<stdin>":9:7)
    }) : (index, index, index) -> () loc("<stdin>":6:5)
    "func.return"() : () -> () loc("<stdin>":11:5)
  }) : () -> () loc("<stdin>":2:3)
  "transform.named_sequence"() <{arg_attrs = [{transform.consumed}], function_type = (!transform.op<"scf.for">) -> (), sym_name = "peel"}> ({
  ^bb0(%arg3: !transform.op<"scf.for"> loc("<stdin>":14:8)):
    %1:2 = "transform.loop.peel"(%arg3) <{fail_if_already_divisible = false, peel_front = false}> : (!transform.op<"scf.for">) -> (!transform.any_op, !transform.any_op) loc("<stdin>":15:12)
    "transform.yield"() : () -> () loc("<stdin>":16:5)
  }) : () -> () loc("<stdin>":13:3)
  "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> !transform.any_op, sym_name = "match_for"}> ({
  ^bb0(%arg2: !transform.any_op loc("<stdin>":19:8)):
    "transform.match.operation_name"(%arg2) <{op_names = ["scf.for"]}> : (!transform.any_op) -> () loc("<stdin>":20:5)
    "transform.yield"(%arg2) : (!transform.any_op) -> () loc("<stdin>":21:5)
  }) : () -> () loc("<stdin>":18:3)
  "transform.named_sequence"() <{function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
  ^bb0(%arg0: !transform.any_op loc("<stdin>":24:8)):
    "transform.sequence"(%arg0) <{failure_propagation_mode = 2 : i32, operandSegmentSizes = array<i32: 1, 0>}> ({
    ^bb0(%arg1: !transform.any_op loc("<stdin>":26:10)):
      %0 = "transform.foreach_match"(%arg1) <{actions = [@peel], matchers = [@match_for]}> : (!transform.any_op) -> !transform.any_op loc("<stdin>":27:12)
      "transform.yield"() : () -> () loc("<stdin>":28:7)
    }) : (!transform.any_op) -> () loc("<stdin>":25:5)
    "transform.yield"() : () -> () loc("<stdin>":30:5)
  }) : () -> () loc("<stdin>":23:3)
}) {transform.with_named_sequence} : () -> () loc("<stdin>":1:1)
