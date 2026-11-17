"builtin.module"() ({
  "func.func"() <{function_type = (memref<10xf32>) -> (), sym_name = "scf_and_affine"}> ({
  ^bb0(%arg0: memref<10xf32> loc("<stdin>":6:8)):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":7:10)
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":8:10)
    %2 = "arith.constant"() <{value = 10 : index}> : () -> index loc("<stdin>":9:10)
    %3 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32 loc("<stdin>":10:10)
    %4 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<10xf32> loc("<stdin>":11:10)
    %5 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<10xf32> loc("<stdin>":12:10)
    "affine.for"() <{lowerBoundMap = affine_map<() -> (0)>, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = affine_map<() -> (10)>}> ({
    ^bb0(%arg6: index loc("<stdin>":14:10)):
      %9 = "affine.load"(%arg0, %arg6) <{map = affine_map<(d0) -> (d0)>}> : (memref<10xf32>, index) -> f32 loc("<stdin>":15:12)
      "affine.store"(%9, %4, %arg6) <{map = affine_map<(d0) -> (d0)>}> : (f32, memref<10xf32>, index) -> () loc("<stdin>":16:7)
      "affine.yield"() : () -> () loc("<stdin>":17:7)
    }) : () -> () loc("<stdin>":13:5)
    "affine.for"() <{lowerBoundMap = affine_map<() -> (0)>, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = affine_map<() -> (10)>}> ({
    ^bb0(%arg5: index loc("<stdin>":20:10)):
      %8 = "affine.load"(%4, %arg5) <{map = affine_map<(d0) -> (d0)>}> : (memref<10xf32>, index) -> f32 loc("<stdin>":21:12)
      "affine.store"(%8, %5, %arg5) <{map = affine_map<(d0) -> (d0)>}> : (f32, memref<10xf32>, index) -> () loc("<stdin>":22:7)
      "affine.yield"() : () -> () loc("<stdin>":23:7)
    }) : () -> () loc("<stdin>":19:5)
    "scf.for"(%0, %2, %1) ({
    ^bb0(%arg4: index loc("<stdin>":26:10)):
      "memref.store"(%3, %4, %arg4) : (f32, memref<10xf32>, index) -> () loc("<stdin>":27:7)
      "scf.yield"() : () -> () loc("<stdin>":28:7)
    }) : (index, index, index) -> () loc("<stdin>":25:5)
    "affine.for"() <{lowerBoundMap = affine_map<() -> (0)>, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = affine_map<() -> (10)>}> ({
    ^bb0(%arg3: index loc("<stdin>":31:10)):
      %7 = "affine.load"(%arg0, %arg3) <{map = affine_map<(d0) -> (d0)>}> : (memref<10xf32>, index) -> f32 loc("<stdin>":32:12)
      "affine.store"(%7, %4, %arg3) <{map = affine_map<(d0) -> (d0)>}> : (f32, memref<10xf32>, index) -> () loc("<stdin>":33:7)
      "affine.yield"() : () -> () loc("<stdin>":34:7)
    }) : () -> () loc("<stdin>":30:5)
    "scf.for"(%0, %2, %1) ({
    ^bb0(%arg2: index loc("<stdin>":37:10)):
      "memref.store"(%3, %4, %arg2) : (f32, memref<10xf32>, index) -> () loc("<stdin>":38:7)
      "scf.yield"() : () -> () loc("<stdin>":39:7)
    }) : (index, index, index) -> () loc("<stdin>":36:5)
    "affine.for"() <{lowerBoundMap = affine_map<() -> (0)>, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = affine_map<() -> (10)>}> ({
    ^bb0(%arg1: index loc("<stdin>":42:10)):
      %6 = "affine.load"(%4, %arg1) <{map = affine_map<(d0) -> (d0)>}> : (memref<10xf32>, index) -> f32 loc("<stdin>":43:12)
      "affine.store"(%6, %5, %arg1) <{map = affine_map<(d0) -> (d0)>}> : (f32, memref<10xf32>, index) -> () loc("<stdin>":44:7)
      "affine.yield"() : () -> () loc("<stdin>":45:7)
    }) : () -> () loc("<stdin>":41:5)
    "func.return"() : () -> () loc("<stdin>":47:5)
  }) : () -> () loc("<stdin>":5:3)
}) : () -> () loc("<stdin>":4:1)
