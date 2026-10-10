#map = affine_map<(d0) -> (d0)>
#map1 = affine_map<() -> (0)>
#map2 = affine_map<() -> (100)>
#set = affine_set<(d0) : (d0 - 2 >= 0)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<100xi32>, memref<100xi32>, i32) -> (), sym_name = "if_else_imperfect"}> ({
  ^bb0(%arg0: memref<100xi32>, %arg1: memref<100xi32>, %arg2: i32):
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
    ^bb0(%arg3: index):
      "affine.store"(%arg2, %arg0, %arg3) <{map = #map}> : (i32, memref<100xi32>, index) -> ()
      "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
      ^bb0(%arg4: index):
        "affine.store"(%arg2, %arg0, %arg4) <{map = #map}> : (i32, memref<100xi32>, index) -> ()
        "affine.if"(%arg3) <{condition = #set}> ({
          "affine.store"(%arg2, %arg1, %arg4) <{map = #map}> : (i32, memref<100xi32>, index) -> ()
          "affine.yield"() : () -> ()
        }, {
        }) : (index) -> ()
        "func.call"() <{callee = @external}> : () -> ()
        "affine.yield"() : () -> ()
      }) : () -> ()
      "affine.store"(%arg2, %arg0, %arg3) <{map = #map}> : (i32, memref<100xi32>, index) -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "external", sym_visibility = "private"}> ({
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0) -> (d0)>
#map1 = affine_map<() -> (0)>
#map2 = affine_map<() -> (100)>
#map3 = affine_map<(d0) -> (d0 + 1)>
#map4 = affine_map<() -> (99)>
#set = affine_set<(d0) : (d0 - 2 >= 0)>
#set1 = affine_set<(d0, d1) : (d0 - 2 >= 0, -d1 + 80 >= 0)>
#set2 = affine_set<(d0, d1) : (d0 - 1 >= 0, -d0 + 99 >= 0)>
#set3 = affine_set<(d0) : (d0 - 1 >= 0, -d0 + 99 >= 0)>
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "foo", sym_visibility = "private"}> ({
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "bar", sym_visibility = "private"}> ({
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "abc", sym_visibility = "private"}> ({
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "xyz", sym_visibility = "private"}> ({
  }) : () -> ()
  "func.func"() <{function_type = (memref<100xi32>, i32) -> (), sym_name = "if_then_perfect"}> ({
  ^bb0(%arg13: memref<100xi32>, %arg14: i32):
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
    ^bb0(%arg15: index):
      "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
      ^bb0(%arg16: index):
        "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
        ^bb0(%arg17: index):
          "affine.if"(%arg15) <{condition = #set}> ({
            "affine.store"(%arg14, %arg13, %arg15) <{map = #map}> : (i32, memref<100xi32>, index) -> ()
            "affine.yield"() : () -> ()
          }, {
          }) : (index) -> ()
          "affine.yield"() : () -> ()
        }) : () -> ()
        "affine.yield"() : () -> ()
      }) : () -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<100xi32>, i32) -> (), sym_name = "if_else_perfect"}> ({
  ^bb0(%arg8: memref<100xi32>, %arg9: i32):
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map4}> ({
    ^bb0(%arg10: index):
      "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
      ^bb0(%arg11: index):
        "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
        ^bb0(%arg12: index):
          "func.call"() <{callee = @foo}> : () -> ()
          "affine.if"(%arg10, %arg11) <{condition = #set1}> ({
            "affine.store"(%arg9, %arg8, %arg10) <{map = #map}> : (i32, memref<100xi32>, index) -> ()
            "func.call"() <{callee = @abc}> : () -> ()
            "affine.yield"() : () -> ()
          }, {
            "affine.store"(%arg9, %arg8, %arg10) <{map = #map3}> : (i32, memref<100xi32>, index) -> ()
            "func.call"() <{callee = @xyz}> : () -> ()
            "affine.yield"() : () -> ()
          }) : (index, index) -> ()
          "func.call"() <{callee = @bar}> : () -> ()
          "affine.yield"() : () -> ()
        }) : () -> ()
        "affine.yield"() : () -> ()
      }) : () -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<100xi32>, index, i32) -> (), sym_name = "if_then_imperfect"}> ({
  ^bb0(%arg4: memref<100xi32>, %arg5: index, %arg6: i32):
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
    ^bb0(%arg7: index):
      "affine.store"(%arg6, %arg4) <{map = #map1}> : (i32, memref<100xi32>) -> ()
      "affine.if"(%arg5) <{condition = #set}> ({
        "affine.store"(%arg6, %arg4, %arg7) <{map = #map}> : (i32, memref<100xi32>, index) -> ()
        "affine.yield"() : () -> ()
      }, {
      }) : (index) -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "hoist_after_canonicalize"}> ({
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
    ^bb0(%arg2: index):
      "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
      ^bb0(%arg3: index):
        "affine.if"(%arg3) <{condition = #set}> ({
          "affine.if"(%arg2, %arg3) <{condition = #set2}> ({
            "func.call"() <{callee = @foo}> : () -> ()
            "affine.yield"() : () -> ()
          }, {
          }) : (index, index) -> ()
          "affine.yield"() : () -> ()
        }, {
        }) : (index) -> ()
        "affine.yield"() : () -> ()
      }) : () -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index) -> (), sym_name = "handle_dead_if"}> ({
  ^bb0(%arg0: index):
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
    ^bb0(%arg1: index):
      "affine.if"(%arg0) <{condition = #set3}> ({
        "affine.yield"() : () -> ()
      }, {
      }) : (index) -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<() -> (0, 0)>
#map1 = affine_map<(d0) -> (d0 * 3)>
#map2 = affine_map<(d0) -> (d0 * 3 + 3)>
#map3 = affine_map<(d0) -> (d0 * 16)>
#map4 = affine_map<(d0) -> (d0 * 16 + 16)>
#map5 = affine_map<(d0) -> (d0 * 480)>
#map6 = affine_map<(d0)[s0] -> (s0, d0 * 3 + 3)>
#map7 = affine_map<(d0) -> (d0 * 110)>
#map8 = affine_map<(d0)[s0] -> (s0, d0 * 16 + 16)>
#map9 = affine_map<(d0)[s0] -> (s0, d0 * 480 + 480)>
#map10 = affine_map<()[s0] -> (s0, 100)>
#map11 = affine_map<(d0)[s0] -> (d0 * 110 + 110, s0 floordiv 3)>
#map12 = affine_map<() -> (0)>
#map13 = affine_map<() -> (100)>
#map14 = affine_map<(d0) -> (d0)>
#map15 = affine_map<(d0) -> (d0 + 32)>
#map16 = affine_map<(d0) -> (d0 + 32, 35)>
#map17 = affine_map<() -> (35)>
#set = affine_set<(d0, d1)[s0, s1] : (d0 * -16 + s0 - 16 >= 0, d1 * -3 + s1 - 3 >= 0)>
#set1 = affine_set<() : (0 == 0)>
#set2 = affine_set<()[s0] : (s0 >= 0)>
#set3 = affine_set<(d0) : (-d0 + 3 >= 0)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<?x?xf64>, memref<?x?xf64>, f64, index, index, index, index) -> (), sym_name = "perfect_if_else"}> ({
  ^bb0(%arg6: memref<?x?xf64>, %arg7: memref<?x?xf64>, %arg8: f64, %arg9: index, %arg10: index, %arg11: index, %arg12: index):
    "affine.for"(%arg10, %arg10, %arg12) <{lowerBoundMap = #map7, operandSegmentSizes = array<i32: 1, 2, 0>, step = 1 : index, upperBoundMap = #map11}> ({
    ^bb0(%arg13: index):
      "affine.parallel"(%arg12) <{lowerBoundsGroups = dense<1> : tensor<2xi32>, lowerBoundsMap = #map, reductions = [], steps = [10, 10], upperBoundsGroups = dense<1> : tensor<2xi32>, upperBoundsMap = #map10}> ({
      ^bb0(%arg14: index, %arg15: index):
        "affine.for"(%arg9, %arg9, %arg12) <{lowerBoundMap = #map5, operandSegmentSizes = array<i32: 1, 2, 0>, step = 1 : index, upperBoundMap = #map9}> ({
        ^bb0(%arg16: index):
          "affine.if"(%arg11, %arg13, %arg12, %arg12) <{condition = #set}> ({
            "affine.for"(%arg11, %arg11) <{lowerBoundMap = #map3, operandSegmentSizes = array<i32: 1, 1, 0>, step = 1 : index, upperBoundMap = #map4}> ({
            ^bb0(%arg19: index):
              "affine.for"(%arg13, %arg13) <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 1, 1, 0>, step = 1 : index, upperBoundMap = #map2}> ({
              ^bb0(%arg20: index):
                "affine.store"(%arg8, %arg6) <{map = #map}> : (f64, memref<?x?xf64>) -> ()
                "affine.yield"() : () -> ()
              }) : (index, index) -> ()
              "affine.yield"() : () -> ()
            }) : (index, index) -> ()
            "affine.yield"() : () -> ()
          }, {
            "affine.for"(%arg11, %arg11, %arg12) <{lowerBoundMap = #map7, operandSegmentSizes = array<i32: 1, 2, 0>, step = 1 : index, upperBoundMap = #map8}> ({
            ^bb0(%arg17: index):
              "affine.for"(%arg13, %arg13, %arg12) <{lowerBoundMap = #map5, operandSegmentSizes = array<i32: 1, 2, 0>, step = 1 : index, upperBoundMap = #map6}> ({
              ^bb0(%arg18: index):
                "affine.store"(%arg8, %arg6) <{map = #map}> : (f64, memref<?x?xf64>) -> ()
                "affine.yield"() : () -> ()
              }) : (index, index, index) -> ()
              "affine.yield"() : () -> ()
            }) : (index, index, index) -> ()
            "affine.yield"() : () -> ()
          }) : (index, index, index, index) -> ()
          "affine.yield"() : () -> ()
        }) : (index, index, index) -> ()
        "affine.yield"() : () -> ()
      }) : (index) -> ()
      "affine.yield"() : () -> ()
    }) : (index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index) -> (), sym_name = "multiple_if"}> ({
  ^bb0(%arg4: index):
    "affine.if"() <{condition = #set1}> ({
      "func.call"() <{callee = @external}> : () -> ()
      "affine.yield"() : () -> ()
    }, {
    }) : () -> ()
    "affine.for"() <{lowerBoundMap = #map12, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map13}> ({
    ^bb0(%arg5: index):
      "affine.if"(%arg4) <{condition = #set2}> ({
        "func.call"() <{callee = @external}> : () -> ()
        "affine.yield"() : () -> ()
      }, {
      }) : (index) -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "external", sym_visibility = "private"}> ({
  }) : () -> ()
  "func.func"() <{function_type = (memref<35xf32>) -> memref<35xf32>, sym_name = "affine_parallel"}> ({
  ^bb0(%arg0: memref<35xf32>):
    %0 = "llvm.mlir.constant"() <{value = 1.000000e+00 : f32}> : () -> f32
    %1 = "memref.alloc"() <{alignment = 64 : i64, operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<35xf32>
    "affine.parallel"() <{lowerBoundsGroups = dense<1> : tensor<1xi32>, lowerBoundsMap = #map12, reductions = [], steps = [32], upperBoundsGroups = dense<1> : tensor<1xi32>, upperBoundsMap = #map17}> ({
    ^bb0(%arg1: index):
      "affine.if"(%arg1) <{condition = #set3}> ({
        "affine.parallel"(%arg1, %arg1) <{lowerBoundsGroups = dense<1> : tensor<1xi32>, lowerBoundsMap = #map14, reductions = [], steps = [1], upperBoundsGroups = dense<1> : tensor<1xi32>, upperBoundsMap = #map15}> ({
        ^bb0(%arg3: index):
          %4 = "affine.load"(%arg0, %arg3) <{map = #map14}> : (memref<35xf32>, index) -> f32
          %5 = "llvm.fdiv"(%0, %4) <{fastmathFlags = #llvm.fastmath<none>}> : (f32, f32) -> f32
          "affine.store"(%5, %1, %arg3) <{map = #map14}> : (f32, memref<35xf32>, index) -> ()
          "affine.yield"() : () -> ()
        }) : (index, index) -> ()
        "affine.yield"() : () -> ()
      }, {
        "affine.parallel"(%arg1, %arg1) <{lowerBoundsGroups = dense<1> : tensor<1xi32>, lowerBoundsMap = #map14, reductions = [], steps = [1], upperBoundsGroups = dense<2> : tensor<1xi32>, upperBoundsMap = #map16}> ({
        ^bb0(%arg2: index):
          %2 = "affine.load"(%arg0, %arg2) <{map = #map14}> : (memref<35xf32>, index) -> f32
          %3 = "llvm.fdiv"(%0, %2) <{fastmathFlags = #llvm.fastmath<none>}> : (f32, f32) -> f32
          "affine.store"(%3, %1, %arg2) <{map = #map14}> : (f32, memref<35xf32>, index) -> ()
          "affine.yield"() : () -> ()
        }) : (index, index) -> ()
        "affine.yield"() : () -> ()
      }) : (index) -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"(%1) : (memref<35xf32>) -> ()
  }) : () -> ()
}) : () -> ()

