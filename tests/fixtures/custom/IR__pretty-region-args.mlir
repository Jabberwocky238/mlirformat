module {
  func.func @custom_region_names() {
    test.polyfor %i, %j, %k {
      "foo"() : () -> ()
    }
    return
  }
  func.func @weird_names() {
    test.polyfor %a_.5Ex, %_0, %arg0 {
      %0 = "foo"() : () -> i32
    }
    return
  }
}

