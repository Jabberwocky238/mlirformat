"builtin.module"() ({
  "func.func"() <{function_type = (memref<?x?xi8>) -> (), sym_name = "transfer_read_2d_i8"}> ({
  ^bb0(%arg0: memref<?x?xi8> loc("<stdin>":4:8)):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":5:10)
    %1 = "arith.constant"() <{value = 0 : i8}> : () -> i8 loc("<stdin>":6:10)
    %2 = "vector.transfer_read"(%arg0, %0, %0, %1) <{in_bounds = [true, true], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = affine_map<(d0, d1) -> (d0, d1)>}> : (memref<?x?xi8>, index, index, i8) -> vector<[16]x[16]xi8> loc("<stdin>":7:10)
    "prevent.dce"(%2) : (vector<[16]x[16]xi8>) -> () loc("<stdin>":8:5)
    "func.return"() : () -> () loc("<stdin>":9:5)
  }) : () -> () loc("<stdin>":3:3)
}) : () -> () loc("<stdin>":2:1)
