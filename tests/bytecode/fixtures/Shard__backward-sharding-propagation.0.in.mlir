"builtin.module"() ({
  "shard.grid"() <{shape = array<i64: 1>, sym_name = "grid"}> {sym_visibility = "private"} : () -> () loc("<stdin>":3:3)
  "func.func"() <{function_type = () -> tensor<6x6xi32>, sym_name = "test_forward"}> ({
    %0 = "arith.constant"() <{value = 1 : i32}> : () -> i32 loc("<stdin>":5:10)
    %1 = "tensor.empty"() : () -> tensor<6x6xi32> loc("<stdin>":6:10)
    %2 = "shard.sharding"() <{grid = @grid, operandSegmentSizes = array<i32: 0, 0>, split_axes = #shard<axisarray[[0]]>, static_halo_sizes = array<i64>, static_sharded_dims_offsets = array<i64>}> : () -> !shard.sharding loc("<stdin>":7:10)
    %3 = "shard.shard"(%1, %2) : (tensor<6x6xi32>, !shard.sharding) -> tensor<6x6xi32> loc("<stdin>":8:10)
    %4 = "linalg.fill"(%0, %3) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg3: i32 loc("<stdin>":10:10), %arg4: i32 loc("<stdin>":10:22)):
      "linalg.yield"(%arg3) : (i32) -> () loc("<stdin>":11:7)
    }) : (i32, tensor<6x6xi32>) -> tensor<6x6xi32> loc("<stdin>":9:10)
    %5 = "tensor.empty"() : () -> tensor<6x6xi32> loc("<stdin>":13:10)
    %6 = "linalg.generic"(%4, %4, %5) <{indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg0: i32 loc("<stdin>":15:10), %arg1: i32 loc("<stdin>":15:22), %arg2: i32 loc("<stdin>":15:34)):
      %7 = "arith.addi"(%arg0, %arg1) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32 loc("<stdin>":16:12)
      "linalg.yield"(%7) : (i32) -> () loc("<stdin>":17:7)
    }) : (tensor<6x6xi32>, tensor<6x6xi32>, tensor<6x6xi32>) -> tensor<6x6xi32> loc("<stdin>":14:10)
    "func.return"(%6) : (tensor<6x6xi32>) -> () loc("<stdin>":19:5)
  }) : () -> () loc("<stdin>":4:3)
}) : () -> () loc("<stdin>":2:1)
