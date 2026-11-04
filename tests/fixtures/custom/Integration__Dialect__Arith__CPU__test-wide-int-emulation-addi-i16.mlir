module {
  func.func @emulate_addi(%arg0: i16, %arg1: i16) -> i16 {
    %0 = arith.addi %arg0, %arg1 : i16
    return %0 : i16
  }
  func.func @check_addi(%arg0: i16, %arg1: i16) {
    %0 = call @emulate_addi(%arg0, %arg1) : (i16, i16) -> i16
    vector.print %0 : i16
    return
  }
  func.func @entry() {
    %c0_i16 = arith.constant 0 : i16
    %c1_i16 = arith.constant 1 : i16
    %c-1_i16 = arith.constant -1 : i16
    %c-3_i16 = arith.constant -3 : i16
    %c13_i16 = arith.constant 13 : i16
    %c37_i16 = arith.constant 37 : i16
    %c42_i16 = arith.constant 42 : i16
    %c256_i16 = arith.constant 256 : i16
    %c32767_i16 = arith.constant 32767 : i16
    %c-32768_i16 = arith.constant -32768 : i16
    call @check_addi(%c0_i16, %c0_i16) : (i16, i16) -> ()
    call @check_addi(%c0_i16, %c1_i16) : (i16, i16) -> ()
    call @check_addi(%c1_i16, %c1_i16) : (i16, i16) -> ()
    call @check_addi(%c1_i16, %c-1_i16) : (i16, i16) -> ()
    call @check_addi(%c-1_i16, %c-1_i16) : (i16, i16) -> ()
    call @check_addi(%c1_i16, %c-3_i16) : (i16, i16) -> ()
    call @check_addi(%c13_i16, %c13_i16) : (i16, i16) -> ()
    call @check_addi(%c13_i16, %c37_i16) : (i16, i16) -> ()
    call @check_addi(%c37_i16, %c42_i16) : (i16, i16) -> ()
    call @check_addi(%c-1_i16, %c256_i16) : (i16, i16) -> ()
    call @check_addi(%c256_i16, %c13_i16) : (i16, i16) -> ()
    call @check_addi(%c256_i16, %c37_i16) : (i16, i16) -> ()
    call @check_addi(%c256_i16, %c-3_i16) : (i16, i16) -> ()
    call @check_addi(%c13_i16, %c32767_i16) : (i16, i16) -> ()
    call @check_addi(%c-32768_i16, %c37_i16) : (i16, i16) -> ()
    call @check_addi(%c32767_i16, %c32767_i16) : (i16, i16) -> ()
    call @check_addi(%c-32768_i16, %c13_i16) : (i16, i16) -> ()
    call @check_addi(%c-32768_i16, %c-32768_i16) : (i16, i16) -> ()
    return
  }
}

