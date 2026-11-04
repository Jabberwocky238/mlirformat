#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?xf64, #sparse>) -> (), sym_name = "sparse_iterate"}> ({
  ^bb0(%arg0: tensor<?x?xf64, #sparse>):
    %0 = "sparse_tensor.extract_iteration_space"(%arg0) <{hiLvl = 1 : index, loLvl = 0 : index}> : (tensor<?x?xf64, #sparse>) -> !sparse_tensor.iter_space<#sparse, lvls = 0>
    "sparse_tensor.iterate"(%0) <{crdUsedLvls = 1 : i64}> ({
    ^bb0(%arg1: index, %arg2: !sparse_tensor.iterator<#sparse, lvls = 0>):
      %1 = "sparse_tensor.values"(%arg0) : (tensor<?x?xf64, #sparse>) -> memref<?xf64>
      %2 = "sparse_tensor.positions"(%arg0) <{level = 1 : index}> : (tensor<?x?xf64, #sparse>) -> memref<?xindex>
      %3 = "sparse_tensor.coordinates"(%arg0) <{level = 1 : index}> : (tensor<?x?xf64, #sparse>) -> memref<?xindex>
      "test.op"(%1, %2, %3) : (memref<?xf64>, memref<?xindex>, memref<?xindex>) -> ()
      "sparse_tensor.yield"() : () -> ()
    }) : (!sparse_tensor.iter_space<#sparse, lvls = 0>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

