module {
  func.func @linear() {
    "test.foo"() {foo = 1 : ui64, tag = "annotate"} : () -> ()
    "test.foo"() {foo = 2 : ui64, tag = "annotate"} : () -> ()
    "test.foo"() {tag = "annotate"} : () -> ()
    return
  }
  func.func @requires_staged_bar() {
    "test.branch"()[^bb1, ^bb3] {foo = 7 : ui64, tag = "annotate"} : () -> ()
  ^bb1:  // pred: ^bb0
    "test.branch"()[^bb2] {foo = 1 : ui64, tag = "annotate"} : () -> ()
  ^bb2:  // 2 preds: ^bb1, ^bb3
    "test.foo"() {foo = 2 : ui64, tag = "annotate"} : () -> ()
    "test.foo"() {tag = "annotate"} : () -> ()
    return
  ^bb3:  // pred: ^bb0
    "test.branch"()[^bb2] {foo = 2 : ui64, tag = "annotate"} : () -> ()
  }
}

// -----
module {
  func.func private @callee(%arg0: i32) -> i32 attributes {llvm.link_call_count = 10 : i64, sym.link_call_count = 11 : i64} {
    %0:2 = "test.foo"() {foo = 5 : i32} : () -> (i32, i32)
    %1 = "test.foo"() {foo = 7 : i32} : () -> i32
    %2 = "test.hello"(%0#0, %1) : (i32, i32) -> i32
    return %2 : i32
  }
}

