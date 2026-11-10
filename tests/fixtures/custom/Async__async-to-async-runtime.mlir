module {
  func.func @execute_no_async_args(%arg0: f32, %arg1: memref<1xf32>) {
    %token = async.execute {
      %c0 = arith.constant 0 : index
      memref.store %arg0, %arg1[%c0] : memref<1xf32>
      async.yield
    }
    async.await %token : !async.token
    return
  }
}

// -----
module {
  func.func @nested_async_execute(%arg0: f32, %arg1: f32, %arg2: memref<1xf32>) {
    %token = async.execute {
      %c0 = arith.constant 0 : index
      %token_0 = async.execute {
        %c1 = arith.constant 1 : index
        memref.store %arg0, %arg2[%c0] : memref<1xf32>
        async.yield
      }
      async.await %token_0 : !async.token
      memref.store %arg1, %arg2[%c0] : memref<1xf32>
      async.yield
    }
    async.await %token : !async.token
    return
  }
}

// -----
module {
  func.func @async_execute_token_dependency(%arg0: f32, %arg1: memref<1xf32>) {
    %token = async.execute {
      %c0 = arith.constant 0 : index
      memref.store %arg0, %arg1[%c0] : memref<1xf32>
      async.yield
    }
    %token_0 = async.execute [%token] {
      %c0 = arith.constant 0 : index
      memref.store %arg0, %arg1[%c0] : memref<1xf32>
      async.yield
    }
    return
  }
}

// -----
module {
  func.func @async_group_await_all(%arg0: f32, %arg1: memref<1xf32>) {
    %c1 = arith.constant 1 : index
    %0 = async.create_group %c1 : !async.group
    %token = async.execute {
      async.yield
    }
    %1 = async.add_to_group %token, %0 : !async.token
    %token_0 = async.execute {
      async.await_all %0
      async.yield
    }
    async.await_all %0
    return
  }
}

// -----
module {
  func.func @execute_and_return_f32() -> f32 {
    %token, %bodyResults = async.execute -> !async.value<f32> {
      %cst = arith.constant 1.230000e+02 : f32
      async.yield %cst : f32
    }
    %0 = async.await %bodyResults : !async.value<f32>
    return %0 : f32
  }
}

// -----
module {
  func.func @async_value_operands() {
    %token, %bodyResults = async.execute -> !async.value<f32> {
      %cst = arith.constant 1.230000e+02 : f32
      async.yield %cst : f32
    }
    %token_0 = async.execute (%bodyResults as %arg0: !async.value<f32>) {
      %0 = arith.addf %arg0, %arg0 : f32
      async.yield
    }
    async.await %token_0 : !async.token
    return
  }
}

// -----
module {
  func.func @execute_assertion(%arg0: i1) {
    %token = async.execute {
      cf.assert %arg0, "error"
      async.yield
    }
    async.await %token : !async.token
    return
  }
}

// -----
module {
  func.func @lower_scf_to_cfg(%arg0: f32, %arg1: memref<1xf32>, %arg2: i1) {
    %token = async.execute {
      async.yield
    }
    %token_0 = async.execute {
      scf.if %arg2 {
        async.await %token : !async.token
      } else {
        async.await %token : !async.token
      }
      async.yield
    }
    return
  }
}

// -----
module {
  func.func @clone_constants(%arg0: f32, %arg1: memref<1xf32>) {
    %c0 = arith.constant 0 : index
    %token = async.execute {
      memref.store %arg0, %arg1[%c0] : memref<1xf32>
      async.yield
    }
    async.await %token : !async.token
    return
  }
}

// -----
module {
  async.func @async_func_await(%arg0: f32, %arg1: !async.value<f32>) -> !async.token {
    %0 = await %arg1 : !async.value<f32>
    return
  }
}

// -----
module {
  async.func @execute_in_async_func(%arg0: f32, %arg1: memref<1xf32>) -> !async.token {
    %token = execute {
      %c0 = arith.constant 0 : index
      memref.store %arg0, %arg1[%c0] : memref<1xf32>
      async.yield
    }
    await %token : !async.token
    return
  }
}

// -----
module {
  async.func @async_func_empty() -> !async.token {
    return
  }
}

