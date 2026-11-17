"builtin.module"() ({
  "func.func"() <{function_type = (!llvm.struct<"_Converted.foo", (f32)>) -> (), sym_name = "clashing_struct_name", sym_visibility = "private"}> ({
  }) : () -> () loc("<stdin>":2:3)
  "func.func"() <{function_type = (!llvm.struct<"foo", (index)>) -> (), sym_name = "create_clashes_on_conversion", sym_visibility = "private"}> ({
  }) : () -> () loc("<stdin>":4:3)
}) : () -> () loc("<stdin>":1:1)
