"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "multi_level_mapping"}> ({
    %0 = "test.type_producer"() : () -> i32
    "test.type_consumer"(%0) : (i32) -> ()
    "test.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "dropped_region_with_illegal_ops"}> ({
    "test.drop_region_op"() ({
      %0 = "test.illegal_op_f"() : () -> i32
      "test.return"() : () -> ()
    }) : () -> ()
    "test.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "replace_non_root_illegal_op"}> ({
    %0 = "test.replace_non_root"() : () -> i32
    "test.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "recursively_legal_invalid_op"}> ({
    "builtin.module"() ({
      %1 = "test.illegal_op_f"() : () -> i32
    }) {test.recursively_legal} : () -> ()
    "builtin.module"() ({
      "func.func"() <{function_type = (i64) -> (), sym_name = "dynamic_func"}> ({
      ^bb0(%arg0: i64):
        %0 = "test.illegal_op_f"() : () -> i32
        "test.return"() : () -> ()
      }) {test.recursively_legal} : () -> ()
    }) : () -> ()
    "test.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

