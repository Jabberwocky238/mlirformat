"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "basic_cast_and_call"}> ({
    "test.foo"() : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "second"}> ({
    "test.bar"() : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "third", sym_visibility = "private"}> ({
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["func.func"]}> : (!transform.any_op) -> !transform.any_op
      %1:3 = "transform.split_handle"(%0) <{fail_on_payload_too_small = true, pass_through_empty_handle = true}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op)
      %2 = "transform.structured.match"(%1#0) <{ops = ["test.foo"]}> : (!transform.any_op) -> !transform.any_op
      %3 = "transform.func.cast_and_call"(%2) <{function_name = @second, operandSegmentSizes = array<i32: 1, 0, 0, 0>}> ({
      }) : (!transform.any_op) -> !transform.any_op
      %4 = "transform.func.cast_and_call"(%2, %1#2) <{insert_after, operandSegmentSizes = array<i32: 1, 0, 0, 1>}> ({
      }) : (!transform.any_op, !transform.any_op) -> !transform.any_op
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index) -> i32, sym_name = "non_empty_arg_and_out"}> ({
  ^bb0(%arg1: index):
    %7 = "test.foo"(%arg1) : (index) -> index
    %8 = "test.bar"(%7) : (index) -> i32
    "func.return"(%8) : (i32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index) -> i32, sym_name = "second", sym_visibility = "private"}> ({
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["func.func"]}> : (!transform.any_op) -> !transform.any_op
      %1:2 = "transform.split_handle"(%0) <{fail_on_payload_too_small = true, pass_through_empty_handle = true}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op)
      %2 = "transform.structured.match"(%1#0) <{ops = ["test.foo"]}> : (!transform.any_op) -> !transform.any_op
      %3 = "transform.structured.match"(%1#0) <{ops = ["test.bar"]}> : (!transform.any_op) -> !transform.any_op
      %4 = "transform.get_result"(%2) <{raw_position_list = array<i64: 0>}> : (!transform.any_op) -> !transform.any_value
      %5 = "transform.get_result"(%3) <{raw_position_list = array<i64: 0>}> : (!transform.any_op) -> !transform.any_value
      %6 = "transform.func.cast_and_call"(%3, %4, %5, %1#1) <{operandSegmentSizes = array<i32: 1, 1, 1, 1>}> ({
      }) : (!transform.any_op, !transform.any_value, !transform.any_value, !transform.any_op) -> !transform.any_op
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index) -> (index, index), sym_name = "multi_arg_and_result"}> ({
  ^bb0(%arg1: index):
    %9 = "test.foo"(%arg1) : (index) -> index
    %10 = "test.bar"(%9) : (index) -> index
    %11 = "test.bar"(%9) : (index) -> index
    "func.return"(%10, %11) : (index, index) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index, index) -> (index, index), sym_name = "second", sym_visibility = "private"}> ({
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["func.func"]}> : (!transform.any_op) -> !transform.any_op
      %1:2 = "transform.split_handle"(%0) <{fail_on_payload_too_small = true, pass_through_empty_handle = true}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op)
      %2 = "transform.structured.match"(%1#0) <{ops = ["test.foo"]}> : (!transform.any_op) -> !transform.any_op
      %3 = "transform.structured.match"(%1#0) <{ops = ["test.bar"]}> : (!transform.any_op) -> !transform.any_op
      %4 = "transform.get_result"(%2) <{raw_position_list = array<i64: 0>}> : (!transform.any_op) -> !transform.any_value
      %5 = "transform.get_result"(%2) <{raw_position_list = array<i64: 0>}> : (!transform.any_op) -> !transform.any_value
      %6 = "transform.merge_handles"(%4, %5) : (!transform.any_value, !transform.any_value) -> !transform.any_value
      %7 = "transform.get_result"(%3) <{raw_position_list = array<i64: 0>}> : (!transform.any_op) -> !transform.any_value
      %8 = "transform.func.cast_and_call"(%2, %6, %7, %1#1) <{insert_after, operandSegmentSizes = array<i32: 1, 1, 1, 1>}> ({
      }) : (!transform.any_op, !transform.any_value, !transform.any_value, !transform.any_op) -> !transform.any_op
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "nested_call"}> ({
    %6 = "test.arg"() : () -> index
    "test.foo"() ({
      "test.bar"(%6) : (index) -> ()
    }) : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index) -> (), sym_name = "second", sym_visibility = "private"}> ({
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["func.func"]}> : (!transform.any_op) -> !transform.any_op
      %1:2 = "transform.split_handle"(%0) <{fail_on_payload_too_small = true, pass_through_empty_handle = true}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op)
      %2 = "transform.structured.match"(%1#0) <{ops = ["test.arg"]}> : (!transform.any_op) -> !transform.any_op
      %3 = "transform.structured.match"(%1#0) <{ops = ["test.bar"]}> : (!transform.any_op) -> !transform.any_op
      %4 = "transform.get_result"(%2) <{raw_position_list = array<i64: 0>}> : (!transform.any_op) -> !transform.any_value
      %5 = "transform.func.cast_and_call"(%3, %4, %1#1) <{operandSegmentSizes = array<i32: 1, 1, 0, 1>}> ({
      }) : (!transform.any_op, !transform.any_value, !transform.any_op) -> !transform.any_op
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "builtin.module"() ({
    "func.func"() <{function_type = (memref<1xi8, 1>, memref<2xi8, 1>, memref<3xi8, 1>) -> (), sym_name = "func_with_reverse_order_no_result_no_calls", sym_visibility = "private"}> ({
    ^bb0(%arg1: memref<1xi8, 1>, %arg2: memref<2xi8, 1>, %arg3: memref<3xi8, 1>):
      %3 = "arith.constant"() <{value = 0 : index}> : () -> index
      %4 = "memref.view"(%arg1, %3) : (memref<1xi8, 1>, index) -> memref<1xi8, 1>
      %5 = "memref.view"(%arg2, %3) : (memref<2xi8, 1>, index) -> memref<2xi8, 1>
      %6 = "memref.view"(%arg3, %3) : (memref<3xi8, 1>, index) -> memref<3xi8, 1>
      "func.return"() : () -> ()
    }) : () -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["func.func"]}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.get_parent_op"(%0) <{nth_parent = 1 : i64}> : (!transform.any_op) -> !transform.any_op
      %2:2 = "transform.func.replace_func_signature"(%1) <{args_interchange = array<i32: 0, 2, 1>, function_name = @func_with_reverse_order_no_result_no_calls, results_interchange = array<i32>}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op)
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "builtin.module"() ({
    "func.func"() <{function_type = (memref<1xi8, 1>, memref<2xi8, 1>, memref<3xi8, 1>) -> (), sym_name = "func_with_reverse_order_no_result", sym_visibility = "private"}> ({
    ^bb0(%arg4: memref<1xi8, 1>, %arg5: memref<2xi8, 1>, %arg6: memref<3xi8, 1>):
      %4 = "arith.constant"() <{value = 0 : index}> : () -> index
      %5 = "memref.view"(%arg4, %4) : (memref<1xi8, 1>, index) -> memref<1xi8, 1>
      %6 = "memref.view"(%arg5, %4) : (memref<2xi8, 1>, index) -> memref<2xi8, 1>
      %7 = "memref.view"(%arg6, %4) : (memref<3xi8, 1>, index) -> memref<3xi8, 1>
      "func.return"() : () -> ()
    }) : () -> ()
    "func.func"() <{function_type = (memref<1xi8, 1>, memref<2xi8, 1>, memref<3xi8, 1>) -> (), sym_name = "func_with_reverse_order_no_result_caller"}> ({
    ^bb0(%arg1: memref<1xi8, 1>, %arg2: memref<2xi8, 1>, %arg3: memref<3xi8, 1>):
      "func.call"(%arg1, %arg2, %arg3) <{callee = @func_with_reverse_order_no_result}> : (memref<1xi8, 1>, memref<2xi8, 1>, memref<3xi8, 1>) -> ()
      "func.return"() : () -> ()
    }) : () -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["func.func"]}> : (!transform.any_op) -> !transform.any_op
      %1:2 = "transform.split_handle"(%0) <{fail_on_payload_too_small = true, pass_through_empty_handle = true}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op)
      %2 = "transform.get_parent_op"(%1#0) <{nth_parent = 1 : i64}> : (!transform.any_op) -> !transform.any_op
      %3:2 = "transform.func.replace_func_signature"(%2) <{adjust_func_calls, args_interchange = array<i32: 0, 2, 1>, function_name = @func_with_reverse_order_no_result, results_interchange = array<i32>}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op)
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "builtin.module"() ({
    "func.func"() <{function_type = (memref<1xi8, 1>, memref<2xi8, 1>, memref<3xi8, 1>) -> (memref<1xi8, 1>, memref<2xi8, 1>), sym_name = "func_with_reverse_order", sym_visibility = "private"}> ({
    ^bb0(%arg4: memref<1xi8, 1>, %arg5: memref<2xi8, 1>, %arg6: memref<3xi8, 1>):
      %5 = "arith.constant"() <{value = 0 : index}> : () -> index
      %6 = "memref.view"(%arg4, %5) : (memref<1xi8, 1>, index) -> memref<1xi8, 1>
      %7 = "memref.view"(%arg5, %5) : (memref<2xi8, 1>, index) -> memref<2xi8, 1>
      %8 = "memref.view"(%arg6, %5) : (memref<3xi8, 1>, index) -> memref<3xi8, 1>
      "func.return"(%6, %7) : (memref<1xi8, 1>, memref<2xi8, 1>) -> ()
    }) : () -> ()
    "func.func"() <{function_type = (memref<1xi8, 1>, memref<2xi8, 1>, memref<3xi8, 1>) -> (memref<1xi8, 1>, memref<2xi8, 1>), sym_name = "func_with_reverse_order_caller"}> ({
    ^bb0(%arg1: memref<1xi8, 1>, %arg2: memref<2xi8, 1>, %arg3: memref<3xi8, 1>):
      %4:2 = "func.call"(%arg1, %arg2, %arg3) <{callee = @func_with_reverse_order}> : (memref<1xi8, 1>, memref<2xi8, 1>, memref<3xi8, 1>) -> (memref<1xi8, 1>, memref<2xi8, 1>)
      "func.return"(%4#0, %4#1) : (memref<1xi8, 1>, memref<2xi8, 1>) -> ()
    }) : () -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["func.func"]}> : (!transform.any_op) -> !transform.any_op
      %1:2 = "transform.split_handle"(%0) <{fail_on_payload_too_small = true, pass_through_empty_handle = true}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op)
      %2 = "transform.get_parent_op"(%1#0) <{nth_parent = 1 : i64}> : (!transform.any_op) -> !transform.any_op
      %3:2 = "transform.func.replace_func_signature"(%2) <{adjust_func_calls, args_interchange = array<i32: 0, 2, 1>, function_name = @func_with_reverse_order, results_interchange = array<i32: 1, 0>}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op)
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "builtin.module"() ({
    "func.func"() <{arg_attrs = [{}, {transform.readonly}, {}], function_type = (memref<1xi8, 1>, memref<2xi8, 1>, memref<3xi8, 1>) -> (memref<1xi8, 1>, memref<2xi8, 1>), sym_name = "func_with_reverse_order_with_attr", sym_visibility = "private"}> ({
    ^bb0(%arg4: memref<1xi8, 1>, %arg5: memref<2xi8, 1>, %arg6: memref<3xi8, 1>):
      %5 = "arith.constant"() <{value = 0 : index}> : () -> index
      %6 = "memref.view"(%arg4, %5) : (memref<1xi8, 1>, index) -> memref<1xi8, 1>
      %7 = "memref.view"(%arg5, %5) : (memref<2xi8, 1>, index) -> memref<2xi8, 1>
      %8 = "memref.view"(%arg6, %5) : (memref<3xi8, 1>, index) -> memref<3xi8, 1>
      "func.return"(%6, %7) : (memref<1xi8, 1>, memref<2xi8, 1>) -> ()
    }) : () -> ()
    "func.func"() <{function_type = (memref<1xi8, 1>, memref<2xi8, 1>, memref<3xi8, 1>) -> (memref<1xi8, 1>, memref<2xi8, 1>), sym_name = "func_with_reverse_order_with_attr_caller"}> ({
    ^bb0(%arg1: memref<1xi8, 1>, %arg2: memref<2xi8, 1>, %arg3: memref<3xi8, 1>):
      %4:2 = "func.call"(%arg1, %arg2, %arg3) <{callee = @func_with_reverse_order_with_attr}> : (memref<1xi8, 1>, memref<2xi8, 1>, memref<3xi8, 1>) -> (memref<1xi8, 1>, memref<2xi8, 1>)
      "func.return"(%4#0, %4#1) : (memref<1xi8, 1>, memref<2xi8, 1>) -> ()
    }) : () -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["func.func"]}> : (!transform.any_op) -> !transform.any_op
      %1:2 = "transform.split_handle"(%0) <{fail_on_payload_too_small = true, pass_through_empty_handle = true}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op)
      %2 = "transform.get_parent_op"(%1#0) <{nth_parent = 1 : i64}> : (!transform.any_op) -> !transform.any_op
      %3:2 = "transform.func.replace_func_signature"(%2) <{adjust_func_calls, args_interchange = array<i32: 0, 2, 1>, function_name = @func_with_reverse_order_with_attr, results_interchange = array<i32: 1, 0>}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op)
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<1xi8, 1>, memref<2xi8, 1>, memref<1xi8, 1>) -> (), sym_name = "func_with_duplicate_args", sym_visibility = "private"}> ({
  ^bb0(%arg3: memref<1xi8, 1>, %arg4: memref<2xi8, 1>, %arg5: memref<1xi8, 1>):
    %1 = "arith.constant"() <{value = 0 : index}> : () -> index
    %2 = "memref.view"(%arg3, %1) : (memref<1xi8, 1>, index) -> memref<1xi8, 1>
    %3 = "memref.view"(%arg4, %1) : (memref<2xi8, 1>, index) -> memref<2xi8, 1>
    %4 = "memref.view"(%arg5, %1) : (memref<1xi8, 1>, index) -> memref<1xi8, 1>
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<1xi8, 1>, memref<2xi8, 1>) -> (), sym_name = "func_with_duplicate_args_caller"}> ({
  ^bb0(%arg1: memref<1xi8, 1>, %arg2: memref<2xi8, 1>):
    "func.call"(%arg1, %arg2, %arg1) <{callee = @func_with_duplicate_args}> : (memref<1xi8, 1>, memref<2xi8, 1>, memref<1xi8, 1>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0:2 = "transform.func.deduplicate_func_args"(%arg0) <{function_name = @func_with_duplicate_args}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op)
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<1xi8, 1>, memref<2xi8, 1>, memref<1xi8, 1>, memref<3xi8, 1>, memref<2xi8, 1>) -> (memref<1xi8, 1>, memref<2xi8, 1>, memref<1xi8, 1>, memref<3xi8, 1>, memref<2xi8, 1>), sym_name = "func_with_complex_duplicate_args", sym_visibility = "private"}> ({
  ^bb0(%arg4: memref<1xi8, 1>, %arg5: memref<2xi8, 1>, %arg6: memref<1xi8, 1>, %arg7: memref<3xi8, 1>, %arg8: memref<2xi8, 1>):
    %2 = "arith.constant"() <{value = 0 : index}> : () -> index
    %3 = "memref.view"(%arg4, %2) : (memref<1xi8, 1>, index) -> memref<1xi8, 1>
    %4 = "memref.view"(%arg5, %2) : (memref<2xi8, 1>, index) -> memref<2xi8, 1>
    %5 = "memref.view"(%arg6, %2) : (memref<1xi8, 1>, index) -> memref<1xi8, 1>
    %6 = "memref.view"(%arg7, %2) : (memref<3xi8, 1>, index) -> memref<3xi8, 1>
    %7 = "memref.view"(%arg8, %2) : (memref<2xi8, 1>, index) -> memref<2xi8, 1>
    "func.return"(%3, %4, %5, %6, %7) : (memref<1xi8, 1>, memref<2xi8, 1>, memref<1xi8, 1>, memref<3xi8, 1>, memref<2xi8, 1>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<1xi8, 1>, memref<2xi8, 1>, memref<3xi8, 1>) -> (memref<1xi8, 1>, memref<2xi8, 1>, memref<1xi8, 1>, memref<3xi8, 1>, memref<2xi8, 1>), sym_name = "func_with_complex_duplicate_args_caller"}> ({
  ^bb0(%arg1: memref<1xi8, 1>, %arg2: memref<2xi8, 1>, %arg3: memref<3xi8, 1>):
    %1:5 = "func.call"(%arg1, %arg2, %arg1, %arg3, %arg2) <{callee = @func_with_complex_duplicate_args}> : (memref<1xi8, 1>, memref<2xi8, 1>, memref<1xi8, 1>, memref<3xi8, 1>, memref<2xi8, 1>) -> (memref<1xi8, 1>, memref<2xi8, 1>, memref<1xi8, 1>, memref<3xi8, 1>, memref<2xi8, 1>)
    "func.return"(%1#0, %1#1, %1#2, %1#3, %1#4) : (memref<1xi8, 1>, memref<2xi8, 1>, memref<1xi8, 1>, memref<3xi8, 1>, memref<2xi8, 1>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0:2 = "transform.func.deduplicate_func_args"(%arg0) <{function_name = @func_with_complex_duplicate_args}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op)
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

