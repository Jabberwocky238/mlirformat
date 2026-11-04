#map = affine_map<(d0, d1, d2) -> (d0, d1, d2)>
#map1 = affine_map<() -> (0)>
#map2 = affine_map<()[s0] -> (s0)>
#map3 = affine_map<(d0, d1) -> (d0, d1)>
#map4 = affine_map<(d0) -> (d0)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<?x?x?xf32>) -> (), sym_name = "vec2d"}> ({
  ^bb0(%arg16: memref<?x?x?xf32>):
    %25 = "arith.constant"() <{value = 0 : index}> : () -> index
    %26 = "arith.constant"() <{value = 1 : index}> : () -> index
    %27 = "arith.constant"() <{value = 2 : index}> : () -> index
    %28 = "memref.dim"(%arg16, %25) : (memref<?x?x?xf32>, index) -> index
    %29 = "memref.dim"(%arg16, %26) : (memref<?x?x?xf32>, index) -> index
    %30 = "memref.dim"(%arg16, %27) : (memref<?x?x?xf32>, index) -> index
    "affine.for"(%28) <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 1, 0>, step = 1 : index, upperBoundMap = #map2}> ({
    ^bb0(%arg20: index):
      "affine.for"(%29) <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 1, 0>, step = 1 : index, upperBoundMap = #map2}> ({
      ^bb0(%arg21: index):
        "affine.for"(%30) <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 1, 0>, step = 1 : index, upperBoundMap = #map2}> ({
        ^bb0(%arg22: index):
          %32 = "affine.load"(%arg16, %arg20, %arg21, %arg22) <{map = #map}> : (memref<?x?x?xf32>, index, index, index) -> f32
          "affine.yield"() : () -> ()
        }) : (index) -> ()
        "affine.yield"() : () -> ()
      }) : (index) -> ()
      "affine.yield"() : () -> ()
    }) : (index) -> ()
    "affine.for"(%28) <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 1, 0>, step = 1 : index, upperBoundMap = #map2}> ({
    ^bb0(%arg17: index):
      "affine.for"(%29) <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 1, 0>, step = 1 : index, upperBoundMap = #map2}> ({
      ^bb0(%arg18: index):
        "affine.for"(%30) <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 1, 0>, step = 1 : index, upperBoundMap = #map2}> ({
        ^bb0(%arg19: index):
          %31 = "affine.load"(%arg16, %arg18, %arg19, %arg17) <{map = #map}> : (memref<?x?x?xf32>, index, index, index) -> f32
          "affine.yield"() : () -> ()
        }) : (index) -> ()
        "affine.yield"() : () -> ()
      }) : (index) -> ()
      "affine.yield"() : () -> ()
    }) : (index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index, index) -> f32, sym_name = "vector_add_2d"}> ({
  ^bb0(%arg8: index, %arg9: index):
    %11 = "memref.alloc"(%arg8, %arg9) <{operandSegmentSizes = array<i32: 2, 0>}> : (index, index) -> memref<?x?xf32>
    %12 = "memref.alloc"(%arg8, %arg9) <{operandSegmentSizes = array<i32: 2, 0>}> : (index, index) -> memref<?x?xf32>
    %13 = "memref.alloc"(%arg8, %arg9) <{operandSegmentSizes = array<i32: 2, 0>}> : (index, index) -> memref<?x?xf32>
    %14 = "arith.constant"() <{value = 1.000000e+00 : f32}> : () -> f32
    %15 = "arith.constant"() <{value = 2.000000e+00 : f32}> : () -> f32
    "affine.for"(%arg8) <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 1, 0>, step = 1 : index, upperBoundMap = #map2}> ({
    ^bb0(%arg14: index):
      "affine.for"(%arg9) <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 1, 0>, step = 1 : index, upperBoundMap = #map2}> ({
      ^bb0(%arg15: index):
        "affine.store"(%14, %11, %arg14, %arg15) <{map = #map3}> : (f32, memref<?x?xf32>, index, index) -> ()
        "affine.yield"() : () -> ()
      }) : (index) -> ()
      "affine.yield"() : () -> ()
    }) : (index) -> ()
    "affine.for"(%arg8) <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 1, 0>, step = 1 : index, upperBoundMap = #map2}> ({
    ^bb0(%arg12: index):
      "affine.for"(%arg9) <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 1, 0>, step = 1 : index, upperBoundMap = #map2}> ({
      ^bb0(%arg13: index):
        "affine.store"(%15, %12, %arg12, %arg13) <{map = #map3}> : (f32, memref<?x?xf32>, index, index) -> ()
        "affine.yield"() : () -> ()
      }) : (index) -> ()
      "affine.yield"() : () -> ()
    }) : (index) -> ()
    "affine.for"(%arg8) <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 1, 0>, step = 1 : index, upperBoundMap = #map2}> ({
    ^bb0(%arg10: index):
      "affine.for"(%arg9) <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 1, 0>, step = 1 : index, upperBoundMap = #map2}> ({
      ^bb0(%arg11: index):
        %19 = "affine.load"(%11, %arg10, %arg11) <{map = #map3}> : (memref<?x?xf32>, index, index) -> f32
        %20 = "affine.load"(%12, %arg10, %arg11) <{map = #map3}> : (memref<?x?xf32>, index, index) -> f32
        %21 = "arith.addf"(%19, %20) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
        %22 = "arith.addf"(%21, %14) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
        %23 = "arith.addf"(%21, %15) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
        %24 = "arith.addf"(%23, %22) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
        "affine.store"(%24, %13, %arg10, %arg11) <{map = #map3}> : (f32, memref<?x?xf32>, index, index) -> ()
        "affine.yield"() : () -> ()
      }) : (index) -> ()
      "affine.yield"() : () -> ()
    }) : (index) -> ()
    %16 = "arith.constant"() <{value = 7 : index}> : () -> index
    %17 = "arith.constant"() <{value = 42 : index}> : () -> index
    %18 = "affine.load"(%13, %16, %17) <{map = #map3}> : (memref<?x?xf32>, index, index) -> f32
    "func.return"(%18) : (f32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<?x?xf32>, memref<?x?xf32>, memref<?x?xf32>) -> (), sym_name = "vectorize_matmul"}> ({
  ^bb0(%arg0: memref<?x?xf32>, %arg1: memref<?x?xf32>, %arg2: memref<?x?xf32>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index
    %2 = "memref.dim"(%arg0, %0) : (memref<?x?xf32>, index) -> index
    %3 = "memref.dim"(%arg0, %1) : (memref<?x?xf32>, index) -> index
    %4 = "memref.dim"(%arg2, %1) : (memref<?x?xf32>, index) -> index
    "affine.for"(%0, %2) <{lowerBoundMap = #map4, operandSegmentSizes = array<i32: 1, 1, 0>, step = 1 : index, upperBoundMap = #map4}> ({
    ^bb0(%arg6: index):
      "affine.for"(%0, %4) <{lowerBoundMap = #map4, operandSegmentSizes = array<i32: 1, 1, 0>, step = 1 : index, upperBoundMap = #map4}> ({
      ^bb0(%arg7: index):
        %10 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
        "affine.store"(%10, %arg2, %arg6, %arg7) <{map = #map3}> : (f32, memref<?x?xf32>, index, index) -> ()
        "affine.yield"() : () -> ()
      }) : (index, index) -> ()
      "affine.yield"() : () -> ()
    }) : (index, index) -> ()
    "affine.for"(%0, %2) <{lowerBoundMap = #map4, operandSegmentSizes = array<i32: 1, 1, 0>, step = 1 : index, upperBoundMap = #map4}> ({
    ^bb0(%arg3: index):
      "affine.for"(%0, %4) <{lowerBoundMap = #map4, operandSegmentSizes = array<i32: 1, 1, 0>, step = 1 : index, upperBoundMap = #map4}> ({
      ^bb0(%arg4: index):
        "affine.for"(%0, %3) <{lowerBoundMap = #map4, operandSegmentSizes = array<i32: 1, 1, 0>, step = 1 : index, upperBoundMap = #map4}> ({
        ^bb0(%arg5: index):
          %5 = "affine.load"(%arg1, %arg5, %arg4) <{map = #map3}> : (memref<?x?xf32>, index, index) -> f32
          %6 = "affine.load"(%arg0, %arg3, %arg5) <{map = #map3}> : (memref<?x?xf32>, index, index) -> f32
          %7 = "arith.mulf"(%6, %5) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
          %8 = "affine.load"(%arg2, %arg3, %arg4) <{map = #map3}> : (memref<?x?xf32>, index, index) -> f32
          %9 = "arith.addf"(%8, %7) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
          "affine.store"(%9, %arg2, %arg3, %arg4) <{map = #map3}> : (f32, memref<?x?xf32>, index, index) -> ()
          "affine.yield"() : () -> ()
        }) : (index, index) -> ()
        "affine.yield"() : () -> ()
      }) : (index, index) -> ()
      "affine.yield"() : () -> ()
    }) : (index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

