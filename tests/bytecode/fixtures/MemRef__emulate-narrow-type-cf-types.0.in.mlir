"builtin.module"() ({
  "func.func"() <{function_type = (i4) -> i4, sym_name = "cf_br_block_arg_arith_i4"}> ({
  ^bb0(%arg0: i4 loc("<stdin>":3:8)):
    "cf.br"(%arg0)[^bb1] : (i4) -> () loc("<stdin>":4:5)
  ^bb1(%0: i4 loc("<stdin>":5:8)):  // pred: ^bb0
    "func.return"(%0) : (i4) -> () loc("<stdin>":6:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
