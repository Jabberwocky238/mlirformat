"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "integer_attr_unsupported_type"}> ({
    %0 = "arith.constant"() <{value = 1 : i32}> : () -> i32
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "vector_unsupported_elem_type"}> ({
    %0 = "arith.constant"() <{value = dense<42> : vector<3xi32>}> : () -> vector<3xi32>
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<[3]xi32>) -> (), sym_name = "scalable_vector_unsupported_elem_type"}> ({
  ^bb0(%arg0: vector<[3]xi32>):
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> tensor<10xi32>, sym_name = "dense_elem_unsupported_type"}> ({
    %0 = "arith.constant"() <{value = dense<42> : tensor<10xi32>}> : () -> tensor<10xi32>
    "func.return"(%0) : (tensor<10xi32>) -> ()
  }) : () -> ()
}) : () -> ()

