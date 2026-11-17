"builtin.module"() ({
  "func.func"() <{function_type = (tensor<4x8xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed(nonunique), d1 : singleton(soa)) }>>) -> index, sym_name = "sparse_iteration_to_scf"}> ({
  ^bb0(%arg0: tensor<4x8xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed(nonunique), d1 : singleton(soa)) }>> loc("<stdin>":4:8)):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":5:10)
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":6:10)
    %2 = "sparse_tensor.extract_iteration_space"(%arg0) <{hiLvl = 1 : index, loLvl = 0 : index}> : (tensor<4x8xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed(nonunique), d1 : singleton(soa)) }>>) -> !sparse_tensor.iter_space<<{ map = (d0, d1) -> (d0 : compressed(nonunique), d1 : singleton(soa)) }>, lvls = 0> loc("<stdin>":7:10)
    %3 = "sparse_tensor.iterate"(%2, %0) <{crdUsedLvls = 0 : i64}> ({
    ^bb0(%arg1: index loc("<stdin>":9:10), %arg2: !sparse_tensor.iterator<<{ map = (d0, d1) -> (d0 : compressed(nonunique), d1 : singleton(soa)) }>, lvls = 0> loc("<stdin>":9:24)):
      %4 = "sparse_tensor.extract_iteration_space"(%arg0, %arg2) <{hiLvl = 2 : index, loLvl = 1 : index}> : (tensor<4x8xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed(nonunique), d1 : singleton(soa)) }>>, !sparse_tensor.iterator<<{ map = (d0, d1) -> (d0 : compressed(nonunique), d1 : singleton(soa)) }>, lvls = 0>) -> !sparse_tensor.iter_space<<{ map = (d0, d1) -> (d0 : compressed(nonunique), d1 : singleton(soa)) }>, lvls = 1> loc("<stdin>":10:12)
      %5 = "sparse_tensor.iterate"(%4, %arg1) <{crdUsedLvls = 0 : i64}> ({
      ^bb0(%arg3: index loc("<stdin>":12:12), %arg4: !sparse_tensor.iterator<<{ map = (d0, d1) -> (d0 : compressed(nonunique), d1 : singleton(soa)) }>, lvls = 1> loc("<stdin>":12:26)):
        %6 = "arith.addi"(%arg3, %1) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index loc("<stdin>":13:14)
        "sparse_tensor.yield"(%6) : (index) -> () loc("<stdin>":14:9)
      }) : (!sparse_tensor.iter_space<<{ map = (d0, d1) -> (d0 : compressed(nonunique), d1 : singleton(soa)) }>, lvls = 1>, index) -> index loc("<stdin>":11:12)
      "sparse_tensor.yield"(%5) : (index) -> () loc("<stdin>":16:7)
    }) : (!sparse_tensor.iter_space<<{ map = (d0, d1) -> (d0 : compressed(nonunique), d1 : singleton(soa)) }>, lvls = 0>, index) -> index loc("<stdin>":8:10)
    "func.return"(%3) : (index) -> () loc("<stdin>":18:5)
  }) : () -> () loc("<stdin>":3:3)
}) : () -> () loc("<stdin>":2:1)
