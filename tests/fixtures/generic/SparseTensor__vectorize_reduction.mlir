"builtin.module"() ({
^bb0:
}) : () -> ()

// -----
#map = affine_map<(d0) -> (d0)>
#map1 = affine_map<(d0) -> ()>
#sparse = #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<i13>, tensor<?xi13, #sparse>) -> tensor<i13>, sym_name = "sparse_reduction_ori"}> ({
  ^bb0(%arg0: tensor<i13>, %arg1: tensor<?xi13, #sparse>):
    %0 = "linalg.generic"(%arg1, %arg0) <{indexing_maps = [#map, #map1], iterator_types = [#linalg.iterator_type<reduction>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg2: i13, %arg3: i13):
      %1 = "arith.ori"(%arg3, %arg2) : (i13, i13) -> i13
      "linalg.yield"(%1) : (i13) -> ()
    }) : (tensor<?xi13, #sparse>, tensor<i13>) -> tensor<i13>
    "func.return"(%0) : (tensor<i13>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0) -> (d0)>
#map1 = affine_map<(d0) -> ()>
#sparse = #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<i13>, tensor<?xi13, #sparse>) -> tensor<i13>, sym_name = "sparse_reduction_ori_accumulator_on_rhs"}> ({
  ^bb0(%arg0: tensor<i13>, %arg1: tensor<?xi13, #sparse>):
    %0 = "linalg.generic"(%arg1, %arg0) <{indexing_maps = [#map, #map1], iterator_types = [#linalg.iterator_type<reduction>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg2: i13, %arg3: i13):
      %1 = "arith.ori"(%arg2, %arg3) : (i13, i13) -> i13
      "linalg.yield"(%1) : (i13) -> ()
    }) : (tensor<?xi13, #sparse>, tensor<i13>) -> tensor<i13>
    "func.return"(%0) : (tensor<i13>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0) -> (d0)>
#map1 = affine_map<(d0) -> ()>
#sparse = #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<i32>, tensor<?xi32, #sparse>) -> tensor<i32>, sym_name = "sparse_reduction_subi"}> ({
  ^bb0(%arg0: tensor<i32>, %arg1: tensor<?xi32, #sparse>):
    %0 = "linalg.generic"(%arg1, %arg0) <{indexing_maps = [#map, #map1], iterator_types = [#linalg.iterator_type<reduction>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg2: i32, %arg3: i32):
      %1 = "arith.subi"(%arg3, %arg2) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      "linalg.yield"(%1) : (i32) -> ()
    }) : (tensor<?xi32, #sparse>, tensor<i32>) -> tensor<i32>
    "func.return"(%0) : (tensor<i32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0) -> (d0)>
#map1 = affine_map<(d0) -> ()>
#sparse = #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<i32>, tensor<?xi32, #sparse>) -> tensor<i32>, sym_name = "sparse_reduction_xor"}> ({
  ^bb0(%arg0: tensor<i32>, %arg1: tensor<?xi32, #sparse>):
    %0 = "linalg.generic"(%arg1, %arg0) <{indexing_maps = [#map, #map1], iterator_types = [#linalg.iterator_type<reduction>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg2: i32, %arg3: i32):
      %1 = "arith.xori"(%arg3, %arg2) : (i32, i32) -> i32
      "linalg.yield"(%1) : (i32) -> ()
    }) : (tensor<?xi32, #sparse>, tensor<i32>) -> tensor<i32>
    "func.return"(%0) : (tensor<i32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0) -> (d0)>
#map1 = affine_map<(d0) -> ()>
#sparse = #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<i32>, tensor<?xi32, #sparse>) -> tensor<i32>, sym_name = "sparse_reduction_addi"}> ({
  ^bb0(%arg0: tensor<i32>, %arg1: tensor<?xi32, #sparse>):
    %0 = "linalg.generic"(%arg1, %arg0) <{indexing_maps = [#map, #map1], iterator_types = [#linalg.iterator_type<reduction>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg2: i32, %arg3: i32):
      %1 = "arith.addi"(%arg3, %arg2) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      "linalg.yield"(%1) : (i32) -> ()
    }) : (tensor<?xi32, #sparse>, tensor<i32>) -> tensor<i32>
    "func.return"(%0) : (tensor<i32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0) -> (d0)>
#map1 = affine_map<(d0) -> ()>
#sparse = #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<f32>, tensor<?xf32, #sparse>) -> tensor<f32>, sym_name = "sparse_reduction_subf"}> ({
  ^bb0(%arg0: tensor<f32>, %arg1: tensor<?xf32, #sparse>):
    %0 = "linalg.generic"(%arg1, %arg0) <{indexing_maps = [#map, #map1], iterator_types = [#linalg.iterator_type<reduction>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg2: f32, %arg3: f32):
      %1 = "arith.subf"(%arg3, %arg2) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%1) : (f32) -> ()
    }) : (tensor<?xf32, #sparse>, tensor<f32>) -> tensor<f32>
    "func.return"(%0) : (tensor<f32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0) -> (d0)>
#map1 = affine_map<(d0) -> ()>
#sparse = #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<f32>, tensor<?xf32, #sparse>) -> tensor<f32>, sym_name = "sparse_reduction_addf"}> ({
  ^bb0(%arg0: tensor<f32>, %arg1: tensor<?xf32, #sparse>):
    %0 = "linalg.generic"(%arg1, %arg0) <{indexing_maps = [#map, #map1], iterator_types = [#linalg.iterator_type<reduction>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg2: f32, %arg3: f32):
      %1 = "arith.addf"(%arg3, %arg2) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%1) : (f32) -> ()
    }) : (tensor<?xf32, #sparse>, tensor<f32>) -> tensor<f32>
    "func.return"(%0) : (tensor<f32>) -> ()
  }) : () -> ()
}) : () -> ()

