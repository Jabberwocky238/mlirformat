"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "test_no_skip_block_erasure"}> ({
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":4:10)
    %1 = "arith.constant"() <{value = 3 : index}> : () -> index loc("<stdin>":5:10)
    "cf.br"()[^bb1] : () -> () loc("<stdin>":6:5)
  ^bb1:  // pred: ^bb0
    %2 = "arith.cmpi"(%0, %1) <{predicate = 0 : i64}> : (index, index) -> i1 loc("<stdin>":8:10)
    "cf.br"()[^bb2] : () -> () loc("<stdin>":9:5)
  ^bb2:  // pred: ^bb1
    "func.return"() : () -> () loc("<stdin>":11:5)
  }) : () -> () loc("<stdin>":3:3)
}) : () -> () loc("<stdin>":2:1)
