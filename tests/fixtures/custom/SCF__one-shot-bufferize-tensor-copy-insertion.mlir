module {
  func.func @scf_for(%arg0: tensor<?xf32>, %arg1: tensor<?xf32>, %arg2: index, %arg3: index, %arg4: index) -> (tensor<?xf32>, tensor<?xf32>) {
    %0:2 = scf.for %arg5 = %arg2 to %arg3 step %arg4 iter_args(%arg6 = %arg0, %arg7 = %arg1) -> (tensor<?xf32>, tensor<?xf32>) {
      scf.yield %arg6, %arg7 : tensor<?xf32>, tensor<?xf32>
    }
    return %0#0, %0#1 : tensor<?xf32>, tensor<?xf32>
  }
}

// -----
module {
  func.func @scf_for_swapping_yields(%arg0: tensor<?xf32>, %arg1: tensor<?xf32>, %arg2: index, %arg3: index, %arg4: index) -> (tensor<?xf32>, tensor<?xf32>) {
    %0:2 = scf.for %arg5 = %arg2 to %arg3 step %arg4 iter_args(%arg6 = %arg0, %arg7 = %arg1) -> (tensor<?xf32>, tensor<?xf32>) {
      scf.yield %arg7, %arg6 : tensor<?xf32>, tensor<?xf32>
    }
    return %0#0, %0#1 : tensor<?xf32>, tensor<?xf32>
  }
}

// -----
module {
  func.func @scf_while(%arg0: tensor<5xi1>, %arg1: tensor<5xi1>, %arg2: index) -> (tensor<5xi1>, tensor<5xi1>) {
    %0:2 = scf.while (%arg3 = %arg0, %arg4 = %arg1) : (tensor<5xi1>, tensor<5xi1>) -> (tensor<5xi1>, tensor<5xi1>) {
      %extracted = tensor.extract %arg3[%arg2] : tensor<5xi1>
      scf.condition(%extracted) %arg3, %arg4 : tensor<5xi1>, tensor<5xi1>
    } do {
    ^bb0(%arg3: tensor<5xi1>, %arg4: tensor<5xi1>):
      scf.yield %arg3, %arg4 : tensor<5xi1>, tensor<5xi1>
    }
    return %0#0, %0#1 : tensor<5xi1>, tensor<5xi1>
  }
}

// -----
module {
  func.func @scf_while_non_equiv_condition_and_body(%arg0: tensor<5xi1>, %arg1: tensor<5xi1>, %arg2: index) -> (tensor<5xi1>, tensor<5xi1>) {
    %0:2 = scf.while (%arg3 = %arg0, %arg4 = %arg1) : (tensor<5xi1>, tensor<5xi1>) -> (tensor<5xi1>, tensor<5xi1>) {
      %extracted = tensor.extract %arg3[%arg2] : tensor<5xi1>
      scf.condition(%extracted) %arg4, %arg3 : tensor<5xi1>, tensor<5xi1>
    } do {
    ^bb0(%arg3: tensor<5xi1>, %arg4: tensor<5xi1>):
      scf.yield %arg4, %arg3 : tensor<5xi1>, tensor<5xi1>
    }
    return %0#0, %0#1 : tensor<5xi1>, tensor<5xi1>
  }
}

// -----
module {
  func.func @scf_forall_out_of_place(%arg0: tensor<100xf32>, %arg1: tensor<100xf32>) {
    %c1 = arith.constant 1 : index
    %c100 = arith.constant 100 : index
    %0 = scf.forall (%arg2) in (%c100) shared_outs(%arg3 = %arg1) -> (tensor<100xf32>) {
      %extracted_slice = tensor.extract_slice %arg0[%arg2] [1] [1] : tensor<100xf32> to tensor<1xf32>
      scf.forall.in_parallel {
        tensor.parallel_insert_slice %extracted_slice into %arg3[%arg2] [1] [1] : tensor<1xf32> into tensor<100xf32>
      }
    } {mapping = [#gpu.thread<x>]}
    return
  }
}

// -----
module {
  func.func @in_order_multiple_parallel_writes(%arg0: tensor<320xf32>, %arg1: tensor<320xf32>) -> (tensor<320xf32>, tensor<320xf32>) {
    %c0 = arith.constant 0 : index
    %cst = arith.constant -0.000000e+00 : f32
    %c320 = arith.constant 320 : index
    %0:2 = scf.forall (%arg2) in (%c320) shared_outs(%arg3 = %arg0, %arg4 = %arg1) -> (tensor<320xf32>, tensor<320xf32>) {
      %extracted_slice = tensor.extract_slice %arg3[%arg2] [1] [1] : tensor<320xf32> to tensor<1xf32>
      %extracted_slice_0 = tensor.extract_slice %arg4[%arg2] [1] [1] : tensor<320xf32> to tensor<1xf32>
      %1 = linalg.fill ins(%cst : f32) outs(%extracted_slice_0 : tensor<1xf32>) -> tensor<1xf32>
      scf.forall.in_parallel {
        tensor.parallel_insert_slice %extracted_slice into %arg4[%arg2] [1] [1] : tensor<1xf32> into tensor<320xf32>
        tensor.parallel_insert_slice %1 into %arg3[%arg2] [1] [1] : tensor<1xf32> into tensor<320xf32>
      }
    }
    return %0#0, %0#1 : tensor<320xf32>, tensor<320xf32>
  }
}

