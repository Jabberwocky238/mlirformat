module {
  func.func @scf_for(%arg0: index, %arg1: index, %arg2: index) {
    scf.for %arg3 = %arg0 to %arg1 step %arg2 {
      %0 = "test.reify_bound"(%arg3) <{type = "LB"}> : (index) -> index
      %1 = "test.reify_bound"(%arg3) <{type = "UB"}> : (index) -> index
      "test.some_use"(%0, %1) : (index, index) -> ()
    }
    return
  }
}

// -----
module {
  func.func @scf_for_index_result_small(%arg0: index, %arg1: index, %arg2: index, %arg3: index) {
    %0 = scf.for %arg4 = %arg1 to %arg2 step %arg3 iter_args(%arg5 = %arg0) -> (index) {
      %2 = "test.reify_bound"(%arg5) <{type = "EQ"}> : (index) -> index
      "test.some_use"(%2) : (index) -> ()
      scf.yield %arg5 : index
    }
    %1 = "test.reify_bound"(%0) <{type = "EQ"}> : (index) -> index
    "test.some_use"(%1) : (index) -> ()
    return
  }
}

// -----
module {
  func.func @scf_for_index_result(%arg0: index, %arg1: index, %arg2: index, %arg3: index) {
    %0 = scf.for %arg4 = %arg1 to %arg2 step %arg3 iter_args(%arg5 = %arg0) -> (index) {
      %2 = arith.addi %arg5, %arg1 : index
      %3 = arith.subi %2, %arg1 : index
      %4 = "test.reify_bound"(%arg5) <{type = "EQ"}> : (index) -> index
      "test.some_use"(%4) : (index) -> ()
      scf.yield %3 : index
    }
    %1 = "test.reify_bound"(%0) <{type = "EQ"}> : (index) -> index
    "test.some_use"(%1) : (index) -> ()
    return
  }
}

// -----
module {
  func.func @scf_for_tensor_result_small(%arg0: tensor<?xf32>, %arg1: index, %arg2: index, %arg3: index) {
    %0 = scf.for %arg4 = %arg1 to %arg2 step %arg3 iter_args(%arg5 = %arg0) -> (tensor<?xf32>) {
      %2 = "test.reify_bound"(%arg5) <{dim = 0 : i64, type = "EQ"}> : (tensor<?xf32>) -> index
      "test.some_use"(%2) : (index) -> ()
      scf.yield %arg5 : tensor<?xf32>
    }
    %1 = "test.reify_bound"(%0) <{dim = 0 : i64, type = "EQ"}> : (tensor<?xf32>) -> index
    "test.some_use"(%1) : (index) -> ()
    return
  }
}

// -----
module {
  func.func @scf_for_tensor_result(%arg0: tensor<?xf32>, %arg1: index, %arg2: index, %arg3: index) {
    %cst = arith.constant 5.000000e+00 : f32
    %0 = scf.for %arg4 = %arg1 to %arg2 step %arg3 iter_args(%arg5 = %arg0) -> (tensor<?xf32>) {
      %2 = linalg.fill ins(%cst : f32) outs(%arg5 : tensor<?xf32>) -> tensor<?xf32>
      %3 = "test.reify_bound"(%arg5) <{dim = 0 : i64, type = "EQ"}> : (tensor<?xf32>) -> index
      "test.some_use"(%3) : (index) -> ()
      scf.yield %2 : tensor<?xf32>
    }
    %1 = "test.reify_bound"(%0) <{dim = 0 : i64, type = "EQ"}> : (tensor<?xf32>) -> index
    "test.some_use"(%1) : (index) -> ()
    return
  }
}

// -----
module {
  func.func @scf_forall(%arg0: index, %arg1: index, %arg2: index) {
    scf.forall (%arg3) = (%arg0) to (%arg1) step (%arg2) {
      %0 = "test.reify_bound"(%arg3) <{type = "LB"}> : (index) -> index
      %1 = "test.reify_bound"(%arg3) <{type = "UB"}> : (index) -> index
      "test.some_use"(%0, %1) : (index, index) -> ()
    }
    return
  }
}

