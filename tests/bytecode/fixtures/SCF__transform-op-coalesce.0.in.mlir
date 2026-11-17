"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "coalesce_inner"}> ({
    %3 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":3:10)
    %4 = "arith.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":4:10)
    %5 = "arith.constant"() <{value = 10 : index}> : () -> index loc("<stdin>":5:10)
    "scf.for"(%3, %5, %4) ({
    ^bb0(%arg1: index loc("<stdin>":7:10)):
      "scf.for"(%3, %5, %4) ({
      ^bb0(%arg2: index loc("<stdin>":9:12)):
        "scf.for"(%arg1, %arg2, %4) ({
        ^bb0(%arg3: index loc("<stdin>":11:14)):
          "scf.for"(%arg1, %arg2, %4) ({
          ^bb0(%arg4: index loc("<stdin>":13:16)):
            "use"(%arg1, %arg2) : (index, index) -> () loc("<stdin>":14:13)
            "scf.yield"() : () -> () loc("<stdin>":15:13)
          }) : (index, index, index) -> () loc("<stdin>":12:11)
          "scf.yield"() : () -> () loc("<stdin>":17:11)
        }) {coalesce} : (index, index, index) -> () loc("<stdin>":10:9)
        "scf.yield"() : () -> () loc("<stdin>":19:9)
      }) : (index, index, index) -> () loc("<stdin>":8:7)
      "scf.yield"() : () -> () loc("<stdin>":21:7)
    }) : (index, index, index) -> () loc("<stdin>":6:5)
    "func.return"() : () -> () loc("<stdin>":23:5)
  }) : () -> () loc("<stdin>":2:3)
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op loc("<stdin>":27:10)):
      %0 = "transform.structured.match"(%arg0) <{op_attrs = {coalesce}, ops = ["scf.for"]}> : (!transform.any_op) -> !transform.any_op loc("<stdin>":28:12)
      %1 = "transform.cast"(%0) : (!transform.any_op) -> !transform.op<"scf.for"> loc("<stdin>":29:12)
      %2 = "transform.loop.coalesce"(%1) : (!transform.op<"scf.for">) -> !transform.op<"scf.for"> loc("<stdin>":30:12)
      "transform.yield"() : () -> () loc("<stdin>":31:7)
    }) : () -> () loc("<stdin>":26:5)
  }) {transform.with_named_sequence} : () -> () loc("<stdin>":25:3)
}) : () -> () loc("<stdin>":1:1)
