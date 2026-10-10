"builtin.module"() ({
  "shard.grid"() <{shape = array<i64: 4, 4>, sym_name = "grid4x4"}> : () -> ()
  "func.func"() <{function_type = () -> tensor<1024x1024xf32>, sym_name = "test_shard_constant"}> ({
    %7 = "arith.constant"() <{value = dense<0.000000e+00> : tensor<1024x1024xf32>}> : () -> tensor<1024x1024xf32>
    %8 = "shard.sharding"() <{grid = @grid4x4, operandSegmentSizes = array<i32: 0, 0>, split_axes = #shard<axisarray[[0]]>, static_halo_sizes = array<i64>, static_sharded_dims_offsets = array<i64>}> : () -> !shard.sharding
    %9 = "shard.shard"(%7, %8) : (tensor<1024x1024xf32>, !shard.sharding) -> tensor<1024x1024xf32>
    %10 = "arith.constant"() <{value = 4.340000e+01 : f32}> : () -> f32
    %11 = "tensor.empty"() : () -> tensor<1024x1024xf32>
    %12 = "linalg.add"(%9, %10, %11) <{operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg3: f32, %arg4: f32, %arg5: f32):
      %13 = "arith.addf"(%arg3, %arg4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%13) : (f32) -> ()
    }) : (tensor<1024x1024xf32>, f32, tensor<1024x1024xf32>) -> tensor<1024x1024xf32>
    "func.return"(%12) : (tensor<1024x1024xf32>) -> ()
  }) {llvm.emit_c_interface} : () -> ()
  "func.func"() <{function_type = () -> tensor<1024x1024xf32>, sym_name = "test_shard_constant_back"}> ({
    %0 = "arith.constant"() <{value = dense<0.000000e+00> : tensor<1024x1024xf32>}> : () -> tensor<1024x1024xf32>
    %1 = "arith.constant"() <{value = 4.340000e+01 : f32}> : () -> f32
    %2 = "tensor.empty"() : () -> tensor<1024x1024xf32>
    %3 = "linalg.add"(%0, %1, %2) <{operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg0: f32, %arg1: f32, %arg2: f32):
      %6 = "arith.addf"(%arg0, %arg1) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%6) : (f32) -> ()
    }) : (tensor<1024x1024xf32>, f32, tensor<1024x1024xf32>) -> tensor<1024x1024xf32>
    %4 = "shard.sharding"() <{grid = @grid4x4, operandSegmentSizes = array<i32: 0, 0>, split_axes = #shard<axisarray[[0]]>, static_halo_sizes = array<i64>, static_sharded_dims_offsets = array<i64>}> : () -> !shard.sharding
    %5 = "shard.shard"(%3, %4) : (tensor<1024x1024xf32>, !shard.sharding) -> tensor<1024x1024xf32>
    "func.return"(%5) : (tensor<1024x1024xf32>) -> ()
  }) {llvm.emit_c_interface} : () -> ()
}) : () -> ()

