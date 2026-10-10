module {
  func.func @main(%arg0: f32) -> f32 {
    %0 = "foo"() {interrupt_before_all = true} : () -> f32
    %1 = arith.addf %0, %arg0 : f32
    return %1 : f32
  }
}

// -----
module {
  func.func @main(%arg0: f32) -> f32 {
    %0 = "foo"() ({
      "bar"() : () -> ()
    }) {interrupt_after_all = true} : () -> f32
    %1 = arith.addf %0, %arg0 : f32
    return %1 : f32
  }
}

// -----
module {
  func.func @main(%arg0: f32) -> f32 {
    %0 = "foo"() ({
      "bar0"() : () -> ()
    }, {
      "bar1"() : () -> ()
    }) {interrupt_after_region = 0 : i64} : () -> f32
    %1 = arith.addf %0, %arg0 : f32
    return %1 : f32
  }
}

// -----
module {
  func.func @main() {
    "foo"() : () -> ()
    "test.two_region_op"() ({
      "work"() : () -> ()
    }, {
      "work"() : () -> ()
    }) {interrupt_after_all = true} : () -> ()
    return
  }
}

// -----
module {
  func.func @main() {
    "foo"() : () -> ()
    "test.two_region_op"() ({
      "work"() : () -> ()
    }, {
      "work"() : () -> ()
    }) {interrupt_after_region = 0 : i64} : () -> ()
    return
  }
}

// -----
module {
  func.func @main(%arg0: f32) -> f32 {
    %0 = "foo"() ({
      "bar0"() : () -> ()
    }, {
      "bar1"() : () -> ()
    }) {skip_before_all = true} : () -> f32
    %1 = arith.addf %0, %arg0 : f32
    return %1 : f32
  }
}

// -----
module {
  func.func @main(%arg0: f32) -> f32 {
    %0 = "foo"() ({
      "bar0"() : () -> ()
    }, {
      "bar1"() : () -> ()
    }) {skip_after_all = true} : () -> f32
    %1 = arith.addf %0, %arg0 : f32
    return %1 : f32
  }
}

// -----
module {
  func.func @main(%arg0: f32) -> f32 {
    %0 = "foo"() ({
      "bar0"() : () -> ()
    }, {
      "bar1"() : () -> ()
    }) {skip_after_region = 0 : i64} : () -> f32
    %1 = arith.addf %0, %arg0 : f32
    return %1 : f32
  }
}

