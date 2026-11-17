"builtin.module"() ({
  "func.func"() <{function_type = (vector<2x1x[4]xi32>) -> vector<[8]xi32>, sym_name = "i32_3d_to_1d_last_dim_scalable"}> ({
  ^bb0(%arg0: vector<2x1x[4]xi32> loc("<stdin>":3:8)):
    %0 = "vector.shape_cast"(%arg0) : (vector<2x1x[4]xi32>) -> vector<[8]xi32> loc("<stdin>":4:10)
    "func.return"(%0) : (vector<[8]xi32>) -> () loc("<stdin>":5:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
