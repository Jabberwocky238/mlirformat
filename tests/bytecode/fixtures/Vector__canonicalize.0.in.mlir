"builtin.module"() ({
  "func.func"() <{function_type = () -> vector<4x3xi1>, sym_name = "create_vector_mask_to_constant_mask"}> ({
    %0 = "arith.constant"() <{value = 2 : index}> : () -> index loc("<stdin>":3:10)
    %1 = "arith.constant"() <{value = 3 : index}> : () -> index loc("<stdin>":4:10)
    %2 = "vector.create_mask"(%1, %0) : (index, index) -> vector<4x3xi1> loc("<stdin>":5:10)
    "func.return"(%2) : (vector<4x3xi1>) -> () loc("<stdin>":6:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
