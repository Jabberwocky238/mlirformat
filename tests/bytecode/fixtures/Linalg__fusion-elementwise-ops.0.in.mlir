"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?xf32>, tensor<?x?xf32>, tensor<?x?xf32>) -> tensor<?x?xf32>, sym_name = "add_mul_fusion"}> ({
  ^bb0(%arg0: tensor<?x?xf32> loc("<stdin>":4:8), %arg1: tensor<?x?xf32> loc("<stdin>":4:32), %arg2: tensor<?x?xf32> loc("<stdin>":4:56)):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":5:10)
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":6:10)
    %2 = "tensor.dim"(%arg0, %0) : (tensor<?x?xf32>, index) -> index loc("<stdin>":7:10)
    %3 = "tensor.dim"(%arg0, %1) : (tensor<?x?xf32>, index) -> index loc("<stdin>":8:10)
    %4 = "tensor.empty"(%2, %3) : (index, index) -> tensor<?x?xf32> loc("<stdin>":9:10)
    %5 = "linalg.generic"(%arg0, %arg1, %4) <{indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg6: f32 loc("<stdin>":11:10), %arg7: f32 loc("<stdin>":11:22), %arg8: f32 loc("<stdin>":11:34)):
      %8 = "arith.addf"(%arg6, %arg7) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":12:12)
      "linalg.yield"(%8) : (f32) -> () loc("<stdin>":13:7)
    }) : (tensor<?x?xf32>, tensor<?x?xf32>, tensor<?x?xf32>) -> tensor<?x?xf32> loc("<stdin>":10:10)
    %6 = "linalg.generic"(%5, %arg2, %4) <{indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg3: f32 loc("<stdin>":16:10), %arg4: f32 loc("<stdin>":16:22), %arg5: f32 loc("<stdin>":16:34)):
      %7 = "arith.mulf"(%arg3, %arg4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":17:12)
      "linalg.yield"(%7) : (f32) -> () loc("<stdin>":18:7)
    }) : (tensor<?x?xf32>, tensor<?x?xf32>, tensor<?x?xf32>) -> tensor<?x?xf32> loc("<stdin>":15:10)
    "func.return"(%6) : (tensor<?x?xf32>) -> () loc("<stdin>":20:5)
  }) : () -> () loc("<stdin>":3:3)
}) : () -> () loc("<stdin>":2:1)
