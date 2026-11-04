"builtin.module"() ({
  "func.func"() <{function_type = (vector<[8]xf32>, vector<[8]xf32>) -> vector<[8]x[8]xf32>, sym_name = "outerproduct_f32_scalable_8x8_no_acc"}> ({
  ^bb0(%arg0: vector<[8]xf32>, %arg1: vector<[8]xf32>):
    %0 = "vector.outerproduct"(%arg0, %arg1) <{kind = #vector.kind<add>}> : (vector<[8]xf32>, vector<[8]xf32>) -> vector<[8]x[8]xf32>
    "func.return"(%0) : (vector<[8]x[8]xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<[4]xf32>, vector<[16]xf32>, vector<[4]x[16]xf32>) -> vector<[4]x[16]xf32>, sym_name = "outerproduct_f32_scalable_4x16_acc"}> ({
  ^bb0(%arg0: vector<[4]xf32>, %arg1: vector<[16]xf32>, %arg2: vector<[4]x[16]xf32>):
    %0 = "vector.outerproduct"(%arg0, %arg1, %arg2) <{kind = #vector.kind<add>}> : (vector<[4]xf32>, vector<[16]xf32>, vector<[4]x[16]xf32>) -> vector<[4]x[16]xf32>
    "func.return"(%0) : (vector<[4]x[16]xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<[16]xf32>, vector<[4]xf32>, index, index) -> vector<[16]x[4]xf32>, sym_name = "outerproduct_f32_masked_scalable_16x4"}> ({
  ^bb0(%arg0: vector<[16]xf32>, %arg1: vector<[4]xf32>, %arg2: index, %arg3: index):
    %0 = "vector.create_mask"(%arg2, %arg3) : (index, index) -> vector<[16]x[4]xi1>
    %1 = "vector.mask"(%0) ({
      %2 = "vector.outerproduct"(%arg0, %arg1) <{kind = #vector.kind<add>}> : (vector<[16]xf32>, vector<[4]xf32>) -> vector<[16]x[4]xf32>
      "vector.yield"(%2) : (vector<[16]x[4]xf32>) -> ()
    }) : (vector<[16]x[4]xi1>) -> vector<[16]x[4]xf32>
    "func.return"(%1) : (vector<[16]x[4]xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<[8]xf64>, vector<[4]xf64>) -> vector<[8]x[4]xf64>, sym_name = "outerproduct_f64_scalable_8x4_no_acc"}> ({
  ^bb0(%arg0: vector<[8]xf64>, %arg1: vector<[4]xf64>):
    %0 = "vector.outerproduct"(%arg0, %arg1) <{kind = #vector.kind<add>}> : (vector<[8]xf64>, vector<[4]xf64>) -> vector<[8]x[4]xf64>
    "func.return"(%0) : (vector<[8]x[4]xf64>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<?x?xi32>) -> vector<[8]x[8]xi32>, sym_name = "transfer_read_f32_scalable_8x8"}> ({
  ^bb0(%arg0: memref<?x?xi32>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 0 : i32}> : () -> i32
    %2 = "vector.transfer_read"(%arg0, %0, %0, %1) <{in_bounds = [true, true], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = #map}> : (memref<?x?xi32>, index, index, i32) -> vector<[8]x[8]xi32>
    "func.return"(%2) : (vector<[8]x[8]xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<?x?xi16>, index, index) -> vector<[8]x[16]xi16>, sym_name = "transfer_read_i16_scalable_8x16_masked"}> ({
  ^bb0(%arg0: memref<?x?xi16>, %arg1: index, %arg2: index):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 0 : i16}> : () -> i16
    %2 = "vector.create_mask"(%arg1, %arg2) : (index, index) -> vector<[8]x[16]xi1>
    %3 = "vector.transfer_read"(%arg0, %0, %0, %1, %2) <{in_bounds = [true, true], operandSegmentSizes = array<i32: 1, 2, 1, 1>, permutation_map = #map}> : (memref<?x?xi16>, index, index, i16, vector<[8]x[16]xi1>) -> vector<[8]x[16]xi16>
    "func.return"(%3) : (vector<[8]x[16]xi16>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<?x?xf16>, vector<[16]x[8]xf16>) -> (), sym_name = "transfer_write_f16_scalable_16x8"}> ({
  ^bb0(%arg0: memref<?x?xf16>, %arg1: vector<[16]x[8]xf16>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    "vector.transfer_write"(%arg1, %arg0, %0, %0) <{in_bounds = [true, true], operandSegmentSizes = array<i32: 1, 1, 2, 0>, permutation_map = #map}> : (vector<[16]x[8]xf16>, memref<?x?xf16>, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<?x?xi8>, vector<[16]x[16]xi8>, index, index) -> (), sym_name = "transfer_write_i8_scalable_16x16_masked"}> ({
  ^bb0(%arg0: memref<?x?xi8>, %arg1: vector<[16]x[16]xi8>, %arg2: index, %arg3: index):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "vector.create_mask"(%arg2, %arg2) : (index, index) -> vector<[16]x[16]xi1>
    "vector.transfer_write"(%arg1, %arg0, %0, %0, %1) <{in_bounds = [true, true], operandSegmentSizes = array<i32: 1, 1, 2, 1>, permutation_map = #map}> : (vector<[16]x[16]xi8>, memref<?x?xi8>, index, index, vector<[16]x[16]xi1>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<?x?xf32>, index, index, vector<[8]x[8]xf32>) -> (), sym_name = "transfer_write_f32_scalable_8x8_masked"}> ({
  ^bb0(%arg0: memref<?x?xf32>, %arg1: index, %arg2: index, %arg3: vector<[8]x[8]xf32>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "vector.create_mask"(%arg1, %arg2) : (index, index) -> vector<[8]x[8]xi1>
    "vector.transfer_write"(%arg3, %arg0, %0, %0, %1) <{in_bounds = [true, true], operandSegmentSizes = array<i32: 1, 1, 2, 1>, permutation_map = #map}> : (vector<[8]x[8]xf32>, memref<?x?xf32>, index, index, vector<[8]x[8]xi1>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?xf32>, vector<[8]x[8]xf32>) -> (), sym_name = "negative_transfer_write_f32_scalable_8x8_tensor"}> ({
  ^bb0(%arg0: tensor<?x?xf32>, %arg1: vector<[8]x[8]xf32>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "vector.transfer_write"(%arg1, %arg0, %0, %0) <{in_bounds = [true, true], operandSegmentSizes = array<i32: 1, 1, 2, 0>, permutation_map = #map}> : (vector<[8]x[8]xf32>, tensor<?x?xf32>, index, index) -> tensor<?x?xf32>
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d1, d0)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?xf32>, index, index, vector<[8]x[8]xf32>) -> (), sym_name = "negative_transfer_write_f32_scalable_8x8_tensor"}> ({
  ^bb0(%arg0: tensor<?x?xf32>, %arg1: index, %arg2: index, %arg3: vector<[8]x[8]xf32>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "vector.create_mask"(%arg1, %arg2) : (index, index) -> vector<[8]x[8]xi1>
    %2 = "vector.transfer_write"(%arg3, %arg0, %0, %0, %1) <{in_bounds = [true, true], operandSegmentSizes = array<i32: 1, 1, 2, 1>, permutation_map = #map}> : (vector<[8]x[8]xf32>, tensor<?x?xf32>, index, index, vector<[8]x[8]xi1>) -> tensor<?x?xf32>
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<?x?xf32>, index, index, vector<[32]x[32]xf32>) -> (), sym_name = "negative_transfer_write_f32_scalable_32x32"}> ({
  ^bb0(%arg0: memref<?x?xf32>, %arg1: index, %arg2: index, %arg3: vector<[32]x[32]xf32>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "vector.create_mask"(%arg1, %arg2) : (index, index) -> vector<[32]x[32]xi1>
    "vector.transfer_write"(%arg3, %arg0, %0, %0, %1) <{in_bounds = [true, true], operandSegmentSizes = array<i32: 1, 1, 2, 1>, permutation_map = #map}> : (vector<[32]x[32]xf32>, memref<?x?xf32>, index, index, vector<[32]x[32]xi1>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d1, d0)>
#map1 = affine_map<(d0, d1) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<?x?xf32>, memref<?x?xf32>) -> (), sym_name = "transpose_f32_scalable_4x16_via_read"}> ({
  ^bb0(%arg0: memref<?x?xf32>, %arg1: memref<?x?xf32>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %2 = "vector.transfer_read"(%arg0, %0, %0, %1) <{in_bounds = [true, true], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = #map}> : (memref<?x?xf32>, index, index, f32) -> vector<[16]x[4]xf32>
    "vector.transfer_write"(%2, %arg1, %0, %0) <{in_bounds = [true, true], operandSegmentSizes = array<i32: 1, 1, 2, 0>, permutation_map = #map1}> : (vector<[16]x[4]xf32>, memref<?x?xf32>, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
#map1 = affine_map<(d0, d1) -> (d1, d0)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<?x?xf32>, memref<?x?xf32>) -> (), sym_name = "transpose_f32_scalable_4x16_via_write"}> ({
  ^bb0(%arg0: memref<?x?xf32>, %arg1: memref<?x?xf32>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %2 = "vector.transfer_read"(%arg0, %0, %0, %1) <{in_bounds = [true, true], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = #map}> : (memref<?x?xf32>, index, index, f32) -> vector<[4]x[16]xf32>
    "vector.transfer_write"(%2, %arg1, %0, %0) <{in_bounds = [true, true], operandSegmentSizes = array<i32: 1, 1, 2, 0>, permutation_map = #map1}> : (vector<[4]x[16]xf32>, memref<?x?xf32>, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index, index, index) -> vector<[4]x[4]xi1>, sym_name = "extract_from_vector_create_mask_non_constant_dim"}> ({
  ^bb0(%arg0: index, %arg1: index, %arg2: index):
    %0 = "vector.create_mask"(%arg0, %arg1, %arg2) : (index, index, index) -> vector<4x[4]x[4]xi1>
    %1 = "vector.extract"(%0) <{static_position = array<i64: 2>}> : (vector<4x[4]x[4]xi1>) -> vector<[4]x[4]xi1>
    "func.return"(%1) : (vector<[4]x[4]xi1>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index, index, index, index) -> vector<[4]x[4]xi1>, sym_name = "non_constant_extract_from_vector_create_mask_non_constant"}> ({
  ^bb0(%arg0: index, %arg1: index, %arg2: index, %arg3: index):
    %0 = "vector.create_mask"(%arg1, %arg2, %arg3) : (index, index, index) -> vector<4x[4]x[4]xi1>
    %1 = "vector.extract"(%0, %arg0) <{static_position = array<i64: -9223372036854775808>}> : (vector<4x[4]x[4]xi1>, index) -> vector<[4]x[4]xi1>
    "func.return"(%1) : (vector<[4]x[4]xi1>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (index, index, memref<?x?xf32>) -> vector<4x[8]xf32>, sym_name = "lift_illegal_transpose_to_memory"}> ({
  ^bb0(%arg0: index, %arg1: index, %arg2: memref<?x?xf32>):
    %0 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %1 = "vector.transfer_read"(%arg2, %arg0, %arg1, %0) <{in_bounds = [false, false], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = #map}> : (memref<?x?xf32>, index, index, f32) -> vector<[8]x4xf32>
    %2 = "vector.transpose"(%1) <{permutation = array<i64: 1, 0>}> : (vector<[8]x4xf32>) -> vector<4x[8]xf32>
    "func.return"(%2) : (vector<4x[8]xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (index, index, memref<?x?xf32>, index, index) -> vector<4x[8]xf32>, sym_name = "lift_illegal_transpose_to_memory_with_mask"}> ({
  ^bb0(%arg0: index, %arg1: index, %arg2: memref<?x?xf32>, %arg3: index, %arg4: index):
    %0 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %1 = "vector.create_mask"(%arg0, %arg1) : (index, index) -> vector<[8]x4xi1>
    %2 = "vector.transfer_read"(%arg2, %arg3, %arg4, %0, %1) <{in_bounds = [false, false], operandSegmentSizes = array<i32: 1, 2, 1, 1>, permutation_map = #map}> : (memref<?x?xf32>, index, index, f32, vector<[8]x4xi1>) -> vector<[8]x4xf32>
    %3 = "vector.transpose"(%2) <{permutation = array<i64: 1, 0>}> : (vector<[8]x4xf32>) -> vector<4x[8]xf32>
    "func.return"(%3) : (vector<4x[8]xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (index, index, memref<?x?xi8>) -> vector<4x[8]xi32>, sym_name = "lift_illegal_transpose_to_memory_with_arith_extop"}> ({
  ^bb0(%arg0: index, %arg1: index, %arg2: memref<?x?xi8>):
    %0 = "arith.constant"() <{value = 0 : i8}> : () -> i8
    %1 = "vector.transfer_read"(%arg2, %arg0, %arg1, %0) <{in_bounds = [false, false], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = #map}> : (memref<?x?xi8>, index, index, i8) -> vector<[8]x4xi8>
    %2 = "arith.extsi"(%1) : (vector<[8]x4xi8>) -> vector<[8]x4xi32>
    %3 = "vector.transpose"(%2) <{permutation = array<i64: 1, 0>}> : (vector<[8]x4xi32>) -> vector<4x[8]xi32>
    "func.return"(%3) : (vector<4x[8]xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (index, index, memref<?x?xf32>) -> vector<4x[8]xf32>, sym_name = "lift_illegal_transpose_to_memory_with_in_bounds_attr"}> ({
  ^bb0(%arg0: index, %arg1: index, %arg2: memref<?x?xf32>):
    %0 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %1 = "vector.transfer_read"(%arg2, %arg0, %arg1, %0) <{in_bounds = [false, true], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = #map}> : (memref<?x?xf32>, index, index, f32) -> vector<[8]x4xf32>
    %2 = "vector.transpose"(%1) <{permutation = array<i64: 1, 0>}> : (vector<[8]x4xf32>) -> vector<4x[8]xf32>
    "func.return"(%2) : (vector<4x[8]xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<[4]x1xf32>) -> vector<1x[4]xf32>, sym_name = "illegal_transpose_no_defining_source_op"}> ({
  ^bb0(%arg0: vector<[4]x1xf32>):
    %0 = "vector.transpose"(%arg0) <{permutation = array<i64: 1, 0>}> : (vector<[4]x1xf32>) -> vector<1x[4]xf32>
    "func.return"(%0) : (vector<1x[4]xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> vector<[8]x[8]xi32>, sym_name = "multi_tile_splat"}> ({
    %0 = "arith.constant"() <{value = dense<42> : vector<[8]x[8]xi32>}> : () -> vector<[8]x[8]xi32>
    "func.return"(%0) : (vector<[8]x[8]xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (vector<2x[4]xf32>, memref<?x?xf32>, index, index) -> (), sym_name = "transpose_store_scalable_via_za"}> ({
  ^bb0(%arg0: vector<2x[4]xf32>, %arg1: memref<?x?xf32>, %arg2: index, %arg3: index):
    %0 = "vector.transpose"(%arg0) <{permutation = array<i64: 1, 0>}> : (vector<2x[4]xf32>) -> vector<[4]x2xf32>
    "vector.transfer_write"(%0, %arg1, %arg2, %arg3) <{in_bounds = [true, true], operandSegmentSizes = array<i32: 1, 1, 2, 0>, permutation_map = #map}> : (vector<[4]x2xf32>, memref<?x?xf32>, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (vector<2x[4]xf32>, memref<?x?xf32>, index, index) -> (), sym_name = "transpose_store_scalable_via_za_masked"}> ({
  ^bb0(%arg0: vector<2x[4]xf32>, %arg1: memref<?x?xf32>, %arg2: index, %arg3: index):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "vector.create_mask"(%arg2, %arg3) : (index, index) -> vector<[4]x2xi1>
    %2 = "vector.transpose"(%arg0) <{permutation = array<i64: 1, 0>}> : (vector<2x[4]xf32>) -> vector<[4]x2xf32>
    "vector.transfer_write"(%2, %arg1, %0, %0, %1) <{in_bounds = [true, true], operandSegmentSizes = array<i32: 1, 1, 2, 1>, permutation_map = #map}> : (vector<[4]x2xf32>, memref<?x?xf32>, index, index, vector<[4]x2xi1>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (vector<8x[4]xf32>, memref<?x?xf32>, index, index) -> (), sym_name = "transpose_store_scalable_via_za_multi_tile"}> ({
  ^bb0(%arg0: vector<8x[4]xf32>, %arg1: memref<?x?xf32>, %arg2: index, %arg3: index):
    %0 = "vector.transpose"(%arg0) <{permutation = array<i64: 1, 0>}> : (vector<8x[4]xf32>) -> vector<[4]x8xf32>
    "vector.transfer_write"(%0, %arg1, %arg2, %arg3) <{in_bounds = [true, true], operandSegmentSizes = array<i32: 1, 1, 2, 0>, permutation_map = #map}> : (vector<[4]x8xf32>, memref<?x?xf32>, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (vector<2x[8]xf32>, memref<?x?xf32>, index, index) -> (), sym_name = "transpose_store_scalable_via_za_multi_tile_wide"}> ({
  ^bb0(%arg0: vector<2x[8]xf32>, %arg1: memref<?x?xf32>, %arg2: index, %arg3: index):
    %0 = "vector.transpose"(%arg0) <{permutation = array<i64: 1, 0>}> : (vector<2x[8]xf32>) -> vector<[8]x2xf32>
    "vector.transfer_write"(%0, %arg1, %arg2, %arg3) <{in_bounds = [true, true], operandSegmentSizes = array<i32: 1, 1, 2, 0>, permutation_map = #map}> : (vector<[8]x2xf32>, memref<?x?xf32>, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (vector<2x[7]xf32>, memref<?x?xf32>, index, index) -> (), sym_name = "negative_transpose_store_scalable_via_za__bad_source_shape"}> ({
  ^bb0(%arg0: vector<2x[7]xf32>, %arg1: memref<?x?xf32>, %arg2: index, %arg3: index):
    %0 = "vector.transpose"(%arg0) <{permutation = array<i64: 1, 0>}> : (vector<2x[7]xf32>) -> vector<[7]x2xf32>
    "vector.transfer_write"(%0, %arg1, %arg2, %arg3) <{in_bounds = [true, true], operandSegmentSizes = array<i32: 1, 1, 2, 0>, permutation_map = #map}> : (vector<[7]x2xf32>, memref<?x?xf32>, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<16x2xi1>, vector<16x16xf32>) -> vector<16x16xf32>, sym_name = "vector_mask_without_maskable_op"}> ({
  ^bb0(%arg0: vector<16x2xi1>, %arg1: vector<16x16xf32>):
    %0 = "vector.mask"(%arg0) ({
      "vector.yield"(%arg1) : (vector<16x16xf32>) -> ()
    }) : (vector<16x2xi1>) -> vector<16x16xf32>
    "func.return"(%0) : (vector<16x16xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (index, index, f32, memref<?x?xf32>) -> vector<[4]x1xf32>, sym_name = "xfer_read_scalable_column"}> ({
  ^bb0(%arg0: index, %arg1: index, %arg2: f32, %arg3: memref<?x?xf32>):
    %0 = "vector.transfer_read"(%arg3, %arg0, %arg1, %arg2) <{in_bounds = [false, false], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = #map}> : (memref<?x?xf32>, index, index, f32) -> vector<[4]x1xf32>
    "func.return"(%0) : (vector<[4]x1xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (index, index, f32, memref<?x?xf32>) -> vector<[4]x2xf32>, sym_name = "negative_xfer_read_scalable_column_x2"}> ({
  ^bb0(%arg0: index, %arg1: index, %arg2: f32, %arg3: memref<?x?xf32>):
    %0 = "vector.transfer_read"(%arg3, %arg0, %arg1, %arg2) <{in_bounds = [false, false], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = #map}> : (memref<?x?xf32>, index, index, f32) -> vector<[4]x2xf32>
    "func.return"(%0) : (vector<[4]x2xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (index, index, f32, memref<?x?xf32>) -> vector<4x[1]xf32>, sym_name = "negative_xfer_read_scalable_column_scalable_trailing_dim"}> ({
  ^bb0(%arg0: index, %arg1: index, %arg2: f32, %arg3: memref<?x?xf32>):
    %0 = "vector.transfer_read"(%arg3, %arg0, %arg1, %arg2) <{in_bounds = [false, false], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = #map}> : (memref<?x?xf32>, index, index, f32) -> vector<4x[1]xf32>
    "func.return"(%0) : (vector<4x[1]xf32>) -> ()
  }) : () -> ()
}) : () -> ()

