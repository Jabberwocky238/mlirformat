"builtin.module"() ({
  "gpu.module"() <{sym_name = "test_kernel", targets = [#xevm.target<chip = "pvc">]}> ({
    "func.func"() <{function_type = (vector<8xf16>, vector<16xf16>, vector<8xf32>) -> vector<8xf32>, sym_name = "dpas"}> ({
    ^bb0(%arg0: vector<8xf16> loc("<stdin>":4:10), %arg1: vector<16xf16> loc("<stdin>":4:32), %arg2: vector<8xf32> loc("<stdin>":4:55)):
      %0 = "xegpu.dpas"(%arg0, %arg1, %arg2) : (vector<8xf16>, vector<16xf16>, vector<8xf32>) -> vector<8xf32> loc("<stdin>":5:12)
      "func.return"(%0) : (vector<8xf32>) -> () loc("<stdin>":6:7)
    }) : () -> () loc("<stdin>":3:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
