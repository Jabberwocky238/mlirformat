"builtin.module"() ({
  "emitc.file"() <{id = "file_one"}> ({
    "emitc.func"() <{function_type = (f32) -> (), sym_name = "func_one"}> ({
    ^bb0(%arg1: f32 loc("<stdin>":4:10)):
      "emitc.return"() : () -> () loc("<stdin>":5:7)
    }) : () -> () loc("<stdin>":3:5)
  }) : () -> () loc("<stdin>":2:3)
  "emitc.file"() <{id = "file_two"}> ({
    "emitc.func"() <{function_type = (f32) -> (), sym_name = "func_two"}> ({
    ^bb0(%arg0: f32 loc("<stdin>":10:10)):
      "emitc.return"() : () -> () loc("<stdin>":11:7)
    }) : () -> () loc("<stdin>":9:5)
  }) : () -> () loc("<stdin>":8:3)
}) : () -> () loc("<stdin>":1:1)
