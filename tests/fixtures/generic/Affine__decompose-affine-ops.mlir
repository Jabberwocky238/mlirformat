#map = affine_map<(d0) -> ((d0 floordiv 32) mod 4 + 42)>
"builtin.module"() ({
  "func.func"() <{function_type = (index, index, index, index, index, index) -> (), sym_name = "simple_test_1"}> ({
  ^bb0(%arg0: index, %arg1: index, %arg2: index, %arg3: index, %arg4: index, %arg5: index):
    %0 = "affine.apply"(%arg1) <{map = #map}> : (index) -> index
    "some_side_effecting_consumer"(%0) : (index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0)[s0] -> ((d0 floordiv 32) mod 4 + s0 + 42)>
"builtin.module"() ({
  "func.func"() <{function_type = (index, index, index, index, index, index) -> (), sym_name = "simple_test_2"}> ({
  ^bb0(%arg0: index, %arg1: index, %arg2: index, %arg3: index, %arg4: index, %arg5: index):
    "scf.for"(%arg3, %arg4, %arg5) ({
    ^bb0(%arg6: index):
      "scf.for"(%arg3, %arg4, %arg5) ({
      ^bb0(%arg7: index):
        %0 = "affine.apply"(%arg7, %arg6) <{map = #map}> : (index, index) -> index
        "some_side_effecting_consumer"(%0) : (index) -> ()
        "scf.yield"() : () -> ()
      }) : (index, index, index) -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<()[s0, s1, s2, s3] -> (s1 * 16 + s2 * 32 + s3 * 32 + s0 floordiv 4)>
#map1 = affine_map<()[s0, s1, s2] -> (s1 * 16 + s2 * 32 + s0 floordiv 4)>
#map2 = affine_map<()[s0] -> (s0 * 8 - (s0 floordiv 4) * 32)>
#map3 = affine_map<()[s0, s1] -> (s0 * 8 + s1 * 32 - (s0 floordiv 4) * 32)>
#map4 = affine_map<()[s0, s1] -> (s0 + s1 * 8 - (s1 floordiv 4) * 32)>
#map5 = affine_map<(d0)[s0] -> ((d0 floordiv 32) mod 4 + s0)>
#map6 = affine_map<()[s0, s1, s2, s3] -> (s0 + s2 * 16 + s3 * 32 + s1 floordiv 4)>
"builtin.module"() ({
  "func.func"() <{function_type = (index, index, index, index, index, index) -> (), sym_name = "larger_test"}> ({
  ^bb0(%arg0: index, %arg1: index, %arg2: index, %arg3: index, %arg4: index, %arg5: index):
    %0 = "arith.constant"() <{value = 2 : index}> : () -> index
    %1 = "arith.constant"() <{value = 6 : index}> : () -> index
    "scf.for"(%arg3, %arg4, %arg5) ({
    ^bb0(%arg6: index):
      "scf.for"(%arg3, %arg4, %arg5) ({
      ^bb0(%arg7: index):
        %2 = "affine.apply"(%arg0, %arg1, %arg2, %arg6) <{map = #map}> : (index, index, index, index) -> index
        %3 = "affine.apply"(%arg0, %arg1, %arg2) <{map = #map1}> : (index, index, index) -> index
        %4 = "affine.apply"(%arg0) <{map = #map2}> : (index) -> index
        %5 = "affine.apply"(%arg0, %arg7) <{map = #map3}> : (index, index) -> index
        "scf.for"(%arg3, %arg4, %arg5) ({
        ^bb0(%arg8: index):
          %6 = "affine.apply"(%arg8, %arg0) <{map = #map4}> : (index, index) -> index
          %7 = "affine.apply"(%arg8, %arg7) <{map = #map5}> : (index, index) -> index
          %8 = "affine.apply"(%arg8, %arg0, %arg1, %arg2) <{map = #map6}> : (index, index, index, index) -> index
          "some_side_effecting_consumer"(%2) : (index) -> ()
          "some_side_effecting_consumer"(%3) : (index) -> ()
          "some_side_effecting_consumer"(%4) : (index) -> ()
          "some_side_effecting_consumer"(%5) : (index) -> ()
          "some_side_effecting_consumer"(%6) : (index) -> ()
          "some_side_effecting_consumer"(%7) : (index) -> ()
          "some_side_effecting_consumer"(%8) : (index) -> ()
          "scf.yield"() : () -> ()
        }) : (index, index, index) -> ()
        "scf.yield"() : () -> ()
      }) : (index, index, index) -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

