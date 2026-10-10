module {
  func.func @scf_for_iter_arg(%arg0: tensor<128xf32, 1 : i64>, %arg1: index, %arg2: index, %arg3: index) -> tensor<128xf32, 1 : i64> {
    %0 = scf.for %arg4 = %arg1 to %arg2 step %arg3 iter_args(%arg5 = %arg0) -> (tensor<128xf32, 1 : i64>) {
      %1 = "some.use"(%arg5) : (tensor<128xf32, 1 : i64>) -> tensor<128xf32, 1 : i64>
      scf.yield %1 : tensor<128xf32, 1 : i64>
    }
    return %0 : tensor<128xf32, 1 : i64>
  }
}

// -----
module {
  func.func @scf_forall(%arg0: index, %arg1: index, %arg2: tensor<?xf32, 1 : i64>, %arg3: tensor<?xf32, 1 : i64>) -> tensor<?xf32, 1 : i64> {
    %cst = arith.constant 4.200000e+01 : f32
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %0 = scf.forall (%arg4) in (%arg1) shared_outs(%arg5 = %arg3) -> (tensor<?xf32, 1 : i64>) {
      %1 = "some.use"(%arg5) : (tensor<?xf32, 1 : i64>) -> tensor<?xf32, 1 : i64>
      scf.forall.in_parallel {
        tensor.parallel_insert_slice %1 into %arg5[5] [%arg0] [%c1] : tensor<?xf32, 1 : i64> into tensor<?xf32, 1 : i64>
      }
    }
    return %0 : tensor<?xf32, 1 : i64>
  }
}

// -----
module {
  func.func @scf_execute_region(%arg0: tensor<128xf32, 1 : i64>) -> tensor<128xf32, 1 : i64> {
    %0 = scf.execute_region -> tensor<128xf32, 1 : i64> {
      scf.yield %arg0 : tensor<128xf32, 1 : i64>
    }
    %1 = "some.use"(%0) : (tensor<128xf32, 1 : i64>) -> tensor<128xf32, 1 : i64>
    return %1 : tensor<128xf32, 1 : i64>
  }
}

