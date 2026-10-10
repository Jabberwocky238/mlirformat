module {
  func.func @test_enum_attr_roundtrip() {
    "test.op"() {value = #test<enum first>} : () -> ()
    "test.op"() {value = #test<enum second>} : () -> ()
    "test.op"() {value = #test<enum third>} : () -> ()
    return
  }
  func.func @test_op_with_enum() {
    test.op_with_enum  third
    return
  }
  func.func @test_match_op_with_enum() {
    test.op_with_enum  third tag 0 : i32
    test.op_with_enum  first tag 0 : i32
    return
  }
  func.func @test_match_op_with_bit_enum() {
    test.op_with_bit_enum <write> tag 0 : i32
    test.op_with_bit_enum <write, execute> tag 0 : i32
    return
  }
  func.func @test_enum_prop() {
    test.op_with_enum_prop first
    test.op_with_enum_prop first
    test.op_with_enum_prop_attr_form <{value = 0 : i32}>
    test.op_with_enum_prop_attr_form <{value = 1 : i32}>
    test.op_with_enum_prop_attr_form_always <{value = #test<enum first>}>
    test.op_with_enum_prop_attr_form_always <{value = #test<enum second>}>
    return
  }
  func.func @test_bit_enum_prop() {
    test.op_with_bit_enum_prop read : ()
    test.op_with_bit_enum_prop read, write write, execute : ()
    test.op_with_bit_enum_prop read, execute write : ()
    test.op_with_bit_enum_prop read, write, execute : ()
    test.op_with_bit_enum_prop_named bit_enum<read>
    test.op_with_bit_enum_prop_named bit_enum<read, write> bit_enum<write, execute>
    test.op_with_bit_enum_prop_named bit_enum<read, write, execute>
    return
  }
}

