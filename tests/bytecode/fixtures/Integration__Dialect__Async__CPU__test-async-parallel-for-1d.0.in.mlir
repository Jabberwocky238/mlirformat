"builtin.module"() ({
  "func.func"() <{function_type = () -> index, sym_name = "zero", sym_visibility = "private"}> ({
    %27 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":3:11)
    "func.return"(%27) : (index) -> () loc("<stdin>":4:5)
  }) : () -> () loc("<stdin>":2:3)
  "func.func"() <{function_type = () -> (), sym_name = "entry"}> ({
    %0 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32 loc("<stdin>":7:10)
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":8:10)
    %2 = "arith.constant"() <{value = 2 : index}> : () -> index loc("<stdin>":9:10)
    %3 = "arith.constant"() <{value = 3 : index}> : () -> index loc("<stdin>":10:10)
    %4 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":11:10)
    %5 = "arith.constant"() <{value = 9 : index}> : () -> index loc("<stdin>":12:10)
    %6 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<9xf32> loc("<stdin>":13:10)
    %7 = "memref.cast"(%6) : (memref<9xf32>) -> memref<*xf32> loc("<stdin>":14:10)
    "scf.parallel"(%4, %5, %1) <{operandSegmentSizes = array<i32: 1, 1, 1, 0>}> ({
    ^bb0(%arg6: index loc("<stdin>":16:10)):
      "memref.store"(%0, %6, %arg6) : (f32, memref<9xf32>, index) -> () loc("<stdin>":17:7)
      "scf.reduce"() : () -> () loc("<stdin>":18:7)
    }) : (index, index, index) -> () loc("<stdin>":15:5)
    "scf.parallel"(%4, %5, %1) <{operandSegmentSizes = array<i32: 1, 1, 1, 0>}> ({
    ^bb0(%arg5: index loc("<stdin>":21:10)):
      %23 = "arith.index_cast"(%arg5) : (index) -> i32 loc("<stdin>":22:13)
      %24 = "arith.sitofp"(%23) : (i32) -> f32 loc("<stdin>":23:13)
      %25 = "memref.load"(%6, %arg5) : (memref<9xf32>, index) -> f32 loc("<stdin>":24:13)
      %26 = "arith.addf"(%24, %25) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":25:13)
      "memref.store"(%26, %6, %arg5) : (f32, memref<9xf32>, index) -> () loc("<stdin>":26:7)
      "scf.reduce"() : () -> () loc("<stdin>":27:7)
    }) : (index, index, index) -> () loc("<stdin>":20:5)
    "func.call"(%7) <{callee = @printMemrefF32}> : (memref<*xf32>) -> () loc("<stdin>":29:5)
    "scf.parallel"(%4, %5, %1) <{operandSegmentSizes = array<i32: 1, 1, 1, 0>}> ({
    ^bb0(%arg4: index loc("<stdin>":31:10)):
      "memref.store"(%0, %6, %arg4) : (f32, memref<9xf32>, index) -> () loc("<stdin>":32:7)
      "scf.reduce"() : () -> () loc("<stdin>":33:7)
    }) : (index, index, index) -> () loc("<stdin>":30:5)
    "scf.parallel"(%4, %5, %2) <{operandSegmentSizes = array<i32: 1, 1, 1, 0>}> ({
    ^bb0(%arg3: index loc("<stdin>":36:10)):
      %19 = "arith.index_cast"(%arg3) : (index) -> i32 loc("<stdin>":37:13)
      %20 = "arith.sitofp"(%19) : (i32) -> f32 loc("<stdin>":38:13)
      %21 = "memref.load"(%6, %arg3) : (memref<9xf32>, index) -> f32 loc("<stdin>":39:13)
      %22 = "arith.addf"(%20, %21) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":40:13)
      "memref.store"(%22, %6, %arg3) : (f32, memref<9xf32>, index) -> () loc("<stdin>":41:7)
      "scf.reduce"() : () -> () loc("<stdin>":42:7)
    }) : (index, index, index) -> () loc("<stdin>":35:5)
    "func.call"(%7) <{callee = @printMemrefF32}> : (memref<*xf32>) -> () loc("<stdin>":44:5)
    "scf.parallel"(%4, %5, %1) <{operandSegmentSizes = array<i32: 1, 1, 1, 0>}> ({
    ^bb0(%arg2: index loc("<stdin>":46:10)):
      "memref.store"(%0, %6, %arg2) : (f32, memref<9xf32>, index) -> () loc("<stdin>":47:7)
      "scf.reduce"() : () -> () loc("<stdin>":48:7)
    }) : (index, index, index) -> () loc("<stdin>":45:5)
    %8 = "arith.constant"() <{value = -20 : index}> : () -> index loc("<stdin>":50:10)
    %9 = "arith.constant"() <{value = -11 : index}> : () -> index loc("<stdin>":51:10)
    "scf.parallel"(%8, %9, %3) <{operandSegmentSizes = array<i32: 1, 1, 1, 0>}> ({
    ^bb0(%arg1: index loc("<stdin>":53:10)):
      %13 = "arith.index_cast"(%arg1) : (index) -> i32 loc("<stdin>":54:13)
      %14 = "arith.sitofp"(%13) : (i32) -> f32 loc("<stdin>":55:13)
      %15 = "arith.constant"() <{value = 20 : index}> : () -> index loc("<stdin>":56:13)
      %16 = "arith.addi"(%arg1, %15) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index loc("<stdin>":57:13)
      %17 = "memref.load"(%6, %16) : (memref<9xf32>, index) -> f32 loc("<stdin>":58:13)
      %18 = "arith.addf"(%14, %17) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":59:13)
      "memref.store"(%18, %6, %16) : (f32, memref<9xf32>, index) -> () loc("<stdin>":60:7)
      "scf.reduce"() : () -> () loc("<stdin>":61:7)
    }) : (index, index, index) -> () loc("<stdin>":52:5)
    "func.call"(%7) <{callee = @printMemrefF32}> : (memref<*xf32>) -> () loc("<stdin>":63:5)
    %10 = "func.call"() <{callee = @zero}> : () -> index loc("<stdin>":64:11)
    %11 = "func.call"() <{callee = @zero}> : () -> index loc("<stdin>":65:11)
    "scf.parallel"(%10, %11, %1) <{operandSegmentSizes = array<i32: 1, 1, 1, 0>}> ({
    ^bb0(%arg0: index loc("<stdin>":67:10)):
      %12 = "arith.constant"() <{value = false}> : () -> i1 loc("<stdin>":68:13)
      "cf.assert"(%12) <{msg = "should never be executed"}> : (i1) -> () loc("<stdin>":69:7)
      "scf.reduce"() : () -> () loc("<stdin>":70:7)
    }) : (index, index, index) -> () loc("<stdin>":66:5)
    "memref.dealloc"(%6) : (memref<9xf32>) -> () loc("<stdin>":72:5)
    "func.return"() : () -> () loc("<stdin>":73:5)
  }) : () -> () loc("<stdin>":6:3)
  "func.func"() <{function_type = (memref<*xf32>) -> (), sym_name = "printMemrefF32", sym_visibility = "private"}> ({
  }) {llvm.emit_c_interface} : () -> () loc("<stdin>":75:3)
}) : () -> () loc("<stdin>":1:1)
