#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed(nonunique), d1 : singleton(soa)) }>
module {
  func.func @sparse_iteration_to_scf(%arg0: tensor<4x8xf32, #sparse>) -> index {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %0 = sparse_tensor.extract_iteration_space %arg0 lvls = 0 : tensor<4x8xf32, #sparse> -> !sparse_tensor.iter_space<#sparse, lvls = 0>
    %1 = sparse_tensor.iterate %arg2 in %0 iter_args(%arg1 = %c0) : !sparse_tensor.iter_space<#sparse, lvls = 0>  -> index {
      %2 = sparse_tensor.extract_iteration_space %arg0 at %arg2 lvls = 1 : tensor<4x8xf32, #sparse>, !sparse_tensor.iterator<#sparse, lvls = 0> -> !sparse_tensor.iter_space<#sparse, lvls = 1>
      %3 = sparse_tensor.iterate %arg4 in %2 iter_args(%arg3 = %arg1) : !sparse_tensor.iter_space<#sparse, lvls = 1>  -> index {
        %4 = arith.addi %arg3, %c1 : index
        sparse_tensor.yield %4 : index
      }
      sparse_tensor.yield %3 : index
    }
    return %1 : index
  }
}

