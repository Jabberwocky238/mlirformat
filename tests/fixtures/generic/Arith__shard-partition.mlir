"builtin.module"() ({
  "shard.grid"() <{shape = array<i64: 4, 4>, sym_name = "grid4x4"}> : () -> ()
  "func.func"() <{function_type = () -> tensor<1024x1024xf32>, sym_name = "test_partition_constant"}> ({
    %0 = "arith.constant"() <{value = dense<0.000000e+00> : tensor<1024x1024xf32>}> : () -> tensor<1024x1024xf32>
    %1 = "shard.sharding"() <{grid = @grid4x4, operandSegmentSizes = array<i32: 0, 0>, split_axes = #shard<axisarray[[0]]>, static_halo_sizes = array<i64>, static_sharded_dims_offsets = array<i64>}> : () -> !shard.sharding
    %2 = "shard.shard"(%0, %1) : (tensor<1024x1024xf32>, !shard.sharding) -> tensor<1024x1024xf32>
    %3 = "arith.constant"() <{value = 434 : i32}> : () -> i32
    "func.return"(%2) : (tensor<1024x1024xf32>) -> ()
  }) {llvm.emit_c_interface} : () -> ()
}) : () -> ()

