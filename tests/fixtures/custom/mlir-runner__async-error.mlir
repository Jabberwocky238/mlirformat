module {
}

// -----
module {
  %token = async.execute {
    async.yield
  }
  async.runtime.await %token : !async.token
  %0 = async.runtime.is_error %token : !async.token
  vector.print %0 : i1
}

// -----
module {
}

// -----
module {
}

// -----
module {
}

// -----
module {
}

