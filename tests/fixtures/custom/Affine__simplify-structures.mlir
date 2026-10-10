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
module {
  func.func private @external()
  func.func @test_gaussian_elimination_empty_set0() {
    affine.for %arg0 = 1 to 10 {
      affine.for %arg1 = 1 to 100 {
        affine.if #set(%arg0, %arg1) {
          func.call @external() : () -> ()
        }
      }
    }
    return
  }
  func.func @test_gaussian_elimination_empty_set1() {
    affine.for %arg0 = 1 to 10 {
      affine.for %arg1 = 1 to 100 {
        affine.if #set1(%arg0, %arg1) {
          func.call @external() : () -> ()
        }
      }
    }
    return
  }
  func.func @test_gaussian_elimination_non_empty_set2() {
    affine.for %arg0 = 1 to 10 {
      affine.for %arg1 = 1 to 100 {
        affine.if #set2(%arg0, %arg1) {
          func.call @external() : () -> ()
        }
      }
    }
    return
  }
  func.func @test_gaussian_elimination_empty_set3() {
    %c7 = arith.constant 7 : index
    %c11 = arith.constant 11 : index
    affine.for %arg0 = 1 to 10 {
      affine.for %arg1 = 1 to 100 {
        affine.if #set3(%arg0, %arg1)[%c7, %c11] {
          func.call @external() : () -> ()
        }
      }
    }
    return
  }
  func.func @test_gaussian_elimination_non_empty_set4() {
    %c7 = arith.constant 7 : index
    %c11 = arith.constant 11 : index
    affine.for %arg0 = 1 to 10 {
      affine.for %arg1 = 1 to 100 {
        affine.if #set4(%arg0, %arg1)[%c7, %c11] {
          func.call @external() : () -> ()
        }
      }
    }
    return
  }
  func.func @test_gaussian_elimination_empty_set5() {
    %c7 = arith.constant 7 : index
    %c11 = arith.constant 11 : index
    affine.for %arg0 = 1 to 10 {
      affine.for %arg1 = 1 to 100 {
        affine.if #set5(%arg0, %arg1)[%c7, %c11] {
          func.call @external() : () -> ()
        }
      }
    }
    return
  }
  func.func @test_fuzz_explosion(%arg0: index, %arg1: index, %arg2: index, %arg3: index) {
    affine.for %arg4 = 1 to 10 {
      affine.for %arg5 = 1 to 100 {
        affine.if #set6(%arg4, %arg5, %arg0, %arg1, %arg2, %arg3) {
          func.call @external() : () -> ()
        }
      }
    }
    return
  }
  func.func @test_empty_set(%arg0: index) {
    affine.for %arg1 = 0 to 10 {
      affine.for %arg2 = 0 to 10 {
        affine.if #set7(%arg1, %arg2) {
          "foo"() : () -> ()
        }
        affine.if #set8(%arg1) {
          "bar"() : () -> ()
        }
        affine.if #set8(%arg1) {
          "foo"() : () -> ()
        }
        affine.if #set9(%arg1)[%arg0, %arg0] {
          "bar"() : () -> ()
        }
        affine.if #set10(%arg1, %arg2, %arg0) {
          "foo"() : () -> ()
        }
        affine.if #set11(%arg1, %arg2) {
          "foo"() : () -> ()
        }
        affine.if #set12(%arg1, %arg2) {
          "foo"() : () -> ()
        }
      }
    }
    affine.for %arg1 = 0 to 10 {
      affine.for %arg2 = 0 to 10 {
        affine.if #set13(%arg1) {
          "foo"() : () -> ()
        }
        affine.if #set14(%arg1, %arg2) {
          "foo"() : () -> ()
        }
        affine.if #set15(%arg1, %arg2) {
          "foo"() : () -> ()
        }
        affine.if #set16(%arg1, %arg1, %arg2) {
          "foo"() : () -> ()
        }
      }
    }
    affine.for %arg1 = 0 to 10 {
      affine.if #set17(%arg1) {
        "foo"() : () -> ()
      }
    }
    return
  }
}

