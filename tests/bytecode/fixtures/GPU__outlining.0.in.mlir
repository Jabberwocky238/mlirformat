"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "launch"}> ({
    %0 = "op"() : () -> f32 loc("<stdin>":3:10)
    %1 = "op"() : () -> memref<?xf32, 1> loc("<stdin>":4:10)
    %2 = "arith.constant"() <{value = 8 : index}> : () -> index loc("<stdin>":5:10)
    %3 = "arith.constant"() <{value = 12 : index}> : () -> index loc("<stdin>":6:10)
    %4 = "arith.constant"() <{value = 16 : index}> : () -> index loc("<stdin>":7:10)
    %5 = "arith.constant"() <{value = 20 : index}> : () -> index loc("<stdin>":8:10)
    %6 = "arith.constant"() <{value = 24 : index}> : () -> index loc("<stdin>":9:10)
    %7 = "arith.constant"() <{value = 28 : index}> : () -> index loc("<stdin>":10:10)
    "gpu.launch"(%2, %3, %4, %5, %6, %7) <{operandSegmentSizes = array<i32: 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0>}> ({
    ^bb0(%arg0: index loc("<stdin>":12:10), %arg1: index loc("<stdin>":12:24), %arg2: index loc("<stdin>":12:38), %arg3: index loc("<stdin>":12:52), %arg4: index loc("<stdin>":12:66), %arg5: index loc("<stdin>":12:80), %arg6: index loc("<stdin>":12:94), %arg7: index loc("<stdin>":12:108), %arg8: index loc("<stdin>":12:122), %arg9: index loc("<stdin>":12:136), %arg10: index loc("<stdin>":12:150), %arg11: index loc("<stdin>":12:165)):
      "use"(%0) : (f32) -> () loc("<stdin>":13:7)
      "some_op"(%arg0, %arg9) : (index, index) -> () loc("<stdin>":14:7)
      %8 = "memref.load"(%1, %arg3) : (memref<?xf32, 1>, index) -> f32 loc("<stdin>":15:12)
      "gpu.terminator"() : () -> () loc("<stdin>":16:7)
    }) : (index, index, index, index, index, index) -> () loc("<stdin>":11:5)
    "func.return"() : () -> () loc("<stdin>":18:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
