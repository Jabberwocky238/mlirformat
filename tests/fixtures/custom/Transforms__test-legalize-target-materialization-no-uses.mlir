module {
  func.func @foo() {
    %0 = "test.type_producer"() : () -> i32
    %1 = "test.type_changer"(%0) : (i32) -> i16
    %2 = "test.type_changer"(%1) : (i16) -> i64
    "test.type_consumer"(%2) : (i64) -> ()
    return
  }
}

// -----
module {
  func.func @direct_forward(%arg0: i16) -> i16 {
    %0 = "test.type_changer"(%arg0) : (i16) -> i16
    return %0 : i16
  }
}

