module {
  func.func @check_results(%arg0: i16, %arg1: i16, %arg2: i16, %arg3: i16) {
    %cst = arith.constant dense<0> : vector<2xi16>
    %0 = vector.insert %arg0, %cst [0] : i16 into vector<2xi16>
    %1 = vector.insert %arg1, %0 [1] : i16 into vector<2xi16>
    vector.print %1 : vector<2xi16>
    vector.print %arg2 : i16
    %2 = arith.cmpi ne, %arg2, %arg3 : i16
    scf.if %2 {
      vector.print %arg3 : i16
      vector.print str "Mismatch\0A"
    }
    return
  }
  func.func @xorshift(%arg0: i16) -> i16 {
    %c8_i16 = arith.constant 8 : i16
    %0 = arith.shrui %arg0, %c8_i16 : i16
    %1 = arith.xori %arg0, %0 : i16
    return %1 : i16
  }
  func.func @xhash(%arg0: i16) -> i16 {
    %c21845_i16 = arith.constant 21845 : i16
    %c25867_i16 = arith.constant 25867 : i16
    %0 = call @xorshift(%arg0) : (i16) -> i16
    %1 = arith.muli %0, %c21845_i16 : i16
    %2 = call @xorshift(%1) : (i16) -> i16
    %3 = arith.muli %2, %c25867_i16 : i16
    return %3 : i16
  }
  func.func @emulate_addi(%arg0: i16, %arg1: i16) -> i16 {
    %0 = arith.addi %arg0, %arg1 : i16
    return %0 : i16
  }
  func.func @check_addi(%arg0: i16, %arg1: i16) {
    %0 = arith.addi %arg0, %arg1 : i16
    %1 = call @emulate_addi(%arg0, %arg1) : (i16, i16) -> i16
    call @check_results(%arg0, %arg1, %0, %1) : (i16, i16, i16, i16) -> ()
    return
  }
  func.func @test_addi() {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c500 = arith.constant 500 : index
    %c0_i16 = arith.constant 0 : i16
    %c1_i16 = arith.constant 1 : i16
    %0 = scf.for %arg0 = %c0 to %c500 step %c1 iter_args(%arg1 = %c0_i16) -> (i16) {
      %1 = func.call @xhash(%arg1) : (i16) -> i16
      %2 = scf.for %arg2 = %c0 to %c500 step %c1 iter_args(%arg3 = %c0_i16) -> (i16) {
        %4 = func.call @xhash(%arg3) : (i16) -> i16
        func.call @check_addi(%1, %4) : (i16, i16) -> ()
        %5 = arith.addi %arg3, %c1_i16 : i16
        scf.yield %5 : i16
      }
      %3 = arith.addi %arg1, %c1_i16 : i16
      scf.yield %3 : i16
    }
    return
  }
  func.func @emulate_muli(%arg0: i16, %arg1: i16) -> i16 {
    %0 = arith.muli %arg0, %arg1 : i16
    return %0 : i16
  }
  func.func @check_muli(%arg0: i16, %arg1: i16) {
    %0 = arith.muli %arg0, %arg1 : i16
    %1 = call @emulate_muli(%arg0, %arg1) : (i16, i16) -> i16
    call @check_results(%arg0, %arg1, %0, %1) : (i16, i16, i16, i16) -> ()
    return
  }
  func.func @test_muli() {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c500 = arith.constant 500 : index
    %c0_i16 = arith.constant 0 : i16
    %c1_i16 = arith.constant 1 : i16
    %0 = scf.for %arg0 = %c0 to %c500 step %c1 iter_args(%arg1 = %c0_i16) -> (i16) {
      %1 = func.call @xhash(%arg1) : (i16) -> i16
      %2 = scf.for %arg2 = %c0 to %c500 step %c1 iter_args(%arg3 = %c0_i16) -> (i16) {
        %4 = func.call @xhash(%arg3) : (i16) -> i16
        func.call @check_muli(%1, %4) : (i16, i16) -> ()
        %5 = arith.addi %arg3, %c1_i16 : i16
        scf.yield %5 : i16
      }
      %3 = arith.addi %arg1, %c1_i16 : i16
      scf.yield %3 : i16
    }
    return
  }
  func.func @emulate_shli(%arg0: i16, %arg1: i16) -> i16 {
    %0 = arith.shli %arg0, %arg1 : i16
    return %0 : i16
  }
  func.func @check_shli(%arg0: i16, %arg1: i16) {
    %0 = arith.shli %arg0, %arg1 : i16
    %1 = call @emulate_shli(%arg0, %arg1) : (i16, i16) -> i16
    call @check_results(%arg0, %arg1, %0, %1) : (i16, i16, i16, i16) -> ()
    return
  }
  func.func @test_shli() {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c16 = arith.constant 16 : index
    %c100 = arith.constant 100 : index
    %c0_i16 = arith.constant 0 : i16
    %c1_i16 = arith.constant 1 : i16
    %0 = scf.for %arg0 = %c0 to %c100 step %c1 iter_args(%arg1 = %c0_i16) -> (i16) {
      %1 = func.call @xhash(%arg1) : (i16) -> i16
      %2 = scf.for %arg2 = %c0 to %c16 step %c1 iter_args(%arg3 = %c0_i16) -> (i16) {
        func.call @check_shli(%1, %arg3) : (i16, i16) -> ()
        %4 = arith.addi %arg3, %c1_i16 : i16
        scf.yield %4 : i16
      }
      %3 = arith.addi %arg1, %c1_i16 : i16
      scf.yield %3 : i16
    }
    return
  }
  func.func @emulate_shrsi(%arg0: i16, %arg1: i16) -> i16 {
    %0 = arith.shrsi %arg0, %arg1 : i16
    return %0 : i16
  }
  func.func @check_shrsi(%arg0: i16, %arg1: i16) {
    %0 = arith.shrsi %arg0, %arg1 : i16
    %1 = call @emulate_shrsi(%arg0, %arg1) : (i16, i16) -> i16
    call @check_results(%arg0, %arg1, %0, %1) : (i16, i16, i16, i16) -> ()
    return
  }
  func.func @test_shrsi() {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c16 = arith.constant 16 : index
    %c100 = arith.constant 100 : index
    %c0_i16 = arith.constant 0 : i16
    %c1_i16 = arith.constant 1 : i16
    %0 = scf.for %arg0 = %c0 to %c100 step %c1 iter_args(%arg1 = %c0_i16) -> (i16) {
      %1 = func.call @xhash(%arg1) : (i16) -> i16
      %2 = scf.for %arg2 = %c0 to %c16 step %c1 iter_args(%arg3 = %c0_i16) -> (i16) {
        func.call @check_shrsi(%1, %arg3) : (i16, i16) -> ()
        %4 = arith.addi %arg3, %c1_i16 : i16
        scf.yield %4 : i16
      }
      %3 = arith.addi %arg1, %c1_i16 : i16
      scf.yield %3 : i16
    }
    return
  }
  func.func @emulate_shrui(%arg0: i16, %arg1: i16) -> i16 {
    %0 = arith.shrui %arg0, %arg1 : i16
    return %0 : i16
  }
  func.func @check_shrui(%arg0: i16, %arg1: i16) {
    %0 = arith.shrui %arg0, %arg1 : i16
    %1 = call @emulate_shrui(%arg0, %arg1) : (i16, i16) -> i16
    call @check_results(%arg0, %arg1, %0, %1) : (i16, i16, i16, i16) -> ()
    return
  }
  func.func @test_shrui() {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c16 = arith.constant 16 : index
    %c100 = arith.constant 100 : index
    %c0_i16 = arith.constant 0 : i16
    %c1_i16 = arith.constant 1 : i16
    %0 = scf.for %arg0 = %c0 to %c100 step %c1 iter_args(%arg1 = %c0_i16) -> (i16) {
      %1 = func.call @xhash(%arg1) : (i16) -> i16
      %2 = scf.for %arg2 = %c0 to %c16 step %c1 iter_args(%arg3 = %c0_i16) -> (i16) {
        func.call @check_shrui(%1, %arg3) : (i16, i16) -> ()
        %4 = arith.addi %arg3, %c1_i16 : i16
        scf.yield %4 : i16
      }
      %3 = arith.addi %arg1, %c1_i16 : i16
      scf.yield %3 : i16
    }
    return
  }
  func.func @entry() {
    call @test_addi() : () -> ()
    call @test_muli() : () -> ()
    call @test_shli() : () -> ()
    call @test_shrsi() : () -> ()
    call @test_shrui() : () -> ()
    return
  }
}

