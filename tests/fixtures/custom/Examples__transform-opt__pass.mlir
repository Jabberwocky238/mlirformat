module attributes {transform.with_named_sequence} {
  func.func @return_42() -> i32 {
    %c21_i32 = arith.constant 21 : i32
    %c2_i32 = arith.constant 2 : i32
    %0 = arith.muli %c21_i32, %c2_i32 : i32
    return %0 : i32
  }
  transform.named_sequence @__transform_main(%arg0: !transform.any_op) {
    %0 = transform.apply_registered_pass "canonicalize" to %arg0 : (!transform.any_op) -> !transform.any_op
    transform.print %0 : !transform.any_op
    transform.yield 
  }
}

