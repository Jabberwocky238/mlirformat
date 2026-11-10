module {
  func.func @multi_level_mapping() {
    %0 = "test.type_producer"() : () -> i32
    "test.type_consumer"(%0) : (i32) -> ()
    "test.return"() : () -> ()
  }
}

// -----
module {
  func.func @dropped_region_with_illegal_ops() {
    "test.drop_region_op"() ({
      %0 = "test.illegal_op_f"() : () -> i32
      "test.return"() : () -> ()
    }) : () -> ()
    "test.return"() : () -> ()
  }
}

// -----
module {
  func.func @replace_non_root_illegal_op() {
    %0 = "test.replace_non_root"() : () -> i32
    "test.return"() : () -> ()
  }
}

// -----
module {
  func.func @recursively_legal_invalid_op() {
    builtin.module attributes {test.recursively_legal} {
      %0 = "test.illegal_op_f"() : () -> i32
    }
    builtin.module {
      func.func @dynamic_func(%arg0: i64) attributes {test.recursively_legal} {
        %0 = "test.illegal_op_f"() : () -> i32
        "test.return"() : () -> ()
      }
    }
    "test.return"() : () -> ()
  }
}

