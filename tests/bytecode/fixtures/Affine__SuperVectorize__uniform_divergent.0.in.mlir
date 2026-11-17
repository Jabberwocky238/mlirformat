"builtin.module"() ({
  "func.func"() <{function_type = (memref<512xf32>, f32) -> (), sym_name = "uniform_arg"}> ({
  ^bb0(%arg0: memref<512xf32> loc("<stdin>":6:8), %arg1: f32 loc("<stdin>":6:32)):
    "affine.for"() <{lowerBoundMap = affine_map<() -> (0)>, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = affine_map<() -> (512)>}> ({
    ^bb0(%arg2: index loc("<stdin>":8:10)):
      %0 = "affine.load"(%arg0, %arg2) <{map = affine_map<(d0) -> (d0)>}> : (memref<512xf32>, index) -> f32 loc("<stdin>":9:12)
      %1 = "arith.addf"(%0, %arg1) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":10:12)
      "affine.yield"() : () -> () loc("<stdin>":11:7)
    }) : () -> () loc("<stdin>":7:5)
    "func.return"() : () -> () loc("<stdin>":13:5)
  }) : () -> () loc("<stdin>":5:3)
}) : () -> () loc("<stdin>":4:1)
