#map = affine_map<(d0, d1) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?xf32>, tensor<?x?xf32>) -> tensor<?x?xf32>, sym_name = "drop_unused_producer_result"}> ({
  ^bb0(%arg0: tensor<?x?xf32>, %arg1: tensor<?x?xf32>):
    %0:2 = "linalg.generic"(%arg0, %arg0, %arg0) <{indexing_maps = [#map, #map, #map], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 2>}> ({
    ^bb0(%arg5: f32, %arg6: f32, %arg7: f32):
      %3 = "arith.addf"(%arg5, %arg5) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %4 = "arith.mulf"(%arg5, %arg5) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%3, %4) : (f32, f32) -> ()
    }) : (tensor<?x?xf32>, tensor<?x?xf32>, tensor<?x?xf32>) -> (tensor<?x?xf32>, tensor<?x?xf32>)
    %1 = "linalg.generic"(%0#0, %arg1, %arg0) <{indexing_maps = [#map, #map, #map], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg2: f32, %arg3: f32, %arg4: f32):
      %2 = "arith.subf"(%arg2, %arg3) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%2) : (f32) -> ()
    }) : (tensor<?x?xf32>, tensor<?x?xf32>, tensor<?x?xf32>) -> tensor<?x?xf32>
    "func.return"(%1) : (tensor<?x?xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0) -> (d0)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<8xf32>, tensor<8xf32>) -> tensor<8xf32>, sym_name = "handle_unused_operands"}> ({
  ^bb0(%arg0: tensor<8xf32>, %arg1: tensor<8xf32>):
    %0 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %1 = "arith.constant"() <{value = 1.000000e+00 : f32}> : () -> f32
    %2:2 = "linalg.generic"(%arg0, %arg1) <{indexing_maps = [#map, #map], iterator_types = [#linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 0, 2>}> ({
    ^bb0(%arg3: f32, %arg4: f32):
      %4 = "linalg.index"() <{dim = 0 : i64}> : () -> index
      %5 = "arith.index_cast"(%4) : (index) -> i64
      %6 = "arith.sitofp"(%5) : (i64) -> f32
      %7 = "arith.divf"(%6, %0) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%6, %7) : (f32, f32) -> ()
    }) : (tensor<8xf32>, tensor<8xf32>) -> (tensor<8xf32>, tensor<8xf32>)
    "linalg.generic"(%2#1) <{indexing_maps = [#map], iterator_types = [#linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 0>}> ({
    ^bb0(%arg2: f32):
      %3 = "arith.cmpf"(%arg2, %1) <{fastmath = #arith.fastmath<none>, predicate = 6 : i64}> : (f32, f32) -> i1
      "cf.assert"(%3) <{msg = "Side effect op"}> : (i1) -> ()
      "linalg.yield"() : () -> ()
    }) : (tensor<8xf32>) -> ()
    "func.return"(%arg1) : (tensor<8xf32>) -> ()
  }) : () -> ()
}) : () -> ()

