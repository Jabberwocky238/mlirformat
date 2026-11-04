#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed(nonunique), d1 : singleton(soa)) }>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<4x8xf32, #sparse>) -> index, sym_name = "sparse_iteration_to_scf"}> ({
  ^bb0(%arg0: tensor<4x8xf32, #sparse>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index
    %2 = "sparse_tensor.extract_iteration_space"(%arg0) <{hiLvl = 1 : index, loLvl = 0 : index}> : (tensor<4x8xf32, #sparse>) -> !sparse_tensor.iter_space<#sparse, lvls = 0>
    %3 = "sparse_tensor.iterate"(%2, %0) <{crdUsedLvls = 0 : i64}> ({
    ^bb0(%arg1: index, %arg2: !sparse_tensor.iterator<#sparse, lvls = 0>):
      %4 = "sparse_tensor.extract_iteration_space"(%arg0, %arg2) <{hiLvl = 2 : index, loLvl = 1 : index}> : (tensor<4x8xf32, #sparse>, !sparse_tensor.iterator<#sparse, lvls = 0>) -> !sparse_tensor.iter_space<#sparse, lvls = 1>
      %5 = "sparse_tensor.iterate"(%4, %arg1) <{crdUsedLvls = 0 : i64}> ({
      ^bb0(%arg3: index, %arg4: !sparse_tensor.iterator<#sparse, lvls = 1>):
        %6 = "arith.addi"(%arg3, %1) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
        "sparse_tensor.yield"(%6) : (index) -> ()
      }) : (!sparse_tensor.iter_space<#sparse, lvls = 1>, index) -> index
      "sparse_tensor.yield"(%5) : (index) -> ()
    }) : (!sparse_tensor.iter_space<#sparse, lvls = 0>, index) -> index
    "func.return"(%3) : (index) -> ()
  }) : () -> ()
}) : () -> ()

