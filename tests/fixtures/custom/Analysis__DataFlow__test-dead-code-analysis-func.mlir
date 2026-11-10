module {
  func.func @foo(%arg0: i32) -> i32 attributes {tag = "foo"} {
    return {a} %arg0 : i32
  }
}