// -----
#set = affine_set<(d0, d1) : (d0 - d1 + d1 + d0 >= 0, 2 >= 0, d0 >= 0, -d0 + 50 >= 0, -d0 + 100 >= 0)>
#set1 = affine_set<(d0, d1) : (d0 mod 2 - 1 == 0, d0 mod 2 == 0)>
#set2 = affine_set<(d0, d1) : (1 >= 0, 3 >= 0)>
module {
  func.func private @external()
  func.func @simplify_set(%arg0: index, %arg1: index) {
    affine.if #set(%arg0, %arg1) {
      func.call @external() : () -> ()
    }
    affine.if #set1(%arg0, %arg1) {
      func.call @external() : () -> ()
    }
    affine.if #set2(%arg0, %arg1) {
      func.call @external() : () -> ()
    }
    return
  }
}

// -----
#map = affine_map<(d0, d1) -> (d0 + d1 + 1)>
module {
  func.func @affine.apply(%arg0: index) -> index {
    %0 = affine.apply #map(%arg0, %arg0)
    %1 = arith.addi %0, %0 : index
    return %1 : index
  }
}

// -----
module {
  func.func @simplify_zero_dim_map(%arg0: memref<f32>) -> f32 {
    %0 = affine.load %arg0[] : memref<f32>
    return %0 : f32
  }
}

// -----
#map = affine_map<(d0)[s0] -> ((-((d0 floordiv s0) * s0) + s0 * s0) mod s0)>
#map1 = affine_map<(d0)[s0] -> ((-((d0 floordiv s0) * s0) + (s0 * 2) mod (s0 * 3)) floordiv s0)>
#map2 = affine_map<()[s0] -> ((s0 floordiv s0) floordiv s0)>
#map3 = affine_map<(d0)[s0] -> ((-((d0 floordiv s0) * s0) + s0 * 42 + 0 floordiv s0) ceildiv s0)>
#map4 = affine_map<(d0)[s0] -> (((s0 * 2) ceildiv 4 + s0 * 42) ceildiv s0)>
#map5 = affine_map<(d0)[s0] -> ((((s0 * 2) ceildiv 4) * 5 + s0 * 42) ceildiv s0)>
#map6 = affine_map<(d0)[s0] -> ((((s0 * 2) floordiv 4) * 5 + s0 * 42) floordiv s0)>
#map7 = affine_map<(d0)[s0] -> (s0 mod s0)>
module {
  func.func @semiaffine_mod(%arg0: index, %arg1: index) -> index {
    %0 = affine.apply #map(%arg0)[%arg1]
    return %0 : index
  }
  func.func @semiaffine_floordiv(%arg0: index, %arg1: index) -> index {
    %0 = affine.apply #map1(%arg0)[%arg1]
    return %0 : index
  }
  func.func @semiaffine_nested_floordiv(%arg0: index) -> index {
    %0 = affine.apply #map2()[%arg0]
    return %0 : index
  }
  func.func @semiaffine_ceildiv(%arg0: index, %arg1: index) -> index {
    %0 = affine.apply #map3(%arg0)[%arg1]
    return %0 : index
  }
  func.func @semiaffine_composite_ceildiv(%arg0: index, %arg1: index) -> index {
    %0 = affine.apply #map4(%arg0)[%arg1]
    return %0 : index
  }
  func.func @semiaffine_composite_ceildiv_mul_ceildiv(%arg0: index, %arg1: index) -> index {
    %0 = affine.apply #map5(%arg0)[%arg1]
    return %0 : index
  }
  func.func @semiaffine_composite_floordiv_mul_floordiv(%arg0: index, %arg1: index) -> index {
    %0 = affine.apply #map6(%arg0)[%arg1]
    return %0 : index
  }
  func.func @semiaffine_unsimplified_symbol(%arg0: index, %arg1: index) -> index {
    %0 = affine.apply #map7(%arg0)[%arg1]
    return %0 : index
  }
}

