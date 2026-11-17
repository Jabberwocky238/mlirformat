"builtin.module"() ({
  "func.func"() <{function_type = (tensor<10x20xcomplex<f32>>, tensor<20x30xcomplex<f32>, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed), explicitVal = #complex.number<:f32 1.000000e+00, 0.000000e+00> : complex<f32>, implicitVal = #complex.number<:f32 0.000000e+00, 0.000000e+00> : complex<f32> }>>, tensor<10x30xcomplex<f32>>) -> tensor<10x30xcomplex<f32>>, sym_name = "matmul_complex"}> ({
  ^bb0(%arg12: tensor<10x20xcomplex<f32>> loc("<stdin>":9:8), %arg13: tensor<20x30xcomplex<f32>, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed), explicitVal = #complex.number<:f32 1.000000e+00, 0.000000e+00> : complex<f32>, implicitVal = #complex.number<:f32 0.000000e+00, 0.000000e+00> : complex<f32> }>> loc("<stdin>":9:44), %arg14: tensor<10x30xcomplex<f32>> loc("<stdin>":9:89)):
    %6 = "linalg.matmul"(%arg12, %arg13, %arg14) <{indexing_maps = [affine_map<(d0, d1, d2) -> (d0, d2)>, affine_map<(d0, d1, d2) -> (d2, d1)>, affine_map<(d0, d1, d2) -> (d0, d1)>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg15: complex<f32> loc("<stdin>":11:10), %arg16: complex<f32> loc("<stdin>":11:32), %arg17: complex<f32> loc("<stdin>":11:54)):
      %7 = "complex.mul"(%arg15, %arg16) <{fastmath = #arith.fastmath<none>}> : (complex<f32>, complex<f32>) -> complex<f32> loc("<stdin>":12:12)
      %8 = "complex.add"(%arg17, %7) <{fastmath = #arith.fastmath<none>}> : (complex<f32>, complex<f32>) -> complex<f32> loc("<stdin>":13:12)
      "linalg.yield"(%8) : (complex<f32>) -> () loc("<stdin>":14:7)
    }) : (tensor<10x20xcomplex<f32>>, tensor<20x30xcomplex<f32>, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed), explicitVal = #complex.number<:f32 1.000000e+00, 0.000000e+00> : complex<f32>, implicitVal = #complex.number<:f32 0.000000e+00, 0.000000e+00> : complex<f32> }>>, tensor<10x30xcomplex<f32>>) -> tensor<10x30xcomplex<f32>> loc("<stdin>":10:10)
    "func.return"(%6) : (tensor<10x30xcomplex<f32>>) -> () loc("<stdin>":16:5)
  }) : () -> () loc("<stdin>":8:3)
  "func.func"() <{function_type = (tensor<10x20xf32>, tensor<20x30xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed), explicitVal = 1.000000e+00 : f32, implicitVal = 0.000000e+00 : f32 }>>, tensor<10x30xf32>) -> tensor<10x30xf32>, sym_name = "matmul_fp"}> ({
  ^bb0(%arg6: tensor<10x20xf32> loc("<stdin>":19:8), %arg7: tensor<20x30xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed), explicitVal = 1.000000e+00 : f32, implicitVal = 0.000000e+00 : f32 }>> loc("<stdin>":19:34), %arg8: tensor<10x30xf32> loc("<stdin>":19:70)):
    %3 = "linalg.matmul"(%arg6, %arg7, %arg8) <{indexing_maps = [affine_map<(d0, d1, d2) -> (d0, d2)>, affine_map<(d0, d1, d2) -> (d2, d1)>, affine_map<(d0, d1, d2) -> (d0, d1)>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg9: f32 loc("<stdin>":21:10), %arg10: f32 loc("<stdin>":21:22), %arg11: f32 loc("<stdin>":21:35)):
      %4 = "arith.mulf"(%arg9, %arg10) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":22:12)
      %5 = "arith.addf"(%arg11, %4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":23:12)
      "linalg.yield"(%5) : (f32) -> () loc("<stdin>":24:7)
    }) : (tensor<10x20xf32>, tensor<20x30xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed), explicitVal = 1.000000e+00 : f32, implicitVal = 0.000000e+00 : f32 }>>, tensor<10x30xf32>) -> tensor<10x30xf32> loc("<stdin>":20:10)
    "func.return"(%3) : (tensor<10x30xf32>) -> () loc("<stdin>":26:5)
  }) : () -> () loc("<stdin>":18:3)
  "func.func"() <{function_type = (tensor<10x20xi32>, tensor<20x30xi32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed), explicitVal = 1 : i32, implicitVal = 0 : i32 }>>, tensor<10x30xi32>) -> tensor<10x30xi32>, sym_name = "matmul_int"}> ({
  ^bb0(%arg0: tensor<10x20xi32> loc("<stdin>":29:8), %arg1: tensor<20x30xi32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed), explicitVal = 1 : i32, implicitVal = 0 : i32 }>> loc("<stdin>":29:34), %arg2: tensor<10x30xi32> loc("<stdin>":29:70)):
    %0 = "linalg.matmul"(%arg0, %arg1, %arg2) <{indexing_maps = [affine_map<(d0, d1, d2) -> (d0, d2)>, affine_map<(d0, d1, d2) -> (d2, d1)>, affine_map<(d0, d1, d2) -> (d0, d1)>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg3: i32 loc("<stdin>":31:10), %arg4: i32 loc("<stdin>":31:22), %arg5: i32 loc("<stdin>":31:34)):
      %1 = "arith.muli"(%arg3, %arg4) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32 loc("<stdin>":32:12)
      %2 = "arith.addi"(%arg5, %1) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32 loc("<stdin>":33:12)
      "linalg.yield"(%2) : (i32) -> () loc("<stdin>":34:7)
    }) : (tensor<10x20xi32>, tensor<20x30xi32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed), explicitVal = 1 : i32, implicitVal = 0 : i32 }>>, tensor<10x30xi32>) -> tensor<10x30xi32> loc("<stdin>":30:10)
    "func.return"(%0) : (tensor<10x30xi32>) -> () loc("<stdin>":36:5)
  }) : () -> () loc("<stdin>":28:3)
}) : () -> () loc("<stdin>":7:1)
