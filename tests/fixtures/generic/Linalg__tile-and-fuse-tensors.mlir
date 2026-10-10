#map = affine_map<(d0, d1, d2) -> (d0, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d2, d1)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?xf32>, tensor<?x?xf32>, tensor<?x?xf32>) -> tensor<?x?xf32>, sym_name = "matmul_tensors"}> ({
  ^bb0(%arg0: tensor<?x?xf32>, %arg1: tensor<?x?xf32>, %arg2: tensor<?x?xf32>):
    %0 = "linalg.matmul"(%arg0, %arg1, %arg2) <{indexing_maps = [#map, #map1, #map2], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg12: f32, %arg13: f32, %arg14: f32):
      %19 = "arith.mulf"(%arg12, %arg13) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %20 = "arith.addf"(%arg14, %19) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%20) : (f32) -> ()
    }) : (tensor<?x?xf32>, tensor<?x?xf32>, tensor<?x?xf32>) -> tensor<?x?xf32>
    %1 = "arith.constant"() <{value = 4 : index}> : () -> index
    %2 = "arith.constant"() <{value = 2 : index}> : () -> index
    %3 = "arith.constant"() <{value = 0 : index}> : () -> index
    %4 = "arith.constant"() <{value = 3 : index}> : () -> index
    %5 = "arith.constant"() <{value = 1 : index}> : () -> index
    %6 = "tensor.dim"(%0, %3) : (tensor<?x?xf32>, index) -> index
    %7 = "tensor.dim"(%0, %5) : (tensor<?x?xf32>, index) -> index
    %8 = "tensor.dim"(%arg1, %5) : (tensor<?x?xf32>, index) -> index
    %9 = "scf.for"(%3, %6, %2, %arg2) ({
    ^bb0(%arg3: index, %arg4: tensor<?x?xf32>):
      %10 = "scf.for"(%3, %8, %4, %arg4) ({
      ^bb0(%arg5: index, %arg6: tensor<?x?xf32>):
        %11 = "scf.for"(%3, %7, %1, %arg6) ({
        ^bb0(%arg7: index, %arg8: tensor<?x?xf32>):
          %12 = "tensor.extract_slice"(%0, %arg3, %arg7, %2) <{operandSegmentSizes = array<i32: 1, 2, 1, 0>, static_offsets = array<i64: -9223372036854775808, -9223372036854775808>, static_sizes = array<i64: -9223372036854775808, 4>, static_strides = array<i64: 1, 1>}> : (tensor<?x?xf32>, index, index, index) -> tensor<?x4xf32>
          %13 = "tensor.extract_slice"(%arg1, %arg7, %arg5, %4) <{operandSegmentSizes = array<i32: 1, 2, 1, 0>, static_offsets = array<i64: -9223372036854775808, -9223372036854775808>, static_sizes = array<i64: 4, -9223372036854775808>, static_strides = array<i64: 1, 1>}> : (tensor<?x?xf32>, index, index, index) -> tensor<4x?xf32>
          %14 = "tensor.extract_slice"(%arg8, %arg3, %arg5, %2, %4) <{operandSegmentSizes = array<i32: 1, 2, 2, 0>, static_offsets = array<i64: -9223372036854775808, -9223372036854775808>, static_sizes = array<i64: -9223372036854775808, -9223372036854775808>, static_strides = array<i64: 1, 1>}> : (tensor<?x?xf32>, index, index, index, index) -> tensor<?x?xf32>
          %15 = "linalg.matmul"(%12, %13, %14) <{indexing_maps = [#map, #map1, #map2], operandSegmentSizes = array<i32: 2, 1>}> ({
          ^bb0(%arg9: f32, %arg10: f32, %arg11: f32):
            %17 = "arith.mulf"(%arg9, %arg10) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
            %18 = "arith.addf"(%arg11, %17) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
            "linalg.yield"(%18) : (f32) -> ()
          }) : (tensor<?x4xf32>, tensor<4x?xf32>, tensor<?x?xf32>) -> tensor<?x?xf32>
          %16 = "tensor.insert_slice"(%15, %arg8, %arg3, %arg5, %2, %4) <{operandSegmentSizes = array<i32: 1, 1, 2, 2, 0>, static_offsets = array<i64: -9223372036854775808, -9223372036854775808>, static_sizes = array<i64: -9223372036854775808, -9223372036854775808>, static_strides = array<i64: 1, 1>}> : (tensor<?x?xf32>, tensor<?x?xf32>, index, index, index, index) -> tensor<?x?xf32>
          "scf.yield"(%16) : (tensor<?x?xf32>) -> ()
        }) : (index, index, index, tensor<?x?xf32>) -> tensor<?x?xf32>
        "scf.yield"(%11) : (tensor<?x?xf32>) -> ()
      }) : (index, index, index, tensor<?x?xf32>) -> tensor<?x?xf32>
      "scf.yield"(%10) : (tensor<?x?xf32>) -> ()
    }) : (index, index, index, tensor<?x?xf32>) -> tensor<?x?xf32>
    "func.return"(%9) : (tensor<?x?xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3, d4, d5, d6) -> (d0, d1 * 2 + d4, d2 * 2 + d5, d6)>
