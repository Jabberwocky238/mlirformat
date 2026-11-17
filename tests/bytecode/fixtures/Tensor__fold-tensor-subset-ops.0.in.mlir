"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?x?xf32>, index, index, index, index, index, index) -> vector<4xf32>, sym_name = "fold_vector_transfer_read_with_rank_reduced_extract_slice"}> ({
  ^bb0(%arg0: tensor<?x?x?xf32> loc("<stdin>":4:8), %arg1: index loc("<stdin>":4:34), %arg2: index loc("<stdin>":4:48), %arg3: index loc("<stdin>":4:62), %arg4: index loc("<stdin>":4:76), %arg5: index loc("<stdin>":4:90), %arg6: index loc("<stdin>":4:104)):
    %0 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32 loc("<stdin>":5:10)
    %1 = "tensor.extract_slice"(%arg0, %arg1, %arg2, %arg3, %arg4) <{operandSegmentSizes = array<i32: 1, 2, 2, 0>, static_offsets = array<i64: 0, -9223372036854775808, -9223372036854775808>, static_sizes = array<i64: 1, -9223372036854775808, -9223372036854775808>, static_strides = array<i64: 1, 1, 1>}> : (tensor<?x?x?xf32>, index, index, index, index) -> tensor<?x?xf32> loc("<stdin>":6:10)
    %2 = "vector.transfer_read"(%1, %arg5, %arg6, %0) <{in_bounds = [true], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = affine_map<(d0, d1) -> (d1)>}> : (tensor<?x?xf32>, index, index, f32) -> vector<4xf32> loc("<stdin>":7:10)
    "func.return"(%2) : (vector<4xf32>) -> () loc("<stdin>":8:5)
  }) : () -> () loc("<stdin>":3:3)
}) : () -> () loc("<stdin>":2:1)
