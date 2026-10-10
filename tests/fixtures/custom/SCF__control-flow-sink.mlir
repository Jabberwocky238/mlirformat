module {
  func.func @test_scf_if_sink(%arg0: i1, %arg1: i32) -> i32 {
    %0 = arith.addi %arg1, %arg1 : i32
    %1 = arith.muli %arg1, %arg1 : i32
    %2 = scf.if %arg0 -> (i32) {
      scf.yield %0 : i32
    } else {
      scf.yield %1 : i32
    }
    return %2 : i32
  }
}

// -----
module {
  func.func private @consume(i32)
  func.func @test_scf_if_then_only_sink(%arg0: i1, %arg1: i32) {
    %0 = arith.addi %arg1, %arg1 : i32
    scf.if %arg0 {
      func.call @consume(%0) : (i32) -> ()
    }
    return
  }
}

// -----
module {
  func.func private @consume(i32)
  func.func @test_scf_if_double_sink(%arg0: i1, %arg1: i32) {
    %0 = arith.addi %arg1, %arg1 : i32
    scf.if %arg0 {
      scf.if %arg0 {
        func.call @consume(%0) : (i32) -> ()
      }
    }
    return
  }
}

