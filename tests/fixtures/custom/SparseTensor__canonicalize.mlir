#sparse = #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d0 : dense, d1 : loose_compressed(nonunique), d2 : singleton) }>
module {
  func.func @sparse_slice_canonicalize(%arg0: tensor<?x?x?xf32, #sparse>, %arg1: index, %arg2: index) -> tensor<?x?x?xf32, #sparse> {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c4 = arith.constant 4 : index
    %extracted_slice = tensor.extract_slice %arg0[%c0, %arg1, %c1] [%c4, %c1, %arg2] [%c1, %c1, %c1] : tensor<?x?x?xf32, #sparse> to tensor<?x?x?xf32, #sparse>
    return %extracted_slice : tensor<?x?x?xf32, #sparse>
  }
}

// -----
#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>
module {
  func.func @sparse_iterate_canonicalize(%arg0: tensor<?x?xf64, #sparse>) {
    %0 = sparse_tensor.extract_iteration_space %arg0 lvls = 0 to 2 : tensor<?x?xf64, #sparse> -> !sparse_tensor.iter_space<#sparse, lvls = 0 to 2>
    sparse_tensor.iterate %arg3 in %0 at(%arg1, %arg2) : !sparse_tensor.iter_space<#sparse, lvls = 0 to 2>  {
      "test.op"(%arg2) : (index) -> ()
    }
    return
  }
}

