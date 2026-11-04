module {
  func.func @emulate_uitofp(%arg0: i32) -> f32 {
    %0 = arith.uitofp %arg0 : i32 to f32
    return %0 : f32
  }
  func.func @check_uitofp(%arg0: i32) {
    %0 = call @emulate_uitofp(%arg0) : (i32) -> f32
    vector.print %0 : f32
    return
  }
  func.func @entry() {
    %c0_i32 = arith.constant 0 : i32
    %c1_i32 = arith.constant 1 : i32
    %c2_i32 = arith.constant 2 : i32
    %c7_i32 = arith.constant 7 : i32
    %c1337_i32 = arith.constant 1337 : i32
    %c65535_i32 = arith.constant 65535 : i32
    %c65536_i32 = arith.constant 65536 : i32
    %c-1_i32 = arith.constant -1 : i32
    %c-13_i32 = arith.constant -13 : i32
    %c-1337_i32 = arith.constant -1337 : i32
    %c-32768_i32 = arith.constant -32768 : i32
    %c16777217_i32 = arith.constant 16777217 : i32
    %c-16777217_i32 = arith.constant -16777217 : i32
    call @check_uitofp(%c0_i32) : (i32) -> ()
    call @check_uitofp(%c1_i32) : (i32) -> ()
    call @check_uitofp(%c2_i32) : (i32) -> ()
    call @check_uitofp(%c7_i32) : (i32) -> ()
    call @check_uitofp(%c1337_i32) : (i32) -> ()
    call @check_uitofp(%c65535_i32) : (i32) -> ()
    call @check_uitofp(%c65536_i32) : (i32) -> ()
    call @check_uitofp(%c-1_i32) : (i32) -> ()
    call @check_uitofp(%c-1337_i32) : (i32) -> ()
    call @check_uitofp(%c-32768_i32) : (i32) -> ()
    call @check_uitofp(%c-32768_i32) : (i32) -> ()
    call @check_uitofp(%c16777217_i32) : (i32) -> ()
    call @check_uitofp(%c-16777217_i32) : (i32) -> ()
    return
  }
}

