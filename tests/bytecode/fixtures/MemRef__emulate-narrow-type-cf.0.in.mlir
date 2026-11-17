"builtin.module"() ({
  "func.func"() <{function_type = (memref<8xi4>) -> memref<8xi4>, sym_name = "cf_br_block_arg_narrow_type"}> ({
  ^bb0(%arg0: memref<8xi4> loc("<stdin>":3:8)):
    "cf.br"(%arg0)[^bb1] : (memref<8xi4>) -> () loc("<stdin>":4:5)
  ^bb1(%0: memref<8xi4> loc("<stdin>":5:8)):  // pred: ^bb0
    "func.return"(%0) : (memref<8xi4>) -> () loc("<stdin>":6:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
