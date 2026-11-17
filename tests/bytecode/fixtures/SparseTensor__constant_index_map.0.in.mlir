"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1x77xi1>, tensor<1x77xi1>) -> tensor<77xi1, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>, sym_name = "main"}> ({
  ^bb0(%arg0: tensor<1x77xi1> loc("<stdin>":6:8), %arg1: tensor<1x77xi1> loc("<stdin>":6:32)):
    %0 = "tensor.empty"() : () -> tensor<77xi1, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>> loc("<stdin>":7:10)
    %1 = "linalg.generic"(%arg0, %arg1, %0) <{indexing_maps = [affine_map<(d0) -> (0, d0)>, affine_map<(d0) -> (0, d0)>, affine_map<(d0) -> (d0)>], iterator_types = [#linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg2: i1 loc("<stdin>":9:10), %arg3: i1 loc("<stdin>":9:21), %arg4: i1 loc("<stdin>":9:32)):
      %2 = "arith.addi"(%arg2, %arg3) <{overflowFlags = #arith.overflow<none>}> : (i1, i1) -> i1 loc("<stdin>":10:12)
      "linalg.yield"(%2) : (i1) -> () loc("<stdin>":11:7)
    }) : (tensor<1x77xi1>, tensor<1x77xi1>, tensor<77xi1, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>) -> tensor<77xi1, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>> loc("<stdin>":8:10)
    "func.return"(%1) : (tensor<77xi1, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>) -> () loc("<stdin>":13:5)
  }) : () -> () loc("<stdin>":5:3)
}) : () -> () loc("<stdin>":4:1)
