"builtin.module"() ({
  "emitc.file"() <{id = "file_one"}> ({
    "emitc.func"() <{function_type = (f32) -> (), sym_name = "func_one"}> ({
    ^bb0(%arg1: f32):
      "emitc.return"() : () -> ()
    }) : () -> ()
  }) : () -> ()
  "emitc.file"() <{id = "file_two"}> ({
    "emitc.func"() <{function_type = (f32) -> (), sym_name = "func_two"}> ({
    ^bb0(%arg0: f32):
      "emitc.return"() : () -> ()
    }) : () -> ()
  }) : () -> ()
}) : () -> ()

