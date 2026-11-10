"builtin.module"() ({
  "func.func"() <{function_type = (i4) -> i4, sym_name = "cf_br_block_arg_arith_i4"}> ({
  ^bb0(%arg0: i4):
    "cf.br"(%arg0)[^bb1] : (i4) -> ()
  ^bb1(%0: i4):  // pred: ^bb0
    "func.return"(%0) : (i4) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<8xi4>) -> vector<8xi4>, sym_name = "cf_br_block_arg_vector_i4"}> ({
  ^bb0(%arg0: vector<8xi4>):
    "cf.br"(%arg0)[^bb1] : (vector<8xi4>) -> ()
  ^bb1(%0: vector<8xi4>):  // pred: ^bb0
    "func.return"(%0) : (vector<8xi4>) -> ()
  }) : () -> ()
}) : () -> ()

