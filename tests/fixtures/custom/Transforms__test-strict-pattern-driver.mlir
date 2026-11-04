module {
  func.func @test_erase() {
    %0 = "test.arg0"() : () -> i32
    %1 = "test.arg1"() : () -> i32
    %2 = "test.erase_op"(%0, %1) : (i32, i32) -> i32
    return
  }
}

// -----
module {
  func.func @test_insert_same_op() {
    %0 = "test.insert_same_op"() : () -> i32
    return
  }
}

// -----
module {
  func.func @test_replace_with_new_op() {
    %0 = "test.replace_with_new_op"() : () -> i32
    %1 = "test.dummy_user"(%0) : (i32) -> i32
    %2 = "test.dummy_user"(%0) : (i32) -> i32
    return
  }
}

// -----
module {
  func.func @test_replace_with_erase_op() {
    "test.replace_with_new_op"() {create_erase_op} : () -> ()
    return
  }
}

// -----
module {
  func.func @test_trigger_rewrite_through_block() {
    return
  ^bb1:  // 2 preds: ^bb1, ^bb3
    "test.change_block_op"()[^bb1, ^bb2] : () -> ()
  ^bb2:  // pred: ^bb1
    return
  ^bb3:  // no predecessors
    "test.implicit_change_op"()[^bb1] : () -> ()
  }
}

// -----
module {
  func.func @test_remove_graph_region() {
    "test.erase_op"() ({
      test.graph_region {
        %0 = "test.foo_a"(%1) : (i1) -> i1
        %1 = "test.foo_b"(%0) : (i1) -> i1
      }
    }) : () -> ()
    return
  }
}

// -----
module {
  func.func @test_remove_cyclic_blocks() {
    "test.erase_op"() ({
      %0 = "test.dummy_op"() : () -> i1
      cf.br ^bb1(%0 : i1)
    ^bb1(%1: i1):  // 2 preds: ^bb0, ^bb2
      "test.foo"(%0) : (i1) -> ()
      cf.br ^bb2(%1 : i1)
    ^bb2(%2: i1):  // pred: ^bb1
      "test.bar"(%0) : (i1) -> ()
      cf.br ^bb1(%2 : i1)
    }) : () -> ()
    return
  }
}

// -----
module {
  func.func @test_remove_dead_blocks() {
    "test.erase_op"() ({
      %0 = "test.dummy_op"() : () -> i1
    ^bb1(%1: i1):  // no predecessors
      "test.foo"() : () -> ()
      cf.br ^bb2(%1 : i1)
    ^bb2(%2: i1):  // pred: ^bb1
      "test.nested_dummy"() ({
        "test.qux"() : () -> ()
      ^bb1:  // no predecessors
        "test.qux_unreachable"() : () -> ()
      }) : () -> ()
      "test.bar"() : () -> ()
    }) : () -> ()
    return
  }
}

// -----
module {
  func.func @test_remove_nested_ops() {
    "test.erase_op"() ({
      %0 = "test.dummy_op"() : () -> i1
      cf.br ^bb1(%0 : i1)
    ^bb1(%1: i1):  // 2 preds: ^bb0, ^bb2
      "test.foo"() ({
        "test.nested_a"() : () -> ()
        "test.nested_b"() : () -> ()
      ^bb1:  // no predecessors
        "test.nested_c"() : () -> ()
        cf.br ^bb3
      ^bb2:  // pred: ^bb3
        "test.nested_d"() : () -> ()
      ^bb3:  // pred: ^bb1
        "test.nested_e"() : () -> ()
        cf.br ^bb2
      }) : () -> ()
      cf.br ^bb2(%1 : i1)
    ^bb2(%2: i1):  // pred: ^bb1
      "test.bar"(%0) : (i1) -> ()
      cf.br ^bb1(%2 : i1)
    }) : () -> ()
    return
  }
}

// -----
module {
  func.func @test_remove_diamond(%arg0: i1) {
    "test.erase_op"() ({
      cf.cond_br %arg0, ^bb1, ^bb2
    ^bb1:  // pred: ^bb0
      "test.foo"() : () -> ()
      cf.br ^bb3
    ^bb2:  // pred: ^bb0
      "test.bar"() : () -> ()
      cf.br ^bb3
    ^bb3:  // 2 preds: ^bb1, ^bb2
      "test.qux"() : () -> ()
    }) : () -> ()
    return
  }
}

// -----
module {
  func.func @test_move_op_before() {
    "test.op_with_region"() ({
      "test.move_before_parent_op"() : () -> ()
      "test.dummy_terminator"() : () -> ()
    }) : () -> ()
    return
  }
}

// -----
module {
  func.func @test_inline_block_before() {
    "test.inline_blocks_into_parent"() ({
      "test.op_1"() : () -> ()
      "test.op_2"() : () -> ()
      "test.op_3"() : () -> ()
    }) : () -> ()
    return
  }
}

// -----
module {
  func.func @test_split_block() {
    "test.op_with_region"() ({
      "test.op_1"() : () -> ()
      "test.split_block_here"() : () -> ()
      "test.op_2"() : () -> ()
      "test.op_3"() : () -> ()
    }) : () -> ()
    return
  }
}

// -----
module {
  func.func @clone_op() {
    "test.clone_me"() ({
      "test.foo"() : () -> ()
    ^bb1:  // no predecessors
      "test.bar"() : () -> ()
    }) : () -> ()
    return
  }
}

// -----
module {
  func.func @test_clone_region_before() {
    "test.clone_region_before"() ({
      "test.op_1"() : () -> ()
    ^bb1:  // no predecessors
      "test.op_2"() ({
        "test.op_3"() : () -> ()
      }) : () -> ()
      "test.op_4"() : () -> ()
    }) : () -> ()
    return
  }
}

