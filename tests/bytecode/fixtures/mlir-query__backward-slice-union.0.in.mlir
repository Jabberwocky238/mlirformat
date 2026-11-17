"builtin.module"() ({
  "func.func"() <{function_type = (tensor<5x5xf32>, tensor<5x5xf32>) -> (), sym_name = "slice_use_from_above"}> ({
  ^bb0(%arg0: tensor<5x5xf32> loc("<stdin>":4:8), %arg1: tensor<5x5xf32> loc("<stdin>":4:32)):
    %0 = "linalg.generic"(%arg0, %arg1) <{indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg4: f32 loc("<stdin>":6:10), %arg5: f32 loc("<stdin>":6:22)):
      %6 = "arith.addf"(%arg4, %arg4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":7:12)
      "linalg.yield"(%6) : (f32) -> () loc("<stdin>":8:7)
    }) : (tensor<5x5xf32>, tensor<5x5xf32>) -> tensor<5x5xf32> loc("<stdin>":5:10)
    %1 = "tensor.collapse_shape"(%0) <{reassociation = [[0, 1]]}> : (tensor<5x5xf32>) -> tensor<25xf32> loc("<stdin>":10:10)
    %2 = "linalg.generic"(%0, %arg1) <{indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg2: f32 loc("<stdin>":12:10), %arg3: f32 loc("<stdin>":12:22)):
      %3 = "arith.constant"() <{value = 2 : index}> : () -> index loc("<stdin>":13:12)
      %4 = "tensor.extract"(%1, %3) : (tensor<25xf32>, index) -> f32 loc("<stdin>":14:12)
      %5 = "arith.addf"(%4, %4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":15:12)
      "linalg.yield"(%5) : (f32) -> () loc("<stdin>":16:7)
    }) : (tensor<5x5xf32>, tensor<5x5xf32>) -> tensor<5x5xf32> loc("<stdin>":11:10)
    "func.return"() : () -> () loc("<stdin>":18:5)
  }) : () -> () loc("<stdin>":3:3)
}) : () -> () loc("<stdin>":2:1)
