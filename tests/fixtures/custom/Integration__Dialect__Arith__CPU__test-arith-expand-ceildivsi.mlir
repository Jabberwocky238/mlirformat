module {
  func.func @check_ceildivsi(%arg0: i32, %arg1: i32) {
    %0 = arith.ceildivsi %arg0, %arg1 : i32
    vector.print %0 : i32
    return
  }
  func.func @entry() {
    %c-2147483648_i32 = arith.constant -2147483648 : i32
    %c2147483647_i32 = arith.constant 2147483647 : i32
    %c-3_i32 = arith.constant -3 : i32
    %c-2_i32 = arith.constant -2 : i32
    %c-1_i32 = arith.constant -1 : i32
    %c0_i32 = arith.constant 0 : i32
    %c1_i32 = arith.constant 1 : i32
    %c2_i32 = arith.constant 2 : i32
    %c3_i32 = arith.constant 3 : i32
    call @check_ceildivsi(%c2147483647_i32, %c2147483647_i32) : (i32, i32) -> ()
    call @check_ceildivsi(%c2147483647_i32, %c-2147483648_i32) : (i32, i32) -> ()
    call @check_ceildivsi(%c2147483647_i32, %c-1_i32) : (i32, i32) -> ()
    call @check_ceildivsi(%c2147483647_i32, %c-2_i32) : (i32, i32) -> ()
    call @check_ceildivsi(%c2147483647_i32, %c1_i32) : (i32, i32) -> ()
    call @check_ceildivsi(%c2147483647_i32, %c2_i32) : (i32, i32) -> ()
    call @check_ceildivsi(%c-2147483648_i32, %c-2147483648_i32) : (i32, i32) -> ()
    call @check_ceildivsi(%c-2147483648_i32, %c2147483647_i32) : (i32, i32) -> ()
    call @check_ceildivsi(%c-2147483648_i32, %c-2_i32) : (i32, i32) -> ()
    call @check_ceildivsi(%c-2147483648_i32, %c1_i32) : (i32, i32) -> ()
    call @check_ceildivsi(%c-2147483648_i32, %c2_i32) : (i32, i32) -> ()
    call @check_ceildivsi(%c1_i32, %c-2147483648_i32) : (i32, i32) -> ()
    call @check_ceildivsi(%c2_i32, %c-2147483648_i32) : (i32, i32) -> ()
    call @check_ceildivsi(%c-1_i32, %c-2147483648_i32) : (i32, i32) -> ()
    call @check_ceildivsi(%c-2_i32, %c-2147483648_i32) : (i32, i32) -> ()
    call @check_ceildivsi(%c1_i32, %c2147483647_i32) : (i32, i32) -> ()
    call @check_ceildivsi(%c2_i32, %c2147483647_i32) : (i32, i32) -> ()
    call @check_ceildivsi(%c-1_i32, %c2147483647_i32) : (i32, i32) -> ()
    call @check_ceildivsi(%c-2_i32, %c2147483647_i32) : (i32, i32) -> ()
    call @check_ceildivsi(%c-3_i32, %c2_i32) : (i32, i32) -> ()
    call @check_ceildivsi(%c-2_i32, %c2_i32) : (i32, i32) -> ()
    call @check_ceildivsi(%c-1_i32, %c2_i32) : (i32, i32) -> ()
    call @check_ceildivsi(%c0_i32, %c2_i32) : (i32, i32) -> ()
    call @check_ceildivsi(%c1_i32, %c2_i32) : (i32, i32) -> ()
    call @check_ceildivsi(%c2_i32, %c2_i32) : (i32, i32) -> ()
    call @check_ceildivsi(%c3_i32, %c2_i32) : (i32, i32) -> ()
    call @check_ceildivsi(%c-3_i32, %c-2_i32) : (i32, i32) -> ()
    call @check_ceildivsi(%c-2_i32, %c-2_i32) : (i32, i32) -> ()
    call @check_ceildivsi(%c-1_i32, %c-2_i32) : (i32, i32) -> ()
    call @check_ceildivsi(%c0_i32, %c-2_i32) : (i32, i32) -> ()
    call @check_ceildivsi(%c1_i32, %c-2_i32) : (i32, i32) -> ()
    call @check_ceildivsi(%c2_i32, %c-2_i32) : (i32, i32) -> ()
    call @check_ceildivsi(%c3_i32, %c-2_i32) : (i32, i32) -> ()
    return
  }
}

