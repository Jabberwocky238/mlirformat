module {
}

// -----
// -----
// -----
// -----
// -----
// -----
module {
  func.func @valid_all_properties() {
    test.with_properties a = 32, b = "foo", c = "bar", flag = true, array = [1, 2, 3, 4], array32 = [5, 6]
    return
  }
}

