"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "succeededDynamicTypeVerifier"}> ({
    %0 = "unregistered_op"() : () -> !test.dynamic_singleton
    %1 = "unregistered_op"() : () -> !test.dynamic_pair<i32, f64>
    %2 = "unregistered_op"() : () -> !test.dynamic_pair<!test.dynamic_pair<i32, f64>, !test.dynamic_singleton>
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
// -----
// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "customTypeParserPrinter"}> ({
    %0 = "unregistered_op"() : () -> !test.dynamic_custom_assembly_format<f32:f64>
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "succeededDynamicAttributeVerifier"}> ({
    "unregistered_op"() {test_attr = #test.dynamic_singleton} : () -> ()
    "unregistered_op"() {test_attr = #test.dynamic_pair<3 : i32, 5 : i32>} : () -> ()
    "unregistered_op"() {test_attr = #test.dynamic_pair<#test.dynamic_pair<3 : i32, 5 : i32>, f64>} : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
// -----
// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "customAttributeParserPrinter"}> ({
    "unregistered_op"() {test_attr = #test.dynamic_custom_assembly_format<f32:f64>} : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (f32) -> (), sym_name = "succeededDynamicOpVerifier"}> ({
  ^bb0(%arg0: f32):
    "test.dynamic_generic"() : () -> ()
    %0 = "test.dynamic_generic"(%arg0) : (f32) -> f64
    %1:2 = "test.dynamic_one_operand_two_results"(%arg0) : (f32) -> (f64, f64)
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
// -----
// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "customOpParserPrinter"}> ({
    "test.dynamic_custom_parser_printer"() : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
