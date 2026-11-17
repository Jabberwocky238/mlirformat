"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x1x?xf32>, f32, tensor<?x1x?x1x?xf32>) -> tensor<?x1x?x1x?xf32>, sym_name = "drop_one_trip_loops"}> ({
  ^bb0(%arg0: tensor<?x1x?xf32> loc("<stdin>":6:8), %arg1: f32 loc("<stdin>":6:34), %arg2: tensor<?x1x?x1x?xf32> loc("<stdin>":6:46)):
    %0 = "linalg.generic"(%arg0, %arg1, %arg2) <{indexing_maps = [affine_map<(d0, d1, d2, d3, d4) -> (d0, d2, d4)>, affine_map<(d0, d1, d2, d3, d4) -> ()>, affine_map<(d0, d1, d2, d3, d4) -> (d0, d2, d1, d3, d4)>], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], library_call = "some_external_func", operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg3: f32 loc("<stdin>":8:10), %arg4: f32 loc("<stdin>":8:22), %arg5: f32 loc("<stdin>":8:34)):
      "linalg.yield"(%arg4) : (f32) -> () loc("<stdin>":9:7)
    }) : (tensor<?x1x?xf32>, f32, tensor<?x1x?x1x?xf32>) -> tensor<?x1x?x1x?xf32> loc("<stdin>":7:10)
    "func.return"(%0) : (tensor<?x1x?x1x?xf32>) -> () loc("<stdin>":11:5)
  }) : () -> () loc("<stdin>":5:3)
}) : () -> () loc("<stdin>":4:1)
