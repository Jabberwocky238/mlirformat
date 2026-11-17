"builtin.module"() ({
  "gpu.module"() <{sym_name = "dpas_mx_bf8", targets = [#xevm.target<chip = "cri">]}> ({
    "gpu.func"() <{function_type = (vector<16xf8E5M2>, vector<32xf8E5M2>, vector<8xf32>, vector<1xf8E8M0FNU>, vector<1xf8E8M0FNU>) -> (), kernel}> ({
    ^bb0(%arg0: vector<16xf8E5M2> loc("<stdin>":4:10), %arg1: vector<32xf8E5M2> loc("<stdin>":4:36), %arg2: vector<8xf32> loc("<stdin>":4:62), %arg3: vector<1xf8E8M0FNU> loc("<stdin>":4:84), %arg4: vector<1xf8E8M0FNU> loc("<stdin>":4:112)):
      %0 = "xegpu.dpas_mx"(%arg0, %arg1, %arg2, %arg3, %arg4) <{operandSegmentSizes = array<i32: 1, 1, 1, 1, 1>}> : (vector<16xf8E5M2>, vector<32xf8E5M2>, vector<8xf32>, vector<1xf8E8M0FNU>, vector<1xf8E8M0FNU>) -> vector<8xf32> loc("<stdin>":5:12)
      "gpu.return"() : () -> () loc("<stdin>":6:7)
    }) {sym_name = "dpas_mx_bf8"} : () -> () loc("<stdin>":3:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
