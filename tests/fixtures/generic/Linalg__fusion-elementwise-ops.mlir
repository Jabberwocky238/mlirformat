#map = affine_map<(d0, d1) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?xf32>, tensor<?x?xf32>, tensor<?x?xf32>) -> tensor<?x?xf32>, sym_name = "add_mul_fusion"}> ({
  ^bb0(%arg0: tensor<?x?xf32>, %arg1: tensor<?x?xf32>, %arg2: tensor<?x?xf32>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index
    %2 = "tensor.dim"(%arg0, %0) : (tensor<?x?xf32>, index) -> index
    %3 = "tensor.dim"(%arg0, %1) : (tensor<?x?xf32>, index) -> index
    %4 = "tensor.empty"(%2, %3) : (index, index) -> tensor<?x?xf32>
    %5 = "linalg.generic"(%arg0, %arg1, %4) <{indexing_maps = [#map, #map, #map], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg6: f32, %arg7: f32, %arg8: f32):
      %8 = "arith.addf"(%arg6, %arg7) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%8) : (f32) -> ()
    }) : (tensor<?x?xf32>, tensor<?x?xf32>, tensor<?x?xf32>) -> tensor<?x?xf32>
    %6 = "linalg.generic"(%5, %arg2, %4) <{indexing_maps = [#map, #map, #map], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg3: f32, %arg4: f32, %arg5: f32):
      %7 = "arith.mulf"(%arg3, %arg4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%7) : (f32) -> ()
    }) : (tensor<?x?xf32>, tensor<?x?xf32>, tensor<?x?xf32>) -> tensor<?x?xf32>
    "func.return"(%6) : (tensor<?x?xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
#map1 = affine_map<(d0, d1) -> ()>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?xf32>, f32, f32) -> tensor<?x?xf32>, sym_name = "scalar_add_mul_fusion"}> ({
  ^bb0(%arg0: tensor<?x?xf32>, %arg1: f32, %arg2: f32):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index
    %2 = "tensor.dim"(%arg0, %0) : (tensor<?x?xf32>, index) -> index
    %3 = "tensor.dim"(%arg0, %1) : (tensor<?x?xf32>, index) -> index
    %4 = "tensor.empty"(%2, %3) : (index, index) -> tensor<?x?xf32>
    %5 = "linalg.generic"(%arg0, %arg1, %4) <{indexing_maps = [#map, #map1, #map], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg6: f32, %arg7: f32, %arg8: f32):
      %8 = "arith.addf"(%arg6, %arg7) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%8) : (f32) -> ()
    }) : (tensor<?x?xf32>, f32, tensor<?x?xf32>) -> tensor<?x?xf32>
    %6 = "linalg.generic"(%5, %arg2, %4) <{indexing_maps = [#map, #map1, #map], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg3: f32, %arg4: f32, %arg5: f32):
      %7 = "arith.mulf"(%arg3, %arg4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%7) : (f32) -> ()
    }) : (tensor<?x?xf32>, f32, tensor<?x?xf32>) -> tensor<?x?xf32>
    "func.return"(%6) : (tensor<?x?xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
#map1 = affine_map<(d0, d1) -> (d1, d0)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?xf32>, tensor<?x?xf32>, tensor<?x?xf32>) -> tensor<?x?xf32>, sym_name = "transpose_add_mul_fusion"}> ({
  ^bb0(%arg0: tensor<?x?xf32>, %arg1: tensor<?x?xf32>, %arg2: tensor<?x?xf32>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index
    %2 = "tensor.dim"(%arg0, %0) : (tensor<?x?xf32>, index) -> index
    %3 = "tensor.dim"(%arg0, %1) : (tensor<?x?xf32>, index) -> index
    %4 = "tensor.empty"(%2, %3) : (index, index) -> tensor<?x?xf32>
    %5 = "linalg.generic"(%arg0, %arg1, %4) <{indexing_maps = [#map, #map1, #map], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg6: f32, %arg7: f32, %arg8: f32):
      %8 = "arith.addf"(%arg6, %arg7) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%8) : (f32) -> ()
    }) : (tensor<?x?xf32>, tensor<?x?xf32>, tensor<?x?xf32>) -> tensor<?x?xf32>
    %6 = "linalg.generic"(%5, %arg2, %4) <{indexing_maps = [#map, #map, #map], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg3: f32, %arg4: f32, %arg5: f32):
      %7 = "arith.mulf"(%arg3, %arg4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%7) : (f32) -> ()
    }) : (tensor<?x?xf32>, tensor<?x?xf32>, tensor<?x?xf32>) -> tensor<?x?xf32>
    "func.return"(%6) : (tensor<?x?xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
#map1 = affine_map<(d0, d1) -> (d1, d0)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?xf32>, tensor<?x?xf32>, tensor<?x?xf32>) -> tensor<?x?xf32>, sym_name = "add_transpose_mul_fusion"}> ({
  ^bb0(%arg0: tensor<?x?xf32>, %arg1: tensor<?x?xf32>, %arg2: tensor<?x?xf32>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index
    %2 = "tensor.dim"(%arg0, %0) : (tensor<?x?xf32>, index) -> index
    %3 = "tensor.dim"(%arg0, %1) : (tensor<?x?xf32>, index) -> index
    %4 = "tensor.empty"(%2, %3) : (index, index) -> tensor<?x?xf32>
    %5 = "linalg.generic"(%arg0, %arg1, %4) <{indexing_maps = [#map, #map1, #map], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg6: f32, %arg7: f32, %arg8: f32):
      %8 = "arith.addf"(%arg6, %arg7) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%8) : (f32) -> ()
    }) : (tensor<?x?xf32>, tensor<?x?xf32>, tensor<?x?xf32>) -> tensor<?x?xf32>
    %6 = "linalg.generic"(%5, %arg2, %4) <{indexing_maps = [#map1, #map, #map], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg3: f32, %arg4: f32, %arg5: f32):
      %7 = "arith.mulf"(%arg3, %arg4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%7) : (f32) -> ()
    }) : (tensor<?x?xf32>, tensor<?x?xf32>, tensor<?x?xf32>) -> tensor<?x?xf32>
    "func.return"(%6) : (tensor<?x?xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0) -> (d0)>
#map1 = affine_map<(d0, d1) -> (d0)>
#map2 = affine_map<(d0, d1) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?xf32>, tensor<?xf32>, tensor<?x?xf32>) -> tensor<?x?xf32>, sym_name = "add_broadcast_mul_fusion"}> ({
  ^bb0(%arg0: tensor<?xf32>, %arg1: tensor<?xf32>, %arg2: tensor<?x?xf32>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index
    %2 = "tensor.dim"(%arg0, %0) : (tensor<?xf32>, index) -> index
    %3 = "tensor.empty"(%2) : (index) -> tensor<?xf32>
    %4 = "linalg.generic"(%arg0, %arg1, %3) <{indexing_maps = [#map, #map, #map], iterator_types = [#linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg6: f32, %arg7: f32, %arg8: f32):
      %9 = "arith.addf"(%arg6, %arg7) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%9) : (f32) -> ()
    }) : (tensor<?xf32>, tensor<?xf32>, tensor<?xf32>) -> tensor<?xf32>
    %5 = "tensor.dim"(%arg2, %1) : (tensor<?x?xf32>, index) -> index
    %6 = "tensor.empty"(%2, %5) : (index, index) -> tensor<?x?xf32>
    %7 = "linalg.generic"(%4, %arg2, %6) <{indexing_maps = [#map1, #map2, #map2], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg3: f32, %arg4: f32, %arg5: f32):
      %8 = "arith.mulf"(%arg3, %arg4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%8) : (f32) -> ()
    }) : (tensor<?xf32>, tensor<?x?xf32>, tensor<?x?xf32>) -> tensor<?x?xf32>
    "func.return"(%7) : (tensor<?x?xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<() -> ()>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<f32>, tensor<f32>, tensor<f32>) -> tensor<f32>, sym_name = "add_mul_scalar_fusion"}> ({
  ^bb0(%arg0: tensor<f32>, %arg1: tensor<f32>, %arg2: tensor<f32>):
    %0 = "tensor.empty"() : () -> tensor<f32>
    %1 = "linalg.generic"(%arg0, %arg1, %0) <{indexing_maps = [#map, #map, #map], iterator_types = [], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg6: f32, %arg7: f32, %arg8: f32):
      %4 = "arith.addf"(%arg6, %arg7) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%4) : (f32) -> ()
    }) : (tensor<f32>, tensor<f32>, tensor<f32>) -> tensor<f32>
    %2 = "linalg.generic"(%1, %arg2, %0) <{indexing_maps = [#map, #map, #map], iterator_types = [], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg3: f32, %arg4: f32, %arg5: f32):
      %3 = "arith.mulf"(%arg3, %arg4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%3) : (f32) -> ()
    }) : (tensor<f32>, tensor<f32>, tensor<f32>) -> tensor<f32>
    "func.return"(%2) : (tensor<f32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2) -> (d0)>
#map1 = affine_map<(d0, d1, d2) -> (d0, d1, d2)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<5x?x?xf32>) -> tensor<5x?x?xf32>, sym_name = "generic_op_constant_fusion"}> ({
  ^bb0(%arg0: tensor<5x?x?xf32>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index
    %2 = "arith.constant"() <{value = 2 : index}> : () -> index
    %3 = "arith.constant"() <{value = dense<4.200000e+01> : tensor<5xf32>}> : () -> tensor<5xf32>
    %4 = "tensor.dim"(%arg0, %1) : (tensor<5x?x?xf32>, index) -> index
    %5 = "tensor.dim"(%arg0, %2) : (tensor<5x?x?xf32>, index) -> index
    %6 = "tensor.empty"(%4, %5) : (index, index) -> tensor<5x?x?xf32>
    %7 = "linalg.generic"(%3, %arg0, %6) <{indexing_maps = [#map, #map1, #map1], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg1: f32, %arg2: f32, %arg3: f32):
      %8 = "arith.mulf"(%arg1, %arg2) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%8) : (f32) -> ()
    }) : (tensor<5xf32>, tensor<5x?x?xf32>, tensor<5x?x?xf32>) -> tensor<5x?x?xf32>
    "func.return"(%7) : (tensor<5x?x?xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2) -> ()>
#map1 = affine_map<(d0, d1, d2) -> (d0, d1, d2)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<5x?x?xf32>) -> tensor<5x?x?xf32>, sym_name = "generic_op_zero_dim_constant_fusion"}> ({
  ^bb0(%arg0: tensor<5x?x?xf32>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index
    %2 = "arith.constant"() <{value = 2 : index}> : () -> index
    %3 = "arith.constant"() <{value = dense<4.200000e+01> : tensor<f32>}> : () -> tensor<f32>
    %4 = "tensor.dim"(%arg0, %1) : (tensor<5x?x?xf32>, index) -> index
    %5 = "tensor.dim"(%arg0, %2) : (tensor<5x?x?xf32>, index) -> index
    %6 = "tensor.empty"(%4, %5) : (index, index) -> tensor<5x?x?xf32>
    %7 = "linalg.generic"(%3, %arg0, %6) <{indexing_maps = [#map, #map1, #map1], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg1: f32, %arg2: f32, %arg3: f32):
      %8 = "arith.mulf"(%arg1, %arg2) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%8) : (f32) -> ()
    }) : (tensor<f32>, tensor<5x?x?xf32>, tensor<5x?x?xf32>) -> tensor<5x?x?xf32>
    "func.return"(%7) : (tensor<5x?x?xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?xi32>, tensor<?x?xi32>) -> tensor<?x?xi32>, sym_name = "producer_indexed_consumer_fusion"}> ({
  ^bb0(%arg0: tensor<?x?xi32>, %arg1: tensor<?x?xi32>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index
    %2 = "tensor.dim"(%arg0, %0) : (tensor<?x?xi32>, index) -> index
    %3 = "tensor.dim"(%arg0, %1) : (tensor<?x?xi32>, index) -> index
    %4 = "tensor.empty"(%2, %3) : (index, index) -> tensor<?x?xi32>
    %5 = "linalg.generic"(%arg0, %arg1, %4) <{indexing_maps = [#map, #map, #map], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg4: i32, %arg5: i32, %arg6: i32):
      %13 = "arith.addi"(%arg4, %arg5) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      "linalg.yield"(%13) : (i32) -> ()
    }) : (tensor<?x?xi32>, tensor<?x?xi32>, tensor<?x?xi32>) -> tensor<?x?xi32>
    %6 = "linalg.generic"(%5, %4) <{indexing_maps = [#map, #map], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg2: i32, %arg3: i32):
      %7 = "linalg.index"() <{dim = 0 : i64}> : () -> index
      %8 = "linalg.index"() <{dim = 1 : i64}> : () -> index
      %9 = "arith.index_cast"(%7) : (index) -> i32
      %10 = "arith.index_cast"(%8) : (index) -> i32
      %11 = "arith.addi"(%arg2, %9) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      %12 = "arith.subi"(%11, %10) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      "linalg.yield"(%12) : (i32) -> ()
    }) : (tensor<?x?xi32>, tensor<?x?xi32>) -> tensor<?x?xi32>
    "func.return"(%6) : (tensor<?x?xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?xi32>) -> tensor<?x?xi32>, sym_name = "indexed_producer_consumer_fusion"}> ({
  ^bb0(%arg0: tensor<?x?xi32>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index
    %2 = "tensor.dim"(%arg0, %0) : (tensor<?x?xi32>, index) -> index
    %3 = "tensor.dim"(%arg0, %1) : (tensor<?x?xi32>, index) -> index
    %4 = "tensor.empty"(%2, %3) : (index, index) -> tensor<?x?xi32>
    %5 = "linalg.generic"(%arg0, %4) <{indexing_maps = [#map, #map], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg4: i32, %arg5: i32):
      %8 = "linalg.index"() <{dim = 0 : i64}> : () -> index
      %9 = "linalg.index"() <{dim = 1 : i64}> : () -> index
      %10 = "arith.index_cast"(%8) : (index) -> i32
      %11 = "arith.index_cast"(%9) : (index) -> i32
      %12 = "arith.addi"(%arg4, %10) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      %13 = "arith.subi"(%12, %11) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      "linalg.yield"(%13) : (i32) -> ()
    }) : (tensor<?x?xi32>, tensor<?x?xi32>) -> tensor<?x?xi32>
    %6 = "linalg.generic"(%5, %arg0, %4) <{indexing_maps = [#map, #map, #map], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg1: i32, %arg2: i32, %arg3: i32):
      %7 = "arith.addi"(%arg1, %arg2) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      "linalg.yield"(%7) : (i32) -> ()
    }) : (tensor<?x?xi32>, tensor<?x?xi32>, tensor<?x?xi32>) -> tensor<?x?xi32>
    "func.return"(%6) : (tensor<?x?xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d1, d0)>
#map1 = affine_map<(d0, d1) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?xi32>) -> tensor<?x?xi32>, sym_name = "indexed_producer_indexed_consumer_fusion"}> ({
  ^bb0(%arg0: tensor<?x?xi32>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index
    %2 = "tensor.dim"(%arg0, %0) : (tensor<?x?xi32>, index) -> index
    %3 = "tensor.dim"(%arg0, %1) : (tensor<?x?xi32>, index) -> index
    %4 = "tensor.empty"(%2, %3) : (index, index) -> tensor<?x?xi32>
    %5 = "linalg.generic"(%arg0, %4) <{indexing_maps = [#map, #map], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg3: i32, %arg4: i32):
      %13 = "linalg.index"() <{dim = 0 : i64}> : () -> index
      %14 = "linalg.index"() <{dim = 1 : i64}> : () -> index
      %15 = "arith.index_cast"(%13) : (index) -> i32
      %16 = "arith.index_cast"(%14) : (index) -> i32
      %17 = "arith.addi"(%arg3, %15) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      %18 = "arith.subi"(%16, %17) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      "linalg.yield"(%18) : (i32) -> ()
    }) : (tensor<?x?xi32>, tensor<?x?xi32>) -> tensor<?x?xi32>
    %6 = "linalg.generic"(%5, %4) <{indexing_maps = [#map1, #map1], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg1: i32, %arg2: i32):
      %7 = "linalg.index"() <{dim = 0 : i64}> : () -> index
      %8 = "linalg.index"() <{dim = 1 : i64}> : () -> index
      %9 = "arith.index_cast"(%7) : (index) -> i32
      %10 = "arith.index_cast"(%8) : (index) -> i32
      %11 = "arith.addi"(%arg1, %9) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      %12 = "arith.subi"(%11, %10) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      "linalg.yield"(%12) : (i32) -> ()
    }) : (tensor<?x?xi32>, tensor<?x?xi32>) -> tensor<?x?xi32>
    "func.return"(%6) : (tensor<?x?xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0) -> (d0)>
#map1 = affine_map<(d0, d1) -> (d0, d1)>
#map2 = affine_map<(d0, d1) -> (d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?xi32>, tensor<?x?xi32>) -> tensor<?x?xi32>, sym_name = "one_dim_indexed_producer_consumer_fusion"}> ({
  ^bb0(%arg0: tensor<?xi32>, %arg1: tensor<?x?xi32>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index
    %2 = "tensor.dim"(%arg0, %0) : (tensor<?xi32>, index) -> index
    %3 = "tensor.empty"(%2) : (index) -> tensor<?xi32>
    %4 = "linalg.generic"(%arg0, %3) <{indexing_maps = [#map, #map], iterator_types = [#linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg5: i32, %arg6: i32):
      %10 = "linalg.index"() <{dim = 0 : i64}> : () -> index
      %11 = "arith.index_cast"(%10) : (index) -> i32
      %12 = "arith.addi"(%arg5, %11) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      "linalg.yield"(%12) : (i32) -> ()
    }) : (tensor<?xi32>, tensor<?xi32>) -> tensor<?xi32>
    %5 = "tensor.dim"(%arg1, %0) : (tensor<?x?xi32>, index) -> index
    %6 = "tensor.dim"(%arg1, %1) : (tensor<?x?xi32>, index) -> index
    %7 = "tensor.empty"(%5, %6) : (index, index) -> tensor<?x?xi32>
    %8 = "linalg.generic"(%arg1, %4, %7) <{indexing_maps = [#map1, #map2, #map1], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg2: i32, %arg3: i32, %arg4: i32):
      %9 = "arith.addi"(%arg2, %arg3) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      "linalg.yield"(%9) : (i32) -> ()
    }) : (tensor<?x?xi32>, tensor<?xi32>, tensor<?x?xi32>) -> tensor<?x?xi32>
    "func.return"(%8) : (tensor<?x?xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<() -> ()>
#map1 = affine_map<(d0) -> ()>
#map2 = affine_map<(d0) -> (d0)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<5x1x1xf32>, tensor<i32>) -> tensor<10xf32>, sym_name = "scalar_generic_fusion"}> ({
  ^bb0(%arg0: tensor<5x1x1xf32>, %arg1: tensor<i32>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = dense<1.000000e+00> : tensor<10xf32>}> : () -> tensor<10xf32>
    %2 = "tensor.empty"() : () -> tensor<f32>
    %3 = "linalg.generic"(%arg1, %2) <{indexing_maps = [#map, #map], iterator_types = [], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg5: i32, %arg6: f32):
      %7 = "arith.index_cast"(%arg5) : (i32) -> index
      %8 = "tensor.extract"(%arg0, %7, %0, %0) : (tensor<5x1x1xf32>, index, index, index) -> f32
      "linalg.yield"(%8) : (f32) -> ()
    }) : (tensor<i32>, tensor<f32>) -> tensor<f32>
    %4 = "tensor.empty"() : () -> tensor<10xf32>
    %5 = "linalg.generic"(%3, %1, %4) <{indexing_maps = [#map1, #map2, #map2], iterator_types = [#linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg2: f32, %arg3: f32, %arg4: f32):
      %6 = "arith.mulf"(%arg2, %arg3) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%6) : (f32) -> ()
    }) : (tensor<f32>, tensor<10xf32>, tensor<10xf32>) -> tensor<10xf32>
    "func.return"(%5) : (tensor<10xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0) -> (d0)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<4xf32>) -> tensor<4xf32>, sym_name = "constant_fusion"}> ({
  ^bb0(%arg0: tensor<4xf32>):
    %0 = "arith.constant"() <{value = dense<1.000000e+00> : tensor<4xf32>}> : () -> tensor<4xf32>
    %1 = "tensor.empty"() : () -> tensor<4xf32>
    %2 = "linalg.generic"(%arg0, %0, %1) <{indexing_maps = [#map, #map, #map], iterator_types = [#linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg1: f32, %arg2: f32, %arg3: f32):
      %3 = "arith.addf"(%arg1, %arg2) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%3) : (f32) -> ()
    }) : (tensor<4xf32>, tensor<4xf32>, tensor<4xf32>) -> tensor<4xf32>
    "func.return"(%2) : (tensor<4xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
#map1 = affine_map<(d0) -> (0, d0)>
#map2 = affine_map<(d0) -> (0)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1x10xf32>, tensor<1x10xf32>, tensor<1xf32>) -> tensor<1xf32>, sym_name = "consumer_with_reduction"}> ({
  ^bb0(%arg0: tensor<1x10xf32>, %arg1: tensor<1x10xf32>, %arg2: tensor<1xf32>):
    %0 = "tensor.empty"() : () -> tensor<1x10xf32>
    %1 = "linalg.generic"(%arg0, %arg1, %0) <{indexing_maps = [#map, #map, #map], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg5: f32, %arg6: f32, %arg7: f32):
      %4 = "arith.addf"(%arg5, %arg6) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%4) : (f32) -> ()
    }) : (tensor<1x10xf32>, tensor<1x10xf32>, tensor<1x10xf32>) -> tensor<1x10xf32>
    %2 = "linalg.generic"(%1, %arg2) <{indexing_maps = [#map1, #map2], iterator_types = [#linalg.iterator_type<reduction>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg3: f32, %arg4: f32):
      %3 = "arith.addf"(%arg3, %arg4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%3) : (f32) -> ()
    }) : (tensor<1x10xf32>, tensor<1xf32>) -> tensor<1xf32>
    "func.return"(%2) : (tensor<1xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x1xf32>) -> tensor<?x1xf32>, sym_name = "sigmoid_dynamic_dim"}> ({
  ^bb0(%arg0: tensor<?x1xf32>):
    %0 = "arith.constant"() <{value = 5.000000e-01 : f32}> : () -> f32
    %1 = "arith.constant"() <{value = 0 : index}> : () -> index
    %2 = "shape.shape_of"(%arg0) : (tensor<?x1xf32>) -> tensor<?xindex>
    %3 = "shape.to_extent_tensor"(%2) : (tensor<?xindex>) -> tensor<2xindex>
    %4 = "tensor.extract"(%3, %1) : (tensor<2xindex>, index) -> index
    %5 = "tensor.empty"(%4) : (index) -> tensor<?x1xf32>
    %6 = "linalg.generic"(%5) <{indexing_maps = [#map], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 0, 1>}> ({
    ^bb0(%arg4: f32):
      "linalg.yield"(%0) : (f32) -> ()
    }) : (tensor<?x1xf32>) -> tensor<?x1xf32>
    %7 = "tensor.dim"(%arg0, %1) : (tensor<?x1xf32>, index) -> index
    %8 = "tensor.empty"(%7) : (index) -> tensor<?x1xf32>
    %9 = "linalg.generic"(%arg0, %6, %8) <{indexing_maps = [#map, #map, #map], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg1: f32, %arg2: f32, %arg3: f32):
      %10 = "arith.mulf"(%arg1, %arg2) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%10) : (f32) -> ()
    }) : (tensor<?x1xf32>, tensor<?x1xf32>, tensor<?x1xf32>) -> tensor<?x1xf32>
    "func.return"(%9) : (tensor<?x1xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (f64) -> f64, sym_name = "compute1", sym_visibility = "private"}> ({
  }) : () -> ()
  "func.func"() <{function_type = (f64, i32) -> i32, sym_name = "compute2", sym_visibility = "private"}> ({
  }) : () -> ()
  "func.func"() <{function_type = (tensor<1x8xf64>, tensor<1x8xi32>) -> tensor<1x8xi32>, sym_name = "generic_index_op2"}> ({
  ^bb0(%arg0: tensor<1x8xf64>, %arg1: tensor<1x8xi32>):
    %0 = "linalg.generic"(%arg0) <{indexing_maps = [#map], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 0, 1>}> ({
    ^bb0(%arg4: f64):
      %3 = "func.call"(%arg4) <{callee = @compute1}> : (f64) -> f64
      "linalg.yield"(%3) : (f64) -> ()
    }) : (tensor<1x8xf64>) -> tensor<1x8xf64>
    %1 = "linalg.generic"(%0, %arg1) <{indexing_maps = [#map, #map], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg2: f64, %arg3: i32):
      %2 = "func.call"(%arg2, %arg3) <{callee = @compute2}> : (f64, i32) -> i32
      "linalg.yield"(%2) : (i32) -> ()
    }) : (tensor<1x8xf64>, tensor<1x8xi32>) -> tensor<1x8xi32>
    "func.return"(%1) : (tensor<1x8xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
#map1 = affine_map<(d0, d1) -> (d0)>
"builtin.module"() ({
  "func.func"() <{function_type = () -> tensor<3xf32>, sym_name = "no_fuse_constant_with_reduction"}> ({
    %0 = "arith.constant"() <{value = dense<3.000000e+00> : tensor<3x2xf32>}> : () -> tensor<3x2xf32>
    %1 = "tensor.empty"() : () -> tensor<3xf32>
    %2 = "linalg.generic"(%0, %1) <{indexing_maps = [#map, #map1], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<reduction>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg0: f32, %arg1: f32):
      %3 = "arith.addf"(%arg0, %arg1) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%3) : (f32) -> ()
    }) : (tensor<3x2xf32>, tensor<3xf32>) -> tensor<3xf32>
    "func.return"(%2) : (tensor<3xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?xf32>) -> tensor<?x?xf32>, sym_name = "break_outs_dependency"}> ({
  ^bb0(%arg0: tensor<?x?xf32>):
    %0 = "linalg.generic"(%arg0, %arg0) <{indexing_maps = [#map, #map], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg3: f32, %arg4: f32):
      %3 = "arith.addf"(%arg3, %arg3) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%3) : (f32) -> ()
    }) : (tensor<?x?xf32>, tensor<?x?xf32>) -> tensor<?x?xf32>
    %1 = "linalg.generic"(%0, %0) <{indexing_maps = [#map, #map], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg1: f32, %arg2: f32):
      %2 = "arith.mulf"(%arg1, %arg1) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%2) : (f32) -> ()
    }) : (tensor<?x?xf32>, tensor<?x?xf32>) -> tensor<?x?xf32>
    "func.return"(%1) : (tensor<?x?xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
#map1 = affine_map<(d0, d1) -> ()>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?xf32>) -> (tensor<?x?xf32>, tensor<?x?xi32>), sym_name = "fuse_scalar_constant"}> ({
  ^bb0(%arg0: tensor<?x?xf32>):
    %0 = "arith.constant"() <{value = 4.000000e+00 : f32}> : () -> f32
    %1 = "arith.constant"() <{value = 42 : i32}> : () -> i32
    %2 = "arith.constant"() <{value = 0 : index}> : () -> index
    %3 = "arith.constant"() <{value = 1 : index}> : () -> index
    %4 = "tensor.dim"(%arg0, %2) : (tensor<?x?xf32>, index) -> index
    %5 = "tensor.dim"(%arg0, %3) : (tensor<?x?xf32>, index) -> index
    %6 = "tensor.empty"(%4, %5) : (index, index) -> tensor<?x?xf32>
    %7 = "tensor.empty"(%4, %5) : (index, index) -> tensor<?x?xi32>
    %8:2 = "linalg.generic"(%arg0, %0, %1, %6, %7) <{indexing_maps = [#map, #map1, #map1, #map, #map], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 3, 2>}> ({
    ^bb0(%arg1: f32, %arg2: f32, %arg3: i32, %arg4: f32, %arg5: i32):
      %9 = "arith.addf"(%arg1, %arg2) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%9, %arg3) : (f32, i32) -> ()
    }) : (tensor<?x?xf32>, f32, i32, tensor<?x?xf32>, tensor<?x?xi32>) -> (tensor<?x?xf32>, tensor<?x?xi32>)
    "func.return"(%8#0, %8#1) : (tensor<?x?xf32>, tensor<?x?xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> ()>
#map1 = affine_map<(d0, d1) -> (d0, d1)>
#map2 = affine_map<(d0, d1) -> (d1, d0)>
#map3 = affine_map<(d0, d1) -> (d0)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<f32>, index) -> tensor<?xf32>, sym_name = "no_fusion_missing_reduction_shape"}> ({
  ^bb0(%arg0: tensor<f32>, %arg1: index):
    %0 = "arith.constant"() <{value = 0xFF800000 : f32}> : () -> f32
    %1 = "tensor.empty"(%arg1, %arg1) : (index, index) -> tensor<?x?xf32>
    %2 = "linalg.generic"(%arg0, %1) <{indexing_maps = [#map, #map1], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg6: f32, %arg7: f32):
      "linalg.yield"(%arg6) : (f32) -> ()
    }) : (tensor<f32>, tensor<?x?xf32>) -> tensor<?x?xf32>
    %3 = "tensor.empty"(%arg1) : (index) -> tensor<?xf32>
    %4 = "linalg.fill"(%0, %3) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg4: f32, %arg5: f32):
      "linalg.yield"(%arg4) : (f32) -> ()
    }) : (f32, tensor<?xf32>) -> tensor<?xf32>
    %5 = "linalg.generic"(%2, %4) <{indexing_maps = [#map2, #map3], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<reduction>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg2: f32, %arg3: f32):
      %6 = "arith.maximumf"(%arg2, %arg3) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%6) : (f32) -> ()
    }) : (tensor<?x?xf32>, tensor<?xf32>) -> tensor<?xf32>
    "func.return"(%5) : (tensor<?xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0) -> (d0)>
#map1 = affine_map<(d0, d1) -> (d0)>
#map2 = affine_map<(d0, d1) -> (d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<5000xi64>, tensor<5000xi32>) -> tensor<5000xi32>, sym_name = "fusion_different_axes"}> ({
  ^bb0(%arg0: tensor<5000xi64>, %arg1: tensor<5000xi32>):
    %0 = "arith.constant"() <{value = 1 : i32}> : () -> i32
    %1 = "linalg.generic"(%arg0) <{indexing_maps = [#map], iterator_types = [#linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 0, 1>}> ({
    ^bb0(%arg4: i64):
      %6 = "linalg.index"() <{dim = 0 : i64}> : () -> index
      %7 = "arith.index_cast"(%6) : (index) -> i64
      "linalg.yield"(%7) : (i64) -> ()
    }) : (tensor<5000xi64>) -> tensor<5000xi64>
    %2 = "tensor.empty"() : () -> tensor<5000xi32>
    %3 = "linalg.generic"(%1, %2) <{indexing_maps = [#map1, #map2], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg2: i64, %arg3: i32):
      %4 = "arith.index_cast"(%arg2) : (i64) -> index
      %5 = "tensor.extract"(%arg1, %4) : (tensor<5000xi32>, index) -> i32
      "linalg.yield"(%5) : (i32) -> ()
    }) : (tensor<5000xi64>, tensor<5000xi32>) -> tensor<5000xi32>
    "func.return"(%3) : (tensor<5000xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
#map1 = affine_map<(d0) -> (d0, 1)>
#map2 = affine_map<(d0) -> (d0)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<2x2xi32>) -> tensor<2xi32>, sym_name = "fusion_different_axes_indexed"}> ({
  ^bb0(%arg0: tensor<2x2xi32>):
    %0 = "tensor.empty"() : () -> tensor<2x2xi32>
    %1 = "linalg.generic"(%arg0, %0) <{indexing_maps = [#map, #map], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg3: i32, %arg4: i32):
      %4 = "linalg.index"() <{dim = 1 : i64}> : () -> index
      %5 = "arith.index_cast"(%4) : (index) -> i32
      "linalg.yield"(%5) : (i32) -> ()
    }) : (tensor<2x2xi32>, tensor<2x2xi32>) -> tensor<2x2xi32>
    %2 = "tensor.empty"() : () -> tensor<2xi32>
    %3 = "linalg.generic"(%1, %2) <{indexing_maps = [#map1, #map2], iterator_types = [#linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg1: i32, %arg2: i32):
      "linalg.yield"(%arg1) : (i32) -> ()
    }) : (tensor<2x2xi32>, tensor<2xi32>) -> tensor<2xi32>
    "func.return"(%3) : (tensor<2xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0) -> (d0)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?xf32>) -> tensor<?xf32>, sym_name = "fold_fill_generic_basic"}> ({
  ^bb0(%arg0: tensor<?xf32>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 7.000000e+00 : f32}> : () -> f32
    %2 = "tensor.dim"(%arg0, %0) : (tensor<?xf32>, index) -> index
    %3 = "tensor.empty"(%2) : (index) -> tensor<?xf32>
    %4 = "linalg.fill"(%1, %3) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg4: f32, %arg5: f32):
      "linalg.yield"(%arg4) : (f32) -> ()
    }) : (f32, tensor<?xf32>) -> tensor<?xf32>
    %5 = "tensor.empty"(%2) : (index) -> tensor<?xf32>
    %6 = "linalg.generic"(%arg0, %4, %5) <{indexing_maps = [#map, #map, #map], iterator_types = [#linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg1: f32, %arg2: f32, %arg3: f32):
      %7 = "arith.addf"(%arg1, %arg2) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%7) : (f32) -> ()
    }) : (tensor<?xf32>, tensor<?xf32>, tensor<?xf32>) -> tensor<?xf32>
    "func.return"(%6) : (tensor<?xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
#map1 = affine_map<(d0, d1) -> (d1, d0)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?xf32>) -> tensor<?x?xf32>, sym_name = "fold_fill_generic_mixedaccess"}> ({
  ^bb0(%arg0: tensor<?x?xf32>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 0 : index}> : () -> index
    %2 = "arith.constant"() <{value = 7.000000e+00 : f32}> : () -> f32
    %3 = "arith.constant"() <{value = 6.000000e+00 : f32}> : () -> f32
    %4 = "tensor.dim"(%arg0, %0) : (tensor<?x?xf32>, index) -> index
    %5 = "tensor.dim"(%arg0, %1) : (tensor<?x?xf32>, index) -> index
    %6 = "tensor.empty"(%4, %5) : (index, index) -> tensor<?x?xf32>
    %7 = "linalg.fill"(%2, %6) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg6: f32, %arg7: f32):
      "linalg.yield"(%arg6) : (f32) -> ()
    }) : (f32, tensor<?x?xf32>) -> tensor<?x?xf32>
    %8 = "tensor.empty"(%5, %4) : (index, index) -> tensor<?x?xf32>
    %9 = "linalg.fill"(%3, %8) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg4: f32, %arg5: f32):
      "linalg.yield"(%arg4) : (f32) -> ()
    }) : (f32, tensor<?x?xf32>) -> tensor<?x?xf32>
    %10 = "tensor.empty"(%4, %5) : (index, index) -> tensor<?x?xf32>
    %11 = "linalg.generic"(%7, %9, %10) <{indexing_maps = [#map, #map1, #map], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg1: f32, %arg2: f32, %arg3: f32):
      %12 = "arith.divf"(%arg1, %arg2) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%12) : (f32) -> ()
    }) : (tensor<?x?xf32>, tensor<?x?xf32>, tensor<?x?xf32>) -> tensor<?x?xf32>
    "func.return"(%11) : (tensor<?x?xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<() -> ()>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<f32>, tensor<f32>, tensor<f32>, tensor<f32>, tensor<f32>) -> tensor<f32>, sym_name = "fuse_multi_result_producer"}> ({
  ^bb0(%arg0: tensor<f32>, %arg1: tensor<f32>, %arg2: tensor<f32>, %arg3: tensor<f32>, %arg4: tensor<f32>):
    %0 = "tensor.empty"() : () -> tensor<f32>
    %1 = "tensor.empty"() : () -> tensor<f32>
    %2:2 = "linalg.generic"(%arg0, %arg1, %arg1, %0, %1) <{indexing_maps = [#map, #map, #map, #map, #map], iterator_types = [], operandSegmentSizes = array<i32: 3, 2>}> ({
    ^bb0(%arg8: f32, %arg9: f32, %arg10: f32, %arg11: f32, %arg12: f32):
      %6 = "arith.addf"(%arg8, %arg9) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %7 = "arith.addf"(%6, %arg10) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%6, %7) : (f32, f32) -> ()
    }) : (tensor<f32>, tensor<f32>, tensor<f32>, tensor<f32>, tensor<f32>) -> (tensor<f32>, tensor<f32>)
    %3 = "linalg.generic"(%2#1, %arg1, %arg4) <{indexing_maps = [#map, #map, #map], iterator_types = [], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg5: f32, %arg6: f32, %arg7: f32):
      %4 = "arith.addf"(%arg5, %arg6) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %5 = "arith.addf"(%4, %arg6) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%5) : (f32) -> ()
    }) : (tensor<f32>, tensor<f32>, tensor<f32>) -> tensor<f32>
    "func.return"(%3) : (tensor<f32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2, d3)>
