"builtin.module"() ({
  "shard.grid"() <{shape = array<i64: 4, 4>, sym_name = "grid4x4"}> : () -> () loc("<stdin>":2:3)
  "func.func"() <{function_type = () -> tensor<1024x1024xf32>, sym_name = "test_partition_constant"}> ({
    %0 = "arith.constant"() <{value = dense<0.000000e+00> : tensor<1024x1024xf32>}> : () -> tensor<1024x1024xf32> loc("<stdin>":4:10)
    %1 = "shard.sharding"() <{grid = @grid4x4, operandSegmentSizes = array<i32: 0, 0>, split_axes = #shard<axisarray[[0]]>, static_halo_sizes = array<i64>, static_sharded_dims_offsets = array<i64>}> : () -> !shard.sharding loc("<stdin>":5:10)
    %2 = "shard.shard"(%0, %1) : (tensor<1024x1024xf32>, !shard.sharding) -> tensor<1024x1024xf32> loc("<stdin>":6:10)
    %3 = "arith.constant"() <{value = 434 : i32}> : () -> i32 loc("<stdin>":7:10)
    %4 = "shard.shard"(%2, %1) <{annotate_for_users}> : (tensor<1024x1024xf32>, !shard.sharding) -> tensor<1024x1024xf32> loc("<stdin>":8:10)
    "func.return"(%4) : (tensor<1024x1024xf32>) -> () loc("<stdin>":9:5)
  }) {llvm.emit_c_interface} : () -> () loc("<stdin>":3:3)
}) : () -> () loc("<stdin>":1:1)
