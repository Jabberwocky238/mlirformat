#map = affine_map<(d0, d1, d2) -> (d0, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d2, d1)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1)>
#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed), explicitVal = #complex.number<:f32 1.000000e+00, 0.000000e+00> : complex<f32>, implicitVal = #complex.number<:f32 0.000000e+00, 0.000000e+00> : complex<f32> }>
#sparse1 = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed), explicitVal = 1.000000e+00 : f32, implicitVal = 0.000000e+00 : f32 }>
#sparse2 = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed), explicitVal = 1 : i32, implicitVal = 0 : i32 }>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<10x20xcomplex<f32>>, tensor<20x30xcomplex<f32>, #sparse>, tensor<10x30xcomplex<f32>>) -> tensor<10x30xcomplex<f32>>, sym_name = "matmul_complex"}> ({
  ^bb0(%arg12: tensor<10x20xcomplex<f32>>, %arg13: tensor<20x30xcomplex<f32>, #sparse>, %arg14: tensor<10x30xcomplex<f32>>):
    %6 = "linalg.matmul"(%arg12, %arg13, %arg14) <{indexing_maps = [#map, #map1, #map2], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg15: complex<f32>, %arg16: complex<f32>, %arg17: complex<f32>):
      %7 = "complex.mul"(%arg15, %arg16) <{fastmath = #arith.fastmath<none>}> : (complex<f32>, complex<f32>) -> complex<f32>
      %8 = "complex.add"(%arg17, %7) <{fastmath = #arith.fastmath<none>}> : (complex<f32>, complex<f32>) -> complex<f32>
      "linalg.yield"(%8) : (complex<f32>) -> ()
    }) : (tensor<10x20xcomplex<f32>>, tensor<20x30xcomplex<f32>, #sparse>, tensor<10x30xcomplex<f32>>) -> tensor<10x30xcomplex<f32>>
    "func.return"(%6) : (tensor<10x30xcomplex<f32>>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<10x20xf32>, tensor<20x30xf32, #sparse1>, tensor<10x30xf32>) -> tensor<10x30xf32>, sym_name = "matmul_fp"}> ({
  ^bb0(%arg6: tensor<10x20xf32>, %arg7: tensor<20x30xf32, #sparse1>, %arg8: tensor<10x30xf32>):
    %3 = "linalg.matmul"(%arg6, %arg7, %arg8) <{indexing_maps = [#map, #map1, #map2], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg9: f32, %arg10: f32, %arg11: f32):
      %4 = "arith.mulf"(%arg9, %arg10) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %5 = "arith.addf"(%arg11, %4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%5) : (f32) -> ()
    }) : (tensor<10x20xf32>, tensor<20x30xf32, #sparse1>, tensor<10x30xf32>) -> tensor<10x30xf32>
    "func.return"(%3) : (tensor<10x30xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<10x20xi32>, tensor<20x30xi32, #sparse2>, tensor<10x30xi32>) -> tensor<10x30xi32>, sym_name = "matmul_int"}> ({
  ^bb0(%arg0: tensor<10x20xi32>, %arg1: tensor<20x30xi32, #sparse2>, %arg2: tensor<10x30xi32>):
    %0 = "linalg.matmul"(%arg0, %arg1, %arg2) <{indexing_maps = [#map, #map1, #map2], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg3: i32, %arg4: i32, %arg5: i32):
      %1 = "arith.muli"(%arg3, %arg4) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      %2 = "arith.addi"(%arg5, %1) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      "linalg.yield"(%2) : (i32) -> ()
    }) : (tensor<10x20xi32>, tensor<20x30xi32, #sparse2>, tensor<10x30xi32>) -> tensor<10x30xi32>
    "func.return"(%0) : (tensor<10x30xi32>) -> ()
  }) : () -> ()
}) : () -> ()

