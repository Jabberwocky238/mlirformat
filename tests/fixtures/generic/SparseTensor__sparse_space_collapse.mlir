#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed(nonunique), d1 : singleton(soa)) }>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<4x8xf32, #sparse>) -> index, sym_name = "sparse_sparse_collapse"}> ({
  ^bb0(%arg6: tensor<4x8xf32, #sparse>):
    %8 = "arith.constant"() <{value = 0 : index}> : () -> index
    %9 = "arith.constant"() <{value = 1 : index}> : () -> index
    %10 = "sparse_tensor.extract_iteration_space"(%arg6) <{hiLvl = 1 : index, loLvl = 0 : index}> : (tensor<4x8xf32, #sparse>) -> !sparse_tensor.iter_space<#sparse, lvls = 0>
    %11 = "sparse_tensor.iterate"(%10, %8) <{crdUsedLvls = 0 : i64}> ({
    ^bb0(%arg7: index, %arg8: !sparse_tensor.iterator<#sparse, lvls = 0>):
      %12 = "sparse_tensor.extract_iteration_space"(%arg6, %arg8) <{hiLvl = 2 : index, loLvl = 1 : index}> : (tensor<4x8xf32, #sparse>, !sparse_tensor.iterator<#sparse, lvls = 0>) -> !sparse_tensor.iter_space<#sparse, lvls = 1>
      %13 = "sparse_tensor.iterate"(%12, %arg7) <{crdUsedLvls = 0 : i64}> ({
      ^bb0(%arg9: index, %arg10: !sparse_tensor.iterator<#sparse, lvls = 1>):
        %14 = "arith.addi"(%arg9, %9) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
        "sparse_tensor.yield"(%14) : (index) -> ()
      }) : (!sparse_tensor.iter_space<#sparse, lvls = 1>, index) -> index
      "sparse_tensor.yield"(%13) : (index) -> ()
    }) : (!sparse_tensor.iter_space<#sparse, lvls = 0>, index) -> index
    "func.return"(%11) : (index) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<4x8xf32, #sparse>, tensor<4x8xf32, #sparse>) -> index, sym_name = "no_crash_unconsumed_iter_space"}> ({
  ^bb0(%arg0: tensor<4x8xf32, #sparse>, %arg1: tensor<4x8xf32, #sparse>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index
    %2 = "sparse_tensor.extract_iteration_space"(%arg0) <{hiLvl = 1 : index, loLvl = 0 : index}> : (tensor<4x8xf32, #sparse>) -> !sparse_tensor.iter_space<#sparse, lvls = 0>
    %3 = "sparse_tensor.iterate"(%2, %0) <{crdUsedLvls = 0 : i64}> ({
    ^bb0(%arg2: index, %arg3: !sparse_tensor.iterator<#sparse, lvls = 0>):
      %4 = "sparse_tensor.extract_iteration_space"(%arg0, %arg3) <{hiLvl = 2 : index, loLvl = 1 : index}> : (tensor<4x8xf32, #sparse>, !sparse_tensor.iterator<#sparse, lvls = 0>) -> !sparse_tensor.iter_space<#sparse, lvls = 1>
      %5 = "sparse_tensor.iterate"(%4, %arg2) <{crdUsedLvls = 0 : i64}> ({
      ^bb0(%arg4: index, %arg5: !sparse_tensor.iterator<#sparse, lvls = 1>):
        %6 = "sparse_tensor.extract_iteration_space"(%arg1) <{hiLvl = 1 : index, loLvl = 0 : index}> : (tensor<4x8xf32, #sparse>) -> !sparse_tensor.iter_space<#sparse, lvls = 0>
        %7 = "arith.addi"(%arg4, %1) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
        "sparse_tensor.yield"(%7) : (index) -> ()
      }) : (!sparse_tensor.iter_space<#sparse, lvls = 1>, index) -> index
      "sparse_tensor.yield"(%5) : (index) -> ()
    }) : (!sparse_tensor.iter_space<#sparse, lvls = 0>, index) -> index
    "func.return"(%3) : (index) -> ()
  }) : () -> ()
}) : () -> ()

