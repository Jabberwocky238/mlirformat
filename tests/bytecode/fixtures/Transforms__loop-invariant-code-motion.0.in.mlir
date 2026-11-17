"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "nested_loops_both_having_invariant_code"}> ({
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<10xf32> loc("<stdin>":6:10)
    %1 = "arith.constant"() <{value = 7.000000e+00 : f32}> : () -> f32 loc("<stdin>":7:10)
    %2 = "arith.constant"() <{value = 8.000000e+00 : f32}> : () -> f32 loc("<stdin>":8:10)
    "affine.for"() <{lowerBoundMap = affine_map<() -> (0)>, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = affine_map<() -> (10)>}> ({
    ^bb0(%arg0: index loc("<stdin>":10:10)):
      %3 = "arith.addf"(%1, %2) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":11:12)
      "affine.for"() <{lowerBoundMap = affine_map<() -> (0)>, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = affine_map<() -> (10)>}> ({
      ^bb0(%arg1: index loc("<stdin>":13:12)):
        %4 = "arith.addf"(%3, %2) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":14:14)
        "affine.store"(%3, %0, %arg0) <{map = affine_map<(d0) -> (d0)>}> : (f32, memref<10xf32>, index) -> () loc("<stdin>":15:9)
        "affine.yield"() : () -> () loc("<stdin>":16:9)
      }) : () -> () loc("<stdin>":12:7)
      "affine.yield"() : () -> () loc("<stdin>":18:7)
    }) : () -> () loc("<stdin>":9:5)
    "func.return"() : () -> () loc("<stdin>":20:5)
  }) : () -> () loc("<stdin>":5:3)
}) : () -> () loc("<stdin>":4:1)
