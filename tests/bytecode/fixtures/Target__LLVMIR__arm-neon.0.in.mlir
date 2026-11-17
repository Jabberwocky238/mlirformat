"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<struct<(vector<8xi16>, vector<4xi32>, vector<2xi64>)> (vector<8xi8>, vector<8xi8>)>, linkage = #llvm.linkage<external>, sym_name = "arm_neon_smull", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: vector<8xi8> loc("<stdin>":3:8), %arg1: vector<8xi8> loc("<stdin>":3:29)):
    %0 = "arm_neon.intr.smull"(%arg0, %arg1) : (vector<8xi8>, vector<8xi8>) -> vector<8xi16> loc("<stdin>":4:10)
    %1 = "llvm.shufflevector"(%0, %0) <{mask = array<i32: 3, 4, 5, 6>}> : (vector<8xi16>, vector<8xi16>) -> vector<4xi16> loc("<stdin>":5:10)
    %2 = "arm_neon.intr.smull"(%1, %1) : (vector<4xi16>, vector<4xi16>) -> vector<4xi32> loc("<stdin>":6:10)
    %3 = "llvm.shufflevector"(%2, %2) <{mask = array<i32: 1, 2>}> : (vector<4xi32>, vector<4xi32>) -> vector<2xi32> loc("<stdin>":7:10)
    %4 = "arm_neon.intr.smull"(%3, %3) : (vector<2xi32>, vector<2xi32>) -> vector<2xi64> loc("<stdin>":8:10)
    %5 = "llvm.mlir.undef"() : () -> !llvm.struct<(vector<8xi16>, vector<4xi32>, vector<2xi64>)> loc("<stdin>":9:10)
    %6 = "llvm.insertvalue"(%5, %0) <{position = array<i64: 0>}> : (!llvm.struct<(vector<8xi16>, vector<4xi32>, vector<2xi64>)>, vector<8xi16>) -> !llvm.struct<(vector<8xi16>, vector<4xi32>, vector<2xi64>)> loc("<stdin>":10:10)
    %7 = "llvm.insertvalue"(%6, %2) <{position = array<i64: 1>}> : (!llvm.struct<(vector<8xi16>, vector<4xi32>, vector<2xi64>)>, vector<4xi32>) -> !llvm.struct<(vector<8xi16>, vector<4xi32>, vector<2xi64>)> loc("<stdin>":11:10)
    %8 = "llvm.insertvalue"(%7, %4) <{position = array<i64: 2>}> : (!llvm.struct<(vector<8xi16>, vector<4xi32>, vector<2xi64>)>, vector<2xi64>) -> !llvm.struct<(vector<8xi16>, vector<4xi32>, vector<2xi64>)> loc("<stdin>":12:10)
    "llvm.return"(%8) : (!llvm.struct<(vector<8xi16>, vector<4xi32>, vector<2xi64>)>) -> () loc("<stdin>":13:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
