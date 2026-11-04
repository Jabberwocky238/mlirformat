module {
  func.func @default_insertion_position(%arg0: i1) {
    scf.if %arg0 {
      %c1_i32 = arith.constant 1 : i32
      %0 = arith.addi %c1_i32, %c1_i32 : i32
      "foo.yield"(%0) : (i32) -> ()
    }
    return
  }
  func.func @custom_insertion_position() {
    "test.one_region_op"() ({
      %c1_i32 = arith.constant 1 : i32
      %0 = arith.addi %c1_i32, %c1_i32 : i32
      "foo.yield"(%0) : (i32) -> ()
    }) : () -> ()
    return
  }
}

