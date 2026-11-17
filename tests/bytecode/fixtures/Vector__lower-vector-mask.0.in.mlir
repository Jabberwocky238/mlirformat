"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?xf32>, index, vector<16xi1>) -> vector<16xf32>, sym_name = "vector_transfer_read"}> ({
  ^bb0(%arg0: tensor<?xf32> loc("<stdin>":4:8), %arg1: index loc("<stdin>":4:30), %arg2: vector<16xi1> loc("<stdin>":4:44)):
    %0 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32 loc("<stdin>":5:10)
    %1 = "vector.mask"(%arg2) ({
      %2 = "vector.transfer_read"(%arg0, %arg1, %0) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = affine_map<(d0) -> (d0)>}> : (tensor<?xf32>, index, f32) -> vector<16xf32> loc("<stdin>":7:12)
      "vector.yield"(%2) : (vector<16xf32>) -> () loc("<stdin>":8:7)
    }) : (vector<16xi1>) -> vector<16xf32> loc("<stdin>":6:10)
    "func.return"(%1) : (vector<16xf32>) -> () loc("<stdin>":10:5)
  }) : () -> () loc("<stdin>":3:3)
}) : () -> () loc("<stdin>":2:1)
