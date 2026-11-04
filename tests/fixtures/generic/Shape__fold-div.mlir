"builtin.module"() ({
  "func.func"() <{function_type = () -> index, sym_name = "fold_div_index_neg_rhs"}> ({
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "shape.div"(%0, %0) : (index, index) -> index
    "func.return"(%1) : (index) -> ()
  }) : () -> ()
}) : () -> ()

