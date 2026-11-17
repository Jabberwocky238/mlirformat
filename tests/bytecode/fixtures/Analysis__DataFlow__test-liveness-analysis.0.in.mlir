"builtin.module"() ({
  "func.func"() <{function_type = (memref<i32>) -> (), sym_name = "test_1_type_1.a"}> ({
  ^bb0(%arg0: memref<i32> loc("<stdin>":3:8)):
    %0 = "arith.constant"() <{value = 0 : i32}> {tag = "zero"} : () -> i32 loc("<stdin>":4:10)
    "memref.store"(%0, %arg0) : (i32, memref<i32>) -> () loc("<stdin>":5:5)
    "func.return"() : () -> () loc("<stdin>":6:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
