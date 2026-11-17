"builtin.module"() ({
  "func.func"() <{function_type = (memref<?x?xf32>, memref<?x?xf32>, memref<?x?xf32>) -> (), sym_name = "scf_parallel"}> ({
  ^bb0(%arg5: memref<?x?xf32> loc("<stdin>":3:8), %arg6: memref<?x?xf32> loc("<stdin>":3:32), %arg7: memref<?x?xf32> loc("<stdin>":3:56)):
    %21 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":4:11)
    %22 = "arith.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":5:11)
    %23 = "memref.dim"(%arg5, %21) : (memref<?x?xf32>, index) -> index loc("<stdin>":6:11)
    %24 = "memref.dim"(%arg5, %22) : (memref<?x?xf32>, index) -> index loc("<stdin>":7:11)
    "scf.parallel"(%21, %21, %23, %24, %22, %22) <{operandSegmentSizes = array<i32: 2, 2, 2, 0>}> ({
    ^bb0(%arg8: index loc("<stdin>":9:10), %arg9: index loc("<stdin>":9:24)):
      %25 = "memref.load"(%arg5, %arg8, %arg9) : (memref<?x?xf32>, index, index) -> f32 loc("<stdin>":10:13)
      %26 = "memref.load"(%arg5, %arg8, %arg9) : (memref<?x?xf32>, index, index) -> f32 loc("<stdin>":11:13)
      %27 = "arith.addf"(%25, %26) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":12:13)
      "memref.store"(%27, %arg7, %arg8, %arg9) : (f32, memref<?x?xf32>, index, index) -> () loc("<stdin>":13:7)
      "scf.reduce"() : () -> () loc("<stdin>":14:7)
    }) : (index, index, index, index, index, index) -> () loc("<stdin>":8:5)
    "func.return"() : () -> () loc("<stdin>":16:5)
  }) : () -> () loc("<stdin>":2:3)
  "func.func"() <{function_type = () -> (), sym_name = "entry"}> ({
    %0 = "arith.constant"() <{value = 1.000000e+00 : f32}> : () -> f32 loc("<stdin>":19:10)
    %1 = "arith.constant"() <{value = 4.000000e+00 : f32}> : () -> f32 loc("<stdin>":20:10)
    %2 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":21:10)
    %3 = "arith.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":22:10)
    %4 = "arith.constant"() <{value = 50 : index}> : () -> index loc("<stdin>":23:10)
    %5 = "memref.alloc"() <{alignment = 64 : i64, operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<1x10xf32> loc("<stdin>":24:10)
    %6 = "memref.alloc"() <{alignment = 64 : i64, operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<1x10xf32> loc("<stdin>":25:10)
    %7 = "memref.alloc"() <{alignment = 64 : i64, operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<1x10xf32> loc("<stdin>":26:10)
    "linalg.fill"(%0, %5) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg3: f32 loc("<stdin>":28:10), %arg4: f32 loc("<stdin>":28:22)):
      "linalg.yield"(%arg3) : (f32) -> () loc("<stdin>":29:7)
    }) : (f32, memref<1x10xf32>) -> () loc("<stdin>":27:5)
    "linalg.fill"(%0, %6) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg1: f32 loc("<stdin>":32:10), %arg2: f32 loc("<stdin>":32:22)):
      "linalg.yield"(%arg1) : (f32) -> () loc("<stdin>":33:7)
    }) : (f32, memref<1x10xf32>) -> () loc("<stdin>":31:5)
    %8 = "memref.cast"(%5) : (memref<1x10xf32>) -> memref<?x?xf32> loc("<stdin>":35:10)
    %9 = "memref.cast"(%6) : (memref<1x10xf32>) -> memref<?x?xf32> loc("<stdin>":36:10)
    %10 = "memref.cast"(%7) : (memref<1x10xf32>) -> memref<?x?xf32> loc("<stdin>":37:11)
    "func.call"(%8, %9, %10) <{callee = @scf_parallel}> : (memref<?x?xf32>, memref<?x?xf32>, memref<?x?xf32>) -> () loc("<stdin>":38:5)
    %11 = "memref.cast"(%7) : (memref<1x10xf32>) -> memref<*xf32> loc("<stdin>":39:11)
    "func.call"(%11) <{callee = @printMemrefF32}> : (memref<*xf32>) -> () loc("<stdin>":40:5)
    "memref.dealloc"(%5) : (memref<1x10xf32>) -> () loc("<stdin>":41:5)
    "memref.dealloc"(%6) : (memref<1x10xf32>) -> () loc("<stdin>":42:5)
    "memref.dealloc"(%7) : (memref<1x10xf32>) -> () loc("<stdin>":43:5)
    %12 = "memref.alloc"() <{alignment = 64 : i64, operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<1024x1024xf32> loc("<stdin>":44:11)
    %13 = "memref.alloc"() <{alignment = 64 : i64, operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<1024x1024xf32> loc("<stdin>":45:11)
    %14 = "memref.alloc"() <{alignment = 64 : i64, operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<1024x1024xf32> loc("<stdin>":46:11)
    %15 = "memref.cast"(%12) : (memref<1024x1024xf32>) -> memref<?x?xf32> loc("<stdin>":47:11)
    %16 = "memref.cast"(%13) : (memref<1024x1024xf32>) -> memref<?x?xf32> loc("<stdin>":48:11)
    %17 = "memref.cast"(%14) : (memref<1024x1024xf32>) -> memref<?x?xf32> loc("<stdin>":49:11)
    "func.call"(%15, %16, %17) <{callee = @scf_parallel}> : (memref<?x?xf32>, memref<?x?xf32>, memref<?x?xf32>) -> () loc("<stdin>":50:5)
    %18 = "func.call"() <{callee = @rtclock}> : () -> f64 loc("<stdin>":51:11)
    "scf.for"(%2, %4, %3) ({
    ^bb0(%arg0: index loc("<stdin>":53:10)):
      "func.call"(%15, %16, %17) <{callee = @scf_parallel}> : (memref<?x?xf32>, memref<?x?xf32>, memref<?x?xf32>) -> () loc("<stdin>":54:7)
      "scf.yield"() : () -> () loc("<stdin>":55:7)
    }) : (index, index, index) -> () loc("<stdin>":52:5)
    %19 = "func.call"() <{callee = @rtclock}> : () -> f64 loc("<stdin>":57:11)
    %20 = "arith.subf"(%19, %18) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64 loc("<stdin>":58:11)
    "vector.print"(%20) <{punctuation = #vector.punctuation<newline>}> : (f64) -> () loc("<stdin>":59:5)
    "memref.dealloc"(%12) : (memref<1024x1024xf32>) -> () loc("<stdin>":60:5)
    "memref.dealloc"(%13) : (memref<1024x1024xf32>) -> () loc("<stdin>":61:5)
    "memref.dealloc"(%14) : (memref<1024x1024xf32>) -> () loc("<stdin>":62:5)
    "func.return"() : () -> () loc("<stdin>":63:5)
  }) : () -> () loc("<stdin>":18:3)
  "func.func"() <{function_type = () -> f64, sym_name = "rtclock", sym_visibility = "private"}> ({
  }) : () -> () loc("<stdin>":65:3)
  "func.func"() <{function_type = (memref<*xf32>) -> (), sym_name = "printMemrefF32", sym_visibility = "private"}> ({
  }) {llvm.emit_c_interface} : () -> () loc("<stdin>":67:3)
}) : () -> () loc("<stdin>":1:1)
