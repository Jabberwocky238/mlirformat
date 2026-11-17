"builtin.module"() ({
  "func.func"() <{function_type = (memref<?xi32>, index, i32) -> (), sym_name = "single_loop"}> ({
  ^bb0(%arg0: memref<?xi32> loc("<stdin>":3:8), %arg1: index loc("<stdin>":3:30), %arg2: i32 loc("<stdin>":3:44)):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":4:10)
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":5:10)
    "scf.for"(%0, %arg1, %1) ({
    ^bb0(%arg3: index loc("<stdin>":7:10)):
      %2 = "arith.addi"(%arg2, %arg2) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32 loc("<stdin>":8:12)
      "memref.store"(%2, %arg0, %arg3) : (i32, memref<?xi32>, index) -> () loc("<stdin>":9:7)
      "scf.yield"() : () -> () loc("<stdin>":10:7)
    }) : (index, index, index) -> () loc("<stdin>":6:5)
    "func.return"() : () -> () loc("<stdin>":12:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
