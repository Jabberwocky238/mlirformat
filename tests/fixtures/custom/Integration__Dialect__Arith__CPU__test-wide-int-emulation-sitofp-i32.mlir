module {
  func.func @emulate_sitofp(%arg0: i32) -> f32 {
    %0 = arith.sitofp %arg0 : i32 to f32
    return %0 : f32
  }
  func.func @check_sitofp(%arg0: i32) {
    %0 = call @emulate_sitofp(%arg0) : (i32) -> f32
    vector.print %0 : f32
    return
  }
  func.func @entry() {
    %c0_i32 = arith.constant 0 : i32
    %c1_i32 = arith.constant 1 : i32
    %c2_i32 = arith.constant 2 : i32
    %c7_i32 = arith.constant 7 : i32
    %c1337_i32 = arith.constant 1337 : i32
    %c-1_i32 = arith.constant -1 : i32
    %c-13_i32 = arith.constant -13 : i32
    %c-1337_i32 = arith.constant -1337 : i32
    %c-32768_i32 = arith.constant -32768 : i32
    %c16777217_i32 = arith.constant 16777217 : i32
    %c-16777217_i32 = arith.constant -16777217 : i32
    call @check_sitofp(%c0_i32) : (i32) -> ()
    call @check_sitofp(%c1_i32) : (i32) -> ()
    call @check_sitofp(%c2_i32) : (i32) -> ()
    call @check_sitofp(%c7_i32) : (i32) -> ()
    call @check_sitofp(%c1337_i32) : (i32) -> ()
    call @check_sitofp(%c-1_i32) : (i32) -> ()
    call @check_sitofp(%c-1337_i32) : (i32) -> ()
    call @check_sitofp(%c-32768_i32) : (i32) -> ()
    call @check_sitofp(%c16777217_i32) : (i32) -> ()
    call @check_sitofp(%c-16777217_i32) : (i32) -> ()
    return
  }
}