#map1 = affine_map<(d0, d1, d2, d3, d4, d5, d6) -> (d4, d5, d6, d3)>
#map2 = affine_map<(d0, d1, d2, d3, d4, d5, d6) -> (d0, d1, d2, d3)>
#map3 = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2, d3)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1x225x225x3xf32>, tensor<3x3x3x32xf32>, tensor<1x112x112x32xf32>) -> tensor<1x112x112x32xf32>, sym_name = "conv_tensors_static"}> ({
  ^bb0(%arg0: tensor<1x225x225x3xf32>, %arg1: tensor<3x3x3x32xf32>, %arg2: tensor<1x112x112x32xf32>):
    %0 = "arith.constant"() <{value = 112 : index}> : () -> index
    %1 = "arith.constant"() <{value = 32 : index}> : () -> index
    %2 = "arith.constant"() <{value = 16 : index}> : () -> index
    %3 = "arith.constant"() <{value = 8 : index}> : () -> index
    %4 = "arith.constant"() <{value = 4 : index}> : () -> index
    %5 = "arith.constant"() <{value = 0 : index}> : () -> index
    %6 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %7 = "tensor.empty"() : () -> tensor<1x112x112x32xf32>
    %8 = "linalg.fill"(%6, %7) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg15: f32, %arg16: f32):
      "linalg.yield"(%arg15) : (f32) -> ()
    }) : (f32, tensor<1x112x112x32xf32>) -> tensor<1x112x112x32xf32>
    %9 = "linalg.conv_2d_nhwc_hwcf"(%arg0, %arg1, %8) <{dilations = dense<1> : tensor<2xi64>, operandSegmentSizes = array<i32: 2, 1>, strides = dense<2> : tensor<2xi64>}> ({
    ^bb0(%arg12: f32, %arg13: f32, %arg14: f32):
      %19 = "arith.mulf"(%arg12, %arg13) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %20 = "arith.addf"(%arg14, %19) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%20) : (f32) -> ()
    }) {linalg.memoized_indexing_maps = [#map, #map1, #map2]} : (tensor<1x225x225x3xf32>, tensor<3x3x3x32xf32>, tensor<1x112x112x32xf32>) -> tensor<1x112x112x32xf32>
    %10 = "scf.for"(%5, %0, %3, %8) ({
    ^bb0(%arg3: index, %arg4: tensor<1x112x112x32xf32>):
      %11 = "scf.for"(%5, %0, %2, %arg4) ({
      ^bb0(%arg5: index, %arg6: tensor<1x112x112x32xf32>):
        %12 = "scf.for"(%5, %1, %4, %arg6) ({
        ^bb0(%arg7: index, %arg8: tensor<1x112x112x32xf32>):
          %13 = "tensor.extract_slice"(%9, %arg3, %arg5, %arg7) <{operandSegmentSizes = array<i32: 1, 3, 0, 0>, static_offsets = array<i64: 0, -9223372036854775808, -9223372036854775808, -9223372036854775808>, static_sizes = array<i64: 1, 8, 16, 4>, static_strides = array<i64: 1, 1, 1, 1>}> : (tensor<1x112x112x32xf32>, index, index, index) -> tensor<1x8x16x4xf32>
          %14 = "tensor.extract_slice"(%arg2, %arg3, %arg5, %arg7) <{operandSegmentSizes = array<i32: 1, 3, 0, 0>, static_offsets = array<i64: 0, -9223372036854775808, -9223372036854775808, -9223372036854775808>, static_sizes = array<i64: 1, 8, 16, 4>, static_strides = array<i64: 1, 1, 1, 1>}> : (tensor<1x112x112x32xf32>, index, index, index) -> tensor<1x8x16x4xf32>
          %15 = "tensor.extract_slice"(%arg8, %arg3, %arg5, %arg7) <{operandSegmentSizes = array<i32: 1, 3, 0, 0>, static_offsets = array<i64: 0, -9223372036854775808, -9223372036854775808, -9223372036854775808>, static_sizes = array<i64: 1, 8, 16, 4>, static_strides = array<i64: 1, 1, 1, 1>}> : (tensor<1x112x112x32xf32>, index, index, index) -> tensor<1x8x16x4xf32>
          %16 = "linalg.generic"(%13, %14, %15) <{indexing_maps = [#map3, #map3, #map3], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
          ^bb0(%arg9: f32, %arg10: f32, %arg11: f32):
            %18 = "arith.addf"(%arg9, %arg10) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
            "linalg.yield"(%18) : (f32) -> ()
          }) : (tensor<1x8x16x4xf32>, tensor<1x8x16x4xf32>, tensor<1x8x16x4xf32>) -> tensor<1x8x16x4xf32>
          %17 = "tensor.insert_slice"(%16, %arg8, %arg3, %arg5, %arg7) <{operandSegmentSizes = array<i32: 1, 1, 3, 0, 0>, static_offsets = array<i64: 0, -9223372036854775808, -9223372036854775808, -9223372036854775808>, static_sizes = array<i64: 1, 8, 16, 4>, static_strides = array<i64: 1, 1, 1, 1>}> : (tensor<1x8x16x4xf32>, tensor<1x112x112x32xf32>, index, index, index) -> tensor<1x112x112x32xf32>
          "scf.yield"(%17) : (tensor<1x112x112x32xf32>) -> ()
        }) : (index, index, index, tensor<1x112x112x32xf32>) -> tensor<1x112x112x32xf32>
        "scf.yield"(%12) : (tensor<1x112x112x32xf32>) -> ()
      }) : (index, index, index, tensor<1x112x112x32xf32>) -> tensor<1x112x112x32xf32>
      "scf.yield"(%11) : (tensor<1x112x112x32xf32>) -> ()
    }) : (index, index, index, tensor<1x112x112x32xf32>) -> tensor<1x112x112x32xf32>
    "func.return"(%10) : (tensor<1x112x112x32xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3, d4, d5, d6) -> (d0, d1 * 2 + d4, d2 * 2 + d5, d6)>
#map1 = affine_map<(d0, d1, d2, d3, d4, d5, d6) -> (d4, d5, d6, d3)>
#map2 = affine_map<(d0, d1, d2, d3, d4, d5, d6) -> (d0, d1, d2, d3)>
#map3 = affine_map<(d0)[s0] -> (8, -d0 + s0)>
#map4 = affine_map<(d0)[s0] -> (16, -d0 + s0)>
#map5 = affine_map<(d0)[s0] -> (4, -d0 + s0)>
#map6 = affine_map<(d0)[s0] -> (2, -d0 + s0)>
#map7 = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2, d3)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?x?x?xf32>, tensor<?x?x?x?xf32>, tensor<?x?x?x?xf32>) -> tensor<?x?x?x?xf32>, sym_name = "conv_tensors_dynamic"}> ({
  ^bb0(%arg0: tensor<?x?x?x?xf32>, %arg1: tensor<?x?x?x?xf32>, %arg2: tensor<?x?x?x?xf32>):
    %0 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %1 = "arith.constant"() <{value = 0 : index}> : () -> index
    %2 = "arith.constant"() <{value = 1 : index}> : () -> index
    %3 = "arith.constant"() <{value = 2 : index}> : () -> index
    %4 = "arith.constant"() <{value = 3 : index}> : () -> index
    %5 = "arith.constant"() <{value = 4 : index}> : () -> index
    %6 = "arith.constant"() <{value = 8 : index}> : () -> index
    %7 = "arith.constant"() <{value = 16 : index}> : () -> index
    %8 = "tensor.dim"(%arg2, %1) : (tensor<?x?x?x?xf32>, index) -> index
    %9 = "tensor.dim"(%arg2, %2) : (tensor<?x?x?x?xf32>, index) -> index
    %10 = "tensor.dim"(%arg2, %3) : (tensor<?x?x?x?xf32>, index) -> index
    %11 = "tensor.dim"(%arg2, %4) : (tensor<?x?x?x?xf32>, index) -> index
    %12 = "tensor.empty"(%8, %9, %10, %11) : (index, index, index, index) -> tensor<?x?x?x?xf32>
    %13 = "linalg.fill"(%0, %12) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg17: f32, %arg18: f32):
      "linalg.yield"(%arg17) : (f32) -> ()
    }) : (f32, tensor<?x?x?x?xf32>) -> tensor<?x?x?x?xf32>
    %14 = "linalg.conv_2d_nhwc_hwcf"(%arg0, %arg1, %13) <{dilations = dense<1> : tensor<2xi64>, operandSegmentSizes = array<i32: 2, 1>, strides = dense<2> : tensor<2xi64>}> ({
    ^bb0(%arg14: f32, %arg15: f32, %arg16: f32):
      %29 = "arith.mulf"(%arg14, %arg15) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %30 = "arith.addf"(%arg16, %29) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%30) : (f32) -> ()
    }) {linalg.memoized_indexing_maps = [#map, #map1, #map2]} : (tensor<?x?x?x?xf32>, tensor<?x?x?x?xf32>, tensor<?x?x?x?xf32>) -> tensor<?x?x?x?xf32>
    %15 = "scf.for"(%1, %8, %6, %13) ({
    ^bb0(%arg3: index, %arg4: tensor<?x?x?x?xf32>):
      %16 = "scf.for"(%1, %9, %7, %arg4) ({
      ^bb0(%arg5: index, %arg6: tensor<?x?x?x?xf32>):
        %17 = "scf.for"(%1, %10, %5, %arg6) ({
        ^bb0(%arg7: index, %arg8: tensor<?x?x?x?xf32>):
          %18 = "scf.for"(%1, %11, %3, %arg8) ({
          ^bb0(%arg9: index, %arg10: tensor<?x?x?x?xf32>):
            %19 = "affine.min"(%arg3, %8) <{map = #map3}> : (index, index) -> index
            %20 = "affine.min"(%arg5, %9) <{map = #map4}> : (index, index) -> index
            %21 = "affine.min"(%arg7, %10) <{map = #map5}> : (index, index) -> index
            %22 = "affine.min"(%arg7, %11) <{map = #map6}> : (index, index) -> index
            %23 = "tensor.extract_slice"(%14, %arg3, %arg5, %arg7, %arg9, %19, %20, %21, %22) <{operandSegmentSizes = array<i32: 1, 4, 4, 0>, static_offsets = array<i64: -9223372036854775808, -9223372036854775808, -9223372036854775808, -9223372036854775808>, static_sizes = array<i64: -9223372036854775808, -9223372036854775808, -9223372036854775808, -9223372036854775808>, static_strides = array<i64: 1, 1, 1, 1>}> : (tensor<?x?x?x?xf32>, index, index, index, index, index, index, index, index) -> tensor<?x?x?x?xf32>
            %24 = "tensor.extract_slice"(%arg2, %arg3, %arg5, %arg7, %arg9, %19, %20, %21, %22) <{operandSegmentSizes = array<i32: 1, 4, 4, 0>, static_offsets = array<i64: -9223372036854775808, -9223372036854775808, -9223372036854775808, -9223372036854775808>, static_sizes = array<i64: -9223372036854775808, -9223372036854775808, -9223372036854775808, -9223372036854775808>, static_strides = array<i64: 1, 1, 1, 1>}> : (tensor<?x?x?x?xf32>, index, index, index, index, index, index, index, index) -> tensor<?x?x?x?xf32>
            %25 = "tensor.extract_slice"(%arg10, %arg3, %arg5, %arg7, %arg9, %19, %20, %21, %22) <{operandSegmentSizes = array<i32: 1, 4, 4, 0>, static_offsets = array<i64: -9223372036854775808, -9223372036854775808, -9223372036854775808, -9223372036854775808>, static_sizes = array<i64: -9223372036854775808, -9223372036854775808, -9223372036854775808, -9223372036854775808>, static_strides = array<i64: 1, 1, 1, 1>}> : (tensor<?x?x?x?xf32>, index, index, index, index, index, index, index, index) -> tensor<?x?x?x?xf32>
            %26 = "linalg.generic"(%23, %24, %25) <{indexing_maps = [#map7, #map7, #map7], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
            ^bb0(%arg11: f32, %arg12: f32, %arg13: f32):
              %28 = "arith.addf"(%arg11, %arg12) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
              "linalg.yield"(%28) : (f32) -> ()
            }) : (tensor<?x?x?x?xf32>, tensor<?x?x?x?xf32>, tensor<?x?x?x?xf32>) -> tensor<?x?x?x?xf32>
            %27 = "tensor.insert_slice"(%26, %arg10, %arg3, %arg5, %arg7, %arg9, %19, %20, %21, %22) <{operandSegmentSizes = array<i32: 1, 1, 4, 4, 0>, static_offsets = array<i64: -9223372036854775808, -9223372036854775808, -9223372036854775808, -9223372036854775808>, static_sizes = array<i64: -9223372036854775808, -9223372036854775808, -9223372036854775808, -9223372036854775808>, static_strides = array<i64: 1, 1, 1, 1>}> : (tensor<?x?x?x?xf32>, tensor<?x?x?x?xf32>, index, index, index, index, index, index, index, index) -> tensor<?x?x?x?xf32>
            "scf.yield"(%27) : (tensor<?x?x?x?xf32>) -> ()
          }) : (index, index, index, tensor<?x?x?x?xf32>) -> tensor<?x?x?x?xf32>
          "scf.yield"(%18) : (tensor<?x?x?x?xf32>) -> ()
        }) : (index, index, index, tensor<?x?x?x?xf32>) -> tensor<?x?x?x?xf32>
        "scf.yield"(%17) : (tensor<?x?x?x?xf32>) -> ()
      }) : (index, index, index, tensor<?x?x?x?xf32>) -> tensor<?x?x?x?xf32>
      "scf.yield"(%16) : (tensor<?x?x?x?xf32>) -> ()
    }) : (index, index, index, tensor<?x?x?x?xf32>) -> tensor<?x?x?x?xf32>
    "func.return"(%15) : (tensor<?x?x?x?xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<58x1xf32>, tensor<64x128xf32>) -> tensor<64x128xf32>, sym_name = "pad_generic_static"}> ({
  ^bb0(%arg0: tensor<58x1xf32>, %arg1: tensor<64x128xf32>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index
    %2 = "arith.constant"() <{value = 16 : index}> : () -> index
    %3 = "arith.constant"() <{value = 32 : index}> : () -> index
    %4 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %5 = "tensor.dim"(%arg1, %0) : (tensor<64x128xf32>, index) -> index
    %6 = "tensor.dim"(%arg1, %1) : (tensor<64x128xf32>, index) -> index
    %7 = "tensor.pad"(%arg0) <{operandSegmentSizes = array<i32: 1, 0, 0>, static_high = array<i64: 2, 67>, static_low = array<i64: 4, 60>}> ({
    ^bb0(%arg11: index, %arg12: index):
      "tensor.yield"(%4) : (f32) -> ()
    }) : (tensor<58x1xf32>) -> tensor<64x128xf32>
    %8 = "linalg.fill"(%4, %arg1) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg9: f32, %arg10: f32):
      "linalg.yield"(%arg9) : (f32) -> ()
    }) : (f32, tensor<64x128xf32>) -> tensor<64x128xf32>
    %9 = "scf.for"(%0, %5, %2, %8) ({
    ^bb0(%arg2: index, %arg3: tensor<64x128xf32>):
      %10 = "scf.for"(%0, %6, %3, %arg3) ({
      ^bb0(%arg4: index, %arg5: tensor<64x128xf32>):
        %11 = "tensor.extract_slice"(%7, %arg2, %arg4) <{operandSegmentSizes = array<i32: 1, 2, 0, 0>, static_offsets = array<i64: -9223372036854775808, -9223372036854775808>, static_sizes = array<i64: 16, 32>, static_strides = array<i64: 1, 1>}> : (tensor<64x128xf32>, index, index) -> tensor<16x32xf32>
        %12 = "tensor.extract_slice"(%arg1, %arg2, %arg4) <{operandSegmentSizes = array<i32: 1, 2, 0, 0>, static_offsets = array<i64: -9223372036854775808, -9223372036854775808>, static_sizes = array<i64: 16, 32>, static_strides = array<i64: 1, 1>}> : (tensor<64x128xf32>, index, index) -> tensor<16x32xf32>
        %13 = "tensor.extract_slice"(%arg5, %arg2, %arg4) <{operandSegmentSizes = array<i32: 1, 2, 0, 0>, static_offsets = array<i64: -9223372036854775808, -9223372036854775808>, static_sizes = array<i64: 16, 32>, static_strides = array<i64: 1, 1>}> : (tensor<64x128xf32>, index, index) -> tensor<16x32xf32>
        %14 = "linalg.generic"(%11, %12, %13) <{indexing_maps = [#map, #map, #map], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
        ^bb0(%arg6: f32, %arg7: f32, %arg8: f32):
          %16 = "arith.addf"(%arg6, %arg7) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
          "linalg.yield"(%16) : (f32) -> ()
        }) : (tensor<16x32xf32>, tensor<16x32xf32>, tensor<16x32xf32>) -> tensor<16x32xf32>
        %15 = "tensor.insert_slice"(%14, %arg5, %arg2, %arg4) <{operandSegmentSizes = array<i32: 1, 1, 2, 0, 0>, static_offsets = array<i64: -9223372036854775808, -9223372036854775808>, static_sizes = array<i64: 16, 32>, static_strides = array<i64: 1, 1>}> : (tensor<16x32xf32>, tensor<64x128xf32>, index, index) -> tensor<64x128xf32>
        "scf.yield"(%15) : (tensor<64x128xf32>) -> ()
      }) : (index, index, index, tensor<64x128xf32>) -> tensor<64x128xf32>
      "scf.yield"(%10) : (tensor<64x128xf32>) -> ()
    }) : (index, index, index, tensor<64x128xf32>) -> tensor<64x128xf32>
    "func.return"(%9) : (tensor<64x128xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d0, d1, d3)>
#map1 = affine_map<(d0, d1, d2, d3) -> (d0, d3, d2)>
#map2 = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2)>
#map3 = affine_map<(d0, d1, d2) -> (d0, d2)>
#map4 = affine_map<(d0, d1, d2) -> (d2, d1)>
#map5 = affine_map<(d0, d1, d2) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1x6x5xf32>, tensor<1x5x6xf32>, tensor<4x6xf32>, tensor<1x6x6xf32>, tensor<4x6xf32>, tensor<4x2xf32>) -> tensor<4x6xf32>, sym_name = "rank_reduced_extract_slice"}> ({
  ^bb0(%arg0: tensor<1x6x5xf32>, %arg1: tensor<1x5x6xf32>, %arg2: tensor<4x6xf32>, %arg3: tensor<1x6x6xf32>, %arg4: tensor<4x6xf32>, %arg5: tensor<4x2xf32>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 2 : index}> : () -> index
    %2 = "arith.constant"() <{value = 6 : index}> : () -> index
    %3 = "linalg.generic"(%arg0, %arg1, %arg3) <{indexing_maps = [#map, #map1, #map2], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<reduction>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg11: f32, %arg12: f32, %arg13: f32):
      %10 = "arith.mulf"(%arg11, %arg12) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %11 = "arith.addf"(%arg13, %10) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%11) : (f32) -> ()
    }) : (tensor<1x6x5xf32>, tensor<1x5x6xf32>, tensor<1x6x6xf32>) -> tensor<1x6x6xf32>
    %4 = "scf.for"(%0, %2, %1, %arg4) ({
    ^bb0(%arg6: index, %arg7: tensor<4x6xf32>):
      %5 = "tensor.extract_slice"(%3, %arg6) <{operandSegmentSizes = array<i32: 1, 1, 0, 0>, static_offsets = array<i64: 0, 0, -9223372036854775808>, static_sizes = array<i64: 1, 6, 2>, static_strides = array<i64: 1, 1, 1>}> : (tensor<1x6x6xf32>, index) -> tensor<6x2xf32>
      %6 = "linalg.generic"(%arg2, %5, %arg5) <{indexing_maps = [#map3, #map4, #map5], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<reduction>], operandSegmentSizes = array<i32: 2, 1>}> ({
      ^bb0(%arg8: f32, %arg9: f32, %arg10: f32):
        %8 = "arith.mulf"(%arg8, %arg9) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
        %9 = "arith.addf"(%arg10, %8) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
        "linalg.yield"(%9) : (f32) -> ()
      }) : (tensor<4x6xf32>, tensor<6x2xf32>, tensor<4x2xf32>) -> tensor<4x2xf32>
      %7 = "tensor.insert_slice"(%6, %arg7, %arg6) <{operandSegmentSizes = array<i32: 1, 1, 1, 0, 0>, static_offsets = array<i64: 0, -9223372036854775808>, static_sizes = array<i64: 4, 2>, static_strides = array<i64: 1, 1>}> : (tensor<4x2xf32>, tensor<4x6xf32>, index) -> tensor<4x6xf32>
      "scf.yield"(%7) : (tensor<4x6xf32>) -> ()
    }) : (index, index, index, tensor<4x6xf32>) -> tensor<4x6xf32>
    "func.return"(%4) : (tensor<4x6xf32>) -> ()
  }) : () -> ()
}) : () -> ()

