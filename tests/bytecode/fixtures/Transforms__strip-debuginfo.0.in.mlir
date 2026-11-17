"builtin.module"() ({
  "func.func"() <{function_type = () -> i32, sym_name = "inline_notation"}> ({
    %0 = "foo"() : () -> i32 loc("<stdin>":6:10)
    "affine.for"() <{lowerBoundMap = affine_map<() -> (0)>, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = affine_map<() -> (8)>}> ({
    ^bb0(%arg2: index loc("<stdin>":8:10)):
      "affine.yield"() : () -> () loc("<stdin>":9:7)
    }) : () -> () loc("<stdin>":7:5)
    %1 = "arith.constant"() <{value = 4 : index}> : () -> index loc("<stdin>":11:10)
    "affine.if"(%1) <{condition = affine_set<(d0) : (1 == 0)>}> ({
      "affine.yield"() : () -> () loc("<stdin>":13:7)
    }, {
    }) : (index) -> () loc("<stdin>":12:5)
    "foo.region"() ({
    ^bb0(%arg0: i32 loc("<stdin>":17:10), %arg1: i32 loc("<stdin>":17:22)):
      %2 = "arith.addi"(%arg0, %arg0) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32 loc("<stdin>":18:12)
      "foo.yield"(%2) : (i32) -> () loc("<stdin>":19:7)
    }) : () -> () loc("<stdin>":16:5)
    "func.return"(%0) : (i32) -> () loc("<stdin>":21:5)
  }) : () -> () loc("<stdin>":5:3)
}) : () -> () loc("<stdin>":4:1)
