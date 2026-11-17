"builtin.module"() ({
  "func.func"() <{function_type = (tensor<10x20xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>, tensor<20x30xf32>, tensor<10x30xf32>) -> tensor<10x30xf32>, sym_name = "matmul1"}> ({
  ^bb0(%arg31: tensor<10x20xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>> loc("<stdin>":14:8), %arg32: tensor<20x30xf32> loc("<stdin>":14:44), %arg33: tensor<10x30xf32> loc("<stdin>":14:71)):
    %25 = "linalg.matmul"(%arg31, %arg32, %arg33) <{indexing_maps = [affine_map<(d0, d1, d2) -> (d0, d2)>, affine_map<(d0, d1, d2) -> (d2, d1)>, affine_map<(d0, d1, d2) -> (d0, d1)>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg34: f32 loc("<stdin>":16:10), %arg35: f32 loc("<stdin>":16:23), %arg36: f32 loc("<stdin>":16:36)):
      %26 = "arith.mulf"(%arg34, %arg35) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":17:13)
      %27 = "arith.addf"(%arg36, %26) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":18:13)
      "linalg.yield"(%27) : (f32) -> () loc("<stdin>":19:7)
    }) : (tensor<10x20xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>, tensor<20x30xf32>, tensor<10x30xf32>) -> tensor<10x30xf32> loc("<stdin>":15:11)
    "func.return"(%25) : (tensor<10x30xf32>) -> () loc("<stdin>":21:5)
  }) : () -> () loc("<stdin>":13:3)
  "func.func"() <{function_type = (tensor<10x20xf32>, tensor<20x30xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>, tensor<10x30xf32>) -> tensor<10x30xf32>, sym_name = "matmul_sparse_rhs"}> ({
  ^bb0(%arg25: tensor<10x20xf32> loc("<stdin>":24:8), %arg26: tensor<20x30xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>> loc("<stdin>":24:35), %arg27: tensor<10x30xf32> loc("<stdin>":24:71)):
    %22 = "linalg.matmul"(%arg25, %arg26, %arg27) <{indexing_maps = [affine_map<(d0, d1, d2) -> (d0, d2)>, affine_map<(d0, d1, d2) -> (d2, d1)>, affine_map<(d0, d1, d2) -> (d0, d1)>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg28: f32 loc("<stdin>":26:10), %arg29: f32 loc("<stdin>":26:23), %arg30: f32 loc("<stdin>":26:36)):
      %23 = "arith.mulf"(%arg28, %arg29) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":27:13)
      %24 = "arith.addf"(%arg30, %23) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":28:13)
      "linalg.yield"(%24) : (f32) -> () loc("<stdin>":29:7)
    }) : (tensor<10x20xf32>, tensor<20x30xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>, tensor<10x30xf32>) -> tensor<10x30xf32> loc("<stdin>":25:11)
    "func.return"(%22) : (tensor<10x30xf32>) -> () loc("<stdin>":31:5)
  }) : () -> () loc("<stdin>":23:3)
  "func.func"() <{function_type = (tensor<4x8xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>, tensor<8x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>) -> tensor<4x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>, sym_name = "matmul2"}> ({
  ^bb0(%arg20: tensor<4x8xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>> loc("<stdin>":34:8), %arg21: tensor<8x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>> loc("<stdin>":34:42)):
    %17 = "arith.constant"() <{value = 4 : index}> : () -> index loc("<stdin>":35:11)
    %18 = "tensor.empty"() : () -> tensor<4x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>> loc("<stdin>":36:11)
    %19 = "linalg.matmul"(%arg20, %arg21, %18) <{indexing_maps = [affine_map<(d0, d1, d2) -> (d0, d2)>, affine_map<(d0, d1, d2) -> (d2, d1)>, affine_map<(d0, d1, d2) -> (d0, d1)>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg22: f64 loc("<stdin>":38:10), %arg23: f64 loc("<stdin>":38:23), %arg24: f64 loc("<stdin>":38:36)):
      %20 = "arith.mulf"(%arg22, %arg23) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64 loc("<stdin>":39:13)
      %21 = "arith.addf"(%arg24, %20) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64 loc("<stdin>":40:13)
      "linalg.yield"(%21) : (f64) -> () loc("<stdin>":41:7)
    }) : (tensor<4x8xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>, tensor<8x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>, tensor<4x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>) -> tensor<4x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>> loc("<stdin>":37:11)
    "func.return"(%19) : (tensor<4x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>) -> () loc("<stdin>":43:5)
  }) : () -> () loc("<stdin>":33:3)
  "func.func"() <{function_type = (tensor<8x8xi32>, tensor<3x3xi32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>, tensor<6x6xi32>) -> tensor<6x6xi32>, sym_name = "conv2d"}> ({
  ^bb0(%arg14: tensor<8x8xi32> loc("<stdin>":46:8), %arg15: tensor<3x3xi32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>> loc("<stdin>":46:33), %arg16: tensor<6x6xi32> loc("<stdin>":46:67)):
    %14 = "linalg.conv_2d"(%arg14, %arg15, %arg16) <{operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg17: i32 loc("<stdin>":48:10), %arg18: i32 loc("<stdin>":48:23), %arg19: i32 loc("<stdin>":48:36)):
      %15 = "arith.muli"(%arg17, %arg18) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32 loc("<stdin>":49:13)
      %16 = "arith.addi"(%arg19, %15) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32 loc("<stdin>":50:13)
      "linalg.yield"(%16) : (i32) -> () loc("<stdin>":51:7)
    }) {linalg.memoized_indexing_maps = [affine_map<(d0, d1, d2, d3) -> (d0 + d2, d1 + d3)>, affine_map<(d0, d1, d2, d3) -> (d2, d3)>, affine_map<(d0, d1, d2, d3) -> (d0, d1)>]} : (tensor<8x8xi32>, tensor<3x3xi32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>, tensor<6x6xi32>) -> tensor<6x6xi32> loc("<stdin>":47:11)
    "func.return"(%14) : (tensor<6x6xi32>) -> () loc("<stdin>":53:5)
  }) : () -> () loc("<stdin>":45:3)
  "func.func"() <{function_type = (tensor<5x3xi8>, tensor<3x6xi8, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>, tensor<5x6xi64>) -> tensor<5x6xi64>, sym_name = "quantized_matmul"}> ({
  ^bb0(%arg6: tensor<5x3xi8> loc("<stdin>":56:8), %arg7: tensor<3x6xi8, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>> loc("<stdin>":56:31), %arg8: tensor<5x6xi64> loc("<stdin>":56:63)):
    %3 = "arith.constant"() <{value = 0 : i32}> : () -> i32 loc("<stdin>":57:10)
    %4 = "arith.constant"() <{value = 2 : i32}> : () -> i32 loc("<stdin>":58:10)
    %5 = "linalg.quantized_matmul"(%arg6, %arg7, %4, %3, %arg8) <{operandSegmentSizes = array<i32: 4, 1>}> ({
    ^bb0(%arg9: i8 loc("<stdin>":60:10), %arg10: i8 loc("<stdin>":60:21), %arg11: i32 loc("<stdin>":60:33), %arg12: i32 loc("<stdin>":60:46), %arg13: i64 loc("<stdin>":60:59)):
      %6 = "arith.extsi"(%arg9) : (i8) -> i64 loc("<stdin>":61:12)
      %7 = "arith.extsi"(%arg11) : (i32) -> i64 loc("<stdin>":62:12)
      %8 = "arith.subi"(%6, %7) <{overflowFlags = #arith.overflow<none>}> : (i64, i64) -> i64 loc("<stdin>":63:12)
      %9 = "arith.extsi"(%arg10) : (i8) -> i64 loc("<stdin>":64:12)
      %10 = "arith.extsi"(%arg12) : (i32) -> i64 loc("<stdin>":65:13)
      %11 = "arith.subi"(%9, %10) <{overflowFlags = #arith.overflow<none>}> : (i64, i64) -> i64 loc("<stdin>":66:13)
      %12 = "arith.muli"(%8, %11) <{overflowFlags = #arith.overflow<none>}> : (i64, i64) -> i64 loc("<stdin>":67:13)
      %13 = "arith.addi"(%arg13, %12) <{overflowFlags = #arith.overflow<none>}> : (i64, i64) -> i64 loc("<stdin>":68:13)
      "linalg.yield"(%13) : (i64) -> () loc("<stdin>":69:7)
    }) {linalg.memoized_indexing_maps = [affine_map<(d0, d1, d2) -> (d0, d2)>, affine_map<(d0, d1, d2) -> (d2, d1)>, affine_map<(d0, d1, d2) -> ()>, affine_map<(d0, d1, d2) -> ()>, affine_map<(d0, d1, d2) -> (d0, d1)>]} : (tensor<5x3xi8>, tensor<3x6xi8, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>, i32, i32, tensor<5x6xi64>) -> tensor<5x6xi64> loc("<stdin>":59:10)
    "func.return"(%5) : (tensor<5x6xi64>) -> () loc("<stdin>":71:5)
  }) : () -> () loc("<stdin>":55:3)
  "func.func"() <{function_type = (tensor<1024xf32, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>, tensor<1024xf32, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>, tensor<f32>) -> tensor<f32>, sym_name = "sparse_dot"}> ({
  ^bb0(%arg0: tensor<1024xf32, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>> loc("<stdin>":74:8), %arg1: tensor<1024xf32, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>> loc("<stdin>":74:43), %arg2: tensor<f32> loc("<stdin>":74:78)):
    %0 = "linalg.dot"(%arg0, %arg1, %arg2) <{operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg3: f32 loc("<stdin>":76:10), %arg4: f32 loc("<stdin>":76:22), %arg5: f32 loc("<stdin>":76:34)):
      %1 = "arith.mulf"(%arg3, %arg4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":77:12)
      %2 = "arith.addf"(%arg5, %1) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":78:12)
      "linalg.yield"(%2) : (f32) -> () loc("<stdin>":79:7)
    }) {linalg.memoized_indexing_maps = [affine_map<(d0) -> (d0)>, affine_map<(d0) -> (d0)>, affine_map<(d0) -> ()>]} : (tensor<1024xf32, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>, tensor<1024xf32, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>, tensor<f32>) -> tensor<f32> loc("<stdin>":75:10)
    "func.return"(%0) : (tensor<f32>) -> () loc("<stdin>":81:5)
  }) : () -> () loc("<stdin>":73:3)
}) : () -> () loc("<stdin>":12:1)
