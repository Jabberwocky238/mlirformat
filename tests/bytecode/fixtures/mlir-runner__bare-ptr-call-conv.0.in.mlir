"builtin.module"() ({
  "func.func"() <{function_type = (memref<2xf32>, memref<2xf32>) -> (), sym_name = "simple_add1_add2_test"}> ({
  ^bb0(%arg1: memref<2xf32> loc("<stdin>":3:8), %arg2: memref<2xf32> loc("<stdin>":3:30)):
    %11 = "arith.constant"() <{value = 2 : index}> : () -> index loc("<stdin>":4:11)
    %12 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":5:11)
    %13 = "arith.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":6:11)
    %14 = "arith.constant"() <{value = 1.000000e+00 : f32}> : () -> f32 loc("<stdin>":7:11)
    %15 = "arith.constant"() <{value = 2.000000e+00 : f32}> : () -> f32 loc("<stdin>":8:11)
    "scf.for"(%12, %11, %13) ({
    ^bb0(%arg3: index loc("<stdin>":10:10)):
      %16 = "memref.load"(%arg1, %arg3) : (memref<2xf32>, index) -> f32 loc("<stdin>":11:13)
      %17 = "arith.addf"(%16, %14) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":12:13)
      "memref.store"(%17, %arg1, %arg3) : (f32, memref<2xf32>, index) -> () loc("<stdin>":13:7)
      %18 = "memref.load"(%arg2, %arg3) : (memref<2xf32>, index) -> f32 loc("<stdin>":14:13)
      %19 = "arith.addf"(%17, %15) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":15:13)
      "memref.store"(%19, %arg2, %arg3) : (f32, memref<2xf32>, index) -> () loc("<stdin>":16:7)
      "scf.yield"() : () -> () loc("<stdin>":17:7)
    }) : (index, index, index) -> () loc("<stdin>":9:5)
    "func.return"() : () -> () loc("<stdin>":19:5)
  }) : () -> () loc("<stdin>":2:3)
  "func.func"() <{function_type = (f32) -> (), sym_name = "printF32", sym_visibility = "private"}> ({
  }) : () -> () loc("<stdin>":21:3)
  "func.func"() <{function_type = () -> (), sym_name = "printComma", sym_visibility = "private"}> ({
  }) : () -> () loc("<stdin>":23:3)
  "func.func"() <{function_type = () -> (), sym_name = "printNewline", sym_visibility = "private"}> ({
  }) : () -> () loc("<stdin>":25:3)
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %0 = "arith.constant"() <{value = 2 : index}> : () -> index loc("<stdin>":28:10)
    %1 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":29:10)
    %2 = "arith.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":30:10)
    %3 = "arith.constant"() <{value = 1.000000e+00 : f32}> : () -> f32 loc("<stdin>":31:10)
    %4 = "arith.constant"() <{value = 2.000000e+00 : f32}> : () -> f32 loc("<stdin>":32:10)
    %5 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<2xf32> loc("<stdin>":33:10)
    %6 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<2xf32> loc("<stdin>":34:10)
    "scf.for"(%1, %0, %2) ({
    ^bb0(%arg0: index loc("<stdin>":36:10)):
      "memref.store"(%3, %5, %arg0) : (f32, memref<2xf32>, index) -> () loc("<stdin>":37:7)
      "memref.store"(%3, %6, %arg0) : (f32, memref<2xf32>, index) -> () loc("<stdin>":38:7)
      "scf.yield"() : () -> () loc("<stdin>":39:7)
    }) : (index, index, index) -> () loc("<stdin>":35:5)
    "func.call"(%5, %6) <{callee = @simple_add1_add2_test}> : (memref<2xf32>, memref<2xf32>) -> () loc("<stdin>":41:5)
    %7 = "memref.load"(%5, %1) : (memref<2xf32>, index) -> f32 loc("<stdin>":42:10)
    "func.call"(%7) <{callee = @printF32}> : (f32) -> () loc("<stdin>":43:5)
    "func.call"() <{callee = @printComma}> : () -> () loc("<stdin>":44:5)
    %8 = "memref.load"(%5, %2) : (memref<2xf32>, index) -> f32 loc("<stdin>":45:10)
    "func.call"(%8) <{callee = @printF32}> : (f32) -> () loc("<stdin>":46:5)
    "func.call"() <{callee = @printNewline}> : () -> () loc("<stdin>":47:5)
    %9 = "memref.load"(%6, %1) : (memref<2xf32>, index) -> f32 loc("<stdin>":48:10)
    "func.call"(%9) <{callee = @printF32}> : (f32) -> () loc("<stdin>":49:5)
    "func.call"() <{callee = @printComma}> : () -> () loc("<stdin>":50:5)
    %10 = "memref.load"(%6, %2) : (memref<2xf32>, index) -> f32 loc("<stdin>":51:11)
    "func.call"(%10) <{callee = @printF32}> : (f32) -> () loc("<stdin>":52:5)
    "func.call"() <{callee = @printNewline}> : () -> () loc("<stdin>":53:5)
    "memref.dealloc"(%5) : (memref<2xf32>) -> () loc("<stdin>":54:5)
    "memref.dealloc"(%6) : (memref<2xf32>) -> () loc("<stdin>":55:5)
    "func.return"() : () -> () loc("<stdin>":56:5)
  }) : () -> () loc("<stdin>":27:3)
}) : () -> () loc("<stdin>":1:1)
