"builtin.module"() ({
  "func.func"() <{function_type = (memref<*xf32>) -> (), sym_name = "printMemrefF32", sym_visibility = "private"}> ({
  }) : () -> () loc("<stdin>":8:3)
  "func.func"() <{function_type = (memref<?x?xf32>, memref<?x?xf32>) -> memref<?x?xf32>, sym_name = "matmul"}> ({
  ^bb0(%arg14: memref<?x?xf32> loc("<stdin>":11:8), %arg15: memref<?x?xf32> loc("<stdin>":11:33)):
    %26 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":12:11)
    %27 = "arith.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":13:11)
    %28 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32 loc("<stdin>":14:11)
    %29 = "memref.dim"(%arg14, %26) : (memref<?x?xf32>, index) -> index loc("<stdin>":15:11)
    %30 = "memref.dim"(%arg15, %27) : (memref<?x?xf32>, index) -> index loc("<stdin>":16:11)
    %31 = "memref.alloc"(%29, %30) <{operandSegmentSizes = array<i32: 2, 0>}> : (index, index) -> memref<?x?xf32> loc("<stdin>":17:11)
    "linalg.fill"(%28, %31) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg19: f32 loc("<stdin>":19:10), %arg20: f32 loc("<stdin>":19:23)):
      "linalg.yield"(%arg19) : (f32) -> () loc("<stdin>":20:7)
    }) : (f32, memref<?x?xf32>) -> () loc("<stdin>":18:5)
    "linalg.matmul"(%arg14, %arg15, %31) <{indexing_maps = [affine_map<(d0, d1, d2) -> (d0, d2)>, affine_map<(d0, d1, d2) -> (d2, d1)>, affine_map<(d0, d1, d2) -> (d0, d1)>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg16: f32 loc("<stdin>":23:10), %arg17: f32 loc("<stdin>":23:23), %arg18: f32 loc("<stdin>":23:36)):
      %32 = "arith.mulf"(%arg16, %arg17) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":24:13)
      %33 = "arith.addf"(%arg18, %32) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":25:13)
      "linalg.yield"(%33) : (f32) -> () loc("<stdin>":26:7)
    }) : (memref<?x?xf32>, memref<?x?xf32>, memref<?x?xf32>) -> () loc("<stdin>":22:5)
    "func.return"(%31) : (memref<?x?xf32>) -> () loc("<stdin>":28:5)
  }) : () -> () loc("<stdin>":10:3)
  "func.func"() <{function_type = (memref<?x?xf32>, memref<?x?xf32>) -> memref<?x?xf32>, sym_name = "matvec"}> ({
  ^bb0(%arg6: memref<?x?xf32> loc("<stdin>":31:8), %arg7: memref<?x?xf32> loc("<stdin>":31:32)):
    %15 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":32:11)
    %16 = "arith.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":33:11)
    %17 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32 loc("<stdin>":34:11)
    %18 = "memref.dim"(%arg6, %15) : (memref<?x?xf32>, index) -> index loc("<stdin>":35:11)
    %19 = "memref.dim"(%arg6, %16) : (memref<?x?xf32>, index) -> index loc("<stdin>":36:11)
    %20 = "memref.dim"(%arg7, %16) : (memref<?x?xf32>, index) -> index loc("<stdin>":37:11)
    %21 = "memref.alloc"(%18, %20) <{operandSegmentSizes = array<i32: 2, 0>}> : (index, index) -> memref<?x?xf32> loc("<stdin>":38:11)
    "linalg.fill"(%17, %21) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg12: f32 loc("<stdin>":40:10), %arg13: f32 loc("<stdin>":40:23)):
      "linalg.yield"(%arg12) : (f32) -> () loc("<stdin>":41:7)
    }) : (f32, memref<?x?xf32>) -> () loc("<stdin>":39:5)
    "scf.for"(%15, %20, %16) ({
    ^bb0(%arg8: index loc("<stdin>":44:10)):
      %22 = "memref.subview"(%arg7, %arg8, %19) <{operandSegmentSizes = array<i32: 1, 1, 1, 0>, static_offsets = array<i64: 0, -9223372036854775808>, static_sizes = array<i64: -9223372036854775808, 1>, static_strides = array<i64: 1, 1>}> : (memref<?x?xf32>, index, index) -> memref<?xf32, strided<[?], offset: ?>> loc("<stdin>":45:13)
      %23 = "memref.subview"(%21, %arg8, %18) <{operandSegmentSizes = array<i32: 1, 1, 1, 0>, static_offsets = array<i64: 0, -9223372036854775808>, static_sizes = array<i64: -9223372036854775808, 1>, static_strides = array<i64: 1, 1>}> : (memref<?x?xf32>, index, index) -> memref<?xf32, strided<[?], offset: ?>> loc("<stdin>":46:13)
      "linalg.matvec"(%arg6, %22, %23) <{operandSegmentSizes = array<i32: 2, 1>}> ({
      ^bb0(%arg9: f32 loc("<stdin>":48:12), %arg10: f32 loc("<stdin>":48:24), %arg11: f32 loc("<stdin>":48:37)):
        %24 = "arith.mulf"(%arg9, %arg10) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":49:15)
        %25 = "arith.addf"(%arg11, %24) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":50:15)
        "linalg.yield"(%25) : (f32) -> () loc("<stdin>":51:9)
      }) {linalg.memoized_indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d1)>, affine_map<(d0, d1) -> (d0)>]} : (memref<?x?xf32>, memref<?xf32, strided<[?], offset: ?>>, memref<?xf32, strided<[?], offset: ?>>) -> () loc("<stdin>":47:7)
      "scf.yield"() : () -> () loc("<stdin>":53:7)
    }) : (index, index, index) -> () loc("<stdin>":43:5)
    "func.return"(%21) : (memref<?x?xf32>) -> () loc("<stdin>":55:5)
  }) : () -> () loc("<stdin>":30:3)
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":58:10)
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":59:10)
    %2 = "arith.constant"() <{value = 5 : index}> : () -> index loc("<stdin>":60:10)
    %3 = "arith.constant"() <{value = 3 : index}> : () -> index loc("<stdin>":61:10)
    %4 = "arith.constant"() <{value = 2 : index}> : () -> index loc("<stdin>":62:10)
    %5 = "arith.constant"() <{value = 1.300000e+01 : f32}> : () -> f32 loc("<stdin>":63:10)
    %6 = "arith.constant"() <{value = 1.700000e+01 : f32}> : () -> f32 loc("<stdin>":64:10)
    %7 = "memref.alloc"(%2, %3) <{operandSegmentSizes = array<i32: 2, 0>}> : (index, index) -> memref<?x?xf32> loc("<stdin>":65:10)
    %8 = "memref.alloc"(%3, %4) <{operandSegmentSizes = array<i32: 2, 0>}> : (index, index) -> memref<?x?xf32> loc("<stdin>":66:10)
    "linalg.fill"(%5, %7) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg4: f32 loc("<stdin>":68:10), %arg5: f32 loc("<stdin>":68:22)):
      "linalg.yield"(%arg4) : (f32) -> () loc("<stdin>":69:7)
    }) : (f32, memref<?x?xf32>) -> () loc("<stdin>":67:5)
    "linalg.fill"(%6, %8) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg2: f32 loc("<stdin>":72:10), %arg3: f32 loc("<stdin>":72:22)):
      "linalg.yield"(%arg2) : (f32) -> () loc("<stdin>":73:7)
    }) : (f32, memref<?x?xf32>) -> () loc("<stdin>":71:5)
    "memref.store"(%5, %8, %0, %0) : (f32, memref<?x?xf32>, index, index) -> () loc("<stdin>":75:5)
    %9 = "func.call"(%7, %8) <{callee = @matmul}> : (memref<?x?xf32>, memref<?x?xf32>) -> memref<?x?xf32> loc("<stdin>":76:10)
    %10 = "func.call"(%7, %8) <{callee = @matvec}> : (memref<?x?xf32>, memref<?x?xf32>) -> memref<?x?xf32> loc("<stdin>":77:11)
    "scf.for"(%0, %2, %1) ({
    ^bb0(%arg0: index loc("<stdin>":79:10)):
      "scf.for"(%0, %4, %1) ({
      ^bb0(%arg1: index loc("<stdin>":81:12)):
        %12 = "memref.load"(%9, %arg0, %arg1) : (memref<?x?xf32>, index, index) -> f32 loc("<stdin>":82:15)
        %13 = "memref.load"(%10, %arg0, %arg1) : (memref<?x?xf32>, index, index) -> f32 loc("<stdin>":83:15)
        %14 = "arith.cmpf"(%12, %13) <{fastmath = #arith.fastmath<none>, predicate = 1 : i64}> : (f32, f32) -> i1 loc("<stdin>":84:15)
        "cf.assert"(%14) <{msg = "Matmul does not produce same output as matvec"}> : (i1) -> () loc("<stdin>":85:9)
        "scf.yield"() : () -> () loc("<stdin>":86:9)
      }) : (index, index, index) -> () loc("<stdin>":80:7)
      "scf.yield"() : () -> () loc("<stdin>":88:7)
    }) : (index, index, index) -> () loc("<stdin>":78:5)
    %11 = "memref.cast"(%10) : (memref<?x?xf32>) -> memref<*xf32> loc("<stdin>":90:11)
    "func.call"(%11) <{callee = @printMemrefF32}> : (memref<*xf32>) -> () loc("<stdin>":91:5)
    "memref.dealloc"(%9) : (memref<?x?xf32>) -> () loc("<stdin>":92:5)
    "memref.dealloc"(%10) : (memref<?x?xf32>) -> () loc("<stdin>":93:5)
    "func.return"() : () -> () loc("<stdin>":94:5)
  }) : () -> () loc("<stdin>":57:3)
}) : () -> () loc("<stdin>":7:1)
