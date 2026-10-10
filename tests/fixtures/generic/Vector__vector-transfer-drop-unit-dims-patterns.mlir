#map = affine_map<(d0, d1, d2, d3) -> (d2, d3)>
#map1 = affine_map<(d0, d1, d2, d3, d4) -> (d2, d3, d4)>
#map2 = affine_map<(d0, d1) -> (d0, d1)>
#map3 = affine_map<(d0, d1, d2, d3, d4, d5) -> (d0, d1, d2, d3, d4, d5)>
#map4 = affine_map<(d0, d1, d2, d3, d4, d5) -> (d1, d2, d3, d4, d5)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<1x1x3x2xi8, strided<[6, 6, 2, 1], offset: ?>>) -> vector<3x2xi8>, sym_name = "transfer_read_rank_reducing"}> ({
  ^bb0(%arg39: memref<1x1x3x2xi8, strided<[6, 6, 2, 1], offset: ?>>):
    %55 = "arith.constant"() <{value = 0 : index}> : () -> index
    %56 = "arith.constant"() <{value = 0 : i8}> : () -> i8
    %57 = "vector.transfer_read"(%arg39, %55, %55, %55, %55, %56) <{in_bounds = [false, false], operandSegmentSizes = array<i32: 1, 4, 1, 0>, permutation_map = #map}> : (memref<1x1x3x2xi8, strided<[6, 6, 2, 1], offset: ?>>, index, index, index, index, i8) -> vector<3x2xi8>
    "func.return"(%57) : (vector<3x2xi8>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<1x1x3x2xi8, strided<[6, 6, 2, 1], offset: ?>>, vector<3x2xi1>) -> vector<3x2xi8>, sym_name = "transfer_read_rank_reducing_masked"}> ({
  ^bb0(%arg37: memref<1x1x3x2xi8, strided<[6, 6, 2, 1], offset: ?>>, %arg38: vector<3x2xi1>):
    %51 = "arith.constant"() <{value = 0 : index}> : () -> index
    %52 = "arith.constant"() <{value = 0 : i8}> : () -> i8
    %53 = "vector.mask"(%arg38) ({
      %54 = "vector.transfer_read"(%arg37, %51, %51, %51, %51, %52) <{in_bounds = [false, false], operandSegmentSizes = array<i32: 1, 4, 1, 0>, permutation_map = #map}> : (memref<1x1x3x2xi8, strided<[6, 6, 2, 1], offset: ?>>, index, index, index, index, i8) -> vector<3x2xi8>
      "vector.yield"(%54) : (vector<3x2xi8>) -> ()
    }) : (vector<3x2xi1>) -> vector<3x2xi8>
    "func.return"(%53) : (vector<3x2xi8>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<1x1x3x2xi8, strided<[6, 6, 2, 1], offset: ?>>, vector<3x2xi8>) -> (), sym_name = "transfer_write_rank_reducing"}> ({
  ^bb0(%arg35: memref<1x1x3x2xi8, strided<[6, 6, 2, 1], offset: ?>>, %arg36: vector<3x2xi8>):
    %50 = "arith.constant"() <{value = 0 : index}> : () -> index
    "vector.transfer_write"(%arg36, %arg35, %50, %50, %50, %50) <{in_bounds = [false, false], operandSegmentSizes = array<i32: 1, 1, 4, 0>, permutation_map = #map}> : (vector<3x2xi8>, memref<1x1x3x2xi8, strided<[6, 6, 2, 1], offset: ?>>, index, index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<1x1x3x2xi8, strided<[6, 6, 2, 1], offset: ?>>, vector<3x2xi8>, vector<3x2xi1>) -> (), sym_name = "transfer_write_rank_reducing_masked"}> ({
  ^bb0(%arg32: memref<1x1x3x2xi8, strided<[6, 6, 2, 1], offset: ?>>, %arg33: vector<3x2xi8>, %arg34: vector<3x2xi1>):
    %49 = "arith.constant"() <{value = 0 : index}> : () -> index
    "vector.mask"(%arg34) ({
      "vector.transfer_write"(%arg33, %arg32, %49, %49, %49, %49) <{in_bounds = [false, false], operandSegmentSizes = array<i32: 1, 1, 4, 0>, permutation_map = #map}> : (vector<3x2xi8>, memref<1x1x3x2xi8, strided<[6, 6, 2, 1], offset: ?>>, index, index, index, index) -> ()
      "vector.yield"() : () -> ()
    }) : (vector<3x2xi1>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<1x1x3x2x1xf32>) -> vector<3x2x1xf32>, sym_name = "transfer_read_and_vector_rank_reducing"}> ({
  ^bb0(%arg31: memref<1x1x3x2x1xf32>):
    %46 = "arith.constant"() <{value = 0 : index}> : () -> index
    %47 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %48 = "vector.transfer_read"(%arg31, %46, %46, %46, %46, %46, %47) <{in_bounds = [false, false, false], operandSegmentSizes = array<i32: 1, 5, 1, 0>, permutation_map = #map1}> : (memref<1x1x3x2x1xf32>, index, index, index, index, index, f32) -> vector<3x2x1xf32>
    "func.return"(%48) : (vector<3x2x1xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<1x1x3x2x1xf32>, vector<3x2x1xf32>) -> (), sym_name = "transfer_write_and_vector_rank_reducing"}> ({
  ^bb0(%arg29: memref<1x1x3x2x1xf32>, %arg30: vector<3x2x1xf32>):
    %45 = "arith.constant"() <{value = 0 : index}> : () -> index
    "vector.transfer_write"(%arg30, %arg29, %45, %45, %45, %45, %45) <{in_bounds = [false, false, false], operandSegmentSizes = array<i32: 1, 1, 5, 0>, permutation_map = #map1}> : (vector<3x2x1xf32>, memref<1x1x3x2x1xf32>, index, index, index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<1x1x1x1x1xf32>) -> vector<1x1x1xf32>, sym_name = "transfer_read_and_vector_rank_reducing_to_0d"}> ({
  ^bb0(%arg28: memref<1x1x1x1x1xf32>):
    %42 = "arith.constant"() <{value = 0 : index}> : () -> index
    %43 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %44 = "vector.transfer_read"(%arg28, %42, %42, %42, %42, %42, %43) <{in_bounds = [false, false, false], operandSegmentSizes = array<i32: 1, 5, 1, 0>, permutation_map = #map1}> : (memref<1x1x1x1x1xf32>, index, index, index, index, index, f32) -> vector<1x1x1xf32>
    "func.return"(%44) : (vector<1x1x1xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<1x1x1x1x1xf32>, vector<1x1x1xi1>) -> vector<1x1x1xf32>, sym_name = "transfer_read_and_vector_rank_reducing_to_0d_masked"}> ({
  ^bb0(%arg26: memref<1x1x1x1x1xf32>, %arg27: vector<1x1x1xi1>):
    %38 = "arith.constant"() <{value = 0 : index}> : () -> index
    %39 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %40 = "vector.mask"(%arg27) ({
      %41 = "vector.transfer_read"(%arg26, %38, %38, %38, %38, %38, %39) <{in_bounds = [false, false, false], operandSegmentSizes = array<i32: 1, 5, 1, 0>, permutation_map = #map1}> : (memref<1x1x1x1x1xf32>, index, index, index, index, index, f32) -> vector<1x1x1xf32>
      "vector.yield"(%41) : (vector<1x1x1xf32>) -> ()
    }) : (vector<1x1x1xi1>) -> vector<1x1x1xf32>
    "func.return"(%40) : (vector<1x1x1xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<1x1x1x1x1xf32>, vector<1x1x1xf32>) -> (), sym_name = "transfer_write_and_vector_rank_reducing_to_0d"}> ({
  ^bb0(%arg24: memref<1x1x1x1x1xf32>, %arg25: vector<1x1x1xf32>):
    %37 = "arith.constant"() <{value = 0 : index}> : () -> index
    "vector.transfer_write"(%arg25, %arg24, %37, %37, %37, %37, %37) <{in_bounds = [false, false, false], operandSegmentSizes = array<i32: 1, 1, 5, 0>, permutation_map = #map1}> : (vector<1x1x1xf32>, memref<1x1x1x1x1xf32>, index, index, index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<1x1x1x1x1xf32>, vector<1x1x1xf32>, vector<1x1x1xi1>) -> (), sym_name = "transfer_write_and_vector_rank_reducing_to_0d_masked"}> ({
  ^bb0(%arg21: memref<1x1x1x1x1xf32>, %arg22: vector<1x1x1xf32>, %arg23: vector<1x1x1xi1>):
    %35 = "arith.constant"() <{value = 0 : index}> : () -> index
    %36 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    "vector.mask"(%arg23) ({
      "vector.transfer_write"(%arg22, %arg21, %35, %35, %35, %35, %35) <{in_bounds = [false, false, false], operandSegmentSizes = array<i32: 1, 1, 5, 0>, permutation_map = #map1}> : (vector<1x1x1xf32>, memref<1x1x1x1x1xf32>, index, index, index, index, index) -> ()
      "vector.yield"() : () -> ()
    }) : (vector<1x1x1xi1>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<?x1xi8, strided<[?, ?], offset: ?>>) -> vector<[16]x1xi8>, sym_name = "transfer_read_dynamic_rank_reducing"}> ({
  ^bb0(%arg20: memref<?x1xi8, strided<[?, ?], offset: ?>>):
    %32 = "arith.constant"() <{value = 0 : index}> : () -> index
    %33 = "arith.constant"() <{value = 0 : i8}> : () -> i8
    %34 = "vector.transfer_read"(%arg20, %32, %32, %33) <{in_bounds = [true, true], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = #map2}> : (memref<?x1xi8, strided<[?, ?], offset: ?>>, index, index, i8) -> vector<[16]x1xi8>
    "func.return"(%34) : (vector<[16]x1xi8>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<?x1xi8, strided<[?, ?], offset: ?>>, index) -> vector<[16]x1xi8>, sym_name = "masked_transfer_read_dynamic_rank_reducing_1"}> ({
  ^bb0(%arg18: memref<?x1xi8, strided<[?, ?], offset: ?>>, %arg19: index):
    %27 = "arith.constant"() <{value = 0 : index}> : () -> index
    %28 = "arith.constant"() <{value = 1 : index}> : () -> index
    %29 = "arith.constant"() <{value = 0 : i8}> : () -> i8
    %30 = "vector.create_mask"(%arg19, %28) : (index, index) -> vector<[16]x1xi1>
    %31 = "vector.transfer_read"(%arg18, %27, %27, %29, %30) <{in_bounds = [true, true], operandSegmentSizes = array<i32: 1, 2, 1, 1>, permutation_map = #map2}> : (memref<?x1xi8, strided<[?, ?], offset: ?>>, index, index, i8, vector<[16]x1xi1>) -> vector<[16]x1xi8>
    "func.return"(%31) : (vector<[16]x1xi8>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<1x?x3x1x?x1xi8, strided<[?, ?, ?, ?, ?, ?], offset: ?>>, index, index) -> vector<1x[1]x3x1x[16]x1xi8>, sym_name = "masked_transfer_read_dynamic_rank_reducing_2"}> ({
  ^bb0(%arg15: memref<1x?x3x1x?x1xi8, strided<[?, ?, ?, ?, ?, ?], offset: ?>>, %arg16: index, %arg17: index):
    %21 = "arith.constant"() <{value = 0 : index}> : () -> index
    %22 = "arith.constant"() <{value = 1 : index}> : () -> index
    %23 = "arith.constant"() <{value = 2 : index}> : () -> index
    %24 = "arith.constant"() <{value = 0 : i8}> : () -> i8
    %25 = "vector.create_mask"(%22, %arg16, %23, %22, %arg17, %22) : (index, index, index, index, index, index) -> vector<1x[1]x3x1x[16]x1xi1>
    %26 = "vector.transfer_read"(%arg15, %21, %21, %21, %21, %21, %21, %24, %25) <{in_bounds = [true, true, true, true, true, true], operandSegmentSizes = array<i32: 1, 6, 1, 1>, permutation_map = #map3}> : (memref<1x?x3x1x?x1xi8, strided<[?, ?, ?, ?, ?, ?], offset: ?>>, index, index, index, index, index, index, i8, vector<1x[1]x3x1x[16]x1xi1>) -> vector<1x[1]x3x1x[16]x1xi8>
    "func.return"(%26) : (vector<1x[1]x3x1x[16]x1xi8>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<1x1x3x1x16x1xf32>, vector<1x3x1x16x1xf32>, index, index) -> (), sym_name = "masked_transfer_write_and_vector_rank_reducing"}> ({
  ^bb0(%arg11: memref<1x1x3x1x16x1xf32>, %arg12: vector<1x3x1x16x1xf32>, %arg13: index, %arg14: index):
    %18 = "arith.constant"() <{value = 0 : index}> : () -> index
    %19 = "arith.constant"() <{value = 1 : index}> : () -> index
    %20 = "vector.create_mask"(%19, %arg13, %19, %arg14, %19) : (index, index, index, index, index) -> vector<1x3x1x16x1xi1>
    "vector.transfer_write"(%arg12, %arg11, %18, %18, %18, %18, %18, %18, %20) <{in_bounds = [false, false, false, false, false], operandSegmentSizes = array<i32: 1, 1, 6, 1>, permutation_map = #map4}> : (vector<1x3x1x16x1xf32>, memref<1x1x3x1x16x1xf32>, index, index, index, index, index, index, vector<1x3x1x16x1xi1>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<?x1xi8, strided<[?, ?], offset: ?>>, vector<[16]x1xi8>, index) -> (), sym_name = "masked_transfer_write_dynamic_rank_reducing"}> ({
  ^bb0(%arg8: memref<?x1xi8, strided<[?, ?], offset: ?>>, %arg9: vector<[16]x1xi8>, %arg10: index):
    %14 = "arith.constant"() <{value = 0 : index}> : () -> index
    %15 = "arith.constant"() <{value = 1 : index}> : () -> index
    %16 = "arith.constant"() <{value = 0 : i8}> : () -> i8
    %17 = "vector.create_mask"(%arg10, %15) : (index, index) -> vector<[16]x1xi1>
    "vector.transfer_write"(%arg9, %arg8, %14, %14, %17) <{in_bounds = [true, true], operandSegmentSizes = array<i32: 1, 1, 2, 1>, permutation_map = #map2}> : (vector<[16]x1xi8>, memref<?x1xi8, strided<[?, ?], offset: ?>>, index, index, vector<[16]x1xi1>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<?x1xi8, strided<[?, ?], offset: ?>>, vector<[16]x1xi1>) -> vector<[16]x1xi8>, sym_name = "unsupported_masked_transfer_read_dynamic_rank_reducing_1"}> ({
  ^bb0(%arg6: memref<?x1xi8, strided<[?, ?], offset: ?>>, %arg7: vector<[16]x1xi1>):
    %11 = "arith.constant"() <{value = 0 : index}> : () -> index
    %12 = "arith.constant"() <{value = 0 : i8}> : () -> i8
    %13 = "vector.transfer_read"(%arg6, %11, %11, %12, %arg7) <{in_bounds = [true, true], operandSegmentSizes = array<i32: 1, 2, 1, 1>, permutation_map = #map2}> : (memref<?x1xi8, strided<[?, ?], offset: ?>>, index, index, i8, vector<[16]x1xi1>) -> vector<[16]x1xi8>
    "func.return"(%13) : (vector<[16]x1xi8>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<?x1xi8, strided<[?, ?], offset: ?>>, index, index) -> vector<[16]x1xi8>, sym_name = "unsupported_masked_transfer_read_dynamic_rank_reducing_2"}> ({
  ^bb0(%arg3: memref<?x1xi8, strided<[?, ?], offset: ?>>, %arg4: index, %arg5: index):
    %6 = "arith.constant"() <{value = 0 : index}> : () -> index
    %7 = "arith.constant"() <{value = 1 : index}> : () -> index
    %8 = "arith.constant"() <{value = 0 : i8}> : () -> i8
    %9 = "vector.create_mask"(%arg4, %arg5) : (index, index) -> vector<[16]x1xi1>
    %10 = "vector.transfer_read"(%arg3, %6, %6, %8, %9) <{in_bounds = [true, true], operandSegmentSizes = array<i32: 1, 2, 1, 1>, permutation_map = #map2}> : (memref<?x1xi8, strided<[?, ?], offset: ?>>, index, index, i8, vector<[16]x1xi1>) -> vector<[16]x1xi8>
    "func.return"(%10) : (vector<[16]x1xi8>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<?x1xi8, strided<[?, ?], offset: ?>>, index) -> vector<[16]x[1]xi8>, sym_name = "masked_transfer_read_dynamic_rank_reducing_scalable_unit_dim"}> ({
  ^bb0(%arg1: memref<?x1xi8, strided<[?, ?], offset: ?>>, %arg2: index):
    %1 = "arith.constant"() <{value = 0 : index}> : () -> index
    %2 = "arith.constant"() <{value = 1 : index}> : () -> index
    %3 = "arith.constant"() <{value = 0 : i8}> : () -> i8
    %4 = "vector.create_mask"(%arg2, %2) : (index, index) -> vector<[16]x[1]xi1>
    %5 = "vector.transfer_read"(%arg1, %1, %1, %3, %4) <{in_bounds = [true, true], operandSegmentSizes = array<i32: 1, 2, 1, 1>, permutation_map = #map2}> : (memref<?x1xi8, strided<[?, ?], offset: ?>>, index, index, i8, vector<[16]x[1]xi1>) -> vector<[16]x[1]xi8>
    "func.return"(%5) : (vector<[16]x[1]xi8>) -> ()
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

