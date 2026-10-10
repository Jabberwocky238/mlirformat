#map = affine_map<(d0, d1, d2, d3) -> (d3, d2)>
#map1 = affine_map<(d0, d1) -> (d0)>
#map2 = affine_map<(d0, d1, d2, d3) -> (d1, d2)>
#map3 = affine_map<(d0, d1, d2, d3) -> (d0, d1, d3)>
#map4 = affine_map<(d0, d1) -> (0, d1, d0)>
#map5 = affine_map<(d0, d1, d2, d3) -> (0, d1, 0, d3)>
"builtin.module"() ({
  "func.func"() <{function_type = (vector<4x8xi16>, memref<2x2x8x4xi16>, index) -> (), sym_name = "xfer_write_minor_identity_transposed"}> ({
  ^bb0(%arg62: vector<4x8xi16>, %arg63: memref<2x2x8x4xi16>, %arg64: index):
    "vector.transfer_write"(%arg62, %arg63, %arg64, %arg64, %arg64, %arg64) <{in_bounds = [true, true], operandSegmentSizes = array<i32: 1, 1, 4, 0>, permutation_map = #map}> : (vector<4x8xi16>, memref<2x2x8x4xi16>, index, index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<4x8xi16>, memref<2x2x?x?xi16>, index) -> (), sym_name = "xfer_write_minor_identity_transposed_out_of_bounds"}> ({
  ^bb0(%arg59: vector<4x8xi16>, %arg60: memref<2x2x?x?xi16>, %arg61: index):
    "vector.transfer_write"(%arg59, %arg60, %arg61, %arg61, %arg61, %arg61) <{in_bounds = [false, false], operandSegmentSizes = array<i32: 1, 1, 4, 0>, permutation_map = #map}> : (vector<4x8xi16>, memref<2x2x?x?xi16>, index, index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<4x[8]xi16>, memref<2x2x?x4xi16>, vector<[8]x4xi1>, index) -> (), sym_name = "xfer_write_minor_identity_transposed_with_mask_scalable"}> ({
  ^bb0(%arg55: vector<4x[8]xi16>, %arg56: memref<2x2x?x4xi16>, %arg57: vector<[8]x4xi1>, %arg58: index):
    %30 = "arith.constant"() <{value = 0 : index}> : () -> index
    "vector.transfer_write"(%arg55, %arg56, %arg58, %arg58, %arg58, %arg58, %arg57) <{in_bounds = [true, true], operandSegmentSizes = array<i32: 1, 1, 4, 1>, permutation_map = #map}> : (vector<4x[8]xi16>, memref<2x2x?x4xi16>, index, index, index, index, vector<[8]x4xi1>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<4x8xi16>, memref<2x2x8x4xi16>, vector<8x4xi1>, index) -> (), sym_name = "xfer_write_minor_identity_transposed_map_masked"}> ({
  ^bb0(%arg51: vector<4x8xi16>, %arg52: memref<2x2x8x4xi16>, %arg53: vector<8x4xi1>, %arg54: index):
    %29 = "arith.constant"() <{value = 0 : index}> : () -> index
    "vector.mask"(%arg53) ({
      "vector.transfer_write"(%arg51, %arg52, %arg54, %arg54, %arg54, %arg54) <{in_bounds = [true, true], operandSegmentSizes = array<i32: 1, 1, 4, 0>, permutation_map = #map}> : (vector<4x8xi16>, memref<2x2x8x4xi16>, index, index, index, index) -> ()
      "vector.yield"() : () -> ()
    }) : (vector<8x4xi1>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<?x?xf32>, vector<7xf32>, index, index) -> (), sym_name = "xfer_write_non_minor_identity"}> ({
  ^bb0(%arg47: memref<?x?xf32>, %arg48: vector<7xf32>, %arg49: index, %arg50: index):
    "vector.transfer_write"(%arg48, %arg47, %arg49, %arg50) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 1, 2, 0>, permutation_map = #map1}> : (vector<7xf32>, memref<?x?xf32>, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<?x?xf32>, vector<7xf32>, index, index, vector<7xi1>) -> (), sym_name = "xfer_write_non_minor_identity_with_mask_out_of_bounds"}> ({
  ^bb0(%arg42: memref<?x?xf32>, %arg43: vector<7xf32>, %arg44: index, %arg45: index, %arg46: vector<7xi1>):
    "vector.transfer_write"(%arg43, %arg42, %arg44, %arg45, %arg46) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 1, 2, 1>, permutation_map = #map1}> : (vector<7xf32>, memref<?x?xf32>, index, index, vector<7xi1>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<4x[8]xi16>, memref<1x4x?x1xi16>, vector<4x[8]xi1>, index) -> (), sym_name = "xfer_write_non_minor_identity_with_mask_scalable"}> ({
  ^bb0(%arg38: vector<4x[8]xi16>, %arg39: memref<1x4x?x1xi16>, %arg40: vector<4x[8]xi1>, %arg41: index):
    "vector.transfer_write"(%arg38, %arg39, %arg41, %arg41, %arg41, %arg41, %arg40) <{in_bounds = [true, true], operandSegmentSizes = array<i32: 1, 1, 4, 1>, permutation_map = #map2}> : (vector<4x[8]xi16>, memref<1x4x?x1xi16>, index, index, index, index, vector<4x[8]xi1>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<?x?xf32>, vector<16xf32>, index, vector<16xi1>) -> tensor<?x?xf32>, sym_name = "xfer_write_non_minor_identity_masked"}> ({
  ^bb0(%arg34: tensor<?x?xf32>, %arg35: vector<16xf32>, %arg36: index, %arg37: vector<16xi1>):
    %27 = "vector.mask"(%arg37) ({
      %28 = "vector.transfer_write"(%arg35, %arg34, %arg36, %arg36) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 1, 2, 0>, permutation_map = #map1}> : (vector<16xf32>, tensor<?x?xf32>, index, index) -> tensor<?x?xf32>
      "vector.yield"(%28) : (tensor<?x?xf32>) -> ()
    }) : (vector<16xi1>) -> tensor<?x?xf32>
    "func.return"(%27) : (tensor<?x?xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<4x[8]xi16>, tensor<?x?x?x?xf32>, vector<4x[8]xi1>, index) -> tensor<?x?x?x?xf32>, sym_name = "xfer_write_non_minor_identity_masked_scalable"}> ({
  ^bb0(%arg30: vector<4x[8]xi16>, %arg31: tensor<?x?x?x?xf32>, %arg32: vector<4x[8]xi1>, %arg33: index):
    %24 = "arith.constant"() <{value = 0 : index}> : () -> index
    %25 = "vector.mask"(%arg32) ({
      %26 = "vector.transfer_write"(%arg30, %arg31, %arg33, %arg33, %arg33, %arg33) <{in_bounds = [true, true], operandSegmentSizes = array<i32: 1, 1, 4, 0>, permutation_map = #map2}> : (vector<4x[8]xi16>, tensor<?x?x?x?xf32>, index, index, index, index) -> tensor<?x?x?x?xf32>
      "vector.yield"(%26) : (tensor<?x?x?x?xf32>) -> ()
    }) : (vector<4x[8]xi1>) -> tensor<?x?x?x?xf32>
    "func.return"(%25) : (tensor<?x?x?x?xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<?x?x?x?xf32>, vector<14x8x16xf32>, vector<14x8x16xi1>, index) -> tensor<?x?x?x?xf32>, sym_name = "xfer_write_non_minor_identity_masked_2"}> ({
  ^bb0(%arg26: tensor<?x?x?x?xf32>, %arg27: vector<14x8x16xf32>, %arg28: vector<14x8x16xi1>, %arg29: index):
    %22 = "vector.mask"(%arg28) ({
      %23 = "vector.transfer_write"(%arg27, %arg26, %arg29, %arg29, %arg29, %arg29) <{in_bounds = [false, false, true], operandSegmentSizes = array<i32: 1, 1, 4, 0>, permutation_map = #map3}> : (vector<14x8x16xf32>, tensor<?x?x?x?xf32>, index, index, index, index) -> tensor<?x?x?x?xf32>
      "vector.yield"(%23) : (tensor<?x?x?x?xf32>) -> ()
    }) : (vector<14x8x16xi1>) -> tensor<?x?x?x?xf32>
    "func.return"(%22) : (tensor<?x?x?x?xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<?x?xf32>, vector<2x4xi1>, index) -> vector<8x4x2xf32>, sym_name = "xfer_read_minor_identity_transposed_with_mask"}> ({
  ^bb0(%arg23: memref<?x?xf32>, %arg24: vector<2x4xi1>, %arg25: index):
    %20 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %21 = "vector.transfer_read"(%arg23, %arg25, %arg25, %20, %arg24) <{in_bounds = [true, true, true], operandSegmentSizes = array<i32: 1, 2, 1, 1>, permutation_map = #map4}> : (memref<?x?xf32>, index, index, f32, vector<2x4xi1>) -> vector<8x4x2xf32>
    "func.return"(%21) : (vector<8x4x2xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<?x?xf32>, vector<2x[4]xi1>, index) -> vector<8x[4]x2xf32>, sym_name = "xfer_read_minor_identity_transposed_with_mask_scalable"}> ({
  ^bb0(%arg20: memref<?x?xf32>, %arg21: vector<2x[4]xi1>, %arg22: index):
    %18 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %19 = "vector.transfer_read"(%arg20, %arg22, %arg22, %18, %arg21) <{in_bounds = [true, true, true], operandSegmentSizes = array<i32: 1, 2, 1, 1>, permutation_map = #map4}> : (memref<?x?xf32>, index, index, f32, vector<2x[4]xi1>) -> vector<8x[4]x2xf32>
    "func.return"(%19) : (vector<8x[4]x2xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<?x?xf32>, vector<2x4xi1>, index) -> vector<8x4x2xf32>, sym_name = "xfer_read_minor_identity_transposed_masked"}> ({
  ^bb0(%arg17: tensor<?x?xf32>, %arg18: vector<2x4xi1>, %arg19: index):
    %15 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %16 = "vector.mask"(%arg18) ({
      %17 = "vector.transfer_read"(%arg17, %arg19, %arg19, %15) <{in_bounds = [true, true, true], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = #map4}> : (tensor<?x?xf32>, index, index, f32) -> vector<8x4x2xf32>
      "vector.yield"(%17) : (vector<8x4x2xf32>) -> ()
    }) : (vector<2x4xi1>) -> vector<8x4x2xf32>
    "func.return"(%16) : (vector<8x4x2xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<?x?xf32>, vector<2x[4]xi1>, index) -> vector<8x[4]x2xf32>, sym_name = "xfer_read_minor_identity_transposed_masked_scalable"}> ({
  ^bb0(%arg14: tensor<?x?xf32>, %arg15: vector<2x[4]xi1>, %arg16: index):
    %12 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %13 = "vector.mask"(%arg15) ({
      %14 = "vector.transfer_read"(%arg14, %arg16, %arg16, %12) <{in_bounds = [true, true, true], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = #map4}> : (tensor<?x?xf32>, index, index, f32) -> vector<8x[4]x2xf32>
      "vector.yield"(%14) : (vector<8x[4]x2xf32>) -> ()
    }) : (vector<2x[4]xi1>) -> vector<8x[4]x2xf32>
    "func.return"(%13) : (vector<8x[4]x2xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<?x?x?x?xf32>, index) -> vector<8x4x2x3xf32>, sym_name = "xfer_read_minor_identitiy_bcast_dims"}> ({
  ^bb0(%arg12: memref<?x?x?x?xf32>, %arg13: index):
    %10 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %11 = "vector.transfer_read"(%arg12, %arg13, %arg13, %arg13, %arg13, %10) <{in_bounds = [true, true, true, true], operandSegmentSizes = array<i32: 1, 4, 1, 0>, permutation_map = #map5}> : (memref<?x?x?x?xf32>, index, index, index, index, f32) -> vector<8x4x2x3xf32>
    "func.return"(%11) : (vector<8x4x2x3xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<?x?x?x?xf32>, index) -> vector<8x[4]x2x3xf32>, sym_name = "xfer_read_minor_identitiy_bcast_dims_scalable"}> ({
  ^bb0(%arg10: memref<?x?x?x?xf32>, %arg11: index):
    %8 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %9 = "vector.transfer_read"(%arg10, %arg11, %arg11, %arg11, %arg11, %8) <{in_bounds = [true, true, true, true], operandSegmentSizes = array<i32: 1, 4, 1, 0>, permutation_map = #map5}> : (memref<?x?x?x?xf32>, index, index, index, index, f32) -> vector<8x[4]x2x3xf32>
    "func.return"(%9) : (vector<8x[4]x2x3xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<?x?x?x?xf32>, vector<4x3xi1>, index) -> vector<8x4x2x3xf32>, sym_name = "xfer_read_minor_identitiy_bcast_dims_with_mask"}> ({
  ^bb0(%arg7: memref<?x?x?x?xf32>, %arg8: vector<4x3xi1>, %arg9: index):
    %6 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %7 = "vector.transfer_read"(%arg7, %arg9, %arg9, %arg9, %arg9, %6, %arg8) <{in_bounds = [true, true, true, true], operandSegmentSizes = array<i32: 1, 4, 1, 1>, permutation_map = #map5}> : (memref<?x?x?x?xf32>, index, index, index, index, f32, vector<4x3xi1>) -> vector<8x4x2x3xf32>
    "func.return"(%7) : (vector<8x4x2x3xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<?x?x?x?xf32>, vector<[4]x3xi1>, index) -> vector<8x[4]x2x3xf32>, sym_name = "xfer_read_minor_identitiy_bcast_dims_with_mask_scalable"}> ({
  ^bb0(%arg4: memref<?x?x?x?xf32>, %arg5: vector<[4]x3xi1>, %arg6: index):
    %4 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %5 = "vector.transfer_read"(%arg4, %arg6, %arg6, %arg6, %arg6, %4, %arg5) <{in_bounds = [true, true, true, true], operandSegmentSizes = array<i32: 1, 4, 1, 1>, permutation_map = #map5}> : (memref<?x?x?x?xf32>, index, index, index, index, f32, vector<[4]x3xi1>) -> vector<8x[4]x2x3xf32>
    "func.return"(%5) : (vector<8x[4]x2x3xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<?x?x?x?xf32>, vector<4x3xi1>, index) -> vector<8x4x2x3xf32>, sym_name = "xfer_read_minor_identitiy_bcast_dims_masked"}> ({
  ^bb0(%arg1: memref<?x?x?x?xf32>, %arg2: vector<4x3xi1>, %arg3: index):
    %1 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %2 = "vector.mask"(%arg2) ({
      %3 = "vector.transfer_read"(%arg1, %arg3, %arg3, %arg3, %arg3, %1) <{in_bounds = [true, true, true, true], operandSegmentSizes = array<i32: 1, 4, 1, 0>, permutation_map = #map5}> : (memref<?x?x?x?xf32>, index, index, index, index, f32) -> vector<8x4x2x3xf32>
      "vector.yield"(%3) : (vector<8x4x2x3xf32>) -> ()
    }) : (vector<4x3xi1>) -> vector<8x4x2x3xf32>
    "func.return"(%2) : (vector<8x4x2x3xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["func.func"]}> : (!transform.any_op) -> !transform.any_op
      "transform.apply_patterns"(%0) <{max_iterations = -1 : i64, max_num_rewrites = -1 : i64}> ({
        "transform.apply_patterns.vector.transfer_permutation_patterns"() : () -> ()
      }) : (!transform.any_op) -> ()
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

