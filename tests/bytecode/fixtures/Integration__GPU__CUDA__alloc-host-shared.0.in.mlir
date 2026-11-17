"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %0 = "arith.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":3:10)
    %1 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":4:10)
    %2 = "arith.constant"() <{value = 1000 : i32}> : () -> i32 loc("<stdin>":5:10)
    %3 = "gpu.alloc"() <{hostShared, operandSegmentSizes = array<i32: 0, 0, 0>}> : () -> memref<1xi32> loc("<stdin>":6:10)
    "memref.store"(%2, %3, %0) : (i32, memref<1xi32>, index) -> () loc("<stdin>":7:5)
    "gpu.launch"(%0, %0, %0, %0, %0, %0) <{operandSegmentSizes = array<i32: 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0>}> ({
    ^bb0(%arg0: index loc("<stdin>":9:10), %arg1: index loc("<stdin>":9:24), %arg2: index loc("<stdin>":9:38), %arg3: index loc("<stdin>":9:52), %arg4: index loc("<stdin>":9:66), %arg5: index loc("<stdin>":9:80), %arg6: index loc("<stdin>":9:94), %arg7: index loc("<stdin>":9:108), %arg8: index loc("<stdin>":9:122), %arg9: index loc("<stdin>":9:136), %arg10: index loc("<stdin>":9:150), %arg11: index loc("<stdin>":9:165)):
      %5 = "memref.load"(%3, %0) : (memref<1xi32>, index) -> i32 loc("<stdin>":10:12)
      %6 = "arith.addi"(%5, %5) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32 loc("<stdin>":11:12)
      "memref.store"(%6, %3, %0) : (i32, memref<1xi32>, index) -> () loc("<stdin>":12:7)
      "gpu.terminator"() : () -> () loc("<stdin>":13:7)
    }) : (index, index, index, index, index, index) -> () loc("<stdin>":8:5)
    %4 = "memref.load"(%3, %0) : (memref<1xi32>, index) -> i32 loc("<stdin>":15:10)
    "vector.print"(%4) <{punctuation = #vector.punctuation<newline>}> : (i32) -> () loc("<stdin>":16:5)
    "func.return"() : () -> () loc("<stdin>":17:5)
  }) : () -> () loc("<stdin>":2:3)
}) {gpu.container_module} : () -> () loc("<stdin>":1:1)
