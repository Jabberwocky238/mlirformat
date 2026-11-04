#map = affine_map<(d0, d1) -> (d0, d1)>
#map1 = affine_map<(d0, d1, d2) -> (d0, d2)>
#map2 = affine_map<(d0, d1, d2) -> (d1, d2)>
#map3 = affine_map<(d0, d1, d2) -> (d0, d1)>
#map4 = affine_map<(d0) -> (d0)>
#map5 = affine_map<(d0, d1) -> (d1)>
#map6 = affine_map<(d0, d1) -> (d0)>
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "matrix_by_matrix_mul_and_acc"}> ({
    %13 = "arith.constant"() <{value = 0 : index}> : () -> index
    %14 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %15 = "arith.constant"() <{value = 0.000000e+00 : bf16}> : () -> bf16
    %16 = "arith.constant"() <{value = dense<[[0.699999988, 1.000000e+00, -1.000000e-01, 1.800000e+00], [-5.000000e-01, 0.899999976, 0.699999988, -0.699999988], [5.000000e-01, -1.300000e+00, -2.200000e+00, 1.000000e-01], [-0.699999988, 1.000000e+00, 1.700000e+00, -1.000000e+00]]> : vector<4x4xf32>}> : () -> vector<4x4xf32>
    %17 = "memref.alloca"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<4x4xf32>
    "vector.transfer_write"(%16, %17, %13, %13) <{in_bounds = [true, true], operandSegmentSizes = array<i32: 1, 1, 2, 0>, permutation_map = #map}> : (vector<4x4xf32>, memref<4x4xf32>, index, index) -> ()
    %18 = "vector.transfer_read"(%17, %13, %13, %14) <{in_bounds = [true, true], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = #map}> : (memref<4x4xf32>, index, index, f32) -> vector<4x4xf32>
    %19 = "arith.constant"() <{value = dense<[[1.000980e-01, 6.992180e-01, -8.984370e-01, 1.296880e+00], [-1.601560e+00, 6.992180e-01, -3.007810e-01, -3.007810e-01], [-4.003910e-01, 6.015630e-01, 8.007810e-01, -5.000000e-01], [-6.015630e-01, -1.000000e+00, -1.000000e+00, -1.000000e+00]]> : vector<4x4xbf16>}> : () -> vector<4x4xbf16>
    %20 = "memref.alloca"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<4x4xbf16>
    "vector.transfer_write"(%19, %20, %13, %13) <{in_bounds = [true, true], operandSegmentSizes = array<i32: 1, 1, 2, 0>, permutation_map = #map}> : (vector<4x4xbf16>, memref<4x4xbf16>, index, index) -> ()
    %21 = "vector.transfer_read"(%20, %13, %13, %15) <{in_bounds = [true, true], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = #map}> : (memref<4x4xbf16>, index, index, bf16) -> vector<4x4xbf16>
    %22 = "arith.constant"() <{value = dense<[[6.015630e-01, 1.296880e+00, 1.000980e-01, -8.984370e-01], [5.000000e-01, 1.601560e+00, 1.796880e+00, 1.601560e+00], [-2.001950e-01, 4.003910e-01, 1.000000e+00, 4.003910e-01], [-1.296880e+00, -2.001950e-01, -2.203130e+00, 3.007810e-01]]> : vector<4x4xbf16>}> : () -> vector<4x4xbf16>
    %23 = "memref.alloca"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<4x4xbf16>
    "vector.transfer_write"(%22, %23, %13, %13) <{in_bounds = [true, true], operandSegmentSizes = array<i32: 1, 1, 2, 0>, permutation_map = #map}> : (vector<4x4xbf16>, memref<4x4xbf16>, index, index) -> ()
    %24 = "vector.transfer_read"(%23, %13, %13, %15) <{in_bounds = [true, true], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = #map}> : (memref<4x4xbf16>, index, index, bf16) -> vector<4x4xbf16>
    %25 = "vector.contract"(%21, %24, %18) <{indexing_maps = [#map1, #map2, #map3], iterator_types = [#vector.iterator_type<parallel>, #vector.iterator_type<parallel>, #vector.iterator_type<reduction>], kind = #vector.kind<add>}> : (vector<4x4xbf16>, vector<4x4xbf16>, vector<4x4xf32>) -> vector<4x4xf32>
    "vector.print"() <{punctuation = #vector.punctuation<newline>, stringLiteral = "Result(BFMMLA):\0A"}> : () -> ()
    %26 = "vector.extract"(%25) <{static_position = array<i64: 0>}> : (vector<4x4xf32>) -> vector<4xf32>
    %27 = "vector.extract"(%25) <{static_position = array<i64: 1>}> : (vector<4x4xf32>) -> vector<4xf32>
    %28 = "vector.extract"(%25) <{static_position = array<i64: 2>}> : (vector<4x4xf32>) -> vector<4xf32>
    %29 = "vector.extract"(%25) <{static_position = array<i64: 3>}> : (vector<4x4xf32>) -> vector<4xf32>
    "vector.print"(%26) <{punctuation = #vector.punctuation<newline>}> : (vector<4xf32>) -> ()
    "vector.print"(%27) <{punctuation = #vector.punctuation<newline>}> : (vector<4xf32>) -> ()
    "vector.print"(%28) <{punctuation = #vector.punctuation<newline>}> : (vector<4xf32>) -> ()
    "vector.print"(%29) <{punctuation = #vector.punctuation<newline>}> : (vector<4xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "vector_by_matrix_mul_and_acc"}> ({
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %2 = "arith.constant"() <{value = 0.000000e+00 : bf16}> : () -> bf16
    %3 = "arith.constant"() <{value = dense<[0.699999988, 1.000000e+00, -1.000000e-01, 1.800000e+00]> : vector<4xf32>}> : () -> vector<4xf32>
    %4 = "memref.alloca"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<4xf32>
    "vector.transfer_write"(%3, %4, %0) <{in_bounds = [true], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = #map4}> : (vector<4xf32>, memref<4xf32>, index) -> ()
    %5 = "vector.transfer_read"(%4, %0, %1) <{in_bounds = [true], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = #map4}> : (memref<4xf32>, index, f32) -> vector<4xf32>
    %6 = "arith.constant"() <{value = dense<[1.000980e-01, 6.992180e-01, -8.984370e-01, 1.296880e+00]> : vector<4xbf16>}> : () -> vector<4xbf16>
    %7 = "memref.alloca"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<4xbf16>
    "vector.transfer_write"(%6, %7, %0) <{in_bounds = [true], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = #map4}> : (vector<4xbf16>, memref<4xbf16>, index) -> ()
    %8 = "vector.transfer_read"(%7, %0, %2) <{in_bounds = [true], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = #map4}> : (memref<4xbf16>, index, bf16) -> vector<4xbf16>
    %9 = "arith.constant"() <{value = dense<[[6.015630e-01, 1.296880e+00, 1.000980e-01, -8.984370e-01], [5.000000e-01, 1.601560e+00, 1.796880e+00, 1.601560e+00], [-2.001950e-01, 4.003910e-01, 1.000000e+00, 4.003910e-01], [-1.296880e+00, -2.001950e-01, -2.203130e+00, 3.007810e-01]]> : vector<4x4xbf16>}> : () -> vector<4x4xbf16>
    %10 = "memref.alloca"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<4x4xbf16>
    "vector.transfer_write"(%9, %10, %0, %0) <{in_bounds = [true, true], operandSegmentSizes = array<i32: 1, 1, 2, 0>, permutation_map = #map}> : (vector<4x4xbf16>, memref<4x4xbf16>, index, index) -> ()
    %11 = "vector.transfer_read"(%10, %0, %0, %2) <{in_bounds = [true, true], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = #map}> : (memref<4x4xbf16>, index, index, bf16) -> vector<4x4xbf16>
    %12 = "vector.contract"(%8, %11, %5) <{indexing_maps = [#map5, #map, #map6], iterator_types = [#vector.iterator_type<parallel>, #vector.iterator_type<reduction>], kind = #vector.kind<add>}> : (vector<4xbf16>, vector<4x4xbf16>, vector<4xf32>) -> vector<4xf32>
    "vector.print"() <{punctuation = #vector.punctuation<newline>, stringLiteral = "Result(BFMMLA, vecmat):\0A"}> : () -> ()
    "vector.print"(%12) <{punctuation = #vector.punctuation<newline>}> : (vector<4xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    "func.call"() <{callee = @matrix_by_matrix_mul_and_acc}> : () -> ()
    "func.call"() <{callee = @vector_by_matrix_mul_and_acc}> : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

