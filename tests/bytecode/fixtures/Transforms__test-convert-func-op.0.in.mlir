"builtin.module"() ({
  "func.func"() <{function_type = (i32, i32) -> i32, sym_name = "add"}> ({
  ^bb0(%arg0: i32 loc("<stdin>":3:8), %arg1: i32 loc("<stdin>":3:20)):
    %0 = "arith.addi"(%arg0, %arg1) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32 loc("<stdin>":4:10)
    "func.return"(%0) : (i32) -> () loc("<stdin>":5:5)
  }) {llvm.emit_c_interface} : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
