"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?x?x?xf32>, index) -> (tensor<?x1x1x5xf32>, tensor<?x1x1x5xf32>), sym_name = "expand_shape_of_rank_reducing_extract"}> ({
  ^bb0(%arg0: tensor<?x?x?x?xf32> loc("<stdin>":3:8), %arg1: index loc("<stdin>":3:36)):
    %0 = "tensor.extract_slice"(%arg0, %arg1) <{operandSegmentSizes = array<i32: 1, 0, 1, 0>, static_offsets = array<i64: 0, 0, 0, 0>, static_sizes = array<i64: -9223372036854775808, 1, 1, 5>, static_strides = array<i64: 1, 1, 1, 1>}> : (tensor<?x?x?x?xf32>, index) -> tensor<?x1x5xf32> loc("<stdin>":4:10)
    %1 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":5:10)
    %2 = "tensor.dim"(%0, %1) : (tensor<?x1x5xf32>, index) -> index loc("<stdin>":6:10)
    %3 = "tensor.expand_shape"(%0, %2) <{reassociation = [[0], [1, 2], [3]], static_output_shape = array<i64: -9223372036854775808, 1, 1, 5>}> : (tensor<?x1x5xf32>, index) -> tensor<?x1x1x5xf32> loc("<stdin>":7:10)
    %4 = "tensor.expand_shape"(%0, %2) <{reassociation = [[0, 1], [2], [3]], static_output_shape = array<i64: -9223372036854775808, 1, 1, 5>}> : (tensor<?x1x5xf32>, index) -> tensor<?x1x1x5xf32> loc("<stdin>":8:10)
    "func.return"(%3, %4) : (tensor<?x1x1x5xf32>, tensor<?x1x1x5xf32>) -> () loc("<stdin>":9:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
