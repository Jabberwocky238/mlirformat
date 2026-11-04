module {
  func.func @emulate_subi(%arg0: i32, %arg1: i32) -> i32 {
    %0 = arith.subi %arg0, %arg1 : i32
    return %0 : i32
  }
  func.func @check_subi(%arg0: i32, %arg1: i32) {
    %0 = call @emulate_subi(%arg0, %arg1) : (i32, i32) -> i32
    vector.print %0 : i32
    return
  }
  func.func @entry() {
    %c1_i32 = arith.constant 1 : i32
    %c2_i32 = arith.constant 2 : i32
    call @check_subi(%c1_i32, %c2_i32) : (i32, i32) -> ()
    call @check_subi(%c2_i32, %c1_i32) : (i32, i32) -> ()
    %c1_i32_0 = arith.constant 1 : i32
    %c-2_i32 = arith.constant -2 : i32
    call @check_subi(%c1_i32_0, %c-2_i32) : (i32, i32) -> ()
    call @check_subi(%c-2_i32, %c1_i32_0) : (i32, i32) -> ()
    %c-1_i32 = arith.constant -1 : i32
    %c-2_i32_1 = arith.constant -2 : i32
    call @check_subi(%c-1_i32, %c-2_i32_1) : (i32, i32) -> ()
    call @check_subi(%c-2_i32_1, %c-1_i32) : (i32, i32) -> ()
    %c131074_i32 = arith.constant 131074 : i32
    %c3_i32 = arith.constant 3 : i32
    call @check_subi(%c131074_i32, %c3_i32) : (i32, i32) -> ()
    call @check_subi(%c3_i32, %c131074_i32) : (i32, i32) -> ()
    %c16385027_i32 = arith.constant 16385027 : i32
    %c16450564_i32 = arith.constant 16450564 : i32
    call @check_subi(%c16385027_i32, %c16450564_i32) : (i32, i32) -> ()
    call @check_subi(%c16450564_i32, %c16385027_i32) : (i32, i32) -> ()
    %c65536_i32 = arith.constant 65536 : i32
    %c1_i32_2 = arith.constant 1 : i32
    call @check_subi(%c65536_i32, %c1_i32_2) : (i32, i32) -> ()
    call @check_subi(%c1_i32_2, %c65536_i32) : (i32, i32) -> ()
    %c2147483647_i32 = arith.constant 2147483647 : i32
    %c-2147483648_i32 = arith.constant -2147483648 : i32
    %c-1_i32_3 = arith.constant -1 : i32
    %c0_i32 = arith.constant 0 : i32
    %c1_i32_4 = arith.constant 1 : i32
    call @check_subi(%c2147483647_i32, %c-2147483648_i32) : (i32, i32) -> ()
    call @check_subi(%c-2147483648_i32, %c2147483647_i32) : (i32, i32) -> ()
    call @check_subi(%c-2147483648_i32, %c1_i32_4) : (i32, i32) -> ()
    call @check_subi(%c2147483647_i32, %c-1_i32_3) : (i32, i32) -> ()
    call @check_subi(%c-1_i32_3, %c1_i32_4) : (i32, i32) -> ()
    call @check_subi(%c-1_i32_3, %c-1_i32_3) : (i32, i32) -> ()
    call @check_subi(%c0_i32, %c1_i32_4) : (i32, i32) -> ()
    call @check_subi(%c0_i32, %c-1_i32_3) : (i32, i32) -> ()
    return
  }
}

