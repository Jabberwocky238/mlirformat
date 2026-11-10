#map = affine_map<(d0) -> (d0)>
#map1 = affine_map<(d0, d1) -> (d0, d1)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d2)>
#map3 = affine_map<(d0, d1, d2) -> (d2, d1)>
#map4 = affine_map<(d0, d1, d2) -> (d0, d1)>
#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>
#sparse1 = #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>
#sparse2 = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed), posWidth = 64, crdWidth = 64 }>
"builtin.module"() ({
  "func.func"() <{function_type = () -> tensor<20x40xf32, #sparse>, sym_name = "bufferization_alloc_tensor"}> ({
    %15 = "bufferization.alloc_tensor"() <{operandSegmentSizes = array<i32: 0, 0, 0>}> : () -> tensor<20x40xf32, #sparse>
    %16 = "sparse_tensor.load"(%15) : (tensor<20x40xf32, #sparse>) -> tensor<20x40xf32, #sparse>
    "func.return"(%16) : (tensor<20x40xf32, #sparse>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (!llvm.ptr) -> tensor<20x40xf32, #sparse>, sym_name = "sparse_tensor_new"}> ({
  ^bb0(%arg15: !llvm.ptr):
    %14 = "sparse_tensor.new"(%arg15) : (!llvm.ptr) -> tensor<20x40xf32, #sparse>
    "func.return"(%14) : (tensor<20x40xf32, #sparse>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<20x40xf32>) -> tensor<20x40xf32, #sparse>, sym_name = "sparse_tensor_new_from_tensor"}> ({
  ^bb0(%arg14: tensor<20x40xf32>):
    %13 = "sparse_tensor.new"(%arg14) : (tensor<20x40xf32>) -> tensor<20x40xf32, #sparse>
    "func.return"(%13) : (tensor<20x40xf32, #sparse>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> tensor<20x40xf32>, sym_name = "sparse_tensor_convert"}> ({
    %10 = "bufferization.alloc_tensor"() <{operandSegmentSizes = array<i32: 0, 0, 0>}> : () -> tensor<20x40xf32, #sparse>
    %11 = "sparse_tensor.load"(%10) : (tensor<20x40xf32, #sparse>) -> tensor<20x40xf32, #sparse>
    %12 = "sparse_tensor.convert"(%11) : (tensor<20x40xf32, #sparse>) -> tensor<20x40xf32>
    "func.return"(%12) : (tensor<20x40xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<10xf32>, tensor<10xf32, #sparse1>) -> (tensor<10xf32>, tensor<10xf32>), sym_name = "update_notinplace"}> ({
  ^bb0(%arg10: tensor<10xf32>, %arg11: tensor<10xf32, #sparse1>):
    %8 = "linalg.generic"(%arg11, %arg10) <{indexing_maps = [#map, #map], iterator_types = [#linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg12: f32, %arg13: f32):
      %9 = "arith.addf"(%arg12, %arg13) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%9) : (f32) -> ()
    }) : (tensor<10xf32, #sparse1>, tensor<10xf32>) -> tensor<10xf32>
    "func.return"(%8, %arg10) : (tensor<10xf32>, tensor<10xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<64x64xf32, #sparse2>, tensor<64x64xf32>, tensor<64x64xf32>) -> tensor<64x64xf32>, sym_name = "sparse_non_elementwise"}> ({
  ^bb0(%arg0: tensor<64x64xf32, #sparse2>, %arg1: tensor<64x64xf32>, %arg2: tensor<64x64xf32>):
    %0 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %1 = "bufferization.alloc_tensor"() <{operandSegmentSizes = array<i32: 0, 0, 0>}> : () -> tensor<64x64xf32>
    %2 = "linalg.generic"(%1) <{indexing_maps = [#map1], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 0, 1>}> ({
    ^bb0(%arg9: f32):
      "linalg.yield"(%0) : (f32) -> ()
    }) : (tensor<64x64xf32>) -> tensor<64x64xf32>
    %3 = "linalg.generic"(%arg2, %arg2, %2) <{indexing_maps = [#map2, #map3, #map4], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<reduction>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg6: f32, %arg7: f32, %arg8: f32):
      %6 = "arith.mulf"(%arg6, %arg7) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %7 = "arith.addf"(%arg8, %6) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%7) : (f32) -> ()
    }) : (tensor<64x64xf32>, tensor<64x64xf32>, tensor<64x64xf32>) -> tensor<64x64xf32>
    %4 = "linalg.generic"(%arg0, %3, %1) <{indexing_maps = [#map1, #map1, #map1], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg3: f32, %arg4: f32, %arg5: f32):
      %5 = "arith.mulf"(%arg3, %arg4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%5) : (f32) -> ()
    }) {sorted = true} : (tensor<64x64xf32, #sparse2>, tensor<64x64xf32>, tensor<64x64xf32>) -> tensor<64x64xf32>
    "func.return"(%4) : (tensor<64x64xf32>) -> ()
  }) : () -> ()
}) : () -> ()

