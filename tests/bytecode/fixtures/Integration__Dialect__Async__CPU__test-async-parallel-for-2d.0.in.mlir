"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "entry"}> ({
    %0 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32 loc("<stdin>":3:10)
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":4:10)
    %2 = "arith.constant"() <{value = 2 : index}> : () -> index loc("<stdin>":5:10)
    %3 = "arith.constant"() <{value = 8 : index}> : () -> index loc("<stdin>":6:10)
    %4 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":7:10)
    %5 = "arith.constant"() <{value = 8 : index}> : () -> index loc("<stdin>":8:10)
    %6 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<8x8xf32> loc("<stdin>":9:10)
    %7 = "memref.cast"(%6) : (memref<8x8xf32>) -> memref<*xf32> loc("<stdin>":10:10)
    "scf.parallel"(%4, %4, %5, %5, %1, %1) <{operandSegmentSizes = array<i32: 2, 2, 2, 0>}> ({
    ^bb0(%arg10: index loc("<stdin>":12:10), %arg11: index loc("<stdin>":12:25)):
      "memref.store"(%0, %6, %arg10, %arg11) : (f32, memref<8x8xf32>, index, index) -> () loc("<stdin>":13:7)
      "scf.reduce"() : () -> () loc("<stdin>":14:7)
    }) : (index, index, index, index, index, index) -> () loc("<stdin>":11:5)
    "scf.parallel"(%4, %4, %5, %5, %1, %1) <{operandSegmentSizes = array<i32: 2, 2, 2, 0>}> ({
    ^bb0(%arg8: index loc("<stdin>":17:10), %arg9: index loc("<stdin>":17:24)):
      %20 = "arith.muli"(%arg8, %3) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index loc("<stdin>":18:13)
      %21 = "arith.addi"(%arg9, %20) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index loc("<stdin>":19:13)
      %22 = "arith.index_cast"(%21) : (index) -> i32 loc("<stdin>":20:13)
      %23 = "arith.sitofp"(%22) : (i32) -> f32 loc("<stdin>":21:13)
      %24 = "memref.load"(%6, %arg8, %arg9) : (memref<8x8xf32>, index, index) -> f32 loc("<stdin>":22:13)
      %25 = "arith.addf"(%23, %24) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":23:13)
      "memref.store"(%25, %6, %arg8, %arg9) : (f32, memref<8x8xf32>, index, index) -> () loc("<stdin>":24:7)
      "scf.reduce"() : () -> () loc("<stdin>":25:7)
    }) : (index, index, index, index, index, index) -> () loc("<stdin>":16:5)
    "func.call"(%7) <{callee = @printMemrefF32}> : (memref<*xf32>) -> () loc("<stdin>":27:5)
    "scf.parallel"(%4, %4, %5, %5, %1, %1) <{operandSegmentSizes = array<i32: 2, 2, 2, 0>}> ({
    ^bb0(%arg6: index loc("<stdin>":29:10), %arg7: index loc("<stdin>":29:24)):
      "memref.store"(%0, %6, %arg6, %arg7) : (f32, memref<8x8xf32>, index, index) -> () loc("<stdin>":30:7)
      "scf.reduce"() : () -> () loc("<stdin>":31:7)
    }) : (index, index, index, index, index, index) -> () loc("<stdin>":28:5)
    "scf.parallel"(%4, %4, %5, %5, %2, %1) <{operandSegmentSizes = array<i32: 2, 2, 2, 0>}> ({
    ^bb0(%arg4: index loc("<stdin>":34:10), %arg5: index loc("<stdin>":34:24)):
      %14 = "arith.muli"(%arg4, %3) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index loc("<stdin>":35:13)
      %15 = "arith.addi"(%arg5, %14) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index loc("<stdin>":36:13)
      %16 = "arith.index_cast"(%15) : (index) -> i32 loc("<stdin>":37:13)
      %17 = "arith.sitofp"(%16) : (i32) -> f32 loc("<stdin>":38:13)
      %18 = "memref.load"(%6, %arg4, %arg5) : (memref<8x8xf32>, index, index) -> f32 loc("<stdin>":39:13)
      %19 = "arith.addf"(%17, %18) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":40:13)
      "memref.store"(%19, %6, %arg4, %arg5) : (f32, memref<8x8xf32>, index, index) -> () loc("<stdin>":41:7)
      "scf.reduce"() : () -> () loc("<stdin>":42:7)
    }) : (index, index, index, index, index, index) -> () loc("<stdin>":33:5)
    "func.call"(%7) <{callee = @printMemrefF32}> : (memref<*xf32>) -> () loc("<stdin>":44:5)
    "scf.parallel"(%4, %4, %5, %5, %1, %1) <{operandSegmentSizes = array<i32: 2, 2, 2, 0>}> ({
    ^bb0(%arg2: index loc("<stdin>":46:10), %arg3: index loc("<stdin>":46:24)):
      "memref.store"(%0, %6, %arg2, %arg3) : (f32, memref<8x8xf32>, index, index) -> () loc("<stdin>":47:7)
      "scf.reduce"() : () -> () loc("<stdin>":48:7)
    }) : (index, index, index, index, index, index) -> () loc("<stdin>":45:5)
    "scf.parallel"(%4, %4, %5, %5, %1, %2) <{operandSegmentSizes = array<i32: 2, 2, 2, 0>}> ({
    ^bb0(%arg0: index loc("<stdin>":51:10), %arg1: index loc("<stdin>":51:24)):
      %8 = "arith.muli"(%arg0, %3) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index loc("<stdin>":52:12)
      %9 = "arith.addi"(%arg1, %8) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index loc("<stdin>":53:12)
      %10 = "arith.index_cast"(%9) : (index) -> i32 loc("<stdin>":54:13)
      %11 = "arith.sitofp"(%10) : (i32) -> f32 loc("<stdin>":55:13)
      %12 = "memref.load"(%6, %arg0, %arg1) : (memref<8x8xf32>, index, index) -> f32 loc("<stdin>":56:13)
      %13 = "arith.addf"(%11, %12) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":57:13)
      "memref.store"(%13, %6, %arg0, %arg1) : (f32, memref<8x8xf32>, index, index) -> () loc("<stdin>":58:7)
      "scf.reduce"() : () -> () loc("<stdin>":59:7)
    }) : (index, index, index, index, index, index) -> () loc("<stdin>":50:5)
    "func.call"(%7) <{callee = @printMemrefF32}> : (memref<*xf32>) -> () loc("<stdin>":61:5)
    "memref.dealloc"(%6) : (memref<8x8xf32>) -> () loc("<stdin>":62:5)
    "func.return"() : () -> () loc("<stdin>":63:5)
  }) : () -> () loc("<stdin>":2:3)
  "func.func"() <{function_type = (memref<*xf32>) -> (), sym_name = "printMemrefF32", sym_visibility = "private"}> ({
  }) {llvm.emit_c_interface} : () -> () loc("<stdin>":65:3)
}) : () -> () loc("<stdin>":1:1)
