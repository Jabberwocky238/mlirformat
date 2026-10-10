#map = affine_map<(d0, d1) -> (d0, d1)>
#map1 = affine_map<(d0, d1) -> (d1)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d2)>
#map3 = affine_map<(d0, d1, d2) -> (d2, d1)>
#map4 = affine_map<(d0, d1, d2) -> (d0, d1)>
#map5 = affine_map<(d0, d1, d2, d3, d4, d5, d6) -> (d0, d1 * 2 + d4, d2 * 2 + d5, d6)>
#map6 = affine_map<(d0, d1, d2, d3, d4, d5, d6) -> (d4, d5, d6, d3)>
#map7 = affine_map<(d0, d1, d2, d3, d4, d5, d6) -> (d0, d1, d2, d3)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?xf32>, tensor<?xf32>, index, index, index, index) -> tensor<?x?xf32>, sym_name = "dynamic"}> ({
  ^bb0(%arg30: tensor<?x?xf32>, %arg31: tensor<?xf32>, %arg32: index, %arg33: index, %arg34: index, %arg35: index):
    %36 = "linalg.generic"(%arg30, %arg31, %arg30) <{indexing_maps = [#map, #map1, #map], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg36: f32, %arg37: f32, %arg38: f32):
      %38 = "arith.addf"(%arg36, %arg37) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%38) : (f32) -> ()
    }) : (tensor<?x?xf32>, tensor<?xf32>, tensor<?x?xf32>) -> tensor<?x?xf32>
    %37 = "tensor.extract_slice"(%36, %arg32, %arg33, %arg34, %arg35) <{operandSegmentSizes = array<i32: 1, 2, 2, 0>, static_offsets = array<i64: -9223372036854775808, -9223372036854775808>, static_sizes = array<i64: -9223372036854775808, -9223372036854775808>, static_strides = array<i64: 1, 1>}> : (tensor<?x?xf32>, index, index, index, index) -> tensor<?x?xf32>
    "func.return"(%37) : (tensor<?x?xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<16x8xf32>, tensor<8xf32>) -> tensor<4x2xf32>, sym_name = "static"}> ({
  ^bb0(%arg25: tensor<16x8xf32>, %arg26: tensor<8xf32>):
    %33 = "linalg.generic"(%arg25, %arg26, %arg25) <{indexing_maps = [#map, #map1, #map], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg27: f32, %arg28: f32, %arg29: f32):
      %35 = "arith.addf"(%arg27, %arg28) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%35) : (f32) -> ()
    }) : (tensor<16x8xf32>, tensor<8xf32>, tensor<16x8xf32>) -> tensor<16x8xf32>
    %34 = "tensor.extract_slice"(%33) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_offsets = array<i64: 8, 4>, static_sizes = array<i64: 4, 2>, static_strides = array<i64: 1, 1>}> : (tensor<16x8xf32>) -> tensor<4x2xf32>
    "func.return"(%34) : (tensor<4x2xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<?x8xf32>, tensor<8xf32>, index, index) -> tensor<?x2xf32>, sym_name = "mixed"}> ({
  ^bb0(%arg18: tensor<?x8xf32>, %arg19: tensor<8xf32>, %arg20: index, %arg21: index):
    %30 = "linalg.generic"(%arg18, %arg19, %arg18) <{indexing_maps = [#map, #map1, #map], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg22: f32, %arg23: f32, %arg24: f32):
      %32 = "arith.addf"(%arg22, %arg23) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%32) : (f32) -> ()
    }) : (tensor<?x8xf32>, tensor<8xf32>, tensor<?x8xf32>) -> tensor<?x8xf32>
    %31 = "tensor.extract_slice"(%30, %arg20, %arg21) <{operandSegmentSizes = array<i32: 1, 1, 1, 0>, static_offsets = array<i64: 8, -9223372036854775808>, static_sizes = array<i64: -9223372036854775808, 2>, static_strides = array<i64: 1, 1>}> : (tensor<?x8xf32>, index, index) -> tensor<?x2xf32>
    "func.return"(%31) : (tensor<?x2xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<?x?xf32>, tensor<?xf32>) -> tensor<4x2xf32>, sym_name = "dynamic_to_static"}> ({
  ^bb0(%arg13: tensor<?x?xf32>, %arg14: tensor<?xf32>):
    %27 = "linalg.generic"(%arg13, %arg14, %arg13) <{indexing_maps = [#map, #map1, #map], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg15: f32, %arg16: f32, %arg17: f32):
      %29 = "arith.addf"(%arg15, %arg16) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%29) : (f32) -> ()
    }) : (tensor<?x?xf32>, tensor<?xf32>, tensor<?x?xf32>) -> tensor<?x?xf32>
    %28 = "tensor.extract_slice"(%27) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_offsets = array<i64: 8, 4>, static_sizes = array<i64: 4, 2>, static_strides = array<i64: 1, 1>}> : (tensor<?x?xf32>) -> tensor<4x2xf32>
    "func.return"(%28) : (tensor<4x2xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> tensor<2x2xf32>, sym_name = "matmul_slice"}> ({
    %20 = "arith.constant"() <{value = dense<1.000000e+00> : tensor<4x4xf32>}> : () -> tensor<4x4xf32>
    %21 = "arith.constant"() <{value = dense<1.000000e+00> : tensor<4x4xf32>}> : () -> tensor<4x4xf32>
    %22 = "arith.constant"() <{value = dense<[[0.000000e+00, 1.000000e+00, 2.000000e+00, 3.000000e+00], [4.000000e+00, 5.000000e+00, 6.000000e+00, 7.000000e+00], [8.000000e+00, 9.000000e+00, 1.000000e+01, 1.100000e+01], [1.200000e+01, 1.300000e+01, 1.400000e+01, 1.500000e+01]]> : tensor<4x4xf32>}> : () -> tensor<4x4xf32>
    %23 = "linalg.matmul"(%20, %21, %22) <{indexing_maps = [#map2, #map3, #map4], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg10: f32, %arg11: f32, %arg12: f32):
      %25 = "arith.mulf"(%arg10, %arg11) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %26 = "arith.addf"(%arg12, %25) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%26) : (f32) -> ()
    }) : (tensor<4x4xf32>, tensor<4x4xf32>, tensor<4x4xf32>) -> tensor<4x4xf32>
    %24 = "tensor.extract_slice"(%23) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_offsets = array<i64: 1, 1>, static_sizes = array<i64: 2, 2>, static_strides = array<i64: 1, 1>}> : (tensor<4x4xf32>) -> tensor<2x2xf32>
    "func.return"(%24) : (tensor<2x2xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<1x225x225x3xf32>, tensor<3x3x3x32xf32>) -> tensor<1x32x32x16xf32>, sym_name = "conv_slice"}> ({
  ^bb0(%arg3: tensor<1x225x225x3xf32>, %arg4: tensor<3x3x3x32xf32>):
    %7 = "arith.constant"() <{value = 112 : index}> : () -> index
    %8 = "arith.constant"() <{value = 32 : index}> : () -> index
    %9 = "arith.constant"() <{value = 16 : index}> : () -> index
    %10 = "arith.constant"() <{value = 8 : index}> : () -> index
    %11 = "arith.constant"() <{value = 4 : index}> : () -> index
    %12 = "arith.constant"() <{value = 0 : index}> : () -> index
    %13 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %14 = "tensor.empty"() : () -> tensor<1x112x112x32xf32>
    %15 = "linalg.fill"(%13, %14) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg8: f32, %arg9: f32):
      "linalg.yield"(%arg8) : (f32) -> ()
    }) : (f32, tensor<1x112x112x32xf32>) -> tensor<1x112x112x32xf32>
    %16 = "linalg.conv_2d_nhwc_hwcf"(%arg3, %arg4, %15) <{dilations = dense<1> : tensor<2xi64>, operandSegmentSizes = array<i32: 2, 1>, strides = dense<2> : tensor<2xi64>}> ({
    ^bb0(%arg5: f32, %arg6: f32, %arg7: f32):
      %18 = "arith.mulf"(%arg5, %arg6) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %19 = "arith.addf"(%arg7, %18) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%19) : (f32) -> ()
    }) {linalg.memoized_indexing_maps = [#map5, #map6, #map7]} : (tensor<1x225x225x3xf32>, tensor<3x3x3x32xf32>, tensor<1x112x112x32xf32>) -> tensor<1x112x112x32xf32>
    %17 = "tensor.extract_slice"(%16) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_offsets = array<i64: 0, 64, 64, 16>, static_sizes = array<i64: 1, 32, 32, 16>, static_strides = array<i64: 1, 1, 1, 1>}> : (tensor<1x112x112x32xf32>) -> tensor<1x32x32x16xf32>
    "func.return"(%17) : (tensor<1x32x32x16xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index) -> tensor<1x1x1x?xf32>, sym_name = "rank_reducing_slice"}> ({
  ^bb0(%arg0: index):
    %0 = "arith.constant"() <{value = 1.000000e+00 : f32}> : () -> f32
    %1 = "tensor.empty"(%arg0) : (index) -> tensor<1x?xf32>
    %2 = "linalg.fill"(%0, %1) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg1: f32, %arg2: f32):
      "linalg.yield"(%arg1) : (f32) -> ()
    }) : (f32, tensor<1x?xf32>) -> tensor<1x?xf32>
    %3 = "tensor.extract_slice"(%2, %arg0) <{operandSegmentSizes = array<i32: 1, 0, 1, 0>, static_offsets = array<i64: 0, 0>, static_sizes = array<i64: 1, -9223372036854775808>, static_strides = array<i64: 1, 1>}> : (tensor<1x?xf32>, index) -> tensor<?xf32>
    %4 = "arith.constant"() <{value = 0 : index}> : () -> index
    %5 = "tensor.dim"(%3, %4) : (tensor<?xf32>, index) -> index
    %6 = "tensor.expand_shape"(%3, %5) <{reassociation = [[0, 1, 2, 3]], static_output_shape = array<i64: 1, 1, 1, -9223372036854775808>}> : (tensor<?xf32>, index) -> tensor<1x1x1x?xf32>
    "func.return"(%6) : (tensor<1x1x1x?xf32>) -> ()
  }) : () -> ()
}) : () -> ()

