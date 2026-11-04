"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "test_enum_attr_roundtrip"}> ({
    "test.op"() {attr = #test.custom_float<"float" : 2.000000e+00>} : () -> ()
    "test.op"() {attr = #test.custom_float<"double" : 2.000000e+00>} : () -> ()
    "test.op"() {attr = #test.custom_float<"fp80" : 2.000000e+00>} : () -> ()
    "test.op"() {attr = #test.custom_float<"float" : 0x7FC00000>} : () -> ()
    "test.op"() {attr = #test.custom_float<"double" : 0x7FF0000001000000>} : () -> ()
    "test.op"() {attr = #test.custom_float<"fp80" : 0x7FFFC000000000100000>} : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
// -----
// -----
// -----
// -----
