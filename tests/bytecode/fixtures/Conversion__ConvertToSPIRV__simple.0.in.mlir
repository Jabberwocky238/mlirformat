"builtin.module"() ({
  "func.func"() <{function_type = (i32) -> i32, sym_name = "return_scalar"}> ({
  ^bb0(%arg1: i32 loc("<stdin>":3:8)):
    "func.return"(%arg1) : (i32) -> () loc("<stdin>":4:5)
  }) : () -> () loc("<stdin>":2:3)
  "func.func"() <{function_type = (vector<4xi32>) -> vector<4xi32>, sym_name = "return_vector"}> ({
  ^bb0(%arg0: vector<4xi32> loc("<stdin>":7:8)):
    "func.return"(%arg0) : (vector<4xi32>) -> () loc("<stdin>":8:5)
  }) : () -> () loc("<stdin>":6:3)
}) : () -> () loc("<stdin>":1:1)
