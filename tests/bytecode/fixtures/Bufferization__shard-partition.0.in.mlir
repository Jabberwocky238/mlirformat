"builtin.module"() ({
  "shard.grid"() <{shape = array<i64: 4>, sym_name = "grid"}> : () -> () loc("<stdin>":2:3)
  "func.func"() <{function_type = (tensor<?x8xf32>, index) -> (), sym_name = "test_alloc_tensor_op"}> ({
  ^bb0(%arg4: tensor<?x8xf32> loc("<stdin>":4:8), %arg5: index loc("<stdin>":4:32)):
    %16 = "shard.sharding"() <{grid = @grid, operandSegmentSizes = array<i32: 0, 0>, split_axes = #shard<axisarray[[], [0]]>, static_halo_sizes = array<i64>, static_sharded_dims_offsets = array<i64>}> : () -> !shard.sharding loc("<stdin>":5:11)
    %17 = "shard.shard"(%arg4, %16) : (tensor<?x8xf32>, !shard.sharding) -> tensor<?x8xf32> loc("<stdin>":6:11)
    %18 = "bufferization.alloc_tensor"(%arg5) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (index) -> tensor<?x8xf32> loc("<stdin>":7:11)
    %19 = "shard.shard"(%18, %16) : (tensor<?x8xf32>, !shard.sharding) -> tensor<?x8xf32> loc("<stdin>":8:11)
    %20 = "shard.shard"(%17, %16) <{annotate_for_users}> : (tensor<?x8xf32>, !shard.sharding) -> tensor<?x8xf32> loc("<stdin>":9:11)
    %21 = "bufferization.alloc_tensor"(%20) <{operandSegmentSizes = array<i32: 0, 1, 0>}> {escape = true} : (tensor<?x8xf32>) -> tensor<?x8xf32> loc("<stdin>":10:11)
    %22 = "shard.shard"(%21, %16) : (tensor<?x8xf32>, !shard.sharding) -> tensor<?x8xf32> loc("<stdin>":11:11)
    "func.return"() : () -> () loc("<stdin>":12:5)
  }) : () -> () loc("<stdin>":3:3)
  "func.func"() <{function_type = (tensor<4xi32>) -> (), sym_name = "test_dealloc_tensor_op"}> ({
  ^bb0(%arg3: tensor<4xi32> loc("<stdin>":15:8)):
    %13 = "shard.sharding"() <{grid = @grid, operandSegmentSizes = array<i32: 0, 0>, split_axes = #shard<axisarray[[0]]>, static_halo_sizes = array<i64>, static_sharded_dims_offsets = array<i64>}> : () -> !shard.sharding loc("<stdin>":16:11)
    %14 = "shard.shard"(%arg3, %13) : (tensor<4xi32>, !shard.sharding) -> tensor<4xi32> loc("<stdin>":17:11)
    %15 = "shard.shard"(%14, %13) <{annotate_for_users}> : (tensor<4xi32>, !shard.sharding) -> tensor<4xi32> loc("<stdin>":18:11)
    "bufferization.dealloc_tensor"(%15) : (tensor<4xi32>) -> () loc("<stdin>":19:5)
    "func.return"() : () -> () loc("<stdin>":20:5)
  }) : () -> () loc("<stdin>":14:3)
  "func.func"() <{function_type = (tensor<?xf32>, tensor<?xf32>, tensor<8xf32>) -> tensor<8xf32>, sym_name = "test_materialize_in_destination_op"}> ({
  ^bb0(%arg0: tensor<?xf32> loc("<stdin>":23:8), %arg1: tensor<?xf32> loc("<stdin>":23:30), %arg2: tensor<8xf32> loc("<stdin>":23:52)):
    %0 = "shard.sharding"() <{grid = @grid, operandSegmentSizes = array<i32: 0, 0>, split_axes = #shard<axisarray[[0]]>, static_halo_sizes = array<i64>, static_sharded_dims_offsets = array<i64>}> : () -> !shard.sharding loc("<stdin>":24:10)
    %1 = "shard.shard"(%arg0, %0) : (tensor<?xf32>, !shard.sharding) -> tensor<?xf32> loc("<stdin>":25:10)
    %2 = "shard.shard"(%arg1, %0) : (tensor<?xf32>, !shard.sharding) -> tensor<?xf32> loc("<stdin>":26:10)
    %3 = "shard.shard"(%arg2, %0) : (tensor<8xf32>, !shard.sharding) -> tensor<8xf32> loc("<stdin>":27:10)
    %4 = "shard.shard"(%1, %0) <{annotate_for_users}> : (tensor<?xf32>, !shard.sharding) -> tensor<?xf32> loc("<stdin>":28:10)
    %5 = "shard.shard"(%2, %0) <{annotate_for_users}> : (tensor<?xf32>, !shard.sharding) -> tensor<?xf32> loc("<stdin>":29:10)
    %6 = "bufferization.materialize_in_destination"(%4, %5) : (tensor<?xf32>, tensor<?xf32>) -> tensor<?xf32> loc("<stdin>":30:10)
    %7 = "shard.shard"(%6, %0) : (tensor<?xf32>, !shard.sharding) -> tensor<?xf32> loc("<stdin>":31:10)
    %8 = "shard.shard"(%1, %0) <{annotate_for_users}> : (tensor<?xf32>, !shard.sharding) -> tensor<?xf32> loc("<stdin>":32:10)
    %9 = "shard.shard"(%3, %0) <{annotate_for_users}> : (tensor<8xf32>, !shard.sharding) -> tensor<8xf32> loc("<stdin>":33:10)
    %10 = "bufferization.materialize_in_destination"(%8, %9) : (tensor<?xf32>, tensor<8xf32>) -> tensor<8xf32> loc("<stdin>":34:11)
    %11 = "shard.shard"(%10, %0) : (tensor<8xf32>, !shard.sharding) -> tensor<8xf32> loc("<stdin>":35:11)
    %12 = "shard.shard"(%11, %0) <{annotate_for_users}> : (tensor<8xf32>, !shard.sharding) -> tensor<8xf32> loc("<stdin>":36:11)
    "func.return"(%12) : (tensor<8xf32>) -> () loc("<stdin>":37:5)
  }) : () -> () loc("<stdin>":22:3)
}) : () -> () loc("<stdin>":1:1)