// -----
#set = affine_set<(d0, d1) : (1 >= 0)>
#set1 = affine_set<(d0, d1) : (-1 >= 0)>
#set2 = affine_set<(d0, d1) : (d0 - 1 == 0)>
#set3 = affine_set<() : (0 == 0)>
#set4 = affine_set<(d0, d1) : (5 >= 0, -2 >= 0)>
#set5 = affine_set<(d0, d1) : (1 >= 0, 3 >= 0)>
module {
  func.func private @external()
  func.func private @external1()
  func.func @test_always_true_if_elimination() {
    affine.for %arg0 = 1 to 10 {
      affine.for %arg1 = 1 to 100 {
        affine.if #set(%arg0, %arg1) {
          func.call @external() : () -> ()
        } else {
          func.call @external1() : () -> ()
        }
      }
    }
    return
  }
  func.func @test_always_false_if_elimination() {
    affine.for %arg0 = 1 to 10 {
      affine.for %arg1 = 1 to 100 {
        affine.if #set1(%arg0, %arg1) {
          func.call @external() : () -> ()
        } else {
          func.call @external1() : () -> ()
        }
      }
    }
    return
  }
  func.func @test_dimensional_if_elimination() {
    affine.for %arg0 = 1 to 10 {
      affine.for %arg1 = 1 to 100 {
        affine.if #set2(%arg0, %arg1) {
          func.call @external() : () -> ()
        } else {
          func.call @external() : () -> ()
        }
      }
    }
    return
  }
  func.func @test_num_results_if_elimination() -> index {
    %c0 = arith.constant 0 : index
    %0 = affine.if #set3() -> index {
      affine.yield %c0 : index
    } else {
      affine.yield %c0 : index
    }
    return %0 : index
  }
  func.func @test_trivially_false_returning_two_results(%arg0: index) -> (index, index) {
    %c7 = arith.constant 7 : index
    %c13 = arith.constant 13 : index
    %0:2 = affine.if #set4(%c7, %c13) -> (index, index) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      affine.yield %c0, %c1 : index, index
    } else {
      %c2 = arith.constant 2 : index
      %c3 = arith.constant 3 : index
      affine.yield %c7, %arg0 : index, index
    }
    return %0#0, %0#1 : index, index
  }
  func.func @test_trivially_true_returning_five_results() -> (index, index, index, index, index) {
    %c12 = arith.constant 12 : index
    %c13 = arith.constant 13 : index
    %0:5 = affine.if #set5(%c12, %c13) -> (index, index, index, index, index) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c2 = arith.constant 2 : index
      %c3 = arith.constant 3 : index
      %c4 = arith.constant 4 : index
      affine.yield %c0, %c1, %c2, %c3, %c4 : index, index, index, index, index
    } else {
      %c5 = arith.constant 5 : index
      %c6 = arith.constant 6 : index
      %c7 = arith.constant 7 : index
      %c8 = arith.constant 8 : index
      %c9 = arith.constant 9 : index
      affine.yield %c5, %c6, %c7, %c8, %c9 : index, index, index, index, index
    }
    return %0#0, %0#1, %0#2, %0#3, %0#4 : index, index, index, index, index
  }
  func.func @test_not_trivially_true_or_false_returning_three_results() -> (index, index, index) {
    %c8 = arith.constant 8 : index
    %c13 = arith.constant 13 : index
    %0:3 = affine.if #set2(%c8, %c13) -> (index, index, index) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c2 = arith.constant 2 : index
      affine.yield %c0, %c1, %c2 : index, index, index
    } else {
      %c3 = arith.constant 3 : index
      %c4 = arith.constant 4 : index
      %c5 = arith.constant 5 : index
      affine.yield %c3, %c4, %c5 : index, index, index
    }
    return %0#0, %0#1, %0#2 : index, index, index
  }
}

// -----
#map = affine_map<(d0, d1)[s0, s1, s2, s3] -> (-(d1 * s0 - (s0 - s1) mod s2) + s3 + d0 * s1 + d1 * s0)>
#map1 = affine_map<(d0)[s0, s1, s2, s3] -> (d0 mod (s0 - s1 * s2 + s3 - s0))>
#map2 = affine_map<(d0)[s0, s1, s2] -> (d0 + (d0 + s0) mod s2 + s0 * s1 - (d0 + s0) mod s2 - (d0 - s0) mod s2)>
module {
  func.func @semiaffine_simplification_mod(%arg0: index, %arg1: index, %arg2: index, %arg3: index, %arg4: index, %arg5: index) -> (index, index, index) {
    %0 = affine.apply #map(%arg0, %arg1)[%arg2, %arg3, %arg4, %arg5]
    %1 = affine.apply #map1(%arg0)[%arg0, %arg1, %arg2, %arg3]
    %2 = affine.apply #map2(%arg0)[%arg1, %arg2, %arg3]
    return %0, %1, %2 : index, index, index
  }
}

