"builtin.module"() ({
  "func.func"() <{function_type = (memref<10xf32>, memref<10xf32>) -> (), sym_name = "producer_consumer_fusion"}> ({
  ^bb0(%arg0: memref<10xf32> loc("<stdin>":6:8), %arg1: memref<10xf32> loc("<stdin>":6:31)):
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<10xf32> loc("<stdin>":7:10)
    %1 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<10xf32> loc("<stdin>":8:10)
    %2 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32 loc("<stdin>":9:10)
    "affine.for"() <{lowerBoundMap = affine_map<() -> (0)>, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = affine_map<() -> (10)>}> ({
    ^bb0(%arg4: index loc("<stdin>":11:10)):
      "affine.store"(%2, %0, %arg4) <{map = affine_map<(d0) -> (d0)>}> : (f32, memref<10xf32>, index) -> () loc("<stdin>":12:7)
      "affine.store"(%2, %1, %arg4) <{map = affine_map<(d0) -> (d0)>}> : (f32, memref<10xf32>, index) -> () loc("<stdin>":13:7)
      "affine.yield"() : () -> () loc("<stdin>":14:7)
    }) : () -> () loc("<stdin>":10:5)
    "affine.for"() <{lowerBoundMap = affine_map<() -> (0)>, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = affine_map<() -> (10)>}> ({
    ^bb0(%arg3: index loc("<stdin>":17:10)):
      %5 = "affine.load"(%0, %arg3) <{map = affine_map<(d0) -> (d0)>}> : (memref<10xf32>, index) -> f32 loc("<stdin>":18:12)
      %6 = "arith.addf"(%5, %5) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":19:12)
      "affine.store"(%6, %arg0, %arg3) <{map = affine_map<(d0) -> (d0)>}> : (f32, memref<10xf32>, index) -> () loc("<stdin>":20:7)
      "affine.yield"() : () -> () loc("<stdin>":21:7)
    }) : () -> () loc("<stdin>":16:5)
    "affine.for"() <{lowerBoundMap = affine_map<() -> (0)>, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = affine_map<() -> (10)>}> ({
    ^bb0(%arg2: index loc("<stdin>":24:10)):
      %3 = "affine.load"(%1, %arg2) <{map = affine_map<(d0) -> (d0)>}> : (memref<10xf32>, index) -> f32 loc("<stdin>":25:12)
      %4 = "arith.mulf"(%3, %3) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":26:12)
      "affine.store"(%4, %arg1, %arg2) <{map = affine_map<(d0) -> (d0)>}> : (f32, memref<10xf32>, index) -> () loc("<stdin>":27:7)
      "affine.yield"() : () -> () loc("<stdin>":28:7)
    }) : () -> () loc("<stdin>":23:5)
    "func.return"() : () -> () loc("<stdin>":30:5)
  }) : () -> () loc("<stdin>":5:3)
}) : () -> () loc("<stdin>":4:1)
