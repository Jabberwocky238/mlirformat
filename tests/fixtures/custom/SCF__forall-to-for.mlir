module {
  func.func private @callee(index, index)
  func.func @two_iters(%arg0: index, %arg1: index) {
    scf.forall (%arg2, %arg3) in (%arg0, %arg1) {
      func.call @callee(%arg2, %arg3) : (index, index) -> ()
    }
    return
  }
}

// -----
module {
  func.func private @callee(index, index)
  func.func @repeated(%arg0: index, %arg1: index) {
    scf.forall (%arg2, %arg3) in (%arg0, %arg1) {
      func.call @callee(%arg2, %arg3) : (index, index) -> ()
    }
    scf.forall (%arg2, %arg3) in (%arg0, %arg1) {
      func.call @callee(%arg2, %arg3) : (index, index) -> ()
    }
    return
  }
}

// -----
module {
  func.func private @callee(index, index, index, index)
  func.func @nested(%arg0: index, %arg1: index, %arg2: index, %arg3: index) {
    scf.forall (%arg4, %arg5) in (%arg0, %arg1) {
      scf.forall (%arg6, %arg7) in (%arg2, %arg3) {
        func.call @callee(%arg4, %arg5, %arg6, %arg7) : (index, index, index, index) -> ()
      }
    }
    return
  }
}

// -----
module {
  func.func private @callee(index)
  func.func @shared_outs(%arg0: tensor<1xf32>, %arg1: index) -> tensor<1xf32> {
    %0 = scf.forall (%arg2) in (1) shared_outs(%arg3 = %arg0) -> (tensor<1xf32>) {
      scf.forall.in_parallel {
        tensor.parallel_insert_slice %arg3 into %arg3[%arg2] [1] [1] : tensor<1xf32> into tensor<1xf32>
      }
    }
    scf.forall (%arg2) in (%arg1) {
      func.call @callee(%arg2) : (index) -> ()
    }
    return %0 : tensor<1xf32>
  }
}

