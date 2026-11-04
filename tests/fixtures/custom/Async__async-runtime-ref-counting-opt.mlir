module {
  func.func private @consume_token(!async.token)
  func.func @cancellable_operations_0(%arg0: !async.token) {
    async.runtime.add_ref %arg0 {count = 1 : i64} : !async.token
    async.runtime.drop_ref %arg0 {count = 1 : i64} : !async.token
    return
  }
  func.func @cancellable_operations_1(%arg0: !async.token) {
    async.runtime.add_ref %arg0 {count = 1 : i64} : !async.token
    call @consume_token(%arg0) : (!async.token) -> ()
    async.runtime.drop_ref %arg0 {count = 1 : i64} : !async.token
    return
  }
  func.func @cancellable_operations_2(%arg0: !async.token) {
    async.runtime.add_ref %arg0 {count = 1 : i64} : !async.token
    async.runtime.await %arg0 : !async.token
    async.runtime.drop_ref %arg0 {count = 1 : i64} : !async.token
    async.runtime.await %arg0 : !async.token
    async.runtime.add_ref %arg0 {count = 1 : i64} : !async.token
    async.runtime.await %arg0 : !async.token
    async.runtime.drop_ref %arg0 {count = 1 : i64} : !async.token
    return
  }
  func.func @cancellable_operations_3(%arg0: !async.token) {
    async.runtime.add_ref %arg0 {count = 1 : i64} : !async.token
    call @consume_token(%arg0) : (!async.token) -> ()
    async.runtime.drop_ref %arg0 {count = 1 : i64} : !async.token
    async.runtime.await %arg0 : !async.token
    return
  }
  func.func @not_cancellable_operations_0(%arg0: !async.token) {
    async.runtime.add_ref %arg0 {count = 1 : i64} : !async.token
    call @consume_token(%arg0) : (!async.token) -> ()
    async.runtime.await %arg0 : !async.token
    async.runtime.drop_ref %arg0 {count = 1 : i64} : !async.token
    return
  }
}

