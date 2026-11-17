"builtin.module"() ({
  "func.func"() <{function_type = (index, vector<4xf32>, vector<8xf32>) -> (), sym_name = "rewrite_warp_op_to_scf_if"}> ({
  ^bb0(%arg0: index loc("<stdin>":3:8), %arg1: vector<4xf32> loc("<stdin>":3:22), %arg2: vector<8xf32> loc("<stdin>":3:44)):
    %0:2 = "gpu.warp_execute_on_lane_0"(%arg0, %arg1, %arg2) <{warp_size = 32 : i64}> ({
    ^bb0(%arg3: vector<128xf32> loc("<stdin>":5:10), %arg4: vector<256xf32> loc("<stdin>":5:34)):
      %1 = "some_def"(%arg3) : (vector<128xf32>) -> vector<32xf32> loc("<stdin>":6:12)
      %2 = "some_def"(%arg4) : (vector<256xf32>) -> vector<64xf32> loc("<stdin>":7:12)
      "gpu.yield"(%1, %2) : (vector<32xf32>, vector<64xf32>) -> () loc("<stdin>":8:7)
    }) : (index, vector<4xf32>, vector<8xf32>) -> (vector<1xf32>, vector<2xf32>) loc("<stdin>":4:12)
    "some_use"(%0#0) : (vector<1xf32>) -> () loc("<stdin>":10:5)
    "some_use"(%0#1) : (vector<2xf32>) -> () loc("<stdin>":11:5)
    "func.return"() : () -> () loc("<stdin>":12:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
