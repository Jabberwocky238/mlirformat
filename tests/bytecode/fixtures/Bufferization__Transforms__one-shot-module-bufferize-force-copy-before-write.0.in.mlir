"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?xf32>) -> tensor<?xf32>, sym_name = "foo"}> ({
  ^bb0(%arg2: tensor<?xf32> loc("<stdin>":4:8)):
    %3 = "arith.constant"() <{value = 1.000000e+00 : f32}> : () -> f32 loc("<stdin>":5:10)
    %4 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":6:10)
    %5 = "tensor.insert"(%3, %arg2, %4) : (f32, tensor<?xf32>, index) -> tensor<?xf32> loc("<stdin>":7:10)
    "func.return"(%5) : (tensor<?xf32>) -> () loc("<stdin>":8:5)
  }) : () -> () loc("<stdin>":3:3)
  "func.func"() <{arg_attrs = [{bufferization.writable = true}, {}], function_type = (tensor<?xf32>, index) -> vector<5xf32>, sym_name = "contains_to_buffer_op"}> ({
  ^bb0(%arg0: tensor<?xf32> loc("<stdin>":11:8), %arg1: index loc("<stdin>":11:30)):
    %0 = "bufferization.to_buffer"(%arg0) : (tensor<?xf32>) -> memref<?xf32> loc("<stdin>":12:10)
    %1 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32 loc("<stdin>":13:10)
    %2 = "vector.transfer_read"(%0, %arg1, %1) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = affine_map<(d0) -> (d0)>}> : (memref<?xf32>, index, f32) -> vector<5xf32> loc("<stdin>":14:10)
    "func.return"(%2) : (vector<5xf32>) -> () loc("<stdin>":15:5)
  }) : () -> () loc("<stdin>":10:3)
}) : () -> () loc("<stdin>":2:1)
