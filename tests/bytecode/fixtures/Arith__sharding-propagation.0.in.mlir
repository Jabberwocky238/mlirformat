"builtin.module"() ({
  "shard.grid"() <{shape = array<i64: 4, 4>, sym_name = "grid4x4"}> : () -> () loc("<stdin>":2:3)
  "func.func"() <{function_type = () -> tensor<1024x1024xf32>, sym_name = "test_shard_constant"}> ({
    %7 = "arith.constant"() <{value = dense<0.000000e+00> : tensor<1024x1024xf32>}> : () -> tensor<1024x1024xf32> loc("<stdin>":4:10)
    %8 = "shard.sharding"() <{grid = @grid4x4, operandSegmentSizes = array<i32: 0, 0>, split_axes = #shard<axisarray[[0]]>, static_halo_sizes = array<i64>, static_sharded_dims_offsets = array<i64>}> : () -> !shard.sharding loc("<stdin>":5:10)
    %9 = "shard.shard"(%7, %8) : (tensor<1024x1024xf32>, !shard.sharding) -> tensor<1024x1024xf32> loc("<stdin>":6:10)
    %10 = "arith.constant"() <{value = 4.340000e+01 : f32}> : () -> f32 loc("<stdin>":7:11)
    %11 = "tensor.empty"() : () -> tensor<1024x1024xf32> loc("<stdin>":8:11)
    %12 = "linalg.add"(%9, %10, %11) <{operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg3: f32 loc("<stdin>":10:10), %arg4: f32 loc("<stdin>":10:22), %arg5: f32 loc("<stdin>":10:34)):
      %13 = "arith.addf"(%arg3, %arg4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":11:13)
      "linalg.yield"(%13) : (f32) -> () loc("<stdin>":12:7)
    }) : (tensor<1024x1024xf32>, f32, tensor<1024x1024xf32>) -> tensor<1024x1024xf32> loc("<stdin>":9:11)
    "func.return"(%12) : (tensor<1024x1024xf32>) -> () loc("<stdin>":14:5)
  }) {llvm.emit_c_interface} : () -> () loc("<stdin>":3:3)
  "func.func"() <{function_type = () -> tensor<1024x1024xf32>, sym_name = "test_shard_constant_back"}> ({
    %0 = "arith.constant"() <{value = dense<0.000000e+00> : tensor<1024x1024xf32>}> : () -> tensor<1024x1024xf32> loc("<stdin>":17:10)
    %1 = "arith.constant"() <{value = 4.340000e+01 : f32}> : () -> f32 loc("<stdin>":18:10)
    %2 = "tensor.empty"() : () -> tensor<1024x1024xf32> loc("<stdin>":19:10)
    %3 = "linalg.add"(%0, %1, %2) <{operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg0: f32 loc("<stdin>":21:10), %arg1: f32 loc("<stdin>":21:22), %arg2: f32 loc("<stdin>":21:34)):
      %6 = "arith.addf"(%arg0, %arg1) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":22:12)
      "linalg.yield"(%6) : (f32) -> () loc("<stdin>":23:7)
    }) : (tensor<1024x1024xf32>, f32, tensor<1024x1024xf32>) -> tensor<1024x1024xf32> loc("<stdin>":20:10)
    %4 = "shard.sharding"() <{grid = @grid4x4, operandSegmentSizes = array<i32: 0, 0>, split_axes = #shard<axisarray[[0]]>, static_halo_sizes = array<i64>, static_sharded_dims_offsets = array<i64>}> : () -> !shard.sharding loc("<stdin>":25:10)
    %5 = "shard.shard"(%3, %4) : (tensor<1024x1024xf32>, !shard.sharding) -> tensor<1024x1024xf32> loc("<stdin>":26:10)
    "func.return"(%5) : (tensor<1024x1024xf32>) -> () loc("<stdin>":27:5)
  }) {llvm.emit_c_interface} : () -> () loc("<stdin>":16:3)
}) : () -> () loc("<stdin>":1:1)
