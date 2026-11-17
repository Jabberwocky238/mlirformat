"builtin.module"() ({
  "func.func"() <{function_type = (i32) -> index, sym_name = "main"}> ({
  ^bb0(%arg1: i32 loc("<stdin>":3:8)):
    %1 = "func.call"(%arg1) <{callee = @f}> : (i32) -> index loc("<stdin>":4:10)
    "func.return"(%1) : (index) -> () loc("<stdin>":5:5)
  }) : () -> () loc("<stdin>":2:3)
  "func.func"() <{function_type = (i32) -> index, sym_name = "f"}> ({
  ^bb0(%arg0: i32 loc("<stdin>":8:8)):
    %0 = "index.castu"(%arg0) : (i32) -> index loc("<stdin>":9:10)
    "func.return"(%0) : (index) -> () loc("<stdin>":10:5)
  }) : () -> () loc("<stdin>":7:3)
}) : () -> () loc("<stdin>":1:1)
