"builtin.module"() ({
  "func.func"() <{function_type = () -> i32, sym_name = "function"}> ({
    %1 = "foo"() : () -> i32 loc("<stdin>":3:10)
    "func.return"(%1) : (i32) -> () loc("<stdin>":4:5)
  }) : () -> () loc("<stdin>":2:3)
  "func.func"() <{function_type = () -> i32, sym_name = "function2"}> ({
    %0 = "foo"() : () -> i32 loc("<stdin>":7:10)
    "func.return"(%0) : (i32) -> () loc("<stdin>":8:5)
  }) : () -> () loc("<stdin>":6:3)
}) : () -> () loc("<stdin>":1:1)
