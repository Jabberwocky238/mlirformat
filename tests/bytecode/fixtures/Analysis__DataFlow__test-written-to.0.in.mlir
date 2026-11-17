"builtin.module"() ({
  "func.func"() <{function_type = (memref<i32>, memref<i32>) -> (memref<i32>, memref<i32>), sym_name = "test_two_writes"}> ({
  ^bb0(%arg0: memref<i32> loc("<stdin>":3:8), %arg1: memref<i32> loc("<stdin>":3:28)):
    %0 = "arith.constant"() <{value = 0 : i32}> {tag = "constant0"} : () -> i32 loc("<stdin>":4:10)
    %1 = "arith.constant"() <{value = 1 : i32}> {tag = "constant1"} : () -> i32 loc("<stdin>":5:10)
    "memref.store"(%0, %arg0) {tag_name = "a"} : (i32, memref<i32>) -> () loc("<stdin>":6:5)
    "memref.store"(%1, %arg1) {tag_name = "b"} : (i32, memref<i32>) -> () loc("<stdin>":7:5)
    "func.return"(%arg0, %arg1) : (memref<i32>, memref<i32>) -> () loc("<stdin>":8:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
