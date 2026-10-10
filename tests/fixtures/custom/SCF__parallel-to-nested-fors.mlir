module {
  func.func private @callee(index, index)
  func.func @two_iters(%arg0: index, %arg1: index, %arg2: index, %arg3: index, %arg4: index, %arg5: index) {
    scf.parallel (%arg6, %arg7) = (%arg0, %arg1) to (%arg2, %arg3) step (%arg4, %arg5) {
      func.call @callee(%arg6, %arg7) : (index, index) -> ()
      scf.reduce 
    }
    return
  }
}

// -----
module {
  func.func private @callee(index, index)
  func.func @repeated(%arg0: index, %arg1: index, %arg2: index, %arg3: index, %arg4: index, %arg5: index) {
    scf.parallel (%arg6, %arg7) = (%arg0, %arg1) to (%arg2, %arg3) step (%arg4, %arg5) {
      func.call @callee(%arg6, %arg7) : (index, index) -> ()
      scf.reduce 
    }
    scf.parallel (%arg6, %arg7) = (%arg0, %arg1) to (%arg2, %arg3) step (%arg4, %arg5) {
      func.call @callee(%arg6, %arg7) : (index, index) -> ()
      scf.reduce 
    }
    return
  }
}

// -----
module {
  func.func private @callee(index, index, index, index)
  func.func @nested(%arg0: index, %arg1: index, %arg2: index, %arg3: index, %arg4: index, %arg5: index, %arg6: index, %arg7: index, %arg8: index, %arg9: index, %arg10: index, %arg11: index) {
    scf.parallel (%arg12, %arg13) = (%arg0, %arg1) to (%arg4, %arg5) step (%arg8, %arg9) {
      scf.parallel (%arg14, %arg15) = (%arg2, %arg3) to (%arg6, %arg7) step (%arg10, %arg11) {
        func.call @callee(%arg12, %arg13, %arg14, %arg15) : (index, index, index, index) -> ()
        scf.reduce 
      }
      scf.reduce 
    }
    return
  }
}

// -----
module {
  func.func private @callee(index, index) -> i32
  func.func @two_iters_with_reduce(%arg0: index, %arg1: index, %arg2: index, %arg3: index, %arg4: index, %arg5: index) -> i32 {
    %c0_i32 = arith.constant 0 : i32
    %0 = scf.parallel (%arg6, %arg7) = (%arg0, %arg1) to (%arg2, %arg3) step (%arg4, %arg5) init (%c0_i32) -> i32 {
      %1 = func.call @callee(%arg6, %arg7) : (index, index) -> i32
      scf.reduce(%1 : i32) {
      ^bb0(%arg8: i32, %arg9: i32):
        %2 = arith.addi %arg8, %arg9 : i32
        scf.reduce.return %2 : i32
      }
    }
    return %0 : i32
  }
}

