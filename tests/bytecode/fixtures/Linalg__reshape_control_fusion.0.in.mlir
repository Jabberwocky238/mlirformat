"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?x?xf32>, tensor<?xf32>) -> tensor<?x?xf32>, sym_name = "control_producer_reshape_fusion"}> ({
  ^bb0(%arg0: tensor<?x?x?xf32> loc("<stdin>":5:8), %arg1: tensor<?xf32> loc("<stdin>":5:34)):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":6:10)
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":7:10)
    %2 = "tensor.collapse_shape"(%arg0) <{reassociation = [[0, 1], [2]]}> : (tensor<?x?x?xf32>) -> tensor<?x?xf32> loc("<stdin>":8:10)
    %3 = "tensor.dim"(%2, %0) : (tensor<?x?xf32>, index) -> index loc("<stdin>":9:10)
    %4 = "tensor.dim"(%2, %1) : (tensor<?x?xf32>, index) -> index loc("<stdin>":10:10)
    %5 = "tensor.empty"(%3, %4) : (index, index) -> tensor<?x?xf32> loc("<stdin>":11:10)
    %6 = "linalg.generic"(%2, %arg1, %5) <{indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d1)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg2: f32 loc("<stdin>":13:10), %arg3: f32 loc("<stdin>":13:22), %arg4: f32 loc("<stdin>":13:34)):
      %7 = "arith.addf"(%arg2, %arg3) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":14:12)
      "linalg.yield"(%7) : (f32) -> () loc("<stdin>":15:7)
    }) : (tensor<?x?xf32>, tensor<?xf32>, tensor<?x?xf32>) -> tensor<?x?xf32> loc("<stdin>":12:10)
    "func.return"(%6) : (tensor<?x?xf32>) -> () loc("<stdin>":17:5)
  }) : () -> () loc("<stdin>":4:3)
}) : () -> () loc("<stdin>":3:1)
