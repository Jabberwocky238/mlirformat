"builtin.module"() ({
  "func.func"() <{function_type = (tensor<4x8xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed(nonunique), d1 : singleton(soa)) }>>) -> index, sym_name = "sparse_sparse_collapse"}> ({
  ^bb0(%arg6: tensor<4x8xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed(nonunique), d1 : singleton(soa)) }>> loc("<stdin>":4:8)):
    %8 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":5:10)
    %9 = "arith.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":6:10)
    %10 = "sparse_tensor.extract_iteration_space"(%arg6) <{hiLvl = 1 : index, loLvl = 0 : index}> : (tensor<4x8xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed(nonunique), d1 : singleton(soa)) }>>) -> !sparse_tensor.iter_space<<{ map = (d0, d1) -> (d0 : compressed(nonunique), d1 : singleton(soa)) }>, lvls = 0> loc("<stdin>":7:11)
    %11 = "sparse_tensor.iterate"(%10, %8) <{crdUsedLvls = 0 : i64}> ({
    ^bb0(%arg7: index loc("<stdin>":9:10), %arg8: !sparse_tensor.iterator<<{ map = (d0, d1) -> (d0 : compressed(nonunique), d1 : singleton(soa)) }>, lvls = 0> loc("<stdin>":9:24)):
      %12 = "sparse_tensor.extract_iteration_space"(%arg6, %arg8) <{hiLvl = 2 : index, loLvl = 1 : index}> : (tensor<4x8xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed(nonunique), d1 : singleton(soa)) }>>, !sparse_tensor.iterator<<{ map = (d0, d1) -> (d0 : compressed(nonunique), d1 : singleton(soa)) }>, lvls = 0>) -> !sparse_tensor.iter_space<<{ map = (d0, d1) -> (d0 : compressed(nonunique), d1 : singleton(soa)) }>, lvls = 1> loc("<stdin>":10:13)
      %13 = "sparse_tensor.iterate"(%12, %arg7) <{crdUsedLvls = 0 : i64}> ({
      ^bb0(%arg9: index loc("<stdin>":12:12), %arg10: !sparse_tensor.iterator<<{ map = (d0, d1) -> (d0 : compressed(nonunique), d1 : singleton(soa)) }>, lvls = 1> loc("<stdin>":12:26)):
        %14 = "arith.addi"(%arg9, %9) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index loc("<stdin>":13:15)
        "sparse_tensor.yield"(%14) : (index) -> () loc("<stdin>":14:9)
      }) : (!sparse_tensor.iter_space<<{ map = (d0, d1) -> (d0 : compressed(nonunique), d1 : singleton(soa)) }>, lvls = 1>, index) -> index loc("<stdin>":11:13)
      "sparse_tensor.yield"(%13) : (index) -> () loc("<stdin>":16:7)
    }) : (!sparse_tensor.iter_space<<{ map = (d0, d1) -> (d0 : compressed(nonunique), d1 : singleton(soa)) }>, lvls = 0>, index) -> index loc("<stdin>":8:11)
    "func.return"(%11) : (index) -> () loc("<stdin>":18:5)
  }) : () -> () loc("<stdin>":3:3)
  "func.func"() <{function_type = (tensor<4x8xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed(nonunique), d1 : singleton(soa)) }>>, tensor<4x8xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed(nonunique), d1 : singleton(soa)) }>>) -> index, sym_name = "no_crash_unconsumed_iter_space"}> ({
  ^bb0(%arg0: tensor<4x8xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed(nonunique), d1 : singleton(soa)) }>> loc("<stdin>":21:8), %arg1: tensor<4x8xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed(nonunique), d1 : singleton(soa)) }>> loc("<stdin>":21:41)):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":22:10)
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":23:10)
    %2 = "sparse_tensor.extract_iteration_space"(%arg0) <{hiLvl = 1 : index, loLvl = 0 : index}> : (tensor<4x8xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed(nonunique), d1 : singleton(soa)) }>>) -> !sparse_tensor.iter_space<<{ map = (d0, d1) -> (d0 : compressed(nonunique), d1 : singleton(soa)) }>, lvls = 0> loc("<stdin>":24:10)
    %3 = "sparse_tensor.iterate"(%2, %0) <{crdUsedLvls = 0 : i64}> ({
    ^bb0(%arg2: index loc("<stdin>":26:10), %arg3: !sparse_tensor.iterator<<{ map = (d0, d1) -> (d0 : compressed(nonunique), d1 : singleton(soa)) }>, lvls = 0> loc("<stdin>":26:24)):
      %4 = "sparse_tensor.extract_iteration_space"(%arg0, %arg3) <{hiLvl = 2 : index, loLvl = 1 : index}> : (tensor<4x8xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed(nonunique), d1 : singleton(soa)) }>>, !sparse_tensor.iterator<<{ map = (d0, d1) -> (d0 : compressed(nonunique), d1 : singleton(soa)) }>, lvls = 0>) -> !sparse_tensor.iter_space<<{ map = (d0, d1) -> (d0 : compressed(nonunique), d1 : singleton(soa)) }>, lvls = 1> loc("<stdin>":27:12)
      %5 = "sparse_tensor.iterate"(%4, %arg2) <{crdUsedLvls = 0 : i64}> ({
      ^bb0(%arg4: index loc("<stdin>":29:12), %arg5: !sparse_tensor.iterator<<{ map = (d0, d1) -> (d0 : compressed(nonunique), d1 : singleton(soa)) }>, lvls = 1> loc("<stdin>":29:26)):
        %6 = "sparse_tensor.extract_iteration_space"(%arg1) <{hiLvl = 1 : index, loLvl = 0 : index}> : (tensor<4x8xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed(nonunique), d1 : singleton(soa)) }>>) -> !sparse_tensor.iter_space<<{ map = (d0, d1) -> (d0 : compressed(nonunique), d1 : singleton(soa)) }>, lvls = 0> loc("<stdin>":30:14)
        %7 = "arith.addi"(%arg4, %1) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index loc("<stdin>":31:14)
        "sparse_tensor.yield"(%7) : (index) -> () loc("<stdin>":32:9)
      }) : (!sparse_tensor.iter_space<<{ map = (d0, d1) -> (d0 : compressed(nonunique), d1 : singleton(soa)) }>, lvls = 1>, index) -> index loc("<stdin>":28:12)
      "sparse_tensor.yield"(%5) : (index) -> () loc("<stdin>":34:7)
    }) : (!sparse_tensor.iter_space<<{ map = (d0, d1) -> (d0 : compressed(nonunique), d1 : singleton(soa)) }>, lvls = 0>, index) -> index loc("<stdin>":25:10)
    "func.return"(%3) : (index) -> () loc("<stdin>":36:5)
  }) : () -> () loc("<stdin>":20:3)
}) : () -> () loc("<stdin>":2:1)
