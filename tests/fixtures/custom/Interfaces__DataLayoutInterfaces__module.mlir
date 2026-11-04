module attributes {dlti.dl_spec = #dlti.dl_spec<!test.test_type_with_layout<10> = ["size", 12], !test.test_type_with_layout<20> = ["alignment", 32], !test.test_type_with_layout<30> = ["index", 7]>} {
  func.func @module_level_layout() {
    %0 = "test.data_layout_query"() : () -> !test.test_type_with_layout<10>
    return
  }
}

