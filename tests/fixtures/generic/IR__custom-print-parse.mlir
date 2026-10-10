"builtin.module"() <{sym_name = "dimension_list"}> ({
  "test.custom_dimension_list_attr"() <{dimension_list = array<i64>}> : () -> ()
  "test.custom_dimension_list_attr"() <{dimension_list = array<i64: 3>}> : () -> ()
  "test.custom_dimension_list_attr"() <{dimension_list = array<i64: 0>}> : () -> ()
  "test.custom_dimension_list_attr"() <{dimension_list = array<i64: 1, 2>}> : () -> ()
  "test.custom_dimension_list_attr"() <{dimension_list = array<i64: -9223372036854775808>}> : () -> ()
  "test.custom_dimension_list_attr"() <{dimension_list = array<i64: -9223372036854775808, -9223372036854775808>}> : () -> ()
  "test.optional_custom_attr"() : () -> ()
  "test.optional_custom_attr"() <{attr = false}> : () -> ()
}) : () -> ()

