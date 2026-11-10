#map = affine_map<(d0, d1, d2, d3) -> (d2, d3)>
#map1 = affine_map<(d0, d1, d2, d3, d4) -> (d2, d3, d4)>
#map2 = affine_map<(d0, d1) -> (d0, d1)>
#map3 = affine_map<(d0, d1, d2, d3, d4, d5) -> (d0, d1, d2, d3, d4, d5)>
#map4 = affine_map<(d0, d1, d2, d3, d4, d5) -> (d1, d2, d3, d4, d5)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<1x1x3x2xi8, strided<[6, 6, 2, 1], offset: ?>>) -> vector<3x2xi8>, sym_name = "transfer_read_rank_reducing"}> ({
  ^bb0(%arg52: memref<1x1x3x2xi8, strided<[6, 6, 2, 1], offset: ?>>):
    %73 = "arith.constant"() <{value = 0 : index}> : () -> index
    %74 = "arith.constant"() <{value = 0 : i8}> : () -> i8
    %75 = "vector.transfer_read"(%arg52, %73, %73, %73, %73, %74) <{in_bounds = [false, false], operandSegmentSizes = array<i32: 1, 4, 1, 0>, permutation_map = #map}> : (memref<1x1x3x2xi8, strided<[6, 6, 2, 1], offset: ?>>, index, index, index, index, i8) -> vector<3x2xi8>
    "func.return"(%75) : (vector<3x2xi8>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<1x1x3x2xi8, strided<[6, 6, 2, 1], offset: ?>>, vector<3x2xi1>) -> vector<3x2xi8>, sym_name = "transfer_read_rank_reducing_masked"}> ({
  ^bb0(%arg50: memref<1x1x3x2xi8, strided<[6, 6, 2, 1], offset: ?>>, %arg51: vector<3x2xi1>):
    %69 = "arith.constant"() <{value = 0 : index}> : () -> index
    %70 = "arith.constant"() <{value = 0 : i8}> : () -> i8
    %71 = "vector.mask"(%arg51) ({
      %72 = "vector.transfer_read"(%arg50, %69, %69, %69, %69, %70) <{in_bounds = [false, false], operandSegmentSizes = array<i32: 1, 4, 1, 0>, permutation_map = #map}> : (memref<1x1x3x2xi8, strided<[6, 6, 2, 1], offset: ?>>, index, index, index, index, i8) -> vector<3x2xi8>
      "vector.yield"(%72) : (vector<3x2xi8>) -> ()
    }) : (vector<3x2xi1>) -> vector<3x2xi8>
    "func.return"(%71) : (vector<3x2xi8>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<1x1x3x2xi8, strided<[6, 6, 2, 1], offset: ?>>, vector<3x2xi8>) -> (), sym_name = "transfer_write_rank_reducing"}> ({
  ^bb0(%arg48: memref<1x1x3x2xi8, strided<[6, 6, 2, 1], offset: ?>>, %arg49: vector<3x2xi8>):
    %68 = "arith.constant"() <{value = 0 : index}> : () -> index
    "vector.transfer_write"(%arg49, %arg48, %68, %68, %68, %68) <{in_bounds = [false, false], operandSegmentSizes = array<i32: 1, 1, 4, 0>, permutation_map = #map}> : (vector<3x2xi8>, memref<1x1x3x2xi8, strided<[6, 6, 2, 1], offset: ?>>, index, index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<1x1x3x2xi8, strided<[6, 6, 2, 1], offset: ?>>, vector<3x2xi8>, vector<3x2xi1>) -> (), sym_name = "transfer_write_rank_reducing_masked"}> ({
  ^bb0(%arg45: memref<1x1x3x2xi8, strided<[6, 6, 2, 1], offset: ?>>, %arg46: vector<3x2xi8>, %arg47: vector<3x2xi1>):
    %67 = "arith.constant"() <{value = 0 : index}> : () -> index
    "vector.mask"(%arg47) ({
      "vector.transfer_write"(%arg46, %arg45, %67, %67, %67, %67) <{in_bounds = [false, false], operandSegmentSizes = array<i32: 1, 1, 4, 0>, permutation_map = #map}> : (vector<3x2xi8>, memref<1x1x3x2xi8, strided<[6, 6, 2, 1], offset: ?>>, index, index, index, index) -> ()
      "vector.yield"() : () -> ()
    }) : (vector<3x2xi1>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<1x1x3x2x1xf32>) -> vector<3x2x1xf32>, sym_name = "transfer_read_and_vector_rank_reducing"}> ({
  ^bb0(%arg44: memref<1x1x3x2x1xf32>):
    %64 = "arith.constant"() <{value = 0 : index}> : () -> index
    %65 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %66 = "vector.transfer_read"(%arg44, %64, %64, %64, %64, %64, %65) <{in_bounds = [false, false, false], operandSegmentSizes = array<i32: 1, 5, 1, 0>, permutation_map = #map1}> : (memref<1x1x3x2x1xf32>, index, index, index, index, index, f32) -> vector<3x2x1xf32>
    "func.return"(%66) : (vector<3x2x1xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<1x1x3x2x1xf32>, vector<3x2x1xf32>) -> (), sym_name = "transfer_write_and_vector_rank_reducing"}> ({
  ^bb0(%arg42: memref<1x1x3x2x1xf32>, %arg43: vector<3x2x1xf32>):
    %63 = "arith.constant"() <{value = 0 : index}> : () -> index
    "vector.transfer_write"(%arg43, %arg42, %63, %63, %63, %63, %63) <{in_bounds = [false, false, false], operandSegmentSizes = array<i32: 1, 1, 5, 0>, permutation_map = #map1}> : (vector<3x2x1xf32>, memref<1x1x3x2x1xf32>, index, index, index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<1x1x1x1x1xf32>) -> vector<1x1x1xf32>, sym_name = "transfer_read_and_vector_rank_reducing_to_0d"}> ({
  ^bb0(%arg41: memref<1x1x1x1x1xf32>):
    %60 = "arith.constant"() <{value = 0 : index}> : () -> index
    %61 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %62 = "vector.transfer_read"(%arg41, %60, %60, %60, %60, %60, %61) <{in_bounds = [false, false, false], operandSegmentSizes = array<i32: 1, 5, 1, 0>, permutation_map = #map1}> : (memref<1x1x1x1x1xf32>, index, index, index, index, index, f32) -> vector<1x1x1xf32>
    "func.return"(%62) : (vector<1x1x1xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<1x1x1x1x1xf32>, vector<1x1x1xi1>) -> vector<1x1x1xf32>, sym_name = "transfer_read_and_vector_rank_reducing_to_0d_masked"}> ({
  ^bb0(%arg39: memref<1x1x1x1x1xf32>, %arg40: vector<1x1x1xi1>):
    %56 = "arith.constant"() <{value = 0 : index}> : () -> index
    %57 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %58 = "vector.mask"(%arg40) ({
      %59 = "vector.transfer_read"(%arg39, %56, %56, %56, %56, %56, %57) <{in_bounds = [false, false, false], operandSegmentSizes = array<i32: 1, 5, 1, 0>, permutation_map = #map1}> : (memref<1x1x1x1x1xf32>, index, index, index, index, index, f32) -> vector<1x1x1xf32>
      "vector.yield"(%59) : (vector<1x1x1xf32>) -> ()
    }) : (vector<1x1x1xi1>) -> vector<1x1x1xf32>
    "func.return"(%58) : (vector<1x1x1xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<1x1x1x1x1xf32>, vector<1x1x1xf32>) -> (), sym_name = "transfer_write_and_vector_rank_reducing_to_0d"}> ({
  ^bb0(%arg37: memref<1x1x1x1x1xf32>, %arg38: vector<1x1x1xf32>):
    %55 = "arith.constant"() <{value = 0 : index}> : () -> index
    "vector.transfer_write"(%arg38, %arg37, %55, %55, %55, %55, %55) <{in_bounds = [false, false, false], operandSegmentSizes = array<i32: 1, 1, 5, 0>, permutation_map = #map1}> : (vector<1x1x1xf32>, memref<1x1x1x1x1xf32>, index, index, index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<1x1x1x1x1xf32>, vector<1x1x1xf32>, vector<1x1x1xi1>) -> (), sym_name = "transfer_write_and_vector_rank_reducing_to_0d_masked"}> ({
  ^bb0(%arg34: memref<1x1x1x1x1xf32>, %arg35: vector<1x1x1xf32>, %arg36: vector<1x1x1xi1>):
    %53 = "arith.constant"() <{value = 0 : index}> : () -> index
    %54 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    "vector.mask"(%arg36) ({
      "vector.transfer_write"(%arg35, %arg34, %53, %53, %53, %53, %53) <{in_bounds = [false, false, false], operandSegmentSizes = array<i32: 1, 1, 5, 0>, permutation_map = #map1}> : (vector<1x1x1xf32>, memref<1x1x1x1x1xf32>, index, index, index, index, index) -> ()
      "vector.yield"() : () -> ()
    }) : (vector<1x1x1xi1>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<?x1xi8, strided<[?, ?], offset: ?>>) -> vector<[16]x1xi8>, sym_name = "transfer_read_dynamic_rank_reducing"}> ({
  ^bb0(%arg33: memref<?x1xi8, strided<[?, ?], offset: ?>>):
    %50 = "arith.constant"() <{value = 0 : index}> : () -> index
    %51 = "arith.constant"() <{value = 0 : i8}> : () -> i8
    %52 = "vector.transfer_read"(%arg33, %50, %50, %51) <{in_bounds = [true, true], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = #map2}> : (memref<?x1xi8, strided<[?, ?], offset: ?>>, index, index, i8) -> vector<[16]x1xi8>
    "func.return"(%52) : (vector<[16]x1xi8>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<?x1xi8, strided<[?, ?], offset: ?>>, index) -> vector<[16]x1xi8>, sym_name = "transfer_read_with_mask_dynamic_rank_reducing_1_create_mask"}> ({
  ^bb0(%arg31: memref<?x1xi8, strided<[?, ?], offset: ?>>, %arg32: index):
    %45 = "arith.constant"() <{value = 0 : index}> : () -> index
    %46 = "arith.constant"() <{value = 1 : index}> : () -> index
    %47 = "arith.constant"() <{value = 0 : i8}> : () -> i8
    %48 = "vector.create_mask"(%arg32, %46) : (index, index) -> vector<[16]x1xi1>
    %49 = "vector.transfer_read"(%arg31, %45, %45, %47, %48) <{in_bounds = [true, true], operandSegmentSizes = array<i32: 1, 2, 1, 1>, permutation_map = #map2}> : (memref<?x1xi8, strided<[?, ?], offset: ?>>, index, index, i8, vector<[16]x1xi1>) -> vector<[16]x1xi8>
    "func.return"(%49) : (vector<[16]x1xi8>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<?x1xi8, strided<[?, ?], offset: ?>>) -> vector<[16]x1xi8>, sym_name = "transfer_read_with_mask_dynamic_rank_reducing_1_constant_mask"}> ({
  ^bb0(%arg30: memref<?x1xi8, strided<[?, ?], offset: ?>>):
    %41 = "arith.constant"() <{value = 0 : index}> : () -> index
    %42 = "arith.constant"() <{value = 0 : i8}> : () -> i8
    %43 = "vector.constant_mask"() <{mask_dim_sizes = array<i64: 16, 1>}> : () -> vector<[16]x1xi1>
    %44 = "vector.transfer_read"(%arg30, %41, %41, %42, %43) <{in_bounds = [true, true], operandSegmentSizes = array<i32: 1, 2, 1, 1>, permutation_map = #map2}> : (memref<?x1xi8, strided<[?, ?], offset: ?>>, index, index, i8, vector<[16]x1xi1>) -> vector<[16]x1xi8>
    "func.return"(%44) : (vector<[16]x1xi8>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<1x?x3x1x?x1xi8, strided<[?, ?, ?, ?, ?, ?], offset: ?>>, index, index) -> vector<1x[1]x3x1x[16]x1xi8>, sym_name = "transfer_read_with_mask_dynamic_rank_reducing_2_create_mask"}> ({
  ^bb0(%arg27: memref<1x?x3x1x?x1xi8, strided<[?, ?, ?, ?, ?, ?], offset: ?>>, %arg28: index, %arg29: index):
    %35 = "arith.constant"() <{value = 0 : index}> : () -> index
    %36 = "arith.constant"() <{value = 1 : index}> : () -> index
    %37 = "arith.constant"() <{value = 2 : index}> : () -> index
    %38 = "arith.constant"() <{value = 0 : i8}> : () -> i8
    %39 = "vector.create_mask"(%36, %arg28, %37, %36, %arg29, %36) : (index, index, index, index, index, index) -> vector<1x[1]x3x1x[16]x1xi1>
    %40 = "vector.transfer_read"(%arg27, %35, %35, %35, %35, %35, %35, %38, %39) <{in_bounds = [true, true, true, true, true, true], operandSegmentSizes = array<i32: 1, 6, 1, 1>, permutation_map = #map3}> : (memref<1x?x3x1x?x1xi8, strided<[?, ?, ?, ?, ?, ?], offset: ?>>, index, index, index, index, index, index, i8, vector<1x[1]x3x1x[16]x1xi1>) -> vector<1x[1]x3x1x[16]x1xi8>
    "func.return"(%40) : (vector<1x[1]x3x1x[16]x1xi8>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<1x?x3x1x?x1xi8, strided<[?, ?, ?, ?, ?, ?], offset: ?>>) -> vector<1x[1]x3x1x[16]x1xi8>, sym_name = "transfer_read_with_mask_dynamic_rank_reducing_2_constant_mask"}> ({
  ^bb0(%arg26: memref<1x?x3x1x?x1xi8, strided<[?, ?, ?, ?, ?, ?], offset: ?>>):
    %31 = "arith.constant"() <{value = 0 : index}> : () -> index
    %32 = "arith.constant"() <{value = 0 : i8}> : () -> i8
    %33 = "vector.constant_mask"() <{mask_dim_sizes = array<i64: 1, 1, 2, 1, 16, 1>}> : () -> vector<1x[1]x3x1x[16]x1xi1>
    %34 = "vector.transfer_read"(%arg26, %31, %31, %31, %31, %31, %31, %32, %33) <{in_bounds = [true, true, true, true, true, true], operandSegmentSizes = array<i32: 1, 6, 1, 1>, permutation_map = #map3}> : (memref<1x?x3x1x?x1xi8, strided<[?, ?, ?, ?, ?, ?], offset: ?>>, index, index, index, index, index, index, i8, vector<1x[1]x3x1x[16]x1xi1>) -> vector<1x[1]x3x1x[16]x1xi8>
    "func.return"(%34) : (vector<1x[1]x3x1x[16]x1xi8>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<1x1x3x1x16x1xf32>, vector<1x3x1x16x1xf32>, index, index) -> (), sym_name = "transfer_write_with_mask_and_vector_rank_reducing_create_mask"}> ({
  ^bb0(%arg22: memref<1x1x3x1x16x1xf32>, %arg23: vector<1x3x1x16x1xf32>, %arg24: index, %arg25: index):
    %28 = "arith.constant"() <{value = 0 : index}> : () -> index
    %29 = "arith.constant"() <{value = 1 : index}> : () -> index
    %30 = "vector.create_mask"(%29, %arg24, %29, %arg25, %29) : (index, index, index, index, index) -> vector<1x3x1x16x1xi1>
    "vector.transfer_write"(%arg23, %arg22, %28, %28, %28, %28, %28, %28, %30) <{in_bounds = [false, false, false, false, false], operandSegmentSizes = array<i32: 1, 1, 6, 1>, permutation_map = #map4}> : (vector<1x3x1x16x1xf32>, memref<1x1x3x1x16x1xf32>, index, index, index, index, index, index, vector<1x3x1x16x1xi1>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<1x1x3x1x16x1xf32>, vector<1x3x1x16x1xf32>) -> (), sym_name = "transfer_write_with_mask_and_vector_rank_reducing_constant_mask"}> ({
  ^bb0(%arg20: memref<1x1x3x1x16x1xf32>, %arg21: vector<1x3x1x16x1xf32>):
    %26 = "arith.constant"() <{value = 0 : index}> : () -> index
    %27 = "vector.constant_mask"() <{mask_dim_sizes = array<i64: 1, 2, 1, 8, 1>}> : () -> vector<1x3x1x16x1xi1>
    "vector.transfer_write"(%arg21, %arg20, %26, %26, %26, %26, %26, %26, %27) <{in_bounds = [false, false, false, false, false], operandSegmentSizes = array<i32: 1, 1, 6, 1>, permutation_map = #map4}> : (vector<1x3x1x16x1xf32>, memref<1x1x3x1x16x1xf32>, index, index, index, index, index, index, vector<1x3x1x16x1xi1>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<?x1xi8, strided<[?, ?], offset: ?>>, vector<[16]x1xi8>, index) -> (), sym_name = "transfer_write_with_mask_dynamic_rank_reducing_create_mask"}> ({
  ^bb0(%arg17: memref<?x1xi8, strided<[?, ?], offset: ?>>, %arg18: vector<[16]x1xi8>, %arg19: index):
    %22 = "arith.constant"() <{value = 0 : index}> : () -> index
    %23 = "arith.constant"() <{value = 1 : index}> : () -> index
    %24 = "arith.constant"() <{value = 0 : i8}> : () -> i8
    %25 = "vector.create_mask"(%arg19, %23) : (index, index) -> vector<[16]x1xi1>
    "vector.transfer_write"(%arg18, %arg17, %22, %22, %25) <{in_bounds = [true, true], operandSegmentSizes = array<i32: 1, 1, 2, 1>, permutation_map = #map2}> : (vector<[16]x1xi8>, memref<?x1xi8, strided<[?, ?], offset: ?>>, index, index, vector<[16]x1xi1>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<?x1xi8, strided<[?, ?], offset: ?>>, vector<[16]x1xi8>) -> (), sym_name = "transfer_write_with_mask_dynamic_rank_reducing_constant_mask"}> ({
  ^bb0(%arg15: memref<?x1xi8, strided<[?, ?], offset: ?>>, %arg16: vector<[16]x1xi8>):
    %20 = "arith.constant"() <{value = 0 : index}> : () -> index
    %21 = "vector.constant_mask"() <{mask_dim_sizes = array<i64: 16, 1>}> : () -> vector<[16]x1xi1>
    "vector.transfer_write"(%arg16, %arg15, %20, %20, %21) <{in_bounds = [true, true], operandSegmentSizes = array<i32: 1, 1, 2, 1>, permutation_map = #map2}> : (vector<[16]x1xi8>, memref<?x1xi8, strided<[?, ?], offset: ?>>, index, index, vector<[16]x1xi1>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<?x1xi8, strided<[?, ?], offset: ?>>, vector<[16]x1xi1>) -> vector<[16]x1xi8>, sym_name = "transfer_read_with_unsupported_mask_dynamic_rank_reducing_1"}> ({
  ^bb0(%arg13: memref<?x1xi8, strided<[?, ?], offset: ?>>, %arg14: vector<[16]x1xi1>):
    %17 = "arith.constant"() <{value = 0 : index}> : () -> index
    %18 = "arith.constant"() <{value = 0 : i8}> : () -> i8
    %19 = "vector.transfer_read"(%arg13, %17, %17, %18, %arg14) <{in_bounds = [true, true], operandSegmentSizes = array<i32: 1, 2, 1, 1>, permutation_map = #map2}> : (memref<?x1xi8, strided<[?, ?], offset: ?>>, index, index, i8, vector<[16]x1xi1>) -> vector<[16]x1xi8>
    "func.return"(%19) : (vector<[16]x1xi8>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<?x1xi8, strided<[?, ?], offset: ?>>, index, index) -> vector<[16]x1xi8>, sym_name = "transfer_read_with_unsupported_mask_dynamic_rank_reducing_2"}> ({
  ^bb0(%arg10: memref<?x1xi8, strided<[?, ?], offset: ?>>, %arg11: index, %arg12: index):
    %12 = "arith.constant"() <{value = 0 : index}> : () -> index
    %13 = "arith.constant"() <{value = 1 : index}> : () -> index
    %14 = "arith.constant"() <{value = 0 : i8}> : () -> i8
    %15 = "vector.create_mask"(%arg11, %arg12) : (index, index) -> vector<[16]x1xi1>
    %16 = "vector.transfer_read"(%arg10, %12, %12, %14, %15) <{in_bounds = [true, true], operandSegmentSizes = array<i32: 1, 2, 1, 1>, permutation_map = #map2}> : (memref<?x1xi8, strided<[?, ?], offset: ?>>, index, index, i8, vector<[16]x1xi1>) -> vector<[16]x1xi8>
    "func.return"(%16) : (vector<[16]x1xi8>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<?x1xi8, strided<[?, ?], offset: ?>>, index) -> vector<[16]x[1]xi8>, sym_name = "transfer_read_with_mask_dynamic_rank_reducing_scalable_unit_dim"}> ({
  ^bb0(%arg8: memref<?x1xi8, strided<[?, ?], offset: ?>>, %arg9: index):
    %7 = "arith.constant"() <{value = 0 : index}> : () -> index
    %8 = "arith.constant"() <{value = 1 : index}> : () -> index
    %9 = "arith.constant"() <{value = 0 : i8}> : () -> i8
    %10 = "vector.create_mask"(%arg9, %8) : (index, index) -> vector<[16]x[1]xi1>
    %11 = "vector.transfer_read"(%arg8, %7, %7, %9, %10) <{in_bounds = [true, true], operandSegmentSizes = array<i32: 1, 2, 1, 1>, permutation_map = #map2}> : (memref<?x1xi8, strided<[?, ?], offset: ?>>, index, index, i8, vector<[16]x[1]xi1>) -> vector<[16]x[1]xi8>
    "func.return"(%11) : (vector<[16]x[1]xi8>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<1x1x?x?xf32, strided<[?, ?, ?, ?], offset: ?>>, index, index) -> vector<[4]x[4]xf32>, sym_name = "transfer_read_with_mask_memref_only_unit_dims"}> ({
  ^bb0(%arg5: memref<1x1x?x?xf32, strided<[?, ?, ?, ?], offset: ?>>, %arg6: index, %arg7: index):
    %3 = "arith.constant"() <{value = 0 : index}> : () -> index
    %4 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %5 = "vector.create_mask"(%arg6, %arg7) : (index, index) -> vector<[4]x[4]xi1>
    %6 = "vector.transfer_read"(%arg5, %3, %3, %3, %3, %4, %5) <{in_bounds = [true, true], operandSegmentSizes = array<i32: 1, 4, 1, 1>, permutation_map = #map}> : (memref<1x1x?x?xf32, strided<[?, ?, ?, ?], offset: ?>>, index, index, index, index, f32, vector<[4]x[4]xi1>) -> vector<[4]x[4]xf32>
    "func.return"(%6) : (vector<[4]x[4]xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<1x1x?x?xf32, strided<[?, ?, ?, ?], offset: ?>>, vector<[4]x[4]xf32>, index, index) -> (), sym_name = "transfer_write_with_mask_memref_only_unit_dims"}> ({
  ^bb0(%arg1: memref<1x1x?x?xf32, strided<[?, ?, ?, ?], offset: ?>>, %arg2: vector<[4]x[4]xf32>, %arg3: index, %arg4: index):
    %1 = "arith.constant"() <{value = 0 : index}> : () -> index
    %2 = "vector.create_mask"(%arg3, %arg4) : (index, index) -> vector<[4]x[4]xi1>
    "vector.transfer_write"(%arg2, %arg1, %1, %1, %1, %1, %2) <{in_bounds = [true, true], operandSegmentSizes = array<i32: 1, 1, 4, 1>, permutation_map = #map}> : (vector<[4]x[4]xf32>, memref<1x1x?x?xf32, strided<[?, ?, ?, ?], offset: ?>>, index, index, index, index, vector<[4]x[4]xi1>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["func.func"]}> : (!transform.any_op) -> !transform.op<"func.func">
      "transform.apply_patterns"(%0) <{max_iterations = -1 : i64, max_num_rewrites = -1 : i64}> ({
        "transform.apply_patterns.vector.rank_reducing_subview_patterns"() : () -> ()
      }) : (!transform.op<"func.func">) -> ()
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

