#map = affine_map<() -> (1)>
#map1 = affine_map<() -> (100)>
#map2 = affine_map<() -> (10)>
#map3 = affine_map<() -> (0)>
#set = affine_set<(d0, d1) : (2 == 0)>
#set1 = affine_set<(d0, d1) : (1 >= 0, -1 >= 0)>
#set2 = affine_set<(d0, d1) : (d0 - 100 == 0, d1 - 10 == 0, -d0 + 100 >= 0, d1 >= 0, d1 + 101 >= 0)>
#set3 = affine_set<(d0, d1)[s0, s1] : (d0 - s0 == 0, d0 + s0 == 0, s0 - 1 == 0)>
#set4 = affine_set<(d0, d1)[s0, s1] : (d0 * 7 + d1 * 5 + s0 * 11 + s1 == 0, d0 * 5 - d1 * 11 + s0 * 7 + s1 == 0, d0 * 11 + d1 * 7 - s0 * 5 + s1 == 0, d0 * 7 + d1 * 5 + s0 * 11 + s1 == 0)>
#set5 = affine_set<(d0, d1)[s0, s1] : (d0 * 7 + d1 * 5 + s0 * 11 + s1 == 0, d0 * 5 - d1 * 11 + s0 * 7 + s1 == 0, d0 * 11 + d1 * 7 - s0 * 5 + s1 == 0, d0 * 7 + d1 * 5 + s0 * 11 + s1 == 0, d0 - 1 == 0, d0 + 2 == 0)>
#set6 = affine_set<(d0, d1, d2, d3, d4, d5) : (d0 * 1089234 + d1 * 203472 + 82342 >= 0, d0 * -55 + d1 * 24 + d2 * 238 - d3 * 234 - 9743 >= 0, d0 * -5445 - d1 * 284 + d2 * 23 + d3 * 34 - 5943 >= 0, d0 * -5445 + d1 * 284 + d2 * 238 - d3 * 34 >= 0, d0 * 445 + d1 * 284 + d2 * 238 + d3 * 39 >= 0, d0 * -545 + d1 * 214 + d2 * 218 - d3 * 94 >= 0, d0 * 44 - d1 * 184 - d2 * 231 + d3 * 14 >= 0, d0 * -45 + d1 * 284 + d2 * 138 - d3 * 39 >= 0, d0 * 154 - d1 * 84 + d2 * 238 - d3 * 34 >= 0, d0 * 54 - d1 * 284 - d2 * 223 + d3 * 384 >= 0, d0 * -55 + d1 * 284 + d2 * 23 + d3 * 34 >= 0, d0 * 54 - d1 * 84 + d2 * 28 - d3 * 34 >= 0, d0 * 54 - d1 * 24 - d2 * 23 + d3 * 34 >= 0, d0 * -55 + d1 * 24 + d2 * 23 + d3 * 4 >= 0, d0 * 15 - d1 * 84 + d2 * 238 - d3 * 3 >= 0, d0 * 5 - d1 * 24 - d2 * 223 + d3 * 84 >= 0, d0 * -5 + d1 * 284 + d2 * 23 - d3 * 4 >= 0, d0 * 14 + d2 * 4 + 7234 >= 0, d0 * -174 - d2 * 534 + 9834 >= 0, d0 * 194 - d2 * 954 + 9234 >= 0, d0 * 47 - d2 * 534 + 9734 >= 0, d0 * -194 - d2 * 934 + 984 >= 0, d0 * -947 - d2 * 953 + 234 >= 0, d0 * 184 - d2 * 884 + 884 >= 0, d0 * -174 + d2 * 834 + 234 >= 0, d0 * 844 + d2 * 634 + 9874 >= 0, d2 * -797 - d3 * 79 + 257 >= 0, d0 * 2039 + d2 * 793 - d3 * 99 - d4 * 24 + d5 * 234 >= 0, d2 * 78 - d5 * 788 + 257 >= 0, d3 - (d5 + d0 * 97) floordiv 423 >= 0, ((d0 + (d3 mod 5) floordiv 2342) * 234) mod 2309 + (d0 + d3 * 2038) floordiv 208 >= 0, ((((d0 + d3 * 2300) * 239) floordiv 2342) mod 2309) mod 239423 == 0, d0 + d3 mod 2642 + (((((d3 + d0 * 2) mod 1247) mod 2038) mod 2390) mod 2039) floordiv 55 >= 0)>
#set7 = affine_set<(d0, d1) : (d0 - d1 >= 0, d1 - d0 - 1 >= 0)>
#set8 = affine_set<(d0) : (d0 >= 0, -d0 - 1 >= 0)>
#set9 = affine_set<(d0)[s0, s1] : (d0 >= 0, -d0 + s0 - 1 >= 0, -s0 >= 0)>
#set10 = affine_set<(d0, d1, d2) : (d0 - d1 == 0, d2 - d0 >= 0, d0 - d1 - 1 >= 0)>
#set11 = affine_set<(d0, d1) : (d0 * 2 - d1 * 2 - 1 == 0, d0 >= 0, -d0 + 100 >= 0, d1 >= 0, -d1 + 100 >= 0)>
#set12 = affine_set<(d0, d1) : (d1 == 0, d0 - 1 >= 0, -d0 - 1 >= 0)>
#set13 = affine_set<(d0) : (d0 * 8 - 4 >= 0, d0 * -8 + 7 >= 0)>
#set14 = affine_set<(d0, d1) : (d0 - d1 * 4 == 0, d1 * 4 - 5 >= 0, d1 * -4 + 7 >= 0)>
#set15 = affine_set<(d0, d1) : (d0 * 4 + d1 * 8 - 9 >= 0, d0 * -4 - d1 * 8 + 11 >= 0)>
#set16 = affine_set<(d0, d1, d2) : (d0 - d2 * 4 == 0, d0 + d1 * 8 - 9 >= 0, -d0 - d1 * 8 + 11 >= 0)>
#set17 = affine_set<(d0) : (d0 mod 2 - 3 == 0)>
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "external", sym_visibility = "private"}> ({
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "test_gaussian_elimination_empty_set0"}> ({
    "affine.for"() <{lowerBoundMap = #map, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
    ^bb0(%arg22: index):
      "affine.for"() <{lowerBoundMap = #map, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map1}> ({
      ^bb0(%arg23: index):
        "affine.if"(%arg22, %arg23) <{condition = #set}> ({
          "func.call"() <{callee = @external}> : () -> ()
          "affine.yield"() : () -> ()
        }, {
        }) : (index, index) -> ()
        "affine.yield"() : () -> ()
      }) : () -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "test_gaussian_elimination_empty_set1"}> ({
    "affine.for"() <{lowerBoundMap = #map, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
    ^bb0(%arg20: index):
      "affine.for"() <{lowerBoundMap = #map, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map1}> ({
      ^bb0(%arg21: index):
        "affine.if"(%arg20, %arg21) <{condition = #set1}> ({
          "func.call"() <{callee = @external}> : () -> ()
          "affine.yield"() : () -> ()
        }, {
        }) : (index, index) -> ()
        "affine.yield"() : () -> ()
      }) : () -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "test_gaussian_elimination_non_empty_set2"}> ({
    "affine.for"() <{lowerBoundMap = #map, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
    ^bb0(%arg18: index):
      "affine.for"() <{lowerBoundMap = #map, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map1}> ({
      ^bb0(%arg19: index):
        "affine.if"(%arg18, %arg19) <{condition = #set2}> ({
          "func.call"() <{callee = @external}> : () -> ()
          "affine.yield"() : () -> ()
        }, {
        }) : (index, index) -> ()
        "affine.yield"() : () -> ()
      }) : () -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "test_gaussian_elimination_empty_set3"}> ({
    %4 = "arith.constant"() <{value = 7 : index}> : () -> index
    %5 = "arith.constant"() <{value = 11 : index}> : () -> index
    "affine.for"() <{lowerBoundMap = #map, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
    ^bb0(%arg16: index):
      "affine.for"() <{lowerBoundMap = #map, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map1}> ({
      ^bb0(%arg17: index):
        "affine.if"(%arg16, %arg17, %4, %5) <{condition = #set3}> ({
          "func.call"() <{callee = @external}> : () -> ()
          "affine.yield"() : () -> ()
        }, {
        }) : (index, index, index, index) -> ()
        "affine.yield"() : () -> ()
      }) : () -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "test_gaussian_elimination_non_empty_set4"}> ({
    %2 = "arith.constant"() <{value = 7 : index}> : () -> index
    %3 = "arith.constant"() <{value = 11 : index}> : () -> index
    "affine.for"() <{lowerBoundMap = #map, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
    ^bb0(%arg14: index):
      "affine.for"() <{lowerBoundMap = #map, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map1}> ({
      ^bb0(%arg15: index):
        "affine.if"(%arg14, %arg15, %2, %3) <{condition = #set4}> ({
          "func.call"() <{callee = @external}> : () -> ()
          "affine.yield"() : () -> ()
        }, {
        }) : (index, index, index, index) -> ()
        "affine.yield"() : () -> ()
      }) : () -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "test_gaussian_elimination_empty_set5"}> ({
    %0 = "arith.constant"() <{value = 7 : index}> : () -> index
    %1 = "arith.constant"() <{value = 11 : index}> : () -> index
    "affine.for"() <{lowerBoundMap = #map, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
    ^bb0(%arg12: index):
      "affine.for"() <{lowerBoundMap = #map, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map1}> ({
      ^bb0(%arg13: index):
        "affine.if"(%arg12, %arg13, %0, %1) <{condition = #set5}> ({
          "func.call"() <{callee = @external}> : () -> ()
          "affine.yield"() : () -> ()
        }, {
        }) : (index, index, index, index) -> ()
        "affine.yield"() : () -> ()
      }) : () -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index, index, index, index) -> (), sym_name = "test_fuzz_explosion"}> ({
  ^bb0(%arg6: index, %arg7: index, %arg8: index, %arg9: index):
    "affine.for"() <{lowerBoundMap = #map, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
    ^bb0(%arg10: index):
      "affine.for"() <{lowerBoundMap = #map, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map1}> ({
      ^bb0(%arg11: index):
        "affine.if"(%arg10, %arg11, %arg6, %arg7, %arg8, %arg9) <{condition = #set6}> ({
          "func.call"() <{callee = @external}> : () -> ()
          "affine.yield"() : () -> ()
        }, {
        }) : (index, index, index, index, index, index) -> ()
        "affine.yield"() : () -> ()
      }) : () -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index) -> (), sym_name = "test_empty_set"}> ({
  ^bb0(%arg0: index):
    "affine.for"() <{lowerBoundMap = #map3, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
    ^bb0(%arg4: index):
      "affine.for"() <{lowerBoundMap = #map3, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
      ^bb0(%arg5: index):
        "affine.if"(%arg4, %arg5) <{condition = #set7}> ({
          "foo"() : () -> ()
          "affine.yield"() : () -> ()
        }, {
        }) : (index, index) -> ()
        "affine.if"(%arg4) <{condition = #set8}> ({
          "bar"() : () -> ()
          "affine.yield"() : () -> ()
        }, {
        }) : (index) -> ()
        "affine.if"(%arg4) <{condition = #set8}> ({
          "foo"() : () -> ()
          "affine.yield"() : () -> ()
        }, {
        }) : (index) -> ()
        "affine.if"(%arg4, %arg0, %arg0) <{condition = #set9}> ({
          "bar"() : () -> ()
          "affine.yield"() : () -> ()
        }, {
        }) : (index, index, index) -> ()
        "affine.if"(%arg4, %arg5, %arg0) <{condition = #set10}> ({
          "foo"() : () -> ()
          "affine.yield"() : () -> ()
        }, {
        }) : (index, index, index) -> ()
        "affine.if"(%arg4, %arg5) <{condition = #set11}> ({
          "foo"() : () -> ()
          "affine.yield"() : () -> ()
        }, {
        }) : (index, index) -> ()
        "affine.if"(%arg4, %arg5) <{condition = #set12}> ({
          "foo"() : () -> ()
          "affine.yield"() : () -> ()
        }, {
        }) : (index, index) -> ()
        "affine.yield"() : () -> ()
      }) : () -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "affine.for"() <{lowerBoundMap = #map3, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
    ^bb0(%arg2: index):
      "affine.for"() <{lowerBoundMap = #map3, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
      ^bb0(%arg3: index):
        "affine.if"(%arg2) <{condition = #set13}> ({
          "foo"() : () -> ()
          "affine.yield"() : () -> ()
        }, {
        }) : (index) -> ()
        "affine.if"(%arg2, %arg3) <{condition = #set14}> ({
          "foo"() : () -> ()
          "affine.yield"() : () -> ()
        }, {
        }) : (index, index) -> ()
        "affine.if"(%arg2, %arg3) <{condition = #set15}> ({
          "foo"() : () -> ()
          "affine.yield"() : () -> ()
        }, {
        }) : (index, index) -> ()
        "affine.if"(%arg2, %arg2, %arg3) <{condition = #set16}> ({
          "foo"() : () -> ()
          "affine.yield"() : () -> ()
        }, {
        }) : (index, index, index) -> ()
        "affine.yield"() : () -> ()
      }) : () -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "affine.for"() <{lowerBoundMap = #map3, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
    ^bb0(%arg1: index):
      "affine.if"(%arg1) <{condition = #set17}> ({
        "foo"() : () -> ()
        "affine.yield"() : () -> ()
      }, {
      }) : (index) -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#set = affine_set<(d0, d1) : (d0 - d1 + d1 + d0 >= 0, 2 >= 0, d0 >= 0, -d0 + 50 >= 0, -d0 + 100 >= 0)>
