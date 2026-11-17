"builtin.module"() ({
  "func.func"() <{function_type = (memref<256x512xf32>, memref<256xf32>) -> (), sym_name = "unparallel_loop_reduction_unsupported"}> ({
  ^bb0(%arg0: memref<256x512xf32> loc("<stdin>":5:8), %arg1: memref<256xf32> loc("<stdin>":5:36)):
    %0 = "arith.constant"() <{value = 1.000000e+00 : f32}> : () -> f32 loc("<stdin>":6:10)
    %1 = "affine.for"(%0) <{lowerBoundMap = affine_map<() -> (0)>, operandSegmentSizes = array<i32: 0, 0, 1>, step = 1 : index, upperBoundMap = affine_map<() -> (512)>}> ({
    ^bb0(%arg2: index loc("<stdin>":8:10), %arg3: f32 loc("<stdin>":8:24)):
      %2 = "arith.addf"(%arg3, %arg3) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":9:12)
      "affine.yield"(%2) : (f32) -> () loc("<stdin>":10:7)
    }) : (f32) -> f32 loc("<stdin>":7:10)
    "func.return"() : () -> () loc("<stdin>":12:5)
  }) : () -> () loc("<stdin>":4:3)
}) : () -> () loc("<stdin>":3:1)
