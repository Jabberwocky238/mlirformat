"builtin.module"() ({
  "builtin.module"() ({
    "func.func"() <{function_type = (memref<1xi8, 1>, memref<2xi8, 1>, memref<3xi8, 1>) -> (), sym_name = "func_with_reverse_order_no_result_no_calls", sym_visibility = "private"}> ({
    ^bb0(%arg1: memref<1xi8, 1> loc("<stdin>":5:10), %arg2: memref<2xi8, 1> loc("<stdin>":5:34), %arg3: memref<3xi8, 1> loc("<stdin>":5:58)):
      %3 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":6:12)
      %4 = "memref.view"(%arg1, %3) : (memref<1xi8, 1>, index) -> memref<1xi8, 1> loc("<stdin>":7:12)
      %5 = "memref.view"(%arg2, %3) : (memref<2xi8, 1>, index) -> memref<2xi8, 1> loc("<stdin>":8:12)
      %6 = "memref.view"(%arg3, %3) : (memref<3xi8, 1>, index) -> memref<3xi8, 1> loc("<stdin>":9:12)
      "func.return"() : () -> () loc("<stdin>":10:7)
    }) : () -> () loc("<stdin>":4:5)
  }) : () -> () loc("<stdin>":3:3)
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op loc("<stdin>":15:10)):
      %0 = "transform.structured.match"(%arg0) <{ops = ["func.func"]}> : (!transform.any_op) -> !transform.any_op loc("<stdin>":16:12)
      %1 = "transform.get_parent_op"(%0) <{nth_parent = 1 : i64}> : (!transform.any_op) -> !transform.any_op loc("<stdin>":17:12)
      %2:2 = "transform.func.replace_func_signature"(%1) <{args_interchange = array<i32: 0, 2, 1>, function_name = @func_with_reverse_order_no_result_no_calls, results_interchange = array<i32>}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op) loc("<stdin>":18:14)
      "transform.yield"() : () -> () loc("<stdin>":19:7)
    }) : () -> () loc("<stdin>":14:5)
  }) {transform.with_named_sequence} : () -> () loc("<stdin>":13:3)
}) : () -> () loc("<stdin>":2:1)
