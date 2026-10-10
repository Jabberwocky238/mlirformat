"builtin.module"() ({
  "func.func"() <{function_type = (index) -> (), sym_name = "views"}> ({
  ^bb0(%arg0: index):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.muli"(%arg0, %arg0) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
    %2 = "memref.alloc"(%1) <{operandSegmentSizes = array<i32: 1, 0>}> : (index) -> memref<?xi8>
    %3 = "memref.view"(%2, %0, %arg0, %arg0) : (memref<?xi8>, index, index, index) -> memref<?x?xf32>
    %4 = "memref.view"(%2, %0, %arg0, %arg0) : (memref<?xi8>, index, index, index) -> memref<?x?xvector<4x4xf32>>
    "memref.dealloc"(%2) : (memref<?xi8>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d2, d1)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1)>
#map3 = affine_map<(d0, d1) -> (d0, d1)>
#map4 = affine_map<(d0, d1) -> (d1)>
#map5 = affine_map<(d0, d1) -> (d0)>
#map6 = affine_map<(d0) -> (d0)>
#map7 = affine_map<(d0) -> ()>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<?x?xf32, strided<[?, 1], offset: ?>>, memref<?xf32, strided<[1], offset: ?>>, memref<?xf32, strided<[1], offset: ?>>, memref<f32>) -> (), sym_name = "ops"}> ({
  ^bb0(%arg0: memref<?x?xf32, strided<[?, 1], offset: ?>>, %arg1: memref<?xf32, strided<[1], offset: ?>>, %arg2: memref<?xf32, strided<[1], offset: ?>>, %arg3: memref<f32>):
    "linalg.matmul"(%arg0, %arg0, %arg0) <{indexing_maps = [#map, #map1, #map2], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg10: f32, %arg11: f32, %arg12: f32):
      %4 = "arith.mulf"(%arg10, %arg11) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %5 = "arith.addf"(%arg12, %4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%5) : (f32) -> ()
    }) : (memref<?x?xf32, strided<[?, 1], offset: ?>>, memref<?x?xf32, strided<[?, 1], offset: ?>>, memref<?x?xf32, strided<[?, 1], offset: ?>>) -> ()
    "linalg.matvec"(%arg0, %arg1, %arg2) <{operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg7: f32, %arg8: f32, %arg9: f32):
      %2 = "arith.mulf"(%arg7, %arg8) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %3 = "arith.addf"(%arg9, %2) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%3) : (f32) -> ()
    }) {linalg.memoized_indexing_maps = [#map3, #map4, #map5]} : (memref<?x?xf32, strided<[?, 1], offset: ?>>, memref<?xf32, strided<[1], offset: ?>>, memref<?xf32, strided<[1], offset: ?>>) -> ()
    "linalg.dot"(%arg1, %arg2, %arg3) <{operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg4: f32, %arg5: f32, %arg6: f32):
      %0 = "arith.mulf"(%arg4, %arg5) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %1 = "arith.addf"(%arg6, %0) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%1) : (f32) -> ()
    }) {linalg.memoized_indexing_maps = [#map6, #map6, #map7]} : (memref<?xf32, strided<[1], offset: ?>>, memref<?xf32, strided<[1], offset: ?>>, memref<f32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<?xf32, strided<[1], offset: ?>>, f32) -> (), sym_name = "fill_view"}> ({
  ^bb0(%arg0: memref<?xf32, strided<[1], offset: ?>>, %arg1: f32):
    "linalg.fill"(%arg1, %arg0) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg2: f32, %arg3: f32):
      "linalg.yield"(%arg2) : (f32) -> ()
    }) : (f32, memref<?xf32, strided<[1], offset: ?>>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2) -> (d2, d1, d0)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<?x?x?xf32, strided<[?, ?, 1], offset: ?>>) -> (), sym_name = "memref_transpose"}> ({
  ^bb0(%arg0: memref<?x?x?xf32, strided<[?, ?, 1], offset: ?>>):
    %0 = "memref.transpose"(%arg0) <{permutation = #map}> : (memref<?x?x?xf32, strided<[?, ?, 1], offset: ?>>) -> memref<?x?x?xf32, strided<[1, ?, ?], offset: ?>>
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<?x?x?xf32, strided<[?, ?, 1], offset: ?>>, f32) -> (), sym_name = "fill_view3"}> ({
  ^bb0(%arg0: memref<?x?x?xf32, strided<[?, ?, 1], offset: ?>>, %arg1: f32):
    "linalg.fill"(%arg1, %arg0) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg2: f32, %arg3: f32):
      "linalg.yield"(%arg2) : (f32) -> ()
    }) : (f32, memref<?x?x?xf32, strided<[?, ?, 1], offset: ?>>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2) -> (d1, d0)>
