"builtin.module"() ({
  "func.func"() <{function_type = (vector<2x1xf32>, vector<1x1xf32>, vector<2x2xf32>) -> vector<2x2xf32>, sym_name = "m16n8k4_tf32"}> ({
  ^bb0(%arg0: vector<2x1xf32> loc("<stdin>":3:8), %arg1: vector<1x1xf32> loc("<stdin>":3:32), %arg2: vector<2x2xf32> loc("<stdin>":3:56)):
    %0 = "nvgpu.mma.sync"(%arg0, %arg1, %arg2) <{mmaShape = [16, 8, 4]}> : (vector<2x1xf32>, vector<1x1xf32>, vector<2x2xf32>) -> vector<2x2xf32> loc("<stdin>":4:10)
    "func.return"(%0) : (vector<2x2xf32>) -> () loc("<stdin>":5:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
