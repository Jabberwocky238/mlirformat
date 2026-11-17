"builtin.module"() ({
  "func.func"() <{function_type = (i32) -> i32, sym_name = "bitcount"}> ({
  ^bb0(%arg0: i32 loc("<stdin>":3:8)):
    %0 = "spirv.BitCount"(%arg0) : (i32) -> i32 loc("<stdin>":4:10)
    "spirv.ReturnValue"(%0) : (i32) -> () loc("<stdin>":5:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
