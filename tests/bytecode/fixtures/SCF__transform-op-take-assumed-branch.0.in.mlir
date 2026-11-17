"builtin.module"() ({
  "func.func"() <{function_type = (i1, index, memref<?xf32>, i8) -> (), sym_name = "if_no_else"}> ({
  ^bb0(%arg1: i1 loc("<stdin>":3:8), %arg2: index loc("<stdin>":3:19), %arg3: memref<?xf32> loc("<stdin>":3:33), %arg4: i8 loc("<stdin>":3:55)):
    "scf.if"(%arg1) ({
      "some_op"(%arg1, %arg3) : (i1, memref<?xf32>) -> () loc("<stdin>":5:7)
      "scf.yield"() : () -> () loc("<stdin>":6:7)
    }, {
    }) : (i1) -> () loc("<stdin>":4:5)
    "func.return"() : () -> () loc("<stdin>":9:5)
  }) : () -> () loc("<stdin>":2:3)
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op loc("<stdin>":13:10)):
      %0 = "transform.structured.match"(%arg0) <{ops = ["scf.if"]}> : (!transform.any_op) -> !transform.any_op loc("<stdin>":14:12)
      %1 = "transform.structured.match"(%arg0) <{ops = ["some_op"]}> : (!transform.any_op) -> !transform.any_op loc("<stdin>":15:12)
      "transform.scf.take_assumed_branch"(%0) : (!transform.any_op) -> () loc("<stdin>":16:7)
      "transform.print"(%1) : (!transform.any_op) -> () loc("<stdin>":17:7)
      "transform.yield"() : () -> () loc("<stdin>":18:7)
    }) : () -> () loc("<stdin>":12:5)
  }) {transform.with_named_sequence} : () -> () loc("<stdin>":11:3)
}) : () -> () loc("<stdin>":1:1)
