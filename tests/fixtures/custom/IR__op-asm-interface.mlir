!op_asm_type_interface_type = !test.op_asm_type_interface
module {
  func.func @result_name_from_op_asm_type_interface() {
    %op_asm_type_interface = "test.result_name_from_type"() : () -> !op_asm_type_interface_type
    return
  }
}

// -----
!op_asm_type_interface_type = !test.op_asm_type_interface
module {
  func.func @block_argument_name_from_op_asm_type_interface() {
    test.block_argument_name_from_type {
    ^bb0(%op_asm_type_interface: !op_asm_type_interface_type):
      "test.terminator"() : () -> ()
    }
    return
  }
}

// -----
!op_asm_type_interface_type = !test.op_asm_type_interface
module {
  func.func @result_name_from_op_asm_type_interface_asmprinter() {
    %op_asm_type_interface = "test.result_name_from_type_interface"() : () -> !op_asm_type_interface_type
    return
  }
}

// -----
!op_asm_type_interface_type = !test.op_asm_type_interface
module {
  func.func @result_name_from_op_asm_type_interface_not_all() {
    %0:2 = "test.result_name_from_type_interface"() : () -> (!op_asm_type_interface_type, i1)
    return
  }
}

// -----
!op_asm_type_interface_type = !test.op_asm_type_interface
module {
  func.func @block_argument_name_from_op_asm_type_interface_asmprinter() {
    test.block_argument_name_from_type_interface {
    ^bb0(%op_asm_type_interface: !op_asm_type_interface_type):
      "test.terminator"() : () -> ()
    }
    return
  }
}

// -----
!op_asm_type_interface_type = !test.op_asm_type_interface
module {
  func.func @alias_from_op_asm_type_interface() {
    %op_asm_type_interface = "test.result_name_from_type"() : () -> !op_asm_type_interface_type
    return
  }
}

// -----
!op_asm_type_interface_tablegen_default = !test.op_asm_type_interface_tablegen_default
module {
  func.func @alias_from_op_asm_type_interface_tablegen_default() {
    %0 = "test.result_name_from_type"() : () -> !op_asm_type_interface_tablegen_default
    return
  }
}

// -----
!op_asm_type_interface_type = !test.op_asm_type_interface
#op_asm_attr_interface_test = #test.op_asm_attr_interface<value = "test">
module {
  func.func @test_op_asm_attr_interface() {
    %op_asm_type_interface = "test.result_name_from_type"() {attr = #op_asm_attr_interface_test} : () -> !op_asm_type_interface_type
    return
  }
}

// -----
!op_asm_type_interface_type = !test.op_asm_type_interface
#op_asm_attr_interface_tablegen_default = #test.op_asm_attr_interface_tablegen_default<value = "test">
module {
  func.func @test_op_asm_attr_interface() {
    %op_asm_type_interface = "test.result_name_from_type"() {attr = #op_asm_attr_interface_tablegen_default} : () -> !op_asm_type_interface_type
    return
  }
}

