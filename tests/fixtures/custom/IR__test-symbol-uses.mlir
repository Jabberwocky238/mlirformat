#distinct = distinct[0]<@symbol_foo>
module attributes {sym.outside_use = @symbol_foo} {
  func.func private @symbol_foo()
  func.func @symbol_bar() attributes {sym.use = @symbol_foo} {
    "foo.op"() {non_symbol_attr, use = [{nested_symbol = [@symbol_foo]}], z_other_non_symbol_attr} : () -> ()
    "foo.op"() {use = #distinct} : () -> ()
  }
  func.func private @symbol_removable()
  func.func private @symbol_baz()
  module attributes {test.reference = @symbol_baz} {
    "foo.op"() {test.nested_reference = @symbol_baz} : () -> ()
  }
}

// -----
module {
  module @module_b {
    module @module_c {
      func.func nested @foo()
    }
  }
  func.func @symbol_bar() {
    "foo.op"() {use_1 = [{nested_symbol = [@module_b::@module_c::@foo]}], use_2 = @module_b} : () -> ()
  }
}

// -----
module {
  func.func @symbol_bar() {
    "foo.possibly_unknown_symbol_table"() ({
    }) : () -> ()
  }
}

