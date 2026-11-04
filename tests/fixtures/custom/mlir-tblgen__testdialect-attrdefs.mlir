module {
  func.func private @compoundA() attributes {foo = #test.cmpnd_a<1, !test.smpla, [5, 6]>}
  %0 = test.result_has_same_type_as_attr #test.attr_with_self_type_param : i32 -> i32
  %1 = test.result_has_same_type_as_attr #test<attr_with_type_builder 10 : i16> : i16 -> i16
  func.func private @qualifiedAttr() attributes {foo = #test.cmpnd_nested_outer_qual<i #test.cmpnd_nested_inner<42 <1, !test.smpla, [5, 6]>>>}
  func.func private @overriddenAttr() attributes {foo = 5 : index}
  func.func private @decimalIntegerShapeEmpty() attributes {foo = #test.decimal_shape<>}
  func.func private @decimalIntegerShape() attributes {foo = #test.decimal_shape<5>}
  func.func private @decimalIntegerShapeMultiple() attributes {foo = #test.decimal_shape<0x3x7>}
}

// -----
// -----
module {
  func.func private @newlineAndIndent() attributes {indent = #test.newline_and_indent<
    !test.newline_and_indent<
      indented_content
    >
  >}
}

