"builtin.module"() ({
  "func.func"() <{function_type = (index, index, index) -> (), sym_name = "loop_outline_op"}> ({
  ^bb0(%arg1: index loc("<stdin>":3:8), %arg2: index loc("<stdin>":3:22), %arg3: index loc("<stdin>":3:36)):
    "scf.for"(%arg1, %arg2, %arg3) ({
    ^bb0(%arg5: index loc("<stdin>":5:10)):
      "scf.for"(%arg1, %arg2, %arg3) ({
      ^bb0(%arg6: index loc("<stdin>":7:12)):
        %4 = "arith.addi"(%arg5, %arg6) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index loc("<stdin>":8:14)
        "scf.yield"() : () -> () loc("<stdin>":9:9)
      }) : (index, index, index) -> () loc("<stdin>":6:7)
      "scf.yield"() : () -> () loc("<stdin>":11:7)
    }) : (index, index, index) -> () loc("<stdin>":4:5)
    "scf.for"(%arg1, %arg2, %arg3) ({
    ^bb0(%arg4: index loc("<stdin>":14:10)):
      %3 = "arith.addi"(%arg4, %arg4) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index loc("<stdin>":15:12)
      "scf.yield"() : () -> () loc("<stdin>":16:7)
    }) : (index, index, index) -> () loc("<stdin>":13:5)
    "func.return"() : () -> () loc("<stdin>":18:5)
  }) : () -> () loc("<stdin>":2:3)
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op loc("<stdin>":22:10)):
      %0 = "transform.structured.match"(%arg0) <{ops = ["arith.addi"]}> : (!transform.any_op) -> !transform.any_op loc("<stdin>":23:12)
      %1 = "transform.get_parent_op"(%0) <{nth_parent = 1 : i64, op_name = "scf.for"}> : (!transform.any_op) -> !transform.op<"scf.for"> loc("<stdin>":24:12)
      %2:2 = "transform.loop.outline"(%1) <{func_name = "foo"}> : (!transform.op<"scf.for">) -> (!transform.any_op, !transform.any_op) loc("<stdin>":25:14)
      "transform.yield"() : () -> () loc("<stdin>":26:7)
    }) : () -> () loc("<stdin>":21:5)
  }) {transform.with_named_sequence} : () -> () loc("<stdin>":20:3)
}) : () -> () loc("<stdin>":1:1)