// -----
#map = affine_map<(d0)[s0, s1, s2, s3] -> (d0 floordiv (s0 - s1 * s2 + s3 - s0))>
#map1 = affine_map<(d0)[s0, s1, s2, s3] -> (-(d0 * s1 - (s0 - s1) floordiv s2) + s3 + d0 * s1 + s0)>
#map2 = affine_map<(d0)[s0, s1, s2, s3] -> (d0 ceildiv (s0 - s1 * s2 + s3 - s0))>
module {
  func.func @semiaffine_simplification_floordiv_and_ceildiv(%arg0: index, %arg1: index, %arg2: index, %arg3: index, %arg4: index) -> (index, index, index) {
    %0 = affine.apply #map(%arg0)[%arg0, %arg1, %arg2, %arg3]
    %1 = affine.apply #map1(%arg0)[%arg1, %arg2, %arg3, %arg4]
    %2 = affine.apply #map2(%arg0)[%arg0, %arg1, %arg2, %arg3]
    return %0, %1, %2 : index, index, index
  }
}

// -----
#map = affine_map<(d0)[s0, s1, s2, s3] -> (d0 + s0 + -(s0 - (s0 - s1) * s2) + s3)>
#map1 = affine_map<(d0, d1, d2)[s0, s1] -> (d0 + d1 * s1 + d1 + d0 * s0 + d1 * s0 + d2 * s1 + d2)>
module {
  func.func @semiaffine_simplification_product(%arg0: index, %arg1: index, %arg2: index, %arg3: index, %arg4: index, %arg5: index) -> (index, index) {
    %0 = affine.apply #map(%arg0)[%arg1, %arg2, %arg3, %arg4]
    %1 = affine.apply #map1(%arg0, %arg1, %arg2)[%arg3, %arg4]
    return %0, %1 : index, index
  }
}

// -----
#map = affine_map<(d0, d1)[s0, s1] -> (0)>
#map1 = affine_map<(d0, d1)[s0, s1] -> ((d0 + d1 - s0) mod (s0 + s1))>
module {
  func.func @semi_affine_simplification_euclidean_lemma(%arg0: index, %arg1: index, %arg2: index, %arg3: index, %arg4: index, %arg5: index) -> (index, index) {
    %0 = affine.apply #map(%arg0, %arg1)[%arg2, %arg3]
    %1 = affine.apply #map1(%arg0, %arg1)[%arg2, %arg3]
    return %0, %1 : index, index
  }
}

// -----
#map = affine_map<()[s0] -> (s0 mod 2 + (s0 floordiv 2) * s0)>
module {
  func.func @semiaffine_modulo(%arg0: index) -> index {
    %0 = affine.apply #map()[%arg0]
    return %0 : index
  }
}

// -----
#map = affine_map<(d0)[s0, s1] -> (((d0 floordiv 2) * s0 + s1 floordiv 2) * 2 + d0 mod 2)>
module {
  func.func @semiaffine_modulo_dim(%arg0: index, %arg1: index, %arg2: index) -> index {
    %0 = affine.apply #map(%arg0)[%arg1, %arg2]
    return %0 : index
  }
}

// -----
#map = affine_map<()[s0, s1, s2] -> (s0 floordiv (s1 + (-s1 + 2) * (-s1 + s1 * s2 + 1)))>
#map1 = affine_map<()[s0, s1, s2] -> (s0 ceildiv (s1 + (-s1 + 2) * (-s1 + s1 * s2 + 1)))>
module {
  func.func @semiaffine_simplification_floordiv_and_ceildiv_const(%arg0: tensor<?xf32>) -> (index, index) {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c13 = arith.constant 13 : index
    %dim = tensor.dim %arg0, %c0 : tensor<?xf32>
    %0 = affine.apply #map()[%c13, %dim, %c1]
    %1 = affine.apply #map1()[%c13, %dim, %c1]
    return %0, %1 : index, index
  }
}

