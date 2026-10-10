module {
  func.func @op_with_custom_printer() {
    %x = test.string_attr_pretty_name
    return
  }
}

// -----
module {
  func.func @op_without_custom_printer() {
    %0 = "test.result_type_with_trait"() : () -> !test.test_type_with_trait
    return
  }
}

