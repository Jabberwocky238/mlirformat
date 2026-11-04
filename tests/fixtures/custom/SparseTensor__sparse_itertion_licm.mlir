#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>
module {
  func.func @sparse_iterate(%arg0: tensor<?x?xf64, #sparse>) {
    %0 = sparse_tensor.extract_iteration_space %arg0 lvls = 0 : tensor<?x?xf64, #sparse> -> !sparse_tensor.iter_space<#sparse, lvls = 0>
    sparse_tensor.iterate %arg2 in %0 at(%arg1) : !sparse_tensor.iter_space<#sparse, lvls = 0>  {
      %1 = sparse_tensor.values %arg0 : tensor<?x?xf64, #sparse> to memref<?xf64>
      %2 = sparse_tensor.positions %arg0 {level = 1 : index} : tensor<?x?xf64, #sparse> to memref<?xindex>
      %3 = sparse_tensor.coordinates %arg0 {level = 1 : index} : tensor<?x?xf64, #sparse> to memref<?xindex>
      "test.op"(%1, %2, %3) : (memref<?xf64>, memref<?xindex>, memref<?xindex>) -> ()
    }
    return
  }
}

