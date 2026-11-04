#map = affine_map<(d0, d1) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<?x?xi8>) -> (), sym_name = "transfer_read_2d_i8"}> ({
  ^bb0(%arg0: memref<?x?xi8>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 0 : i8}> : () -> i8
    %2 = "vector.transfer_read"(%arg0, %0, %0, %1) <{in_bounds = [true, true], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = #map}> : (memref<?x?xi8>, index, index, i8) -> vector<[16]x[16]xi8>
    "prevent.dce"(%2) : (vector<[16]x[16]xi8>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<?x?xi16>) -> (), sym_name = "transfer_read_2d_i16"}> ({
  ^bb0(%arg0: memref<?x?xi16>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 0 : i16}> : () -> i16
    %2 = "vector.transfer_read"(%arg0, %0, %0, %1) <{in_bounds = [true, true], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = #map}> : (memref<?x?xi16>, index, index, i16) -> vector<[8]x[8]xi16>
    "prevent.dce"(%2) : (vector<[8]x[8]xi16>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<?x?xi32>) -> (), sym_name = "transfer_read_2d_i32"}> ({
  ^bb0(%arg0: memref<?x?xi32>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 0 : i32}> : () -> i32
    %2 = "vector.transfer_read"(%arg0, %0, %0, %1) <{in_bounds = [true, true], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = #map}> : (memref<?x?xi32>, index, index, i32) -> vector<[4]x[4]xi32>
    "prevent.dce"(%2) : (vector<[4]x[4]xi32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<?x?xi64>) -> (), sym_name = "transfer_read_2d_i64"}> ({
  ^bb0(%arg0: memref<?x?xi64>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 0 : i64}> : () -> i64
    %2 = "vector.transfer_read"(%arg0, %0, %0, %1) <{in_bounds = [true, true], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = #map}> : (memref<?x?xi64>, index, index, i64) -> vector<[2]x[2]xi64>
    "prevent.dce"(%2) : (vector<[2]x[2]xi64>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<?x?xi128>) -> (), sym_name = "transfer_read_2d_i128"}> ({
  ^bb0(%arg0: memref<?x?xi128>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 0 : i128}> : () -> i128
    %2 = "vector.transfer_read"(%arg0, %0, %0, %1) <{in_bounds = [true, true], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = #map}> : (memref<?x?xi128>, index, index, i128) -> vector<[1]x[1]xi128>
    "prevent.dce"(%2) : (vector<[1]x[1]xi128>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<?x?xf16>) -> (), sym_name = "transfer_read_2d_f16"}> ({
  ^bb0(%arg0: memref<?x?xf16>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 0.000000e+00 : f16}> : () -> f16
    %2 = "vector.transfer_read"(%arg0, %0, %0, %1) <{in_bounds = [true, true], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = #map}> : (memref<?x?xf16>, index, index, f16) -> vector<[8]x[8]xf16>
    "prevent.dce"(%2) : (vector<[8]x[8]xf16>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<?x?xbf16>) -> (), sym_name = "transfer_read_2d_bf16"}> ({
  ^bb0(%arg0: memref<?x?xbf16>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 0.000000e+00 : bf16}> : () -> bf16
    %2 = "vector.transfer_read"(%arg0, %0, %0, %1) <{in_bounds = [true, true], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = #map}> : (memref<?x?xbf16>, index, index, bf16) -> vector<[8]x[8]xbf16>
    "prevent.dce"(%2) : (vector<[8]x[8]xbf16>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<?x?xf32>) -> (), sym_name = "transfer_read_2d_f32"}> ({
  ^bb0(%arg0: memref<?x?xf32>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %2 = "vector.transfer_read"(%arg0, %0, %0, %1) <{in_bounds = [true, true], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = #map}> : (memref<?x?xf32>, index, index, f32) -> vector<[4]x[4]xf32>
    "prevent.dce"(%2) : (vector<[4]x[4]xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<?x?xf64>) -> (), sym_name = "transfer_read_2d_f64"}> ({
  ^bb0(%arg0: memref<?x?xf64>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 0.000000e+00 : f64}> : () -> f64
    %2 = "vector.transfer_read"(%arg0, %0, %0, %1) <{in_bounds = [true, true], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = #map}> : (memref<?x?xf64>, index, index, f64) -> vector<[2]x[2]xf64>
    "prevent.dce"(%2) : (vector<[2]x[2]xf64>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<?x?xi16>, vector<[8]x[8]xi1>) -> (), sym_name = "transfer_read_2d_with_mask_i16"}> ({
  ^bb0(%arg0: memref<?x?xi16>, %arg1: vector<[8]x[8]xi1>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 0 : i16}> : () -> i16
    %2 = "vector.transfer_read"(%arg0, %0, %0, %1, %arg1) <{in_bounds = [true, true], operandSegmentSizes = array<i32: 1, 2, 1, 1>, permutation_map = #map}> : (memref<?x?xi16>, index, index, i16, vector<[8]x[8]xi1>) -> vector<[8]x[8]xi16>
    "prevent.dce"(%2) : (vector<[8]x[8]xi16>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d1, d0)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<?x?xi8>) -> (), sym_name = "transfer_read_2d_transpose_i8"}> ({
  ^bb0(%arg0: memref<?x?xi8>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 0 : i8}> : () -> i8
    %2 = "vector.transfer_read"(%arg0, %0, %0, %1) <{in_bounds = [true, true], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = #map}> : (memref<?x?xi8>, index, index, i8) -> vector<[16]x[16]xi8>
    "prevent.dce"(%2) : (vector<[16]x[16]xi8>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d1, d0)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<?x?xf32>, vector<[4]x[4]xi1>) -> (), sym_name = "transfer_read_2d_transpose_with_mask_f32"}> ({
  ^bb0(%arg0: memref<?x?xf32>, %arg1: vector<[4]x[4]xi1>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %2 = "vector.transfer_read"(%arg0, %0, %0, %1, %arg1) <{in_bounds = [true, true], operandSegmentSizes = array<i32: 1, 2, 1, 1>, permutation_map = #map}> : (memref<?x?xf32>, index, index, f32, vector<[4]x[4]xi1>) -> vector<[4]x[4]xf32>
    "prevent.dce"(%2) : (vector<[4]x[4]xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<?x?xf32>) -> (), sym_name = "fold_transpose_into_load"}> ({
  ^bb0(%arg0: memref<?x?xf32>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %2 = "vector.transfer_read"(%arg0, %0, %0, %1) <{in_bounds = [true, true], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = #map}> : (memref<?x?xf32>, index, index, f32) -> vector<[4]x[4]xf32>
    %3 = "vector.transpose"(%2) <{permutation = array<i64: 1, 0>}> : (vector<[4]x[4]xf32>) -> vector<[4]x[4]xf32>
    "prevent.dce"(%3) : (vector<[4]x[4]xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<?x?xf32>) -> (), sym_name = "fold_transpose_into_load_multi_use"}> ({
  ^bb0(%arg0: memref<?x?xf32>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %2 = "vector.transfer_read"(%arg0, %0, %0, %1) <{in_bounds = [true, true], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = #map}> : (memref<?x?xf32>, index, index, f32) -> vector<[4]x[4]xf32>
    "test.some_use"(%2) : (vector<[4]x[4]xf32>) -> ()
    %3 = "vector.transpose"(%2) <{permutation = array<i64: 1, 0>}> : (vector<[4]x[4]xf32>) -> vector<[4]x[4]xf32>
    "prevent.dce"(%3) : (vector<[4]x[4]xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (vector<[16]x[16]xi8>, memref<?x?xi8>) -> (), sym_name = "transfer_write_2d_i8"}> ({
  ^bb0(%arg0: vector<[16]x[16]xi8>, %arg1: memref<?x?xi8>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    "vector.transfer_write"(%arg0, %arg1, %0, %0) <{in_bounds = [true, true], operandSegmentSizes = array<i32: 1, 1, 2, 0>, permutation_map = #map}> : (vector<[16]x[16]xi8>, memref<?x?xi8>, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (vector<[8]x[8]xi16>, memref<?x?xi16>) -> (), sym_name = "transfer_write_2d_i16"}> ({
  ^bb0(%arg0: vector<[8]x[8]xi16>, %arg1: memref<?x?xi16>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    "vector.transfer_write"(%arg0, %arg1, %0, %0) <{in_bounds = [true, true], operandSegmentSizes = array<i32: 1, 1, 2, 0>, permutation_map = #map}> : (vector<[8]x[8]xi16>, memref<?x?xi16>, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (vector<[4]x[4]xi32>, memref<?x?xi32>) -> (), sym_name = "transfer_write_2d_i32"}> ({
  ^bb0(%arg0: vector<[4]x[4]xi32>, %arg1: memref<?x?xi32>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    "vector.transfer_write"(%arg0, %arg1, %0, %0) <{in_bounds = [true, true], operandSegmentSizes = array<i32: 1, 1, 2, 0>, permutation_map = #map}> : (vector<[4]x[4]xi32>, memref<?x?xi32>, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (vector<[2]x[2]xi64>, memref<?x?xi64>) -> (), sym_name = "transfer_write_2d_i64"}> ({
  ^bb0(%arg0: vector<[2]x[2]xi64>, %arg1: memref<?x?xi64>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    "vector.transfer_write"(%arg0, %arg1, %0, %0) <{in_bounds = [true, true], operandSegmentSizes = array<i32: 1, 1, 2, 0>, permutation_map = #map}> : (vector<[2]x[2]xi64>, memref<?x?xi64>, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (vector<[8]x[8]xf16>, memref<?x?xf16>) -> (), sym_name = "transfer_write_2d_f16"}> ({
  ^bb0(%arg0: vector<[8]x[8]xf16>, %arg1: memref<?x?xf16>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    "vector.transfer_write"(%arg0, %arg1, %0, %0) <{in_bounds = [true, true], operandSegmentSizes = array<i32: 1, 1, 2, 0>, permutation_map = #map}> : (vector<[8]x[8]xf16>, memref<?x?xf16>, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (vector<[8]x[8]xbf16>, memref<?x?xbf16>) -> (), sym_name = "transfer_write_2d_bf16"}> ({
  ^bb0(%arg0: vector<[8]x[8]xbf16>, %arg1: memref<?x?xbf16>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    "vector.transfer_write"(%arg0, %arg1, %0, %0) <{in_bounds = [true, true], operandSegmentSizes = array<i32: 1, 1, 2, 0>, permutation_map = #map}> : (vector<[8]x[8]xbf16>, memref<?x?xbf16>, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (vector<[4]x[4]xf32>, memref<?x?xf32>) -> (), sym_name = "transfer_write_2d_f32"}> ({
  ^bb0(%arg0: vector<[4]x[4]xf32>, %arg1: memref<?x?xf32>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    "vector.transfer_write"(%arg0, %arg1, %0, %0) <{in_bounds = [true, true], operandSegmentSizes = array<i32: 1, 1, 2, 0>, permutation_map = #map}> : (vector<[4]x[4]xf32>, memref<?x?xf32>, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (vector<[2]x[2]xf64>, memref<?x?xf64>) -> (), sym_name = "transfer_write_2d_f64"}> ({
  ^bb0(%arg0: vector<[2]x[2]xf64>, %arg1: memref<?x?xf64>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    "vector.transfer_write"(%arg0, %arg1, %0, %0) <{in_bounds = [true, true], operandSegmentSizes = array<i32: 1, 1, 2, 0>, permutation_map = #map}> : (vector<[2]x[2]xf64>, memref<?x?xf64>, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (vector<[2]x[2]xf64>, memref<?x?xf64>, vector<[2]x[2]xi1>) -> (), sym_name = "transfer_write_2d_with_mask_f64"}> ({
  ^bb0(%arg0: vector<[2]x[2]xf64>, %arg1: memref<?x?xf64>, %arg2: vector<[2]x[2]xi1>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    "vector.transfer_write"(%arg0, %arg1, %0, %0, %arg2) <{in_bounds = [true, true], operandSegmentSizes = array<i32: 1, 1, 2, 1>, permutation_map = #map}> : (vector<[2]x[2]xf64>, memref<?x?xf64>, index, index, vector<[2]x[2]xi1>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d1, d0)>
"builtin.module"() ({
  "func.func"() <{function_type = (vector<[2]x[2]xi64>, memref<?x?xi64>) -> (), sym_name = "transfer_write_2d_transpose_i64"}> ({
  ^bb0(%arg0: vector<[2]x[2]xi64>, %arg1: memref<?x?xi64>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    "vector.transfer_write"(%arg0, %arg1, %0, %0) <{in_bounds = [true, true], operandSegmentSizes = array<i32: 1, 1, 2, 0>, permutation_map = #map}> : (vector<[2]x[2]xi64>, memref<?x?xi64>, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d1, d0)>
"builtin.module"() ({
  "func.func"() <{function_type = (vector<[8]x[8]xbf16>, memref<?x?xbf16>, vector<[8]x[8]xi1>) -> (), sym_name = "transfer_write_2d_transpose_with_mask_bf16"}> ({
  ^bb0(%arg0: vector<[8]x[8]xbf16>, %arg1: memref<?x?xbf16>, %arg2: vector<[8]x[8]xi1>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    "vector.transfer_write"(%arg0, %arg1, %0, %0, %arg2) <{in_bounds = [true, true], operandSegmentSizes = array<i32: 1, 1, 2, 1>, permutation_map = #map}> : (vector<[8]x[8]xbf16>, memref<?x?xbf16>, index, index, vector<[8]x[8]xi1>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (vector<[4]x[4]xf32>, memref<?x?xf32>, index) -> (), sym_name = "transfer_write_slice"}> ({
  ^bb0(%arg0: vector<[4]x[4]xf32>, %arg1: memref<?x?xf32>, %arg2: index):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "vector.extract"(%arg0, %arg2) <{static_position = array<i64: -9223372036854775808>}> : (vector<[4]x[4]xf32>, index) -> vector<[4]xf32>
    "vector.transfer_write"(%1, %arg1, %arg2, %0) <{in_bounds = [true], operandSegmentSizes = array<i32: 1, 1, 2, 0>, permutation_map = #map}> : (vector<[4]xf32>, memref<?x?xf32>, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (vector<[4]x[4]xf32>, memref<?x?xf32>, vector<[4]xi1>, index) -> (), sym_name = "transfer_write_slice_with_mask"}> ({
  ^bb0(%arg0: vector<[4]x[4]xf32>, %arg1: memref<?x?xf32>, %arg2: vector<[4]xi1>, %arg3: index):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "vector.extract"(%arg0, %arg3) <{static_position = array<i64: -9223372036854775808>}> : (vector<[4]x[4]xf32>, index) -> vector<[4]xf32>
    "vector.transfer_write"(%1, %arg1, %arg3, %0, %arg2) <{in_bounds = [true], operandSegmentSizes = array<i32: 1, 1, 2, 1>, permutation_map = #map}> : (vector<[4]xf32>, memref<?x?xf32>, index, index, vector<[4]xi1>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (vector<[4]x[4]xf32>, memref<?x?xf32>, index) -> (), sym_name = "transfer_write_vertical_slice"}> ({
  ^bb0(%arg0: vector<[4]x[4]xf32>, %arg1: memref<?x?xf32>, %arg2: index):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arm_sme.extract_tile_slice"(%arg0, %arg2) <{layout = #arm_sme.layout<vertical>}> : (vector<[4]x[4]xf32>, index) -> vector<[4]xf32>
    "vector.transfer_write"(%1, %arg1, %arg2, %0) <{in_bounds = [true], operandSegmentSizes = array<i32: 1, 1, 2, 0>, permutation_map = #map}> : (vector<[4]xf32>, memref<?x?xf32>, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (i32) -> (), sym_name = "broadcast_vec2d_from_i32"}> ({
  ^bb0(%arg0: i32):
    %0 = "vector.broadcast"(%arg0) : (i32) -> vector<[4]x[4]xi32>
    "prevent.dce"(%0) : (vector<[4]x[4]xi32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<f32>) -> (), sym_name = "broadcast_vec2d_from_vec0d"}> ({
  ^bb0(%arg0: vector<f32>):
    %0 = "vector.broadcast"(%arg0) : (vector<f32>) -> vector<[4]x[4]xf32>
    "prevent.dce"(%0) : (vector<[4]x[4]xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<[8]xi16>) -> (), sym_name = "broadcast_vec2d_from_vec1d"}> ({
  ^bb0(%arg0: vector<[8]xi16>):
    %0 = "vector.broadcast"(%arg0) : (vector<[8]xi16>) -> vector<[8]x[8]xi16>
    "prevent.dce"(%0) : (vector<[8]x[8]xi16>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<[16]x[16]xi8>) -> (), sym_name = "transpose_i8"}> ({
  ^bb0(%arg0: vector<[16]x[16]xi8>):
    %0 = "vector.transpose"(%arg0) <{permutation = array<i64: 1, 0>}> : (vector<[16]x[16]xi8>) -> vector<[16]x[16]xi8>
    "prevent.dce"(%0) : (vector<[16]x[16]xi8>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<[8]x[8]xi16>) -> (), sym_name = "transpose_i16"}> ({
  ^bb0(%arg0: vector<[8]x[8]xi16>):
    %0 = "vector.transpose"(%arg0) <{permutation = array<i64: 1, 0>}> : (vector<[8]x[8]xi16>) -> vector<[8]x[8]xi16>
    "prevent.dce"(%0) : (vector<[8]x[8]xi16>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<[4]x[4]xi32>) -> (), sym_name = "transpose_i32"}> ({
  ^bb0(%arg0: vector<[4]x[4]xi32>):
    %0 = "vector.transpose"(%arg0) <{permutation = array<i64: 1, 0>}> : (vector<[4]x[4]xi32>) -> vector<[4]x[4]xi32>
    "prevent.dce"(%0) : (vector<[4]x[4]xi32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<[2]x[2]xi64>) -> (), sym_name = "transpose_i64"}> ({
  ^bb0(%arg0: vector<[2]x[2]xi64>):
    %0 = "vector.transpose"(%arg0) <{permutation = array<i64: 1, 0>}> : (vector<[2]x[2]xi64>) -> vector<[2]x[2]xi64>
    "prevent.dce"(%0) : (vector<[2]x[2]xi64>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<[1]x[1]xi128>) -> (), sym_name = "transpose_i128"}> ({
  ^bb0(%arg0: vector<[1]x[1]xi128>):
    %0 = "vector.transpose"(%arg0) <{permutation = array<i64: 1, 0>}> : (vector<[1]x[1]xi128>) -> vector<[1]x[1]xi128>
    "prevent.dce"(%0) : (vector<[1]x[1]xi128>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<[8]x[8]xf16>) -> (), sym_name = "transpose_f16"}> ({
  ^bb0(%arg0: vector<[8]x[8]xf16>):
    %0 = "vector.transpose"(%arg0) <{permutation = array<i64: 1, 0>}> : (vector<[8]x[8]xf16>) -> vector<[8]x[8]xf16>
    "prevent.dce"(%0) : (vector<[8]x[8]xf16>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<[8]x[8]xbf16>) -> (), sym_name = "transpose_bf16"}> ({
  ^bb0(%arg0: vector<[8]x[8]xbf16>):
    %0 = "vector.transpose"(%arg0) <{permutation = array<i64: 1, 0>}> : (vector<[8]x[8]xbf16>) -> vector<[8]x[8]xbf16>
    "prevent.dce"(%0) : (vector<[8]x[8]xbf16>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<[4]x[4]xf32>) -> (), sym_name = "transpose_f32"}> ({
  ^bb0(%arg0: vector<[4]x[4]xf32>):
    %0 = "vector.transpose"(%arg0) <{permutation = array<i64: 1, 0>}> : (vector<[4]x[4]xf32>) -> vector<[4]x[4]xf32>
    "prevent.dce"(%0) : (vector<[4]x[4]xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<[2]x[2]xf64>) -> (), sym_name = "transpose_f64"}> ({
  ^bb0(%arg0: vector<[2]x[2]xf64>):
    %0 = "vector.transpose"(%arg0) <{permutation = array<i64: 1, 0>}> : (vector<[2]x[2]xf64>) -> vector<[2]x[2]xf64>
    "prevent.dce"(%0) : (vector<[2]x[2]xf64>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<[8]xf16>, vector<[8]xf16>, vector<[8]x[8]xf16>, index, index) -> (), sym_name = "vector_outerproduct_masked_f16"}> ({
  ^bb0(%arg0: vector<[8]xf16>, %arg1: vector<[8]xf16>, %arg2: vector<[8]x[8]xf16>, %arg3: index, %arg4: index):
    %0 = "vector.create_mask"(%arg3, %arg4) : (index, index) -> vector<[8]x[8]xi1>
    %1 = "vector.mask"(%0) ({
      %2 = "vector.outerproduct"(%arg0, %arg1, %arg2) <{kind = #vector.kind<add>}> : (vector<[8]xf16>, vector<[8]xf16>, vector<[8]x[8]xf16>) -> vector<[8]x[8]xf16>
      "vector.yield"(%2) : (vector<[8]x[8]xf16>) -> ()
    }) : (vector<[8]x[8]xi1>) -> vector<[8]x[8]xf16>
    "prevent.dce"(%1) : (vector<[8]x[8]xf16>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<[8]xbf16>, vector<[8]xbf16>, vector<[8]x[8]xbf16>, index, index) -> (), sym_name = "vector_outerproduct_masked_bf16"}> ({
  ^bb0(%arg0: vector<[8]xbf16>, %arg1: vector<[8]xbf16>, %arg2: vector<[8]x[8]xbf16>, %arg3: index, %arg4: index):
    %0 = "vector.create_mask"(%arg3, %arg4) : (index, index) -> vector<[8]x[8]xi1>
    %1 = "vector.mask"(%0) ({
      %2 = "vector.outerproduct"(%arg0, %arg1, %arg2) <{kind = #vector.kind<add>}> : (vector<[8]xbf16>, vector<[8]xbf16>, vector<[8]x[8]xbf16>) -> vector<[8]x[8]xbf16>
      "vector.yield"(%2) : (vector<[8]x[8]xbf16>) -> ()
    }) : (vector<[8]x[8]xi1>) -> vector<[8]x[8]xbf16>
    "prevent.dce"(%1) : (vector<[8]x[8]xbf16>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<[4]xf32>, vector<[4]xf32>, vector<[4]x[4]xf32>, index, index) -> (), sym_name = "vector_outerproduct_masked_f32"}> ({
  ^bb0(%arg0: vector<[4]xf32>, %arg1: vector<[4]xf32>, %arg2: vector<[4]x[4]xf32>, %arg3: index, %arg4: index):
    %0 = "vector.create_mask"(%arg3, %arg4) : (index, index) -> vector<[4]x[4]xi1>
    %1 = "vector.mask"(%0) ({
      %2 = "vector.outerproduct"(%arg0, %arg1, %arg2) <{kind = #vector.kind<add>}> : (vector<[4]xf32>, vector<[4]xf32>, vector<[4]x[4]xf32>) -> vector<[4]x[4]xf32>
      "vector.yield"(%2) : (vector<[4]x[4]xf32>) -> ()
    }) : (vector<[4]x[4]xi1>) -> vector<[4]x[4]xf32>
    "prevent.dce"(%1) : (vector<[4]x[4]xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<[2]xf64>, vector<[2]xf64>, vector<[2]x[2]xf64>, index, index) -> (), sym_name = "vector_outerproduct_masked_f64"}> ({
  ^bb0(%arg0: vector<[2]xf64>, %arg1: vector<[2]xf64>, %arg2: vector<[2]x[2]xf64>, %arg3: index, %arg4: index):
    %0 = "vector.create_mask"(%arg3, %arg4) : (index, index) -> vector<[2]x[2]xi1>
    %1 = "vector.mask"(%0) ({
      %2 = "vector.outerproduct"(%arg0, %arg1, %arg2) <{kind = #vector.kind<add>}> : (vector<[2]xf64>, vector<[2]xf64>, vector<[2]x[2]xf64>) -> vector<[2]x[2]xf64>
      "vector.yield"(%2) : (vector<[2]x[2]xf64>) -> ()
    }) : (vector<[2]x[2]xi1>) -> vector<[2]x[2]xf64>
    "prevent.dce"(%1) : (vector<[2]x[2]xf64>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<[8]xf16>, vector<[8]xf16>, vector<[8]x[8]xf16>) -> (), sym_name = "vector_outerproduct_f16"}> ({
  ^bb0(%arg0: vector<[8]xf16>, %arg1: vector<[8]xf16>, %arg2: vector<[8]x[8]xf16>):
    %0 = "vector.outerproduct"(%arg0, %arg1, %arg2) <{kind = #vector.kind<add>}> : (vector<[8]xf16>, vector<[8]xf16>, vector<[8]x[8]xf16>) -> vector<[8]x[8]xf16>
    "prevent.dce"(%0) : (vector<[8]x[8]xf16>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<[8]xbf16>, vector<[8]xbf16>, vector<[8]x[8]xbf16>) -> (), sym_name = "vector_outerproduct_bf16"}> ({
  ^bb0(%arg0: vector<[8]xbf16>, %arg1: vector<[8]xbf16>, %arg2: vector<[8]x[8]xbf16>):
    %0 = "vector.outerproduct"(%arg0, %arg1, %arg2) <{kind = #vector.kind<add>}> : (vector<[8]xbf16>, vector<[8]xbf16>, vector<[8]x[8]xbf16>) -> vector<[8]x[8]xbf16>
    "prevent.dce"(%0) : (vector<[8]x[8]xbf16>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<[4]xf32>, vector<[4]xf32>, vector<[4]x[4]xf32>) -> (), sym_name = "vector_outerproduct_f32"}> ({
  ^bb0(%arg0: vector<[4]xf32>, %arg1: vector<[4]xf32>, %arg2: vector<[4]x[4]xf32>):
    %0 = "vector.outerproduct"(%arg0, %arg1, %arg2) <{kind = #vector.kind<add>}> : (vector<[4]xf32>, vector<[4]xf32>, vector<[4]x[4]xf32>) -> vector<[4]x[4]xf32>
    "prevent.dce"(%0) : (vector<[4]x[4]xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<[2]xf64>, vector<[2]xf64>, vector<[2]x[2]xf64>) -> (), sym_name = "vector_outerproduct_f64"}> ({
  ^bb0(%arg0: vector<[2]xf64>, %arg1: vector<[2]xf64>, %arg2: vector<[2]x[2]xf64>):
    %0 = "vector.outerproduct"(%arg0, %arg1, %arg2) <{kind = #vector.kind<add>}> : (vector<[2]xf64>, vector<[2]xf64>, vector<[2]x[2]xf64>) -> vector<[2]x[2]xf64>
    "prevent.dce"(%0) : (vector<[2]x[2]xf64>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<[4]x[4]xf32>) -> (), sym_name = "vector_print_tile"}> ({
  ^bb0(%arg0: vector<[4]x[4]xf32>):
    "vector.print"(%arg0) <{punctuation = #vector.punctuation<newline>}> : (vector<[4]x[4]xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<?x?xi8>) -> vector<[16]x[16]xi8>, sym_name = "vector_load_i8_with_offset"}> ({
  ^bb0(%arg0: memref<?x?xi8>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 123 : index}> : () -> index
    %2 = "vector.load"(%arg0, %1, %0) : (memref<?x?xi8>, index, index) -> vector<[16]x[16]xi8>
    "func.return"(%2) : (vector<[16]x[16]xi8>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<?x?xi16>) -> vector<[8]x[8]xi16>, sym_name = "vector_load_i16"}> ({
  ^bb0(%arg0: memref<?x?xi16>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "vector.load"(%arg0, %0, %0) : (memref<?x?xi16>, index, index) -> vector<[8]x[8]xi16>
    "func.return"(%1) : (vector<[8]x[8]xi16>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<?x?xi32>) -> vector<[4]x[4]xi32>, sym_name = "vector_load_i32"}> ({
  ^bb0(%arg0: memref<?x?xi32>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "vector.load"(%arg0, %0, %0) : (memref<?x?xi32>, index, index) -> vector<[4]x[4]xi32>
    "func.return"(%1) : (vector<[4]x[4]xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<?x?xi64>) -> vector<[2]x[2]xi64>, sym_name = "vector_load_i64"}> ({
  ^bb0(%arg0: memref<?x?xi64>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "vector.load"(%arg0, %0, %0) : (memref<?x?xi64>, index, index) -> vector<[2]x[2]xi64>
    "func.return"(%1) : (vector<[2]x[2]xi64>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<?x?xf16>) -> vector<[8]x[8]xf16>, sym_name = "vector_load_f16"}> ({
  ^bb0(%arg0: memref<?x?xf16>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "vector.load"(%arg0, %0, %0) : (memref<?x?xf16>, index, index) -> vector<[8]x[8]xf16>
    "func.return"(%1) : (vector<[8]x[8]xf16>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<?x?xbf16>) -> vector<[8]x[8]xbf16>, sym_name = "vector_load_bf16"}> ({
  ^bb0(%arg0: memref<?x?xbf16>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "vector.load"(%arg0, %0, %0) : (memref<?x?xbf16>, index, index) -> vector<[8]x[8]xbf16>
    "func.return"(%1) : (vector<[8]x[8]xbf16>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<?x?xf32>) -> vector<[4]x[4]xf32>, sym_name = "vector_load_f32"}> ({
  ^bb0(%arg0: memref<?x?xf32>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "vector.load"(%arg0, %0, %0) : (memref<?x?xf32>, index, index) -> vector<[4]x[4]xf32>
    "func.return"(%1) : (vector<[4]x[4]xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<?x?xf64>) -> vector<[2]x[2]xf64>, sym_name = "vector_load_f64"}> ({
  ^bb0(%arg0: memref<?x?xf64>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "vector.load"(%arg0, %0, %0) : (memref<?x?xf64>, index, index) -> vector<[2]x[2]xf64>
    "func.return"(%1) : (vector<[2]x[2]xf64>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<?x?xi128>) -> vector<[1]x[1]xi128>, sym_name = "vector_load_i128"}> ({
  ^bb0(%arg0: memref<?x?xi128>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "vector.load"(%arg0, %0, %0) : (memref<?x?xi128>, index, index) -> vector<[1]x[1]xi128>
    "func.return"(%1) : (vector<[1]x[1]xi128>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<?x?xi8>) -> (), sym_name = "vector_store_i8"}> ({
  ^bb0(%arg0: memref<?x?xi8>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arm_sme.get_tile"() : () -> vector<[16]x[16]xi8>
    "vector.store"(%1, %arg0, %0, %0) : (vector<[16]x[16]xi8>, memref<?x?xi8>, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<?x?xi16>) -> (), sym_name = "vector_store_i16"}> ({
  ^bb0(%arg0: memref<?x?xi16>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arm_sme.get_tile"() : () -> vector<[8]x[8]xi16>
    "vector.store"(%1, %arg0, %0, %0) : (vector<[8]x[8]xi16>, memref<?x?xi16>, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<?x?xi32>) -> (), sym_name = "vector_store_i32"}> ({
  ^bb0(%arg0: memref<?x?xi32>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arm_sme.get_tile"() : () -> vector<[4]x[4]xi32>
    "vector.store"(%1, %arg0, %0, %0) : (vector<[4]x[4]xi32>, memref<?x?xi32>, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<?x?xi64>) -> (), sym_name = "vector_store_i64"}> ({
  ^bb0(%arg0: memref<?x?xi64>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arm_sme.get_tile"() : () -> vector<[2]x[2]xi64>
    "vector.store"(%1, %arg0, %0, %0) : (vector<[2]x[2]xi64>, memref<?x?xi64>, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<?x?xf16>) -> (), sym_name = "vector_store_f16"}> ({
  ^bb0(%arg0: memref<?x?xf16>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arm_sme.get_tile"() : () -> vector<[8]x[8]xf16>
    "vector.store"(%1, %arg0, %0, %0) : (vector<[8]x[8]xf16>, memref<?x?xf16>, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<?x?xbf16>) -> (), sym_name = "vector_store_bf16"}> ({
  ^bb0(%arg0: memref<?x?xbf16>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arm_sme.get_tile"() : () -> vector<[8]x[8]xbf16>
    "vector.store"(%1, %arg0, %0, %0) : (vector<[8]x[8]xbf16>, memref<?x?xbf16>, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<?x?xf32>) -> (), sym_name = "vector_store_f32"}> ({
  ^bb0(%arg0: memref<?x?xf32>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arm_sme.get_tile"() : () -> vector<[4]x[4]xf32>
    "vector.store"(%1, %arg0, %0, %0) : (vector<[4]x[4]xf32>, memref<?x?xf32>, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<?x?xf64>) -> (), sym_name = "vector_store_f64"}> ({
  ^bb0(%arg0: memref<?x?xf64>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arm_sme.get_tile"() : () -> vector<[2]x[2]xf64>
    "vector.store"(%1, %arg0, %0, %0) : (vector<[2]x[2]xf64>, memref<?x?xf64>, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<?x?xi128>) -> (), sym_name = "vector_store_i128"}> ({
  ^bb0(%arg0: memref<?x?xi128>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arm_sme.get_tile"() : () -> vector<[1]x[1]xi128>
    "vector.store"(%1, %arg0, %0, %0) : (vector<[1]x[1]xi128>, memref<?x?xi128>, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<[4]xi32>, index) -> vector<[4]x[4]xi32>, sym_name = "vector_insert_slice_i32"}> ({
  ^bb0(%arg0: vector<[4]xi32>, %arg1: index):
    %0 = "arm_sme.get_tile"() : () -> vector<[4]x[4]xi32>
    %1 = "vector.insert"(%arg0, %0, %arg1) <{static_position = array<i64: -9223372036854775808>}> : (vector<[4]xi32>, vector<[4]x[4]xi32>, index) -> vector<[4]x[4]xi32>
    "func.return"(%1) : (vector<[4]x[4]xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<[16]xi8>, index) -> vector<[16]x[16]xi8>, sym_name = "vector_insert_slice_i8"}> ({
  ^bb0(%arg0: vector<[16]xi8>, %arg1: index):
    %0 = "arm_sme.get_tile"() : () -> vector<[16]x[16]xi8>
    %1 = "vector.insert"(%arg0, %0, %arg1) <{static_position = array<i64: -9223372036854775808>}> : (vector<[16]xi8>, vector<[16]x[16]xi8>, index) -> vector<[16]x[16]xi8>
    "func.return"(%1) : (vector<[16]x[16]xi8>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<[8]xi16>, index) -> vector<[8]x[8]xi16>, sym_name = "vector_insert_slice_i16"}> ({
  ^bb0(%arg0: vector<[8]xi16>, %arg1: index):
    %0 = "arm_sme.get_tile"() : () -> vector<[8]x[8]xi16>
    %1 = "vector.insert"(%arg0, %0, %arg1) <{static_position = array<i64: -9223372036854775808>}> : (vector<[8]xi16>, vector<[8]x[8]xi16>, index) -> vector<[8]x[8]xi16>
    "func.return"(%1) : (vector<[8]x[8]xi16>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<[2]xi64>, index) -> vector<[2]x[2]xi64>, sym_name = "vector_insert_slice_i64"}> ({
  ^bb0(%arg0: vector<[2]xi64>, %arg1: index):
    %0 = "arm_sme.get_tile"() : () -> vector<[2]x[2]xi64>
    %1 = "vector.insert"(%arg0, %0, %arg1) <{static_position = array<i64: -9223372036854775808>}> : (vector<[2]xi64>, vector<[2]x[2]xi64>, index) -> vector<[2]x[2]xi64>
    "func.return"(%1) : (vector<[2]x[2]xi64>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<[1]xi128>, index) -> vector<[1]x[1]xi128>, sym_name = "vector_insert_slice_i128"}> ({
  ^bb0(%arg0: vector<[1]xi128>, %arg1: index):
    %0 = "arm_sme.get_tile"() : () -> vector<[1]x[1]xi128>
    %1 = "vector.insert"(%arg0, %0, %arg1) <{static_position = array<i64: -9223372036854775808>}> : (vector<[1]xi128>, vector<[1]x[1]xi128>, index) -> vector<[1]x[1]xi128>
    "func.return"(%1) : (vector<[1]x[1]xi128>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<[8]xf16>, index) -> vector<[8]x[8]xf16>, sym_name = "vector_insert_slice_f16"}> ({
  ^bb0(%arg0: vector<[8]xf16>, %arg1: index):
    %0 = "arm_sme.get_tile"() : () -> vector<[8]x[8]xf16>
    %1 = "vector.insert"(%arg0, %0, %arg1) <{static_position = array<i64: -9223372036854775808>}> : (vector<[8]xf16>, vector<[8]x[8]xf16>, index) -> vector<[8]x[8]xf16>
    "func.return"(%1) : (vector<[8]x[8]xf16>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<[8]xbf16>, index) -> vector<[8]x[8]xbf16>, sym_name = "vector_insert_slice_bf16"}> ({
  ^bb0(%arg0: vector<[8]xbf16>, %arg1: index):
    %0 = "arm_sme.get_tile"() : () -> vector<[8]x[8]xbf16>
    %1 = "vector.insert"(%arg0, %0, %arg1) <{static_position = array<i64: -9223372036854775808>}> : (vector<[8]xbf16>, vector<[8]x[8]xbf16>, index) -> vector<[8]x[8]xbf16>
    "func.return"(%1) : (vector<[8]x[8]xbf16>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<[4]xf32>, index) -> vector<[4]x[4]xf32>, sym_name = "vector_insert_slice_f32"}> ({
  ^bb0(%arg0: vector<[4]xf32>, %arg1: index):
    %0 = "arm_sme.get_tile"() : () -> vector<[4]x[4]xf32>
    %1 = "vector.insert"(%arg0, %0, %arg1) <{static_position = array<i64: -9223372036854775808>}> : (vector<[4]xf32>, vector<[4]x[4]xf32>, index) -> vector<[4]x[4]xf32>
    "func.return"(%1) : (vector<[4]x[4]xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<[2]xf64>, index) -> vector<[2]x[2]xf64>, sym_name = "vector_insert_slice_f64"}> ({
  ^bb0(%arg0: vector<[2]xf64>, %arg1: index):
    %0 = "arm_sme.get_tile"() : () -> vector<[2]x[2]xf64>
    %1 = "vector.insert"(%arg0, %0, %arg1) <{static_position = array<i64: -9223372036854775808>}> : (vector<[2]xf64>, vector<[2]x[2]xf64>, index) -> vector<[2]x[2]xf64>
    "func.return"(%1) : (vector<[2]x[2]xf64>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (i32, index, index) -> vector<[4]x[4]xi32>, sym_name = "vector_insert_element_i32"}> ({
  ^bb0(%arg0: i32, %arg1: index, %arg2: index):
    %0 = "arm_sme.get_tile"() : () -> vector<[4]x[4]xi32>
    %1 = "vector.insert"(%arg0, %0, %arg1, %arg2) <{static_position = array<i64: -9223372036854775808, -9223372036854775808>}> : (i32, vector<[4]x[4]xi32>, index, index) -> vector<[4]x[4]xi32>
    "func.return"(%1) : (vector<[4]x[4]xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (i8, index, index) -> vector<[16]x[16]xi8>, sym_name = "vector_insert_element_i8"}> ({
  ^bb0(%arg0: i8, %arg1: index, %arg2: index):
    %0 = "arm_sme.get_tile"() : () -> vector<[16]x[16]xi8>
    %1 = "vector.insert"(%arg0, %0, %arg1, %arg2) <{static_position = array<i64: -9223372036854775808, -9223372036854775808>}> : (i8, vector<[16]x[16]xi8>, index, index) -> vector<[16]x[16]xi8>
    "func.return"(%1) : (vector<[16]x[16]xi8>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (i16, index, index) -> vector<[8]x[8]xi16>, sym_name = "vector_insert_element_i16"}> ({
  ^bb0(%arg0: i16, %arg1: index, %arg2: index):
    %0 = "arm_sme.get_tile"() : () -> vector<[8]x[8]xi16>
    %1 = "vector.insert"(%arg0, %0, %arg1, %arg2) <{static_position = array<i64: -9223372036854775808, -9223372036854775808>}> : (i16, vector<[8]x[8]xi16>, index, index) -> vector<[8]x[8]xi16>
    "func.return"(%1) : (vector<[8]x[8]xi16>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (i64, index, index) -> vector<[2]x[2]xi64>, sym_name = "vector_insert_element_i64"}> ({
  ^bb0(%arg0: i64, %arg1: index, %arg2: index):
    %0 = "arm_sme.get_tile"() : () -> vector<[2]x[2]xi64>
    %1 = "vector.insert"(%arg0, %0, %arg1, %arg2) <{static_position = array<i64: -9223372036854775808, -9223372036854775808>}> : (i64, vector<[2]x[2]xi64>, index, index) -> vector<[2]x[2]xi64>
    "func.return"(%1) : (vector<[2]x[2]xi64>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (i128, index, index) -> vector<[1]x[1]xi128>, sym_name = "vector_insert_element_i128"}> ({
  ^bb0(%arg0: i128, %arg1: index, %arg2: index):
    %0 = "arm_sme.get_tile"() : () -> vector<[1]x[1]xi128>
    %1 = "vector.insert"(%arg0, %0, %arg1, %arg2) <{static_position = array<i64: -9223372036854775808, -9223372036854775808>}> : (i128, vector<[1]x[1]xi128>, index, index) -> vector<[1]x[1]xi128>
    "func.return"(%1) : (vector<[1]x[1]xi128>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (f16, index, index) -> vector<[8]x[8]xf16>, sym_name = "vector_insert_element_f16"}> ({
  ^bb0(%arg0: f16, %arg1: index, %arg2: index):
    %0 = "arm_sme.get_tile"() : () -> vector<[8]x[8]xf16>
    %1 = "vector.insert"(%arg0, %0, %arg1, %arg2) <{static_position = array<i64: -9223372036854775808, -9223372036854775808>}> : (f16, vector<[8]x[8]xf16>, index, index) -> vector<[8]x[8]xf16>
    "func.return"(%1) : (vector<[8]x[8]xf16>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (bf16, index, index) -> vector<[8]x[8]xbf16>, sym_name = "vector_insert_element_bf16"}> ({
  ^bb0(%arg0: bf16, %arg1: index, %arg2: index):
    %0 = "arm_sme.get_tile"() : () -> vector<[8]x[8]xbf16>
    %1 = "vector.insert"(%arg0, %0, %arg1, %arg2) <{static_position = array<i64: -9223372036854775808, -9223372036854775808>}> : (bf16, vector<[8]x[8]xbf16>, index, index) -> vector<[8]x[8]xbf16>
    "func.return"(%1) : (vector<[8]x[8]xbf16>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (f32, index, index) -> vector<[4]x[4]xf32>, sym_name = "vector_insert_element_f32"}> ({
  ^bb0(%arg0: f32, %arg1: index, %arg2: index):
    %0 = "arm_sme.get_tile"() : () -> vector<[4]x[4]xf32>
    %1 = "vector.insert"(%arg0, %0, %arg1, %arg2) <{static_position = array<i64: -9223372036854775808, -9223372036854775808>}> : (f32, vector<[4]x[4]xf32>, index, index) -> vector<[4]x[4]xf32>
    "func.return"(%1) : (vector<[4]x[4]xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (f64, index, index) -> vector<[2]x[2]xf64>, sym_name = "vector_insert_element_f64"}> ({
  ^bb0(%arg0: f64, %arg1: index, %arg2: index):
    %0 = "arm_sme.get_tile"() : () -> vector<[2]x[2]xf64>
    %1 = "vector.insert"(%arg0, %0, %arg1, %arg2) <{static_position = array<i64: -9223372036854775808, -9223372036854775808>}> : (f64, vector<[2]x[2]xf64>, index, index) -> vector<[2]x[2]xf64>
    "func.return"(%1) : (vector<[2]x[2]xf64>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index) -> vector<[4]xi32>, sym_name = "vector_extract_slice_i32"}> ({
  ^bb0(%arg0: index):
    %0 = "arm_sme.get_tile"() : () -> vector<[4]x[4]xi32>
    %1 = "vector.extract"(%0, %arg0) <{static_position = array<i64: -9223372036854775808>}> : (vector<[4]x[4]xi32>, index) -> vector<[4]xi32>
    "func.return"(%1) : (vector<[4]xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index) -> vector<[16]xi8>, sym_name = "vector_extract_slice_i8"}> ({
  ^bb0(%arg0: index):
    %0 = "arm_sme.get_tile"() : () -> vector<[16]x[16]xi8>
    %1 = "vector.extract"(%0, %arg0) <{static_position = array<i64: -9223372036854775808>}> : (vector<[16]x[16]xi8>, index) -> vector<[16]xi8>
    "func.return"(%1) : (vector<[16]xi8>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index) -> vector<[8]xi16>, sym_name = "vector_extract_slice_i16"}> ({
  ^bb0(%arg0: index):
    %0 = "arm_sme.get_tile"() : () -> vector<[8]x[8]xi16>
    %1 = "vector.extract"(%0, %arg0) <{static_position = array<i64: -9223372036854775808>}> : (vector<[8]x[8]xi16>, index) -> vector<[8]xi16>
    "func.return"(%1) : (vector<[8]xi16>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index) -> vector<[2]xi64>, sym_name = "vector_extract_slice_i64"}> ({
  ^bb0(%arg0: index):
    %0 = "arm_sme.get_tile"() : () -> vector<[2]x[2]xi64>
    %1 = "vector.extract"(%0, %arg0) <{static_position = array<i64: -9223372036854775808>}> : (vector<[2]x[2]xi64>, index) -> vector<[2]xi64>
    "func.return"(%1) : (vector<[2]xi64>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index) -> vector<[1]xi128>, sym_name = "vector_extract_slice_i128"}> ({
  ^bb0(%arg0: index):
    %0 = "arm_sme.get_tile"() : () -> vector<[1]x[1]xi128>
    %1 = "vector.extract"(%0, %arg0) <{static_position = array<i64: -9223372036854775808>}> : (vector<[1]x[1]xi128>, index) -> vector<[1]xi128>
    "func.return"(%1) : (vector<[1]xi128>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index) -> vector<[8]xf16>, sym_name = "vector_extract_slice_f16"}> ({
  ^bb0(%arg0: index):
    %0 = "arm_sme.get_tile"() : () -> vector<[8]x[8]xf16>
    %1 = "vector.extract"(%0, %arg0) <{static_position = array<i64: -9223372036854775808>}> : (vector<[8]x[8]xf16>, index) -> vector<[8]xf16>
    "func.return"(%1) : (vector<[8]xf16>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index) -> vector<[8]xbf16>, sym_name = "vector_extract_slice_bf16"}> ({
  ^bb0(%arg0: index):
    %0 = "arm_sme.get_tile"() : () -> vector<[8]x[8]xbf16>
    %1 = "vector.extract"(%0, %arg0) <{static_position = array<i64: -9223372036854775808>}> : (vector<[8]x[8]xbf16>, index) -> vector<[8]xbf16>
    "func.return"(%1) : (vector<[8]xbf16>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index) -> vector<[4]xf32>, sym_name = "vector_extract_slice_f32"}> ({
  ^bb0(%arg0: index):
    %0 = "arm_sme.get_tile"() : () -> vector<[4]x[4]xf32>
    %1 = "vector.extract"(%0, %arg0) <{static_position = array<i64: -9223372036854775808>}> : (vector<[4]x[4]xf32>, index) -> vector<[4]xf32>
    "func.return"(%1) : (vector<[4]xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index) -> vector<[2]xf64>, sym_name = "vector_extract_slice_f64"}> ({
  ^bb0(%arg0: index):
    %0 = "arm_sme.get_tile"() : () -> vector<[2]x[2]xf64>
    %1 = "vector.extract"(%0, %arg0) <{static_position = array<i64: -9223372036854775808>}> : (vector<[2]x[2]xf64>, index) -> vector<[2]xf64>
    "func.return"(%1) : (vector<[2]xf64>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index, index) -> i32, sym_name = "vector_extract_element"}> ({
  ^bb0(%arg0: index, %arg1: index):
    %0 = "arm_sme.get_tile"() : () -> vector<[4]x[4]xi32>
    %1 = "vector.extract"(%0, %arg0, %arg1) <{static_position = array<i64: -9223372036854775808, -9223372036854775808>}> : (vector<[4]x[4]xi32>, index, index) -> i32
    "func.return"(%1) : (i32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index, index) -> i8, sym_name = "vector_extract_element_i8"}> ({
  ^bb0(%arg0: index, %arg1: index):
    %0 = "arm_sme.get_tile"() : () -> vector<[16]x[16]xi8>
    %1 = "vector.extract"(%0, %arg0, %arg1) <{static_position = array<i64: -9223372036854775808, -9223372036854775808>}> : (vector<[16]x[16]xi8>, index, index) -> i8
    "func.return"(%1) : (i8) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index, index) -> i16, sym_name = "vector_extract_element_i16"}> ({
  ^bb0(%arg0: index, %arg1: index):
    %0 = "arm_sme.get_tile"() : () -> vector<[8]x[8]xi16>
    %1 = "vector.extract"(%0, %arg0, %arg1) <{static_position = array<i64: -9223372036854775808, -9223372036854775808>}> : (vector<[8]x[8]xi16>, index, index) -> i16
    "func.return"(%1) : (i16) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index, index) -> i64, sym_name = "vector_extract_element_i64"}> ({
  ^bb0(%arg0: index, %arg1: index):
    %0 = "arm_sme.get_tile"() : () -> vector<[2]x[2]xi64>
    %1 = "vector.extract"(%0, %arg0, %arg1) <{static_position = array<i64: -9223372036854775808, -9223372036854775808>}> : (vector<[2]x[2]xi64>, index, index) -> i64
    "func.return"(%1) : (i64) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index, index) -> i128, sym_name = "vector_extract_element_i128"}> ({
  ^bb0(%arg0: index, %arg1: index):
    %0 = "arm_sme.get_tile"() : () -> vector<[1]x[1]xi128>
    %1 = "vector.extract"(%0, %arg0, %arg1) <{static_position = array<i64: -9223372036854775808, -9223372036854775808>}> : (vector<[1]x[1]xi128>, index, index) -> i128
    "func.return"(%1) : (i128) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index, index) -> f16, sym_name = "vector_extract_element_f16"}> ({
  ^bb0(%arg0: index, %arg1: index):
    %0 = "arm_sme.get_tile"() : () -> vector<[8]x[8]xf16>
    %1 = "vector.extract"(%0, %arg0, %arg1) <{static_position = array<i64: -9223372036854775808, -9223372036854775808>}> : (vector<[8]x[8]xf16>, index, index) -> f16
    "func.return"(%1) : (f16) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index, index) -> bf16, sym_name = "vector_extract_element_bf16"}> ({
  ^bb0(%arg0: index, %arg1: index):
    %0 = "arm_sme.get_tile"() : () -> vector<[8]x[8]xbf16>
    %1 = "vector.extract"(%0, %arg0, %arg1) <{static_position = array<i64: -9223372036854775808, -9223372036854775808>}> : (vector<[8]x[8]xbf16>, index, index) -> bf16
    "func.return"(%1) : (bf16) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index, index) -> f32, sym_name = "vector_extract_element_f32"}> ({
  ^bb0(%arg0: index, %arg1: index):
    %0 = "arm_sme.get_tile"() : () -> vector<[4]x[4]xf32>
    %1 = "vector.extract"(%0, %arg0, %arg1) <{static_position = array<i64: -9223372036854775808, -9223372036854775808>}> : (vector<[4]x[4]xf32>, index, index) -> f32
    "func.return"(%1) : (f32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index, index) -> f64, sym_name = "vector_extract_element_f64"}> ({
  ^bb0(%arg0: index, %arg1: index):
    %0 = "arm_sme.get_tile"() : () -> vector<[2]x[2]xf64>
    %1 = "vector.extract"(%0, %arg0, %arg1) <{static_position = array<i64: -9223372036854775808, -9223372036854775808>}> : (vector<[2]x[2]xf64>, index, index) -> f64
    "func.return"(%1) : (f64) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index, index, index) -> vector<[8]xi1>, sym_name = "dynamic_vector_extract_mask_to_psel"}> ({
  ^bb0(%arg0: index, %arg1: index, %arg2: index):
    %0 = "vector.create_mask"(%arg0, %arg1) : (index, index) -> vector<[4]x[8]xi1>
    %1 = "vector.extract"(%0, %arg2) <{static_position = array<i64: -9223372036854775808>}> : (vector<[4]x[8]xi1>, index) -> vector<[8]xi1>
    "func.return"(%1) : (vector<[8]xi1>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index, index) -> vector<[2]xi1>, sym_name = "vector_extract_mask_to_psel"}> ({
  ^bb0(%arg0: index, %arg1: index):
    %0 = "vector.create_mask"(%arg0, %arg1) : (index, index) -> vector<[16]x[2]xi1>
    %1 = "vector.extract"(%0) <{static_position = array<i64: 1>}> : (vector<[16]x[2]xi1>) -> vector<[2]xi1>
    "func.return"(%1) : (vector<[2]xi1>) -> ()
  }) : () -> ()
}) : () -> ()

