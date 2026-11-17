"builtin.module"() ({
  "func.func"() <{function_type = (index, index, index) -> (), sym_name = "permute"}> ({
  ^bb0(%arg0: index loc("<stdin>":5:8), %arg1: index loc("<stdin>":5:22), %arg2: index loc("<stdin>":5:36)):
    "abc"() : () -> () loc("<stdin>":6:5)
    "affine.for"(%arg0) <{lowerBoundMap = affine_map<() -> (0)>, operandSegmentSizes = array<i32: 0, 1, 0>, step = 1 : index, upperBoundMap = affine_map<()[s0] -> (s0)>}> ({
    ^bb0(%arg3: index loc("<stdin>":8:10)):
      "affine.for"(%arg1) <{lowerBoundMap = affine_map<() -> (0)>, operandSegmentSizes = array<i32: 0, 1, 0>, step = 1 : index, upperBoundMap = affine_map<()[s0] -> (s0)>}> ({
      ^bb0(%arg4: index loc("<stdin>":10:12)):
        "affine.for"(%arg2) <{lowerBoundMap = affine_map<() -> (0)>, operandSegmentSizes = array<i32: 0, 1, 0>, step = 1 : index, upperBoundMap = affine_map<()[s0] -> (s0)>}> ({
        ^bb0(%arg5: index loc("<stdin>":12:14)):
          "foo"(%arg3, %arg4) : (index, index) -> () loc("<stdin>":13:11)
          "bar"(%arg5) : (index) -> () loc("<stdin>":14:11)
          "affine.yield"() : () -> () loc("<stdin>":15:11)
        }) : (index) -> () loc("<stdin>":11:9)
        "affine.yield"() : () -> () loc("<stdin>":17:9)
      }) : (index) -> () loc("<stdin>":9:7)
      "affine.yield"() : () -> () loc("<stdin>":19:7)
    }) : (index) -> () loc("<stdin>":7:5)
    "xyz"() : () -> () loc("<stdin>":21:5)
    "func.return"() : () -> () loc("<stdin>":22:5)
  }) : () -> () loc("<stdin>":4:3)
}) : () -> () loc("<stdin>":3:1)
