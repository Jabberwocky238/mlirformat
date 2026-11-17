"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?xf32>, vector<16xf32>, index, vector<16xi1>) -> tensor<?xf32>, sym_name = "mask"}> ({
  ^bb0(%arg4: tensor<?xf32> loc("<stdin>":4:8), %arg5: vector<16xf32> loc("<stdin>":4:30), %arg6: index loc("<stdin>":4:53), %arg7: vector<16xi1> loc("<stdin>":4:67)):
    %2 = "vector.mask"(%arg7) ({
      %3 = "vector.transfer_write"(%arg5, %arg4, %arg6) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = affine_map<(d0) -> (d0)>}> : (vector<16xf32>, tensor<?xf32>, index) -> tensor<?xf32> loc("<stdin>":6:12)
      "vector.yield"(%3) : (tensor<?xf32>) -> () loc("<stdin>":7:7)
    }) : (vector<16xi1>) -> tensor<?xf32> loc("<stdin>":5:10)
    "func.return"(%2) : (tensor<?xf32>) -> () loc("<stdin>":9:5)
  }) : () -> () loc("<stdin>":3:3)
  "func.func"() <{function_type = (tensor<?xf32>, vector<[16]xf32>, index, vector<[16]xi1>) -> tensor<?xf32>, sym_name = "mask_scalable"}> ({
  ^bb0(%arg0: tensor<?xf32> loc("<stdin>":12:8), %arg1: vector<[16]xf32> loc("<stdin>":12:30), %arg2: index loc("<stdin>":12:55), %arg3: vector<[16]xi1> loc("<stdin>":12:69)):
    %0 = "vector.mask"(%arg3) ({
      %1 = "vector.transfer_write"(%arg1, %arg0, %arg2) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = affine_map<(d0) -> (d0)>}> : (vector<[16]xf32>, tensor<?xf32>, index) -> tensor<?xf32> loc("<stdin>":14:12)
      "vector.yield"(%1) : (tensor<?xf32>) -> () loc("<stdin>":15:7)
    }) : (vector<[16]xi1>) -> tensor<?xf32> loc("<stdin>":13:10)
    "func.return"(%0) : (tensor<?xf32>) -> () loc("<stdin>":17:5)
  }) : () -> () loc("<stdin>":11:3)
}) : () -> () loc("<stdin>":2:1)
