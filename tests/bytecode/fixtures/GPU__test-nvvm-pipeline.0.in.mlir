"builtin.module"() ({
  "func.func"() <{function_type = (f32) -> (), sym_name = "test_math"}> ({
  ^bb0(%arg0: f32 loc("<stdin>":3:8)):
    %0 = "arith.constant"() <{value = 2 : index}> : () -> index loc("<stdin>":4:10)
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":5:10)
    "gpu.launch"(%1, %1, %1, %0, %1, %1) <{operandSegmentSizes = array<i32: 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0>}> ({
    ^bb0(%arg1: index loc("<stdin>":7:10), %arg2: index loc("<stdin>":7:24), %arg3: index loc("<stdin>":7:38), %arg4: index loc("<stdin>":7:52), %arg5: index loc("<stdin>":7:66), %arg6: index loc("<stdin>":7:80), %arg7: index loc("<stdin>":7:94), %arg8: index loc("<stdin>":7:108), %arg9: index loc("<stdin>":7:122), %arg10: index loc("<stdin>":7:136), %arg11: index loc("<stdin>":7:151), %arg12: index loc("<stdin>":7:166)):
      %2 = "math.exp"(%arg0) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32 loc("<stdin>":8:12)
      "gpu.printf"(%2) <{format = "%f"}> : (f32) -> () loc("<stdin>":9:7)
      "gpu.terminator"() : () -> () loc("<stdin>":10:7)
    }) : (index, index, index, index, index, index) -> () loc("<stdin>":6:5)
    "func.return"() : () -> () loc("<stdin>":12:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
