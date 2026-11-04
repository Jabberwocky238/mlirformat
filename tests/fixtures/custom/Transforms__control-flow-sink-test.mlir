module {
  func.func @test_sink() {
    %0 = "test.sink_me"() : () -> i32
    "test.sink_target"() ({
      "test.use"(%0) : (i32) -> ()
    }) : () -> ()
    return
  }
  func.func @test_sink_first_region_only() {
    %0 = "test.sink_me"() {first} : () -> i32
    %1 = "test.sink_me"() {second} : () -> i32
    "test.sink_target"() ({
      "test.use"(%0) : (i32) -> ()
    }, {
      "test.use"(%1) : (i32) -> ()
    }) : () -> ()
    return
  }
  func.func @test_sink_targeted_op_only() {
    %0 = "test.sink_me"() : () -> i32
    %1 = "test.dont_sink_me"() : () -> i32
    "test.sink_target"() ({
      "test.use"(%0, %1) : (i32, i32) -> ()
    }) : () -> ()
    return
  }
}

