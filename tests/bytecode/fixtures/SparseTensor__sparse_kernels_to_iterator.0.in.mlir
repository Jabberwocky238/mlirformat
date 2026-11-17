"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?x?x?xi32, #sparse_tensor.encoding<{ map = (d0, d1, d2, d3) -> (d0 : compressed(nonunique), d1 : singleton(nonunique, soa), d2 : singleton(nonunique, soa), d3 : singleton(soa)) }>>) -> tensor<i32>, sym_name = "sqsum"}> ({
  ^bb0(%arg5: tensor<?x?x?x?xi32, #sparse_tensor.encoding<{ map = (d0, d1, d2, d3) -> (d0 : compressed(nonunique), d1 : singleton(nonunique, soa), d2 : singleton(nonunique, soa), d3 : singleton(soa)) }>> loc("<stdin>":8:8)):
    %3 = "arith.constant"() <{value = dense<0> : tensor<i32>}> : () -> tensor<i32> loc("<stdin>":9:10)
    %4 = "linalg.generic"(%arg5, %3) <{indexing_maps = [affine_map<(d0, d1, d2, d3) -> (d0, d1, d2, d3)>, affine_map<(d0, d1, d2, d3) -> ()>], iterator_types = [#linalg.iterator_type<reduction>, #linalg.iterator_type<reduction>, #linalg.iterator_type<reduction>, #linalg.iterator_type<reduction>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg6: i32 loc("<stdin>":11:10), %arg7: i32 loc("<stdin>":11:22)):
      %5 = "arith.muli"(%arg6, %arg6) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32 loc("<stdin>":12:12)
      %6 = "arith.addi"(%arg7, %5) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32 loc("<stdin>":13:12)
      "linalg.yield"(%6) : (i32) -> () loc("<stdin>":14:7)
    }) : (tensor<?x?x?x?xi32, #sparse_tensor.encoding<{ map = (d0, d1, d2, d3) -> (d0 : compressed(nonunique), d1 : singleton(nonunique, soa), d2 : singleton(nonunique, soa), d3 : singleton(soa)) }>>, tensor<i32>) -> tensor<i32> loc("<stdin>":10:10)
    "func.return"(%4) : (tensor<i32>) -> () loc("<stdin>":16:5)
  }) : () -> () loc("<stdin>":7:3)
  "func.func"() <{function_type = (tensor<10xi32, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>, tensor<10xi32, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>) -> tensor<10xi32>, sym_name = "add"}> ({
  ^bb0(%arg0: tensor<10xi32, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>> loc("<stdin>":19:8), %arg1: tensor<10xi32, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>> loc("<stdin>":19:41)):
    %0 = "arith.constant"() <{value = dense<0> : tensor<10xi32>}> : () -> tensor<10xi32> loc("<stdin>":20:10)
    %1 = "linalg.generic"(%arg0, %arg1, %0) <{indexing_maps = [affine_map<(d0) -> (d0)>, affine_map<(d0) -> (d0)>, affine_map<(d0) -> (d0)>], iterator_types = [#linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg2: i32 loc("<stdin>":22:10), %arg3: i32 loc("<stdin>":22:22), %arg4: i32 loc("<stdin>":22:34)):
      %2 = "arith.addi"(%arg2, %arg3) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32 loc("<stdin>":23:12)
      "linalg.yield"(%2) : (i32) -> () loc("<stdin>":24:7)
    }) : (tensor<10xi32, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>, tensor<10xi32, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>, tensor<10xi32>) -> tensor<10xi32> loc("<stdin>":21:10)
    "func.return"(%1) : (tensor<10xi32>) -> () loc("<stdin>":26:5)
  }) : () -> () loc("<stdin>":18:3)
}) : () -> () loc("<stdin>":6:1)
