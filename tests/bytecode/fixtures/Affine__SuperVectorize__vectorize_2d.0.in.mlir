"builtin.module"() ({
  "func.func"() <{function_type = (memref<?x?x?xf32>) -> (), sym_name = "vec2d"}> ({
  ^bb0(%arg16: memref<?x?x?xf32> loc("<stdin>":8:8)):
    %25 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":9:11)
    %26 = "arith.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":10:11)
    %27 = "arith.constant"() <{value = 2 : index}> : () -> index loc("<stdin>":11:11)
    %28 = "memref.dim"(%arg16, %25) : (memref<?x?x?xf32>, index) -> index loc("<stdin>":12:11)
    %29 = "memref.dim"(%arg16, %26) : (memref<?x?x?xf32>, index) -> index loc("<stdin>":13:11)
    %30 = "memref.dim"(%arg16, %27) : (memref<?x?x?xf32>, index) -> index loc("<stdin>":14:11)
    "affine.for"(%28) <{lowerBoundMap = affine_map<() -> (0)>, operandSegmentSizes = array<i32: 0, 1, 0>, step = 1 : index, upperBoundMap = affine_map<()[s0] -> (s0)>}> ({
    ^bb0(%arg20: index loc("<stdin>":16:10)):
      "affine.for"(%29) <{lowerBoundMap = affine_map<() -> (0)>, operandSegmentSizes = array<i32: 0, 1, 0>, step = 1 : index, upperBoundMap = affine_map<()[s0] -> (s0)>}> ({
      ^bb0(%arg21: index loc("<stdin>":18:12)):
        "affine.for"(%30) <{lowerBoundMap = affine_map<() -> (0)>, operandSegmentSizes = array<i32: 0, 1, 0>, step = 1 : index, upperBoundMap = affine_map<()[s0] -> (s0)>}> ({
        ^bb0(%arg22: index loc("<stdin>":20:14)):
          %32 = "affine.load"(%arg16, %arg20, %arg21, %arg22) <{map = affine_map<(d0, d1, d2) -> (d0, d1, d2)>}> : (memref<?x?x?xf32>, index, index, index) -> f32 loc("<stdin>":21:17)
          "affine.yield"() : () -> () loc("<stdin>":22:11)
        }) : (index) -> () loc("<stdin>":19:9)
        "affine.yield"() : () -> () loc("<stdin>":24:9)
      }) : (index) -> () loc("<stdin>":17:7)
      "affine.yield"() : () -> () loc("<stdin>":26:7)
    }) : (index) -> () loc("<stdin>":15:5)
    "affine.for"(%28) <{lowerBoundMap = affine_map<() -> (0)>, operandSegmentSizes = array<i32: 0, 1, 0>, step = 1 : index, upperBoundMap = affine_map<()[s0] -> (s0)>}> ({
    ^bb0(%arg17: index loc("<stdin>":29:10)):
      "affine.for"(%29) <{lowerBoundMap = affine_map<() -> (0)>, operandSegmentSizes = array<i32: 0, 1, 0>, step = 1 : index, upperBoundMap = affine_map<()[s0] -> (s0)>}> ({
      ^bb0(%arg18: index loc("<stdin>":31:12)):
        "affine.for"(%30) <{lowerBoundMap = affine_map<() -> (0)>, operandSegmentSizes = array<i32: 0, 1, 0>, step = 1 : index, upperBoundMap = affine_map<()[s0] -> (s0)>}> ({
        ^bb0(%arg19: index loc("<stdin>":33:14)):
          %31 = "affine.load"(%arg16, %arg18, %arg19, %arg17) <{map = affine_map<(d0, d1, d2) -> (d0, d1, d2)>}> : (memref<?x?x?xf32>, index, index, index) -> f32 loc("<stdin>":34:17)
          "affine.yield"() : () -> () loc("<stdin>":35:11)
        }) : (index) -> () loc("<stdin>":32:9)
        "affine.yield"() : () -> () loc("<stdin>":37:9)
      }) : (index) -> () loc("<stdin>":30:7)
      "affine.yield"() : () -> () loc("<stdin>":39:7)
    }) : (index) -> () loc("<stdin>":28:5)
    "func.return"() : () -> () loc("<stdin>":41:5)
  }) : () -> () loc("<stdin>":7:3)
  "func.func"() <{function_type = (index, index) -> f32, sym_name = "vector_add_2d"}> ({
  ^bb0(%arg8: index loc("<stdin>":44:8), %arg9: index loc("<stdin>":44:22)):
    %11 = "memref.alloc"(%arg8, %arg9) <{operandSegmentSizes = array<i32: 2, 0>}> : (index, index) -> memref<?x?xf32> loc("<stdin>":45:11)
    %12 = "memref.alloc"(%arg8, %arg9) <{operandSegmentSizes = array<i32: 2, 0>}> : (index, index) -> memref<?x?xf32> loc("<stdin>":46:11)
    %13 = "memref.alloc"(%arg8, %arg9) <{operandSegmentSizes = array<i32: 2, 0>}> : (index, index) -> memref<?x?xf32> loc("<stdin>":47:11)
    %14 = "arith.constant"() <{value = 1.000000e+00 : f32}> : () -> f32 loc("<stdin>":48:11)
    %15 = "arith.constant"() <{value = 2.000000e+00 : f32}> : () -> f32 loc("<stdin>":49:11)
    "affine.for"(%arg8) <{lowerBoundMap = affine_map<() -> (0)>, operandSegmentSizes = array<i32: 0, 1, 0>, step = 1 : index, upperBoundMap = affine_map<()[s0] -> (s0)>}> ({
    ^bb0(%arg14: index loc("<stdin>":51:10)):
      "affine.for"(%arg9) <{lowerBoundMap = affine_map<() -> (0)>, operandSegmentSizes = array<i32: 0, 1, 0>, step = 1 : index, upperBoundMap = affine_map<()[s0] -> (s0)>}> ({
      ^bb0(%arg15: index loc("<stdin>":53:12)):
        "affine.store"(%14, %11, %arg14, %arg15) <{map = affine_map<(d0, d1) -> (d0, d1)>}> : (f32, memref<?x?xf32>, index, index) -> () loc("<stdin>":54:9)
        "affine.yield"() : () -> () loc("<stdin>":55:9)
      }) : (index) -> () loc("<stdin>":52:7)
      "affine.yield"() : () -> () loc("<stdin>":57:7)
    }) : (index) -> () loc("<stdin>":50:5)
    "affine.for"(%arg8) <{lowerBoundMap = affine_map<() -> (0)>, operandSegmentSizes = array<i32: 0, 1, 0>, step = 1 : index, upperBoundMap = affine_map<()[s0] -> (s0)>}> ({
    ^bb0(%arg12: index loc("<stdin>":60:10)):
      "affine.for"(%arg9) <{lowerBoundMap = affine_map<() -> (0)>, operandSegmentSizes = array<i32: 0, 1, 0>, step = 1 : index, upperBoundMap = affine_map<()[s0] -> (s0)>}> ({
      ^bb0(%arg13: index loc("<stdin>":62:12)):
        "affine.store"(%15, %12, %arg12, %arg13) <{map = affine_map<(d0, d1) -> (d0, d1)>}> : (f32, memref<?x?xf32>, index, index) -> () loc("<stdin>":63:9)
        "affine.yield"() : () -> () loc("<stdin>":64:9)
      }) : (index) -> () loc("<stdin>":61:7)
      "affine.yield"() : () -> () loc("<stdin>":66:7)
    }) : (index) -> () loc("<stdin>":59:5)
    "affine.for"(%arg8) <{lowerBoundMap = affine_map<() -> (0)>, operandSegmentSizes = array<i32: 0, 1, 0>, step = 1 : index, upperBoundMap = affine_map<()[s0] -> (s0)>}> ({
    ^bb0(%arg10: index loc("<stdin>":69:10)):
      "affine.for"(%arg9) <{lowerBoundMap = affine_map<() -> (0)>, operandSegmentSizes = array<i32: 0, 1, 0>, step = 1 : index, upperBoundMap = affine_map<()[s0] -> (s0)>}> ({
      ^bb0(%arg11: index loc("<stdin>":71:12)):
        %19 = "affine.load"(%11, %arg10, %arg11) <{map = affine_map<(d0, d1) -> (d0, d1)>}> : (memref<?x?xf32>, index, index) -> f32 loc("<stdin>":72:15)
        %20 = "affine.load"(%12, %arg10, %arg11) <{map = affine_map<(d0, d1) -> (d0, d1)>}> : (memref<?x?xf32>, index, index) -> f32 loc("<stdin>":73:15)
        %21 = "arith.addf"(%19, %20) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":74:15)
        %22 = "arith.addf"(%21, %14) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":75:15)
        %23 = "arith.addf"(%21, %15) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":76:15)
        %24 = "arith.addf"(%23, %22) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":77:15)
        "affine.store"(%24, %13, %arg10, %arg11) <{map = affine_map<(d0, d1) -> (d0, d1)>}> : (f32, memref<?x?xf32>, index, index) -> () loc("<stdin>":78:9)
        "affine.yield"() : () -> () loc("<stdin>":79:9)
      }) : (index) -> () loc("<stdin>":70:7)
      "affine.yield"() : () -> () loc("<stdin>":81:7)
    }) : (index) -> () loc("<stdin>":68:5)
    %16 = "arith.constant"() <{value = 7 : index}> : () -> index loc("<stdin>":83:11)
    %17 = "arith.constant"() <{value = 42 : index}> : () -> index loc("<stdin>":84:11)
    %18 = "affine.load"(%13, %16, %17) <{map = affine_map<(d0, d1) -> (d0, d1)>}> : (memref<?x?xf32>, index, index) -> f32 loc("<stdin>":85:11)
    "func.return"(%18) : (f32) -> () loc("<stdin>":86:5)
  }) : () -> () loc("<stdin>":43:3)
  "func.func"() <{function_type = (memref<?x?xf32>, memref<?x?xf32>, memref<?x?xf32>) -> (), sym_name = "vectorize_matmul"}> ({
  ^bb0(%arg0: memref<?x?xf32> loc("<stdin>":89:8), %arg1: memref<?x?xf32> loc("<stdin>":89:32), %arg2: memref<?x?xf32> loc("<stdin>":89:56)):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":90:10)
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":91:10)
    %2 = "memref.dim"(%arg0, %0) : (memref<?x?xf32>, index) -> index loc("<stdin>":92:10)
    %3 = "memref.dim"(%arg0, %1) : (memref<?x?xf32>, index) -> index loc("<stdin>":93:10)
    %4 = "memref.dim"(%arg2, %1) : (memref<?x?xf32>, index) -> index loc("<stdin>":94:10)
    "affine.for"(%0, %2) <{lowerBoundMap = affine_map<(d0) -> (d0)>, operandSegmentSizes = array<i32: 1, 1, 0>, step = 1 : index, upperBoundMap = affine_map<(d0) -> (d0)>}> ({
    ^bb0(%arg6: index loc("<stdin>":96:10)):
      "affine.for"(%0, %4) <{lowerBoundMap = affine_map<(d0) -> (d0)>, operandSegmentSizes = array<i32: 1, 1, 0>, step = 1 : index, upperBoundMap = affine_map<(d0) -> (d0)>}> ({
      ^bb0(%arg7: index loc("<stdin>":98:12)):
        %10 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32 loc("<stdin>":99:15)
        "affine.store"(%10, %arg2, %arg6, %arg7) <{map = affine_map<(d0, d1) -> (d0, d1)>}> : (f32, memref<?x?xf32>, index, index) -> () loc("<stdin>":100:9)
        "affine.yield"() : () -> () loc("<stdin>":101:9)
      }) : (index, index) -> () loc("<stdin>":97:7)
      "affine.yield"() : () -> () loc("<stdin>":103:7)
    }) : (index, index) -> () loc("<stdin>":95:5)
    "affine.for"(%0, %2) <{lowerBoundMap = affine_map<(d0) -> (d0)>, operandSegmentSizes = array<i32: 1, 1, 0>, step = 1 : index, upperBoundMap = affine_map<(d0) -> (d0)>}> ({
    ^bb0(%arg3: index loc("<stdin>":106:10)):
      "affine.for"(%0, %4) <{lowerBoundMap = affine_map<(d0) -> (d0)>, operandSegmentSizes = array<i32: 1, 1, 0>, step = 1 : index, upperBoundMap = affine_map<(d0) -> (d0)>}> ({
      ^bb0(%arg4: index loc("<stdin>":108:12)):
        "affine.for"(%0, %3) <{lowerBoundMap = affine_map<(d0) -> (d0)>, operandSegmentSizes = array<i32: 1, 1, 0>, step = 1 : index, upperBoundMap = affine_map<(d0) -> (d0)>}> ({
        ^bb0(%arg5: index loc("<stdin>":110:14)):
          %5 = "affine.load"(%arg1, %arg5, %arg4) <{map = affine_map<(d0, d1) -> (d0, d1)>}> : (memref<?x?xf32>, index, index) -> f32 loc("<stdin>":111:16)
          %6 = "affine.load"(%arg0, %arg3, %arg5) <{map = affine_map<(d0, d1) -> (d0, d1)>}> : (memref<?x?xf32>, index, index) -> f32 loc("<stdin>":112:16)
          %7 = "arith.mulf"(%6, %5) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":113:16)
          %8 = "affine.load"(%arg2, %arg3, %arg4) <{map = affine_map<(d0, d1) -> (d0, d1)>}> : (memref<?x?xf32>, index, index) -> f32 loc("<stdin>":114:16)
          %9 = "arith.addf"(%8, %7) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":115:16)
          "affine.store"(%9, %arg2, %arg3, %arg4) <{map = affine_map<(d0, d1) -> (d0, d1)>}> : (f32, memref<?x?xf32>, index, index) -> () loc("<stdin>":116:11)
          "affine.yield"() : () -> () loc("<stdin>":117:11)
        }) : (index, index) -> () loc("<stdin>":109:9)
        "affine.yield"() : () -> () loc("<stdin>":119:9)
      }) : (index, index) -> () loc("<stdin>":107:7)
      "affine.yield"() : () -> () loc("<stdin>":121:7)
    }) : (index, index) -> () loc("<stdin>":105:5)
    "func.return"() : () -> () loc("<stdin>":123:5)
  }) : () -> () loc("<stdin>":88:3)
}) : () -> () loc("<stdin>":6:1)
