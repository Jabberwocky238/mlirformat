"builtin.module"() ({
^bb0:
}) : () -> ()

// -----
// -----
// -----
// -----
// -----
// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "valid_all_properties"}> ({
    "test.with_properties"() <{a = 32 : i64, array = array<i64: 1, 2, 3, 4>, array32 = array<i32: 5, 6>, b = "foo", c = "bar", flag = true}> : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

