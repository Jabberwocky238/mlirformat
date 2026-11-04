module {
  func.func @main() {
    %c1 = arith.constant 1 : index
    %c5 = arith.constant 5 : index
    %0 = async.create_group %c5 : !async.group
    %token = async.execute {
      async.yield
    }
    %token_0 = async.execute {
      async.yield
    }
    %token_1 = async.execute {
      async.yield
    }
    %token_2 = async.execute {
      async.yield
    }
    %token_3 = async.execute {
      async.yield
    }
    %1 = async.add_to_group %token, %0 : !async.token
    %2 = async.add_to_group %token_0, %0 : !async.token
    %3 = async.add_to_group %token_1, %0 : !async.token
    %4 = async.add_to_group %token_2, %0 : !async.token
    %5 = async.add_to_group %token_3, %0 : !async.token
    %token_4 = async.execute {
      async.await_all %0
      async.yield
    }
    %6 = async.create_group %c1 : !async.group
    %7 = async.add_to_group %token_4, %6 : !async.token
    async.await_all %6
    call @mlirAsyncRuntimePrintCurrentThreadId() : () -> ()
    return
  }
  func.func private @mlirAsyncRuntimePrintCurrentThreadId()
}