// -----
module {
  func.func @scf_forall_tensor_result(%arg0: index, %arg1: index, %arg2: index, %arg3: index) {
    %cst = arith.constant 5.000000e+00 : f32
    %0 = tensor.empty(%arg0) : tensor<?xf32>
    %1 = scf.forall (%arg4) = (%arg1) to (%arg2) step (%arg3) shared_outs(%arg5 = %0) -> (tensor<?xf32>) {
      %3 = linalg.fill ins(%cst : f32) outs(%arg5 : tensor<?xf32>) -> tensor<?xf32>
      %4 = "test.reify_bound"(%arg5) <{dim = 0 : i64, type = "EQ"}> : (tensor<?xf32>) -> index
      "test.some_use"(%4) : (index) -> ()
      scf.forall.in_parallel {
        tensor.parallel_insert_slice %3 into %arg5[0] [%arg0] [1] : tensor<?xf32> into tensor<?xf32>
      }
    }
    %2 = "test.reify_bound"(%1) <{dim = 0 : i64, type = "EQ"}> : (tensor<?xf32>) -> index
    "test.some_use"(%2) : (index) -> ()
    return
  }
}

// -----
module {
  func.func @scf_if_constant(%arg0: i1) {
    %c4 = arith.constant 4 : index
    %c9 = arith.constant 9 : index
    %0 = scf.if %arg0 -> (index) {
      scf.yield %c4 : index
    } else {
      scf.yield %c9 : index
    }
    %1 = "test.reify_bound"(%0) <{type = "LB"}> : (index) -> index
    %2 = "test.reify_bound"(%0) <{type = "UB"}> : (index) -> index
    "test.some_use"(%1, %2) : (index, index) -> ()
    return
  }
}

// -----
module {
  func.func @scf_if_dynamic(%arg0: index, %arg1: index, %arg2: i1) {
    %c4 = arith.constant 4 : index
    %0 = scf.if %arg2 -> (index) {
      %3 = arith.addi %arg0, %arg1 : index
      scf.yield %3 : index
    } else {
      %3 = arith.addi %arg1, %c4 : index
      %4 = arith.addi %3, %arg0 : index
      scf.yield %4 : index
    }
    %1 = "test.reify_bound"(%0) <{type = "LB"}> : (index) -> index
    %2 = "test.reify_bound"(%0) <{type = "UB"}> : (index) -> index
    "test.some_use"(%1, %2) : (index, index) -> ()
    return
  }
}

// -----
module {
  func.func @scf_if_tensor_dim(%arg0: i1) {
    %c4 = arith.constant 4 : index
    %c9 = arith.constant 9 : index
    %0 = tensor.empty(%c4) : tensor<?xf32>
    %1 = tensor.empty(%c9) : tensor<?xf32>
    %2 = scf.if %arg0 -> (tensor<?xf32>) {
      scf.yield %0 : tensor<?xf32>
    } else {
      scf.yield %1 : tensor<?xf32>
    }
    %3 = "test.reify_bound"(%2) <{dim = 0 : i64, type = "LB"}> : (tensor<?xf32>) -> index
    %4 = "test.reify_bound"(%2) <{dim = 0 : i64, type = "UB"}> : (tensor<?xf32>) -> index
    "test.some_use"(%3, %4) : (index, index) -> ()
    return
  }
}

// -----
module {
  func.func @scf_if_eq(%arg0: index, %arg1: index, %arg2: i1) {
    %c0 = arith.constant 0 : index
    %0 = scf.if %arg2 -> (index) {
      %2 = arith.addi %arg0, %arg1 : index
      scf.yield %2 : index
    } else {
      %2 = arith.addi %arg1, %c0 : index
      %3 = arith.addi %2, %arg0 : index
      scf.yield %3 : index
    }
    %1 = "test.reify_bound"(%0) <{type = "EQ"}> : (index) -> index
    "test.some_use"(%1) : (index) -> ()
    return
  }
}

