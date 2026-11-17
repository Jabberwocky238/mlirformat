"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "slice_depth1_loop_nest_with_offsets"}> ({
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<100xf32> loc("<stdin>":10:10)
    %1 = "arith.constant"() <{value = 7.000000e+00 : f32}> : () -> f32 loc("<stdin>":11:10)
    "affine.for"() <{lowerBoundMap = affine_map<() -> (0)>, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = affine_map<() -> (16)>}> ({
    ^bb0(%arg1: index loc("<stdin>":13:10)):
      %4 = "affine.apply"(%arg1) <{map = affine_map<(d0) -> (d0 + 2)>}> : (index) -> index loc("<stdin>":14:12)
      "affine.store"(%1, %0, %4) <{map = affine_map<(d0) -> (d0)>}> : (f32, memref<100xf32>, index) -> () loc("<stdin>":15:7)
      "affine.yield"() : () -> () loc("<stdin>":16:7)
    }) : () -> () loc("<stdin>":12:5)
    "affine.for"() <{lowerBoundMap = affine_map<() -> (4)>, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = affine_map<() -> (8)>}> ({
    ^bb0(%arg0: index loc("<stdin>":19:10)):
      %2 = "affine.apply"(%arg0) <{map = affine_map<(d0) -> (d0 - 1)>}> : (index) -> index loc("<stdin>":20:12)
      %3 = "affine.load"(%0, %2) <{map = affine_map<(d0) -> (d0)>}> : (memref<100xf32>, index) -> f32 loc("<stdin>":21:12)
      "affine.yield"() : () -> () loc("<stdin>":22:7)
    }) : () -> () loc("<stdin>":18:5)
    "func.return"() : () -> () loc("<stdin>":24:5)
  }) : () -> () loc("<stdin>":9:3)
}) : () -> () loc("<stdin>":8:1)
