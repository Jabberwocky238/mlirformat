module {
  func.func @succeededDynamicTypeVerifier() {
    %0 = "unregistered_op"() : () -> !test.dynamic_singleton
    %1 = "unregistered_op"() : () -> !test.dynamic_pair<i32, f64>
    %2 = "unregistered_op"() : () -> !test.dynamic_pair<!test.dynamic_pair<i32, f64>, !test.dynamic_singleton>
    return
  }
}

// -----
// -----
// -----
module {
  func.func @customTypeParserPrinter() {
    %0 = "unregistered_op"() : () -> !test.dynamic_custom_assembly_format<f32:f64>
    return
  }
}

// -----
module {
  func.func @succeededDynamicAttributeVerifier() {
    "unregistered_op"() {test_attr = #test.dynamic_singleton} : () -> ()
    "unregistered_op"() {test_attr = #test.dynamic_pair<3 : i32, 5 : i32>} : () -> ()
    "unregistered_op"() {test_attr = #test.dynamic_pair<#test.dynamic_pair<3 : i32, 5 : i32>, f64>} : () -> ()
    return
  }
}

// -----
// -----
// -----
module {
  func.func @customAttributeParserPrinter() {
    "unregistered_op"() {test_attr = #test.dynamic_custom_assembly_format<f32:f64>} : () -> ()
    return
  }
}

// -----
module {
  func.func @succeededDynamicOpVerifier(%arg0: f32) {
    "test.dynamic_generic"() : () -> ()
    %0 = "test.dynamic_generic"(%arg0) : (f32) -> f64
    %1:2 = "test.dynamic_one_operand_two_results"(%arg0) : (f32) -> (f64, f64)
    return
  }
}

// -----
// -----
// -----
module {
  func.func @customOpParserPrinter() {
    test.dynamic_custom_parser_printer custom_keyword
    return
  }
}

// -----
