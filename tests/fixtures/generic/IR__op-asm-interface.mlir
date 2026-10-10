!op_asm_type_interface_type = !test.op_asm_type_interface
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "result_name_from_op_asm_type_interface"}> ({
    %0 = "test.result_name_from_type"() : () -> !op_asm_type_interface_type
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
!op_asm_type_interface_type = !test.op_asm_type_interface
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "block_argument_name_from_op_asm_type_interface"}> ({
    "test.block_argument_name_from_type"() ({
    ^bb0(%arg0: !op_asm_type_interface_type):
      "test.terminator"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
!op_asm_type_interface_type = !test.op_asm_type_interface
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "result_name_from_op_asm_type_interface_asmprinter"}> ({
    %0 = "test.result_name_from_type_interface"() : () -> !op_asm_type_interface_type
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
!op_asm_type_interface_type = !test.op_asm_type_interface
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "result_name_from_op_asm_type_interface_not_all"}> ({
    %0:2 = "test.result_name_from_type_interface"() : () -> (!op_asm_type_interface_type, i1)
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
!op_asm_type_interface_type = !test.op_asm_type_interface
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "block_argument_name_from_op_asm_type_interface_asmprinter"}> ({
    "test.block_argument_name_from_type_interface"() ({
    ^bb0(%arg0: !op_asm_type_interface_type):
      "test.terminator"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
!op_asm_type_interface_type = !test.op_asm_type_interface
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "alias_from_op_asm_type_interface"}> ({
    %0 = "test.result_name_from_type"() : () -> !op_asm_type_interface_type
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
!op_asm_type_interface_tablegen_default = !test.op_asm_type_interface_tablegen_default
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "alias_from_op_asm_type_interface_tablegen_default"}> ({
    %0 = "test.result_name_from_type"() : () -> !op_asm_type_interface_tablegen_default
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
!op_asm_type_interface_type = !test.op_asm_type_interface
#op_asm_attr_interface_test = #test.op_asm_attr_interface<value = "test">
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "test_op_asm_attr_interface"}> ({
    %0 = "test.result_name_from_type"() {attr = #op_asm_attr_interface_test} : () -> !op_asm_type_interface_type
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
!op_asm_type_interface_type = !test.op_asm_type_interface
#op_asm_attr_interface_tablegen_default = #test.op_asm_attr_interface_tablegen_default<value = "test">
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "test_op_asm_attr_interface"}> ({
    %0 = "test.result_name_from_type"() {attr = #op_asm_attr_interface_tablegen_default} : () -> !op_asm_type_interface_type
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

