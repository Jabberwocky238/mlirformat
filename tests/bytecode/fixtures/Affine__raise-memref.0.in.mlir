"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "reduce_window_max"}> ({
    %20 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32 loc("<stdin>":9:11)
    %21 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<1x8x8x64xf32> loc("<stdin>":10:11)
    %22 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<1x18x18x64xf32> loc("<stdin>":11:11)
    "affine.for"() <{lowerBoundMap = affine_map<() -> (0)>, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = affine_map<() -> (1)>}> ({
    ^bb0(%arg16: index loc("<stdin>":13:10)):
      "affine.for"() <{lowerBoundMap = affine_map<() -> (0)>, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = affine_map<() -> (8)>}> ({
      ^bb0(%arg17: index loc("<stdin>":15:12)):
        "affine.for"() <{lowerBoundMap = affine_map<() -> (0)>, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = affine_map<() -> (8)>}> ({
        ^bb0(%arg18: index loc("<stdin>":17:14)):
          "affine.for"() <{lowerBoundMap = affine_map<() -> (0)>, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = affine_map<() -> (64)>}> ({
          ^bb0(%arg19: index loc("<stdin>":19:16)):
            "memref.store"(%20, %21, %arg16, %arg17, %arg18, %arg19) : (f32, memref<1x8x8x64xf32>, index, index, index, index) -> () loc("<stdin>":20:13)
            "affine.yield"() : () -> () loc("<stdin>":21:13)
          }) : () -> () loc("<stdin>":18:11)
          "affine.yield"() : () -> () loc("<stdin>":23:11)
        }) : () -> () loc("<stdin>":16:9)
        "affine.yield"() : () -> () loc("<stdin>":25:9)
      }) : () -> () loc("<stdin>":14:7)
      "affine.yield"() : () -> () loc("<stdin>":27:7)
    }) : () -> () loc("<stdin>":12:5)
    "affine.for"() <{lowerBoundMap = affine_map<() -> (0)>, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = affine_map<() -> (1)>}> ({
    ^bb0(%arg8: index loc("<stdin>":30:10)):
      "affine.for"() <{lowerBoundMap = affine_map<() -> (0)>, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = affine_map<() -> (8)>}> ({
      ^bb0(%arg9: index loc("<stdin>":32:12)):
        "affine.for"() <{lowerBoundMap = affine_map<() -> (0)>, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = affine_map<() -> (8)>}> ({
        ^bb0(%arg10: index loc("<stdin>":34:14)):
          "affine.for"() <{lowerBoundMap = affine_map<() -> (0)>, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = affine_map<() -> (64)>}> ({
          ^bb0(%arg11: index loc("<stdin>":36:16)):
            "affine.for"() <{lowerBoundMap = affine_map<() -> (0)>, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = affine_map<() -> (1)>}> ({
            ^bb0(%arg12: index loc("<stdin>":38:18)):
              "affine.for"() <{lowerBoundMap = affine_map<() -> (0)>, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = affine_map<() -> (3)>}> ({
              ^bb0(%arg13: index loc("<stdin>":40:20)):
                "affine.for"() <{lowerBoundMap = affine_map<() -> (0)>, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = affine_map<() -> (3)>}> ({
                ^bb0(%arg14: index loc("<stdin>":42:22)):
                  "affine.for"() <{lowerBoundMap = affine_map<() -> (0)>, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = affine_map<() -> (1)>}> ({
                  ^bb0(%arg15: index loc("<stdin>":44:24)):
                    %23 = "memref.load"(%21, %arg8, %arg9, %arg10, %arg11) : (memref<1x8x8x64xf32>, index, index, index, index) -> f32 loc("<stdin>":45:27)
                    %24 = "arith.addi"(%arg8, %arg12) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index loc("<stdin>":46:27)
                    %25 = "arith.constant"() <{value = 2 : index}> : () -> index loc("<stdin>":47:27)
                    %26 = "arith.muli"(%arg9, %25) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index loc("<stdin>":48:27)
                    %27 = "arith.addi"(%26, %arg13) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index loc("<stdin>":49:27)
                    %28 = "arith.muli"(%arg10, %25) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index loc("<stdin>":50:27)
                    %29 = "arith.addi"(%28, %arg14) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index loc("<stdin>":51:27)
                    %30 = "arith.addi"(%arg11, %arg15) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index loc("<stdin>":52:27)
                    %31 = "memref.load"(%22, %24, %27, %29, %30) : (memref<1x18x18x64xf32>, index, index, index, index) -> f32 loc("<stdin>":53:27)
                    %32 = "arith.cmpf"(%23, %31) <{fastmath = #arith.fastmath<none>, predicate = 2 : i64}> : (f32, f32) -> i1 loc("<stdin>":54:27)
                    %33 = "arith.select"(%32, %23, %31) : (i1, f32, f32) -> f32 loc("<stdin>":55:27)
                    "memref.store"(%33, %21, %arg8, %arg9, %arg10, %arg11) : (f32, memref<1x8x8x64xf32>, index, index, index, index) -> () loc("<stdin>":56:21)
                    "affine.yield"() : () -> () loc("<stdin>":57:21)
                  }) : () -> () loc("<stdin>":43:19)
                  "affine.yield"() : () -> () loc("<stdin>":59:19)
                }) : () -> () loc("<stdin>":41:17)
                "affine.yield"() : () -> () loc("<stdin>":61:17)
              }) : () -> () loc("<stdin>":39:15)
              "affine.yield"() : () -> () loc("<stdin>":63:15)
            }) : () -> () loc("<stdin>":37:13)
            "affine.yield"() : () -> () loc("<stdin>":65:13)
          }) : () -> () loc("<stdin>":35:11)
          "affine.yield"() : () -> () loc("<stdin>":67:11)
        }) : () -> () loc("<stdin>":33:9)
        "affine.yield"() : () -> () loc("<stdin>":69:9)
      }) : () -> () loc("<stdin>":31:7)
      "affine.yield"() : () -> () loc("<stdin>":71:7)
    }) : () -> () loc("<stdin>":29:5)
    "func.return"() : () -> () loc("<stdin>":73:5)
  }) : () -> () loc("<stdin>":8:3)
  "func.func"() <{function_type = (index) -> (), sym_name = "symbols"}> ({
  ^bb0(%arg3: index loc("<stdin>":76:8)):
    %3 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<1024x1024xf32> loc("<stdin>":77:10)
    %4 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<1024x1024xf32> loc("<stdin>":78:10)
    %5 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<1024x1024xf32> loc("<stdin>":79:10)
    %6 = "arith.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":80:10)
    %7 = "arith.constant"() <{value = 2 : index}> : () -> index loc("<stdin>":81:10)
    "affine.for"(%arg3) <{lowerBoundMap = affine_map<() -> (0)>, operandSegmentSizes = array<i32: 0, 1, 0>, step = 1 : index, upperBoundMap = affine_map<()[s0] -> (s0)>}> ({
    ^bb0(%arg4: index loc("<stdin>":83:10)):
      "affine.for"(%arg3) <{lowerBoundMap = affine_map<() -> (0)>, operandSegmentSizes = array<i32: 0, 1, 0>, step = 1 : index, upperBoundMap = affine_map<()[s0] -> (s0)>}> ({
      ^bb0(%arg5: index loc("<stdin>":85:12)):
        %8 = "memref.load"(%5, %arg4, %arg5) : (memref<1024x1024xf32>, index, index) -> f32 loc("<stdin>":86:14)
        %9 = "affine.for"(%arg3, %6) <{lowerBoundMap = affine_map<() -> (0)>, operandSegmentSizes = array<i32: 0, 1, 1>, step = 1 : index, upperBoundMap = affine_map<()[s0] -> (s0)>}> ({
        ^bb0(%arg6: index loc("<stdin>":88:14), %arg7: index loc("<stdin>":88:28)):
          %10 = "arith.muli"(%arg3, %7) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index loc("<stdin>":89:17)
          %11 = "arith.addi"(%10, %6) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index loc("<stdin>":90:17)
          %12 = "arith.addi"(%11, %arg5) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index loc("<stdin>":91:17)
          %13 = "memref.load"(%3, %arg4, %10) : (memref<1024x1024xf32>, index, index) -> f32 loc("<stdin>":92:17)
          %14 = "memref.load"(%4, %12, %arg5) : (memref<1024x1024xf32>, index, index) -> f32 loc("<stdin>":93:17)
          %15 = "arith.mulf"(%13, %14) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":94:17)
          %16 = "arith.addf"(%8, %15) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":95:17)
          %17 = "arith.addi"(%arg3, %6) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index loc("<stdin>":96:17)
          %18 = "arith.addi"(%arg7, %6) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index loc("<stdin>":97:17)
          "memref.store"(%16, %5, %arg4, %17) : (f32, memref<1024x1024xf32>, index, index) -> () loc("<stdin>":98:11)
          "memref.store"(%16, %5, %arg4, %18) : (f32, memref<1024x1024xf32>, index, index) -> () loc("<stdin>":99:11)
          %19 = "ab.v"() : () -> index loc("<stdin>":100:17)
          "memref.store"(%16, %5, %arg4, %19) : (f32, memref<1024x1024xf32>, index, index) -> () loc("<stdin>":101:11)
          "affine.yield"(%18) : (index) -> () loc("<stdin>":102:11)
        }) : (index, index) -> index loc("<stdin>":87:14)
        "affine.yield"() : () -> () loc("<stdin>":104:9)
      }) : (index) -> () loc("<stdin>":84:7)
      "affine.yield"() : () -> () loc("<stdin>":106:7)
    }) : (index) -> () loc("<stdin>":82:5)
    "func.return"() : () -> () loc("<stdin>":108:5)
  }) : () -> () loc("<stdin>":75:3)
  "func.func"() <{function_type = (index) -> (), sym_name = "non_affine"}> ({
  ^bb0(%arg0: index loc("<stdin>":111:8)):
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<1024x1024xf32> loc("<stdin>":112:10)
    "affine.for"(%arg0) <{lowerBoundMap = affine_map<() -> (0)>, operandSegmentSizes = array<i32: 0, 1, 0>, step = 1 : index, upperBoundMap = affine_map<()[s0] -> (s0)>}> ({
    ^bb0(%arg1: index loc("<stdin>":114:10)):
      "affine.for"(%arg0) <{lowerBoundMap = affine_map<() -> (0)>, operandSegmentSizes = array<i32: 0, 1, 0>, step = 1 : index, upperBoundMap = affine_map<()[s0] -> (s0)>}> ({
      ^bb0(%arg2: index loc("<stdin>":116:12)):
        %1 = "arith.muli"(%arg1, %arg2) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index loc("<stdin>":117:14)
        %2 = "memref.load"(%0, %arg1, %1) : (memref<1024x1024xf32>, index, index) -> f32 loc("<stdin>":118:14)
        "memref.store"(%2, %0, %1, %1) : (f32, memref<1024x1024xf32>, index, index) -> () loc("<stdin>":119:9)
        "affine.yield"() : () -> () loc("<stdin>":120:9)
      }) : (index) -> () loc("<stdin>":115:7)
      "affine.yield"() : () -> () loc("<stdin>":122:7)
    }) : (index) -> () loc("<stdin>":113:5)
    "func.return"() : () -> () loc("<stdin>":124:5)
  }) : () -> () loc("<stdin>":110:3)
}) : () -> () loc("<stdin>":7:1)
