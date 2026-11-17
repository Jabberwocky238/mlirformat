"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "empty"}> ({
    "affine.for"() <{lowerBoundMap = affine_map<() -> (0)>, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = affine_map<() -> (10)>}> ({
    ^bb0(%arg0: index loc("<stdin>":7:10)):
      "affine.yield"() : () -> () loc("<stdin>":8:7)
    }) {some_attr = true} : () -> () loc("<stdin>":6:5)
    "affine.if"() <{condition = affine_set<() : (0 == 0)>}> ({
      "affine.yield"() : () -> () loc("<stdin>":11:7)
    }, {
    }) {some_attr = true} : () -> () loc("<stdin>":10:5)
    "affine.if"() <{condition = affine_set<() : (0 == 0)>}> ({
      "affine.yield"() : () -> () loc("<stdin>":15:7)
    }, {
      "foo"() : () -> () loc("<stdin>":17:7)
      "affine.yield"() : () -> () loc("<stdin>":18:7)
    }) {some_attr = true} : () -> () loc("<stdin>":14:5)
    "func.return"() : () -> () loc("<stdin>":20:5)
  }) : () -> () loc("<stdin>":5:3)
}) : () -> () loc("<stdin>":4:1)
