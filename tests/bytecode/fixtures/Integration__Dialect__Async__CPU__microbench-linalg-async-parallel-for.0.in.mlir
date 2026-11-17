"builtin.module"() ({
  "func.func"() <{function_type = (memref<?x?xf32>, memref<?x?xf32>, memref<?x?xf32>) -> (), sym_name = "linalg_generic"}> ({
  ^bb0(%arg5: memref<?x?xf32> loc("<stdin>":4:8), %arg6: memref<?x?xf32> loc("<stdin>":4:32), %arg7: memref<?x?xf32> loc("<stdin>":4:56)):
    "linalg.generic"(%arg5, %arg6, %arg7) <{indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg8: f32 loc("<stdin>":6:10), %arg9: f32 loc("<stdin>":6:22), %arg10: f32 loc("<stdin>":6:34)):
      %21 = "arith.addf"(%arg8, %arg9) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":7:13)
      "linalg.yield"(%21) : (f32) -> () loc("<stdin>":8:7)
    }) : (memref<?x?xf32>, memref<?x?xf32>, memref<?x?xf32>) -> () loc("<stdin>":5:5)
    "func.return"() : () -> () loc("<stdin>":10:5)
  }) : () -> () loc("<stdin>":3:3)
  "func.func"() <{function_type = () -> (), sym_name = "entry"}> ({
    %0 = "arith.constant"() <{value = 1.000000e+00 : f32}> : () -> f32 loc("<stdin>":13:10)
    %1 = "arith.constant"() <{value = 4.000000e+00 : f32}> : () -> f32 loc("<stdin>":14:10)
    %2 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":15:10)
    %3 = "arith.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":16:10)
    %4 = "arith.constant"() <{value = 50 : index}> : () -> index loc("<stdin>":17:10)
    %5 = "memref.alloc"() <{alignment = 64 : i64, operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<1x10xf32> loc("<stdin>":18:10)
    %6 = "memref.alloc"() <{alignment = 64 : i64, operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<1x10xf32> loc("<stdin>":19:10)
    %7 = "memref.alloc"() <{alignment = 64 : i64, operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<1x10xf32> loc("<stdin>":20:10)
    "linalg.fill"(%0, %5) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg3: f32 loc("<stdin>":22:10), %arg4: f32 loc("<stdin>":22:22)):
      "linalg.yield"(%arg3) : (f32) -> () loc("<stdin>":23:7)
    }) : (f32, memref<1x10xf32>) -> () loc("<stdin>":21:5)
    "linalg.fill"(%0, %6) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg1: f32 loc("<stdin>":26:10), %arg2: f32 loc("<stdin>":26:22)):
      "linalg.yield"(%arg1) : (f32) -> () loc("<stdin>":27:7)
    }) : (f32, memref<1x10xf32>) -> () loc("<stdin>":25:5)
    %8 = "memref.cast"(%5) : (memref<1x10xf32>) -> memref<?x?xf32> loc("<stdin>":29:10)
    %9 = "memref.cast"(%6) : (memref<1x10xf32>) -> memref<?x?xf32> loc("<stdin>":30:10)
    %10 = "memref.cast"(%7) : (memref<1x10xf32>) -> memref<?x?xf32> loc("<stdin>":31:11)
    "func.call"(%8, %9, %10) <{callee = @linalg_generic}> : (memref<?x?xf32>, memref<?x?xf32>, memref<?x?xf32>) -> () loc("<stdin>":32:5)
    %11 = "memref.cast"(%7) : (memref<1x10xf32>) -> memref<*xf32> loc("<stdin>":33:11)
    "func.call"(%11) <{callee = @printMemrefF32}> : (memref<*xf32>) -> () loc("<stdin>":34:5)
    "memref.dealloc"(%5) : (memref<1x10xf32>) -> () loc("<stdin>":35:5)
    "memref.dealloc"(%6) : (memref<1x10xf32>) -> () loc("<stdin>":36:5)
    "memref.dealloc"(%7) : (memref<1x10xf32>) -> () loc("<stdin>":37:5)
    %12 = "memref.alloc"() <{alignment = 64 : i64, operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<1024x1024xf32> loc("<stdin>":38:11)
    %13 = "memref.alloc"() <{alignment = 64 : i64, operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<1024x1024xf32> loc("<stdin>":39:11)
    %14 = "memref.alloc"() <{alignment = 64 : i64, operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<1024x1024xf32> loc("<stdin>":40:11)
    %15 = "memref.cast"(%12) : (memref<1024x1024xf32>) -> memref<?x?xf32> loc("<stdin>":41:11)
    %16 = "memref.cast"(%13) : (memref<1024x1024xf32>) -> memref<?x?xf32> loc("<stdin>":42:11)
    %17 = "memref.cast"(%14) : (memref<1024x1024xf32>) -> memref<?x?xf32> loc("<stdin>":43:11)
    "func.call"(%15, %16, %17) <{callee = @linalg_generic}> : (memref<?x?xf32>, memref<?x?xf32>, memref<?x?xf32>) -> () loc("<stdin>":44:5)
    %18 = "func.call"() <{callee = @rtclock}> : () -> f64 loc("<stdin>":45:11)
    "scf.for"(%2, %4, %3) ({
    ^bb0(%arg0: index loc("<stdin>":47:10)):
      "func.call"(%15, %16, %17) <{callee = @linalg_generic}> : (memref<?x?xf32>, memref<?x?xf32>, memref<?x?xf32>) -> () loc("<stdin>":48:7)
      "scf.yield"() : () -> () loc("<stdin>":49:7)
    }) : (index, index, index) -> () loc("<stdin>":46:5)
    %19 = "func.call"() <{callee = @rtclock}> : () -> f64 loc("<stdin>":51:11)
    %20 = "arith.subf"(%19, %18) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64 loc("<stdin>":52:11)
    "vector.print"(%20) <{punctuation = #vector.punctuation<newline>}> : (f64) -> () loc("<stdin>":53:5)
    "memref.dealloc"(%12) : (memref<1024x1024xf32>) -> () loc("<stdin>":54:5)
    "memref.dealloc"(%13) : (memref<1024x1024xf32>) -> () loc("<stdin>":55:5)
    "memref.dealloc"(%14) : (memref<1024x1024xf32>) -> () loc("<stdin>":56:5)
    "func.return"() : () -> () loc("<stdin>":57:5)
  }) : () -> () loc("<stdin>":12:3)
  "func.func"() <{function_type = () -> f64, sym_name = "rtclock", sym_visibility = "private"}> ({
  }) : () -> () loc("<stdin>":59:3)
  "func.func"() <{function_type = (memref<*xf32>) -> (), sym_name = "printMemrefF32", sym_visibility = "private"}> ({
  }) {llvm.emit_c_interface} : () -> () loc("<stdin>":61:3)
}) : () -> () loc("<stdin>":2:1)
