"builtin.module"() ({
  "func.func"() <{function_type = (index) -> vector<3x[4]xi1>, sym_name = "create_mask_2d_trailing_scalable"}> ({
  ^bb0(%arg0: index loc("<stdin>":3:8)):
    %0 = "arith.constant"() <{value = 2 : index}> : () -> index loc("<stdin>":4:10)
    %1 = "vector.create_mask"(%0, %arg0) : (index, index) -> vector<3x[4]xi1> loc("<stdin>":5:10)
    "func.return"(%1) : (vector<3x[4]xi1>) -> () loc("<stdin>":6:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
