#map = affine_map<(d0, d1) -> (d0, d1)>
#map1 = affine_map<(d0, d1) -> (d1, d0)>
#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 floordiv 2 : dense, d1 floordiv 4 : compressed, d0 mod 2 : dense, d1 mod 4 : dense) }>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32, #sparse>) -> tensor<32x32xf32, #sparse>, sym_name = "mul"}> ({
  ^bb0(%arg0: tensor<32x32xf32>, %arg1: tensor<32x32xf32>, %arg2: tensor<32x32xf32, #sparse>):
    %0 = "linalg.generic"(%arg0, %arg1, %arg2) <{doc = "X(i,j) *= A(i,j) * B(j,i)", indexing_maps = [#map, #map1, #map], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg3: f32, %arg4: f32, %arg5: f32):
      %1 = "arith.mulf"(%arg3, %arg4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %2 = "arith.mulf"(%1, %arg5) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%2) : (f32) -> ()
    }) : (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32, #sparse>) -> tensor<32x32xf32, #sparse>
    "func.return"(%0) : (tensor<32x32xf32, #sparse>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 floordiv 2 : dense, d1 floordiv 2 : compressed, d0 mod 2 : dense, d1 mod 2 : dense) }>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<2x4xf64, #sparse>) -> tensor<2x4xf64, #sparse>, sym_name = "sparse_foreach_reinterpret_map"}> ({
  ^bb0(%arg0: tensor<2x4xf64, #sparse>):
    %0 = "bufferization.alloc_tensor"() <{operandSegmentSizes = array<i32: 0, 0, 0>}> : () -> tensor<2x4xf64, #sparse>
    %1 = "sparse_tensor.foreach"(%arg0, %0) ({
    ^bb0(%arg1: index, %arg2: index, %arg3: f64, %arg4: tensor<2x4xf64, #sparse>):
      %3 = "tensor.insert"(%arg3, %arg4, %arg1, %arg2) : (f64, tensor<2x4xf64, #sparse>, index, index) -> tensor<2x4xf64, #sparse>
      "sparse_tensor.yield"(%3) : (tensor<2x4xf64, #sparse>) -> ()
    }) : (tensor<2x4xf64, #sparse>, tensor<2x4xf64, #sparse>) -> tensor<2x4xf64, #sparse>
    %2 = "sparse_tensor.load"(%1) <{hasInserts}> : (tensor<2x4xf64, #sparse>) -> tensor<2x4xf64, #sparse>
    "func.return"(%2) : (tensor<2x4xf64, #sparse>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 floordiv 2 : dense, d1 floordiv 2 : compressed, d0 mod 2 : dense, d1 mod 2 : dense) }>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?xf64>, tensor<?xindex>, tensor<?xindex>) -> tensor<2x4xf64, #sparse>, sym_name = "sparse_assemble_reinterpret_map"}> ({
  ^bb0(%arg4: tensor<?xf64>, %arg5: tensor<?xindex>, %arg6: tensor<?xindex>):
    %1 = "sparse_tensor.assemble"(%arg5, %arg6, %arg4) : (tensor<?xindex>, tensor<?xindex>, tensor<?xf64>) -> tensor<2x4xf64, #sparse>
    "func.return"(%1) : (tensor<2x4xf64, #sparse>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<2x4xf64, #sparse>, tensor<?xf64>, tensor<?xindex>, tensor<?xindex>) -> (tensor<?xf64>, tensor<?xindex>, tensor<?xindex>), sym_name = "sparse_disassemble_reinterpret_map"}> ({
  ^bb0(%arg0: tensor<2x4xf64, #sparse>, %arg1: tensor<?xf64>, %arg2: tensor<?xindex>, %arg3: tensor<?xindex>):
    %0:6 = "sparse_tensor.disassemble"(%arg0, %arg2, %arg3, %arg1) : (tensor<2x4xf64, #sparse>, tensor<?xindex>, tensor<?xindex>, tensor<?xf64>) -> (tensor<?xindex>, tensor<?xindex>, tensor<?xf64>, index, index, index)
    "func.return"(%0#2, %0#0, %0#1) : (tensor<?xf64>, tensor<?xindex>, tensor<?xindex>) -> ()
  }) : () -> ()
}) : () -> ()

