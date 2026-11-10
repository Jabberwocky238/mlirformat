module {
}

// -----
module {
  %token, %bodyResults = async.execute -> !async.value<f32> {
    %cst = arith.constant 1.234560e+02 : f32
    async.yield %cst : f32
  }
  %0 = async.await %bodyResults : !async.value<f32>
  vector.print %0 : f32
}

// -----
module {
}

// -----
module {
  %token, %bodyResults = async.execute -> !async.value<f32> {
    %token_0, %bodyResults_1 = async.execute -> !async.value<f32> {
      %cst = arith.constant 4.567890e+02 : f32
      async.yield %cst : f32
    }
    %1 = async.await %bodyResults_1 : !async.value<f32>
    async.yield %1 : f32
  }
  %0 = async.await %bodyResults : !async.value<f32>
  vector.print %0 : f32
}

// -----
module {
}

// -----
module {
}

