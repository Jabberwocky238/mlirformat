"builtin.module"() ({
  "func.func"() <{function_type = (tensor<2x12x5x336x9xi32>, tensor<2x3x4xi32>, tensor<5x6x7x8xi32>) -> (tensor<2x3x4x5x6x7x8x9xi32>, tensor<3x4x2x9x5x6x7x8xi32>), sym_name = "fuse_by_collapsing"}> ({
  ^bb0(%arg0: tensor<2x12x5x336x9xi32> loc("<stdin>":7:8), %arg1: tensor<2x3x4xi32> loc("<stdin>":7:41), %arg2: tensor<5x6x7x8xi32> loc("<stdin>":7:67)):
    %0 = "tensor.expand_shape"(%arg0) <{reassociation = [[0], [1, 2], [3], [4, 5, 6], [7]], static_output_shape = array<i64: 2, 3, 4, 5, 6, 7, 8, 9>}> : (tensor<2x12x5x336x9xi32>) -> tensor<2x3x4x5x6x7x8x9xi32> loc("<stdin>":8:10)
    %1 = "tensor.empty"() : () -> tensor<2x3x4x5x6x7x8x9xi32> loc("<stdin>":9:10)
    %2 = "tensor.empty"() : () -> tensor<3x4x2x9x5x6x7x8xi32> loc("<stdin>":10:10)
    %3:2 = "linalg.generic"(%0, %arg1, %arg2, %1, %2) <{indexing_maps = [affine_map<(d0, d1, d2, d3, d4, d5, d6, d7) -> (d0, d1, d2, d3, d4, d5, d6, d7)>, affine_map<(d0, d1, d2, d3, d4, d5, d6, d7) -> (d0, d1, d2)>, affine_map<(d0, d1, d2, d3, d4, d5, d6, d7) -> (d3, d4, d5, d6)>, affine_map<(d0, d1, d2, d3, d4, d5, d6, d7) -> (d0, d1, d2, d3, d4, d5, d6, d7)>, affine_map<(d0, d1, d2, d3, d4, d5, d6, d7) -> (d1, d2, d0, d7, d3, d4, d5, d6)>], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 3, 2>}> ({
    ^bb0(%arg3: i32 loc("<stdin>":12:10), %arg4: i32 loc("<stdin>":12:22), %arg5: i32 loc("<stdin>":12:34), %arg6: i32 loc("<stdin>":12:46), %arg7: i32 loc("<stdin>":12:58)):
      %4 = "arith.addi"(%arg3, %arg4) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32 loc("<stdin>":13:12)
      %5 = "arith.addi"(%4, %arg5) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32 loc("<stdin>":14:12)
      "linalg.yield"(%5, %5) : (i32, i32) -> () loc("<stdin>":15:7)
    }) : (tensor<2x3x4x5x6x7x8x9xi32>, tensor<2x3x4xi32>, tensor<5x6x7x8xi32>, tensor<2x3x4x5x6x7x8x9xi32>, tensor<3x4x2x9x5x6x7x8xi32>) -> (tensor<2x3x4x5x6x7x8x9xi32>, tensor<3x4x2x9x5x6x7x8xi32>) loc("<stdin>":11:12)
    "func.return"(%3#0, %3#1) : (tensor<2x3x4x5x6x7x8x9xi32>, tensor<3x4x2x9x5x6x7x8xi32>) -> () loc("<stdin>":17:5)
  }) : () -> () loc("<stdin>":6:3)
}) : () -> () loc("<stdin>":5:1)
