"builtin.module"() ({
  "func.func"() <{function_type = (index, f64, i32, i32, memref<f64, 1>) -> (), sym_name = "shuffleF64"}> ({
  ^bb0(%arg0: index loc("<stdin>":3:8), %arg1: f64 loc("<stdin>":3:22), %arg2: i32 loc("<stdin>":3:34), %arg3: i32 loc("<stdin>":3:46), %arg4: memref<f64, 1> loc("<stdin>":3:58)):
    "gpu.launch"(%arg0, %arg0, %arg0, %arg0, %arg0, %arg0) <{operandSegmentSizes = array<i32: 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0>}> ({
    ^bb0(%arg5: index loc("<stdin>":5:10), %arg6: index loc("<stdin>":5:24), %arg7: index loc("<stdin>":5:38), %arg8: index loc("<stdin>":5:52), %arg9: index loc("<stdin>":5:66), %arg10: index loc("<stdin>":5:80), %arg11: index loc("<stdin>":5:95), %arg12: index loc("<stdin>":5:110), %arg13: index loc("<stdin>":5:125), %arg14: index loc("<stdin>":5:140), %arg15: index loc("<stdin>":5:155), %arg16: index loc("<stdin>":5:170)):
      %0:2 = "gpu.shuffle"(%arg1, %arg2, %arg3) <{mode = #gpu<shuffle_mode xor>}> : (f64, i32, i32) -> (f64, i1) loc("<stdin>":6:14)
      "memref.store"(%0#0, %arg4) : (f64, memref<f64, 1>) -> () loc("<stdin>":7:7)
      "gpu.terminator"() : () -> () loc("<stdin>":8:7)
    }) : (index, index, index, index, index, index) -> () loc("<stdin>":4:5)
    "func.return"() : () -> () loc("<stdin>":10:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
