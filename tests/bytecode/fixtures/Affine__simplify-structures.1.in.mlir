"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "external", sym_visibility = "private"}> ({
  }) : () -> () loc("<stdin>":6:3)
  "func.func"() <{function_type = (index, index) -> (), sym_name = "simplify_set"}> ({
  ^bb0(%arg0: index loc("<stdin>":9:8), %arg1: index loc("<stdin>":9:22)):
    "affine.if"(%arg0, %arg1) <{condition = affine_set<(d0, d1) : (d0 - d1 + d1 + d0 >= 0, 2 >= 0, d0 >= 0, -d0 + 50 >= 0, -d0 + 100 >= 0)>}> ({
      "func.call"() <{callee = @external}> : () -> () loc("<stdin>":11:7)
      "affine.yield"() : () -> () loc("<stdin>":12:7)
    }, {
    }) : (index, index) -> () loc("<stdin>":10:5)
    "affine.if"(%arg0, %arg1) <{condition = affine_set<(d0, d1) : (d0 mod 2 - 1 == 0, d0 mod 2 == 0)>}> ({
      "func.call"() <{callee = @external}> : () -> () loc("<stdin>":16:7)
      "affine.yield"() : () -> () loc("<stdin>":17:7)
    }, {
    }) : (index, index) -> () loc("<stdin>":15:5)
    "affine.if"(%arg0, %arg1) <{condition = affine_set<(d0, d1) : (1 >= 0, 3 >= 0)>}> ({
      "func.call"() <{callee = @external}> : () -> () loc("<stdin>":21:7)
      "affine.yield"() : () -> () loc("<stdin>":22:7)
    }, {
    }) : (index, index) -> () loc("<stdin>":20:5)
    "func.return"() : () -> () loc("<stdin>":25:5)
  }) : () -> () loc("<stdin>":8:3)
}) : () -> () loc("<stdin>":5:1)
