"builtin.module"() ({
  "func.func"() <{function_type = (index) -> vector<11xi1>, sym_name = "genbool_var_1d"}> ({
  ^bb0(%arg1: index loc("<stdin>":3:8)):
    %1 = "vector.create_mask"(%arg1) : (index) -> vector<11xi1> loc("<stdin>":4:10)
    "func.return"(%1) : (vector<11xi1>) -> () loc("<stdin>":5:5)
  }) : () -> () loc("<stdin>":2:3)
  "func.func"() <{function_type = (index) -> vector<[11]xi1>, sym_name = "genbool_var_1d_scalable"}> ({
  ^bb0(%arg0: index loc("<stdin>":8:8)):
    %0 = "vector.create_mask"(%arg0) : (index) -> vector<[11]xi1> loc("<stdin>":9:10)
    "func.return"(%0) : (vector<[11]xi1>) -> () loc("<stdin>":10:5)
  }) : () -> () loc("<stdin>":7:3)
}) : () -> () loc("<stdin>":1:1)
