module {
  func.func @op_with_passthrough_region_args() {
    %c10 = arith.constant 10 : index
    "test.one_region_op"() ({
      "test.consumer"(%c10) : (index) -> ()
    }) : () -> ()
    test.isolated_region %c10 {
      "test.consumer"(%c10) : (index) -> ()
    }
    %0:2 = "test.op"() : () -> (index, index)
    test.isolated_region %0#1 {
      "test.consumer"(%0#1) : (index) -> ()
    }
    test.isolated_regions {
      "test.unknown_op"() : () -> ()
    }, {
      "test.unknown_op"() : () -> ()
    }
    "test.one_region_op"() ({
      "test.unknown_op"() : () -> ()
    }) : () -> ()
    "test.two_region_op"() ({
      "test.unknown_op"() : () -> ()
    }, {
      "test.consumer"(%c10) : (index) -> ()
    }) : () -> ()
    return
  }
}

