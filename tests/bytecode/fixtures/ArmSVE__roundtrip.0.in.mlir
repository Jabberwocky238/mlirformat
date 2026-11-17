"builtin.module"() ({
  "func.func"() <{function_type = (vector<[16]xi8>, vector<[16]xi8>, vector<[4]xi32>) -> vector<[4]xi32>, sym_name = "arm_sve_sdot"}> ({
  ^bb0(%arg0: vector<[16]xi8> loc("<stdin>":3:8), %arg1: vector<[16]xi8> loc("<stdin>":3:32), %arg2: vector<[4]xi32> loc("<stdin>":3:56)):
    %0 = "arm_sve.sdot"(%arg2, %arg0, %arg1) : (vector<[4]xi32>, vector<[16]xi8>, vector<[16]xi8>) -> vector<[4]xi32> loc("<stdin>":4:10)
    "func.return"(%0) : (vector<[4]xi32>) -> () loc("<stdin>":5:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
