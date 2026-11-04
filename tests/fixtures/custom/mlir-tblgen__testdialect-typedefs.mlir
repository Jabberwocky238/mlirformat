module {
  func.func @simpleA(%arg0: !test.smpla) {
    return
  }
  func.func @compoundA(%arg0: !test.cmpnd_a<1, !test.smpla, [5, 6]>) {
    return
  }
  func.func @compoundNested(%arg0: !test.cmpnd_nested_outer<i <42 <1, !test.smpla, [5, 6]>>>) {
    return
  }
  func.func @compoundNestedExplicit(%arg0: !test.cmpnd_nested_outer<i <42 <1, !test.smpla, [5, 6]>>>) {
    test.format_cpmd_nested_type %arg0 nested <i <42 <1, !test.smpla, [5, 6]>>>
    test.format_cpmd_nested_type %arg0 nested <i <42 <1, !test.smpla, [5, 6]>>>
    return
  }
  func.func private @compoundNestedQual(!test.cmpnd_nested_outer_qual<i !test.cmpnd_inner<42 <1, !test.smpla, [5, 6]>>>)
  func.func @testInt(%arg0: !test.int<signed, 8>, %arg1: !test.int<unsigned, 2>, %arg2: !test.int<none, 1>) {
    return
  }
  func.func @structTest(%arg0: !test.struct<{field1,!test.smpla}, {field2,!test.int<none, 3>}>) {
    return
  }
  func.func @newlineAndIndent(%arg0: !test.newline_and_indent<
    indented_content
  >) {
    return
  }
}

