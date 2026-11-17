"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "affine_constant_loops"}> ({
    "affine.for"() <{lowerBoundMap = affine_map<() -> (0)>, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = affine_map<() -> (10)>}> ({
    ^bb0(%arg2: index loc("<stdin>":6:10)):
      "affine.yield"() : () -> () loc("<stdin>":7:7)
    }) : () -> () loc("<stdin>":5:5)
    "affine.for"() <{lowerBoundMap = affine_map<() -> (0)>, operandSegmentSizes = array<i32: 0, 0, 0>, step = 2 : index, upperBoundMap = affine_map<() -> (10)>}> ({
    ^bb0(%arg1: index loc("<stdin>":10:10)):
      "affine.yield"() : () -> () loc("<stdin>":11:7)
    }) : () -> () loc("<stdin>":9:5)
    "affine.for"() <{lowerBoundMap = affine_map<() -> (10)>, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = affine_map<() -> (0)>}> ({
    ^bb0(%arg0: index loc("<stdin>":14:10)):
      "affine.yield"() : () -> () loc("<stdin>":15:7)
    }) : () -> () loc("<stdin>":13:5)
    "func.return"() : () -> () loc("<stdin>":17:5)
  }) : () -> () loc("<stdin>":4:3)
}) : () -> () loc("<stdin>":3:1)
