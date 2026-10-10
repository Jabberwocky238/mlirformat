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
  func.func @mapping_attr() {
    %c100 = arith.constant 100 : index
    scf.forall (%arg0) in (%c100) {
    } {mapping = [#gpu.thread<x>]}
    return
  }
}

