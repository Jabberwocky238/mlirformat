#map = affine_map<(d0, d1) -> (d0, d1)>
#map1 = affine_map<(d0) -> (d0)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1, d2)>
#map3 = affine_map<(d0, d1) -> (d1, d0)>
"builtin.module"() ({
  "func.func"() <{function_type = (vector<2x4xf32>, vector<2xf32>) -> vector<2xf32>, sym_name = "vector_multi_reduction"}> ({
  ^bb0(%arg24: vector<2x4xf32>, %arg25: vector<2xf32>):
    %58 = "vector.multi_reduction"(%arg24, %arg25) <{kind = #vector.kind<mul>, reduction_dims = array<i64: 1>}> : (vector<2x4xf32>, vector<2xf32>) -> vector<2xf32>
    "func.return"(%58) : (vector<2xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<2x4xf32>, f32) -> f32, sym_name = "vector_multi_reduction_to_scalar"}> ({
  ^bb0(%arg22: vector<2x4xf32>, %arg23: f32):
    %57 = "vector.multi_reduction"(%arg22, %arg23) <{kind = #vector.kind<mul>, reduction_dims = array<i64: 0, 1>}> : (vector<2x4xf32>, f32) -> f32
    "func.return"(%57) : (f32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<2x3x4x5xi32>, vector<2x3xi32>) -> vector<2x3xi32>, sym_name = "vector_reduction_inner"}> ({
  ^bb0(%arg20: vector<2x3x4x5xi32>, %arg21: vector<2x3xi32>):
    %56 = "vector.multi_reduction"(%arg20, %arg21) <{kind = #vector.kind<add>, reduction_dims = array<i64: 2, 3>}> : (vector<2x3x4x5xi32>, vector<2x3xi32>) -> vector<2x3xi32>
    "func.return"(%56) : (vector<2x3xi32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<2x3x4x5xf32>, vector<2x5xf32>) -> vector<2x5xf32>, sym_name = "vector_multi_reduction_transposed"}> ({
  ^bb0(%arg18: vector<2x3x4x5xf32>, %arg19: vector<2x5xf32>):
    %55 = "vector.multi_reduction"(%arg18, %arg19) <{kind = #vector.kind<add>, reduction_dims = array<i64: 1, 2>}> : (vector<2x3x4x5xf32>, vector<2x5xf32>) -> vector<2x5xf32>
    "func.return"(%55) : (vector<2x5xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<3x2x4xf32>, vector<2x4xf32>) -> vector<2x4xf32>, sym_name = "vector_multi_reduction_ordering"}> ({
  ^bb0(%arg16: vector<3x2x4xf32>, %arg17: vector<2x4xf32>):
    %54 = "vector.multi_reduction"(%arg16, %arg17) <{kind = #vector.kind<mul>, reduction_dims = array<i64: 0>}> : (vector<3x2x4xf32>, vector<2x4xf32>) -> vector<2x4xf32>
    "func.return"(%54) : (vector<2x4xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<?x?xf32>, tensor<?xf32>) -> tensor<?xf32>, sym_name = "vectorize_dynamic_reduction"}> ({
  ^bb0(%arg14: tensor<?x?xf32>, %arg15: tensor<?xf32>):
    %36 = "arith.constant"() <{value = 0 : index}> : () -> index
    %37 = "tensor.dim"(%arg14, %36) : (tensor<?x?xf32>, index) -> index
    %38 = "arith.constant"() <{value = 1 : index}> : () -> index
    %39 = "tensor.dim"(%arg14, %38) : (tensor<?x?xf32>, index) -> index
    %40 = "arith.constant"() <{value = 0 : index}> : () -> index
    %41 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %42 = "vector.create_mask"(%37, %39) : (index, index) -> vector<4x8xi1>
    %43 = "vector.mask"(%42) ({
      %53 = "vector.transfer_read"(%arg14, %40, %40, %41) <{in_bounds = [true, true], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = #map}> : (tensor<?x?xf32>, index, index, f32) -> vector<4x8xf32>
      "vector.yield"(%53) : (vector<4x8xf32>) -> ()
    }) : (vector<4x8xi1>) -> vector<4x8xf32>
    %44 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %45 = "vector.create_mask"(%37) : (index) -> vector<4xi1>
    %46 = "vector.mask"(%45) ({
      %52 = "vector.transfer_read"(%arg15, %40, %44) <{in_bounds = [true], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = #map1}> : (tensor<?xf32>, index, f32) -> vector<4xf32>
      "vector.yield"(%52) : (vector<4xf32>) -> ()
    }) : (vector<4xi1>) -> vector<4xf32>
    %47 = "vector.mask"(%42) ({
      %51 = "vector.multi_reduction"(%43, %46) <{kind = #vector.kind<add>, reduction_dims = array<i64: 1>}> : (vector<4x8xf32>, vector<4xf32>) -> vector<4xf32>
      "vector.yield"(%51) : (vector<4xf32>) -> ()
    }) : (vector<4x8xi1>) -> vector<4xf32>
    %48 = "arith.constant"() <{value = 0 : index}> : () -> index
    %49 = "vector.mask"(%45) ({
      %50 = "vector.transfer_write"(%47, %arg15, %48) <{in_bounds = [true], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = #map1}> : (vector<4xf32>, tensor<?xf32>, index) -> tensor<?xf32>
      "vector.yield"(%50) : (tensor<?xf32>) -> ()
    }) : (vector<4xi1>) -> tensor<?xf32>
    "func.return"(%49) : (tensor<?xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<?xf32>) -> f32, sym_name = "vectorize_1d_dynamic_reduction"}> ({
  ^bb0(%arg13: tensor<?xf32>):
    %27 = "arith.constant"() <{value = 0 : index}> : () -> index
    %28 = "tensor.dim"(%arg13, %27) : (tensor<?xf32>, index) -> index
    %29 = "arith.constant"() <{value = 0 : index}> : () -> index
    %30 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %31 = "vector.create_mask"(%28) : (index) -> vector<8xi1>
    %32 = "vector.mask"(%31) ({
      %35 = "vector.transfer_read"(%arg13, %29, %30) <{in_bounds = [true], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = #map1}> : (tensor<?xf32>, index, f32) -> vector<8xf32>
      "vector.yield"(%35) : (vector<8xf32>) -> ()
    }) : (vector<8xi1>) -> vector<8xf32>
    %33 = "vector.mask"(%31) ({
      %34 = "vector.multi_reduction"(%32, %30) <{kind = #vector.kind<add>, reduction_dims = array<i64: 0>}> : (vector<8xf32>, f32) -> f32
      "vector.yield"(%34) : (f32) -> ()
    }) : (vector<8xi1>) -> f32
    "func.return"(%33) : (f32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<?x?x?xf32>, tensor<?x?xf32>) -> tensor<?x?xf32>, sym_name = "vectorize_dynamic_transpose_reduction"}> ({
  ^bb0(%arg11: tensor<?x?x?xf32>, %arg12: tensor<?x?xf32>):
    %7 = "arith.constant"() <{value = 0 : index}> : () -> index
    %8 = "tensor.dim"(%arg11, %7) : (tensor<?x?x?xf32>, index) -> index
    %9 = "arith.constant"() <{value = 1 : index}> : () -> index
    %10 = "tensor.dim"(%arg11, %9) : (tensor<?x?x?xf32>, index) -> index
    %11 = "arith.constant"() <{value = 2 : index}> : () -> index
    %12 = "tensor.dim"(%arg11, %11) : (tensor<?x?x?xf32>, index) -> index
    %13 = "arith.constant"() <{value = 0 : index}> : () -> index
    %14 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %15 = "vector.create_mask"(%8, %10, %12) : (index, index, index) -> vector<4x8x16xi1>
    %16 = "vector.mask"(%15) ({
      %26 = "vector.transfer_read"(%arg11, %13, %13, %13, %14) <{in_bounds = [true, true, true], operandSegmentSizes = array<i32: 1, 3, 1, 0>, permutation_map = #map2}> : (tensor<?x?x?xf32>, index, index, index, f32) -> vector<4x8x16xf32>
      "vector.yield"(%26) : (vector<4x8x16xf32>) -> ()
    }) : (vector<4x8x16xi1>) -> vector<4x8x16xf32>
    %17 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %18 = "vector.create_mask"(%12, %10) : (index, index) -> vector<16x8xi1>
    %19 = "vector.mask"(%18) ({
      %25 = "vector.transfer_read"(%arg12, %13, %13, %17) <{in_bounds = [true, true], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = #map3}> : (tensor<?x?xf32>, index, index, f32) -> vector<8x16xf32>
      "vector.yield"(%25) : (vector<8x16xf32>) -> ()
    }) : (vector<16x8xi1>) -> vector<8x16xf32>
    %20 = "vector.mask"(%15) ({
      %24 = "vector.multi_reduction"(%16, %19) <{kind = #vector.kind<add>, reduction_dims = array<i64: 0>}> : (vector<4x8x16xf32>, vector<8x16xf32>) -> vector<8x16xf32>
      "vector.yield"(%24) : (vector<8x16xf32>) -> ()
    }) : (vector<4x8x16xi1>) -> vector<8x16xf32>
    %21 = "arith.constant"() <{value = 0 : index}> : () -> index
    %22 = "vector.mask"(%18) ({
      %23 = "vector.transfer_write"(%20, %arg12, %21, %21) <{in_bounds = [true, true], operandSegmentSizes = array<i32: 1, 1, 2, 0>, permutation_map = #map3}> : (vector<8x16xf32>, tensor<?x?xf32>, index, index) -> tensor<?x?xf32>
      "vector.yield"(%23) : (tensor<?x?xf32>) -> ()
    }) : (vector<16x8xi1>) -> tensor<?x?xf32>
    "func.return"(%22) : (tensor<?x?xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<3x4x5xf32>, vector<4xf32>) -> vector<4xf32>, sym_name = "vector_multi_reduction_parallel_middle"}> ({
  ^bb0(%arg9: vector<3x4x5xf32>, %arg10: vector<4xf32>):
    %6 = "vector.multi_reduction"(%arg9, %arg10) <{kind = #vector.kind<add>, reduction_dims = array<i64: 0, 2>}> : (vector<3x4x5xf32>, vector<4xf32>) -> vector<4xf32>
    "func.return"(%6) : (vector<4xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<8x[4]x2xf32>, vector<8x[4]xf32>) -> vector<8x[4]xf32>, sym_name = "vector_multi_reduction_non_scalable_dim", sym_visibility = "private"}> ({
  ^bb0(%arg7: vector<8x[4]x2xf32>, %arg8: vector<8x[4]xf32>):
    %5 = "vector.multi_reduction"(%arg7, %arg8) <{kind = #vector.kind<add>, reduction_dims = array<i64: 2>}> : (vector<8x[4]x2xf32>, vector<8x[4]xf32>) -> vector<8x[4]xf32>
    "func.return"(%5) : (vector<8x[4]xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<[4]xf32>, f32, vector<[4]xi1>) -> f32, sym_name = "vector_multi_reduction_scalable_dim_1d"}> ({
  ^bb0(%arg4: vector<[4]xf32>, %arg5: f32, %arg6: vector<[4]xi1>):
    %3 = "vector.mask"(%arg6) ({
      %4 = "vector.multi_reduction"(%arg4, %arg5) <{kind = #vector.kind<add>, reduction_dims = array<i64: 0>}> : (vector<[4]xf32>, f32) -> f32
      "vector.yield"(%4) : (f32) -> ()
    }) : (vector<[4]xi1>) -> f32
    "func.return"(%3) : (f32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<2x[4]xf32>, vector<2xf32>, vector<2x[4]xi1>) -> vector<2xf32>, sym_name = "vector_multi_reduction_scalable_dim_2d"}> ({
  ^bb0(%arg1: vector<2x[4]xf32>, %arg2: vector<2xf32>, %arg3: vector<2x[4]xi1>):
    %1 = "vector.mask"(%arg3) ({
      %2 = "vector.multi_reduction"(%arg1, %arg2) <{kind = #vector.kind<add>, reduction_dims = array<i64: 1>}> : (vector<2x[4]xf32>, vector<2xf32>) -> vector<2xf32>
      "vector.yield"(%2) : (vector<2xf32>) -> ()
    }) : (vector<2x[4]xi1>) -> vector<2xf32>
    "func.return"(%1) : (vector<2xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["func.func"]}> : (!transform.any_op) -> !transform.op<"func.func">
      "transform.apply_patterns"(%0) <{max_iterations = -1 : i64, max_num_rewrites = -1 : i64}> ({
        "transform.apply_patterns.vector.lower_multi_reduction"() <{lowering_strategy = 1 : i32}> : () -> ()
      }) : (!transform.op<"func.func">) -> ()
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

