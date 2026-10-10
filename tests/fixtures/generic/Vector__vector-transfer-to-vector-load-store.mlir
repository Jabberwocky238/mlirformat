#map = affine_map<() -> ()>
#map1 = affine_map<() -> (0)>
#map2 = affine_map<(d0, d1) -> (d1)>
#map3 = affine_map<(d0, d1) -> (d0, d1)>
#map4 = affine_map<(d0, d1) -> ()>
#map5 = affine_map<(d0, d1) -> (d0 * 16 + d1)>
#map6 = affine_map<(d0, d1) -> (d0)>
#map7 = affine_map<(d0, d1) -> (0)>
#map8 = affine_map<(d0, d1) -> (0, 0)>
#map9 = affine_map<(d0, d1, d2, d3, d4) -> (d1, 0, 0, d4)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<f32>, vector<f32>) -> (), sym_name = "vector_transfer_ops_0d_memref"}> ({
  ^bb0(%arg29: memref<f32>, %arg30: vector<f32>):
    %30 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %31 = "vector.transfer_read"(%arg29, %30) <{in_bounds = [], operandSegmentSizes = array<i32: 1, 0, 1, 0>, permutation_map = #map}> : (memref<f32>, f32) -> vector<f32>
    "vector.transfer_write"(%31, %arg29) <{in_bounds = [], operandSegmentSizes = array<i32: 1, 1, 0, 0>, permutation_map = #map}> : (vector<f32>, memref<f32>) -> ()
    "vector.store"(%arg30, %arg29) : (vector<f32>, memref<f32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<f32>) -> vector<1xf32>, sym_name = "vector_transfer_ops_0d_tensor"}> ({
  ^bb0(%arg28: tensor<f32>):
    %28 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %29 = "vector.transfer_read"(%arg28, %28) <{in_bounds = [true], operandSegmentSizes = array<i32: 1, 0, 1, 0>, permutation_map = #map1}> : (tensor<f32>, f32) -> vector<1xf32>
    "func.return"(%29) : (vector<1xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<8x8xf32>, index) -> vector<4xf32>, sym_name = "transfer_to_load"}> ({
  ^bb0(%arg26: memref<8x8xf32>, %arg27: index):
    %26 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %27 = "vector.transfer_read"(%arg26, %arg27, %arg27, %26) <{in_bounds = [true], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = #map2}> : (memref<8x8xf32>, index, index, f32) -> vector<4xf32>
    "vector.transfer_write"(%27, %arg26, %arg27, %arg27) <{in_bounds = [true], operandSegmentSizes = array<i32: 1, 1, 2, 0>, permutation_map = #map2}> : (vector<4xf32>, memref<8x8xf32>, index, index) -> ()
    "func.return"(%27) : (vector<4xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<8x8xf32>, index, vector<4xi1>) -> memref<8x8xf32>, sym_name = "masked_transfer_to_load"}> ({
  ^bb0(%arg23: memref<8x8xf32>, %arg24: index, %arg25: vector<4xi1>):
    %23 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %24 = "vector.mask"(%arg25) ({
      %25 = "vector.transfer_read"(%arg23, %arg24, %arg24, %23) <{in_bounds = [true], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = #map2}> : (memref<8x8xf32>, index, index, f32) -> vector<4xf32>
      "vector.yield"(%25) : (vector<4xf32>) -> ()
    }) : (vector<4xi1>) -> vector<4xf32>
    "vector.mask"(%arg25) ({
      "vector.transfer_write"(%24, %arg23, %arg24, %arg24) <{in_bounds = [true], operandSegmentSizes = array<i32: 1, 1, 2, 0>, permutation_map = #map2}> : (vector<4xf32>, memref<8x8xf32>, index, index) -> ()
      "vector.yield"() : () -> ()
    }) : (vector<4xi1>) -> ()
    "func.return"(%arg23) : (memref<8x8xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<8x8xf32>, index) -> vector<2x4xf32>, sym_name = "transfer_2D"}> ({
  ^bb0(%arg21: memref<8x8xf32>, %arg22: index):
    %21 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %22 = "vector.transfer_read"(%arg21, %arg22, %arg22, %21) <{in_bounds = [true, true], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = #map3}> : (memref<8x8xf32>, index, index, f32) -> vector<2x4xf32>
    "vector.transfer_write"(%22, %arg21, %arg22, %arg22) <{in_bounds = [true, true], operandSegmentSizes = array<i32: 1, 1, 2, 0>, permutation_map = #map3}> : (vector<2x4xf32>, memref<8x8xf32>, index, index) -> ()
    "func.return"(%22) : (vector<2x4xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<8x8xvector<2x4xf32>>, index) -> vector<2x4xf32>, sym_name = "transfer_vector_element"}> ({
  ^bb0(%arg19: memref<8x8xvector<2x4xf32>>, %arg20: index):
    %19 = "arith.constant"() <{value = dense<0.000000e+00> : vector<2x4xf32>}> : () -> vector<2x4xf32>
    %20 = "vector.transfer_read"(%arg19, %arg20, %arg20, %19) <{in_bounds = [], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = #map4}> : (memref<8x8xvector<2x4xf32>>, index, index, vector<2x4xf32>) -> vector<2x4xf32>
    "vector.transfer_write"(%20, %arg19, %arg20, %arg20) <{in_bounds = [], operandSegmentSizes = array<i32: 1, 1, 2, 0>, permutation_map = #map4}> : (vector<2x4xf32>, memref<8x8xvector<2x4xf32>>, index, index) -> ()
    "func.return"(%20) : (vector<2x4xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<8x8xvector<2x4xf32>>, index) -> vector<1x2x4xf32>, sym_name = "transfer_vector_element_different_types"}> ({
  ^bb0(%arg17: memref<8x8xvector<2x4xf32>>, %arg18: index):
    %17 = "arith.constant"() <{value = dense<0.000000e+00> : vector<2x4xf32>}> : () -> vector<2x4xf32>
    %18 = "vector.transfer_read"(%arg17, %arg18, %arg18, %17) <{in_bounds = [true], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = #map2}> : (memref<8x8xvector<2x4xf32>>, index, index, vector<2x4xf32>) -> vector<1x2x4xf32>
    "vector.transfer_write"(%18, %arg17, %arg18, %arg18) <{in_bounds = [true], operandSegmentSizes = array<i32: 1, 1, 2, 0>, permutation_map = #map2}> : (vector<1x2x4xf32>, memref<8x8xvector<2x4xf32>>, index, index) -> ()
    "func.return"(%18) : (vector<1x2x4xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<8x8xf32>, index) -> vector<2x4xf32>, sym_name = "transfer_2D_not_inbounds"}> ({
  ^bb0(%arg15: memref<8x8xf32>, %arg16: index):
    %15 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %16 = "vector.transfer_read"(%arg15, %arg16, %arg16, %15) <{in_bounds = [true, false], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = #map3}> : (memref<8x8xf32>, index, index, f32) -> vector<2x4xf32>
    "vector.transfer_write"(%16, %arg15, %arg16, %arg16) <{in_bounds = [false, true], operandSegmentSizes = array<i32: 1, 1, 2, 0>, permutation_map = #map3}> : (vector<2x4xf32>, memref<8x8xf32>, index, index) -> ()
    "func.return"(%16) : (vector<2x4xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<8x8xf32>, index) -> vector<4xf32>, sym_name = "transfer_not_inbounds"}> ({
  ^bb0(%arg13: memref<8x8xf32>, %arg14: index):
    %13 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %14 = "vector.transfer_read"(%arg13, %arg14, %arg14, %13) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = #map2}> : (memref<8x8xf32>, index, index, f32) -> vector<4xf32>
    "vector.transfer_write"(%14, %arg13, %arg14, %arg14) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 1, 2, 0>, permutation_map = #map2}> : (vector<4xf32>, memref<8x8xf32>, index, index) -> ()
    "func.return"(%14) : (vector<4xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<8x8xf32, #map5>, index) -> vector<4xf32>, sym_name = "transfer_nondefault_layout"}> ({
  ^bb0(%arg11: memref<8x8xf32, #map5>, %arg12: index):
    %11 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %12 = "vector.transfer_read"(%arg11, %arg12, %arg12, %11) <{in_bounds = [true], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = #map2}> : (memref<8x8xf32, #map5>, index, index, f32) -> vector<4xf32>
    "vector.transfer_write"(%12, %arg11, %arg12, %arg12) <{in_bounds = [true], operandSegmentSizes = array<i32: 1, 1, 2, 0>, permutation_map = #map2}> : (vector<4xf32>, memref<8x8xf32, #map5>, index, index) -> ()
    "func.return"(%12) : (vector<4xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<8x8xf32>, index) -> vector<4xf32>, sym_name = "transfer_perm_map"}> ({
  ^bb0(%arg9: memref<8x8xf32>, %arg10: index):
    %9 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %10 = "vector.transfer_read"(%arg9, %arg10, %arg10, %9) <{in_bounds = [true], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = #map6}> : (memref<8x8xf32>, index, index, f32) -> vector<4xf32>
    "func.return"(%10) : (vector<4xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<8x8xf32>, index) -> vector<4xf32>, sym_name = "transfer_broadcasting"}> ({
  ^bb0(%arg7: memref<8x8xf32>, %arg8: index):
    %7 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %8 = "vector.transfer_read"(%arg7, %arg8, %arg8, %7) <{in_bounds = [true], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = #map7}> : (memref<8x8xf32>, index, index, f32) -> vector<4xf32>
    "func.return"(%8) : (vector<4xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<?x?xf32>, index) -> vector<1xf32>, sym_name = "transfer_scalar"}> ({
  ^bb0(%arg5: memref<?x?xf32>, %arg6: index):
    %5 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %6 = "vector.transfer_read"(%arg5, %arg6, %arg6, %5) <{in_bounds = [true], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = #map2}> : (memref<?x?xf32>, index, index, f32) -> vector<1xf32>
    "func.return"(%6) : (vector<1xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<8x8xf32>, index) -> vector<4x4xf32>, sym_name = "transfer_broadcasting_2D"}> ({
  ^bb0(%arg3: memref<8x8xf32>, %arg4: index):
    %3 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %4 = "vector.transfer_read"(%arg3, %arg4, %arg4, %3) <{in_bounds = [true, true], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = #map8}> : (memref<8x8xf32>, index, index, f32) -> vector<4x4xf32>
    "func.return"(%4) : (vector<4x4xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<10x20x30x8x8xf32>, index) -> vector<3x2x4x5xf32>, sym_name = "transfer_broadcasting_complex"}> ({
  ^bb0(%arg1: memref<10x20x30x8x8xf32>, %arg2: index):
    %1 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %2 = "vector.transfer_read"(%arg1, %arg2, %arg2, %arg2, %arg2, %arg2, %1) <{in_bounds = [true, true, true, true], operandSegmentSizes = array<i32: 1, 5, 1, 0>, permutation_map = #map9}> : (memref<10x20x30x8x8xf32>, index, index, index, index, index, f32) -> vector<3x2x4x5xf32>
    "func.return"(%2) : (vector<3x2x4x5xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["func.func"]}> : (!transform.any_op) -> !transform.op<"func.func">
      "transform.apply_patterns"(%0) <{max_iterations = -1 : i64, max_num_rewrites = -1 : i64}> ({
        "transform.apply_patterns.vector.lower_transfer"() <{max_transfer_rank = 99 : i64}> : () -> ()
        "transform.apply_patterns.vector.transfer_permutation_patterns"() : () -> ()
      }) : (!transform.op<"func.func">) -> ()
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d1, d0, 0, 0)>
#map1 = affine_map<(d0, d1, d2, d3) -> (0, d1, 0, d0)>
#map2 = affine_map<(d0, d1, d2, d3) -> (d3, d1, 0, 0)>
#map3 = affine_map<(d0, d1) -> (d1, d0, 0, 0)>
#map4 = affine_map<(d0, d1) -> (0, d1, 0, d0)>
#map5 = affine_map<(d0, d1, d2, d3) -> (d2, d1, d3, d0)>
#map6 = affine_map<(d0, d1) -> (0)>
#map7 = affine_map<(d0, d1, d2, d3) -> (d3, d2)>
#map8 = affine_map<(d0, d1, d2, d3) -> (d0, d1, d3)>
#map9 = affine_map<(d0, d1, d2, d3) -> (d1, d2)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<?x?xf32>, memref<?x?x?x?xf32>, i1) -> (vector<7x14x8x16xf32>, vector<7x14x8x16xf32>, vector<7x14x8x16xf32>, vector<7x14x8x16xf32>, vector<7x14x8x16xf32>, vector<7x14x8x16xf32>, vector<8xf32>), sym_name = "transfer_read_permutations"}> ({
  ^bb0(%arg10: memref<?x?xf32>, %arg11: memref<?x?x?x?xf32>, %arg12: i1):
    %8 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %9 = "arith.constant"() <{value = 0 : index}> : () -> index
    %10 = "vector.broadcast"(%arg12) : (i1) -> vector<14x7xi1>
    %11 = "vector.transfer_read"(%arg11, %9, %9, %9, %9, %8, %10) <{in_bounds = [true, false, true, true], operandSegmentSizes = array<i32: 1, 4, 1, 1>, permutation_map = #map}> : (memref<?x?x?x?xf32>, index, index, index, index, f32, vector<14x7xi1>) -> vector<7x14x8x16xf32>
    %12 = "vector.broadcast"(%arg12) : (i1) -> vector<16x14xi1>
    %13 = "vector.transfer_read"(%arg11, %9, %9, %9, %9, %8, %12) <{in_bounds = [true, false, true, false], operandSegmentSizes = array<i32: 1, 4, 1, 1>, permutation_map = #map1}> : (memref<?x?x?x?xf32>, index, index, index, index, f32, vector<16x14xi1>) -> vector<7x14x8x16xf32>
    %14 = "vector.broadcast"(%arg12) : (i1) -> vector<14x7xi1>
    %15 = "vector.transfer_read"(%arg11, %9, %9, %9, %9, %8, %14) <{in_bounds = [true, false, true, true], operandSegmentSizes = array<i32: 1, 4, 1, 1>, permutation_map = #map2}> : (memref<?x?x?x?xf32>, index, index, index, index, f32, vector<14x7xi1>) -> vector<7x14x8x16xf32>
    %16 = "vector.transfer_read"(%arg10, %9, %9, %8) <{in_bounds = [false, false, true, true], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = #map3}> : (memref<?x?xf32>, index, index, f32) -> vector<7x14x8x16xf32>
    %17 = "vector.transfer_read"(%arg10, %9, %9, %8) <{in_bounds = [true, false, true, false], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = #map4}> : (memref<?x?xf32>, index, index, f32) -> vector<7x14x8x16xf32>
    %18 = "vector.transfer_read"(%arg11, %9, %9, %9, %9, %8) <{in_bounds = [false, false, false, false], operandSegmentSizes = array<i32: 1, 4, 1, 0>, permutation_map = #map5}> : (memref<?x?x?x?xf32>, index, index, index, index, f32) -> vector<7x14x8x16xf32>
    %19 = "vector.transfer_read"(%arg10, %9, %9, %8) <{in_bounds = [true], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = #map6}> : (memref<?x?xf32>, index, index, f32) -> vector<8xf32>
    "func.return"(%11, %13, %15, %16, %17, %18, %19) : (vector<7x14x8x16xf32>, vector<7x14x8x16xf32>, vector<7x14x8x16xf32>, vector<7x14x8x16xf32>, vector<7x14x8x16xf32>, vector<7x14x8x16xf32>, vector<8xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<?x?x?x?xf32>, vector<7x14x8x16xf32>, i1) -> tensor<?x?x?x?xf32>, sym_name = "transfer_write_permutations_tensor_masked"}> ({
  ^bb0(%arg7: tensor<?x?x?x?xf32>, %arg8: vector<7x14x8x16xf32>, %arg9: i1):
    %5 = "arith.constant"() <{value = 0 : index}> : () -> index
    %6 = "vector.broadcast"(%arg9) : (i1) -> vector<16x14x7x8xi1>
    %7 = "vector.transfer_write"(%arg8, %arg7, %5, %5, %5, %5, %6) <{in_bounds = [true, false, false, true], operandSegmentSizes = array<i32: 1, 1, 4, 1>, permutation_map = #map5}> : (vector<7x14x8x16xf32>, tensor<?x?x?x?xf32>, index, index, index, index, vector<16x14x7x8xi1>) -> tensor<?x?x?x?xf32>
    "func.return"(%7) : (tensor<?x?x?x?xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<?x?x?x?xf32>, vector<8x16xf32>) -> (), sym_name = "transfer_write_permutations_memref"}> ({
  ^bb0(%arg5: memref<?x?x?x?xf32>, %arg6: vector<8x16xf32>):
    %4 = "arith.constant"() <{value = 0 : index}> : () -> index
    "vector.transfer_write"(%arg6, %arg5, %4, %4, %4, %4) <{in_bounds = [false, false], operandSegmentSizes = array<i32: 1, 1, 4, 0>, permutation_map = #map7}> : (vector<8x16xf32>, memref<?x?x?x?xf32>, index, index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<?x?x?x?xf32>, vector<14x8x16xf32>) -> tensor<?x?x?x?xf32>, sym_name = "transfer_write_broadcast_unit_dim_tensor"}> ({
  ^bb0(%arg3: tensor<?x?x?x?xf32>, %arg4: vector<14x8x16xf32>):
    %2 = "arith.constant"() <{value = 0 : index}> : () -> index
    %3 = "vector.transfer_write"(%arg4, %arg3, %2, %2, %2, %2) <{in_bounds = [false, false, true], operandSegmentSizes = array<i32: 1, 1, 4, 0>, permutation_map = #map8}> : (vector<14x8x16xf32>, tensor<?x?x?x?xf32>, index, index, index, index) -> tensor<?x?x?x?xf32>
    "func.return"(%3) : (tensor<?x?x?x?xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<?x?x?x?xf32>, vector<8x16xf32>) -> (), sym_name = "transfer_write_broadcast_unit_dim_memref"}> ({
  ^bb0(%arg1: memref<?x?x?x?xf32>, %arg2: vector<8x16xf32>):
    %1 = "arith.constant"() <{value = 0 : index}> : () -> index
    "vector.transfer_write"(%arg2, %arg1, %1, %1, %1, %1) <{in_bounds = [false, false], operandSegmentSizes = array<i32: 1, 1, 4, 0>, permutation_map = #map9}> : (vector<8x16xf32>, memref<?x?x?x?xf32>, index, index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["func.func"]}> : (!transform.any_op) -> !transform.op<"func.func">
      "transform.apply_patterns"(%0) <{max_iterations = -1 : i64, max_num_rewrites = -1 : i64}> ({
        "transform.apply_patterns.vector.lower_transfer"() <{max_transfer_rank = 99 : i64}> : () -> ()
        "transform.apply_patterns.vector.transfer_permutation_patterns"() : () -> ()
      }) : (!transform.op<"func.func">) -> ()
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<?x?xf32>, vector<2x4xi1>) -> vector<2x4xf32>, sym_name = "transfer_2D_masked"}> ({
  ^bb0(%arg1: memref<?x?xf32>, %arg2: vector<2x4xi1>):
    %1 = "arith.constant"() <{value = 0 : index}> : () -> index
    %2 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %3 = "vector.transfer_read"(%arg1, %1, %1, %2, %arg2) <{in_bounds = [true, true], operandSegmentSizes = array<i32: 1, 2, 1, 1>, permutation_map = #map}> : (memref<?x?xf32>, index, index, f32, vector<2x4xi1>) -> vector<2x4xf32>
    "vector.transfer_write"(%3, %arg1, %1, %1, %arg2) <{in_bounds = [true, true], operandSegmentSizes = array<i32: 1, 1, 2, 1>, permutation_map = #map}> : (vector<2x4xf32>, memref<?x?xf32>, index, index, vector<2x4xi1>) -> ()
    "func.return"(%3) : (vector<2x4xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["func.func"]}> : (!transform.any_op) -> !transform.op<"func.func">
      "transform.apply_patterns"(%0) <{max_iterations = -1 : i64, max_num_rewrites = -1 : i64}> ({
        "transform.apply_patterns.vector.lower_transfer"() <{max_transfer_rank = 2 : i64}> : () -> ()
      }) : (!transform.op<"func.func">) -> ()
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

