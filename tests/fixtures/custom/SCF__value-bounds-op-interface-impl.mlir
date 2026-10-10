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
  func.func @scf_for_swapping_yield(%arg0: tensor<?xf32>, %arg1: tensor<?xf32>, %arg2: index, %arg3: index, %arg4: index) {
    %cst = arith.constant 5.000000e+00 : f32
    %0:2 = scf.for %arg5 = %arg2 to %arg3 step %arg4 iter_args(%arg6 = %arg0, %arg7 = %arg1) -> (tensor<?xf32>, tensor<?xf32>) {
      %2 = linalg.fill ins(%cst : f32) outs(%arg6 : tensor<?xf32>) -> tensor<?xf32>
      %3 = linalg.fill ins(%cst : f32) outs(%arg7 : tensor<?xf32>) -> tensor<?xf32>
      scf.yield %3, %2 : tensor<?xf32>, tensor<?xf32>
    }
    %1 = "test.reify_bound"(%0#0) <{dim = 0 : i64, type = "EQ"}> : (tensor<?xf32>) -> index
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
  func.func @scf_if_no_affine_bound(%arg0: index, %arg1: index, %arg2: i1) {
    %0 = scf.if %arg2 -> (index) {
      scf.yield %arg0 : index
    } else {
      scf.yield %arg1 : index
    }
    %1 = "test.reify_bound"(%0) <{type = "LB"}> : (index) -> index
    "test.some_use"(%1) : (index) -> ()
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

// -----
module {
  func.func @compare_scf_for(%arg0: index, %arg1: index, %arg2: index) {
    scf.for %arg3 = %arg0 to %arg1 step %arg2 {
      "test.compare"(%arg3, %arg0) <{cmp = "GE"}> : (index, index) -> ()
      "test.compare"(%arg3, %arg1) <{cmp = "LT"}> : (index, index) -> ()
    }
    return
  }
}

// -----
module {
  func.func @scf_for_induction_var_upper_bound() {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c2 = arith.constant 2 : index
    %c3 = arith.constant 3 : index
    %c4 = arith.constant 4 : index
    %c5 = arith.constant 5 : index
    %c8 = arith.constant 8 : index
    %c10 = arith.constant 10 : index
    scf.for %arg0 = %c0 to %c10 step %c4 {
      "test.compare"(%arg0, %c8) <{cmp = "LE"}> : (index, index) -> ()
    }
    scf.for %arg0 = %c2 to %c8 step %c3 {
      "test.compare"(%arg0, %c5) <{cmp = "LE"}> : (index, index) -> ()
    }
    return
  }
}

// -----
#map = affine_map<(d0)[s0] -> (d0 ceildiv s0)>
module {
  func.func @scf_for_induction_var_computed_upper_bound(%arg0: index, %arg1: index) {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %0 = affine.apply #map(%arg0)[%arg1]
    %1 = arith.subi %0, %c1 : index
    %2 = arith.muli %1, %arg1 : index
    scf.for %arg2 = %c0 to %arg0 step %arg1 {
      "test.compare"(%arg2, %2) <{cmp = "LE"}> : (index, index) -> ()
    }
    return
  }
}

// -----
module {
  func.func @scf_for_result_infer() {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c10 = arith.constant 10 : index
    %0 = scf.for %arg0 = %c0 to %c10 step %c1 iter_args(%arg1 = %c0) -> (index) {
      %1 = "test.some_use"() : () -> i1
      %2 = scf.if %1 -> (index) {
        %3 = arith.addi %arg1, %c1 : index
        scf.yield %3 : index
      } else {
        scf.yield %arg1 : index
      }
      scf.yield %2 : index
    }
    "test.compare"(%0, %c10) <{cmp = "LE"}> : (index, index) -> ()
    return
  }
}

// -----
module {
  func.func @scf_for_result_infer_dynamic_init(%arg0: index) {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c10 = arith.constant 10 : index
    %0 = scf.for %arg1 = %c0 to %c10 step %c1 iter_args(%arg2 = %arg0) -> (index) {
      %2 = "test.some_use"() : () -> i1
      %3 = scf.if %2 -> (index) {
        %4 = arith.addi %arg2, %c1 : index
        scf.yield %4 : index
      } else {
        scf.yield %arg2 : index
      }
      scf.yield %3 : index
    }
    %1 = arith.addi %arg0, %c10 : index
    "test.compare"(%0, %1) <{cmp = "LE"}> : (index, index) -> ()
    return
  }
}

// -----
module {
  func.func @scf_for_result_infer_dynamic_init_big_step(%arg0: index) {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c2 = arith.constant 2 : index
    %c4 = arith.constant 4 : index
    %c5 = arith.constant 5 : index
    %c10 = arith.constant 10 : index
    %0 = scf.for %arg1 = %c0 to %c10 step %c2 iter_args(%arg2 = %arg0) -> (index) {
      %3 = "test.some_use"() : () -> i1
      %4 = scf.if %3 -> (index) {
        %5 = arith.addi %arg2, %c1 : index
        scf.yield %5 : index
      } else {
        scf.yield %arg2 : index
      }
      scf.yield %4 : index
    }
    %1 = arith.addi %arg0, %c5 : index
    %2 = arith.addi %arg0, %c4 : index
    "test.compare"(%0, %1) <{cmp = "LE"}> : (index, index) -> ()
    "test.compare"(%0, %2) <{cmp = "LE"}> : (index, index) -> ()
    return
  }
  func.func @scf_forall_computed_upper_bound(%arg0: index) {
    %c6 = arith.constant 6 : index
    scf.forall (%arg1) = (0) to (8) step (3) {
      "test.compare"(%arg1, %c6) <{cmp = "LE"}> : (index, index) -> ()
    }
    return
  }
}

