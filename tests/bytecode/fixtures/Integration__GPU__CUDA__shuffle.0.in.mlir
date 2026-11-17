"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<13xf32> loc("<stdin>":3:10)
    %1 = "memref.cast"(%0) : (memref<13xf32>) -> memref<?xf32> loc("<stdin>":4:10)
    %2 = "arith.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":5:10)
    %3 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":6:10)
    %4 = "memref.dim"(%1, %3) : (memref<?xf32>, index) -> index loc("<stdin>":7:10)
    %5 = "memref.cast"(%1) : (memref<?xf32>) -> memref<*xf32> loc("<stdin>":8:10)
    "gpu.host_register"(%5) : (memref<*xf32>) -> () loc("<stdin>":9:5)
    "gpu.launch"(%2, %2, %2, %4, %2, %2) <{operandSegmentSizes = array<i32: 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0>}> ({
    ^bb0(%arg0: index loc("<stdin>":11:10), %arg1: index loc("<stdin>":11:24), %arg2: index loc("<stdin>":11:38), %arg3: index loc("<stdin>":11:52), %arg4: index loc("<stdin>":11:66), %arg5: index loc("<stdin>":11:80), %arg6: index loc("<stdin>":11:94), %arg7: index loc("<stdin>":11:108), %arg8: index loc("<stdin>":11:122), %arg9: index loc("<stdin>":11:136), %arg10: index loc("<stdin>":11:150), %arg11: index loc("<stdin>":11:165)):
      %6 = "arith.index_cast"(%arg3) : (index) -> i32 loc("<stdin>":12:12)
      %7 = "arith.sitofp"(%6) : (i32) -> f32 loc("<stdin>":13:12)
      %8 = "arith.index_cast"(%arg9) : (index) -> i32 loc("<stdin>":14:12)
      %9 = "arith.constant"() <{value = 4 : i32}> : () -> i32 loc("<stdin>":15:12)
      %10:2 = "gpu.shuffle"(%7, %9, %8) <{mode = #gpu<shuffle_mode xor>}> : (f32, i32, i32) -> (f32, i1) loc("<stdin>":16:15)
      "cf.cond_br"(%10#1, %10#0)[^bb2, ^bb1] <{operandSegmentSizes = array<i32: 1, 1, 0>}> : (i1, f32) -> () loc("<stdin>":17:7)
    ^bb1:  // pred: ^bb0
      %11 = "arith.constant"() <{value = -1.000000e+00 : f32}> : () -> f32 loc("<stdin>":19:13)
      "cf.br"(%11)[^bb2] : (f32) -> () loc("<stdin>":20:7)
    ^bb2(%12: f32 loc("<stdin>":21:10)):  // 2 preds: ^bb0, ^bb1
      "memref.store"(%12, %1, %arg3) : (f32, memref<?xf32>, index) -> () loc("<stdin>":22:7)
      "gpu.terminator"() : () -> () loc("<stdin>":23:7)
    }) : (index, index, index, index, index, index) -> () loc("<stdin>":10:5)
    "func.call"(%5) <{callee = @printMemrefF32}> : (memref<*xf32>) -> () loc("<stdin>":25:5)
    "func.return"() : () -> () loc("<stdin>":26:5)
  }) : () -> () loc("<stdin>":2:3)
  "func.func"() <{function_type = (memref<*xf32>) -> (), sym_name = "printMemrefF32", sym_visibility = "private"}> ({
  }) : () -> () loc("<stdin>":28:3)
}) : () -> () loc("<stdin>":1:1)
