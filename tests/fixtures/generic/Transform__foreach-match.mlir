"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "test_loop_peeling_not_beneficial"}> ({
    %2 = "arith.constant"() <{value = 0 : index}> : () -> index
    %3 = "arith.constant"() <{value = 40 : index}> : () -> index
    %4 = "arith.constant"() <{value = 5 : index}> : () -> index
    "scf.for"(%2, %3, %4) ({
    ^bb0(%arg4: index):
      %5 = "arith.addi"(%arg4, %arg4) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "transform.named_sequence"() <{arg_attrs = [{transform.consumed}], function_type = (!transform.op<"scf.for">) -> (), sym_name = "peel"}> ({
  ^bb0(%arg3: !transform.op<"scf.for">):
    %1:2 = "transform.loop.peel"(%arg3) <{fail_if_already_divisible = false, peel_front = false}> : (!transform.op<"scf.for">) -> (!transform.any_op, !transform.any_op)
    "transform.yield"() : () -> ()
  }) : () -> ()
  "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> !transform.any_op, sym_name = "match_for"}> ({
  ^bb0(%arg2: !transform.any_op):
    "transform.match.operation_name"(%arg2) <{op_names = ["scf.for"]}> : (!transform.any_op) -> ()
    "transform.yield"(%arg2) : (!transform.any_op) -> ()
  }) : () -> ()
  "transform.named_sequence"() <{function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
  ^bb0(%arg0: !transform.any_op):
    "transform.sequence"(%arg0) <{failure_propagation_mode = 2 : i32, operandSegmentSizes = array<i32: 1, 0>}> ({
    ^bb0(%arg1: !transform.any_op):
      %0 = "transform.foreach_match"(%arg1) <{actions = [@peel], matchers = [@match_for]}> : (!transform.any_op) -> !transform.any_op
      "transform.yield"() : () -> ()
    }) : (!transform.any_op) -> ()
    "transform.yield"() : () -> ()
  }) : () -> ()
}) {transform.with_named_sequence} : () -> ()

