"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "symbol_foo", sym_visibility = "private"}> ({
  }) {sym.new_name = "replaced_foo"} : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "symbol_bar"}> ({
    "foo.op"() {non_symbol_attr, use = [{nested_symbol = [@symbol_foo], other_use = @symbol_bar, z_use = @symbol_foo}], z_non_symbol_attr_3} : () -> ()
  }) {sym.use = @symbol_foo} : () -> ()
  "builtin.module"() ({
    "foo.op"() {test.nested_reference = @symbol_foo} : () -> ()
  }) {test.reference = @symbol_foo} : () -> ()
}) {sym.outside_use = @symbol_foo} : () -> ()

// -----
"builtin.module"() ({
  "builtin.module"() <{sym_name = "module_a"}> ({
    "func.func"() <{function_type = () -> (), sym_name = "foo", sym_visibility = "nested"}> ({
    }) {sym.new_name = "replaced_foo"} : () -> ()
  }) : () -> ()
  "builtin.module"() <{sym_name = "module_b"}> ({
    "builtin.module"() <{sym_name = "module_c"}> ({
      "func.func"() <{function_type = () -> (), sym_name = "foo", sym_visibility = "nested"}> ({
      }) {sym.new_name = "replaced_foo"} : () -> ()
    }) {sym.new_name = "replaced_module_c"} : () -> ()
  }) {sym.new_name = "replaced_module_b"} : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "symbol_bar"}> ({
    "foo.op"() {use_1 = @module_a::@foo, use_2 = @module_b::@module_c::@foo} : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "failed_repl", sym_visibility = "private"}> ({
  }) {sym.new_name = "replaced_name"} : () -> ()
  "foo.possibly_unknown_symbol_table"() ({
  }) : () -> ()
}) : () -> ()

// -----
#distinct = distinct[0]<@symbol_foo>
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "symbol_foo", sym_visibility = "private"}> ({
  }) {sym.new_name = "replaced_foo"} : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "symbol_bar"}> ({
    "foo.op"() {non_symbol_attr, use = [#test.sub_elements_access<[@symbol_foo], @symbol_bar, @symbol_foo>, #distinct], z_non_symbol_attr_3} : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "builtin.module"() <{sym_name = "foo"}> ({
    "func.func"() <{function_type = () -> (), sym_name = "foo", sym_visibility = "private"}> ({
    }) : () -> ()
  }) {sym.new_name = "replaced_foo"} : () -> ()
  "foo.op"() {use = @foo::@foo} : () -> ()
}) : () -> ()

