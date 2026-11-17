"builtin.module"() ({
  "func.func"() <{function_type = (vector<8xi8>, vector<8xi8>) -> (vector<8xi16>, vector<4xi32>, vector<2xi64>), sym_name = "arm_neon_smull"}> ({
  ^bb0(%arg0: vector<8xi8> loc("<stdin>":3:8), %arg1: vector<8xi8> loc("<stdin>":3:29)):
    %0 = "arm_neon.intr.smull"(%arg0, %arg1) : (vector<8xi8>, vector<8xi8>) -> vector<8xi16> loc("<stdin>":4:10)
    %1 = "vector.extract_strided_slice"(%0) <{offsets = [3], sizes = [4], strides = [1]}> : (vector<8xi16>) -> vector<4xi16> loc("<stdin>":5:10)
    %2 = "arm_neon.intr.smull"(%1, %1) : (vector<4xi16>, vector<4xi16>) -> vector<4xi32> loc("<stdin>":6:10)
    %3 = "vector.extract_strided_slice"(%2) <{offsets = [1], sizes = [2], strides = [1]}> : (vector<4xi32>) -> vector<2xi32> loc("<stdin>":7:10)
    %4 = "arm_neon.intr.smull"(%3, %3) : (vector<2xi32>, vector<2xi32>) -> vector<2xi64> loc("<stdin>":8:10)
    "func.return"(%0, %2, %4) : (vector<8xi16>, vector<4xi32>, vector<2xi64>) -> () loc("<stdin>":9:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
