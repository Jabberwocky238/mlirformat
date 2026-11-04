"builtin.module"() ({
  "func.func"() <{function_type = (!test.smpla) -> (), sym_name = "simpleA"}> ({
  ^bb0(%arg8: !test.smpla):
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (!test.cmpnd_a<1, !test.smpla, [5, 6]>) -> (), sym_name = "compoundA"}> ({
  ^bb0(%arg7: !test.cmpnd_a<1, !test.smpla, [5, 6]>):
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (!test.cmpnd_nested_outer<i <42 <1, !test.smpla, [5, 6]>>>) -> (), sym_name = "compoundNested"}> ({
  ^bb0(%arg6: !test.cmpnd_nested_outer<i <42 <1, !test.smpla, [5, 6]>>>):
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (!test.cmpnd_nested_outer<i <42 <1, !test.smpla, [5, 6]>>>) -> (), sym_name = "compoundNestedExplicit"}> ({
  ^bb0(%arg5: !test.cmpnd_nested_outer<i <42 <1, !test.smpla, [5, 6]>>>):
    "test.format_cpmd_nested_type"(%arg5) : (!test.cmpnd_nested_outer<i <42 <1, !test.smpla, [5, 6]>>>) -> ()
    "test.format_cpmd_nested_type"(%arg5) : (!test.cmpnd_nested_outer<i <42 <1, !test.smpla, [5, 6]>>>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (!test.cmpnd_nested_outer_qual<i !test.cmpnd_inner<42 <1, !test.smpla, [5, 6]>>>) -> (), sym_name = "compoundNestedQual", sym_visibility = "private"}> ({
  }) : () -> ()
  "func.func"() <{function_type = (!test.int<signed, 8>, !test.int<unsigned, 2>, !test.int<none, 1>) -> (), sym_name = "testInt"}> ({
  ^bb0(%arg2: !test.int<signed, 8>, %arg3: !test.int<unsigned, 2>, %arg4: !test.int<none, 1>):
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (!test.struct<{field1,!test.smpla}, {field2,!test.int<none, 3>}>) -> (), sym_name = "structTest"}> ({
  ^bb0(%arg1: !test.struct<{field1,!test.smpla}, {field2,!test.int<none, 3>}>):
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (!test.newline_and_indent<
    indented_content
  >) -> (), sym_name = "newlineAndIndent"}> ({
  ^bb0(%arg0: !test.newline_and_indent<
    indented_content
  >):
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

