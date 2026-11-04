#map = affine_map<() -> (0)>
#map1 = affine_map<()[s0] -> (s0)>
#map2 = affine_map<() -> (0, 0)>
#map3 = affine_map<(d0, d1) -> (d0, d1)>
#map4 = affine_map<(d0) -> (d0)>
#map5 = affine_map<() -> (16)>
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %9 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<16x16xf32>
    %10 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<16x16xf32>
    %11 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<16x16xf32>
    %12 = "arith.constant"() <{value = 1.000000e+00 : f32}> : () -> f32
    "linalg.fill"(%12, %9) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg11: f32, %arg12: f32):
      "linalg.yield"(%arg11) : (f32) -> ()
    }) : (f32, memref<16x16xf32>) -> ()
    "linalg.fill"(%12, %10) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg9: f32, %arg10: f32):
      "linalg.yield"(%arg9) : (f32) -> ()
    }) : (f32, memref<16x16xf32>) -> ()
    %13 = "arith.constant"() <{value = 5 : index}> : () -> index
    %14 = "func.call"() <{callee = @rtclock}> : () -> f64
    "affine.for"(%13) <{lowerBoundMap = #map, operandSegmentSizes = array<i32: 0, 1, 0>, step = 1 : index, upperBoundMap = #map1}> ({
    ^bb0(%arg6: index):
      "linalg.fill"(%12, %11) <{operandSegmentSizes = array<i32: 1, 1>}> ({
      ^bb0(%arg7: f32, %arg8: f32):
        "linalg.yield"(%arg7) : (f32) -> ()
      }) : (f32, memref<16x16xf32>) -> ()
      "func.call"(%9, %10, %11) <{callee = @sgemm_naive}> : (memref<16x16xf32>, memref<16x16xf32>, memref<16x16xf32>) -> ()
      "affine.yield"() : () -> ()
    }) : (index) -> ()
    %15 = "func.call"() <{callee = @rtclock}> : () -> f64
    %16 = "arith.subf"(%15, %14) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64
    %17 = "affine.load"(%11) <{map = #map2}> : (memref<16x16xf32>) -> f32
    "vector.print"(%17) <{punctuation = #vector.punctuation<newline>}> : (f32) -> ()
    %18 = "arith.constant"() <{value = 0 : index}> : () -> index
    %19 = "arith.constant"() <{value = 1 : index}> : () -> index
    %20 = "arith.constant"() <{value = 2 : index}> : () -> index
    %21 = "memref.dim"(%11, %18) : (memref<16x16xf32>, index) -> index
    %22 = "memref.dim"(%11, %19) : (memref<16x16xf32>, index) -> index
    %23 = "memref.dim"(%9, %19) : (memref<16x16xf32>, index) -> index
    %24 = "arith.muli"(%21, %22) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
    %25 = "arith.muli"(%24, %23) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
    %26 = "arith.muli"(%20, %25) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
    %27 = "arith.muli"(%26, %13) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
    %28 = "arith.index_cast"(%27) : (index) -> i16
    %29 = "arith.uitofp"(%28) : (i16) -> f64
    %30 = "arith.divf"(%29, %16) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64
    "func.call"(%30) <{callee = @printFlops}> : (f64) -> ()
    "memref.dealloc"(%9) : (memref<16x16xf32>) -> ()
    "memref.dealloc"(%10) : (memref<16x16xf32>) -> ()
    "memref.dealloc"(%11) : (memref<16x16xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<16x16xf32>, memref<16x16xf32>, memref<16x16xf32>) -> (), sym_name = "sgemm_naive"}> ({
  ^bb0(%arg0: memref<16x16xf32>, %arg1: memref<16x16xf32>, %arg2: memref<16x16xf32>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    "affine.for"() <{lowerBoundMap = #map, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map5}> ({
    ^bb0(%arg3: index):
      "affine.for"() <{lowerBoundMap = #map, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map5}> ({
      ^bb0(%arg4: index):
        %1 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<1xf32>
        %2 = "affine.load"(%arg2, %arg3, %arg4) <{map = #map3}> : (memref<16x16xf32>, index, index) -> f32
        "affine.store"(%2, %1, %0) <{map = #map4}> : (f32, memref<1xf32>, index) -> ()
        "affine.for"() <{lowerBoundMap = #map, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map5}> ({
        ^bb0(%arg5: index):
          %4 = "affine.load"(%arg0, %arg3, %arg5) <{map = #map3}> : (memref<16x16xf32>, index, index) -> f32
          %5 = "affine.load"(%arg1, %arg5, %arg4) <{map = #map3}> : (memref<16x16xf32>, index, index) -> f32
          %6 = "affine.load"(%1) <{map = #map}> : (memref<1xf32>) -> f32
          %7 = "arith.mulf"(%4, %5) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
          %8 = "arith.addf"(%7, %6) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
          "affine.store"(%8, %1) <{map = #map}> : (f32, memref<1xf32>) -> ()
          "affine.yield"() : () -> ()
        }) : () -> ()
        %3 = "affine.load"(%1, %0) <{map = #map4}> : (memref<1xf32>, index) -> f32
        "affine.store"(%3, %arg2, %arg3, %arg4) <{map = #map3}> : (f32, memref<16x16xf32>, index, index) -> ()
        "memref.dealloc"(%1) : (memref<1xf32>) -> ()
        "affine.yield"() : () -> ()
      }) : () -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (f64) -> (), sym_name = "printFlops", sym_visibility = "private"}> ({
  }) : () -> ()
  "func.func"() <{function_type = () -> f64, sym_name = "rtclock", sym_visibility = "private"}> ({
  }) : () -> ()
}) : () -> ()

