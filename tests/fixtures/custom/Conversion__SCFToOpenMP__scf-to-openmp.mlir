module {
  func.func @parallel(%arg0: index, %arg1: index, %arg2: index, %arg3: index, %arg4: index, %arg5: index) {
    scf.parallel (%arg6, %arg7) = (%arg0, %arg1) to (%arg2, %arg3) step (%arg4, %arg5) {
      "test.payload"(%arg6, %arg7) : (index, index) -> ()
      scf.reduce 
    }
    return
  }
  func.func @nested_loops(%arg0: index, %arg1: index, %arg2: index, %arg3: index, %arg4: index, %arg5: index) {
    scf.parallel (%arg6) = (%arg0) to (%arg2) step (%arg4) {
      scf.parallel (%arg7) = (%arg1) to (%arg3) step (%arg5) {
        "test.payload"(%arg6, %arg7) : (index, index) -> ()
        scf.reduce 
      }
      scf.reduce 
    }
    return
  }
  func.func @adjacent_loops(%arg0: index, %arg1: index, %arg2: index, %arg3: index, %arg4: index, %arg5: index) {
    scf.parallel (%arg6) = (%arg0) to (%arg2) step (%arg4) {
      "test.payload1"(%arg6) : (index) -> ()
      scf.reduce 
    }
    scf.parallel (%arg6) = (%arg1) to (%arg3) step (%arg5) {
      "test.payload2"(%arg6) : (index) -> ()
      scf.reduce 
    }
    return
  }
}

