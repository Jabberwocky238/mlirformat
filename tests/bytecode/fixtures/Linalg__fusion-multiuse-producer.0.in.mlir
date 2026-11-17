"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?xf32>, tensor<?x?xf32>, tensor<?x?xf32>, tensor<?x?xf32>, tensor<?x?xf32>) -> (tensor<?x?xf32>, tensor<?x?xf32>, tensor<?x?xf32>), sym_name = "multi_use_producer"}> ({
  ^bb0(%arg13: tensor<?x?xf32> loc("<stdin>":5:8), %arg14: tensor<?x?xf32> loc("<stdin>":5:33), %arg15: tensor<?x?xf32> loc("<stdin>":5:58), %arg16: tensor<?x?xf32> loc("<stdin>":5:83), %arg17: tensor<?x?xf32> loc("<stdin>":5:108)):
    %12:2 = "linalg.generic"(%arg13, %arg14, %arg15) <{indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 2>}> ({
    ^bb0(%arg21: f32 loc("<stdin>":7:10), %arg22: f32 loc("<stdin>":7:23), %arg23: f32 loc("<stdin>":7:36)):
      %15 = "arith.addf"(%arg21, %arg22) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":8:13)
      "linalg.yield"(%15, %15) : (f32, f32) -> () loc("<stdin>":9:7)
    }) : (tensor<?x?xf32>, tensor<?x?xf32>, tensor<?x?xf32>) -> (tensor<?x?xf32>, tensor<?x?xf32>) loc("<stdin>":6:13)
    %13 = "linalg.generic"(%12#1, %arg16, %arg17) <{indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg18: f32 loc("<stdin>":12:10), %arg19: f32 loc("<stdin>":12:23), %arg20: f32 loc("<stdin>":12:36)):
      %14 = "arith.mulf"(%arg18, %arg19) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":13:13)
      "linalg.yield"(%14) : (f32) -> () loc("<stdin>":14:7)
    }) : (tensor<?x?xf32>, tensor<?x?xf32>, tensor<?x?xf32>) -> tensor<?x?xf32> loc("<stdin>":11:11)
    "func.return"(%12#0, %12#1, %13) : (tensor<?x?xf32>, tensor<?x?xf32>, tensor<?x?xf32>) -> () loc("<stdin>":16:5)
  }) : () -> () loc("<stdin>":4:3)
  "func.func"() <{function_type = (tensor<1x32x32x8xf32>) -> tensor<1x32x32x8xf32>, sym_name = "multi_use_producer_2"}> ({
  ^bb0(%arg0: tensor<1x32x32x8xf32> loc("<stdin>":19:8)):
    %0 = "llvm.mlir.constant"() <{value = 0.000000e+00 : f32}> : () -> f32 loc("<stdin>":20:10)
    %1 = "llvm.mlir.constant"() <{value = 31 : index}> : () -> i64 loc("<stdin>":21:10)
    %2 = "tensor.empty"() : () -> tensor<1x32x32x8xf32> loc("<stdin>":22:10)
    %3 = "tensor.empty"() : () -> tensor<1x32x32x8xindex> loc("<stdin>":23:10)
    %4:2 = "linalg.generic"(%arg0, %2, %3) <{indexing_maps = [affine_map<(d0, d1, d2, d3) -> (d0, d1, d2, d3)>, affine_map<(d0, d1, d2, d3) -> (d0, d1, d2, d3)>, affine_map<(d0, d1, d2, d3) -> (d0, d1, d2, d3)>], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 2>}> ({
    ^bb0(%arg10: f32 loc("<stdin>":25:10), %arg11: f32 loc("<stdin>":25:23), %arg12: index loc("<stdin>":25:36)):
      %11 = "linalg.index"() <{dim = 1 : i64}> : () -> index loc("<stdin>":26:13)
      "linalg.yield"(%0, %11) : (f32, index) -> () loc("<stdin>":27:7)
    }) : (tensor<1x32x32x8xf32>, tensor<1x32x32x8xf32>, tensor<1x32x32x8xindex>) -> (tensor<1x32x32x8xf32>, tensor<1x32x32x8xindex>) loc("<stdin>":24:12)
    %5 = "tensor.empty"() : () -> tensor<1x32x32x8xi64> loc("<stdin>":29:10)
    %6:2 = "linalg.generic"(%arg0, %4#1, %2, %5) <{indexing_maps = [affine_map<(d0, d1, d2, d3) -> (d0, d1, d2, d3)>, affine_map<(d0, d1, d2, d3) -> (d0, d1, d2, d3)>, affine_map<(d0, d1, d2, d3) -> (d0, d1, d2, d3)>, affine_map<(d0, d1, d2, d3) -> (d0, d1, d2, d3)>], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 2>}> ({
    ^bb0(%arg6: f32 loc("<stdin>":31:10), %arg7: index loc("<stdin>":31:22), %arg8: f32 loc("<stdin>":31:36), %arg9: i64 loc("<stdin>":31:48)):
      %10 = "builtin.unrealized_conversion_cast"(%arg7) : (index) -> i64 loc("<stdin>":32:13)
      "linalg.yield"(%0, %10) : (f32, i64) -> () loc("<stdin>":33:7)
    }) : (tensor<1x32x32x8xf32>, tensor<1x32x32x8xindex>, tensor<1x32x32x8xf32>, tensor<1x32x32x8xi64>) -> (tensor<1x32x32x8xf32>, tensor<1x32x32x8xi64>) loc("<stdin>":30:12)
    %7 = "tensor.empty"() : () -> tensor<1x32x32x8xi64> loc("<stdin>":35:10)
    %8:2 = "linalg.generic"(%arg0, %4#1, %6#1, %2, %7) <{indexing_maps = [affine_map<(d0, d1, d2, d3) -> (d0, d1, d2, d3)>, affine_map<(d0, d1, d2, d3) -> (d0, d1, d2, d3)>, affine_map<(d0, d1, d2, d3) -> (d0, d1, d2, d3)>, affine_map<(d0, d1, d2, d3) -> (d0, d1, d2, d3)>, affine_map<(d0, d1, d2, d3) -> (d0, d1, d2, d3)>], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 3, 2>}> ({
    ^bb0(%arg1: f32 loc("<stdin>":37:10), %arg2: index loc("<stdin>":37:22), %arg3: i64 loc("<stdin>":37:36), %arg4: f32 loc("<stdin>":37:48), %arg5: i64 loc("<stdin>":37:60)):
      %9 = "llvm.sub"(%1, %arg3) <{overflowFlags = 0 : i32}> : (i64, i64) -> i64 loc("<stdin>":38:12)
      "linalg.yield"(%0, %9) : (f32, i64) -> () loc("<stdin>":39:7)
    }) : (tensor<1x32x32x8xf32>, tensor<1x32x32x8xindex>, tensor<1x32x32x8xi64>, tensor<1x32x32x8xf32>, tensor<1x32x32x8xi64>) -> (tensor<1x32x32x8xf32>, tensor<1x32x32x8xi64>) loc("<stdin>":36:12)
    "func.return"(%8#0) : (tensor<1x32x32x8xf32>) -> () loc("<stdin>":41:5)
  }) {llvm.emit_c_interface} : () -> () loc("<stdin>":18:3)
}) : () -> () loc("<stdin>":3:1)
