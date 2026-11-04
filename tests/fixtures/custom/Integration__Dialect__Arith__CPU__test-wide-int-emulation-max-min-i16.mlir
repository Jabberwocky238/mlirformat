module {
  func.func @emulate_maxui(%arg0: i16, %arg1: i16) -> i16 {
    %0 = arith.maxui %arg0, %arg1 : i16
    return %0 : i16
  }
  func.func @check_maxui(%arg0: i16, %arg1: i16) {
    %0 = call @emulate_maxui(%arg0, %arg1) : (i16, i16) -> i16
    vector.print %0 : i16
    return
  }
  func.func @emulate_maxsi(%arg0: i16, %arg1: i16) -> i16 {
    %0 = arith.maxsi %arg0, %arg1 : i16
    return %0 : i16
  }
  func.func @check_maxsi(%arg0: i16, %arg1: i16) {
    %0 = call @emulate_maxsi(%arg0, %arg1) : (i16, i16) -> i16
    vector.print %0 : i16
    return
  }
  func.func @emulate_minui(%arg0: i16, %arg1: i16) -> i16 {
    %0 = arith.minui %arg0, %arg1 : i16
    return %0 : i16
  }
  func.func @check_minui(%arg0: i16, %arg1: i16) {
    %0 = call @emulate_minui(%arg0, %arg1) : (i16, i16) -> i16
    vector.print %0 : i16
    return
  }
  func.func @emulate_minsi(%arg0: i16, %arg1: i16) -> i16 {
    %0 = arith.minsi %arg0, %arg1 : i16
    return %0 : i16
  }
  func.func @check_minsi(%arg0: i16, %arg1: i16) {
    %0 = call @emulate_minsi(%arg0, %arg1) : (i16, i16) -> i16
    vector.print %0 : i16
    return
  }
  func.func @entry() {
    %c0_i16 = arith.constant 0 : i16
    %c1_i16 = arith.constant 1 : i16
    %c7_i16 = arith.constant 7 : i16
    %c-1_i16 = arith.constant -1 : i16
    %c1337_i16 = arith.constant 1337 : i16
    %c4096_i16 = arith.constant 4096 : i16
    %c-32768_i16 = arith.constant -32768 : i16
    call @check_maxui(%c0_i16, %c0_i16) : (i16, i16) -> ()
    call @check_maxui(%c0_i16, %c1_i16) : (i16, i16) -> ()
    call @check_maxui(%c1_i16, %c0_i16) : (i16, i16) -> ()
    call @check_maxui(%c1_i16, %c1_i16) : (i16, i16) -> ()
    call @check_maxui(%c-1_i16, %c1_i16) : (i16, i16) -> ()
    call @check_maxui(%c1_i16, %c-1_i16) : (i16, i16) -> ()
    call @check_maxui(%c-1_i16, %c1337_i16) : (i16, i16) -> ()
    call @check_maxui(%c1337_i16, %c1337_i16) : (i16, i16) -> ()
    call @check_maxui(%c4096_i16, %c4096_i16) : (i16, i16) -> ()
    call @check_maxui(%c1337_i16, %c-32768_i16) : (i16, i16) -> ()
    call @check_maxsi(%c0_i16, %c0_i16) : (i16, i16) -> ()
    call @check_maxsi(%c0_i16, %c1_i16) : (i16, i16) -> ()
    call @check_maxsi(%c1_i16, %c0_i16) : (i16, i16) -> ()
    call @check_maxsi(%c1_i16, %c1_i16) : (i16, i16) -> ()
    call @check_maxsi(%c-1_i16, %c1_i16) : (i16, i16) -> ()
    call @check_maxsi(%c1_i16, %c-1_i16) : (i16, i16) -> ()
    call @check_maxsi(%c-1_i16, %c1337_i16) : (i16, i16) -> ()
    call @check_maxsi(%c1337_i16, %c1337_i16) : (i16, i16) -> ()
    call @check_maxsi(%c4096_i16, %c4096_i16) : (i16, i16) -> ()
    call @check_maxsi(%c1337_i16, %c-32768_i16) : (i16, i16) -> ()
    call @check_minui(%c0_i16, %c0_i16) : (i16, i16) -> ()
    call @check_minui(%c0_i16, %c1_i16) : (i16, i16) -> ()
    call @check_minui(%c1_i16, %c0_i16) : (i16, i16) -> ()
    call @check_minui(%c1_i16, %c1_i16) : (i16, i16) -> ()
    call @check_minui(%c-1_i16, %c1_i16) : (i16, i16) -> ()
    call @check_minui(%c1_i16, %c-1_i16) : (i16, i16) -> ()
    call @check_minui(%c-1_i16, %c1337_i16) : (i16, i16) -> ()
    call @check_minui(%c1337_i16, %c1337_i16) : (i16, i16) -> ()
    call @check_minui(%c4096_i16, %c4096_i16) : (i16, i16) -> ()
    call @check_minui(%c1337_i16, %c-32768_i16) : (i16, i16) -> ()
    call @check_minsi(%c0_i16, %c0_i16) : (i16, i16) -> ()
    call @check_minsi(%c0_i16, %c1_i16) : (i16, i16) -> ()
    call @check_minsi(%c1_i16, %c0_i16) : (i16, i16) -> ()
    call @check_minsi(%c1_i16, %c1_i16) : (i16, i16) -> ()
    call @check_minsi(%c-1_i16, %c1_i16) : (i16, i16) -> ()
    call @check_minsi(%c1_i16, %c-1_i16) : (i16, i16) -> ()
    call @check_minsi(%c-1_i16, %c1337_i16) : (i16, i16) -> ()
    call @check_minsi(%c1337_i16, %c1337_i16) : (i16, i16) -> ()
    call @check_minsi(%c4096_i16, %c4096_i16) : (i16, i16) -> ()
    call @check_minsi(%c1337_i16, %c-32768_i16) : (i16, i16) -> ()
    return
  }
}

