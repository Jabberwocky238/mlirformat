"builtin.module"() ({
  "func.func"() <{function_type = (memref<256x512xf32>, memref<256xf32>) -> (), sym_name = "vecdim_reduction"}> ({
  ^bb0(%arg0: memref<256x512xf32> loc("<stdin>":8:8), %arg1: memref<256xf32> loc("<stdin>":8:36)):
    %0 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32 loc("<stdin>":9:10)
    "affine.for"() <{lowerBoundMap = affine_map<() -> (0)>, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = affine_map<() -> (256)>}> ({
    ^bb0(%arg2: index loc("<stdin>":11:10)):
      %1 = "affine.for"(%0) <{lowerBoundMap = affine_map<() -> (0)>, operandSegmentSizes = array<i32: 0, 0, 1>, step = 1 : index, upperBoundMap = affine_map<() -> (512)>}> ({
      ^bb0(%arg3: index loc("<stdin>":13:12), %arg4: f32 loc("<stdin>":13:26)):
        %2 = "affine.load"(%arg0, %arg2, %arg3) <{map = affine_map<(d0, d1) -> (d0, d1)>}> : (memref<256x512xf32>, index, index) -> f32 loc("<stdin>":14:14)
        %3 = "arith.addf"(%arg4, %2) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":15:14)
        "affine.yield"(%3) : (f32) -> () loc("<stdin>":16:9)
      }) : (f32) -> f32 loc("<stdin>":12:12)
      "affine.store"(%1, %arg1, %arg2) <{map = affine_map<(d0) -> (d0)>}> : (f32, memref<256xf32>, index) -> () loc("<stdin>":18:7)
      "affine.yield"() : () -> () loc("<stdin>":19:7)
    }) : () -> () loc("<stdin>":10:5)
    "func.return"() : () -> () loc("<stdin>":21:5)
  }) : () -> () loc("<stdin>":7:3)
}) : () -> () loc("<stdin>":6:1)
