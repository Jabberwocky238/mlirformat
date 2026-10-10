module {
  func.func private @foo()
}

// -----
module {
  func.func private @bar()
  func.func private @baz()
}

// -----
module {
}

