"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "bar", sym_visibility = "private"}> ({
  }) : () -> () loc("<stdin>":2:3)
  "func.func"() <{function_type = () -> (), sym_name = "foo"}> ({
    %1 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":5:10)
    %2 = "arith.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":6:10)
    %3 = "arith.constant"() <{value = 10 : index}> : () -> index loc("<stdin>":7:10)
    "scf.for"(%1, %2, %3) ({
    ^bb0(%arg1: index loc("<stdin>":9:10)):
      "scf.for"(%1, %2, %3) ({
      ^bb0(%arg2: index loc("<stdin>":11:12)):
        "func.call"() <{callee = @bar}> : () -> () loc("<stdin>":12:9)
        "scf.yield"() : () -> () loc("<stdin>":13:9)
      }) : (index, index, index) -> () loc("<stdin>":10:7)
      "scf.yield"() : () -> () loc("<stdin>":15:7)
    }) : (index, index, index) -> () loc("<stdin>":8:5)
    "func.return"() : () -> () loc("<stdin>":17:5)
  }) : () -> () loc("<stdin>":4:3)
  "builtin.module"() ({
    "transform.named_sequence"() <{function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op loc("<stdin>":21:10)):
      %0 = "transform.structured.match"(%arg0) <{ops = ["scf.for"]}> : (!transform.any_op) -> !transform.op<"scf.for"> loc("<stdin>":22:12)
      "transform.test_consume_operand_each"(%0) : (!transform.op<"scf.for">) -> () loc("<stdin>":23:7)
      "transform.yield"() : () -> () loc("<stdin>":24:7)
    }) : () -> () loc("<stdin>":20:5)
  }) {transform.with_named_sequence} : () -> () loc("<stdin>":19:3)
}) : () -> () loc("<stdin>":1:1)
