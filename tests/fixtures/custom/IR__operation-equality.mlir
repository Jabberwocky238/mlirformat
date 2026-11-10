module {
  "test.top_level_op"() : () -> ()
  "test.top_level_op"() : () -> ()
}

// -----
module {
  "test.top_level_op_strict_loc"() {strict_loc_check} : () -> ()
  "test.top_level_op_strict_loc"() {strict_loc_check} : () -> ()
}

// -----
module {
  "test.top_level_op_loc_match"() {strict_loc_check} : () -> ()
  "test.top_level_op_loc_match"() {strict_loc_check} : () -> ()
}

// -----
module {
  "test.top_level_op_block_loc_mismatch"() ({
  ^bb0(%arg0: i32):
  }) {strict_loc_check} : () -> ()
  "test.top_level_op_block_loc_mismatch"() ({
  ^bb0(%arg0: i32):
  }) {strict_loc_check} : () -> ()
}

// -----
module {
  "test.top_level_op_block_loc_match"() ({
  ^bb0(%arg0: i32):
  }) {strict_loc_check} : () -> ()
  "test.top_level_op_block_loc_match"() ({
  ^bb0(%arg0: i32):
  }) {strict_loc_check} : () -> ()
}

// -----
module {
  "test.top_level_name_mismatch"() : () -> ()
  "test.top_level_name_mismatch2"() : () -> ()
}

// -----
module {
  "test.top_level_op_attr_mismatch"() {foo = "bar"} : () -> ()
  "test.top_level_op_attr_mismatch"() {foo = "bar2"} : () -> ()
}

// -----
module {
  "test.top_level_op_cfg"() ({
  ^bb0(%arg0: i32, %arg1: f32):
    "test.some_branching_op"(%arg1, %arg0)[^bb1, ^bb2] : (f32, i32) -> ()
  ^bb1(%0: f32):  // pred: ^bb0
    "test.some_branching_op"() : () -> ()
  ^bb2(%1: i32):  // pred: ^bb0
    "test.some_branching_op"() : () -> ()
  }, {
  ^bb0(%arg0: i32, %arg1: f32):
    "test.some_branching_op"(%arg1, %arg0)[^bb1, ^bb2] : (f32, i32) -> ()
  ^bb1(%0: f32):  // pred: ^bb0
    "test.some_branching_op"() : () -> ()
  ^bb2(%1: i32):  // pred: ^bb0
    "test.some_branching_op"() : () -> ()
  }) {attr = "foo"} : () -> ()
  "test.top_level_op_cfg"() ({
  ^bb0(%arg0: i32, %arg1: f32):
    "test.some_branching_op"(%arg1, %arg0)[^bb1, ^bb2] : (f32, i32) -> ()
  ^bb1(%0: f32):  // pred: ^bb0
    "test.some_branching_op"() : () -> ()
  ^bb2(%1: i32):  // pred: ^bb0
    "test.some_branching_op"() : () -> ()
  }, {
  ^bb0(%arg0: i32, %arg1: f32):
    "test.some_branching_op"(%arg1, %arg0)[^bb1, ^bb2] : (f32, i32) -> ()
  ^bb1(%0: f32):  // pred: ^bb0
    "test.some_branching_op"() : () -> ()
  ^bb2(%1: i32):  // pred: ^bb0
    "test.some_branching_op"() : () -> ()
  }) {attr = "foo"} : () -> ()
}

// -----
module {
  "test.operand_num_mismatch"() ({
  ^bb0(%arg0: i32, %arg1: f32):
    "test.some_branching_op"(%arg1, %arg0) : (f32, i32) -> ()
  }) : () -> ()
  "test.operand_num_mismatch"() ({
  ^bb0(%arg0: i32, %arg1: f32):
    "test.some_branching_op"(%arg1) : (f32) -> ()
  }) : () -> ()
}

// -----
module {
  "test.operand_type_mismatch"() ({
  ^bb0(%arg0: i32, %arg1: f32):
    "test.some_branching_op"(%arg1, %arg0) : (f32, i32) -> ()
  }) : () -> ()
  "test.operand_type_mismatch"() ({
  ^bb0(%arg0: i32, %arg1: f32):
    "test.some_branching_op"(%arg1, %arg1) : (f32, f32) -> ()
  }) : () -> ()
}

// -----
module {
  "test.block_type_mismatch"() ({
  ^bb0(%arg0: f32, %arg1: f32):
    "test.some_branching_op"() : () -> ()
  }) : () -> ()
  "test.block_type_mismatch"() ({
  ^bb0(%arg0: i32, %arg1: f32):
    "test.some_branching_op"() : () -> ()
  }) : () -> ()
}

// -----
module {
  "test.block_arg_num_mismatch"() ({
  ^bb0(%arg0: f32, %arg1: f32):
    "test.some_branching_op"() : () -> ()
  }) : () -> ()
  "test.block_arg_num_mismatch"() ({
  ^bb0(%arg0: f32):
    "test.some_branching_op"() : () -> ()
  }) : () -> ()
}

// -----
module {
  "test.dataflow_match"() ({
    %0:2 = "test.producer"() : () -> (i32, i32)
    "test.consumer"(%0#0, %0#1) : (i32, i32) -> ()
  }) : () -> ()
  "test.dataflow_match"() ({
    %0:2 = "test.producer"() : () -> (i32, i32)
    "test.consumer"(%0#0, %0#1) : (i32, i32) -> ()
  }) : () -> ()
}

// -----
module {
  "test.dataflow_mismatch"() ({
    %0:2 = "test.producer"() : () -> (i32, i32)
    "test.consumer"(%0#0, %0#1) : (i32, i32) -> ()
  }) : () -> ()
  "test.dataflow_mismatch"() ({
    %0:2 = "test.producer"() : () -> (i32, i32)
    "test.consumer"(%0#1, %0#0) : (i32, i32) -> ()
  }) : () -> ()
}

// -----
module attributes {test.includes_setup} {
  %0:2 = "test.producer"() : () -> (i32, i32)
  "test.commutatively_equal_permutation"() ({
    %1 = arith.addi %0#0, %0#1 : i32
  }) : () -> ()
  "test.commutatively_equal_permutation"() ({
    %1 = arith.addi %0#1, %0#0 : i32
  }) : () -> ()
}

// -----
module attributes {test.includes_setup} {
  %0:2 = "test.producer"() : () -> (i32, i32)
  "test.ignore_commutatively_equal_permutation"() ({
    %1 = arith.addi %0#0, %0#1 : i32
  }) {ignore_commutativity} : () -> ()
  "test.ignore_commutatively_equal_permutation"() ({
    %1 = arith.addi %0#1, %0#0 : i32
  }) {ignore_commutativity} : () -> ()
}

// -----
module {
  "test.commutatively_equal"() ({
  ^bb0(%arg0: i32, %arg1: i32):
    %0 = arith.addi %arg0, %arg1 : i32
  }) : () -> ()
  "test.commutatively_equal"() ({
  ^bb0(%arg0: i32, %arg1: i32):
    %0 = arith.addi %arg1, %arg0 : i32
  }) : () -> ()
}

// -----
module {
  "test.ignore_commutatively_equal"() ({
  ^bb0(%arg0: i32, %arg1: i32):
    %0 = arith.addi %arg0, %arg1 : i32
  }) {ignore_commutativity} : () -> ()
  "test.ignore_commutatively_equal"() ({
  ^bb0(%arg0: i32, %arg1: i32):
    %0 = arith.addi %arg1, %arg0 : i32
  }) {ignore_commutativity} : () -> ()
}

