"builtin.module"() ({
  "func.func"() <{function_type = (index) -> (), sym_name = "func_with_affine_ops"}> ({
  ^bb0(%arg1: index loc("<stdin>":7:8)):
    %2 = "arith.constant"() <{value = 200 : index}> : () -> index loc("<stdin>":8:10)
    "affine.for"() <{lowerBoundMap = affine_map<() -> (1)>, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = affine_map<() -> (10)>}> ({
    ^bb0(%arg2: index loc("<stdin>":10:10)):
      "affine.if"(%arg2, %2) <{condition = affine_set<(d0)[s0] : (d0 - 2 >= 0, -d0 + 4 >= 0)>}> ({
        %3 = "affine.apply"(%arg2, %arg2, %arg1) <{map = affine_map<(d0, d1)[s0] -> (d0 + d1 + s0)>}> : (index, index, index) -> index loc("<stdin>":12:14)
        "affine.yield"() : () -> () loc("<stdin>":13:9)
      }, {
      }) : (index, index) -> () loc("<stdin>":11:7)
      "affine.yield"() : () -> () loc("<stdin>":16:7)
    }) : () -> () loc("<stdin>":9:5)
    "func.return"() : () -> () loc("<stdin>":18:5)
  }) : () -> () loc("<stdin>":6:3)
  "func.func"() <{function_type = () -> (), sym_name = "inline_with_affine_ops"}> ({
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":21:10)
    "func.call"(%1) <{callee = @func_with_affine_ops}> : (index) -> () loc("<stdin>":22:5)
    "func.return"() : () -> () loc("<stdin>":23:5)
  }) : () -> () loc("<stdin>":20:3)
  "func.func"() <{function_type = () -> (), sym_name = "not_inline_in_affine_op"}> ({
    %0 = "arith.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":26:10)
    "affine.for"() <{lowerBoundMap = affine_map<() -> (1)>, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = affine_map<() -> (10)>}> ({
    ^bb0(%arg0: index loc("<stdin>":28:10)):
      "func.call"(%0) <{callee = @func_with_affine_ops}> : (index) -> () loc("<stdin>":29:7)
      "affine.yield"() : () -> () loc("<stdin>":30:7)
    }) : () -> () loc("<stdin>":27:5)
    "func.return"() : () -> () loc("<stdin>":32:5)
  }) : () -> () loc("<stdin>":25:3)
}) : () -> () loc("<stdin>":5:1)
