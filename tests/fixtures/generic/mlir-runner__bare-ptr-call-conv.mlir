"builtin.module"() ({
  "func.func"() <{function_type = (memref<2xf32>, memref<2xf32>) -> (), sym_name = "simple_add1_add2_test"}> ({
  ^bb0(%arg1: memref<2xf32>, %arg2: memref<2xf32>):
    %11 = "arith.constant"() <{value = 2 : index}> : () -> index
    %12 = "arith.constant"() <{value = 0 : index}> : () -> index
    %13 = "arith.constant"() <{value = 1 : index}> : () -> index
    %14 = "arith.constant"() <{value = 1.000000e+00 : f32}> : () -> f32
    %15 = "arith.constant"() <{value = 2.000000e+00 : f32}> : () -> f32
    "scf.for"(%12, %11, %13) ({
    ^bb0(%arg3: index):
      %16 = "memref.load"(%arg1, %arg3) : (memref<2xf32>, index) -> f32
      %17 = "arith.addf"(%16, %14) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "memref.store"(%17, %arg1, %arg3) : (f32, memref<2xf32>, index) -> ()
      %18 = "memref.load"(%arg2, %arg3) : (memref<2xf32>, index) -> f32
      %19 = "arith.addf"(%17, %15) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "memref.store"(%19, %arg2, %arg3) : (f32, memref<2xf32>, index) -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (f32) -> (), sym_name = "printF32", sym_visibility = "private"}> ({
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "printComma", sym_visibility = "private"}> ({
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "printNewline", sym_visibility = "private"}> ({
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %0 = "arith.constant"() <{value = 2 : index}> : () -> index
    %1 = "arith.constant"() <{value = 0 : index}> : () -> index
    %2 = "arith.constant"() <{value = 1 : index}> : () -> index
    %3 = "arith.constant"() <{value = 1.000000e+00 : f32}> : () -> f32
    %4 = "arith.constant"() <{value = 2.000000e+00 : f32}> : () -> f32
    %5 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<2xf32>
    %6 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<2xf32>
    "scf.for"(%1, %0, %2) ({
    ^bb0(%arg0: index):
      "memref.store"(%3, %5, %arg0) : (f32, memref<2xf32>, index) -> ()
      "memref.store"(%3, %6, %arg0) : (f32, memref<2xf32>, index) -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    "func.call"(%5, %6) <{callee = @simple_add1_add2_test}> : (memref<2xf32>, memref<2xf32>) -> ()
    %7 = "memref.load"(%5, %1) : (memref<2xf32>, index) -> f32
    "func.call"(%7) <{callee = @printF32}> : (f32) -> ()
    "func.call"() <{callee = @printComma}> : () -> ()
    %8 = "memref.load"(%5, %2) : (memref<2xf32>, index) -> f32
    "func.call"(%8) <{callee = @printF32}> : (f32) -> ()
    "func.call"() <{callee = @printNewline}> : () -> ()
    %9 = "memref.load"(%6, %1) : (memref<2xf32>, index) -> f32
    "func.call"(%9) <{callee = @printF32}> : (f32) -> ()
    "func.call"() <{callee = @printComma}> : () -> ()
    %10 = "memref.load"(%6, %2) : (memref<2xf32>, index) -> f32
    "func.call"(%10) <{callee = @printF32}> : (f32) -> ()
    "func.call"() <{callee = @printNewline}> : () -> ()
    "memref.dealloc"(%5) : (memref<2xf32>) -> ()
    "memref.dealloc"(%6) : (memref<2xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

