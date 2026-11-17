"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "emit_vertex"}> ({
    "spirv.EmitVertex"() : () -> () loc("<stdin>":3:5)
    "spirv.Return"() : () -> () loc("<stdin>":4:5)
  }) : () -> () loc("<stdin>":2:3)
  "func.func"() <{function_type = () -> (), sym_name = "end_primitive"}> ({
    "spirv.EndPrimitive"() : () -> () loc("<stdin>":7:5)
    "spirv.Return"() : () -> () loc("<stdin>":8:5)
  }) : () -> () loc("<stdin>":6:3)
}) : () -> () loc("<stdin>":1:1)
