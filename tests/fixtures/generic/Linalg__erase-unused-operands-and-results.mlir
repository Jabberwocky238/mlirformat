#map = affine_map<(d0) -> (d0)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?xf32>) -> tensor<?xf32>, sym_name = "remove_deadargs_generic_basic"}> ({
  ^bb0(%arg0: tensor<?xf32>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 7.000000e+00 : f32}> : () -> f32
    %2 = "tensor.dim"(%arg0, %0) : (tensor<?xf32>, index) -> index
    %3 = "tensor.empty"(%2) : (index) -> tensor<?xf32>
    %4 = "tensor.empty"(%2) : (index) -> tensor<?xf32>
    %5 = "linalg.generic"(%arg0, %3, %4) <{indexing_maps = [#map, #map, #map], iterator_types = [#linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg1: f32, %arg2: f32, %arg3: f32):
      %6 = "arith.addf"(%arg1, %1) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%6) : (f32) -> ()
    }) : (tensor<?xf32>, tensor<?xf32>, tensor<?xf32>) -> tensor<?xf32>
    "func.return"(%5) : (tensor<?xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
#map1 = affine_map<(d0, d1) -> (d1, d0)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?xf32>) -> tensor<?x?xf32>, sym_name = "remove_deadargs_generic_mixedaccess"}> ({
  ^bb0(%arg0: tensor<?x?xf32>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 0 : index}> : () -> index
    %2 = "arith.constant"() <{value = 7.000000e+00 : f32}> : () -> f32
    %3 = "arith.constant"() <{value = 6.000000e+00 : f32}> : () -> f32
    %4 = "tensor.dim"(%arg0, %0) : (tensor<?x?xf32>, index) -> index
    %5 = "tensor.dim"(%arg0, %1) : (tensor<?x?xf32>, index) -> index
    %6 = "tensor.empty"(%4, %5) : (index, index) -> tensor<?x?xf32>
    %7 = "tensor.empty"(%5, %4) : (index, index) -> tensor<?x?xf32>
    %8 = "tensor.empty"(%4, %5) : (index, index) -> tensor<?x?xf32>
    %9 = "linalg.generic"(%6, %7, %8) <{indexing_maps = [#map, #map1, #map], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg1: f32, %arg2: f32, %arg3: f32):
      %10 = "arith.divf"(%2, %3) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%10) : (f32) -> ()
    }) : (tensor<?x?xf32>, tensor<?x?xf32>, tensor<?x?xf32>) -> tensor<?x?xf32>
    "func.return"(%9) : (tensor<?x?xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0) -> (d0)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?xf32>) -> tensor<?xf32>, sym_name = "basic"}> ({
  ^bb0(%arg0: tensor<?xf32>):
    %0 = "linalg.generic"(%arg0, %arg0, %arg0) <{indexing_maps = [#map, #map, #map], iterator_types = [#linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg1: f32, %arg2: f32, %arg3: f32):
      %1 = "arith.addf"(%arg1, %arg2) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%1) : (f32) -> ()
    }) {someattr} : (tensor<?xf32>, tensor<?xf32>, tensor<?xf32>) -> tensor<?xf32>
    "func.return"(%0) : (tensor<?xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
#map1 = affine_map<(d0, d1) -> (d1, d0)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?xf32>) -> tensor<?x?xf32>, sym_name = "distinct_affine_maps"}> ({
  ^bb0(%arg0: tensor<?x?xf32>):
    %0 = "linalg.generic"(%arg0, %arg0, %arg0) <{indexing_maps = [#map, #map1, #map], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg1: f32, %arg2: f32, %arg3: f32):
      %1 = "arith.addf"(%arg1, %arg2) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%1) : (f32) -> ()
    }) : (tensor<?x?xf32>, tensor<?x?xf32>, tensor<?x?xf32>) -> tensor<?x?xf32>
    "func.return"(%0) : (tensor<?x?xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
#map1 = affine_map<(d0, d1) -> (d1, d0)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?xf32>) -> tensor<?x?xf32>, sym_name = "mixed_redundant_non_redundant"}> ({
  ^bb0(%arg0: tensor<?x?xf32>):
    %0 = "linalg.generic"(%arg0, %arg0, %arg0, %arg0) <{indexing_maps = [#map, #map1, #map, #map], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 3, 1>}> ({
    ^bb0(%arg1: f32, %arg2: f32, %arg3: f32, %arg4: f32):
      %1 = "test.elementwise_mappable"(%arg1, %arg2, %arg3) : (f32, f32, f32) -> f32
      "linalg.yield"(%1) : (f32) -> ()
    }) : (tensor<?x?xf32>, tensor<?x?xf32>, tensor<?x?xf32>, tensor<?x?xf32>) -> tensor<?x?xf32>
    "func.return"(%0) : (tensor<?x?xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0) -> (d0)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?xf32>, tensor<?xf32>) -> tensor<?xf32>, sym_name = "multiple_different_redundant_args"}> ({
  ^bb0(%arg0: tensor<?xf32>, %arg1: tensor<?xf32>):
    %0 = "linalg.generic"(%arg0, %arg1, %arg0, %arg1, %arg0) <{indexing_maps = [#map, #map, #map, #map, #map], iterator_types = [#linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 4, 1>}> ({
    ^bb0(%arg2: f32, %arg3: f32, %arg4: f32, %arg5: f32, %arg6: f32):
      %1 = "test.elementwise_mappable"(%arg2, %arg3, %arg4, %arg5) : (f32, f32, f32, f32) -> f32
      "linalg.yield"(%1) : (f32) -> ()
    }) : (tensor<?xf32>, tensor<?xf32>, tensor<?xf32>, tensor<?xf32>, tensor<?xf32>) -> tensor<?xf32>
    "func.return"(%0) : (tensor<?xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d1, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d0, d2, d1)>
#map2 = affine_map<(d0, d1, d2) -> (d1, d2, d0)>
#map3 = affine_map<(d0, d1, d2) -> (d1, d0, d2)>
#map4 = affine_map<(d0, d1, d2) -> (d2, d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?x?xf32>) -> (tensor<?x?x?xf32>, tensor<?x?x?xf32>), sym_name = "drop_dead_results"}> ({
  ^bb0(%arg0: tensor<?x?x?xf32>):
    %0:4 = "linalg.generic"(%arg0, %arg0, %arg0, %arg0, %arg0) <{indexing_maps = [#map, #map1, #map2, #map3, #map4], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 4>}> ({
    ^bb0(%arg1: f32, %arg2: f32, %arg3: f32, %arg4: f32, %arg5: f32):
      %1 = "arith.addf"(%arg1, %arg1) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%1, %1, %1, %1) : (f32, f32, f32, f32) -> ()
    }) : (tensor<?x?x?xf32>, tensor<?x?x?xf32>, tensor<?x?x?xf32>, tensor<?x?x?xf32>, tensor<?x?x?xf32>) -> (tensor<?x?x?xf32>, tensor<?x?x?xf32>, tensor<?x?x?xf32>, tensor<?x?x?xf32>)
    "func.return"(%0#0, %0#2) : (tensor<?x?x?xf32>, tensor<?x?x?xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0) -> (d0)>
#map1 = affine_map<(d0) -> ()>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?xf32>) -> tensor<i32>, sym_name = "argmax_lowering"}> ({
  ^bb0(%arg0: tensor<?xf32>):
    %0 = "tensor.empty"() : () -> tensor<f32>
    %1 = "tensor.empty"() : () -> tensor<i32>
    %2:2 = "linalg.generic"(%arg0, %0, %1) <{indexing_maps = [#map, #map1, #map1], iterator_types = [#linalg.iterator_type<reduction>], operandSegmentSizes = array<i32: 1, 2>}> ({
    ^bb0(%arg1: f32, %arg2: f32, %arg3: i32):
      %3 = "linalg.index"() <{dim = 0 : i64}> : () -> index
      %4 = "arith.index_cast"(%3) : (index) -> i32
      %5 = "arith.cmpf"(%arg1, %arg2) <{fastmath = #arith.fastmath<none>, predicate = 3 : i64}> : (f32, f32) -> i1
      %6 = "arith.select"(%5, %arg1, %arg2) : (i1, f32, f32) -> f32
      %7 = "arith.cmpf"(%arg1, %arg2) <{fastmath = #arith.fastmath<none>, predicate = 1 : i64}> : (f32, f32) -> i1
      %8 = "arith.minsi"(%4, %arg3) : (i32, i32) -> i32
      %9 = "arith.select"(%5, %4, %arg3) : (i1, i32, i32) -> i32
      %10 = "arith.select"(%7, %8, %9) : (i1, i32, i32) -> i32
      "linalg.yield"(%6, %10) : (f32, i32) -> ()
    }) : (tensor<?xf32>, tensor<f32>, tensor<i32>) -> (tensor<f32>, tensor<i32>)
    "func.return"(%2#1) : (tensor<i32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0) -> (d0)>
#map1 = affine_map<(d0) -> ()>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?xf32>) -> tensor<i32>, sym_name = "loop_dim_operand"}> ({
  ^bb0(%arg0: tensor<?xf32>):
    %0 = "arith.constant"() <{value = 0 : i32}> : () -> i32
    %1 = "tensor.empty"() : () -> tensor<i32>
    %2 = "linalg.fill"(%0, %1) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg3: i32, %arg4: i32):
      "linalg.yield"(%arg3) : (i32) -> ()
    }) : (i32, tensor<i32>) -> tensor<i32>
    %3 = "linalg.generic"(%arg0, %2) <{indexing_maps = [#map, #map1], iterator_types = [#linalg.iterator_type<reduction>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg1: f32, %arg2: i32):
      %4 = "linalg.index"() <{dim = 0 : i64}> : () -> index
      %5 = "arith.index_cast"(%4) : (index) -> i32
      %6 = "arith.addi"(%arg2, %5) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      "linalg.yield"(%6) : (i32) -> ()
    }) : (tensor<?xf32>, tensor<i32>) -> tensor<i32>
    "func.return"(%3) : (tensor<i32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0) -> (d0)>
#map1 = affine_map<(d0) -> ()>
"builtin.module"() ({
  "func.func"() <{function_type = (index) -> tensor<i32>, sym_name = "loop_dim_outs_operand"}> ({
  ^bb0(%arg0: index):
    %0 = "arith.constant"() <{value = 0 : i32}> : () -> i32
    %1 = "tensor.empty"(%arg0) : (index) -> tensor<?xi32>
    %2 = "tensor.empty"() : () -> tensor<i32>
    %3 = "linalg.fill"(%0, %2) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg3: i32, %arg4: i32):
      "linalg.yield"(%arg3) : (i32) -> ()
    }) : (i32, tensor<i32>) -> tensor<i32>
    %4:2 = "linalg.generic"(%1, %3) <{indexing_maps = [#map, #map1], iterator_types = [#linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 0, 2>}> ({
    ^bb0(%arg1: i32, %arg2: i32):
      %5 = "linalg.index"() <{dim = 0 : i64}> : () -> index
      %6 = "arith.index_cast"(%5) : (index) -> i32
      %7 = "arith.addi"(%arg2, %6) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      "linalg.yield"(%6, %7) : (i32, i32) -> ()
    }) : (tensor<?xi32>, tensor<i32>) -> (tensor<?xi32>, tensor<i32>)
    "func.return"(%4#1) : (tensor<i32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d1)>
#map1 = affine_map<(d0, d1) -> (d0, d1)>
#map2 = affine_map<(d0, d1) -> (d0)>
#map3 = affine_map<(d0, d1) -> (d1, d0)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?xi32>, tensor<?xi32>, tensor<?xi32>, tensor<?x?xi32>, tensor<?xi32>) -> tensor<?xi32>, sym_name = "multiple_redundant_args"}> ({
  ^bb0(%arg0: tensor<?x?xi32>, %arg1: tensor<?xi32>, %arg2: tensor<?xi32>, %arg3: tensor<?x?xi32>, %arg4: tensor<?xi32>):
    %0 = "linalg.generic"(%arg4, %arg0, %arg0, %arg1, %arg3, %arg3, %arg2) <{indexing_maps = [#map, #map1, #map1, #map2, #map3, #map3, #map2], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<reduction>], operandSegmentSizes = array<i32: 6, 1>}> ({
    ^bb0(%arg5: i32, %arg6: i32, %arg7: i32, %arg8: i32, %arg9: i32, %arg10: i32, %arg11: i32):
      %1 = "arith.addi"(%arg5, %arg6) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      %2 = "arith.addi"(%1, %arg7) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      %3 = "arith.addi"(%2, %arg8) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      %4 = "arith.addi"(%3, %arg9) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      %5 = "arith.addi"(%4, %arg10) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      %6 = "arith.addi"(%5, %arg11) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      "linalg.yield"(%6) : (i32) -> ()
    }) : (tensor<?xi32>, tensor<?x?xi32>, tensor<?x?xi32>, tensor<?xi32>, tensor<?x?xi32>, tensor<?x?xi32>, tensor<?xi32>) -> tensor<?xi32>
    "func.return"(%0) : (tensor<?xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?xf32>) -> (tensor<?x?xf32>, tensor<?x?xf32>), sym_name = "drop_redundant_results"}> ({
  ^bb0(%arg0: tensor<?x?xf32>):
    %0:2 = "linalg.generic"(%arg0, %arg0, %arg0) <{indexing_maps = [#map, #map, #map], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 2>}> ({
    ^bb0(%arg1: f32, %arg2: f32, %arg3: f32):
      %1 = "arith.addf"(%arg1, %arg1) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%1, %1) : (f32, f32) -> ()
    }) : (tensor<?x?xf32>, tensor<?x?xf32>, tensor<?x?xf32>) -> (tensor<?x?xf32>, tensor<?x?xf32>)
    "func.return"(%0#0, %0#1) : (tensor<?x?xf32>, tensor<?x?xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d1, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d0, d2, d1)>
#map2 = affine_map<(d0, d1, d2) -> (d1, d2, d0)>
#map3 = affine_map<(d0, d1, d2) -> (d1, d0, d2)>
#map4 = affine_map<(d0, d1, d2) -> (d2, d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?x?xf32>) -> (tensor<?x?x?xf32>, tensor<?x?x?xf32>), sym_name = "drop_dead_results_with_different_tensors"}> ({
  ^bb0(%arg0: tensor<?x?x?xf32>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "tensor.dim"(%arg0, %0) : (tensor<?x?x?xf32>, index) -> index
    %2 = "arith.constant"() <{value = 1 : index}> : () -> index
    %3 = "tensor.dim"(%arg0, %2) : (tensor<?x?x?xf32>, index) -> index
    %4 = "arith.constant"() <{value = 2 : index}> : () -> index
    %5 = "tensor.dim"(%arg0, %4) : (tensor<?x?x?xf32>, index) -> index
    %6 = "tensor.empty"(%1, %3, %5) : (index, index, index) -> tensor<?x?x?xf32>
    %7:4 = "linalg.generic"(%arg0, %arg0, %arg0, %6, %6) <{indexing_maps = [#map, #map1, #map2, #map3, #map4], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 4>}> ({
    ^bb0(%arg1: f32, %arg2: f32, %arg3: f32, %arg4: f32, %arg5: f32):
      "linalg.yield"(%arg1, %arg1, %arg4, %arg5) : (f32, f32, f32, f32) -> ()
    }) : (tensor<?x?x?xf32>, tensor<?x?x?xf32>, tensor<?x?x?xf32>, tensor<?x?x?xf32>, tensor<?x?x?xf32>) -> (tensor<?x?x?xf32>, tensor<?x?x?xf32>, tensor<?x?x?xf32>, tensor<?x?x?xf32>)
    "func.return"(%7#0, %7#1) : (tensor<?x?x?xf32>, tensor<?x?x?xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d1, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d0, d2, d1)>
#map2 = affine_map<(d0, d1, d2) -> (d1, d2, d0)>
#map3 = affine_map<(d0, d1, d2) -> (d1, d0, d2)>
#map4 = affine_map<(d0, d1, d2) -> (d2, d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?x?xf32>) -> (tensor<?x?x?xf32>, tensor<?x?x?xf32>), sym_name = "drop_dead_results_with_unused_cycles"}> ({
  ^bb0(%arg0: tensor<?x?x?xf32>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "tensor.dim"(%arg0, %0) : (tensor<?x?x?xf32>, index) -> index
    %2 = "arith.constant"() <{value = 1 : index}> : () -> index
    %3 = "tensor.dim"(%arg0, %2) : (tensor<?x?x?xf32>, index) -> index
    %4 = "arith.constant"() <{value = 2 : index}> : () -> index
    %5 = "tensor.dim"(%arg0, %4) : (tensor<?x?x?xf32>, index) -> index
    %6 = "tensor.empty"(%1, %3, %5) : (index, index, index) -> tensor<?x?x?xf32>
    %7:4 = "linalg.generic"(%arg0, %arg0, %arg0, %6, %6) <{indexing_maps = [#map, #map1, #map2, #map3, #map4], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 4>}> ({
    ^bb0(%arg1: f32, %arg2: f32, %arg3: f32, %arg4: f32, %arg5: f32):
      %8 = "arith.addf"(%arg1, %arg1) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %9 = "arith.addf"(%arg1, %arg4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %10 = "arith.addf"(%arg1, %arg5) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%8, %8, %9, %10) : (f32, f32, f32, f32) -> ()
    }) : (tensor<?x?x?xf32>, tensor<?x?x?xf32>, tensor<?x?x?xf32>, tensor<?x?x?xf32>, tensor<?x?x?xf32>) -> (tensor<?x?x?xf32>, tensor<?x?x?xf32>, tensor<?x?x?xf32>, tensor<?x?x?xf32>)
    "func.return"(%7#0, %7#1) : (tensor<?x?x?xf32>, tensor<?x?x?xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d1, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d0, d2, d1)>
#map2 = affine_map<(d0, d1, d2) -> (d1, d2, d0)>
#map3 = affine_map<(d0, d1, d2) -> (d1, d0, d2)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?x?xf32>) -> tensor<?x?x?xf32>, sym_name = "drop_only_the_results_not_used_by_others"}> ({
  ^bb0(%arg0: tensor<?x?x?xf32>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "tensor.dim"(%arg0, %0) : (tensor<?x?x?xf32>, index) -> index
    %2 = "arith.constant"() <{value = 1 : index}> : () -> index
    %3 = "tensor.dim"(%arg0, %2) : (tensor<?x?x?xf32>, index) -> index
    %4 = "arith.constant"() <{value = 2 : index}> : () -> index
    %5 = "tensor.dim"(%arg0, %4) : (tensor<?x?x?xf32>, index) -> index
    %6 = "tensor.empty"(%1, %3, %5) : (index, index, index) -> tensor<?x?x?xf32>
    %7:3 = "linalg.generic"(%arg0, %arg0, %6, %6) <{indexing_maps = [#map, #map1, #map2, #map3], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 3>}> ({
    ^bb0(%arg1: f32, %arg2: f32, %arg3: f32, %arg4: f32):
      "linalg.yield"(%arg3, %arg2, %arg4) : (f32, f32, f32) -> ()
    }) : (tensor<?x?x?xf32>, tensor<?x?x?xf32>, tensor<?x?x?xf32>, tensor<?x?x?xf32>) -> (tensor<?x?x?xf32>, tensor<?x?x?xf32>, tensor<?x?x?xf32>)
    "func.return"(%7#0) : (tensor<?x?x?xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d1, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d0, d2, d1)>
#map2 = affine_map<(d0, d1, d2) -> (d1, d2, d0)>
#map3 = affine_map<(d0, d1, d2) -> (d1, d0, d2)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?x?xf32>) -> tensor<?x?x?xf32>, sym_name = "drop_only_the_cycles_not_used_by_others"}> ({
  ^bb0(%arg0: tensor<?x?x?xf32>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "tensor.dim"(%arg0, %0) : (tensor<?x?x?xf32>, index) -> index
    %2 = "arith.constant"() <{value = 1 : index}> : () -> index
    %3 = "tensor.dim"(%arg0, %2) : (tensor<?x?x?xf32>, index) -> index
    %4 = "arith.constant"() <{value = 2 : index}> : () -> index
    %5 = "tensor.dim"(%arg0, %4) : (tensor<?x?x?xf32>, index) -> index
    %6 = "tensor.empty"(%1, %3, %5) : (index, index, index) -> tensor<?x?x?xf32>
    %7:3 = "linalg.generic"(%arg0, %arg0, %6, %6) <{indexing_maps = [#map, #map1, #map2, #map3], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 3>}> ({
    ^bb0(%arg1: f32, %arg2: f32, %arg3: f32, %arg4: f32):
      %8 = "arith.addf"(%arg2, %arg3) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %9 = "arith.addf"(%arg2, %arg4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%8, %arg2, %9) : (f32, f32, f32) -> ()
    }) : (tensor<?x?x?xf32>, tensor<?x?x?xf32>, tensor<?x?x?xf32>, tensor<?x?x?xf32>) -> (tensor<?x?x?xf32>, tensor<?x?x?xf32>, tensor<?x?x?xf32>)
    "func.return"(%7#0) : (tensor<?x?x?xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0) -> (d0)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?xf32>, tensor<?xf32>) -> tensor<?xf32>, sym_name = "remove_unnecessary_input"}> ({
  ^bb0(%arg0: tensor<?xf32>, %arg1: tensor<?xf32>):
    %0 = "linalg.generic"(%arg0, %arg1, %arg1) <{indexing_maps = [#map, #map, #map], iterator_types = [#linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg2: f32, %arg3: f32, %arg4: f32):
      %1 = "arith.addf"(%arg2, %arg3) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%1) : (f32) -> ()
    }) : (tensor<?xf32>, tensor<?xf32>, tensor<?xf32>) -> tensor<?xf32>
    "func.return"(%0) : (tensor<?xf32>) -> ()
  }) : () -> ()
}) : () -> ()

