"builtin.module"() ({
  "func.func"() <{function_type = (memref<?x?xf32>, memref<?x?x?x?xf32>, i1) -> (vector<7x14x8x16xf32>, vector<7x14x8x16xf32>, vector<7x14x8x16xf32>, vector<7x14x8x16xf32>, vector<7x14x8x16xf32>, vector<7x14x8x16xf32>, vector<8xf32>), sym_name = "transfer_read_permutations"}> ({
  ^bb0(%arg10: memref<?x?xf32> loc("<stdin>":14:8), %arg11: memref<?x?x?x?xf32> loc("<stdin>":14:33), %arg12: i1 loc("<stdin>":14:62)):
    %8 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32 loc("<stdin>":15:10)
    %9 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":16:10)
    %10 = "vector.broadcast"(%arg12) : (i1) -> vector<14x7xi1> loc("<stdin>":17:11)
    %11 = "vector.transfer_read"(%arg11, %9, %9, %9, %9, %8, %10) <{in_bounds = [true, false, true, true], operandSegmentSizes = array<i32: 1, 4, 1, 1>, permutation_map = affine_map<(d0, d1, d2, d3) -> (d1, d0, 0, 0)>}> : (memref<?x?x?x?xf32>, index, index, index, index, f32, vector<14x7xi1>) -> vector<7x14x8x16xf32> loc("<stdin>":18:11)
    %12 = "vector.broadcast"(%arg12) : (i1) -> vector<16x14xi1> loc("<stdin>":19:11)
    %13 = "vector.transfer_read"(%arg11, %9, %9, %9, %9, %8, %12) <{in_bounds = [true, false, true, false], operandSegmentSizes = array<i32: 1, 4, 1, 1>, permutation_map = affine_map<(d0, d1, d2, d3) -> (0, d1, 0, d0)>}> : (memref<?x?x?x?xf32>, index, index, index, index, f32, vector<16x14xi1>) -> vector<7x14x8x16xf32> loc("<stdin>":20:11)
    %14 = "vector.broadcast"(%arg12) : (i1) -> vector<14x7xi1> loc("<stdin>":21:11)
    %15 = "vector.transfer_read"(%arg11, %9, %9, %9, %9, %8, %14) <{in_bounds = [true, false, true, true], operandSegmentSizes = array<i32: 1, 4, 1, 1>, permutation_map = affine_map<(d0, d1, d2, d3) -> (d3, d1, 0, 0)>}> : (memref<?x?x?x?xf32>, index, index, index, index, f32, vector<14x7xi1>) -> vector<7x14x8x16xf32> loc("<stdin>":22:11)
    %16 = "vector.transfer_read"(%arg10, %9, %9, %8) <{in_bounds = [false, false, true, true], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = affine_map<(d0, d1) -> (d1, d0, 0, 0)>}> : (memref<?x?xf32>, index, index, f32) -> vector<7x14x8x16xf32> loc("<stdin>":23:11)
    %17 = "vector.transfer_read"(%arg10, %9, %9, %8) <{in_bounds = [true, false, true, false], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = affine_map<(d0, d1) -> (0, d1, 0, d0)>}> : (memref<?x?xf32>, index, index, f32) -> vector<7x14x8x16xf32> loc("<stdin>":24:11)
    %18 = "vector.transfer_read"(%arg11, %9, %9, %9, %9, %8) <{in_bounds = [false, false, false, false], operandSegmentSizes = array<i32: 1, 4, 1, 0>, permutation_map = affine_map<(d0, d1, d2, d3) -> (d2, d1, d3, d0)>}> : (memref<?x?x?x?xf32>, index, index, index, index, f32) -> vector<7x14x8x16xf32> loc("<stdin>":25:11)
    %19 = "vector.transfer_read"(%arg10, %9, %9, %8) <{in_bounds = [true], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = affine_map<(d0, d1) -> (0)>}> : (memref<?x?xf32>, index, index, f32) -> vector<8xf32> loc("<stdin>":26:11)
    "func.return"(%11, %13, %15, %16, %17, %18, %19) : (vector<7x14x8x16xf32>, vector<7x14x8x16xf32>, vector<7x14x8x16xf32>, vector<7x14x8x16xf32>, vector<7x14x8x16xf32>, vector<7x14x8x16xf32>, vector<8xf32>) -> () loc("<stdin>":27:5)
  }) : () -> () loc("<stdin>":13:3)
  "func.func"() <{function_type = (tensor<?x?x?x?xf32>, vector<7x14x8x16xf32>, i1) -> tensor<?x?x?x?xf32>, sym_name = "transfer_write_permutations_tensor_masked"}> ({
  ^bb0(%arg7: tensor<?x?x?x?xf32> loc("<stdin>":30:8), %arg8: vector<7x14x8x16xf32> loc("<stdin>":30:36), %arg9: i1 loc("<stdin>":30:66)):
    %5 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":31:10)
    %6 = "vector.broadcast"(%arg9) : (i1) -> vector<16x14x7x8xi1> loc("<stdin>":32:10)
    %7 = "vector.transfer_write"(%arg8, %arg7, %5, %5, %5, %5, %6) <{in_bounds = [true, false, false, true], operandSegmentSizes = array<i32: 1, 1, 4, 1>, permutation_map = affine_map<(d0, d1, d2, d3) -> (d2, d1, d3, d0)>}> : (vector<7x14x8x16xf32>, tensor<?x?x?x?xf32>, index, index, index, index, vector<16x14x7x8xi1>) -> tensor<?x?x?x?xf32> loc("<stdin>":33:10)
    "func.return"(%7) : (tensor<?x?x?x?xf32>) -> () loc("<stdin>":34:5)
  }) : () -> () loc("<stdin>":29:3)
  "func.func"() <{function_type = (memref<?x?x?x?xf32>, vector<8x16xf32>) -> (), sym_name = "transfer_write_permutations_memref"}> ({
  ^bb0(%arg5: memref<?x?x?x?xf32> loc("<stdin>":37:8), %arg6: vector<8x16xf32> loc("<stdin>":37:36)):
    %4 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":38:10)
    "vector.transfer_write"(%arg6, %arg5, %4, %4, %4, %4) <{in_bounds = [false, false], operandSegmentSizes = array<i32: 1, 1, 4, 0>, permutation_map = affine_map<(d0, d1, d2, d3) -> (d3, d2)>}> : (vector<8x16xf32>, memref<?x?x?x?xf32>, index, index, index, index) -> () loc("<stdin>":39:5)
    "func.return"() : () -> () loc("<stdin>":40:5)
  }) : () -> () loc("<stdin>":36:3)
  "func.func"() <{function_type = (tensor<?x?x?x?xf32>, vector<14x8x16xf32>) -> tensor<?x?x?x?xf32>, sym_name = "transfer_write_broadcast_unit_dim_tensor"}> ({
  ^bb0(%arg3: tensor<?x?x?x?xf32> loc("<stdin>":43:8), %arg4: vector<14x8x16xf32> loc("<stdin>":43:36)):
    %2 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":44:10)
    %3 = "vector.transfer_write"(%arg4, %arg3, %2, %2, %2, %2) <{in_bounds = [false, false, true], operandSegmentSizes = array<i32: 1, 1, 4, 0>, permutation_map = affine_map<(d0, d1, d2, d3) -> (d0, d1, d3)>}> : (vector<14x8x16xf32>, tensor<?x?x?x?xf32>, index, index, index, index) -> tensor<?x?x?x?xf32> loc("<stdin>":45:10)
    "func.return"(%3) : (tensor<?x?x?x?xf32>) -> () loc("<stdin>":46:5)
  }) : () -> () loc("<stdin>":42:3)
  "func.func"() <{function_type = (memref<?x?x?x?xf32>, vector<8x16xf32>) -> (), sym_name = "transfer_write_broadcast_unit_dim_memref"}> ({
  ^bb0(%arg1: memref<?x?x?x?xf32> loc("<stdin>":49:8), %arg2: vector<8x16xf32> loc("<stdin>":49:36)):
    %1 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":50:10)
    "vector.transfer_write"(%arg2, %arg1, %1, %1, %1, %1) <{in_bounds = [false, false], operandSegmentSizes = array<i32: 1, 1, 4, 0>, permutation_map = affine_map<(d0, d1, d2, d3) -> (d1, d2)>}> : (vector<8x16xf32>, memref<?x?x?x?xf32>, index, index, index, index) -> () loc("<stdin>":51:5)
    "func.return"() : () -> () loc("<stdin>":52:5)
  }) : () -> () loc("<stdin>":48:3)
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op loc("<stdin>":56:10)):
      %0 = "transform.structured.match"(%arg0) <{ops = ["func.func"]}> : (!transform.any_op) -> !transform.op<"func.func"> loc("<stdin>":57:12)
      "transform.apply_patterns"(%0) <{max_iterations = -1 : i64, max_num_rewrites = -1 : i64}> ({
        "transform.apply_patterns.vector.lower_transfer"() <{max_transfer_rank = 99 : i64}> : () -> () loc("<stdin>":59:9)
        "transform.apply_patterns.vector.transfer_permutation_patterns"() : () -> () loc("<stdin>":60:9)
      }) : (!transform.op<"func.func">) -> () loc("<stdin>":58:7)
      "transform.yield"() : () -> () loc("<stdin>":62:7)
    }) : () -> () loc("<stdin>":55:5)
  }) {transform.with_named_sequence} : () -> () loc("<stdin>":54:3)
}) : () -> () loc("<stdin>":12:1)
