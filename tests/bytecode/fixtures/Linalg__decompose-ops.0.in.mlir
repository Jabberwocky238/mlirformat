"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?xf32>, tensor<?xf32>, tensor<?xf32>) -> (tensor<?x?xf32>, tensor<?x?xf32>), sym_name = "simple_op"}> ({
  ^bb0(%arg0: tensor<?x?xf32> loc("<stdin>":7:8), %arg1: tensor<?xf32> loc("<stdin>":7:32), %arg2: tensor<?xf32> loc("<stdin>":7:54)):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":8:10)
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":9:10)
    %2 = "tensor.dim"(%arg0, %0) : (tensor<?x?xf32>, index) -> index loc("<stdin>":10:10)
    %3 = "tensor.dim"(%arg0, %1) : (tensor<?x?xf32>, index) -> index loc("<stdin>":11:10)
    %4 = "tensor.empty"(%3, %2) : (index, index) -> tensor<?x?xf32> loc("<stdin>":12:10)
    %5 = "tensor.empty"(%2, %3) : (index, index) -> tensor<?x?xf32> loc("<stdin>":13:10)
    %6:2 = "linalg.generic"(%arg0, %arg1, %arg2, %4, %5) <{indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0)>, affine_map<(d0, d1) -> (d1)>, affine_map<(d0, d1) -> (d1, d0)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 3, 2>}> ({
    ^bb0(%arg3: f32 loc("<stdin>":15:10), %arg4: f32 loc("<stdin>":15:22), %arg5: f32 loc("<stdin>":15:34), %arg6: f32 loc("<stdin>":15:46), %arg7: f32 loc("<stdin>":15:58)):
      %7 = "arith.addf"(%arg3, %arg4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":16:12)
      %8 = "arith.mulf"(%7, %arg5) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":17:12)
      "linalg.yield"(%7, %8) : (f32, f32) -> () loc("<stdin>":18:7)
    }) : (tensor<?x?xf32>, tensor<?xf32>, tensor<?xf32>, tensor<?x?xf32>, tensor<?x?xf32>) -> (tensor<?x?xf32>, tensor<?x?xf32>) loc("<stdin>":14:12)
    "func.return"(%6#0, %6#1) : (tensor<?x?xf32>, tensor<?x?xf32>) -> () loc("<stdin>":20:5)
  }) : () -> () loc("<stdin>":6:3)
}) : () -> () loc("<stdin>":5:1)
