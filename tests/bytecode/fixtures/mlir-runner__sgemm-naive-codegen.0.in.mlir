"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %9 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<16x16xf32> loc("<stdin>":9:10)
    %10 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<16x16xf32> loc("<stdin>":10:11)
    %11 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<16x16xf32> loc("<stdin>":11:11)
    %12 = "arith.constant"() <{value = 1.000000e+00 : f32}> : () -> f32 loc("<stdin>":12:11)
    "linalg.fill"(%12, %9) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg11: f32 loc("<stdin>":14:10), %arg12: f32 loc("<stdin>":14:23)):
      "linalg.yield"(%arg11) : (f32) -> () loc("<stdin>":15:7)
    }) : (f32, memref<16x16xf32>) -> () loc("<stdin>":13:5)
    "linalg.fill"(%12, %10) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg9: f32 loc("<stdin>":18:10), %arg10: f32 loc("<stdin>":18:22)):
      "linalg.yield"(%arg9) : (f32) -> () loc("<stdin>":19:7)
    }) : (f32, memref<16x16xf32>) -> () loc("<stdin>":17:5)
    %13 = "arith.constant"() <{value = 5 : index}> : () -> index loc("<stdin>":21:11)
    %14 = "func.call"() <{callee = @rtclock}> : () -> f64 loc("<stdin>":22:11)
    "affine.for"(%13) <{lowerBoundMap = affine_map<() -> (0)>, operandSegmentSizes = array<i32: 0, 1, 0>, step = 1 : index, upperBoundMap = affine_map<()[s0] -> (s0)>}> ({
    ^bb0(%arg6: index loc("<stdin>":24:10)):
      "linalg.fill"(%12, %11) <{operandSegmentSizes = array<i32: 1, 1>}> ({
      ^bb0(%arg7: f32 loc("<stdin>":26:12), %arg8: f32 loc("<stdin>":26:24)):
        "linalg.yield"(%arg7) : (f32) -> () loc("<stdin>":27:9)
      }) : (f32, memref<16x16xf32>) -> () loc("<stdin>":25:7)
      "func.call"(%9, %10, %11) <{callee = @sgemm_naive}> : (memref<16x16xf32>, memref<16x16xf32>, memref<16x16xf32>) -> () loc("<stdin>":29:7)
      "affine.yield"() : () -> () loc("<stdin>":30:7)
    }) : (index) -> () loc("<stdin>":23:5)
    %15 = "func.call"() <{callee = @rtclock}> : () -> f64 loc("<stdin>":32:11)
    %16 = "arith.subf"(%15, %14) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64 loc("<stdin>":33:11)
    %17 = "affine.load"(%11) <{map = affine_map<() -> (0, 0)>}> : (memref<16x16xf32>) -> f32 loc("<stdin>":34:11)
    "vector.print"(%17) <{punctuation = #vector.punctuation<newline>}> : (f32) -> () loc("<stdin>":35:5)
    %18 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":36:11)
    %19 = "arith.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":37:11)
    %20 = "arith.constant"() <{value = 2 : index}> : () -> index loc("<stdin>":38:11)
    %21 = "memref.dim"(%11, %18) : (memref<16x16xf32>, index) -> index loc("<stdin>":39:11)
    %22 = "memref.dim"(%11, %19) : (memref<16x16xf32>, index) -> index loc("<stdin>":40:11)
    %23 = "memref.dim"(%9, %19) : (memref<16x16xf32>, index) -> index loc("<stdin>":41:11)
    %24 = "arith.muli"(%21, %22) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index loc("<stdin>":42:11)
    %25 = "arith.muli"(%24, %23) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index loc("<stdin>":43:11)
    %26 = "arith.muli"(%20, %25) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index loc("<stdin>":44:11)
    %27 = "arith.muli"(%26, %13) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index loc("<stdin>":45:11)
    %28 = "arith.index_cast"(%27) : (index) -> i16 loc("<stdin>":46:11)
    %29 = "arith.uitofp"(%28) : (i16) -> f64 loc("<stdin>":47:11)
    %30 = "arith.divf"(%29, %16) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64 loc("<stdin>":48:11)
    "func.call"(%30) <{callee = @printFlops}> : (f64) -> () loc("<stdin>":49:5)
    "memref.dealloc"(%9) : (memref<16x16xf32>) -> () loc("<stdin>":50:5)
    "memref.dealloc"(%10) : (memref<16x16xf32>) -> () loc("<stdin>":51:5)
    "memref.dealloc"(%11) : (memref<16x16xf32>) -> () loc("<stdin>":52:5)
    "func.return"() : () -> () loc("<stdin>":53:5)
  }) : () -> () loc("<stdin>":8:3)
  "func.func"() <{function_type = (memref<16x16xf32>, memref<16x16xf32>, memref<16x16xf32>) -> (), sym_name = "sgemm_naive"}> ({
  ^bb0(%arg0: memref<16x16xf32> loc("<stdin>":56:8), %arg1: memref<16x16xf32> loc("<stdin>":56:34), %arg2: memref<16x16xf32> loc("<stdin>":56:60)):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":57:10)
    "affine.for"() <{lowerBoundMap = affine_map<() -> (0)>, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = affine_map<() -> (16)>}> ({
    ^bb0(%arg3: index loc("<stdin>":59:10)):
      "affine.for"() <{lowerBoundMap = affine_map<() -> (0)>, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = affine_map<() -> (16)>}> ({
      ^bb0(%arg4: index loc("<stdin>":61:12)):
        %1 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<1xf32> loc("<stdin>":62:14)
        %2 = "affine.load"(%arg2, %arg3, %arg4) <{map = affine_map<(d0, d1) -> (d0, d1)>}> : (memref<16x16xf32>, index, index) -> f32 loc("<stdin>":63:14)
        "affine.store"(%2, %1, %0) <{map = affine_map<(d0) -> (d0)>}> : (f32, memref<1xf32>, index) -> () loc("<stdin>":64:9)
        "affine.for"() <{lowerBoundMap = affine_map<() -> (0)>, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = affine_map<() -> (16)>}> ({
        ^bb0(%arg5: index loc("<stdin>":66:14)):
          %4 = "affine.load"(%arg0, %arg3, %arg5) <{map = affine_map<(d0, d1) -> (d0, d1)>}> : (memref<16x16xf32>, index, index) -> f32 loc("<stdin>":67:16)
          %5 = "affine.load"(%arg1, %arg5, %arg4) <{map = affine_map<(d0, d1) -> (d0, d1)>}> : (memref<16x16xf32>, index, index) -> f32 loc("<stdin>":68:16)
          %6 = "affine.load"(%1) <{map = affine_map<() -> (0)>}> : (memref<1xf32>) -> f32 loc("<stdin>":69:16)
          %7 = "arith.mulf"(%4, %5) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":70:16)
          %8 = "arith.addf"(%7, %6) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":71:16)
          "affine.store"(%8, %1) <{map = affine_map<() -> (0)>}> : (f32, memref<1xf32>) -> () loc("<stdin>":72:11)
          "affine.yield"() : () -> () loc("<stdin>":73:11)
        }) : () -> () loc("<stdin>":65:9)
        %3 = "affine.load"(%1, %0) <{map = affine_map<(d0) -> (d0)>}> : (memref<1xf32>, index) -> f32 loc("<stdin>":75:14)
        "affine.store"(%3, %arg2, %arg3, %arg4) <{map = affine_map<(d0, d1) -> (d0, d1)>}> : (f32, memref<16x16xf32>, index, index) -> () loc("<stdin>":76:9)
        "memref.dealloc"(%1) : (memref<1xf32>) -> () loc("<stdin>":77:9)
        "affine.yield"() : () -> () loc("<stdin>":78:9)
      }) : () -> () loc("<stdin>":60:7)
      "affine.yield"() : () -> () loc("<stdin>":80:7)
    }) : () -> () loc("<stdin>":58:5)
    "func.return"() : () -> () loc("<stdin>":82:5)
  }) : () -> () loc("<stdin>":55:3)
  "func.func"() <{function_type = (f64) -> (), sym_name = "printFlops", sym_visibility = "private"}> ({
  }) : () -> () loc("<stdin>":84:3)
  "func.func"() <{function_type = () -> f64, sym_name = "rtclock", sym_visibility = "private"}> ({
  }) : () -> () loc("<stdin>":86:3)
}) : () -> () loc("<stdin>":7:1)
