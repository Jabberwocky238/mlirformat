module {
  func.func @emulate_shrui(%arg0: i16, %arg1: i16) -> i16 {
    %0 = arith.shrui %arg0, %arg1 : i16
    return %0 : i16
  }
  func.func @check_shrui(%arg0: i16, %arg1: i16) {
    %0 = call @emulate_shrui(%arg0, %arg1) : (i16, i16) -> i16
    vector.print %0 : i16
    return
  }
  func.func @entry() {
    %c0_i16 = arith.constant 0 : i16
    %c1_i16 = arith.constant 1 : i16
    %c2_i16 = arith.constant 2 : i16
    %c7_i16 = arith.constant 7 : i16
    %c8_i16 = arith.constant 8 : i16
    %c9_i16 = arith.constant 9 : i16
    %c15_i16 = arith.constant 15 : i16
    %c-1_i16 = arith.constant -1 : i16
    %c1337_i16 = arith.constant 1337 : i16
    %c-1337_i16 = arith.constant -1337 : i16
    %c-32768_i16 = arith.constant -32768 : i16
    call @check_shrui(%c0_i16, %c0_i16) : (i16, i16) -> ()
    call @check_shrui(%c0_i16, %c1_i16) : (i16, i16) -> ()
    call @check_shrui(%c1_i16, %c1_i16) : (i16, i16) -> ()
    call @check_shrui(%c1_i16, %c0_i16) : (i16, i16) -> ()
    call @check_shrui(%c-1_i16, %c1_i16) : (i16, i16) -> ()
    call @check_shrui(%c-1_i16, %c15_i16) : (i16, i16) -> ()
    call @check_shrui(%c1337_i16, %c0_i16) : (i16, i16) -> ()
    call @check_shrui(%c1337_i16, %c2_i16) : (i16, i16) -> ()
    call @check_shrui(%c1337_i16, %c7_i16) : (i16, i16) -> ()
    call @check_shrui(%c1337_i16, %c8_i16) : (i16, i16) -> ()
    call @check_shrui(%c1337_i16, %c9_i16) : (i16, i16) -> ()
    call @check_shrui(%c1337_i16, %c15_i16) : (i16, i16) -> ()
    call @check_shrui(%c-1337_i16, %c0_i16) : (i16, i16) -> ()
    call @check_shrui(%c-1337_i16, %c2_i16) : (i16, i16) -> ()
    call @check_shrui(%c-1337_i16, %c7_i16) : (i16, i16) -> ()
    call @check_shrui(%c-1337_i16, %c8_i16) : (i16, i16) -> ()
    call @check_shrui(%c-1337_i16, %c9_i16) : (i16, i16) -> ()
    call @check_shrui(%c-1337_i16, %c15_i16) : (i16, i16) -> ()
    call @check_shrui(%c-32768_i16, %c1_i16) : (i16, i16) -> ()
    call @check_shrui(%c-32768_i16, %c2_i16) : (i16, i16) -> ()
    call @check_shrui(%c-32768_i16, %c7_i16) : (i16, i16) -> ()
    call @check_shrui(%c-32768_i16, %c8_i16) : (i16, i16) -> ()
    call @check_shrui(%c-32768_i16, %c9_i16) : (i16, i16) -> ()
    call @check_shrui(%c-32768_i16, %c15_i16) : (i16, i16) -> ()
    return
  }
}

