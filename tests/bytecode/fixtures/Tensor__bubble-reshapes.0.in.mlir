"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?x?x?xf32>, index, index, index, index) -> tensor<?x?x?x?xf32>, sym_name = "bubble_parallel_reshapes"}> ({
  ^bb0(%arg0: tensor<?x?x?x?xf32> loc("<stdin>":3:8), %arg1: index loc("<stdin>":3:36), %arg2: index loc("<stdin>":3:50), %arg3: index loc("<stdin>":3:64), %arg4: index loc("<stdin>":3:78)):
    %0 = "tensor.collapse_shape"(%arg0) <{reassociation = [[0], [1, 2], [3]]}> : (tensor<?x?x?x?xf32>) -> tensor<?x?x?xf32> loc("<stdin>":4:10)
    %1 = "tensor.expand_shape"(%0, %arg1, %arg2, %arg3, %arg4) <{reassociation = [[0], [1], [2, 3]], static_output_shape = array<i64: -9223372036854775808, -9223372036854775808, -9223372036854775808, -9223372036854775808>}> : (tensor<?x?x?xf32>, index, index, index, index) -> tensor<?x?x?x?xf32> loc("<stdin>":5:10)
    "func.return"(%1) : (tensor<?x?x?x?xf32>) -> () loc("<stdin>":6:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
