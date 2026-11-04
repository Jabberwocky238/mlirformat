#map = affine_map<(d0, d1, d2, d3) -> (d0, d1, d3)>
#map1 = affine_map<(d0, d1, d2, d3) -> (d0, d1, 0)>
#map2 = affine_map<(d0, d1, d2, d3) -> (d3)>
#map3 = affine_map<(d0, d1, d2, d3) -> (d2, d3)>
#map4 = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2)>
#sparse = #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed), posWidth = 32, crdWidth = 32 }>
#sparse1 = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed(nonunique), d1 : singleton), posWidth = 32, crdWidth = 32 }>
#sparse2 = #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d0 : compressed, d1 : compressed, d2 : compressed), posWidth = 32, crdWidth = 32 }>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<2x10x8xf32>, tensor<2x10x1xf32>, tensor<2x10x1xf32>, tensor<2x10x1xf32>, tensor<8xf32, #sparse>, tensor<8xf32, #sparse>, tensor<100x8xf32, #sparse1>) -> tensor<2x10x100xf32>, sym_name = "dense_op_without_sp_dep"}> ({
  ^bb0(%arg15: tensor<2x10x8xf32>, %arg16: tensor<2x10x1xf32>, %arg17: tensor<2x10x1xf32>, %arg18: tensor<2x10x1xf32>, %arg19: tensor<8xf32, #sparse>, %arg20: tensor<8xf32, #sparse>, %arg21: tensor<100x8xf32, #sparse1>):
    %15 = "arith.constant"() <{value = -3.40282347E+38 : f32}> : () -> f32
    %16 = "tensor.empty"() : () -> tensor<2x10x100xf32>
    %17 = "linalg.generic"(%arg15, %arg16, %arg17, %arg18, %arg19, %arg20, %arg21, %16) <{indexing_maps = [#map, #map1, #map1, #map1, #map2, #map2, #map3, #map4], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<reduction>], operandSegmentSizes = array<i32: 7, 1>}> ({
    ^bb0(%arg22: f32, %arg23: f32, %arg24: f32, %arg25: f32, %arg26: f32, %arg27: f32, %arg28: f32, %arg29: f32):
      %18 = "arith.mulf"(%arg25, %arg25) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %19 = "arith.mulf"(%arg24, %15) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %20 = "arith.subf"(%19, %18) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %21 = "arith.maximumf"(%20, %15) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %22 = "arith.addf"(%21, %15) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %23 = "math.rsqrt"(%22) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
      %24 = "arith.mulf"(%23, %arg26) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %25 = "arith.subf"(%arg22, %arg23) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %26 = "arith.mulf"(%25, %24) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %27 = "arith.addf"(%26, %arg27) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %28 = "arith.mulf"(%27, %arg28) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %29 = "arith.addf"(%arg29, %28) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%29) : (f32) -> ()
    }) : (tensor<2x10x8xf32>, tensor<2x10x1xf32>, tensor<2x10x1xf32>, tensor<2x10x1xf32>, tensor<8xf32, #sparse>, tensor<8xf32, #sparse>, tensor<100x8xf32, #sparse1>, tensor<2x10x100xf32>) -> tensor<2x10x100xf32>
    "func.return"(%17) : (tensor<2x10x100xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<2x10x8xf32>, tensor<2x10x1xf32, #sparse2>, tensor<2x10x1xf32, #sparse2>, tensor<2x10x1xf32, #sparse2>, tensor<8xf32, #sparse>, tensor<8xf32, #sparse>, tensor<100x8xf32, #sparse1>) -> tensor<2x10x100xf32>, sym_name = "dense_op_with_sp_dep"}> ({
  ^bb0(%arg0: tensor<2x10x8xf32>, %arg1: tensor<2x10x1xf32, #sparse2>, %arg2: tensor<2x10x1xf32, #sparse2>, %arg3: tensor<2x10x1xf32, #sparse2>, %arg4: tensor<8xf32, #sparse>, %arg5: tensor<8xf32, #sparse>, %arg6: tensor<100x8xf32, #sparse1>):
    %0 = "arith.constant"() <{value = -3.40282347E+38 : f32}> : () -> f32
    %1 = "tensor.empty"() : () -> tensor<2x10x100xf32>
    %2 = "linalg.generic"(%arg0, %arg1, %arg2, %arg3, %arg4, %arg5, %arg6, %1) <{indexing_maps = [#map, #map1, #map1, #map1, #map2, #map2, #map3, #map4], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<reduction>], operandSegmentSizes = array<i32: 7, 1>}> ({
    ^bb0(%arg7: f32, %arg8: f32, %arg9: f32, %arg10: f32, %arg11: f32, %arg12: f32, %arg13: f32, %arg14: f32):
      %3 = "arith.mulf"(%arg10, %arg10) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %4 = "arith.mulf"(%arg9, %0) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %5 = "arith.subf"(%4, %3) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %6 = "arith.maximumf"(%5, %0) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %7 = "arith.addf"(%6, %0) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %8 = "math.rsqrt"(%7) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
      %9 = "arith.mulf"(%8, %arg11) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %10 = "arith.subf"(%arg7, %arg8) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %11 = "arith.mulf"(%10, %9) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %12 = "arith.addf"(%11, %arg12) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %13 = "arith.mulf"(%12, %arg13) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %14 = "arith.addf"(%arg14, %13) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%14) : (f32) -> ()
    }) : (tensor<2x10x8xf32>, tensor<2x10x1xf32, #sparse2>, tensor<2x10x1xf32, #sparse2>, tensor<2x10x1xf32, #sparse2>, tensor<8xf32, #sparse>, tensor<8xf32, #sparse>, tensor<100x8xf32, #sparse1>, tensor<2x10x100xf32>) -> tensor<2x10x100xf32>
    "func.return"(%2) : (tensor<2x10x100xf32>) -> ()
  }) : () -> ()
}) : () -> ()

