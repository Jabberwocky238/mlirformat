"builtin.module"() ({
  "func.func"() <{function_type = (i32) -> (), sym_name = "testSingleOperand"}> ({
  ^bb0(%arg0: i32 loc("<stdin>":3:8)):
    "testvar.single_operand"(%arg0) : (i32) -> () loc("<stdin>":4:5)
    "func.return"() : () -> () loc("<stdin>":5:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
