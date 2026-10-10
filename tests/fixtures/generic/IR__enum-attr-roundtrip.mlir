"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "test_enum_attr_roundtrip"}> ({
    "test.op"() {value = #test<enum first>} : () -> ()
    "test.op"() {value = #test<enum second>} : () -> ()
    "test.op"() {value = #test<enum third>} : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "test_op_with_enum"}> ({
    "test.op_with_enum"() <{value = #test<enum third>}> : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "test_match_op_with_enum"}> ({
    "test.op_with_enum"() <{tag = 0 : i32, value = #test<enum third>}> : () -> ()
    "test.op_with_enum"() <{tag = 0 : i32, value = #test<enum first>}> : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "test_match_op_with_bit_enum"}> ({
    "test.op_with_bit_enum"() <{tag = 0 : i32, value = #test.bit_enum<write>}> : () -> ()
    "test.op_with_bit_enum"() <{tag = 0 : i32, value = #test.bit_enum<write, execute>}> : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "test_enum_prop"}> ({
    "test.op_with_enum_prop"() <{value = 0 : i32}> : () -> ()
    "test.op_with_enum_prop"() <{value = 0 : i32}> : () -> ()
    "test.op_with_enum_prop_attr_form"() <{value = 0 : i32}> : () -> ()
    "test.op_with_enum_prop_attr_form"() <{value = 1 : i32}> : () -> ()
    "test.op_with_enum_prop_attr_form_always"() <{value = #test<enum first>}> : () -> ()
    "test.op_with_enum_prop_attr_form_always"() <{value = #test<enum second>}> : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "test_bit_enum_prop"}> ({
    "test.op_with_bit_enum_prop"() <{value1 = 1 : i32, value2 = 1 : i32}> : () -> ()
    "test.op_with_bit_enum_prop"() <{value1 = 3 : i32, value2 = 6 : i32}> : () -> ()
    "test.op_with_bit_enum_prop"() <{value1 = 5 : i32, value2 = 2 : i32}> : () -> ()
    "test.op_with_bit_enum_prop"() <{value1 = 7 : i32, value2 = 1 : i32}> : () -> ()
    "test.op_with_bit_enum_prop_named"() <{value1 = 1 : i32, value2 = 1 : i32}> : () -> ()
    "test.op_with_bit_enum_prop_named"() <{value1 = 3 : i32, value2 = 6 : i32}> : () -> ()
    "test.op_with_bit_enum_prop_named"() <{value1 = 7 : i32, value2 = 1 : i32}> : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

