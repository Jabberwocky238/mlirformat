"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?xf32>, tensor<?x?xf32>, tensor<?x?xf32>, tensor<?x?xf32>, tensor<?x?xf32>, tensor<?x?xf32>) -> tensor<?x?xf32>, sym_name = "test_fusion_limit"}> ({
  ^bb0(%arg0: tensor<?x?xf32> loc("<stdin>":4:8), %arg1: tensor<?x?xf32> loc("<stdin>":4:32), %arg2: tensor<?x?xf32> loc("<stdin>":4:56), %arg3: tensor<?x?xf32> loc("<stdin>":4:80), %arg4: tensor<?x?xf32> loc("<stdin>":4:104), %arg5: tensor<?x?xf32> loc("<stdin>":4:128)):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":5:10)
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":6:10)
    %2 = "tensor.dim"(%arg0, %0) : (tensor<?x?xf32>, index) -> index loc("<stdin>":7:10)
    %3 = "tensor.dim"(%arg0, %1) : (tensor<?x?xf32>, index) -> index loc("<stdin>":8:10)
    %4 = "tensor.empty"(%2, %3) : (index, index) -> tensor<?x?xf32> loc("<stdin>":9:10)
    %5 = "linalg.generic"(%arg0, %arg1, %4) <{indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg16: f32 loc("<stdin>":11:10), %arg17: f32 loc("<stdin>":11:23), %arg18: f32 loc("<stdin>":11:36)):
      %13 = "arith.mulf"(%arg16, %arg17) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":12:13)
      "linalg.yield"(%13) : (f32) -> () loc("<stdin>":13:7)
    }) : (tensor<?x?xf32>, tensor<?x?xf32>, tensor<?x?xf32>) -> tensor<?x?xf32> loc("<stdin>":10:10)
    %6 = "linalg.generic"(%arg2, %arg3, %4) <{indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg13: f32 loc("<stdin>":16:10), %arg14: f32 loc("<stdin>":16:23), %arg15: f32 loc("<stdin>":16:36)):
      %12 = "arith.mulf"(%arg13, %arg14) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":17:13)
      "linalg.yield"(%12) : (f32) -> () loc("<stdin>":18:7)
    }) : (tensor<?x?xf32>, tensor<?x?xf32>, tensor<?x?xf32>) -> tensor<?x?xf32> loc("<stdin>":15:10)
    %7 = "linalg.generic"(%arg4, %arg5, %4) <{indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg10: f32 loc("<stdin>":21:10), %arg11: f32 loc("<stdin>":21:23), %arg12: f32 loc("<stdin>":21:36)):
      %11 = "arith.mulf"(%arg10, %arg11) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":22:13)
      "linalg.yield"(%11) : (f32) -> () loc("<stdin>":23:7)
    }) : (tensor<?x?xf32>, tensor<?x?xf32>, tensor<?x?xf32>) -> tensor<?x?xf32> loc("<stdin>":20:10)
    %8 = "linalg.generic"(%5, %6, %7, %4) <{indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 3, 1>}> ({
    ^bb0(%arg6: f32 loc("<stdin>":26:10), %arg7: f32 loc("<stdin>":26:22), %arg8: f32 loc("<stdin>":26:34), %arg9: f32 loc("<stdin>":26:46)):
      %9 = "arith.addf"(%arg6, %arg7) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":27:12)
      %10 = "arith.addf"(%9, %arg8) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":28:13)
      "linalg.yield"(%10) : (f32) -> () loc("<stdin>":29:7)
    }) : (tensor<?x?xf32>, tensor<?x?xf32>, tensor<?x?xf32>, tensor<?x?xf32>) -> tensor<?x?xf32> loc("<stdin>":25:10)
    "func.return"(%8) : (tensor<?x?xf32>) -> () loc("<stdin>":31:5)
  }) : () -> () loc("<stdin>":3:3)
}) : () -> () loc("<stdin>":2:1)
