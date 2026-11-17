"builtin.module"() ({
  "func.func"() <{function_type = (memref<?xf32>, memref<?xf32>) -> (), sym_name = "one_d_loop"}> ({
  ^bb0(%arg0: memref<?xf32> loc("<stdin>":5:8), %arg1: memref<?xf32> loc("<stdin>":5:30)):
    "affine.for"() <{lowerBoundMap = affine_map<() -> (0)>, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = affine_map<() -> (42)>}> ({
    ^bb0(%arg2: index loc("<stdin>":7:10)):
      %0 = "memref.load"(%arg0, %arg2) : (memref<?xf32>, index) -> f32 loc("<stdin>":8:12)
      "memref.store"(%0, %arg1, %arg2) : (f32, memref<?xf32>, index) -> () loc("<stdin>":9:7)
      "affine.yield"() : () -> () loc("<stdin>":10:7)
    }) : () -> () loc("<stdin>":6:5)
    "func.return"() : () -> () loc("<stdin>":12:5)
  }) : () -> () loc("<stdin>":4:3)
}) : () -> () loc("<stdin>":3:1)
