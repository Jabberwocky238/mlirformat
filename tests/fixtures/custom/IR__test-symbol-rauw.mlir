module attributes {sym.outside_use = @symbol_foo} {
  func.func private @symbol_foo() attributes {sym.new_name = "replaced_foo"}
  func.func @symbol_bar() attributes {sym.use = @symbol_foo} {
    "foo.op"() {non_symbol_attr, use = [{nested_symbol = [@symbol_foo], other_use = @symbol_bar, z_use = @symbol_foo}], z_non_symbol_attr_3} : () -> ()
  }
  module attributes {test.reference = @symbol_foo} {
    "foo.op"() {test.nested_reference = @symbol_foo} : () -> ()
  }
}

// -----
module {
  module @module_a {
    func.func nested @foo() attributes {sym.new_name = "replaced_foo"}
  }
  module @module_b attributes {sym.new_name = "replaced_module_b"} {
    module @module_c attributes {sym.new_name = "replaced_module_c"} {
      func.func nested @foo() attributes {sym.new_name = "replaced_foo"}
    }
  }
  func.func @symbol_bar() {
    "foo.op"() {use_1 = @module_a::@foo, use_2 = @module_b::@module_c::@foo} : () -> ()
  }
}

// -----
module {
  func.func private @failed_repl() attributes {sym.new_name = "replaced_name"}
  "foo.possibly_unknown_symbol_table"() ({
  }) : () -> ()
}

// -----
#distinct = distinct[0]<@symbol_foo>
module {
  func.func private @symbol_foo() attributes {sym.new_name = "replaced_foo"}
  func.func @symbol_bar() {
    "foo.op"() {non_symbol_attr, use = [#test.sub_elements_access<[@symbol_foo], @symbol_bar, @symbol_foo>, #distinct], z_non_symbol_attr_3} : () -> ()
  }
}

// -----
module {
  module @foo attributes {sym.new_name = "replaced_foo"} {
    func.func private @foo()
  }
  "foo.op"() {use = @foo::@foo} : () -> ()
}

