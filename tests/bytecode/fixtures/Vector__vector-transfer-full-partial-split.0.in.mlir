"builtin.module"() ({
  "func.func"() <{function_type = (memref<?x8xf32>, index, index) -> vector<4x8xf32>, sym_name = "split_vector_transfer_read_2d"}> ({
  ^bb0(%arg7: memref<?x8xf32> loc("<stdin>":4:8), %arg8: index loc("<stdin>":4:32), %arg9: index loc("<stdin>":4:46)):
    %7 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":5:10)
    %8 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32 loc("<stdin>":6:10)
    %9 = "vector.transfer_read"(%arg7, %arg8, %arg9, %8) <{in_bounds = [false, false], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = affine_map<(d0, d1) -> (d0, d1)>}> : (memref<?x8xf32>, index, index, f32) -> vector<4x8xf32> loc("<stdin>":7:10)
    "func.return"(%9) : (vector<4x8xf32>) -> () loc("<stdin>":8:5)
  }) : () -> () loc("<stdin>":3:3)
  "func.func"() <{function_type = (memref<7x8xf32, strided<[?, 1], offset: ?>>, index, index) -> vector<4x8xf32>, sym_name = "split_vector_transfer_read_strided_2d"}> ({
  ^bb0(%arg4: memref<7x8xf32, strided<[?, 1], offset: ?>> loc("<stdin>":11:8), %arg5: index loc("<stdin>":11:60), %arg6: index loc("<stdin>":11:74)):
    %4 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":12:10)
    %5 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32 loc("<stdin>":13:10)
    %6 = "vector.transfer_read"(%arg4, %arg5, %arg6, %5) <{in_bounds = [false, false], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = affine_map<(d0, d1) -> (d0, d1)>}> : (memref<7x8xf32, strided<[?, 1], offset: ?>>, index, index, f32) -> vector<4x8xf32> loc("<stdin>":14:10)
    "func.return"(%6) : (vector<4x8xf32>) -> () loc("<stdin>":15:5)
  }) : () -> () loc("<stdin>":10:3)
  "func.func"() <{function_type = (memref<?x8xf32, 3>, index, index) -> vector<4x8xf32>, sym_name = "split_vector_transfer_read_mem_space"}> ({
  ^bb0(%arg1: memref<?x8xf32, 3> loc("<stdin>":18:8), %arg2: index loc("<stdin>":18:35), %arg3: index loc("<stdin>":18:49)):
    %1 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":19:10)
    %2 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32 loc("<stdin>":20:10)
    %3 = "vector.transfer_read"(%arg1, %arg2, %arg3, %2) <{in_bounds = [false, false], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = affine_map<(d0, d1) -> (d0, d1)>}> : (memref<?x8xf32, 3>, index, index, f32) -> vector<4x8xf32> loc("<stdin>":21:10)
    "func.return"(%3) : (vector<4x8xf32>) -> () loc("<stdin>":22:5)
  }) : () -> () loc("<stdin>":17:3)
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op loc("<stdin>":26:10)):
      %0 = "transform.structured.match"(%arg0) <{ops = ["func.func"]}> : (!transform.any_op) -> !transform.op<"func.func"> loc("<stdin>":27:12)
      "transform.apply_patterns"(%0) <{max_iterations = -1 : i64, max_num_rewrites = -1 : i64}> ({
        "transform.apply_patterns.vector.split_transfer_full_partial"() <{split_transfer_strategy = 1 : i32}> : () -> () loc("<stdin>":29:9)
      }) : (!transform.op<"func.func">) -> () loc("<stdin>":28:7)
      "transform.yield"() : () -> () loc("<stdin>":31:7)
    }) : () -> () loc("<stdin>":25:5)
  }) {transform.with_named_sequence} : () -> () loc("<stdin>":24:3)
}) : () -> () loc("<stdin>":2:1)
