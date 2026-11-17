"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?xf32>, tensor<?x?xf32>) -> tensor<?x?xf32>, sym_name = "drop_unused_producer_result"}> ({
  ^bb0(%arg0: tensor<?x?xf32> loc("<stdin>":4:8), %arg1: tensor<?x?xf32> loc("<stdin>":4:32)):
    %0:2 = "linalg.generic"(%arg0, %arg0, %arg0) <{indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 2>}> ({
    ^bb0(%arg5: f32 loc("<stdin>":6:10), %arg6: f32 loc("<stdin>":6:22), %arg7: f32 loc("<stdin>":6:34)):
      %3 = "arith.addf"(%arg5, %arg5) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":7:12)
      %4 = "arith.mulf"(%arg5, %arg5) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":8:12)
      "linalg.yield"(%3, %4) : (f32, f32) -> () loc("<stdin>":9:7)
    }) : (tensor<?x?xf32>, tensor<?x?xf32>, tensor<?x?xf32>) -> (tensor<?x?xf32>, tensor<?x?xf32>) loc("<stdin>":5:12)
    %1 = "linalg.generic"(%0#0, %arg1, %arg0) <{indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg2: f32 loc("<stdin>":12:10), %arg3: f32 loc("<stdin>":12:22), %arg4: f32 loc("<stdin>":12:34)):
      %2 = "arith.subf"(%arg2, %arg3) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":13:12)
      "linalg.yield"(%2) : (f32) -> () loc("<stdin>":14:7)
    }) : (tensor<?x?xf32>, tensor<?x?xf32>, tensor<?x?xf32>) -> tensor<?x?xf32> loc("<stdin>":11:10)
    "func.return"(%1) : (tensor<?x?xf32>) -> () loc("<stdin>":16:5)
  }) : () -> () loc("<stdin>":3:3)
}) : () -> () loc("<stdin>":2:1)
