"builtin.module"() ({
  "func.func"() <{function_type = (index, index) -> (), sym_name = "callee", sym_visibility = "private"}> ({
  }) : () -> () loc("<stdin>":2:3)
  "func.func"() <{function_type = (index, index) -> (), sym_name = "two_iters"}> ({
  ^bb0(%arg1: index loc("<stdin>":5:8), %arg2: index loc("<stdin>":5:22)):
    "scf.forall"(%arg1, %arg2) <{operandSegmentSizes = array<i32: 0, 2, 0, 0>, staticLowerBound = array<i64: 0, 0>, staticStep = array<i64: 1, 1>, staticUpperBound = array<i64: -9223372036854775808, -9223372036854775808>}> ({
    ^bb0(%arg3: index loc("<stdin>":7:10), %arg4: index loc("<stdin>":7:24)):
      "func.call"(%arg3, %arg4) <{callee = @callee}> : (index, index) -> () loc("<stdin>":8:7)
      "scf.forall.in_parallel"() ({
      ^bb0:
      }) : () -> () loc("<stdin>":9:7)
    }) : (index, index) -> () loc("<stdin>":6:5)
    "func.return"() : () -> () loc("<stdin>":13:5)
  }) : () -> () loc("<stdin>":4:3)
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op loc("<stdin>":17:10)):
      %0 = "transform.structured.match"(%arg0) <{ops = ["scf.forall"]}> : (!transform.any_op) -> !transform.any_op loc("<stdin>":18:12)
      %1 = "transform.loop.forall_to_parallel"(%0) : (!transform.any_op) -> !transform.any_op loc("<stdin>":19:12)
      "transform.yield"() : () -> () loc("<stdin>":20:7)
    }) : () -> () loc("<stdin>":16:5)
  }) {transform.with_named_sequence} : () -> () loc("<stdin>":15:3)
}) : () -> () loc("<stdin>":1:1)
