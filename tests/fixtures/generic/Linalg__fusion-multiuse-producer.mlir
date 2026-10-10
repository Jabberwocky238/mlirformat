#map = affine_map<(d0, d1) -> (d0, d1)>
#map1 = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2, d3)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?xf32>, tensor<?x?xf32>, tensor<?x?xf32>, tensor<?x?xf32>, tensor<?x?xf32>) -> (tensor<?x?xf32>, tensor<?x?xf32>, tensor<?x?xf32>), sym_name = "multi_use_producer"}> ({
  ^bb0(%arg13: tensor<?x?xf32>, %arg14: tensor<?x?xf32>, %arg15: tensor<?x?xf32>, %arg16: tensor<?x?xf32>, %arg17: tensor<?x?xf32>):
    %12:2 = "linalg.generic"(%arg13, %arg14, %arg15) <{indexing_maps = [#map, #map, #map], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 2>}> ({
    ^bb0(%arg21: f32, %arg22: f32, %arg23: f32):
      %15 = "arith.addf"(%arg21, %arg22) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%15, %15) : (f32, f32) -> ()
    }) : (tensor<?x?xf32>, tensor<?x?xf32>, tensor<?x?xf32>) -> (tensor<?x?xf32>, tensor<?x?xf32>)
    %13 = "linalg.generic"(%12#1, %arg16, %arg17) <{indexing_maps = [#map, #map, #map], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg18: f32, %arg19: f32, %arg20: f32):
      %14 = "arith.mulf"(%arg18, %arg19) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%14) : (f32) -> ()
    }) : (tensor<?x?xf32>, tensor<?x?xf32>, tensor<?x?xf32>) -> tensor<?x?xf32>
    "func.return"(%12#0, %12#1, %13) : (tensor<?x?xf32>, tensor<?x?xf32>, tensor<?x?xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<1x32x32x8xf32>) -> tensor<1x32x32x8xf32>, sym_name = "multi_use_producer_2"}> ({
  ^bb0(%arg0: tensor<1x32x32x8xf32>):
    %0 = "llvm.mlir.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %1 = "llvm.mlir.constant"() <{value = 31 : index}> : () -> i64
    %2 = "tensor.empty"() : () -> tensor<1x32x32x8xf32>
    %3 = "tensor.empty"() : () -> tensor<1x32x32x8xindex>
    %4:2 = "linalg.generic"(%arg0, %2, %3) <{indexing_maps = [#map1, #map1, #map1], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 2>}> ({
    ^bb0(%arg10: f32, %arg11: f32, %arg12: index):
      %11 = "linalg.index"() <{dim = 1 : i64}> : () -> index
      "linalg.yield"(%0, %11) : (f32, index) -> ()
    }) : (tensor<1x32x32x8xf32>, tensor<1x32x32x8xf32>, tensor<1x32x32x8xindex>) -> (tensor<1x32x32x8xf32>, tensor<1x32x32x8xindex>)
    %5 = "tensor.empty"() : () -> tensor<1x32x32x8xi64>
    %6:2 = "linalg.generic"(%arg0, %4#1, %2, %5) <{indexing_maps = [#map1, #map1, #map1, #map1], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 2>}> ({
    ^bb0(%arg6: f32, %arg7: index, %arg8: f32, %arg9: i64):
      %10 = "builtin.unrealized_conversion_cast"(%arg7) : (index) -> i64
      "linalg.yield"(%0, %10) : (f32, i64) -> ()
    }) : (tensor<1x32x32x8xf32>, tensor<1x32x32x8xindex>, tensor<1x32x32x8xf32>, tensor<1x32x32x8xi64>) -> (tensor<1x32x32x8xf32>, tensor<1x32x32x8xi64>)
    %7 = "tensor.empty"() : () -> tensor<1x32x32x8xi64>
    %8:2 = "linalg.generic"(%arg0, %4#1, %6#1, %2, %7) <{indexing_maps = [#map1, #map1, #map1, #map1, #map1], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 3, 2>}> ({
    ^bb0(%arg1: f32, %arg2: index, %arg3: i64, %arg4: f32, %arg5: i64):
      %9 = "llvm.sub"(%1, %arg3) <{overflowFlags = 0 : i32}> : (i64, i64) -> i64
      "linalg.yield"(%0, %9) : (f32, i64) -> ()
    }) : (tensor<1x32x32x8xf32>, tensor<1x32x32x8xindex>, tensor<1x32x32x8xi64>, tensor<1x32x32x8xf32>, tensor<1x32x32x8xi64>) -> (tensor<1x32x32x8xf32>, tensor<1x32x32x8xi64>)
    "func.return"(%8#0) : (tensor<1x32x32x8xf32>) -> ()
  }) {llvm.emit_c_interface} : () -> ()
}) : () -> ()

