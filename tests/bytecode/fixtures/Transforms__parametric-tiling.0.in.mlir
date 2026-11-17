"builtin.module"() ({
  "func.func"() <{function_type = (memref<?x?xf32>) -> (), sym_name = "rectangular"}> ({
  ^bb0(%arg9: memref<?x?xf32> loc("<stdin>":3:8)):
    %8 = "arith.constant"() <{value = 2 : index}> : () -> index loc("<stdin>":4:10)
    %9 = "arith.constant"() <{value = 44 : index}> : () -> index loc("<stdin>":5:10)
    %10 = "arith.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":6:11)
    "scf.for"(%8, %9, %10) ({
    ^bb0(%arg10: index loc("<stdin>":8:10)):
      "scf.for"(%10, %9, %8) ({
      ^bb0(%arg11: index loc("<stdin>":10:12)):
        %11 = "memref.load"(%arg9, %arg10, %arg11) : (memref<?x?xf32>, index, index) -> f32 loc("<stdin>":11:15)
        "scf.yield"() : () -> () loc("<stdin>":12:9)
      }) : (index, index, index) -> () loc("<stdin>":9:7)
      "scf.yield"() : () -> () loc("<stdin>":14:7)
    }) : (index, index, index) -> () loc("<stdin>":7:5)
    "func.return"() : () -> () loc("<stdin>":16:5)
  }) : () -> () loc("<stdin>":2:3)
  "func.func"() <{function_type = (memref<?x?xf32>) -> (), sym_name = "triangular"}> ({
  ^bb0(%arg6: memref<?x?xf32> loc("<stdin>":19:8)):
    %4 = "arith.constant"() <{value = 2 : index}> : () -> index loc("<stdin>":20:10)
    %5 = "arith.constant"() <{value = 44 : index}> : () -> index loc("<stdin>":21:10)
    %6 = "arith.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":22:10)
    "scf.for"(%4, %5, %6) ({
    ^bb0(%arg7: index loc("<stdin>":24:10)):
      "scf.for"(%6, %arg7, %4) ({
      ^bb0(%arg8: index loc("<stdin>":26:12)):
        %7 = "memref.load"(%arg6, %arg7, %arg8) : (memref<?x?xf32>, index, index) -> f32 loc("<stdin>":27:14)
        "scf.yield"() : () -> () loc("<stdin>":28:9)
      }) : (index, index, index) -> () loc("<stdin>":25:7)
      "scf.yield"() : () -> () loc("<stdin>":30:7)
    }) : (index, index, index) -> () loc("<stdin>":23:5)
    "func.return"() : () -> () loc("<stdin>":32:5)
  }) : () -> () loc("<stdin>":18:3)
  "func.func"() <{function_type = (memref<1024xf32>, index, index, index) -> f32, sym_name = "loop_with_iter_args"}> ({
  ^bb0(%arg0: memref<1024xf32> loc("<stdin>":35:8), %arg1: index loc("<stdin>":35:33), %arg2: index loc("<stdin>":35:47), %arg3: index loc("<stdin>":35:61)):
    %0 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32 loc("<stdin>":36:10)
    %1 = "scf.for"(%arg1, %arg2, %arg3, %0) ({
    ^bb0(%arg4: index loc("<stdin>":38:10), %arg5: f32 loc("<stdin>":38:24)):
      %2 = "memref.load"(%arg0, %arg4) : (memref<1024xf32>, index) -> f32 loc("<stdin>":39:12)
      %3 = "arith.addf"(%arg5, %2) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":40:12)
      "scf.yield"(%3) : (f32) -> () loc("<stdin>":41:7)
    }) : (index, index, index, f32) -> f32 loc("<stdin>":37:10)
    "func.return"(%1) : (f32) -> () loc("<stdin>":43:5)
  }) : () -> () loc("<stdin>":34:3)
}) : () -> () loc("<stdin>":1:1)