#map1 = affine_map<(d0, d1, d2) -> ()>
#map2 = affine_map<(d0, d1, d2) -> (d0, d2, d0 + d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<?x?xvector<3x4xi4>, strided<[?, 1], offset: ?>>, memref<?x?x?xf32, strided<[?, ?, 1], offset: ?>>) -> (), sym_name = "generic"}> ({
  ^bb0(%arg0: memref<?x?xvector<3x4xi4>, strided<[?, 1], offset: ?>>, %arg1: memref<?x?x?xf32, strided<[?, ?, 1], offset: ?>>):
    %0 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    "linalg.generic"(%arg0, %0, %arg1) <{indexing_maps = [#map, #map1, #map2], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], library_call = "some_external_function_name_1", operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg2: vector<3x4xi4>, %arg3: f32, %arg4: f32):
      "linalg.yield"(%arg3) : (f32) -> ()
    }) {foo = 1 : i64} : (memref<?x?xvector<3x4xi4>, strided<[?, 1], offset: ?>>, f32, memref<?x?x?xf32, strided<[?, ?, 1], offset: ?>>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d1, d2)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<?x?x?xf32>) -> (), sym_name = "generic_without_inputs"}> ({
  ^bb0(%arg0: memref<?x?x?xf32>):
    "linalg.generic"(%arg0) <{indexing_maps = [#map], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 0, 1>}> ({
    ^bb0(%arg1: f32):
      %0 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
      "linalg.yield"(%0) : (f32) -> ()
    }) : (memref<?x?x?xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2) -> (d1, d0)>
#map1 = affine_map<(d0, d1, d2) -> (d0, d2, d0 + d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?xvector<3x4xi4>>, tensor<?x?x?xf32>) -> tensor<?x?x?xf32>, sym_name = "generic_with_tensor_input_and_output"}> ({
  ^bb0(%arg0: tensor<?x?xvector<3x4xi4>>, %arg1: tensor<?x?x?xf32>):
    %0 = "linalg.generic"(%arg0, %arg1, %arg1) <{indexing_maps = [#map, #map1, #map1], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], library_call = "some_external_function_name_1", operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg2: vector<3x4xi4>, %arg3: f32, %arg4: f32):
      %1 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
      "linalg.yield"(%1) : (f32) -> ()
    }) {foo = 1 : i64} : (tensor<?x?xvector<3x4xi4>>, tensor<?x?x?xf32>, tensor<?x?x?xf32>) -> tensor<?x?x?xf32>
    "func.return"(%0) : (tensor<?x?x?xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0) -> (d0)>
#map1 = affine_map<(d0) -> ()>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?xi32>, tensor<?xi32>, i32) -> (tensor<i32>, tensor<i32>), sym_name = "generic_with_multiple_tensor_outputs"}> ({
  ^bb0(%arg0: tensor<?xi32>, %arg1: tensor<?xi32>, %arg2: i32):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "tensor.empty"() : () -> tensor<i32>
    %2 = "linalg.fill"(%arg2, %1) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg9: i32, %arg10: i32):
      "linalg.yield"(%arg9) : (i32) -> ()
    }) : (i32, tensor<i32>) -> tensor<i32>
    %3 = "tensor.empty"() : () -> tensor<i32>
    %4 = "linalg.fill"(%arg2, %3) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg7: i32, %arg8: i32):
      "linalg.yield"(%arg7) : (i32) -> ()
    }) : (i32, tensor<i32>) -> tensor<i32>
    %5:2 = "linalg.generic"(%arg0, %arg1, %2, %4) <{indexing_maps = [#map, #map, #map1, #map1], iterator_types = [#linalg.iterator_type<reduction>], operandSegmentSizes = array<i32: 2, 2>}> ({
    ^bb0(%arg3: i32, %arg4: i32, %arg5: i32, %arg6: i32):
      %6 = "arith.cmpi"(%arg3, %arg5) <{predicate = 5 : i64}> : (i32, i32) -> i1
      %7 = "arith.select"(%6, %arg3, %arg5) : (i1, i32, i32) -> i32
      %8 = "arith.cmpi"(%arg3, %arg5) <{predicate = 0 : i64}> : (i32, i32) -> i1
      %9 = "arith.cmpi"(%arg4, %arg6) <{predicate = 2 : i64}> : (i32, i32) -> i1
      %10 = "arith.select"(%9, %arg4, %arg6) : (i1, i32, i32) -> i32
      %11 = "arith.select"(%6, %arg4, %arg6) : (i1, i32, i32) -> i32
      %12 = "arith.select"(%8, %10, %11) : (i1, i32, i32) -> i32
      "linalg.yield"(%7, %12) : (i32, i32) -> ()
    }) : (tensor<?xi32>, tensor<?xi32>, tensor<i32>, tensor<i32>) -> (tensor<i32>, tensor<i32>)
    "func.return"(%5#0, %5#1) : (tensor<i32>, tensor<i32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> ()>
#map1 = affine_map<(d0, d1) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<f32>, tensor<3x4xf32>) -> tensor<3x4xf32>, sym_name = "generic_op_zero_rank"}> ({
  ^bb0(%arg0: tensor<f32>, %arg1: tensor<3x4xf32>):
    %0 = "linalg.generic"(%arg0, %arg1) <{indexing_maps = [#map, #map1], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], library_call = "some_broadcast_external_fn", operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg2: f32, %arg3: f32):
      "linalg.yield"(%arg2) : (f32) -> ()
    }) : (tensor<f32>, tensor<3x4xf32>) -> tensor<3x4xf32>
    "func.return"(%0) : (tensor<3x4xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2) -> (d1, d0)>
#map1 = affine_map<(d0, d1, d2) -> (d0, d2, d0 + d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<?x?xvector<3x4xi4>, strided<[?, 1], offset: ?>>, memref<?x?x?xf32, strided<[?, ?, 1], offset: ?>>) -> (), sym_name = "generic_region"}> ({
  ^bb0(%arg0: memref<?x?xvector<3x4xi4>, strided<[?, 1], offset: ?>>, %arg1: memref<?x?x?xf32, strided<[?, ?, 1], offset: ?>>):
    "linalg.generic"(%arg0, %arg1) <{indexing_maps = [#map, #map1], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], library_call = "some_external_function_name_2", operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg2: vector<3x4xi4>, %arg3: f32):
      %0 = "linalg.index"() <{dim = 0 : i64}> : () -> index
      %1 = "linalg.index"() <{dim = 1 : i64}> : () -> index
      %2 = "linalg.index"() <{dim = 2 : i64}> : () -> index
      "linalg.yield"(%arg3) : (f32) -> ()
    }) {foo = 1 : i64} : (memref<?x?xvector<3x4xi4>, strided<[?, 1], offset: ?>>, memref<?x?x?xf32, strided<[?, ?, 1], offset: ?>>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d0, d1, d3)>
#map1 = affine_map<(d0, d1, d2, d3) -> (d0, d3, d2)>
#map2 = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<?x?x?xf32>, memref<?x?x?xf32>, memref<?x?x?xf32>, tensor<?x?x?xf32>, tensor<?x?x?xf32>, tensor<?x?x?xf32>) -> (tensor<?x?x?xf32>, tensor<?x?x?xf32>), sym_name = "named_ops"}> ({
  ^bb0(%arg0: memref<?x?x?xf32>, %arg1: memref<?x?x?xf32>, %arg2: memref<?x?x?xf32>, %arg3: tensor<?x?x?xf32>, %arg4: tensor<?x?x?xf32>, %arg5: tensor<?x?x?xf32>):
    "linalg.batch_matmul"(%arg0, %arg1, %arg2) <{indexing_maps = [#map, #map1, #map2], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg15: f32, %arg16: f32, %arg17: f32):
      %8 = "arith.mulf"(%arg15, %arg16) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %9 = "arith.addf"(%arg17, %8) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%9) : (f32) -> ()
    }) : (memref<?x?x?xf32>, memref<?x?x?xf32>, memref<?x?x?xf32>) -> ()
    "linalg.contract"(%arg0, %arg1, %arg2) <{indexing_maps = [#map, #map1, #map2], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg12: f32, %arg13: f32, %arg14: f32):
      %6 = "arith.mulf"(%arg12, %arg13) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %7 = "arith.addf"(%arg14, %6) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%7) : (f32) -> ()
    }) : (memref<?x?x?xf32>, memref<?x?x?xf32>, memref<?x?x?xf32>) -> ()
    %0 = "linalg.batch_matmul"(%arg3, %arg4, %arg5) <{indexing_maps = [#map, #map1, #map2], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg9: f32, %arg10: f32, %arg11: f32):
      %4 = "arith.mulf"(%arg9, %arg10) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %5 = "arith.addf"(%arg11, %4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%5) : (f32) -> ()
    }) : (tensor<?x?x?xf32>, tensor<?x?x?xf32>, tensor<?x?x?xf32>) -> tensor<?x?x?xf32>
    %1 = "linalg.contract"(%arg3, %arg4, %arg5) <{indexing_maps = [#map, #map1, #map2], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg6: f32, %arg7: f32, %arg8: f32):
      %2 = "arith.mulf"(%arg6, %arg7) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %3 = "arith.addf"(%arg8, %2) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%3) : (f32) -> ()
    }) : (tensor<?x?x?xf32>, tensor<?x?x?xf32>, tensor<?x?x?xf32>) -> tensor<?x?x?xf32>
    "func.return"(%0, %1) : (tensor<?x?x?xf32>, tensor<?x?x?xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index, index, f32) -> tensor<?x?xf32>, sym_name = "fill_tensor"}> ({
  ^bb0(%arg0: index, %arg1: index, %arg2: f32):
    %0 = "tensor.empty"(%arg0, %arg1) : (index, index) -> tensor<?x?xf32>
    %1 = "linalg.fill"(%arg2, %0) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg3: f32, %arg4: f32):
      "linalg.yield"(%arg3) : (f32) -> ()
    }) : (f32, tensor<?x?xf32>) -> tensor<?x?xf32>
    "func.return"(%1) : (tensor<?x?xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d1, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?x?xf32>, tensor<?x?xf32>, tensor<?x?x?xf32>, tensor<?x?xf32>) -> (tensor<?x?x?xf32>, tensor<?x?xf32>), sym_name = "mixed_parallel_reduced_results"}> ({
  ^bb0(%arg0: tensor<?x?x?xf32>, %arg1: tensor<?x?xf32>, %arg2: tensor<?x?x?xf32>, %arg3: tensor<?x?xf32>):
    %0:2 = "linalg.generic"(%arg0, %arg1, %arg2, %arg3) <{indexing_maps = [#map, #map1, #map, #map1], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<reduction>], operandSegmentSizes = array<i32: 2, 2>}> ({
    ^bb0(%arg4: f32, %arg5: f32, %arg6: f32, %arg7: f32):
      %1 = "arith.mulf"(%arg4, %arg5) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %2 = "arith.addf"(%1, %arg7) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%1, %2) : (f32, f32) -> ()
    }) : (tensor<?x?x?xf32>, tensor<?x?xf32>, tensor<?x?x?xf32>, tensor<?x?xf32>) -> (tensor<?x?x?xf32>, tensor<?x?xf32>)
    "func.return"(%0#0, %0#1) : (tensor<?x?x?xf32>, tensor<?x?xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<64xf32>) -> tensor<64xf32>, sym_name = "map_no_inputs"}> ({
  ^bb0(%arg0: tensor<64xf32>):
    %0 = "linalg.map"(%arg0) ({
    ^bb0(%arg1: f32):
      %1 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
      "linalg.yield"(%1) : (f32) -> ()
    }) : (tensor<64xf32>) -> tensor<64xf32>
    "func.return"(%0) : (tensor<64xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<64xf32>, tensor<64xf32>, tensor<64xf32>) -> tensor<64xf32>, sym_name = "map_binary"}> ({
  ^bb0(%arg0: tensor<64xf32>, %arg1: tensor<64xf32>, %arg2: tensor<64xf32>):
    %0 = "linalg.map"(%arg0, %arg1, %arg2) ({
    ^bb0(%arg3: f32, %arg4: f32, %arg5: f32):
      %1 = "arith.addf"(%arg3, %arg4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%1) : (f32) -> ()
    }) : (tensor<64xf32>, tensor<64xf32>, tensor<64xf32>) -> tensor<64xf32>
    "func.return"(%0) : (tensor<64xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<64xf32>, memref<64xf32>, memref<64xf32>) -> (), sym_name = "map_binary_memref"}> ({
  ^bb0(%arg0: memref<64xf32>, %arg1: memref<64xf32>, %arg2: memref<64xf32>):
    "linalg.map"(%arg0, %arg1, %arg2) ({
    ^bb0(%arg3: f32, %arg4: f32, %arg5: f32):
      %0 = "arith.addf"(%arg3, %arg4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%0) : (f32) -> ()
    }) : (memref<64xf32>, memref<64xf32>, memref<64xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<64xf32>, tensor<64xf32>) -> tensor<64xf32>, sym_name = "map_unary"}> ({
  ^bb0(%arg0: tensor<64xf32>, %arg1: tensor<64xf32>):
    %0 = "linalg.map"(%arg0, %arg1) ({
    ^bb0(%arg2: f32, %arg3: f32):
      %1 = "math.absf"(%arg2) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
      "linalg.yield"(%1) : (f32) -> ()
    }) : (tensor<64xf32>, tensor<64xf32>) -> tensor<64xf32>
    "func.return"(%0) : (tensor<64xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<64xf32>, memref<64xf32>) -> (), sym_name = "map_unary_memref"}> ({
  ^bb0(%arg0: memref<64xf32>, %arg1: memref<64xf32>):
    "linalg.map"(%arg0, %arg1) ({
    ^bb0(%arg2: f32, %arg3: f32):
      %0 = "math.absf"(%arg2) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
      "linalg.yield"(%0) : (f32) -> ()
    }) : (memref<64xf32>, memref<64xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<16x32x64xf32>, tensor<16x64xf32>) -> tensor<16x64xf32>, sym_name = "reduce"}> ({
  ^bb0(%arg0: tensor<16x32x64xf32>, %arg1: tensor<16x64xf32>):
    %0 = "linalg.reduce"(%arg0, %arg1) <{dimensions = array<i64: 1>}> ({
    ^bb0(%arg2: f32, %arg3: f32):
      %1 = "arith.addf"(%arg3, %arg2) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%1) : (f32) -> ()
    }) : (tensor<16x32x64xf32>, tensor<16x64xf32>) -> tensor<16x64xf32>
    "func.return"(%0) : (tensor<16x64xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<16x32x64xf32>, tensor<16x64xf32>) -> tensor<16x64xf32>, sym_name = "reduce_not_short_form_compatible"}> ({
  ^bb0(%arg0: tensor<16x32x64xf32>, %arg1: tensor<16x64xf32>):
    %0 = "linalg.reduce"(%arg0, %arg1) <{dimensions = array<i64: 1>}> ({
    ^bb0(%arg2: f32, %arg3: f32):
      %1 = "arith.addf"(%arg2, %arg3) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%arg2) : (f32) -> ()
    }) : (tensor<16x32x64xf32>, tensor<16x64xf32>) -> tensor<16x64xf32>
    "func.return"(%0) : (tensor<16x64xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<16x32x64xf32>, memref<16x64xf32>) -> (), sym_name = "reduce_memref"}> ({
  ^bb0(%arg0: memref<16x32x64xf32>, %arg1: memref<16x64xf32>):
    "linalg.reduce"(%arg0, %arg1) <{dimensions = array<i64: 1>}> ({
    ^bb0(%arg2: f32, %arg3: f32):
      %0 = "arith.addf"(%arg3, %arg2) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%0) : (f32) -> ()
    }) : (memref<16x32x64xf32>, memref<16x64xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<16x32x64xf32>, tensor<16x64xf32>, tensor<16x32x64xi64>, tensor<16x64xi64>) -> (tensor<16x64xf32>, tensor<16x64xi64>), sym_name = "variadic_reduce"}> ({
  ^bb0(%arg0: tensor<16x32x64xf32>, %arg1: tensor<16x64xf32>, %arg2: tensor<16x32x64xi64>, %arg3: tensor<16x64xi64>):
    %0:2 = "linalg.reduce"(%arg0, %arg2, %arg1, %arg3) <{dimensions = array<i64: 1>}> ({
    ^bb0(%arg4: f32, %arg5: i64, %arg6: f32, %arg7: i64):
      %1 = "arith.addf"(%arg4, %arg6) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %2 = "arith.addi"(%arg5, %arg7) <{overflowFlags = #arith.overflow<none>}> : (i64, i64) -> i64
      "linalg.yield"(%1, %2) : (f32, i64) -> ()
    }) : (tensor<16x32x64xf32>, tensor<16x32x64xi64>, tensor<16x64xf32>, tensor<16x64xi64>) -> (tensor<16x64xf32>, tensor<16x64xi64>)
    "func.return"(%0#0, %0#1) : (tensor<16x64xf32>, tensor<16x64xi64>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<16x32x64xf32>, memref<16x64xf32>, memref<16x32x64xi64>, memref<16x64xi64>) -> (), sym_name = "variadic_reduce_memref"}> ({
  ^bb0(%arg0: memref<16x32x64xf32>, %arg1: memref<16x64xf32>, %arg2: memref<16x32x64xi64>, %arg3: memref<16x64xi64>):
    "linalg.reduce"(%arg0, %arg2, %arg1, %arg3) <{dimensions = array<i64: 1>}> ({
    ^bb0(%arg4: f32, %arg5: i64, %arg6: f32, %arg7: i64):
      %0 = "arith.addf"(%arg4, %arg6) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %1 = "arith.addi"(%arg5, %arg7) <{overflowFlags = #arith.overflow<none>}> : (i64, i64) -> i64
      "linalg.yield"(%0, %1) : (f32, i64) -> ()
    }) : (memref<16x32x64xf32>, memref<16x32x64xi64>, memref<16x64xf32>, memref<16x64xi64>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<16x32x64xf32>, tensor<32x64x16xf32>) -> tensor<32x64x16xf32>, sym_name = "transpose"}> ({
  ^bb0(%arg0: tensor<16x32x64xf32>, %arg1: tensor<32x64x16xf32>):
    %0 = "linalg.transpose"(%arg0, %arg1) <{permutation = array<i64: 1, 2, 0>}> ({
    ^bb0(%arg2: f32, %arg3: f32):
      "linalg.yield"(%arg2) : (f32) -> ()
    }) : (tensor<16x32x64xf32>, tensor<32x64x16xf32>) -> tensor<32x64x16xf32>
    "func.return"(%0) : (tensor<32x64x16xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<16x32x64xf32>, memref<32x64x16xf32>) -> (), sym_name = "transpose_memref"}> ({
  ^bb0(%arg0: memref<16x32x64xf32>, %arg1: memref<32x64x16xf32>):
    "linalg.transpose"(%arg0, %arg1) <{permutation = array<i64: 1, 2, 0>}> ({
    ^bb0(%arg2: f32, %arg3: f32):
      "linalg.yield"(%arg2) : (f32) -> ()
    }) : (memref<16x32x64xf32>, memref<32x64x16xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<8x32xf32>, tensor<8x16x32xf32>) -> tensor<8x16x32xf32>, sym_name = "broadcast_static_sizes"}> ({
  ^bb0(%arg0: tensor<8x32xf32>, %arg1: tensor<8x16x32xf32>):
    %0 = "linalg.broadcast"(%arg0, %arg1) <{dimensions = array<i64: 1>}> ({
    ^bb0(%arg2: f32, %arg3: f32):
      "linalg.yield"(%arg2) : (f32) -> ()
    }) : (tensor<8x32xf32>, tensor<8x16x32xf32>) -> tensor<8x16x32xf32>
    "func.return"(%0) : (tensor<8x16x32xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<8x?xf32>, tensor<8x16x?xf32>) -> tensor<8x16x?xf32>, sym_name = "broadcast_with_dynamic_sizes"}> ({
  ^bb0(%arg0: tensor<8x?xf32>, %arg1: tensor<8x16x?xf32>):
    %0 = "linalg.broadcast"(%arg0, %arg1) <{dimensions = array<i64: 1>}> ({
    ^bb0(%arg2: f32, %arg3: f32):
      "linalg.yield"(%arg2) : (f32) -> ()
    }) : (tensor<8x?xf32>, tensor<8x16x?xf32>) -> tensor<8x16x?xf32>
    "func.return"(%0) : (tensor<8x16x?xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<8x32xf32>, memref<8x16x32xf32>) -> (), sym_name = "broadcast_memref"}> ({
  ^bb0(%arg0: memref<8x32xf32>, %arg1: memref<8x16x32xf32>):
    "linalg.broadcast"(%arg0, %arg1) <{dimensions = array<i64: 1>}> ({
    ^bb0(%arg2: f32, %arg3: f32):
      "linalg.yield"(%arg2) : (f32) -> ()
    }) : (memref<8x32xf32>, memref<8x16x32xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<64xf32>, tensor<64xf32>, tensor<64xf32>) -> tensor<64xf32>, sym_name = "map_arith_with_attr"}> ({
  ^bb0(%arg0: tensor<64xf32>, %arg1: tensor<64xf32>, %arg2: tensor<64xf32>):
    %0 = "linalg.map"(%arg0, %arg1, %arg2) ({
    ^bb0(%arg3: f32, %arg4: f32, %arg5: f32):
      %1 = "arith.addf"(%arg3, %arg4) <{fastmath = #arith.fastmath<fast>}> : (f32, f32) -> f32
      "linalg.yield"(%1) : (f32) -> ()
    }) : (tensor<64xf32>, tensor<64xf32>, tensor<64xf32>) -> tensor<64xf32>
    "func.return"(%0) : (tensor<64xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1x32xf32>, tensor<1x32xf32>, tensor<1x32xf32>) -> tensor<1x32xf32>, sym_name = "map_not_short_form_compatible"}> ({
  ^bb0(%arg0: tensor<1x32xf32>, %arg1: tensor<1x32xf32>, %arg2: tensor<1x32xf32>):
    %0 = "linalg.map"(%arg0, %arg1, %arg2) ({
    ^bb0(%arg3: f32, %arg4: f32, %arg5: f32):
      %1 = "arith.maximumf"(%arg3, %arg4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%arg3) : (f32) -> ()
    }) : (tensor<1x32xf32>, tensor<1x32xf32>, tensor<1x32xf32>) -> tensor<1x32xf32>
    "func.return"(%0) : (tensor<1x32xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<16x32x64xf32>, tensor<16x64xf32>) -> tensor<16x64xf32>, sym_name = "reduce_arith_with_attr"}> ({
  ^bb0(%arg0: tensor<16x32x64xf32>, %arg1: tensor<16x64xf32>):
    %0 = "linalg.reduce"(%arg0, %arg1) <{dimensions = array<i64: 1>}> ({
    ^bb0(%arg2: f32, %arg3: f32):
      %1 = "arith.addf"(%arg3, %arg2) <{fastmath = #arith.fastmath<fast>}> : (f32, f32) -> f32
      "linalg.yield"(%1) : (f32) -> ()
    }) : (tensor<16x32x64xf32>, tensor<16x64xf32>) -> tensor<16x64xf32>
    "func.return"(%0) : (tensor<16x64xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<2x16x32xf32>) -> tensor<2x16x32xf32>, sym_name = "softmax"}> ({
  ^bb0(%arg0: tensor<2x16x32xf32>):
    %0 = "tensor.empty"() : () -> tensor<2x16x32xf32>
    %1 = "linalg.softmax"(%arg0, %0) <{dimension = 2 : i64}> : (tensor<2x16x32xf32>, tensor<2x16x32xf32>) -> tensor<2x16x32xf32>
    "func.return"(%1) : (tensor<2x16x32xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d0, d1, d3)>
#map1 = affine_map<(d0, d1, d2, d3) -> (d0, d3, d2)>
#map2 = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<2x6x6x5xf32>, tensor<2x3x3x5xf32>, tensor<1xf32>, tensor<2x4x4x2xf32>) -> tensor<2x4x4x2xf32>, sym_name = "winograd"}> ({
  ^bb0(%arg0: tensor<2x6x6x5xf32>, %arg1: tensor<2x3x3x5xf32>, %arg2: tensor<1xf32>, %arg3: tensor<2x4x4x2xf32>):
    %0 = "tensor.empty"() : () -> tensor<6x6x5x2xf32>
    %1 = "linalg.winograd_filter_transform"(%arg1, %0) <{fmr = 1 : i32}> : (tensor<2x3x3x5xf32>, tensor<6x6x5x2xf32>) -> tensor<6x6x5x2xf32>
    %2 = "tensor.empty"() : () -> tensor<6x6x1x1x2x5xf32>
    %3 = "linalg.winograd_input_transform"(%arg0, %2) <{fmr = 1 : i32}> : (tensor<2x6x6x5xf32>, tensor<6x6x1x1x2x5xf32>) -> tensor<6x6x1x1x2x5xf32>
    %4 = "tensor.collapse_shape"(%1) <{reassociation = [[0, 1], [2], [3]]}> : (tensor<6x6x5x2xf32>) -> tensor<36x5x2xf32>
    %5 = "tensor.collapse_shape"(%3) <{reassociation = [[0, 1], [2, 3, 4], [5]]}> : (tensor<6x6x1x1x2x5xf32>) -> tensor<36x2x5xf32>
    %6 = "tensor.empty"() : () -> tensor<36x2x2xf32>
    %7 = "linalg.batch_matmul"(%5, %4, %6) <{indexing_maps = [#map, #map1, #map2], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg4: f32, %arg5: f32, %arg6: f32):
      %10 = "arith.mulf"(%arg4, %arg5) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %11 = "arith.addf"(%arg6, %10) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%11) : (f32) -> ()
    }) : (tensor<36x2x5xf32>, tensor<36x5x2xf32>, tensor<36x2x2xf32>) -> tensor<36x2x2xf32>
    %8 = "tensor.expand_shape"(%7) <{reassociation = [[0, 1], [2, 3, 4], [5]], static_output_shape = array<i64: 6, 6, 1, 1, 2, 2>}> : (tensor<36x2x2xf32>) -> tensor<6x6x1x1x2x2xf32>
    %9 = "linalg.winograd_output_transform"(%8, %arg3) <{fmr = 1 : i32}> : (tensor<6x6x1x1x2x2xf32>, tensor<2x4x4x2xf32>) -> tensor<2x4x4x2xf32>
    "func.return"(%9) : (tensor<2x4x4x2xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x3x3x?xf32>, tensor<6x6x?x?xf32>) -> tensor<6x6x?x?xf32>, sym_name = "winograd_filter_dyn"}> ({
  ^bb0(%arg0: tensor<?x3x3x?xf32>, %arg1: tensor<6x6x?x?xf32>):
    %0 = "linalg.winograd_filter_transform"(%arg0, %arg1) <{fmr = 1 : i32}> : (tensor<?x3x3x?xf32>, tensor<6x6x?x?xf32>) -> tensor<6x6x?x?xf32>
    "func.return"(%0) : (tensor<6x6x?x?xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?x?x?xf32>, tensor<6x6x?x?x?x?xf32>) -> tensor<6x6x?x?x?x?xf32>, sym_name = "winograd_input_dyn"}> ({
  ^bb0(%arg0: tensor<?x?x?x?xf32>, %arg1: tensor<6x6x?x?x?x?xf32>):
    %0 = "linalg.winograd_input_transform"(%arg0, %arg1) <{fmr = 1 : i32}> : (tensor<?x?x?x?xf32>, tensor<6x6x?x?x?x?xf32>) -> tensor<6x6x?x?x?x?xf32>
    "func.return"(%0) : (tensor<6x6x?x?x?x?xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<6x6x?x?x?x?xf32>, tensor<?x?x?x?xf32>) -> tensor<?x?x?x?xf32>, sym_name = "winograd_output_dyn"}> ({
  ^bb0(%arg0: tensor<6x6x?x?x?x?xf32>, %arg1: tensor<?x?x?x?xf32>):
    %0 = "linalg.winograd_output_transform"(%arg0, %arg1) <{fmr = 1 : i32}> : (tensor<6x6x?x?x?x?xf32>, tensor<?x?x?x?xf32>) -> tensor<?x?x?x?xf32>
    "func.return"(%0) : (tensor<?x?x?x?xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3, d4, d5, d6) -> (d0, d4, d2 + d5, d3 + d6)>
#map1 = affine_map<(d0, d1, d2, d3, d4, d5, d6) -> (d1, d4, d5, d6)>
#map2 = affine_map<(d0, d1, d2, d3, d4, d5, d6) -> ()>
#map3 = affine_map<(d0, d1, d2, d3, d4, d5, d6) -> (d0, d1, d2, d3)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<100x3x224x224xi32>, tensor<64x3x5x5xi32>, i32, i32) -> tensor<100x64x220x220xi32>, sym_name = "conv2d_channel_first_q"}> ({
  ^bb0(%arg0: tensor<100x3x224x224xi32>, %arg1: tensor<64x3x5x5xi32>, %arg2: i32, %arg3: i32):
    %0 = "arith.constant"() <{value = dense<0> : tensor<100x64x220x220xi32>}> : () -> tensor<100x64x220x220xi32>
    %1 = "linalg.conv_2d_nchw_fchw_q"(%arg0, %arg1, %arg2, %arg3, %0) <{dilations = dense<1> : tensor<2xi64>, operandSegmentSizes = array<i32: 4, 1>, strides = dense<1> : tensor<2xi64>}> ({
    ^bb0(%arg4: i32, %arg5: i32, %arg6: i32, %arg7: i32, %arg8: i32):
      %2 = "arith.subi"(%arg4, %arg6) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      %3 = "arith.subi"(%arg5, %arg7) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      %4 = "arith.muli"(%2, %3) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      %5 = "arith.addi"(%arg8, %4) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      "linalg.yield"(%5) : (i32) -> ()
    }) {linalg.memoized_indexing_maps = [#map, #map1, #map2, #map2, #map3]} : (tensor<100x3x224x224xi32>, tensor<64x3x5x5xi32>, i32, i32, tensor<100x64x220x220xi32>) -> tensor<100x64x220x220xi32>
    "func.return"(%1) : (tensor<100x64x220x220xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3, d4, d5, d6) -> (d0, d4, d2 + d5, d3 + d6)>
#map1 = affine_map<(d0, d1, d2, d3, d4, d5, d6) -> (d1, d4, d5, d6)>
#map2 = affine_map<(d0, d1, d2, d3, d4, d5, d6) -> ()>
#map3 = affine_map<(d0, d1, d2, d3, d4, d5, d6) -> (d0, d1, d2, d3)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<100x3x224x224xi8>, tensor<64x3x5x5xi8>, i8, i8) -> tensor<100x64x220x220xi32>, sym_name = "conv2d_channel_first_q_promote"}> ({
  ^bb0(%arg0: tensor<100x3x224x224xi8>, %arg1: tensor<64x3x5x5xi8>, %arg2: i8, %arg3: i8):
    %0 = "arith.constant"() <{value = dense<0> : tensor<100x64x220x220xi32>}> : () -> tensor<100x64x220x220xi32>
    %1 = "linalg.conv_2d_nchw_fchw_q"(%arg0, %arg1, %arg2, %arg3, %0) <{dilations = dense<1> : tensor<2xi64>, operandSegmentSizes = array<i32: 4, 1>, strides = dense<1> : tensor<2xi64>}> ({
    ^bb0(%arg4: i8, %arg5: i8, %arg6: i8, %arg7: i8, %arg8: i32):
      %2 = "arith.extsi"(%arg4) : (i8) -> i32
      %3 = "arith.extsi"(%arg6) : (i8) -> i32
      %4 = "arith.subi"(%2, %3) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      %5 = "arith.extsi"(%arg5) : (i8) -> i32
      %6 = "arith.extsi"(%arg7) : (i8) -> i32
      %7 = "arith.subi"(%5, %6) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      %8 = "arith.muli"(%4, %7) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      %9 = "arith.addi"(%arg8, %8) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      "linalg.yield"(%9) : (i32) -> ()
    }) {linalg.memoized_indexing_maps = [#map, #map1, #map2, #map2, #map3]} : (tensor<100x3x224x224xi8>, tensor<64x3x5x5xi8>, i8, i8, tensor<100x64x220x220xi32>) -> tensor<100x64x220x220xi32>
    "func.return"(%1) : (tensor<100x64x220x220xi32>) -> ()
  }) : () -> ()
}) : () -> ()

