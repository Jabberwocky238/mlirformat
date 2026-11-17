"builtin.module"() ({
  "func.func"() <{function_type = (index, index, index, index, index) -> (), sym_name = "reduction1"}> ({
  ^bb0(%arg0: index loc("<stdin>":3:8), %arg1: index loc("<stdin>":3:22), %arg2: index loc("<stdin>":3:36), %arg3: index loc("<stdin>":3:50), %arg4: index loc("<stdin>":3:64)):
    %0 = "arith.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":4:10)
    %1 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32 loc("<stdin>":5:10)
    %2 = "scf.parallel"(%arg0, %arg1, %arg2, %arg3, %arg4, %0, %1) <{operandSegmentSizes = array<i32: 2, 2, 2, 1>}> ({
    ^bb0(%arg5: index loc("<stdin>":7:10), %arg6: index loc("<stdin>":7:24)):
      %3 = "arith.constant"() <{value = 1.000000e+00 : f32}> : () -> f32 loc("<stdin>":8:12)
      "scf.reduce"(%3) ({
      ^bb0(%arg7: f32 loc("<stdin>":10:12), %arg8: f32 loc("<stdin>":10:24)):
        %4 = "arith.addf"(%arg7, %arg8) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":11:14)
        "scf.reduce.return"(%4) : (f32) -> () loc("<stdin>":12:9)
      }) : (f32) -> () loc("<stdin>":9:7)
    }) : (index, index, index, index, index, index, f32) -> f32 loc("<stdin>":6:10)
    "func.return"() : () -> () loc("<stdin>":15:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
