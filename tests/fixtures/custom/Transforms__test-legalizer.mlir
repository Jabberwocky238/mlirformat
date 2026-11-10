module {
  func.func private @remap_input_1_to_0(i16)
}

// -----
module {
  func.func @remap_input_1_to_N(%arg0: f32) -> f32 {
    "test.return"(%arg0) : (f32) -> ()
  }
}

// -----
module {
  func.func @replace_block_arg_1_to_n() {
    "test.legal_op"() ({
    ^bb0(%arg0: i32, %arg1: i16):
      "test.value_replace"(%arg0, %arg1) : (i32, i16) -> ()
      "test.return"(%arg0) : (i32) -> ()
    }) : () -> ()
    "test.return"() : () -> ()
  }
}

// -----
module {
  func.func @replace_op_result_1_to_n() -> i32 {
    %0 = "test.legal_op"() : () -> i32
    %1 = "test.legal_op"() : () -> i16
    "test.value_replace"(%0, %1) : (i32, i16) -> ()
    "test.return"(%0) : (i32) -> ()
  }
}

// -----
module {
  func.func private @callee_multi_result(i64) -> (i64, i32, i32, f32)
}

// -----
module {
  func.func @use_of_replaced_bbarg(%arg0: i64) {
    %0 = "test.op_with_region_fold"(%arg0) ({
      "foo.op_with_region_terminator"() : () -> ()
    }) : (i64) -> i64
    "test.invalid"(%0) : (i64) -> ()
  }
}

// -----
module {
  func.func @fold_legalization() -> i32 {
    %0 = "test.op_in_place_self_fold"() : () -> i32
    "test.return"(%0) : (i32) -> ()
  }
}

// -----
module {
  func.func @convert_detached_signature() {
    "test.detached_signature_conversion"() ({
    ^bb0(%arg0: i64):
      "test.return"() : () -> ()
    }) : () -> ()
    "test.return"() : () -> ()
  }
}

// -----
module {
  func.func @circular_mapping() {
    %0 = "test.erase_op"() ({
      "test.dummy_op_lvl_1"() ({
        "test.dummy_op_lvl_2"() : () -> ()
      }) : () -> ()
    }) : () -> i64
    "test.drop_operands_and_replace_with_valid"(%0) : (i64) -> ()
  }
}

// -----
module {
  func.func @test_duplicate_block_arg() {
    test.convert_block_args  duplicate {
    ^bb0(%arg0: i64):
      "test.repetitive_1_to_n_consumer"(%arg0) : (i64) -> ()
    } : () -> ()
    "test.return"() : () -> ()
  }
}

// -----
module {
  func.func @test_remap_block_arg() {
    %0 = "test.legal_op"() : () -> i32
    test.convert_block_args %0 replace_with_operand {
    ^bb0(%arg0: i32):
      "test.repetitive_1_to_n_consumer"(%arg0) : (i32) -> ()
    } : (i32) -> ()
    "test.return"() : () -> ()
  }
}

// -----
module {
  func.func @test_multiple_1_to_n_replacement() {
    %0 = "test.multiple_1_to_n_replacement"() : () -> f16
    "test.invalid"(%0) : (f16) -> ()
  }
}

// -----
module {
  func.func @test_working_1to1_pattern(%arg0: f16) {
    "test.type_consumer"(%arg0) : (f16) -> ()
    "test.return"() : () -> ()
  }
}

