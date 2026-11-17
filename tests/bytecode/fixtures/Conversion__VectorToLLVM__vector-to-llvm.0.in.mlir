"builtin.module"() ({
  "func.func"() <{function_type = (vector<2x4xi32>) -> vector<2x2xi64>, sym_name = "bitcast_2d"}> ({
  ^bb0(%arg0: vector<2x4xi32> loc("<stdin>":3:8)):
    %0 = "vector.bitcast"(%arg0) : (vector<2x4xi32>) -> vector<2x2xi64> loc("<stdin>":4:10)
    "func.return"(%0) : (vector<2x2xi64>) -> () loc("<stdin>":5:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
