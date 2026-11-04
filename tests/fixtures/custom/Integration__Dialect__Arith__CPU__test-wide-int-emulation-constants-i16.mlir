module {
  func.func @entry() {
    %c0_i16 = arith.constant 0 : i16
    call @emulate_constant(%c0_i16) : (i16) -> ()
    call @foo(%c0_i16) : (i16) -> ()
    return
  }
  func.func @emulate_constant(%arg0: i16) {
    vector.print %arg0 : i16
    %c0_i16 = arith.constant 0 : i16
    %c1_i16 = arith.constant 1 : i16
    %c-1_i16 = arith.constant -1 : i16
    %c-3_i16 = arith.constant -3 : i16
    %c13_i16 = arith.constant 13 : i16
    %c256_i16 = arith.constant 256 : i16
    %c32767_i16 = arith.constant 32767 : i16
    %c-32768_i16 = arith.constant -32768 : i16
    vector.print %c0_i16 : i16
    vector.print %c1_i16 : i16
    vector.print %c-1_i16 : i16
    vector.print %c-3_i16 : i16
    vector.print %c13_i16 : i16
    vector.print %c256_i16 : i16
    vector.print %c32767_i16 : i16
    vector.print %c-32768_i16 : i16
    return
  }
  func.func @foo(%arg0: i16) {
    vector.print %arg0 : i16
    %c1_i16 = arith.constant 1 : i16
    vector.print %c1_i16 : i16
    return
  }
}

