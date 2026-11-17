"builtin.module"() ({
  "func.func"() <{function_type = (index, memref<1024x1024xf32>, vector<1xf32>) -> (), sym_name = "warp_extract"}> ({
  ^bb0(%arg0: index loc("<stdin>":4:8), %arg1: memref<1024x1024xf32> loc("<stdin>":4:22), %arg2: vector<1xf32> loc("<stdin>":4:52)):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":5:10)
    "gpu.warp_execute_on_lane_0"(%arg0) <{warp_size = 32 : i64}> ({
      "vector.transfer_write"(%arg2, %arg1, %0, %0) <{in_bounds = [true], operandSegmentSizes = array<i32: 1, 1, 2, 0>, permutation_map = affine_map<(d0, d1) -> (d1)>}> : (vector<1xf32>, memref<1024x1024xf32>, index, index) -> () loc("<stdin>":7:7)
      "gpu.yield"() : () -> () loc("<stdin>":8:7)
    }) : (index) -> () loc("<stdin>":6:5)
    "func.return"() : () -> () loc("<stdin>":10:5)
  }) : () -> () loc("<stdin>":3:3)
}) : () -> () loc("<stdin>":2:1)
