"builtin.module"() ({
  "func.func"() <{function_type = () -> index, sym_name = "fold_div_index_neg_rhs"}> ({
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":3:10)
    %1 = "shape.div"(%0, %0) : (index, index) -> index loc("<stdin>":4:10)
    "func.return"(%1) : (index) -> () loc("<stdin>":5:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
