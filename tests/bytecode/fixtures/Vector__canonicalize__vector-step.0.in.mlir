"builtin.module"() ({
  "func.func"() <{function_type = () -> vector<3xi1>, sym_name = "ugt_constant_3_lhs"}> ({
    %0 = "arith.constant"() <{value = dense<3> : vector<3xindex>}> : () -> vector<3xindex> loc("<stdin>":3:10)
    %1 = "vector.step"() : () -> vector<3xindex> loc("<stdin>":4:10)
    %2 = "arith.cmpi"(%0, %1) <{predicate = 8 : i64}> : (vector<3xindex>, vector<3xindex>) -> vector<3xi1> loc("<stdin>":5:10)
    "func.return"(%2) : (vector<3xi1>) -> () loc("<stdin>":6:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
