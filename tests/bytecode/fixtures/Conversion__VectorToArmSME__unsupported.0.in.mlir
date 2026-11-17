"builtin.module"() ({
  "func.func"() <{function_type = (memref<?x?xf64>) -> (), sym_name = "transfer_read_2d__bad_type"}> ({
  ^bb0(%arg0: memref<?x?xf64> loc("<stdin>":4:8)):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":5:10)
    %1 = "arith.constant"() <{value = 0.000000e+00 : f64}> : () -> f64 loc("<stdin>":6:10)
    %2 = "vector.transfer_read"(%arg0, %0, %0, %1) <{in_bounds = [false, false], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = affine_map<(d0, d1) -> (d1, d0)>}> : (memref<?x?xf64>, index, index, f64) -> vector<[4]x[4]xf64> loc("<stdin>":7:10)
    "prevent.dce"(%2) : (vector<[4]x[4]xf64>) -> () loc("<stdin>":8:5)
    "func.return"() : () -> () loc("<stdin>":9:5)
  }) : () -> () loc("<stdin>":3:3)
}) : () -> () loc("<stdin>":2:1)