#set1 = affine_set<(d0, d1) : (d0 mod 2 - 1 == 0, d0 mod 2 == 0)>
#set2 = affine_set<(d0, d1) : (1 >= 0, 3 >= 0)>
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "external", sym_visibility = "private"}> ({
  }) : () -> ()
  "func.func"() <{function_type = (index, index) -> (), sym_name = "simplify_set"}> ({
  ^bb0(%arg0: index, %arg1: index):
    "affine.if"(%arg0, %arg1) <{condition = #set}> ({
      "func.call"() <{callee = @external}> : () -> ()
      "affine.yield"() : () -> ()
    }, {
    }) : (index, index) -> ()
    "affine.if"(%arg0, %arg1) <{condition = #set1}> ({
      "func.call"() <{callee = @external}> : () -> ()
      "affine.yield"() : () -> ()
    }, {
    }) : (index, index) -> ()
    "affine.if"(%arg0, %arg1) <{condition = #set2}> ({
      "func.call"() <{callee = @external}> : () -> ()
      "affine.yield"() : () -> ()
    }, {
    }) : (index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0 + d1 + 1)>
"builtin.module"() ({
  "func.func"() <{function_type = (index) -> index, sym_name = "affine.apply"}> ({
  ^bb0(%arg0: index):
    %0 = "affine.apply"(%arg0, %arg0) <{map = #map}> : (index, index) -> index
    %1 = "arith.addi"(%0, %0) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
    "func.return"(%1) : (index) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<() -> ()>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<f32>) -> f32, sym_name = "simplify_zero_dim_map"}> ({
  ^bb0(%arg0: memref<f32>):
    %0 = "affine.load"(%arg0) <{map = #map}> : (memref<f32>) -> f32
    "func.return"(%0) : (f32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0)[s0] -> ((-((d0 floordiv s0) * s0) + s0 * s0) mod s0)>
#map1 = affine_map<(d0)[s0] -> ((-((d0 floordiv s0) * s0) + (s0 * 2) mod (s0 * 3)) floordiv s0)>
#map2 = affine_map<()[s0] -> ((s0 floordiv s0) floordiv s0)>
#map3 = affine_map<(d0)[s0] -> ((-((d0 floordiv s0) * s0) + s0 * 42 + 0 floordiv s0) ceildiv s0)>
#map4 = affine_map<(d0)[s0] -> (((s0 * 2) ceildiv 4 + s0 * 42) ceildiv s0)>
#map5 = affine_map<(d0)[s0] -> ((((s0 * 2) ceildiv 4) * 5 + s0 * 42) ceildiv s0)>
#map6 = affine_map<(d0)[s0] -> ((((s0 * 2) floordiv 4) * 5 + s0 * 42) floordiv s0)>
#map7 = affine_map<(d0)[s0] -> (s0 mod s0)>
"builtin.module"() ({
  "func.func"() <{function_type = (index, index) -> index, sym_name = "semiaffine_mod"}> ({
  ^bb0(%arg13: index, %arg14: index):
    %7 = "affine.apply"(%arg13, %arg14) <{map = #map}> : (index, index) -> index
    "func.return"(%7) : (index) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index, index) -> index, sym_name = "semiaffine_floordiv"}> ({
  ^bb0(%arg11: index, %arg12: index):
    %6 = "affine.apply"(%arg11, %arg12) <{map = #map1}> : (index, index) -> index
    "func.return"(%6) : (index) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index) -> index, sym_name = "semiaffine_nested_floordiv"}> ({
  ^bb0(%arg10: index):
    %5 = "affine.apply"(%arg10) <{map = #map2}> : (index) -> index
    "func.return"(%5) : (index) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index, index) -> index, sym_name = "semiaffine_ceildiv"}> ({
  ^bb0(%arg8: index, %arg9: index):
    %4 = "affine.apply"(%arg8, %arg9) <{map = #map3}> : (index, index) -> index
    "func.return"(%4) : (index) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index, index) -> index, sym_name = "semiaffine_composite_ceildiv"}> ({
  ^bb0(%arg6: index, %arg7: index):
    %3 = "affine.apply"(%arg6, %arg7) <{map = #map4}> : (index, index) -> index
    "func.return"(%3) : (index) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index, index) -> index, sym_name = "semiaffine_composite_ceildiv_mul_ceildiv"}> ({
  ^bb0(%arg4: index, %arg5: index):
    %2 = "affine.apply"(%arg4, %arg5) <{map = #map5}> : (index, index) -> index
    "func.return"(%2) : (index) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index, index) -> index, sym_name = "semiaffine_composite_floordiv_mul_floordiv"}> ({
  ^bb0(%arg2: index, %arg3: index):
    %1 = "affine.apply"(%arg2, %arg3) <{map = #map6}> : (index, index) -> index
    "func.return"(%1) : (index) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index, index) -> index, sym_name = "semiaffine_unsimplified_symbol"}> ({
  ^bb0(%arg0: index, %arg1: index):
    %0 = "affine.apply"(%arg0, %arg1) <{map = #map7}> : (index, index) -> index
    "func.return"(%0) : (index) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<() -> (1)>
#map1 = affine_map<() -> (100)>
#map2 = affine_map<() -> (10)>
#set = affine_set<(d0, d1) : (1 >= 0)>
#set1 = affine_set<(d0, d1) : (-1 >= 0)>
#set2 = affine_set<(d0, d1) : (d0 - 1 == 0)>
#set3 = affine_set<() : (0 == 0)>
#set4 = affine_set<(d0, d1) : (5 >= 0, -2 >= 0)>
#set5 = affine_set<(d0, d1) : (1 >= 0, 3 >= 0)>
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "external", sym_visibility = "private"}> ({
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "external1", sym_visibility = "private"}> ({
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "test_always_true_if_elimination"}> ({
    "affine.for"() <{lowerBoundMap = #map, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
    ^bb0(%arg5: index):
      "affine.for"() <{lowerBoundMap = #map, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map1}> ({
      ^bb0(%arg6: index):
        "affine.if"(%arg5, %arg6) <{condition = #set}> ({
          "func.call"() <{callee = @external}> : () -> ()
          "affine.yield"() : () -> ()
        }, {
          "func.call"() <{callee = @external1}> : () -> ()
          "affine.yield"() : () -> ()
        }) : (index, index) -> ()
        "affine.yield"() : () -> ()
      }) : () -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "test_always_false_if_elimination"}> ({
    "affine.for"() <{lowerBoundMap = #map, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
    ^bb0(%arg3: index):
      "affine.for"() <{lowerBoundMap = #map, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map1}> ({
      ^bb0(%arg4: index):
        "affine.if"(%arg3, %arg4) <{condition = #set1}> ({
          "func.call"() <{callee = @external}> : () -> ()
          "affine.yield"() : () -> ()
        }, {
          "func.call"() <{callee = @external1}> : () -> ()
          "affine.yield"() : () -> ()
        }) : (index, index) -> ()
        "affine.yield"() : () -> ()
      }) : () -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "test_dimensional_if_elimination"}> ({
    "affine.for"() <{lowerBoundMap = #map, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
    ^bb0(%arg1: index):
      "affine.for"() <{lowerBoundMap = #map, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map1}> ({
      ^bb0(%arg2: index):
        "affine.if"(%arg1, %arg2) <{condition = #set2}> ({
          "func.call"() <{callee = @external}> : () -> ()
          "affine.yield"() : () -> ()
        }, {
          "func.call"() <{callee = @external}> : () -> ()
          "affine.yield"() : () -> ()
        }) : (index, index) -> ()
        "affine.yield"() : () -> ()
      }) : () -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> index, sym_name = "test_num_results_if_elimination"}> ({
    %29 = "arith.constant"() <{value = 0 : index}> : () -> index
    %30 = "affine.if"() <{condition = #set3}> ({
      "affine.yield"(%29) : (index) -> ()
    }, {
      "affine.yield"(%29) : (index) -> ()
    }) : () -> index
    "func.return"(%30) : (index) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index) -> (index, index), sym_name = "test_trivially_false_returning_two_results"}> ({
  ^bb0(%arg0: index):
    %22 = "arith.constant"() <{value = 7 : index}> : () -> index
    %23 = "arith.constant"() <{value = 13 : index}> : () -> index
    %24:2 = "affine.if"(%22, %23) <{condition = #set4}> ({
      %27 = "arith.constant"() <{value = 0 : index}> : () -> index
      %28 = "arith.constant"() <{value = 1 : index}> : () -> index
      "affine.yield"(%27, %28) : (index, index) -> ()
    }, {
      %25 = "arith.constant"() <{value = 2 : index}> : () -> index
      %26 = "arith.constant"() <{value = 3 : index}> : () -> index
      "affine.yield"(%22, %arg0) : (index, index) -> ()
    }) : (index, index) -> (index, index)
    "func.return"(%24#0, %24#1) : (index, index) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (index, index, index, index, index), sym_name = "test_trivially_true_returning_five_results"}> ({
    %9 = "arith.constant"() <{value = 12 : index}> : () -> index
    %10 = "arith.constant"() <{value = 13 : index}> : () -> index
    %11:5 = "affine.if"(%9, %10) <{condition = #set5}> ({
      %17 = "arith.constant"() <{value = 0 : index}> : () -> index
      %18 = "arith.constant"() <{value = 1 : index}> : () -> index
      %19 = "arith.constant"() <{value = 2 : index}> : () -> index
      %20 = "arith.constant"() <{value = 3 : index}> : () -> index
      %21 = "arith.constant"() <{value = 4 : index}> : () -> index
      "affine.yield"(%17, %18, %19, %20, %21) : (index, index, index, index, index) -> ()
    }, {
      %12 = "arith.constant"() <{value = 5 : index}> : () -> index
      %13 = "arith.constant"() <{value = 6 : index}> : () -> index
      %14 = "arith.constant"() <{value = 7 : index}> : () -> index
      %15 = "arith.constant"() <{value = 8 : index}> : () -> index
      %16 = "arith.constant"() <{value = 9 : index}> : () -> index
      "affine.yield"(%12, %13, %14, %15, %16) : (index, index, index, index, index) -> ()
    }) : (index, index) -> (index, index, index, index, index)
    "func.return"(%11#0, %11#1, %11#2, %11#3, %11#4) : (index, index, index, index, index) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (index, index, index), sym_name = "test_not_trivially_true_or_false_returning_three_results"}> ({
    %0 = "arith.constant"() <{value = 8 : index}> : () -> index
    %1 = "arith.constant"() <{value = 13 : index}> : () -> index
    %2:3 = "affine.if"(%0, %1) <{condition = #set2}> ({
      %6 = "arith.constant"() <{value = 0 : index}> : () -> index
      %7 = "arith.constant"() <{value = 1 : index}> : () -> index
      %8 = "arith.constant"() <{value = 2 : index}> : () -> index
      "affine.yield"(%6, %7, %8) : (index, index, index) -> ()
    }, {
      %3 = "arith.constant"() <{value = 3 : index}> : () -> index
      %4 = "arith.constant"() <{value = 4 : index}> : () -> index
      %5 = "arith.constant"() <{value = 5 : index}> : () -> index
      "affine.yield"(%3, %4, %5) : (index, index, index) -> ()
    }) : (index, index) -> (index, index, index)
    "func.return"(%2#0, %2#1, %2#2) : (index, index, index) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1)[s0, s1, s2, s3] -> (-(d1 * s0 - (s0 - s1) mod s2) + s3 + d0 * s1 + d1 * s0)>
#map1 = affine_map<(d0)[s0, s1, s2, s3] -> (d0 mod (s0 - s1 * s2 + s3 - s0))>
#map2 = affine_map<(d0)[s0, s1, s2] -> (d0 + (d0 + s0) mod s2 + s0 * s1 - (d0 + s0) mod s2 - (d0 - s0) mod s2)>
"builtin.module"() ({
  "func.func"() <{function_type = (index, index, index, index, index, index) -> (index, index, index), sym_name = "semiaffine_simplification_mod"}> ({
  ^bb0(%arg0: index, %arg1: index, %arg2: index, %arg3: index, %arg4: index, %arg5: index):
    %0 = "affine.apply"(%arg0, %arg1, %arg2, %arg3, %arg4, %arg5) <{map = #map}> : (index, index, index, index, index, index) -> index
    %1 = "affine.apply"(%arg0, %arg0, %arg1, %arg2, %arg3) <{map = #map1}> : (index, index, index, index, index) -> index
    %2 = "affine.apply"(%arg0, %arg1, %arg2, %arg3) <{map = #map2}> : (index, index, index, index) -> index
    "func.return"(%0, %1, %2) : (index, index, index) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0)[s0, s1, s2, s3] -> (d0 floordiv (s0 - s1 * s2 + s3 - s0))>
#map1 = affine_map<(d0)[s0, s1, s2, s3] -> (-(d0 * s1 - (s0 - s1) floordiv s2) + s3 + d0 * s1 + s0)>
#map2 = affine_map<(d0)[s0, s1, s2, s3] -> (d0 ceildiv (s0 - s1 * s2 + s3 - s0))>
"builtin.module"() ({
  "func.func"() <{function_type = (index, index, index, index, index) -> (index, index, index), sym_name = "semiaffine_simplification_floordiv_and_ceildiv"}> ({
  ^bb0(%arg0: index, %arg1: index, %arg2: index, %arg3: index, %arg4: index):
    %0 = "affine.apply"(%arg0, %arg0, %arg1, %arg2, %arg3) <{map = #map}> : (index, index, index, index, index) -> index
    %1 = "affine.apply"(%arg0, %arg1, %arg2, %arg3, %arg4) <{map = #map1}> : (index, index, index, index, index) -> index
    %2 = "affine.apply"(%arg0, %arg0, %arg1, %arg2, %arg3) <{map = #map2}> : (index, index, index, index, index) -> index
    "func.return"(%0, %1, %2) : (index, index, index) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0)[s0, s1, s2, s3] -> (d0 + s0 + -(s0 - (s0 - s1) * s2) + s3)>
#map1 = affine_map<(d0, d1, d2)[s0, s1] -> (d0 + d1 * s1 + d1 + d0 * s0 + d1 * s0 + d2 * s1 + d2)>
"builtin.module"() ({
  "func.func"() <{function_type = (index, index, index, index, index, index) -> (index, index), sym_name = "semiaffine_simplification_product"}> ({
  ^bb0(%arg0: index, %arg1: index, %arg2: index, %arg3: index, %arg4: index, %arg5: index):
    %0 = "affine.apply"(%arg0, %arg1, %arg2, %arg3, %arg4) <{map = #map}> : (index, index, index, index, index) -> index
    %1 = "affine.apply"(%arg0, %arg1, %arg2, %arg3, %arg4) <{map = #map1}> : (index, index, index, index, index) -> index
    "func.return"(%0, %1) : (index, index) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1)[s0, s1] -> (0)>
#map1 = affine_map<(d0, d1)[s0, s1] -> ((d0 + d1 - s0) mod (s0 + s1))>
"builtin.module"() ({
  "func.func"() <{function_type = (index, index, index, index, index, index) -> (index, index), sym_name = "semi_affine_simplification_euclidean_lemma"}> ({
  ^bb0(%arg0: index, %arg1: index, %arg2: index, %arg3: index, %arg4: index, %arg5: index):
    %0 = "affine.apply"(%arg0, %arg1, %arg2, %arg3) <{map = #map}> : (index, index, index, index) -> index
    %1 = "affine.apply"(%arg0, %arg1, %arg2, %arg3) <{map = #map1}> : (index, index, index, index) -> index
    "func.return"(%0, %1) : (index, index) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<()[s0] -> (s0 mod 2 + (s0 floordiv 2) * s0)>
"builtin.module"() ({
  "func.func"() <{function_type = (index) -> index, sym_name = "semiaffine_modulo"}> ({
  ^bb0(%arg0: index):
    %0 = "affine.apply"(%arg0) <{map = #map}> : (index) -> index
    "func.return"(%0) : (index) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0)[s0, s1] -> (((d0 floordiv 2) * s0 + s1 floordiv 2) * 2 + d0 mod 2)>
"builtin.module"() ({
  "func.func"() <{function_type = (index, index, index) -> index, sym_name = "semiaffine_modulo_dim"}> ({
  ^bb0(%arg0: index, %arg1: index, %arg2: index):
    %0 = "affine.apply"(%arg0, %arg1, %arg2) <{map = #map}> : (index, index, index) -> index
    "func.return"(%0) : (index) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<()[s0, s1, s2] -> (s0 floordiv (s1 + (-s1 + 2) * (-s1 + s1 * s2 + 1)))>
#map1 = affine_map<()[s0, s1, s2] -> (s0 ceildiv (s1 + (-s1 + 2) * (-s1 + s1 * s2 + 1)))>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?xf32>) -> (index, index), sym_name = "semiaffine_simplification_floordiv_and_ceildiv_const"}> ({
  ^bb0(%arg0: tensor<?xf32>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index
    %2 = "arith.constant"() <{value = 13 : index}> : () -> index
    %3 = "tensor.dim"(%arg0, %0) : (tensor<?xf32>, index) -> index
    %4 = "affine.apply"(%2, %3, %1) <{map = #map}> : (index, index, index) -> index
    %5 = "affine.apply"(%2, %3, %1) <{map = #map1}> : (index, index, index) -> index
    "func.return"(%4, %5) : (index, index) -> ()
  }) : () -> ()
}) : () -> ()

