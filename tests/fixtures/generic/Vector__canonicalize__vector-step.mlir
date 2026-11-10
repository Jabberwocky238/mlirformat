"builtin.module"() ({
  "func.func"() <{function_type = () -> vector<3xi1>, sym_name = "ugt_constant_3_lhs"}> ({
    %0 = "arith.constant"() <{value = dense<3> : vector<3xindex>}> : () -> vector<3xindex>
    %1 = "vector.step"() : () -> vector<3xindex>
    %2 = "arith.cmpi"(%0, %1) <{predicate = 8 : i64}> : (vector<3xindex>, vector<3xindex>) -> vector<3xi1>
    "func.return"(%2) : (vector<3xi1>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> vector<3xi1>, sym_name = "negative_ugt_constant_2_lhs"}> ({
    %0 = "arith.constant"() <{value = dense<2> : vector<3xindex>}> : () -> vector<3xindex>
    %1 = "vector.step"() : () -> vector<3xindex>
    %2 = "arith.cmpi"(%0, %1) <{predicate = 8 : i64}> : (vector<3xindex>, vector<3xindex>) -> vector<3xi1>
    "func.return"(%2) : (vector<3xi1>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> vector<3xi1>, sym_name = "ugt_constant_3_rhs"}> ({
    %0 = "arith.constant"() <{value = dense<3> : vector<3xindex>}> : () -> vector<3xindex>
    %1 = "vector.step"() : () -> vector<3xindex>
    %2 = "arith.cmpi"(%1, %0) <{predicate = 8 : i64}> : (vector<3xindex>, vector<3xindex>) -> vector<3xi1>
    "func.return"(%2) : (vector<3xi1>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> vector<3xi1>, sym_name = "ugt_constant_max_rhs"}> ({
    %0 = "arith.constant"() <{value = dense<9223372036854775807> : vector<3xindex>}> : () -> vector<3xindex>
    %1 = "vector.step"() : () -> vector<3xindex>
    %2 = "arith.cmpi"(%1, %0) <{predicate = 8 : i64}> : (vector<3xindex>, vector<3xindex>) -> vector<3xi1>
    "func.return"(%2) : (vector<3xi1>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> vector<3xi1>, sym_name = "ugt_constant_2_rhs"}> ({
    %0 = "arith.constant"() <{value = dense<2> : vector<3xindex>}> : () -> vector<3xindex>
    %1 = "vector.step"() : () -> vector<3xindex>
    %2 = "arith.cmpi"(%1, %0) <{predicate = 8 : i64}> : (vector<3xindex>, vector<3xindex>) -> vector<3xi1>
    "func.return"(%2) : (vector<3xi1>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> vector<3xi1>, sym_name = "negative_ugt_constant_1_rhs"}> ({
    %0 = "arith.constant"() <{value = dense<1> : vector<3xindex>}> : () -> vector<3xindex>
    %1 = "vector.step"() : () -> vector<3xindex>
    %2 = "arith.cmpi"(%1, %0) <{predicate = 8 : i64}> : (vector<3xindex>, vector<3xindex>) -> vector<3xi1>
    "func.return"(%2) : (vector<3xi1>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> vector<3xi1>, sym_name = "uge_constant_2_lhs"}> ({
    %0 = "arith.constant"() <{value = dense<2> : vector<3xindex>}> : () -> vector<3xindex>
    %1 = "vector.step"() : () -> vector<3xindex>
    %2 = "arith.cmpi"(%0, %1) <{predicate = 9 : i64}> : (vector<3xindex>, vector<3xindex>) -> vector<3xi1>
    "func.return"(%2) : (vector<3xi1>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> vector<3xi1>, sym_name = "negative_uge_constant_1_lhs"}> ({
    %0 = "arith.constant"() <{value = dense<1> : vector<3xindex>}> : () -> vector<3xindex>
    %1 = "vector.step"() : () -> vector<3xindex>
    %2 = "arith.cmpi"(%0, %1) <{predicate = 9 : i64}> : (vector<3xindex>, vector<3xindex>) -> vector<3xi1>
    "func.return"(%2) : (vector<3xi1>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> vector<3xi1>, sym_name = "uge_constant_3_rhs"}> ({
    %0 = "arith.constant"() <{value = dense<3> : vector<3xindex>}> : () -> vector<3xindex>
    %1 = "vector.step"() : () -> vector<3xindex>
    %2 = "arith.cmpi"(%1, %0) <{predicate = 9 : i64}> : (vector<3xindex>, vector<3xindex>) -> vector<3xi1>
    "func.return"(%2) : (vector<3xi1>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> vector<3xi1>, sym_name = "negative_uge_constant_2_rhs"}> ({
    %0 = "arith.constant"() <{value = dense<2> : vector<3xindex>}> : () -> vector<3xindex>
    %1 = "vector.step"() : () -> vector<3xindex>
    %2 = "arith.cmpi"(%1, %0) <{predicate = 9 : i64}> : (vector<3xindex>, vector<3xindex>) -> vector<3xi1>
    "func.return"(%2) : (vector<3xi1>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> vector<3xi1>, sym_name = "ult_constant_2_lhs"}> ({
    %0 = "arith.constant"() <{value = dense<2> : vector<3xindex>}> : () -> vector<3xindex>
    %1 = "vector.step"() : () -> vector<3xindex>
    %2 = "arith.cmpi"(%0, %1) <{predicate = 6 : i64}> : (vector<3xindex>, vector<3xindex>) -> vector<3xi1>
    "func.return"(%2) : (vector<3xi1>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> vector<3xi1>, sym_name = "negative_ult_constant_1_lhs"}> ({
    %0 = "arith.constant"() <{value = dense<1> : vector<3xindex>}> : () -> vector<3xindex>
    %1 = "vector.step"() : () -> vector<3xindex>
    %2 = "arith.cmpi"(%0, %1) <{predicate = 6 : i64}> : (vector<3xindex>, vector<3xindex>) -> vector<3xi1>
    "func.return"(%2) : (vector<3xi1>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> vector<3xi1>, sym_name = "ult_constant_3_rhs"}> ({
    %0 = "arith.constant"() <{value = dense<3> : vector<3xindex>}> : () -> vector<3xindex>
    %1 = "vector.step"() : () -> vector<3xindex>
    %2 = "arith.cmpi"(%1, %0) <{predicate = 6 : i64}> : (vector<3xindex>, vector<3xindex>) -> vector<3xi1>
    "func.return"(%2) : (vector<3xi1>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> vector<3xi1>, sym_name = "negative_ult_constant_2_rhs"}> ({
    %0 = "arith.constant"() <{value = dense<2> : vector<3xindex>}> : () -> vector<3xindex>
    %1 = "vector.step"() : () -> vector<3xindex>
    %2 = "arith.cmpi"(%1, %0) <{predicate = 6 : i64}> : (vector<3xindex>, vector<3xindex>) -> vector<3xi1>
    "func.return"(%2) : (vector<3xi1>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> vector<3xi1>, sym_name = "ule_constant_3_lhs"}> ({
    %0 = "arith.constant"() <{value = dense<3> : vector<3xindex>}> : () -> vector<3xindex>
    %1 = "vector.step"() : () -> vector<3xindex>
    %2 = "arith.cmpi"(%0, %1) <{predicate = 7 : i64}> : (vector<3xindex>, vector<3xindex>) -> vector<3xi1>
    "func.return"(%2) : (vector<3xi1>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> vector<3xi1>, sym_name = "negative_ule_constant_2_lhs"}> ({
    %0 = "arith.constant"() <{value = dense<2> : vector<3xindex>}> : () -> vector<3xindex>
    %1 = "vector.step"() : () -> vector<3xindex>
    %2 = "arith.cmpi"(%0, %1) <{predicate = 7 : i64}> : (vector<3xindex>, vector<3xindex>) -> vector<3xi1>
    "func.return"(%2) : (vector<3xi1>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> vector<3xi1>, sym_name = "ule_constant_2_rhs"}> ({
    %0 = "arith.constant"() <{value = dense<2> : vector<3xindex>}> : () -> vector<3xindex>
    %1 = "vector.step"() : () -> vector<3xindex>
    %2 = "arith.cmpi"(%1, %0) <{predicate = 7 : i64}> : (vector<3xindex>, vector<3xindex>) -> vector<3xi1>
    "func.return"(%2) : (vector<3xi1>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> vector<3xi1>, sym_name = "negative_ule_constant_1_rhs"}> ({
    %0 = "arith.constant"() <{value = dense<1> : vector<3xindex>}> : () -> vector<3xindex>
    %1 = "vector.step"() : () -> vector<3xindex>
    %2 = "arith.cmpi"(%1, %0) <{predicate = 7 : i64}> : (vector<3xindex>, vector<3xindex>) -> vector<3xi1>
    "func.return"(%2) : (vector<3xi1>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> vector<3xi1>, sym_name = "eq_constant_3"}> ({
    %0 = "arith.constant"() <{value = dense<3> : vector<3xindex>}> : () -> vector<3xindex>
    %1 = "vector.step"() : () -> vector<3xindex>
    %2 = "arith.cmpi"(%1, %0) <{predicate = 0 : i64}> : (vector<3xindex>, vector<3xindex>) -> vector<3xi1>
    "func.return"(%2) : (vector<3xi1>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> vector<3xi1>, sym_name = "negative_eq_constant_2"}> ({
    %0 = "arith.constant"() <{value = dense<2> : vector<3xindex>}> : () -> vector<3xindex>
    %1 = "vector.step"() : () -> vector<3xindex>
    %2 = "arith.cmpi"(%1, %0) <{predicate = 0 : i64}> : (vector<3xindex>, vector<3xindex>) -> vector<3xi1>
    "func.return"(%2) : (vector<3xi1>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> vector<3xi1>, sym_name = "ne_constant_3"}> ({
    %0 = "arith.constant"() <{value = dense<3> : vector<3xindex>}> : () -> vector<3xindex>
    %1 = "vector.step"() : () -> vector<3xindex>
    %2 = "arith.cmpi"(%1, %0) <{predicate = 1 : i64}> : (vector<3xindex>, vector<3xindex>) -> vector<3xi1>
    "func.return"(%2) : (vector<3xi1>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> vector<3xi1>, sym_name = "negative_ne_constant_2"}> ({
    %0 = "arith.constant"() <{value = dense<2> : vector<3xindex>}> : () -> vector<3xindex>
    %1 = "vector.step"() : () -> vector<3xindex>
    %2 = "arith.cmpi"(%1, %0) <{predicate = 1 : i64}> : (vector<3xindex>, vector<3xindex>) -> vector<3xi1>
    "func.return"(%2) : (vector<3xi1>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> vector<4xi1>, sym_name = "ult_i32_constant_4_rhs"}> ({
    %0 = "arith.constant"() <{value = dense<4> : vector<4xi32>}> : () -> vector<4xi32>
    %1 = "vector.step"() : () -> vector<4xi32>
    %2 = "arith.cmpi"(%1, %0) <{predicate = 6 : i64}> : (vector<4xi32>, vector<4xi32>) -> vector<4xi1>
    "func.return"(%2) : (vector<4xi1>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> vector<4xi1>, sym_name = "negative_ult_i32_constant_2_rhs"}> ({
    %0 = "arith.constant"() <{value = dense<2> : vector<4xi32>}> : () -> vector<4xi32>
    %1 = "vector.step"() : () -> vector<4xi32>
    %2 = "arith.cmpi"(%1, %0) <{predicate = 6 : i64}> : (vector<4xi32>, vector<4xi32>) -> vector<4xi1>
    "func.return"(%2) : (vector<4xi1>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> vector<300xi1>, sym_name = "negative_ult_i8_wrap"}> ({
    %0 = "arith.constant"() <{value = dense<100> : vector<300xi8>}> : () -> vector<300xi8>
    %1 = "vector.step"() : () -> vector<300xi8>
    %2 = "arith.cmpi"(%1, %0) <{predicate = 6 : i64}> : (vector<300xi8>, vector<300xi8>) -> vector<300xi1>
    "func.return"(%2) : (vector<300xi1>) -> ()
  }) : () -> ()
}) : () -> ()

