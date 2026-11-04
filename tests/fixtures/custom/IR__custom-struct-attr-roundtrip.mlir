module {
  func.func @test_struct_attr_roundtrip() {
    "test.op"() {attr = #test.custom_struct<type_str = "struct", value = 2, opt_value = [3, 3]>} : () -> ()
    "test.op"() {attr = #test.custom_struct<type_str = "struct", value = ?, opt_value = 1>} : () -> ()
    "test.op"() {attr = #test.custom_struct<type_str = "struct", value = 2, opt_value = [3, 3]>} : () -> ()
    "test.op"() {attr = #test.custom_struct<type_str = "struct", value = 2>} : () -> ()
    "test.op"() {attr = #test.custom_struct<type_str = "struct", value = 2>} : () -> ()
    return
  }
}

// -----
// -----
// -----
// -----
// -----
// -----
// -----
