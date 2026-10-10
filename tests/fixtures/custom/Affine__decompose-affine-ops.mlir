#map = affine_map<(d0) -> ((d0 floordiv 32) mod 4 + 42)>
module {
  func.func @simple_test_1(%arg0: index, %arg1: index, %arg2: index, %arg3: index, %arg4: index, %arg5: index) {
    %0 = affine.apply #map(%arg1)
    "some_side_effecting_consumer"(%0) : (index) -> ()
    return
  }
}

// -----
#map = affine_map<(d0)[s0] -> ((d0 floordiv 32) mod 4 + s0 + 42)>
module {
  func.func @simple_test_2(%arg0: index, %arg1: index, %arg2: index, %arg3: index, %arg4: index, %arg5: index) {
    scf.for %arg6 = %arg3 to %arg4 step %arg5 {
      scf.for %arg7 = %arg3 to %arg4 step %arg5 {
        %0 = affine.apply #map(%arg7)[%arg6]
        "some_side_effecting_consumer"(%0) : (index) -> ()
      }
    }
    return
  }
}

// -----
#map = affine_map<()[s0, s1, s2, s3] -> (s1 * 16 + s2 * 32 + s3 * 32 + s0 floordiv 4)>
#map1 = affine_map<()[s0, s1, s2] -> (s1 * 16 + s2 * 32 + s0 floordiv 4)>
#map2 = affine_map<()[s0] -> (s0 * 8 - (s0 floordiv 4) * 32)>
#map3 = affine_map<()[s0, s1] -> (s0 * 8 + s1 * 32 - (s0 floordiv 4) * 32)>
#map4 = affine_map<()[s0, s1] -> (s0 + s1 * 8 - (s1 floordiv 4) * 32)>
#map5 = affine_map<(d0)[s0] -> ((d0 floordiv 32) mod 4 + s0)>
#map6 = affine_map<()[s0, s1, s2, s3] -> (s0 + s2 * 16 + s3 * 32 + s1 floordiv 4)>
module {
  func.func @larger_test(%arg0: index, %arg1: index, %arg2: index, %arg3: index, %arg4: index, %arg5: index) {
    %c2 = arith.constant 2 : index
    %c6 = arith.constant 6 : index
    scf.for %arg6 = %arg3 to %arg4 step %arg5 {
      scf.for %arg7 = %arg3 to %arg4 step %arg5 {
        %0 = affine.apply #map()[%arg0, %arg1, %arg2, %arg6]
        %1 = affine.apply #map1()[%arg0, %arg1, %arg2]
        %2 = affine.apply #map2()[%arg0]
        %3 = affine.apply #map3()[%arg0, %arg7]
        scf.for %arg8 = %arg3 to %arg4 step %arg5 {
          %4 = affine.apply #map4()[%arg8, %arg0]
          %5 = affine.apply #map5(%arg8)[%arg7]
          %6 = affine.apply #map6()[%arg8, %arg0, %arg1, %arg2]
          "some_side_effecting_consumer"(%0) : (index) -> ()
          "some_side_effecting_consumer"(%1) : (index) -> ()
          "some_side_effecting_consumer"(%2) : (index) -> ()
          "some_side_effecting_consumer"(%3) : (index) -> ()
          "some_side_effecting_consumer"(%4) : (index) -> ()
          "some_side_effecting_consumer"(%5) : (index) -> ()
          "some_side_effecting_consumer"(%6) : (index) -> ()
        }
      }
    }
    return
  }
}

