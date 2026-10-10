#map = affine_map<(d0, d1) -> (d0, d1)>
#map1 = affine_map<(d0, d1, d2) -> (d0, d1)>
#map2 = affine_map<(d0, d1, d2) -> (d1, d2)>
#map3 = affine_map<(d0, d1, d2) -> (d0, d2)>
#map4 = affine_map<() -> (0)>
#map5 = affine_map<()[s0] -> (s0)>
"builtin.module"() ({
  "func.func"() <{function_type = (vector<4x2xf32>) -> vector<4x2xf32>, sym_name = "add4x2"}> ({
  ^bb0(%arg47: vector<4x2xf32>):
    %68 = "arith.addf"(%arg47, %arg47) <{fastmath = #arith.fastmath<none>}> : (vector<4x2xf32>, vector<4x2xf32>) -> vector<4x2xf32>
    "func.return"(%68) : (vector<4x2xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<2x[4]x1xf32>, vector<2x[4]x1xf32>) -> vector<2x[4]x1xf32>, sym_name = "no_change"}> ({
  ^bb0(%arg45: vector<2x[4]x1xf32>, %arg46: vector<2x[4]x1xf32>):
    %67 = "arith.mulf"(%arg45, %arg46) <{fastmath = #arith.fastmath<none>}> : (vector<2x[4]x1xf32>, vector<2x[4]x1xf32>) -> vector<2x[4]x1xf32>
    "func.return"(%67) : (vector<2x[4]x1xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<1x4x1xf32>, vector<1x4x1xf32>) -> vector<1x4x1xf32>, sym_name = "cast_away_leading_one_dim"}> ({
  ^bb0(%arg43: vector<1x4x1xf32>, %arg44: vector<1x4x1xf32>):
    %66 = "arith.mulf"(%arg43, %arg44) <{fastmath = #arith.fastmath<none>}> : (vector<1x4x1xf32>, vector<1x4x1xf32>) -> vector<1x4x1xf32>
    "func.return"(%66) : (vector<1x4x1xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<1x[4]x1xf32>, vector<1x[4]x1xf32>) -> vector<1x[4]x1xf32>, sym_name = "cast_away_leading_one_dim_scalable"}> ({
  ^bb0(%arg41: vector<1x[4]x1xf32>, %arg42: vector<1x[4]x1xf32>):
    %65 = "arith.mulf"(%arg41, %arg42) <{fastmath = #arith.fastmath<none>}> : (vector<1x[4]x1xf32>, vector<1x[4]x1xf32>) -> vector<1x[4]x1xf32>
    "func.return"(%65) : (vector<1x[4]x1xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<4x4xf32>, vector<4x4xf32>) -> vector<4x4xf32>, sym_name = "add4x4"}> ({
  ^bb0(%arg39: vector<4x4xf32>, %arg40: vector<4x4xf32>):
    %63 = "arith.addf"(%arg39, %arg40) <{fastmath = #arith.fastmath<none>}> : (vector<4x4xf32>, vector<4x4xf32>) -> vector<4x4xf32>
    %64 = "arith.addf"(%arg40, %63) <{fastmath = #arith.fastmath<none>}> : (vector<4x4xf32>, vector<4x4xf32>) -> vector<4x4xf32>
    "func.return"(%64) : (vector<4x4xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<4x2xf32>, memref<2x4xf32>, memref<4x4xf32>) -> (), sym_name = "contraction4x4_ikj_xfer_read"}> ({
  ^bb0(%arg36: memref<4x2xf32>, %arg37: memref<2x4xf32>, %arg38: memref<4x4xf32>):
    %57 = "arith.constant"() <{value = 0 : index}> : () -> index
    %58 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %59 = "vector.transfer_read"(%arg36, %57, %57, %58) <{in_bounds = [false, false], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = #map}> : (memref<4x2xf32>, index, index, f32) -> vector<4x2xf32>
    %60 = "vector.transfer_read"(%arg37, %57, %57, %58) <{in_bounds = [false, false], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = #map}> : (memref<2x4xf32>, index, index, f32) -> vector<2x4xf32>
    %61 = "vector.transfer_read"(%arg38, %57, %57, %58) <{in_bounds = [false, false], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = #map}> : (memref<4x4xf32>, index, index, f32) -> vector<4x4xf32>
    %62 = "vector.contract"(%59, %60, %61) <{indexing_maps = [#map1, #map2, #map3], iterator_types = [#vector.iterator_type<parallel>, #vector.iterator_type<reduction>, #vector.iterator_type<parallel>], kind = #vector.kind<add>}> : (vector<4x2xf32>, vector<2x4xf32>, vector<4x4xf32>) -> vector<4x4xf32>
    "vector.transfer_write"(%62, %arg38, %57, %57) <{in_bounds = [false, false], operandSegmentSizes = array<i32: 1, 1, 2, 0>, permutation_map = #map}> : (vector<4x4xf32>, memref<4x4xf32>, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index, index) -> (), sym_name = "vector_transfers"}> ({
  ^bb0(%arg32: index, %arg33: index):
    %48 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %49 = "memref.alloc"(%arg32, %arg33) <{operandSegmentSizes = array<i32: 2, 0>}> : (index, index) -> memref<?x?xf32>
    %50 = "memref.alloc"(%arg32, %arg33) <{operandSegmentSizes = array<i32: 2, 0>}> : (index, index) -> memref<?x?xf32>
    %51 = "memref.alloc"(%arg32, %arg33) <{operandSegmentSizes = array<i32: 2, 0>}> : (index, index) -> memref<?x?xf32>
    %52 = "arith.constant"() <{value = 1.000000e+00 : f32}> : () -> f32
    %53 = "arith.constant"() <{value = 2.000000e+00 : f32}> : () -> f32
    "affine.for"(%arg32) <{lowerBoundMap = #map4, operandSegmentSizes = array<i32: 0, 1, 0>, step = 4 : index, upperBoundMap = #map5}> ({
    ^bb0(%arg34: index):
      "affine.for"(%arg33) <{lowerBoundMap = #map4, operandSegmentSizes = array<i32: 0, 1, 0>, step = 4 : index, upperBoundMap = #map5}> ({
      ^bb0(%arg35: index):
        %54 = "vector.transfer_read"(%49, %arg34, %arg35, %48) <{in_bounds = [false, false], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = #map}> : (memref<?x?xf32>, index, index, f32) -> vector<4x4xf32>
        %55 = "vector.transfer_read"(%50, %arg34, %arg35, %48) <{in_bounds = [false, false], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = #map}> : (memref<?x?xf32>, index, index, f32) -> vector<4x4xf32>
        %56 = "arith.addf"(%54, %55) <{fastmath = #arith.fastmath<none>}> : (vector<4x4xf32>, vector<4x4xf32>) -> vector<4x4xf32>
        "vector.transfer_write"(%56, %51, %arg34, %arg35) <{in_bounds = [false, false], operandSegmentSizes = array<i32: 1, 1, 2, 0>, permutation_map = #map}> : (vector<4x4xf32>, memref<?x?xf32>, index, index) -> ()
        "affine.yield"() : () -> ()
      }) : (index) -> ()
      "affine.yield"() : () -> ()
    }) : (index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<4x4xf32>, memref<4x4xf32>) -> (), sym_name = "elementwise_unroll"}> ({
  ^bb0(%arg30: memref<4x4xf32>, %arg31: memref<4x4xf32>):
    %40 = "arith.constant"() <{value = 0 : index}> : () -> index
    %41 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %42 = "vector.transfer_read"(%arg30, %40, %40, %41) <{in_bounds = [false, false], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = #map}> : (memref<4x4xf32>, index, index, f32) -> vector<4x4xf32>
    %43 = "vector.transfer_read"(%arg31, %40, %40, %41) <{in_bounds = [false, false], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = #map}> : (memref<4x4xf32>, index, index, f32) -> vector<4x4xf32>
    %44 = "arith.cmpf"(%42, %43) <{fastmath = #arith.fastmath<none>, predicate = 11 : i64}> : (vector<4x4xf32>, vector<4x4xf32>) -> vector<4x4xi1>
    %45 = "vector.transfer_read"(%arg30, %40, %40, %41) <{in_bounds = [false, false], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = #map}> : (memref<4x4xf32>, index, index, f32) -> vector<4x4xf32>
    %46 = "vector.transfer_read"(%arg31, %40, %40, %41) <{in_bounds = [false, false], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = #map}> : (memref<4x4xf32>, index, index, f32) -> vector<4x4xf32>
    %47 = "arith.select"(%44, %45, %46) : (vector<4x4xi1>, vector<4x4xf32>, vector<4x4xf32>) -> vector<4x4xf32>
    "vector.transfer_write"(%47, %arg30, %40, %40) <{in_bounds = [false, false], operandSegmentSizes = array<i32: 1, 1, 2, 0>, permutation_map = #map}> : (vector<4x4xf32>, memref<4x4xf32>, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<4x2xf32>, tensor<2x4xf32>, tensor<4x4xf32>) -> tensor<4x4xf32>, sym_name = "contraction4x4_ikj_xfer_read_tensor"}> ({
  ^bb0(%arg27: tensor<4x2xf32>, %arg28: tensor<2x4xf32>, %arg29: tensor<4x4xf32>):
    %33 = "arith.constant"() <{value = 0 : index}> : () -> index
    %34 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %35 = "vector.transfer_read"(%arg27, %33, %33, %34) <{in_bounds = [false, false], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = #map}> : (tensor<4x2xf32>, index, index, f32) -> vector<4x2xf32>
    %36 = "vector.transfer_read"(%arg28, %33, %33, %34) <{in_bounds = [false, false], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = #map}> : (tensor<2x4xf32>, index, index, f32) -> vector<2x4xf32>
    %37 = "vector.transfer_read"(%arg29, %33, %33, %34) <{in_bounds = [false, false], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = #map}> : (tensor<4x4xf32>, index, index, f32) -> vector<4x4xf32>
    %38 = "vector.contract"(%35, %36, %37) <{indexing_maps = [#map1, #map2, #map3], iterator_types = [#vector.iterator_type<parallel>, #vector.iterator_type<reduction>, #vector.iterator_type<parallel>], kind = #vector.kind<add>}> : (vector<4x2xf32>, vector<2x4xf32>, vector<4x4xf32>) -> vector<4x4xf32>
    %39 = "vector.transfer_write"(%38, %arg29, %33, %33) <{in_bounds = [false, false], operandSegmentSizes = array<i32: 1, 1, 2, 0>, permutation_map = #map}> : (vector<4x4xf32>, tensor<4x4xf32>, index, index) -> tensor<4x4xf32>
    "func.return"(%39) : (tensor<4x4xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<4xf32>) -> (f16, f16), sym_name = "bubble_down_bitcast_in_extract"}> ({
  ^bb0(%arg26: vector<4xf32>):
    %30 = "vector.bitcast"(%arg26) : (vector<4xf32>) -> vector<8xf16>
    %31 = "vector.extract"(%30) <{static_position = array<i64: 3>}> : (vector<8xf16>) -> f16
    %32 = "vector.extract"(%30) <{static_position = array<i64: 4>}> : (vector<8xf16>) -> f16
    "func.return"(%31, %32) : (f16, f16) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<4xf32>) -> vector<4xf16>, sym_name = "bubble_down_bitcast_in_strided_slice_extract"}> ({
  ^bb0(%arg25: vector<4xf32>):
    %28 = "vector.bitcast"(%arg25) : (vector<4xf32>) -> vector<8xf16>
    %29 = "vector.extract_strided_slice"(%28) <{offsets = [4], sizes = [4], strides = [1]}> : (vector<8xf16>) -> vector<4xf16>
    "func.return"(%29) : (vector<4xf16>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<4x2xf32>) -> vector<2x4xf16>, sym_name = "bubble_down_bitcast_in_strided_slice_extract_full_last_dim"}> ({
  ^bb0(%arg24: vector<4x2xf32>):
    %26 = "vector.bitcast"(%arg24) : (vector<4x2xf32>) -> vector<4x4xf16>
    %27 = "vector.extract_strided_slice"(%26) <{offsets = [1], sizes = [2], strides = [1]}> : (vector<4x4xf16>) -> vector<2x4xf16>
    "func.return"(%27) : (vector<2x4xf16>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<4xf32>) -> vector<4xf16>, sym_name = "bubble_down_bitcast_in_strided_slice_extract_odd_offset"}> ({
  ^bb0(%arg23: vector<4xf32>):
    %24 = "vector.bitcast"(%arg23) : (vector<4xf32>) -> vector<8xf16>
    %25 = "vector.extract_strided_slice"(%24) <{offsets = [3], sizes = [4], strides = [1]}> : (vector<8xf16>) -> vector<4xf16>
    "func.return"(%25) : (vector<4xf16>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<4xf32>) -> vector<3xf16>, sym_name = "bubble_down_bitcast_in_strided_slice_extract_odd_size"}> ({
  ^bb0(%arg22: vector<4xf32>):
    %22 = "vector.bitcast"(%arg22) : (vector<4xf32>) -> vector<8xf16>
    %23 = "vector.extract_strided_slice"(%22) <{offsets = [0], sizes = [3], strides = [1]}> : (vector<8xf16>) -> vector<3xf16>
    "func.return"(%23) : (vector<3xf16>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<32xi4>, vector<8x32xi4>) -> vector<8x16xi8>, sym_name = "bubble_up_bitcast_in_insert_i4_i8"}> ({
  ^bb0(%arg20: vector<32xi4>, %arg21: vector<8x32xi4>):
    %20 = "vector.insert"(%arg20, %arg21) <{static_position = array<i64: 4>}> : (vector<32xi4>, vector<8x32xi4>) -> vector<8x32xi4>
    %21 = "vector.bitcast"(%20) : (vector<8x32xi4>) -> vector<8x16xi8>
    "func.return"(%21) : (vector<8x16xi8>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<16xi8>, vector<8x16xi8>) -> vector<8x32xi4>, sym_name = "bubble_up_bitcast_in_insert_i8_i4"}> ({
  ^bb0(%arg18: vector<16xi8>, %arg19: vector<8x16xi8>):
    %18 = "vector.insert"(%arg18, %arg19) <{static_position = array<i64: 4>}> : (vector<16xi8>, vector<8x16xi8>) -> vector<8x16xi8>
    %19 = "vector.bitcast"(%18) : (vector<8x16xi8>) -> vector<8x32xi4>
    "func.return"(%19) : (vector<8x32xi4>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<16xi32>, vector<8x16xi32>) -> vector<8x16xf32>, sym_name = "bubble_up_bitcast_in_insert_i32_f32"}> ({
  ^bb0(%arg16: vector<16xi32>, %arg17: vector<8x16xi32>):
    %16 = "vector.insert"(%arg16, %arg17) <{static_position = array<i64: 4>}> : (vector<16xi32>, vector<8x16xi32>) -> vector<8x16xi32>
    %17 = "vector.bitcast"(%16) : (vector<8x16xi32>) -> vector<8x16xf32>
    "func.return"(%17) : (vector<8x16xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i8, vector<8x16xi8>) -> vector<8x32xi4>, sym_name = "bubble_up_bitcast_in_insert_scalar"}> ({
  ^bb0(%arg14: i8, %arg15: vector<8x16xi8>):
    %14 = "vector.insert"(%arg14, %arg15) <{static_position = array<i64: 4, 8>}> : (i8, vector<8x16xi8>) -> vector<8x16xi8>
    %15 = "vector.bitcast"(%14) : (vector<8x16xi8>) -> vector<8x32xi4>
    "func.return"(%15) : (vector<8x32xi4>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<8xf16>, vector<4xf16>, vector<4xf16>) -> vector<4xf32>, sym_name = "bubble_up_bitcast_in_strided_slice_insert"}> ({
  ^bb0(%arg11: vector<8xf16>, %arg12: vector<4xf16>, %arg13: vector<4xf16>):
    %11 = "vector.insert_strided_slice"(%arg12, %arg11) <{offsets = [0], strides = [1]}> : (vector<4xf16>, vector<8xf16>) -> vector<8xf16>
    %12 = "vector.insert_strided_slice"(%arg13, %11) <{offsets = [4], strides = [1]}> : (vector<4xf16>, vector<8xf16>) -> vector<8xf16>
    %13 = "vector.bitcast"(%12) : (vector<8xf16>) -> vector<4xf32>
    "func.return"(%13) : (vector<4xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<8xf16>, vector<4xf16>) -> vector<4xf32>, sym_name = "bubble_up_bitcast_in_strided_slice_insert_odd_offset"}> ({
  ^bb0(%arg9: vector<8xf16>, %arg10: vector<4xf16>):
    %9 = "vector.insert_strided_slice"(%arg10, %arg9) <{offsets = [3], strides = [1]}> : (vector<4xf16>, vector<8xf16>) -> vector<8xf16>
    %10 = "vector.bitcast"(%9) : (vector<8xf16>) -> vector<4xf32>
    "func.return"(%10) : (vector<4xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<16x4x8xf16>, vector<2x4xf16>) -> vector<16x4x4xf32>, sym_name = "bubble_up_bitcast_in_strided_slice_insert_different_rank"}> ({
  ^bb0(%arg7: vector<16x4x8xf16>, %arg8: vector<2x4xf16>):
    %7 = "vector.insert_strided_slice"(%arg8, %arg7) <{offsets = [0, 0, 2], strides = [1, 1]}> : (vector<2x4xf16>, vector<16x4x8xf16>) -> vector<16x4x8xf16>
    %8 = "vector.bitcast"(%7) : (vector<16x4x8xf16>) -> vector<16x4x4xf32>
    "func.return"(%8) : (vector<16x4x4xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<2xf16>, vector<1xf16>) -> vector<1xf32>, sym_name = "bubble_up_bitcast_in_strided_slice_insert_odd_shape"}> ({
  ^bb0(%arg5: vector<2xf16>, %arg6: vector<1xf16>):
    %5 = "vector.insert_strided_slice"(%arg6, %arg5) <{offsets = [0], strides = [1]}> : (vector<1xf16>, vector<2xf16>) -> vector<2xf16>
    %6 = "vector.bitcast"(%5) : (vector<2xf16>) -> vector<1xf32>
    "func.return"(%6) : (vector<1xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<8xf16>, vector<3xf16>) -> vector<4xf32>, sym_name = "bubble_up_bitcast_in_strided_slice_insert_larger_odd_shape"}> ({
  ^bb0(%arg3: vector<8xf16>, %arg4: vector<3xf16>):
    %3 = "vector.insert_strided_slice"(%arg4, %arg3) <{offsets = [0], strides = [1]}> : (vector<3xf16>, vector<8xf16>) -> vector<8xf16>
    %4 = "vector.bitcast"(%3) : (vector<8xf16>) -> vector<4xf32>
    "func.return"(%4) : (vector<4xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<f32>) -> vector<i32>, sym_name = "vec_0D"}> ({
  ^bb0(%arg2: vector<f32>):
    %2 = "vector.bitcast"(%arg2) : (vector<f32>) -> vector<i32>
    "func.return"(%2) : (vector<i32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<4xi32>, index) -> i16, sym_name = "vector_extract_dynamic_index"}> ({
  ^bb0(%arg0: vector<4xi32>, %arg1: index):
    %0 = "vector.bitcast"(%arg0) : (vector<4xi32>) -> vector<8xi16>
    %1 = "vector.extract"(%0, %arg1) <{static_position = array<i64: -9223372036854775808>}> : (vector<8xi16>, index) -> i16
    "func.return"(%1) : (i16) -> ()
  }) : () -> ()
}) : () -> ()

