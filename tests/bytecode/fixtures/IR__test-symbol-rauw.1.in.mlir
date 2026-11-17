"builtin.module"() ({
  "builtin.module"() <{sym_name = "module_a"}> ({
    "func.func"() <{function_type = () -> (), sym_name = "foo", sym_visibility = "nested"}> ({
    }) {sym.new_name = "replaced_foo"} : () -> () loc("<stdin>":4:5)
  }) : () -> () loc("<stdin>":3:3)
  "builtin.module"() <{sym_name = "module_b"}> ({
    "builtin.module"() <{sym_name = "module_c"}> ({
      "func.func"() <{function_type = () -> (), sym_name = "foo", sym_visibility = "nested"}> ({
      }) {sym.new_name = "replaced_foo"} : () -> () loc("<stdin>":9:7)
    }) {sym.new_name = "replaced_module_c"} : () -> () loc("<stdin>":8:5)
  }) {sym.new_name = "replaced_module_b"} : () -> () loc("<stdin>":7:3)
  "func.func"() <{function_type = () -> (), sym_name = "symbol_bar"}> ({
    "foo.op"() {use_1 = @module_a::@foo, use_2 = @module_b::@module_c::@foo} : () -> () loc("<stdin>":14:5)
  }) : () -> () loc("<stdin>":13:3)
}) : () -> () loc("<stdin>":2:1)
