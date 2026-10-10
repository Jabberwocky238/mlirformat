#distinct = distinct[0]<@symbol_foo>
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "symbol_foo", sym_visibility = "private"}> ({
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "symbol_bar"}> ({
    "foo.op"() {non_symbol_attr, use = [{nested_symbol = [@symbol_foo]}], z_other_non_symbol_attr} : () -> ()
    "foo.op"() {use = #distinct} : () -> ()
  }) {sym.use = @symbol_foo} : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "symbol_removable", sym_visibility = "private"}> ({
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "symbol_baz", sym_visibility = "private"}> ({
  }) : () -> ()
  "builtin.module"() ({
    "foo.op"() {test.nested_reference = @symbol_baz} : () -> ()
  }) {test.reference = @symbol_baz} : () -> ()
}) {sym.outside_use = @symbol_foo} : () -> ()

// -----
"builtin.module"() ({
  "builtin.module"() <{sym_name = "module_b"}> ({
    "builtin.module"() <{sym_name = "module_c"}> ({
      "func.func"() <{function_type = () -> (), sym_name = "foo", sym_visibility = "nested"}> ({
      }) : () -> ()
    }) : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "symbol_bar"}> ({
    "foo.op"() {use_1 = [{nested_symbol = [@module_b::@module_c::@foo]}], use_2 = @module_b} : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "symbol_bar"}> ({
    "foo.possibly_unknown_symbol_table"() ({
    }) : () -> ()
  }) : () -> ()
}) : () -> ()

