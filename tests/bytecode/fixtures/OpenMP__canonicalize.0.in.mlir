"builtin.module"() ({
  "func.func"() <{function_type = (memref<i32>) -> (), sym_name = "update_no_op"}> ({
  ^bb0(%arg0: memref<i32> loc("<stdin>":3:8)):
    "omp.atomic.update"(%arg0) ({
    ^bb0(%arg1: i32 loc("<stdin>":5:10)):
      "omp.yield"(%arg1) : (i32) -> () loc("<stdin>":6:7)
    }) : (memref<i32>) -> () loc("<stdin>":4:5)
    "func.return"() : () -> () loc("<stdin>":8:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
