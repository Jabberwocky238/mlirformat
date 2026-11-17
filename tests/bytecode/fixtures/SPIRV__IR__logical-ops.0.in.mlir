"builtin.module"() ({
  "func.func"() <{function_type = (vector<2xi1>) -> i1, sym_name = "any_vector2"}> ({
  ^bb0(%arg0: vector<2xi1> loc("<stdin>":3:8)):
    %0 = "spirv.Any"(%arg0) : (vector<2xi1>) -> i1 loc("<stdin>":4:10)
    "func.return"(%0) : (i1) -> () loc("<stdin>":5:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
