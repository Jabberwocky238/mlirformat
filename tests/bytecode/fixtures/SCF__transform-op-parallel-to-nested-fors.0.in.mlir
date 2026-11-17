"builtin.module"() ({
  "func.func"() <{function_type = (index, index) -> (), sym_name = "callee", sym_visibility = "private"}> ({
  }) : () -> () loc("<stdin>":2:3)
  "func.func"() <{function_type = (index, index, index, index, index, index) -> (), sym_name = "two_iters"}> ({
  ^bb0(%arg1: index loc("<stdin>":5:8), %arg2: index loc("<stdin>":5:22), %arg3: index loc("<stdin>":5:36), %arg4: index loc("<stdin>":5:50), %arg5: index loc("<stdin>":5:64), %arg6: index loc("<stdin>":5:78)):
    "scf.parallel"(%arg1, %arg2, %arg3, %arg4, %arg5, %arg6) <{operandSegmentSizes = array<i32: 2, 2, 2, 0>}> ({
    ^bb0(%arg7: index loc("<stdin>":7:10), %arg8: index loc("<stdin>":7:24)):
      "func.call"(%arg7, %arg8) <{callee = @callee}> : (index, index) -> () loc("<stdin>":8:7)
      "scf.reduce"() : () -> () loc("<stdin>":9:7)
    }) : (index, index, index, index, index, index) -> () loc("<stdin>":6:5)
    "func.return"() : () -> () loc("<stdin>":11:5)
  }) : () -> () loc("<stdin>":4:3)
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op loc("<stdin>":15:10)):
      %0 = "transform.structured.match"(%arg0) <{ops = ["scf.parallel"]}> : (!transform.any_op) -> !transform.any_op loc("<stdin>":16:12)
      %1 = "transform.loop.parallel_for_to_nested_fors"(%0) : (!transform.any_op) -> !transform.any_op loc("<stdin>":17:12)
      "transform.yield"() : () -> () loc("<stdin>":18:7)
    }) : () -> () loc("<stdin>":14:5)
  }) {transform.with_named_sequence} : () -> () loc("<stdin>":13:3)
}) : () -> () loc("<stdin>":1:1)
