module {
  func.func @structured_cfg() {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c10 = arith.constant 10 : index
    scf.for %arg0 = %c1 to %c10 step %c1 {
      %0 = "use0"(%arg0) : (index) -> i1
      scf.if %0 {
        "use1"(%arg0) : (index) -> ()
      } else {
        "use2"(%arg0) : (index) -> ()
      }
      "use3"(%arg0) : (index) -> ()
    }
    return
  }
}

// -----
module {
  func.func @correct_number_of_regions() {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c10 = arith.constant 10 : index
    scf.for %arg0 = %c1 to %c10 step %c1 {
      "test.two_region_op"() ({
        "work"() : () -> ()
      }, {
        "work"() : () -> ()
      }) : () -> ()
    }
    return
  }
}

