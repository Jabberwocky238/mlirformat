#map = affine_map<(d0, d1, d2) -> (d0, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d2, d1)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1)>
#map3 = affine_map<(d0, d1, d2, d3) -> (d0, d1, d3)>
#map4 = affine_map<(d0, d1, d2, d3) -> (d0, d3, d2)>
#map5 = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<16x8xf32>, tensor<8x16xf32>) -> tensor<16x16xf32>, sym_name = "matmul_static"}> ({
  ^bb0(%arg35: tensor<16x8xf32>, %arg36: tensor<8x16xf32>):
    %46 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %47 = "tensor.empty"() : () -> tensor<16x16xf32>
    %48 = "linalg.fill"(%46, %47) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg40: f32, %arg41: f32):
      "linalg.yield"(%arg40) : (f32) -> ()
    }) : (f32, tensor<16x16xf32>) -> tensor<16x16xf32>
    %49 = "linalg.matmul"(%arg35, %arg36, %48) <{indexing_maps = [#map, #map1, #map2], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg37: f32, %arg38: f32, %arg39: f32):
      %50 = "arith.mulf"(%arg37, %arg38) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %51 = "arith.addf"(%arg39, %50) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%51) : (f32) -> ()
    }) : (tensor<16x8xf32>, tensor<8x16xf32>, tensor<16x16xf32>) -> tensor<16x16xf32>
    "func.return"(%49) : (tensor<16x16xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<?x?xf32>, tensor<?x?xf32>) -> tensor<?x?xf32>, sym_name = "matmul_dynamic"}> ({
  ^bb0(%arg28: tensor<?x?xf32>, %arg29: tensor<?x?xf32>):
    %36 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %37 = "arith.constant"() <{value = 0 : index}> : () -> index
    %38 = "arith.constant"() <{value = 1 : index}> : () -> index
    %39 = "tensor.dim"(%arg28, %37) : (tensor<?x?xf32>, index) -> index
    %40 = "tensor.dim"(%arg29, %38) : (tensor<?x?xf32>, index) -> index
    %41 = "tensor.empty"(%39, %40) : (index, index) -> tensor<?x?xf32>
    %42 = "linalg.fill"(%36, %41) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg33: f32, %arg34: f32):
      "linalg.yield"(%arg33) : (f32) -> ()
    }) : (f32, tensor<?x?xf32>) -> tensor<?x?xf32>
    %43 = "linalg.matmul"(%arg28, %arg29, %42) <{indexing_maps = [#map, #map1, #map2], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg30: f32, %arg31: f32, %arg32: f32):
      %44 = "arith.mulf"(%arg30, %arg31) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %45 = "arith.addf"(%arg32, %44) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%45) : (f32) -> ()
    }) : (tensor<?x?xf32>, tensor<?x?xf32>, tensor<?x?xf32>) -> tensor<?x?xf32>
    "func.return"(%43) : (tensor<?x?xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<?x8xf32>, tensor<8x16xf32>) -> tensor<?x16xf32>, sym_name = "matmul_mixed"}> ({
  ^bb0(%arg21: tensor<?x8xf32>, %arg22: tensor<8x16xf32>):
    %27 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %28 = "arith.constant"() <{value = 0 : index}> : () -> index
    %29 = "arith.constant"() <{value = 1 : index}> : () -> index
    %30 = "tensor.dim"(%arg21, %28) : (tensor<?x8xf32>, index) -> index
    %31 = "tensor.empty"(%30) : (index) -> tensor<?x16xf32>
    %32 = "linalg.fill"(%27, %31) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg26: f32, %arg27: f32):
      "linalg.yield"(%arg26) : (f32) -> ()
    }) : (f32, tensor<?x16xf32>) -> tensor<?x16xf32>
    %33 = "linalg.matmul"(%arg21, %arg22, %32) <{indexing_maps = [#map, #map1, #map2], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg23: f32, %arg24: f32, %arg25: f32):
      %34 = "arith.mulf"(%arg23, %arg24) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %35 = "arith.addf"(%arg25, %34) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%35) : (f32) -> ()
    }) : (tensor<?x8xf32>, tensor<8x16xf32>, tensor<?x16xf32>) -> tensor<?x16xf32>
    "func.return"(%33) : (tensor<?x16xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<2x16x8xf32>, tensor<2x8x16xf32>) -> tensor<2x16x16xf32>, sym_name = "batch_matmul_static"}> ({
  ^bb0(%arg14: tensor<2x16x8xf32>, %arg15: tensor<2x8x16xf32>):
    %21 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %22 = "tensor.empty"() : () -> tensor<2x16x16xf32>
    %23 = "linalg.fill"(%21, %22) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg19: f32, %arg20: f32):
      "linalg.yield"(%arg19) : (f32) -> ()
    }) : (f32, tensor<2x16x16xf32>) -> tensor<2x16x16xf32>
    %24 = "linalg.batch_matmul"(%arg14, %arg15, %23) <{indexing_maps = [#map3, #map4, #map5], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg16: f32, %arg17: f32, %arg18: f32):
      %25 = "arith.mulf"(%arg16, %arg17) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %26 = "arith.addf"(%arg18, %25) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%26) : (f32) -> ()
    }) : (tensor<2x16x8xf32>, tensor<2x8x16xf32>, tensor<2x16x16xf32>) -> tensor<2x16x16xf32>
    "func.return"(%24) : (tensor<2x16x16xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<?x?x?xf32>, tensor<?x?x?xf32>) -> tensor<?x?x?xf32>, sym_name = "batch_matmul_dynamic"}> ({
  ^bb0(%arg7: tensor<?x?x?xf32>, %arg8: tensor<?x?x?xf32>):
    %9 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %10 = "arith.constant"() <{value = 0 : index}> : () -> index
    %11 = "arith.constant"() <{value = 1 : index}> : () -> index
    %12 = "arith.constant"() <{value = 2 : index}> : () -> index
    %13 = "tensor.dim"(%arg7, %10) : (tensor<?x?x?xf32>, index) -> index
    %14 = "tensor.dim"(%arg7, %11) : (tensor<?x?x?xf32>, index) -> index
    %15 = "tensor.dim"(%arg8, %12) : (tensor<?x?x?xf32>, index) -> index
    %16 = "tensor.empty"(%13, %14, %15) : (index, index, index) -> tensor<?x?x?xf32>
    %17 = "linalg.fill"(%9, %16) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg12: f32, %arg13: f32):
      "linalg.yield"(%arg12) : (f32) -> ()
    }) : (f32, tensor<?x?x?xf32>) -> tensor<?x?x?xf32>
    %18 = "linalg.batch_matmul"(%arg7, %arg8, %17) <{indexing_maps = [#map3, #map4, #map5], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg9: f32, %arg10: f32, %arg11: f32):
      %19 = "arith.mulf"(%arg9, %arg10) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %20 = "arith.addf"(%arg11, %19) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%20) : (f32) -> ()
    }) : (tensor<?x?x?xf32>, tensor<?x?x?xf32>, tensor<?x?x?xf32>) -> tensor<?x?x?xf32>
    "func.return"(%18) : (tensor<?x?x?xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<2x?x8xf32>, tensor<2x8x16xf32>) -> tensor<2x?x16xf32>, sym_name = "batch_matmul_mixed"}> ({
  ^bb0(%arg0: tensor<2x?x8xf32>, %arg1: tensor<2x8x16xf32>):
    %0 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %1 = "arith.constant"() <{value = 0 : index}> : () -> index
    %2 = "arith.constant"() <{value = 1 : index}> : () -> index
    %3 = "tensor.dim"(%arg0, %2) : (tensor<2x?x8xf32>, index) -> index
    %4 = "tensor.empty"(%3) : (index) -> tensor<2x?x16xf32>
    %5 = "linalg.fill"(%0, %4) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg5: f32, %arg6: f32):
      "linalg.yield"(%arg5) : (f32) -> ()
    }) : (f32, tensor<2x?x16xf32>) -> tensor<2x?x16xf32>
    %6 = "linalg.batch_matmul"(%arg0, %arg1, %5) <{indexing_maps = [#map3, #map4, #map5], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg2: f32, %arg3: f32, %arg4: f32):
      %7 = "arith.mulf"(%arg2, %arg3) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %8 = "arith.addf"(%arg4, %7) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%8) : (f32) -> ()
    }) : (tensor<2x?x8xf32>, tensor<2x8x16xf32>, tensor<2x?x16xf32>) -> tensor<2x?x16xf32>
    "func.return"(%6) : (tensor<2x?x16xf32>) -> ()
  }) : () -> ()
}) : () -> ()

