"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?xf32>, tensor<?xf32>, index, index, index, index) -> tensor<?x?xf32>, sym_name = "dynamic"}> ({
  ^bb0(%arg30: tensor<?x?xf32> loc("<stdin>":11:8), %arg31: tensor<?xf32> loc("<stdin>":11:33), %arg32: index loc("<stdin>":11:56), %arg33: index loc("<stdin>":11:71), %arg34: index loc("<stdin>":11:86), %arg35: index loc("<stdin>":11:101)):
    %36 = "linalg.generic"(%arg30, %arg31, %arg30) <{indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d1)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg36: f32 loc("<stdin>":13:10), %arg37: f32 loc("<stdin>":13:23), %arg38: f32 loc("<stdin>":13:36)):
      %38 = "arith.addf"(%arg36, %arg37) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":14:13)
      "linalg.yield"(%38) : (f32) -> () loc("<stdin>":15:7)
    }) : (tensor<?x?xf32>, tensor<?xf32>, tensor<?x?xf32>) -> tensor<?x?xf32> loc("<stdin>":12:11)
    %37 = "tensor.extract_slice"(%36, %arg32, %arg33, %arg34, %arg35) <{operandSegmentSizes = array<i32: 1, 2, 2, 0>, static_offsets = array<i64: -9223372036854775808, -9223372036854775808>, static_sizes = array<i64: -9223372036854775808, -9223372036854775808>, static_strides = array<i64: 1, 1>}> : (tensor<?x?xf32>, index, index, index, index) -> tensor<?x?xf32> loc("<stdin>":17:11)
    "func.return"(%37) : (tensor<?x?xf32>) -> () loc("<stdin>":18:5)
  }) : () -> () loc("<stdin>":10:3)
  "func.func"() <{function_type = (tensor<16x8xf32>, tensor<8xf32>) -> tensor<4x2xf32>, sym_name = "static"}> ({
  ^bb0(%arg25: tensor<16x8xf32> loc("<stdin>":21:8), %arg26: tensor<8xf32> loc("<stdin>":21:34)):
    %33 = "linalg.generic"(%arg25, %arg26, %arg25) <{indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d1)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg27: f32 loc("<stdin>":23:10), %arg28: f32 loc("<stdin>":23:23), %arg29: f32 loc("<stdin>":23:36)):
      %35 = "arith.addf"(%arg27, %arg28) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":24:13)
      "linalg.yield"(%35) : (f32) -> () loc("<stdin>":25:7)
    }) : (tensor<16x8xf32>, tensor<8xf32>, tensor<16x8xf32>) -> tensor<16x8xf32> loc("<stdin>":22:11)
    %34 = "tensor.extract_slice"(%33) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_offsets = array<i64: 8, 4>, static_sizes = array<i64: 4, 2>, static_strides = array<i64: 1, 1>}> : (tensor<16x8xf32>) -> tensor<4x2xf32> loc("<stdin>":27:11)
    "func.return"(%34) : (tensor<4x2xf32>) -> () loc("<stdin>":28:5)
  }) : () -> () loc("<stdin>":20:3)
  "func.func"() <{function_type = (tensor<?x8xf32>, tensor<8xf32>, index, index) -> tensor<?x2xf32>, sym_name = "mixed"}> ({
  ^bb0(%arg18: tensor<?x8xf32> loc("<stdin>":31:8), %arg19: tensor<8xf32> loc("<stdin>":31:33), %arg20: index loc("<stdin>":31:56), %arg21: index loc("<stdin>":31:71)):
    %30 = "linalg.generic"(%arg18, %arg19, %arg18) <{indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d1)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg22: f32 loc("<stdin>":33:10), %arg23: f32 loc("<stdin>":33:23), %arg24: f32 loc("<stdin>":33:36)):
      %32 = "arith.addf"(%arg22, %arg23) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":34:13)
      "linalg.yield"(%32) : (f32) -> () loc("<stdin>":35:7)
    }) : (tensor<?x8xf32>, tensor<8xf32>, tensor<?x8xf32>) -> tensor<?x8xf32> loc("<stdin>":32:11)
    %31 = "tensor.extract_slice"(%30, %arg20, %arg21) <{operandSegmentSizes = array<i32: 1, 1, 1, 0>, static_offsets = array<i64: 8, -9223372036854775808>, static_sizes = array<i64: -9223372036854775808, 2>, static_strides = array<i64: 1, 1>}> : (tensor<?x8xf32>, index, index) -> tensor<?x2xf32> loc("<stdin>":37:11)
    "func.return"(%31) : (tensor<?x2xf32>) -> () loc("<stdin>":38:5)
  }) : () -> () loc("<stdin>":30:3)
  "func.func"() <{function_type = (tensor<?x?xf32>, tensor<?xf32>) -> tensor<4x2xf32>, sym_name = "dynamic_to_static"}> ({
  ^bb0(%arg13: tensor<?x?xf32> loc("<stdin>":41:8), %arg14: tensor<?xf32> loc("<stdin>":41:33)):
    %27 = "linalg.generic"(%arg13, %arg14, %arg13) <{indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d1)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg15: f32 loc("<stdin>":43:10), %arg16: f32 loc("<stdin>":43:23), %arg17: f32 loc("<stdin>":43:36)):
      %29 = "arith.addf"(%arg15, %arg16) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":44:13)
      "linalg.yield"(%29) : (f32) -> () loc("<stdin>":45:7)
    }) : (tensor<?x?xf32>, tensor<?xf32>, tensor<?x?xf32>) -> tensor<?x?xf32> loc("<stdin>":42:11)
    %28 = "tensor.extract_slice"(%27) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_offsets = array<i64: 8, 4>, static_sizes = array<i64: 4, 2>, static_strides = array<i64: 1, 1>}> : (tensor<?x?xf32>) -> tensor<4x2xf32> loc("<stdin>":47:11)
    "func.return"(%28) : (tensor<4x2xf32>) -> () loc("<stdin>":48:5)
  }) : () -> () loc("<stdin>":40:3)
  "func.func"() <{function_type = () -> tensor<2x2xf32>, sym_name = "matmul_slice"}> ({
    %20 = "arith.constant"() <{value = dense<1.000000e+00> : tensor<4x4xf32>}> : () -> tensor<4x4xf32> loc("<stdin>":51:11)
    %21 = "arith.constant"() <{value = dense<1.000000e+00> : tensor<4x4xf32>}> : () -> tensor<4x4xf32> loc("<stdin>":52:11)
    %22 = "arith.constant"() <{value = dense<[[0.000000e+00, 1.000000e+00, 2.000000e+00, 3.000000e+00], [4.000000e+00, 5.000000e+00, 6.000000e+00, 7.000000e+00], [8.000000e+00, 9.000000e+00, 1.000000e+01, 1.100000e+01], [1.200000e+01, 1.300000e+01, 1.400000e+01, 1.500000e+01]]> : tensor<4x4xf32>}> : () -> tensor<4x4xf32> loc("<stdin>":53:11)
    %23 = "linalg.matmul"(%20, %21, %22) <{indexing_maps = [affine_map<(d0, d1, d2) -> (d0, d2)>, affine_map<(d0, d1, d2) -> (d2, d1)>, affine_map<(d0, d1, d2) -> (d0, d1)>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg10: f32 loc("<stdin>":55:10), %arg11: f32 loc("<stdin>":55:23), %arg12: f32 loc("<stdin>":55:36)):
      %25 = "arith.mulf"(%arg10, %arg11) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":56:13)
      %26 = "arith.addf"(%arg12, %25) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":57:13)
      "linalg.yield"(%26) : (f32) -> () loc("<stdin>":58:7)
    }) : (tensor<4x4xf32>, tensor<4x4xf32>, tensor<4x4xf32>) -> tensor<4x4xf32> loc("<stdin>":54:11)
    %24 = "tensor.extract_slice"(%23) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_offsets = array<i64: 1, 1>, static_sizes = array<i64: 2, 2>, static_strides = array<i64: 1, 1>}> : (tensor<4x4xf32>) -> tensor<2x2xf32> loc("<stdin>":60:11)
    "func.return"(%24) : (tensor<2x2xf32>) -> () loc("<stdin>":61:5)
  }) : () -> () loc("<stdin>":50:3)
  "func.func"() <{function_type = (tensor<1x225x225x3xf32>, tensor<3x3x3x32xf32>) -> tensor<1x32x32x16xf32>, sym_name = "conv_slice"}> ({
  ^bb0(%arg3: tensor<1x225x225x3xf32> loc("<stdin>":64:8), %arg4: tensor<3x3x3x32xf32> loc("<stdin>":64:40)):
    %7 = "arith.constant"() <{value = 112 : index}> : () -> index loc("<stdin>":65:10)
    %8 = "arith.constant"() <{value = 32 : index}> : () -> index loc("<stdin>":66:10)
    %9 = "arith.constant"() <{value = 16 : index}> : () -> index loc("<stdin>":67:10)
    %10 = "arith.constant"() <{value = 8 : index}> : () -> index loc("<stdin>":68:11)
    %11 = "arith.constant"() <{value = 4 : index}> : () -> index loc("<stdin>":69:11)
    %12 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":70:11)
    %13 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32 loc("<stdin>":71:11)
    %14 = "tensor.empty"() : () -> tensor<1x112x112x32xf32> loc("<stdin>":72:11)
    %15 = "linalg.fill"(%13, %14) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg8: f32 loc("<stdin>":74:10), %arg9: f32 loc("<stdin>":74:22)):
      "linalg.yield"(%arg8) : (f32) -> () loc("<stdin>":75:7)
    }) : (f32, tensor<1x112x112x32xf32>) -> tensor<1x112x112x32xf32> loc("<stdin>":73:11)
    %16 = "linalg.conv_2d_nhwc_hwcf"(%arg3, %arg4, %15) <{dilations = dense<1> : tensor<2xi64>, operandSegmentSizes = array<i32: 2, 1>, strides = dense<2> : tensor<2xi64>}> ({
    ^bb0(%arg5: f32 loc("<stdin>":78:10), %arg6: f32 loc("<stdin>":78:22), %arg7: f32 loc("<stdin>":78:34)):
      %18 = "arith.mulf"(%arg5, %arg6) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":79:13)
      %19 = "arith.addf"(%arg7, %18) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":80:13)
      "linalg.yield"(%19) : (f32) -> () loc("<stdin>":81:7)
    }) {linalg.memoized_indexing_maps = [affine_map<(d0, d1, d2, d3, d4, d5, d6) -> (d0, d1 * 2 + d4, d2 * 2 + d5, d6)>, affine_map<(d0, d1, d2, d3, d4, d5, d6) -> (d4, d5, d6, d3)>, affine_map<(d0, d1, d2, d3, d4, d5, d6) -> (d0, d1, d2, d3)>]} : (tensor<1x225x225x3xf32>, tensor<3x3x3x32xf32>, tensor<1x112x112x32xf32>) -> tensor<1x112x112x32xf32> loc("<stdin>":77:11)
    %17 = "tensor.extract_slice"(%16) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_offsets = array<i64: 0, 64, 64, 16>, static_sizes = array<i64: 1, 32, 32, 16>, static_strides = array<i64: 1, 1, 1, 1>}> : (tensor<1x112x112x32xf32>) -> tensor<1x32x32x16xf32> loc("<stdin>":83:11)
    "func.return"(%17) : (tensor<1x32x32x16xf32>) -> () loc("<stdin>":84:5)
  }) : () -> () loc("<stdin>":63:3)
  "func.func"() <{function_type = (index) -> tensor<1x1x1x?xf32>, sym_name = "rank_reducing_slice"}> ({
  ^bb0(%arg0: index loc("<stdin>":87:8)):
    %0 = "arith.constant"() <{value = 1.000000e+00 : f32}> : () -> f32 loc("<stdin>":88:10)
    %1 = "tensor.empty"(%arg0) : (index) -> tensor<1x?xf32> loc("<stdin>":89:10)
    %2 = "linalg.fill"(%0, %1) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg1: f32 loc("<stdin>":91:10), %arg2: f32 loc("<stdin>":91:22)):
      "linalg.yield"(%arg1) : (f32) -> () loc("<stdin>":92:7)
    }) : (f32, tensor<1x?xf32>) -> tensor<1x?xf32> loc("<stdin>":90:10)
    %3 = "tensor.extract_slice"(%2, %arg0) <{operandSegmentSizes = array<i32: 1, 0, 1, 0>, static_offsets = array<i64: 0, 0>, static_sizes = array<i64: 1, -9223372036854775808>, static_strides = array<i64: 1, 1>}> : (tensor<1x?xf32>, index) -> tensor<?xf32> loc("<stdin>":94:10)
    %4 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":95:10)
    %5 = "tensor.dim"(%3, %4) : (tensor<?xf32>, index) -> index loc("<stdin>":96:10)
    %6 = "tensor.expand_shape"(%3, %5) <{reassociation = [[0, 1, 2, 3]], static_output_shape = array<i64: 1, 1, 1, -9223372036854775808>}> : (tensor<?xf32>, index) -> tensor<1x1x1x?xf32> loc("<stdin>":97:10)
    "func.return"(%6) : (tensor<1x1x1x?xf32>) -> () loc("<stdin>":98:5)
  }) : () -> () loc("<stdin>":86:3)
}) : () -> () loc("<stdin>":9:1)
