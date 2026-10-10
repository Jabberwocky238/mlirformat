module {
  func.func @inplace_update() {
    "test.any_attr_of_i32_str"() <{attr = 0 : i32}> : () -> ()
    "test.any_attr_of_i32_str"() <{attr = 1 : i32}> : () -> ()
    return
  }
  func.func @add_no_fold() -> i32 {
    %c0_i32 = arith.constant 0 : i32
    %c1_i32 = arith.constant 1 : i32
    %0 = arith.addi %c0_i32, %c1_i32 : i32
    return %0 : i32
  }
  func.func @move_before(%arg0: i1) {
    scf.if %arg0 {
      "test.move_before_parent_op"() ({
        "test.any_attr_of_i32_str"() <{attr = 0 : i32}> : () -> ()
      }) : () -> ()
    }
    return
  }
  func.func @move_after(%arg0: i1) {
    scf.if %arg0 {
      "test.move_after_parent_op"() ({
        "test.any_attr_of_i32_str"() <{attr = 0 : i32}> : () -> ()
      }) : () -> ()
    }
    return
  }
  func.func @move_forward_and_revisit(%arg0: i1) {
    scf.if %arg0 {
      "test.move_after_parent_op"() ({
        "test.any_attr_of_i32_str"() <{attr = 0 : i32}> : () -> ()
      }) {advance = 1 : i32} : () -> ()
    }
    %0 = arith.addi %arg0, %arg0 : i1
    %1 = arith.addi %0, %arg0 : i1
    return
  }
  func.func @insert_just_after(%arg0: i1) {
    "test.clone_me"() ({
      "test.any_attr_of_i32_str"() <{attr = 0 : i32}> : () -> ()
    }) : () -> ()
    return
  }
  func.func @replace_with_new_op() -> i32 {
    %0 = "test.replace_with_new_op"() : () -> i32
    %1 = arith.addi %0, %0 : i32
    return %1 : i32
  }
  func.func @erase_nested_block() -> i32 {
    %0 = "test.erase_first_block"() ({
      "foo.foo"() : () -> ()
    ^bb1:  // no predecessors
      "foo.bar"() : () -> ()
    }) : () -> i32
    return %0 : i32
  }
  func.func @unreachable_replace_with_new_op() {
    "test.br"()[^bb1] : () -> ()
  ^bb1:  // pred: ^bb0
    %0 = "test.replace_with_new_op"() : () -> i32
    "test.br"()[^bb3] : () -> ()
  ^bb2:  // no predecessors
    %1 = "test.replace_with_new_op"() {test.unreachable} : () -> i32
    return
  ^bb3:  // pred: ^bb1
    %2 = "test.replace_with_new_op"() : () -> i32
    return
  }
}

