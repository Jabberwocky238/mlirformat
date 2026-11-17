"builtin.module"() ({
  "func.func"() <{function_type = () -> i32, sym_name = "inline_notation"}> ({
    %0 = "foo"() : () -> i32 loc("<stdin>":6:10)
    %1 = "arith.constant"() <{value = 4 : index}> : () -> index loc("<stdin>":7:10)
    %2 = "arith.constant"() <{value = 4 : index}> : () -> index loc("<stdin>":8:10)
    "affine.for"() <{lowerBoundMap = affine_map<() -> (0)>, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = affine_map<() -> (8)>}> ({
    ^bb0(%arg0: index loc("<stdin>":10:10)):
      "affine.yield"() : () -> () loc("<stdin>":11:7)
    }) : () -> () loc("<stdin>":9:5)
    "affine.if"(%1) <{condition = affine_set<(d0) : (1 == 0)>}> ({
      "affine.yield"() : () -> () loc("<stdin>":14:7)
    }, {
    }) : (index) -> () loc("<stdin>":13:5)
    "foo.op"() : () -> () loc("<stdin>":17:5)
    "func.return"(%0) : (i32) -> () loc("<stdin>":18:5)
  }) : () -> () loc("<stdin>":5:3)
}) : () -> () loc("<stdin>":4:1)
