#map = affine_map<() -> (0)>
#map1 = affine_map<() -> (64)>
#map2 = affine_map<() -> (8)>
#map3 = affine_map<() -> (1)>
#map4 = affine_map<() -> (3)>
#map5 = affine_map<()[s0] -> (s0)>
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "reduce_window_max"}> ({
    %20 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %21 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<1x8x8x64xf32>
    %22 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<1x18x18x64xf32>
    "affine.for"() <{lowerBoundMap = #map, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map3}> ({
    ^bb0(%arg16: index):
      "affine.for"() <{lowerBoundMap = #map, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
      ^bb0(%arg17: index):
        "affine.for"() <{lowerBoundMap = #map, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
        ^bb0(%arg18: index):
          "affine.for"() <{lowerBoundMap = #map, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map1}> ({
          ^bb0(%arg19: index):
            "memref.store"(%20, %21, %arg16, %arg17, %arg18, %arg19) : (f32, memref<1x8x8x64xf32>, index, index, index, index) -> ()
            "affine.yield"() : () -> ()
          }) : () -> ()
          "affine.yield"() : () -> ()
        }) : () -> ()
        "affine.yield"() : () -> ()
      }) : () -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "affine.for"() <{lowerBoundMap = #map, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map3}> ({
    ^bb0(%arg8: index):
      "affine.for"() <{lowerBoundMap = #map, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
      ^bb0(%arg9: index):
        "affine.for"() <{lowerBoundMap = #map, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
        ^bb0(%arg10: index):
          "affine.for"() <{lowerBoundMap = #map, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map1}> ({
          ^bb0(%arg11: index):
            "affine.for"() <{lowerBoundMap = #map, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map3}> ({
            ^bb0(%arg12: index):
              "affine.for"() <{lowerBoundMap = #map, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map4}> ({
              ^bb0(%arg13: index):
                "affine.for"() <{lowerBoundMap = #map, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map4}> ({
                ^bb0(%arg14: index):
                  "affine.for"() <{lowerBoundMap = #map, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map3}> ({
                  ^bb0(%arg15: index):
                    %23 = "memref.load"(%21, %arg8, %arg9, %arg10, %arg11) : (memref<1x8x8x64xf32>, index, index, index, index) -> f32
                    %24 = "arith.addi"(%arg8, %arg12) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
                    %25 = "arith.constant"() <{value = 2 : index}> : () -> index
                    %26 = "arith.muli"(%arg9, %25) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
                    %27 = "arith.addi"(%26, %arg13) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
                    %28 = "arith.muli"(%arg10, %25) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
                    %29 = "arith.addi"(%28, %arg14) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
                    %30 = "arith.addi"(%arg11, %arg15) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
                    %31 = "memref.load"(%22, %24, %27, %29, %30) : (memref<1x18x18x64xf32>, index, index, index, index) -> f32
                    %32 = "arith.cmpf"(%23, %31) <{fastmath = #arith.fastmath<none>, predicate = 2 : i64}> : (f32, f32) -> i1
                    %33 = "arith.select"(%32, %23, %31) : (i1, f32, f32) -> f32
                    "memref.store"(%33, %21, %arg8, %arg9, %arg10, %arg11) : (f32, memref<1x8x8x64xf32>, index, index, index, index) -> ()
                    "affine.yield"() : () -> ()
                  }) : () -> ()
                  "affine.yield"() : () -> ()
                }) : () -> ()
                "affine.yield"() : () -> ()
              }) : () -> ()
              "affine.yield"() : () -> ()
            }) : () -> ()
            "affine.yield"() : () -> ()
          }) : () -> ()
          "affine.yield"() : () -> ()
        }) : () -> ()
        "affine.yield"() : () -> ()
      }) : () -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index) -> (), sym_name = "symbols"}> ({
  ^bb0(%arg3: index):
    %3 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<1024x1024xf32>
    %4 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<1024x1024xf32>
    %5 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<1024x1024xf32>
    %6 = "arith.constant"() <{value = 1 : index}> : () -> index
    %7 = "arith.constant"() <{value = 2 : index}> : () -> index
    "affine.for"(%arg3) <{lowerBoundMap = #map, operandSegmentSizes = array<i32: 0, 1, 0>, step = 1 : index, upperBoundMap = #map5}> ({
    ^bb0(%arg4: index):
      "affine.for"(%arg3) <{lowerBoundMap = #map, operandSegmentSizes = array<i32: 0, 1, 0>, step = 1 : index, upperBoundMap = #map5}> ({
      ^bb0(%arg5: index):
        %8 = "memref.load"(%5, %arg4, %arg5) : (memref<1024x1024xf32>, index, index) -> f32
        %9 = "affine.for"(%arg3, %6) <{lowerBoundMap = #map, operandSegmentSizes = array<i32: 0, 1, 1>, step = 1 : index, upperBoundMap = #map5}> ({
        ^bb0(%arg6: index, %arg7: index):
          %10 = "arith.muli"(%arg3, %7) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
          %11 = "arith.addi"(%10, %6) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
          %12 = "arith.addi"(%11, %arg5) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
          %13 = "memref.load"(%3, %arg4, %10) : (memref<1024x1024xf32>, index, index) -> f32
          %14 = "memref.load"(%4, %12, %arg5) : (memref<1024x1024xf32>, index, index) -> f32
          %15 = "arith.mulf"(%13, %14) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
          %16 = "arith.addf"(%8, %15) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
          %17 = "arith.addi"(%arg3, %6) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
          %18 = "arith.addi"(%arg7, %6) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
          "memref.store"(%16, %5, %arg4, %17) : (f32, memref<1024x1024xf32>, index, index) -> ()
          "memref.store"(%16, %5, %arg4, %18) : (f32, memref<1024x1024xf32>, index, index) -> ()
          %19 = "ab.v"() : () -> index
          "memref.store"(%16, %5, %arg4, %19) : (f32, memref<1024x1024xf32>, index, index) -> ()
          "affine.yield"(%18) : (index) -> ()
        }) : (index, index) -> index
        "affine.yield"() : () -> ()
      }) : (index) -> ()
      "affine.yield"() : () -> ()
    }) : (index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index) -> (), sym_name = "non_affine"}> ({
  ^bb0(%arg0: index):
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<1024x1024xf32>
    "affine.for"(%arg0) <{lowerBoundMap = #map, operandSegmentSizes = array<i32: 0, 1, 0>, step = 1 : index, upperBoundMap = #map5}> ({
    ^bb0(%arg1: index):
      "affine.for"(%arg0) <{lowerBoundMap = #map, operandSegmentSizes = array<i32: 0, 1, 0>, step = 1 : index, upperBoundMap = #map5}> ({
      ^bb0(%arg2: index):
        %1 = "arith.muli"(%arg1, %arg2) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
        %2 = "memref.load"(%0, %arg1, %1) : (memref<1024x1024xf32>, index, index) -> f32
        "memref.store"(%2, %0, %1, %1) : (f32, memref<1024x1024xf32>, index, index) -> ()
        "affine.yield"() : () -> ()
      }) : (index) -> ()
      "affine.yield"() : () -> ()
    }) : (index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

