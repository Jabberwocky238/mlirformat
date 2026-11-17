"builtin.module"() ({
  "func.func"() <{function_type = (memref<100xi32>, memref<100xi32>, i32) -> (), sym_name = "if_else_imperfect"}> ({
  ^bb0(%arg0: memref<100xi32> loc("<stdin>":7:8), %arg1: memref<100xi32> loc("<stdin>":7:32), %arg2: i32 loc("<stdin>":7:56)):
    "affine.for"() <{lowerBoundMap = affine_map<() -> (0)>, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = affine_map<() -> (100)>}> ({
    ^bb0(%arg3: index loc("<stdin>":9:10)):
      "affine.store"(%arg2, %arg0, %arg3) <{map = affine_map<(d0) -> (d0)>}> : (i32, memref<100xi32>, index) -> () loc("<stdin>":10:7)
      "affine.for"() <{lowerBoundMap = affine_map<() -> (0)>, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = affine_map<() -> (100)>}> ({
      ^bb0(%arg4: index loc("<stdin>":12:12)):
        "affine.store"(%arg2, %arg0, %arg4) <{map = affine_map<(d0) -> (d0)>}> : (i32, memref<100xi32>, index) -> () loc("<stdin>":13:9)
        "affine.if"(%arg3) <{condition = affine_set<(d0) : (d0 - 2 >= 0)>}> ({
          "affine.store"(%arg2, %arg1, %arg4) <{map = affine_map<(d0) -> (d0)>}> : (i32, memref<100xi32>, index) -> () loc("<stdin>":15:11)
          "affine.yield"() : () -> () loc("<stdin>":16:11)
        }, {
        }) : (index) -> () loc("<stdin>":14:9)
        "func.call"() <{callee = @external}> : () -> () loc("<stdin>":19:9)
        "affine.yield"() : () -> () loc("<stdin>":20:9)
      }) : () -> () loc("<stdin>":11:7)
      "affine.store"(%arg2, %arg0, %arg3) <{map = affine_map<(d0) -> (d0)>}> : (i32, memref<100xi32>, index) -> () loc("<stdin>":22:7)
      "affine.yield"() : () -> () loc("<stdin>":23:7)
    }) : () -> () loc("<stdin>":8:5)
    "func.return"() : () -> () loc("<stdin>":25:5)
  }) : () -> () loc("<stdin>":6:3)
  "func.func"() <{function_type = () -> (), sym_name = "external", sym_visibility = "private"}> ({
  }) : () -> () loc("<stdin>":27:3)
}) : () -> () loc("<stdin>":5:1)
