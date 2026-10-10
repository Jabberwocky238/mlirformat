module {
  func.func @slicing_test() {
    %alloc = memref.alloc() : memref<1xi32>
    %0 = "slicing-test-op"() : () -> i1
    %1 = "slicing-test-op"() : () -> i2
    %2 = "slicing-test-op"() : () -> i3
    %3 = "slicing-test-op"() : () -> i4
    %4 = "slicing-test-op"(%0, %1) : (i1, i2) -> i5
    %5 = "slicing-test-op"(%2, %3) : (i3, i4) -> i6
    %6 = "slicing-test-op"(%0, %4) : (i1, i5) -> i7
    %7 = "slicing-test-op"(%4, %5) : (i5, i6) -> i8
    %8 = "slicing-test-op"(%6, %7) : (i7, i8) -> i9
    return
  }
}

// -----
#map = affine_map<(d0) -> (d0)>
module {
  func.func @slicing_test_2() {
    %c0 = arith.constant 0 : index
    %c2 = arith.constant 2 : index
    %c16 = arith.constant 16 : index
    affine.for %arg0 = %c0 to %c16 {
      affine.for %arg1 = #map(%arg0) to 10 {
        %0 = "slicing-test-op"(%arg1) : (index) -> index
        %1 = "slicing-test-op"(%arg0) : (index) -> index
      }
    }
    return
  }
}

// -----
module {
  func.func @slicing_test_3() {
    %cst = arith.constant 1.000000e+00 : f32
    %0 = "slicing-test-op"(%cst) : (f32) -> index
    scf.for %arg0 = %0 to %0 step %0 {
      %1 = "slicing-test-op"(%0, %arg0) : (index, index) -> index
    }
    return
  }
}

// -----
module {
  func.func @slicing_test_function_argument(%arg0: index) -> index {
    %0 = "slicing-test-op"(%arg0, %arg0) : (index, index) -> index
    return %0 : index
  }
}

// -----
module {
  func.func @slicing_test_multiple_return(%arg0: index) -> (index, index) {
    %0:2 = "slicing-test-op"(%arg0, %arg0) : (index, index) -> (index, index)
    return %0#0, %0#1 : index, index
  }
}

// -----
module {
  func.func @graph_region_with_cycle() {
    test.isolated_graph_region {
      %0 = "slicing-test-op"(%1) : (i1) -> i1
      %1 = "slicing-test-op"(%0) : (i1) -> i1
    }
    return
  }
}

