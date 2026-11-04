"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "compoundA", sym_visibility = "private"}> ({
  }) {foo = #test.cmpnd_a<1, !test.smpla, [5, 6]>} : () -> ()
  %0 = "test.result_has_same_type_as_attr"() <{attr = #test.attr_with_self_type_param : i32}> : () -> i32
  %1 = "test.result_has_same_type_as_attr"() <{attr = #test<attr_with_type_builder 10 : i16> : i16}> : () -> i16
  "func.func"() <{function_type = () -> (), sym_name = "qualifiedAttr", sym_visibility = "private"}> ({
  }) {foo = #test.cmpnd_nested_outer_qual<i #test.cmpnd_nested_inner<42 <1, !test.smpla, [5, 6]>>>} : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "overriddenAttr", sym_visibility = "private"}> ({
  }) {foo = 5 : index} : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "decimalIntegerShapeEmpty", sym_visibility = "private"}> ({
  }) {foo = #test.decimal_shape<>} : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "decimalIntegerShape", sym_visibility = "private"}> ({
  }) {foo = #test.decimal_shape<5>} : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "decimalIntegerShapeMultiple", sym_visibility = "private"}> ({
  }) {foo = #test.decimal_shape<0x3x7>} : () -> ()
}) : () -> ()

// -----
// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "newlineAndIndent", sym_visibility = "private"}> ({
  }) {indent = #test.newline_and_indent<
    !test.newline_and_indent<
      indented_content
    >
  >} : () -> ()
}) : () -> ()

