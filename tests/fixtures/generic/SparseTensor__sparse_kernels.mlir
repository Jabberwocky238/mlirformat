#map = affine_map<(d0, d1, d2) -> (d0, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d2, d1)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1)>
#map3 = affine_map<(d0, d1, d2, d3) -> (d0 + d2, d1 + d3)>
#map4 = affine_map<(d0, d1, d2, d3) -> (d2, d3)>
#map5 = affine_map<(d0, d1, d2, d3) -> (d0, d1)>
#map6 = affine_map<(d0, d1, d2) -> ()>
#map7 = affine_map<(d0) -> (d0)>
#map8 = affine_map<(d0) -> ()>
#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>
#sparse1 = #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<10x20xf32, #sparse>, tensor<20x30xf32>, tensor<10x30xf32>) -> tensor<10x30xf32>, sym_name = "matmul1"}> ({
  ^bb0(%arg31: tensor<10x20xf32, #sparse>, %arg32: tensor<20x30xf32>, %arg33: tensor<10x30xf32>):
    %25 = "linalg.matmul"(%arg31, %arg32, %arg33) <{indexing_maps = [#map, #map1, #map2], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg34: f32, %arg35: f32, %arg36: f32):
      %26 = "arith.mulf"(%arg34, %arg35) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %27 = "arith.addf"(%arg36, %26) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%27) : (f32) -> ()
    }) : (tensor<10x20xf32, #sparse>, tensor<20x30xf32>, tensor<10x30xf32>) -> tensor<10x30xf32>
    "func.return"(%25) : (tensor<10x30xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<10x20xf32>, tensor<20x30xf32, #sparse>, tensor<10x30xf32>) -> tensor<10x30xf32>, sym_name = "matmul_sparse_rhs"}> ({
  ^bb0(%arg25: tensor<10x20xf32>, %arg26: tensor<20x30xf32, #sparse>, %arg27: tensor<10x30xf32>):
    %22 = "linalg.matmul"(%arg25, %arg26, %arg27) <{indexing_maps = [#map, #map1, #map2], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg28: f32, %arg29: f32, %arg30: f32):
      %23 = "arith.mulf"(%arg28, %arg29) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %24 = "arith.addf"(%arg30, %23) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%24) : (f32) -> ()
    }) : (tensor<10x20xf32>, tensor<20x30xf32, #sparse>, tensor<10x30xf32>) -> tensor<10x30xf32>
    "func.return"(%22) : (tensor<10x30xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<4x8xf64, #sparse>, tensor<8x4xf64, #sparse>) -> tensor<4x4xf64, #sparse>, sym_name = "matmul2"}> ({
  ^bb0(%arg20: tensor<4x8xf64, #sparse>, %arg21: tensor<8x4xf64, #sparse>):
    %17 = "arith.constant"() <{value = 4 : index}> : () -> index
    %18 = "tensor.empty"() : () -> tensor<4x4xf64, #sparse>
    %19 = "linalg.matmul"(%arg20, %arg21, %18) <{indexing_maps = [#map, #map1, #map2], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg22: f64, %arg23: f64, %arg24: f64):
      %20 = "arith.mulf"(%arg22, %arg23) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64
      %21 = "arith.addf"(%arg24, %20) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64
      "linalg.yield"(%21) : (f64) -> ()
    }) : (tensor<4x8xf64, #sparse>, tensor<8x4xf64, #sparse>, tensor<4x4xf64, #sparse>) -> tensor<4x4xf64, #sparse>
    "func.return"(%19) : (tensor<4x4xf64, #sparse>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<8x8xi32>, tensor<3x3xi32, #sparse>, tensor<6x6xi32>) -> tensor<6x6xi32>, sym_name = "conv2d"}> ({
  ^bb0(%arg14: tensor<8x8xi32>, %arg15: tensor<3x3xi32, #sparse>, %arg16: tensor<6x6xi32>):
    %14 = "linalg.conv_2d"(%arg14, %arg15, %arg16) <{operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg17: i32, %arg18: i32, %arg19: i32):
      %15 = "arith.muli"(%arg17, %arg18) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      %16 = "arith.addi"(%arg19, %15) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      "linalg.yield"(%16) : (i32) -> ()
    }) {linalg.memoized_indexing_maps = [#map3, #map4, #map5]} : (tensor<8x8xi32>, tensor<3x3xi32, #sparse>, tensor<6x6xi32>) -> tensor<6x6xi32>
    "func.return"(%14) : (tensor<6x6xi32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<5x3xi8>, tensor<3x6xi8, #sparse>, tensor<5x6xi64>) -> tensor<5x6xi64>, sym_name = "quantized_matmul"}> ({
  ^bb0(%arg6: tensor<5x3xi8>, %arg7: tensor<3x6xi8, #sparse>, %arg8: tensor<5x6xi64>):
    %3 = "arith.constant"() <{value = 0 : i32}> : () -> i32
    %4 = "arith.constant"() <{value = 2 : i32}> : () -> i32
    %5 = "linalg.quantized_matmul"(%arg6, %arg7, %4, %3, %arg8) <{operandSegmentSizes = array<i32: 4, 1>}> ({
    ^bb0(%arg9: i8, %arg10: i8, %arg11: i32, %arg12: i32, %arg13: i64):
      %6 = "arith.extsi"(%arg9) : (i8) -> i64
      %7 = "arith.extsi"(%arg11) : (i32) -> i64
      %8 = "arith.subi"(%6, %7) <{overflowFlags = #arith.overflow<none>}> : (i64, i64) -> i64
      %9 = "arith.extsi"(%arg10) : (i8) -> i64
      %10 = "arith.extsi"(%arg12) : (i32) -> i64
      %11 = "arith.subi"(%9, %10) <{overflowFlags = #arith.overflow<none>}> : (i64, i64) -> i64
      %12 = "arith.muli"(%8, %11) <{overflowFlags = #arith.overflow<none>}> : (i64, i64) -> i64
      %13 = "arith.addi"(%arg13, %12) <{overflowFlags = #arith.overflow<none>}> : (i64, i64) -> i64
      "linalg.yield"(%13) : (i64) -> ()
    }) {linalg.memoized_indexing_maps = [#map, #map1, #map6, #map6, #map2]} : (tensor<5x3xi8>, tensor<3x6xi8, #sparse>, i32, i32, tensor<5x6xi64>) -> tensor<5x6xi64>
    "func.return"(%5) : (tensor<5x6xi64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<1024xf32, #sparse1>, tensor<1024xf32, #sparse1>, tensor<f32>) -> tensor<f32>, sym_name = "sparse_dot"}> ({
  ^bb0(%arg0: tensor<1024xf32, #sparse1>, %arg1: tensor<1024xf32, #sparse1>, %arg2: tensor<f32>):
    %0 = "linalg.dot"(%arg0, %arg1, %arg2) <{operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg3: f32, %arg4: f32, %arg5: f32):
      %1 = "arith.mulf"(%arg3, %arg4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %2 = "arith.addf"(%arg5, %1) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%2) : (f32) -> ()
    }) {linalg.memoized_indexing_maps = [#map7, #map7, #map8]} : (tensor<1024xf32, #sparse1>, tensor<1024xf32, #sparse1>, tensor<f32>) -> tensor<f32>
    "func.return"(%0) : (tensor<f32>) -> ()
  }) : () -> ()
}) : () -> ()

