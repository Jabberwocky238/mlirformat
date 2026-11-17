"builtin.module"() ({
  "func.func"() <{arg_attrs = [{dialect.a = true, dialect.b = 4 : i64}], function_type = (i64) -> (), sym_name = "check_attributes"}> ({
  ^bb0(%arg3: i64 loc("<stdin>":3:8)):
    "func.return"() : () -> () loc("<stdin>":4:5)
  }) : () -> () loc("<stdin>":2:3)
  "func.func"() <{arg_attrs = [{llvm.noalias}], function_type = (memref<10x20xf32>) -> (), sym_name = "check_memref"}> ({
  ^bb0(%arg2: memref<10x20xf32> loc("<stdin>":7:8)):
    "func.return"() : () -> () loc("<stdin>":8:5)
  }) : () -> () loc("<stdin>":6:3)
  "func.func"() <{arg_attrs = [{first.arg = true}, {second.arg = 42 : i32}], function_type = (f32, i64) -> (), sym_name = "check_multiple"}> ({
  ^bb0(%arg0: f32 loc("<stdin>":11:8), %arg1: i64 loc("<stdin>":11:20)):
    "func.return"() : () -> () loc("<stdin>":12:5)
  }) : () -> () loc("<stdin>":10:3)
}) : () -> () loc("<stdin>":1:1)