#map1 = affine_map<(d0, d1, d2, d3) -> (d0 * 4 + d1 * 2 + d2 + d3, 0, 0, 0)>
#map2 = affine_map<(d0, d1, d2, d3, d4, d5, d6) -> (d0, d1, d2, d6)>
#map3 = affine_map<(d0, d1, d2, d3, d4, d5, d6) -> (d3, d4, d5, d6)>
#map4 = affine_map<(d0, d1, d2, d3, d4, d5, d6) -> (d0, d1, d2, d3, d4, d5)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1x1x2x1xf32>, tensor<1x1x2x1xf32>) -> tensor<1x1x2x4xf32>, sym_name = "fuse_only_as_long_as_result_map_is_permutation"}> ({
  ^bb0(%arg0: tensor<1x1x2x1xf32>, %arg1: tensor<1x1x2x1xf32>):
    %0 = "arith.constant"() <{value = 2 : index}> : () -> index
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index
    %2 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %3 = "arith.constant"() <{value = 0 : index}> : () -> index
    %4 = "tensor.empty"() : () -> tensor<1x2x2x1xf32>
    %5 = "linalg.generic"(%4) <{indexing_maps = [#map], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 0, 1>}> ({
    ^bb0(%arg7: f32):
      %14 = "linalg.index"() <{dim = 1 : i64}> : () -> index
      %15 = "linalg.index"() <{dim = 2 : i64}> : () -> index
      %16 = "arith.cmpi"(%14, %1) <{predicate = 6 : i64}> : (index, index) -> i1
      %17 = "arith.cmpi"(%15, %0) <{predicate = 6 : i64}> : (index, index) -> i1
      %18 = "arith.andi"(%16, %17) : (i1, i1) -> i1
      %19 = "scf.if"(%18) ({
        %20 = "tensor.extract"(%arg1, %3, %14, %15, %3) : (tensor<1x1x2x1xf32>, index, index, index, index) -> f32
        "scf.yield"(%20) : (f32) -> ()
      }, {
        "scf.yield"(%2) : (f32) -> ()
      }) : (i1) -> f32
      "linalg.yield"(%19) : (f32) -> ()
    }) : (tensor<1x2x2x1xf32>) -> tensor<1x2x2x1xf32>
    %6 = "tensor.empty"() : () -> tensor<4x1x1x1xf32>
    %7 = "linalg.generic"(%5, %6) <{indexing_maps = [#map, #map1], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg5: f32, %arg6: f32):
      "linalg.yield"(%arg5) : (f32) -> ()
    }) : (tensor<1x2x2x1xf32>, tensor<4x1x1x1xf32>) -> tensor<4x1x1x1xf32>
    %8 = "tensor.empty"() : () -> tensor<1x1x2x4xf32>
    %9 = "tensor.expand_shape"(%8) <{reassociation = [[0], [1], [2], [3, 4, 5]], static_output_shape = array<i64: 1, 1, 2, 4, 1, 1>}> : (tensor<1x1x2x4xf32>) -> tensor<1x1x2x4x1x1xf32>
    %10 = "linalg.generic"(%arg0, %7, %9) <{indexing_maps = [#map2, #map3, #map4], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<reduction>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg2: f32, %arg3: f32, %arg4: f32):
      %12 = "arith.mulf"(%arg2, %arg3) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %13 = "arith.addf"(%12, %arg4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%13) : (f32) -> ()
    }) : (tensor<1x1x2x1xf32>, tensor<4x1x1x1xf32>, tensor<1x1x2x4x1x1xf32>) -> tensor<1x1x2x4x1x1xf32>
    %11 = "tensor.collapse_shape"(%10) <{reassociation = [[0], [1], [2], [3, 4, 5]]}> : (tensor<1x1x2x4x1x1xf32>) -> tensor<1x1x2x4xf32>
    "func.return"(%11) : (tensor<1x1x2x4xf32>) -> ()
  }) : () -> ()
}) : () -> ()

