"builtin.module"() ({
  "func.func"() <{function_type = (i16) -> (), sym_name = "remap_input_1_to_0", sym_visibility = "private"}> ({
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (f32) -> f32, sym_name = "remap_input_1_to_N"}> ({
  ^bb0(%arg0: f32):
    "test.return"(%arg0) : (f32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "replace_block_arg_1_to_n"}> ({
    "test.legal_op"() ({
    ^bb0(%arg0: i32, %arg1: i16):
      "test.value_replace"(%arg0, %arg1) : (i32, i16) -> ()
      "test.return"(%arg0) : (i32) -> ()
    }) : () -> ()
    "test.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> i32, sym_name = "replace_op_result_1_to_n"}> ({
    %0 = "test.legal_op"() : () -> i32
    %1 = "test.legal_op"() : () -> i16
    "test.value_replace"(%0, %1) : (i32, i16) -> ()
    "test.return"(%0) : (i32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (i64) -> (i64, i32, i32, f32), sym_name = "callee_multi_result", sym_visibility = "private"}> ({
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (i64) -> (), sym_name = "use_of_replaced_bbarg"}> ({
  ^bb0(%arg0: i64):
    %0 = "test.op_with_region_fold"(%arg0) ({
      "foo.op_with_region_terminator"() : () -> ()
    }) : (i64) -> i64
    "test.invalid"(%0) : (i64) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> i32, sym_name = "fold_legalization"}> ({
    %0 = "test.op_in_place_self_fold"() : () -> i32
    "test.return"(%0) : (i32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "convert_detached_signature"}> ({
    "test.detached_signature_conversion"() ({
    ^bb0(%arg0: i64):
      "test.return"() : () -> ()
    }) : () -> ()
    "test.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "circular_mapping"}> ({
    %0 = "test.erase_op"() ({
      "test.dummy_op_lvl_1"() ({
        "test.dummy_op_lvl_2"() : () -> ()
      }) : () -> ()
    }) : () -> i64
    "test.drop_operands_and_replace_with_valid"(%0) : (i64) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "test_duplicate_block_arg"}> ({
    "test.convert_block_args"() <{duplicate}> ({
    ^bb0(%arg0: i64):
      "test.repetitive_1_to_n_consumer"(%arg0) : (i64) -> ()
    }) : () -> ()
    "test.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "test_remap_block_arg"}> ({
    %0 = "test.legal_op"() : () -> i32
    "test.convert_block_args"(%0) <{replace_with_operand}> ({
    ^bb0(%arg0: i32):
      "test.repetitive_1_to_n_consumer"(%arg0) : (i32) -> ()
    }) : (i32) -> ()
    "test.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "test_multiple_1_to_n_replacement"}> ({
    %0 = "test.multiple_1_to_n_replacement"() : () -> f16
    "test.invalid"(%0) : (f16) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (f16) -> (), sym_name = "test_working_1to1_pattern"}> ({
  ^bb0(%arg0: f16):
    "test.type_consumer"(%arg0) : (f16) -> ()
    "test.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

