"builtin.module"() ({
  "func.func"() <{function_type = (!testd.self_referencing<i32>) -> (), sym_name = "no_references"}> ({
  ^bb0(%arg0: !testd.self_referencing<i32>):
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (!testd.self_referencing<!testd.self_referencing<i32>>) -> (), sym_name = "one_reference"}> ({
  ^bb0(%arg0: !testd.self_referencing<!testd.self_referencing<i32>>):
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (!testd.type1<i32>) -> (), sym_name = "type1_no_references"}> ({
  ^bb0(%arg0: !testd.type1<i32>):
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (!testd.type1<!testd.type2<i32>>) -> (), sym_name = "type1_one_references"}> ({
  ^bb0(%arg0: !testd.type1<!testd.type2<i32>>):
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (!testd.type1<!testd.type2<!testd.type1<i32>>>) -> (), sym_name = "type1_two_references"}> ({
  ^bb0(%arg0: !testd.type1<!testd.type2<!testd.type1<i32>>>):
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

