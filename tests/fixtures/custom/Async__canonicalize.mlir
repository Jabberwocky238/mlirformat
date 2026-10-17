module {
  func.func @empty_execute() {
    %token = async.execute {
      async.yield
    }
    return
  }
}

